<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelOrgan.aspx.cs" Inherits="M_Main.DialogNew.SelOrgan" %>

<!DOCTYPE html>
<html>
<head>
    <title>项目选择</title>
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
        <input id="isCheck" name="isCheck" type="hidden" runat="server" />
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
                            {
                                field: 'text', title: '项目列表', align: 'left', sortable: true, formatter: function (value, row, index) {
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
                if ($("#isCheck").val() != '') {
                    toolbar = [
                        {
                            text: '确定',
                            iconCls: 'icon-ok',
                            handler: function () {
                                HDialog.ReturnIsJson = true;
                                var rows = $("#TableContainer").treegrid('getChecked');
                                var result = new Object();
                                result["id"] = "";
                                result["name"] = "";
                                if (rows != '') {
                                    $.each(rows, function (index, item) {
                                        result["id"] = result["id"] + item.attributes.InPopedom + ",";
                                        result["name"] = result["name"] + item.text + ",";
                                    });
                                    result["id"] = result["id"].substring(0, result["id"].length - 1);
                                    result["name"] = result["name"].substring(0, result["name"].length - 1);
                                }
                                
                                HDialog.Close(result);
                            }
                        },
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
                    column = [[
                        { field: '', checkbox: true },
                            {
                                field: 'text', title: '项目列表', align: 'left', sortable: true, formatter: function (value, row, index) {
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
                    $("#TableContainer").treegrid({
                        url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Organ&Command=GetOrganTreeGridList&' + $('#frmForm').serialize(),
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
                        onLoadSuccess: function (data) {
                            $("#SearchDlg").dialog("close");
                        }
                    });
                }
                else {
                    $("#TableContainer").treegrid({
                        url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Organ&Command=GetOrganTreeGridList&' + $('#frmForm').serialize(),
                        treeField: 'text',
                        idField: 'id',
                        method: "get",
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: column,
                        fitColumns: true,
                        singleSelect: true,
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
                        onClickRow: function (node) {
                            if (parseInt(node.attributes.InPopedom) <= 0) {
                                HDialog.ReturnIsJson = true;
                                HDialog.Close(node);
                            }
                        },
                        onLoadSuccess: function (data) {
                            $("#SearchDlg").dialog("close");
                        }
                    });
                }

            }
            LoadList();

        </script>
    </form>
</body>
</html>