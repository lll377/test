<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelCommRole.aspx.cs" Inherits="M_Main.DialogNew.SelCommRole" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .SearchTable
        {
            width: 100%;padding: 10px;height:auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
    <div class="SearchContainer" id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" style="width: 400px; height: 140px; padding: 10px;overflow:hidden;" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle" colspan="4">
                    岗位名称
                </td>
                <td class="TdContent" colspan="4">
                    <input type="text" class="easyui-validatebox" id="RoleName" name="RoleName" />
                </td>
            </tr>
            <tr>
                <td colspan="8" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();
        var column = [[
            {
                field: 'RoleName', title: '岗位名称', width: 225, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = row.RoleName;
                    return str;
                }
            }
        ]];

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=GetCommRoleList&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                rownumbers: true,
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                },
                onClickRow: function (rowIndex, rowData) {
                    var ReturnValue = rowData.RoleCode + ',' + rowData.RoleName;
                    HDialog.Close(ReturnValue);
                }
            });
        }
        LoadList();
    </script>
    </form>
</body>
</html>