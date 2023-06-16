<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseKeeperList.aspx.cs" Inherits="M_Main.HouseNew.HouseKeeperList" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>管家评价汇总</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 170px;">
            <table style="width: 100%; padding-top: 5px">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContent">
                        <input type="text" data-options="editable:false" id="CommName" onclick="SelCommInfo();" style="width: 95%;" name="CommName" runat="server"/>
                        <input id="CommID" type="hidden" name="CommID" runat="server"/>
                    </td>
                    <td class="TdTitle">管家名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="KeeperName" name="KeeperName" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">评价分数</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="EvaluationScoreBg" name="EvaluationScoreBg" style="width: 95%; border: 1px solid #cccccc;" onkeyup="javascript:CheckInputIntFloat(this);" onchange="javascript:CheckInputIntFloat(this);" onblur="javascript:CheckInputIntFloat(this);" />
                    </td>
                    <td class="TdTitle">-</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="EvaluationScoreEnd" name="EvaluationScoreEnd" style="width: 95%; border: 1px solid #cccccc;" onkeyup="javascript:CheckInputIntFloat(this);" onchange="javascript:CheckInputIntFloat(this);" onblur="javascript:CheckInputIntFloat(this);" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">评价日期</td>
                    <td class="TdContent">
                        <input id="EvaluationDateBg" name="EvaluationDateBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                    <td class="TdTitle">-</td>
                    <td class="TdContent">
                        <input id="EvaluationDateEnd" name="EvaluationDateEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" style="width: 95%; border: 1px solid #cccccc;" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%;" id="TableContainer">
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function CheckInputIntFloat(oInput) {
                if ('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/, '')) {
                    oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '' : oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
                }
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h);
            }
            InitTableHeight();

            //选择项目
            function SelCommInfo() {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1&isCommID=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            var column = [[
                { field: 'CommId', title: 'CommId', width: 200, align: 'left', sortable: false, hidden: true },
                { field: 'KeeperCode', title: 'KeeperCode', width: 200, align: 'left', sortable: false, hidden: true },
                { field: 'CommName', title: '项目名称', width: 200, align: 'left', sortable: false },
                { field: 'KeeperName', title: '管家名称', width: 200, align: 'left', sortable: false },
                { field: 'RoomCount', title: '管辖户数', width: 200, align: 'left', sortable: false },
                {
                    field: 'Score', title: '综合得分', width: 200, align: 'left', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (parseFloat(row.Score) <= 3)
                            str = "<span style='color:red'>" + row.Score + "</span>";
                        else
                            str = "<span style='color:green'>" + row.Score + "</span>";
                        return str;
                    }
                },
                { field: 'EvaluationCount', title: '评价户数', width: 200, align: 'left', sortable: false }
            ]];

            //导出
            function ExcelPrint() {
                var url = '../HouseNew/HouseKeeperExcel.aspx?ExcelName=管家评价汇总' + '&random=' + Math.random() + GetParamet();
                window.open(url);
            }

            function GetParamet() {
                var str = "&CommID=" + $("#CommID").val();
                str += "&KeeperName=" + $("#KeeperName").val();
                str += "&EvaluationScoreBg=" + $("#EvaluationScoreBg").val();
                str += "&EvaluationScoreEnd=" + $("#EvaluationScoreEnd").val();
                str += "&EvaluationDateBg=" + $("#EvaluationDateBg").val();
                str += "&EvaluationDateEnd=" + $("#EvaluationDateEnd").val();
                return encodeURI(str);
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, "-",
                {
                    text: 'Excel导出',
                    iconCls: 'icon-save',
                    handler: function () {
                        ExcelPrint();
                    }
                },
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("HouseKeeper", "HouseKeeperList", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
