<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelMaterialType.aspx.cs" Inherits="M_Main.DialogNew.SelMaterialType" %>

<!DOCTYPE html>

<html>
<head>
    <title>物资类别选择</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 120px; 
            height: 80px; 
        }
        .SearchTable
        {
            width: 120px; 
            height:auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <div id="TableContainer">
    </div>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                        {
                            field: 'text', title: '类别名称', align: 'left', sortable: true, formatter: function (value, row, index)
                            {
                                var str = row.text;
                                return str;
                            }
                        }
        ]];

        var IsCollapseAll = false;
        var toolbar = [
            {
                text: '展开/折叠',
                iconCls: 'icon-redo',
                handler: function () {
                    if (IsCollapseAll == true) {
                        $('#TableContainer').treegrid('expandAll');
                        IsCollapseAll = false;
                    }
                    else {
                        $('#TableContainer').treegrid('collapseAll');
                        IsCollapseAll = true;
                    }
                }
            }, '-',
            {
                text: '确认选择',
                iconCls: 'icon-save',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getSelections");
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(rows);
                }
            }
        ];
        function LoadList() {
            $("#TableContainer").treegrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=SelMaterialType&' + $('#frmForm').serialize(),
                treeField: 'text',
                idField: 'id',
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                singleSelect: false,
                remoteSort: false,
                pagination: false,
                rownumbers: true,
                IsCustomHead: false,
                cascadeCheck: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                cascadeCheck: true,
                onClickRow: function (node)
                {

                    if (node.attributes.IsRight == "1")
                    {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(node);
                    }

                },
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                }
            });
        }
        LoadList();

    </script>
    </form>
</body>
</html>
