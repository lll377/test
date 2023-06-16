<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpCostStandardBrowse.aspx.cs" Inherits="M_Main.ChargesNew.CorpCostStandard" %>

<!DOCTYPE html>
<html>
<head>
    <title>费用科目设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 600px;
            height: 150px;
        }

        .SearchTable {
            width: 600px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="CostCode" name="CostCode" runat="server" />
        <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
        <div id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">费用类型
                    </td>
                    <td class="TdContent">
                        <select id="SysCostSign" name="SysCostSign" runat="server" style="width: 70%">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">费用项目
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="CostName" name="CostName" class="easyui-searchbox" searcher="SelCostName" style="width: 70%"/>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标准编号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="StanSign" name="StanSign" style="width: 70%"/>
                    </td>
                    <td class="TdTitle">标准名称
                    </td>
                    <td class="TdContent">
                        <input type="text" id="StanName" name="StanName" style="width: 70%"/>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">已发小区
                    </td>
                    <td class="TdContentSearch"  colspan="3">
                        <input type="text" id="CommName" name="CommName" class="easyui-searchbox" searcher="SelComm"  style="width: 90%"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();


            function SelComm() {

                var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var Obj = JSON.parse(_Data);
                    $("#CommName").searchbox("setValue", Obj.name);
                });
            }

            var frozenColumns = [[
               
                { field: 'CostName', title: '费用名称', width: 160, align: 'left', sortable: true },
                { field: 'StanSign', title: '标准编号', width: 100, align: 'left', sortable: true },
                {
                    field: 'StanName', title: '标准名称', width: 160, align: 'left', sortable: true, formatter: function (value, row, index) {
                         var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.CorpStanID + "','edit');\">" + row.StanName + "</a>";
                         return str;
                     }
                 },
            ]]
            var column;
            column = [[
                            { field: 'StanFormulaName', title: '计算方式', width: 180, align: 'left', sortable: true },
                            { field: 'StanAmount', title: '通用收费标准', width: 120, align: 'left', sortable: true },
                            { field: 'StanExplain', title: '标准说明', width: 150, align: 'left', sortable: true },
                            { field: 'StanEndHit', title: '标准状态', width: 100, align: 'left', sortable: true },
                            { field: 'DelinRates', title: '违约金比例', width: 100, align: 'left', sortable: true },
                            { field: 'IsLockName', title: '是否审核', width: 100, align: 'left', sortable: true },
                            { field: 'CorpCostComms', title: '已发放小区', width: 500, align: 'left', sortable: true },
            ]];
            var toolbar = [
                {
                    id:'add',
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#CorpCostID").val() == "") {
                            HDialog.Info("请在左侧选择费用项目");
                            return;
                        }
                        Detail('', 'insert');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-', {
                    text: '导出收费科目设置',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.open("CorpCostStandardBrowseExcelOutPut.aspx?random=" + Math.random() + $('#frmForm').serialize());
                    }
                }, '-',
                {
                    text: '<font color=red>&nbsp;&nbsp;&nbsp;&nbsp; *1、鼠标右击左侧收费科目进行增删改操作。2、已审核标准不能修改。</font>'
                }

            ];

            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该收费标准', function (r) {
                    if (r) {
                        $.tool.DataGet('CostStan', 'Del', 'CorpStanID=' + row.CorpStanID,
                        function Init() {
                        },
                        function callback(_Data) {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            if (_Data.substring(0, 5) == "false") {
                                HDialog.Info(_Data.substring(6));
                            }
                            else {
                                LoadList();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                    }
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostStan&Command=List&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                        if (getUrlParam("IsParent")=="1") {
                            $("#add").linkbutton('disable');
                        }
                    }
                });
            }
            LoadList();

            function Detail(CorpStanID, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../ChargesNew/CorpCostStandardManage.aspx?CorpCostID=' + $("#CorpCostID").val() + '&CorpStanID=' + CorpStanID + '&OpType=' + OpType, '标准详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function SelCostName() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelCorpCostItem.aspx', '费用项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#CostName").searchbox("setValue", Obj.text);
                    }
                });
            }
            $("#CostName").click(function () {

            });

            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
