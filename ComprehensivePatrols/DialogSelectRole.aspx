<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DialogSelectRole.aspx.cs" Inherits="M_Main.ComprehensivePatrols.DialogSelectRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>公用选择岗位</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
</head>
<body>
    <div id="tt" class="easyui-panel" style="padding: 5px; background: #ffffff">
        岗位名称:
        <input id="RoleName" name="RoleName" class="easyui-textbox" data-options="
                        icons:[{iconCls:'icon-clear',
                        handler: function(e){
                            $(e.data.target).textbox('clear');
                        }}]" />
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:60" onclick="LoadList();">筛选</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:60" onclick="Save();">保存</a>
    </div>
    <table id="tg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">
        function PageInfo() {

        }
        $(function () {
            InitTableHeight();
            LoadList();
            PageInfo();

        });
        function InitTableHeight() {
            var h = $(window).height();
            $("#tg").css("height", h + "px");
        }
        function Save() {
            var list = $("#tg").datagrid("getChecked");
            var id = "", text = "";
            if (list && list.length > 0) {
                for (var i = 0; i < list.length; i++) {
                    id += list[i].RoleCode + ",";
                    text += list[i].RoleName + ",";
                }
                id = id.substr(0, id.length - 1);
                text = text.substr(0, text.length - 1);
            }
            var str = id + "_" + text;
            HDialog.Close(str);
        }

        var column = [[
                { field: 'ck', checkbox: true },
                {
                    field: 'RoleName', title: '岗位名称', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                },
        ]];

        function LoadList() {
            $("#tg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                idField: "RoleCode",
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: true,
                singleSelect: false,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#tt",
                sortOrder: "desc",
                remoteSort: false,
                onClickRow: function (rowIndex, rowData) {
                    // var obj = "|" + rowData.RoleCode + "," + rowData.RoleName;
                    //// HDialog.Close(obj);
                },
                onCheck: function (rowIndex, rowData) {
                    //var obj = rowData.RoleCode + "," + rowData.RoleName;
                    //document.getElementById("SysRoleCode").value = document.getElementById("SysRoleCode").value + "|" + obj;
                },
                onUncheck: function (rowIndex, rowData) {
                    //var ss = document.getElementById("SysRoleCode").value.split('|');
                    //for (var i = 0; i < ss.length; i++) {
                    //    if (ss[i].indexOf(rowData.RoleCode) >= 0) {
                    //        ss.splice(i, 1);
                    //    }
                    //}
                    //valu = "";
                    //for (var i = 0; i < ss.length; i++) {
                    //    valu += "|" + ss[i];
                    //}
                    //document.getElementById("SysRoleCode").value = valu.substr(1, valu.length);
                },
                onCheckAll: function (rows) {
                    //document.getElementById("SysRoleCode").value = "";
                    //for (var i = 0; i < rows.length; i++) {
                    //    var obj = rows[i].RoleCode + "," + rows[i].RoleName;
                    //    document.getElementById("SysRoleCode").value = document.getElementById("SysRoleCode").value + "|" + obj;
                    //}
                },
                onUncheckAll: function (rows) {
                    //document.getElementById("SysRoleCode").value = "";
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CpComPatrols", "GetCommRoleList", "tg", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
        }
    </script>
</body>
</html>
