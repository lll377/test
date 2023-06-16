<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ElectronicInvoiceSettingLeft.aspx.cs" Inherits="M_Main.ChargesNew.ElectronicInvoiceSettingLeft" %>

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
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 120px;
            height: 80px;
        }
        .SearchTable {
            width: 120px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer">
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
                //{ field: 'id', title: '选择', align: 'left', width: 20, checkbox: true },
                {
                    field: 'text', title: '项目列表', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\">" + row.text + "</a>";
                        return str;
                    }
                },
                {
                    field: 'InPopedom', title: '小区ID', align: 'left', formatter: function (value, row, index) {
                        var str = row.attributes.InPopedom;
                        if (str == 0) str = '';
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
                }
            ];

            function LoadList() {
                $("#TableContainer").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Organ&Command=GetOrganTreeGridList&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    IsCustomHead: false,
                    cascadeCheck: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    cascadeCheck: true,
                    //onCheck: function (node, checked) {
                    //    var childNode = $("#TableContainer").treegrid('getChildren', node.id);
                    //    if (childNode.length > 0) {
                    //        for (var i = 0; i < childNode.length; i++) {
                    //            $("input[value='" + childNode[i].id + "']").prop("checked", true);
                    //            $("#TableContainer").treegrid("select", childNode[i].id);
                    //        }
                    //    }
                    //},
                    //onUncheck: function (node, checked) {
                    //    var childNode = $("#TableContainer").treegrid('getChildren', node.id);
                    //    if (childNode.length > 0) {
                    //        for (var i = 0; i < childNode.length; i++) {
                    //            $("input[value='" + childNode[i].id + "']").prop("checked", false);
                    //            $("#TableContainer").treegrid("unselect", childNode[i].id);
                    //        }
                    //    }
                    //},
                    onClickRow: function (node) {
                        parent.$("#ElectronicInvoiceSettingRight").attr("src", "ElectronicInvoiceSettingRight.aspx?CommID=" + node.attributes.InPopedom
                            + "&OrganCode='" + node.attributes.PrentOrganCode + "'");
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
