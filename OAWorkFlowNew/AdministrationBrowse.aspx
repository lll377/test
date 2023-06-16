<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrationBrowse.aspx.cs" Inherits="M_Main.OAWorkFlowNew.AdministrationBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 500px;
            height: 60px;
        }

        .SearchTable {
            width: 500px;
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
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">级别名称
                    </td>
                    <td class="TdContent">
                        <asp:DropDownList ID="OprLevelList" runat="server"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">级别用户
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" />
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
            var column;
            column = [[
                { field: 'DepName', title: '部门名称', align: 'left', width: 50, sortable: true },
                { field: 'DictionaryName', title: '级别名称', align: 'left', width: 50, sortable: true },
                { field: 'UserName', title: '人员名称', align: 'left', width: 50, sortable: true }
            ]];
            var toolbar = [
                {
                    text: '人员设置',
                    iconCls: 'icon-add',
                    handler: function () {
                        BatchImport();
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
                }
            ];

            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Administration', 'Delete', 'InfoId=' + row.InfoId,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                var loadTip = "";
                if ($('#DepCode').val() != "") {
                    loadTip = '数据加载中,请稍候...';
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Administration&Command=Search&DepCode=' + $('#DepCode').val() + '&OprLevelList=' + $('#OprLevelList').val() + '&UserName=' + $('#UserName').val(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    loadMsg: loadTip,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    //onBeforeLoad: function (param) {
                    //    param = $.JQForm.GetParam("Administration", "Search", "TableContainer", param);
                    //},
                    onLoadSuccess: function (data) {
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function BatchImport() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '600', '../OAWorkFlowNew/AdministrationMultiple.aspx', '级别人员设置', true, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
