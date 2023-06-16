<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelOrgan.aspx.cs" Inherits="M_Main.Supervision.SelOrgan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择模板列表</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="background-color: #cccccc;" id="TableContainer"></div>
        <input type="hidden" id="IsCheck" name="IsCheck" />
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TableContainer").css("width", w + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'OrganName', title: '所属单位', width: 300, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定',
                    iconCls: 'icon-save',
                    handler: function () {
                        Save();
                    }
                }
            ];

            function Save() {
                if ($("#IsCheck").val() == '1') {
                    var OrganCode = "";
                    var OrganName = "";
                    var row = '';
                    row = $("#TableContainer").datagrid("getChecked");
                    if (row.length > 0) {
                        for (var i = 0; i < row.length; i++) {
                            OrganCode += "," + row[i].OrganCode;
                            OrganName += "," + row[i].OrganName;
                        }
                        if (OrganCode.length > 0)
                            OrganCode = OrganCode.substr(1, OrganCode.length - 1);
                        if (OrganName.length > 0)
                            OrganName = OrganName.substr(1, OrganName.length - 1);
                    }
                    HDialog.Close(OrganCode + "◆" + OrganName);
                } else {
                    var row = '';
                    row = $("#TableContainer").datagrid("getSelected");
                    HDialog.Close(row.OrganCode + "◆" + row.OrganName);
                }
            }

            function LoadList() {
                var col = [[{ field: 'OrganName', title: '所属单位', width: 200, align: 'left', sortable: true }]];
                var singleSelect = true;
                if ($("#IsCheck").val() == '1') {
                    col = column;
                    singleSelect = false;
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=SelOrgan&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: col,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: singleSelect,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0
                });
            }

            $(function () {
                $("#IsCheck").val(GetQueryString('IsCheck'));
                InitTableHeight();
                LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
