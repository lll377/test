<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpEnergyInfo.aspx.cs" Inherits="M_Main.CorpCostStatistNew.CorpEnergyInfo" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
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

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table style="width: 100%;" class="DialogTable">


                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch" colspan="5">
                        <input class="easyui-searchbox" id="CommNames" searcher="SelCommInfo" style="width: 90%;" data-options="editable:false"
                            name="CommNames" runat="server" /><input id="hiCommNames" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiCommNames" runat="server"><input id="CommIDs" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="CommIDs" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">表计类型</td>
                    <td class="TdContent">
                        <asp:DropDownList ID="MeterType" runat="server"></asp:DropDownList></td>
                    <td class="TdTitle">统计范围</td>
                    <td class="TdContent">
                        <select id="StatRange" name="StatRange" runat="server">
                            <option selected></option>
                            <option value="1">房间表</option>
                            <option value="2">公区表</option>
                        </select></td>
                    <td class="TdTitle">计量表类型</td>
                    <td class="TdContent">
                         <select name="MeterTabClass" id="MeterTabClass" data-options="required:true">
	                        <option selected="selected" value=""></option>
	                        <option value="商业">商业</option>
	                        <option value="外协">外协</option>
	                        <option value="住宅">住宅</option>
	                        <option value="其他">其他</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">统计时间</td>
                    <td class="TdContentSearch" colspan="5">
                        <input id="ChargeBeginDate"
                            onclick="WdatePicker()" class="Wdate" style="width: 45%;" name="ChargeBeginDate" runat="server">到<input id="ChargeEndDate"
                                onclick="WdatePicker()" class="Wdate" style="width: 45%;" name="ChargeEndDate" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="5" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">统计</a>
                    </td>

                </tr>

            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


            function SelCommInfo() {

                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=0', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").searchbox("setText", arrRet.name);
                });
            }




            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");


            }
            InitTableHeight();


            var toolbar = [

                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '折线图',
                    iconCls: 'icon-large-chart',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            var w = $(window).width();
                            var h = $(window).height();
                            HDialog.Open(w, h, '../CorpCostStatistNew/CorpEnergyInfoLine.aspx', "折线图", false, function callback(_Data) {

                            });
                        }
                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('应收统计报表Excel', $('#TableContainer'));
                        }
                    }
                }
            ];

            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable2(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }

            var Headcolumn = [[
                { field: 'OrganName', title: '区域', width: 150, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'StatItem', title: '年份', width: 150, align: 'left', sortable: true },
                { field: 'Item1', title: '1月', width: 150, align: 'left', sortable: true },
                { field: 'Item2', title: '2月', width: 150, align: 'left', sortable: true },
                { field: 'Item3', title: '3月', width: 150, align: 'left', sortable: true },
                { field: 'Item4', title: '4月', width: 150, align: 'left', sortable: true },
                { field: 'Item5', title: '5月', width: 150, align: 'left', sortable: true },
                { field: 'Item6', title: '6月', width: 150, align: 'left', sortable: true },
                { field: 'Item7', title: '7月', width: 150, align: 'left', sortable: true },
                { field: 'Item8', title: '8月', width: 150, align: 'left', sortable: true },
                { field: 'Item9', title: '9月', width: 150, align: 'left', sortable: true },
                { field: 'Item10', title: '10月', width: 150, align: 'left', sortable: true },
                { field: 'Item11', title: '11月', width: 150, align: 'left', sortable: true },
                { field: 'Item12', title: '12月', width: 150, align: 'left', sortable: true }
            ]];

            var ExcelCol = [
                { field: 'OrganName', title: '区域', width: 150, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'StatItem', title: '年份', width: 150, align: 'left', sortable: true },
                { field: 'Item1', title: '1月', width: 150, align: 'left', sortable: true },
                { field: 'Item2', title: '2月', width: 150, align: 'left', sortable: true },
                { field: 'Item3', title: '3月', width: 150, align: 'left', sortable: true },
                { field: 'Item4', title: '4月', width: 150, align: 'left', sortable: true },
                { field: 'Item5', title: '5月', width: 150, align: 'left', sortable: true },
                { field: 'Item6', title: '6月', width: 150, align: 'left', sortable: true },
                { field: 'Item7', title: '7月', width: 150, align: 'left', sortable: true },
                { field: 'Item8', title: '8月', width: 150, align: 'left', sortable: true },
                { field: 'Item9', title: '9月', width: 150, align: 'left', sortable: true },
                { field: 'Item10', title: '10月', width: 150, align: 'left', sortable: true },
                { field: 'Item11', title: '11月', width: 150, align: 'left', sortable: true },
                { field: 'Item12', title: '12月', width: 150, align: 'left', sortable: true }

            ];

            var Columns = [[
                { field: 'OrganName', title: '区域', width: 150, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'StatItem', title: '年份', width: 150, align: 'left', sortable: true },
                { field: 'Item1', title: '1月', width: 150, align: 'left', sortable: true },
                { field: 'Item2', title: '2月', width: 150, align: 'left', sortable: true },
                { field: 'Item3', title: '3月', width: 150, align: 'left', sortable: true },
                { field: 'Item4', title: '4月', width: 150, align: 'left', sortable: true },
                { field: 'Item5', title: '5月', width: 150, align: 'left', sortable: true },
                { field: 'Item6', title: '6月', width: 150, align: 'left', sortable: true },
                { field: 'Item7', title: '7月', width: 150, align: 'left', sortable: true },
                { field: 'Item8', title: '8月', width: 150, align: 'left', sortable: true },
                { field: 'Item9', title: '9月', width: 150, align: 'left', sortable: true },
                { field: 'Item10', title: '10月', width: 150, align: 'left', sortable: true },
                { field: 'Item11', title: '11月', width: 150, align: 'left', sortable: true },
                { field: 'Item12', title: '12月', width: 150, align: 'left', sortable: true }
            ]];




            function LoadData() {
                $('#hiIsSQLData').val('1');
                $('#SearchDlg').dialog('close');



                LoadList();


            }

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Columns,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesStatic", "MultiCorpEnergyInfo", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            $('#hiIsSQLData').val('-1');

            LoadList();


        </script>
    </form>
</body>
</html>
