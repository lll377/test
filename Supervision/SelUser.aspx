<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelUser.aspx.cs" Inherits="M_Main.Supervision.SelUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择用户</title>
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
    <script src="../jscript/uuid.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 510px; height: 180px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">人员姓名:</td>
                    <td class="text">
                        <input type="text" id="UserName" name="UserName" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title">登录账号:</td>
                    <td class="text">
                        <input type="text" id="LoginCode" name="LoginCode" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">所属岗位:</td>
                    <td class="text">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title">通用岗位:</td>
                    <td class="text">
                        <input type="text" id="SysRoleName" name="SysRoleName" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="background-color: #cccccc;" id="TableContainer"></div>
        <input type="hidden" id="IsCheck" name="IsCheck" />
        <input type="hidden" id="CloseParent" name="CloseParent" />
        <input type="hidden" id="SelUserCode" name="SelUserCode" />
        <input type="hidden" id="SelUserName" name="SelUserName" />
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="CheckTypeId" name="CheckTypeId" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            function Save() {
                var str = '';
                if ($("#IsCheck").val() == '1') {
                    str = $("#SelUserCode").val() + "|" + $("#SelUserName").val() + '|User';
                } else {
                    var row = $("#TableContainer").datagrid("getSelected");
                    str = row.UserCode + "|" + row.UserName + '|User';
                }
                if ($('#CloseParent').val() == '1') {
                    window.parent.HDialog.Close(str);
                } else {
                    HDialog.Close(str);
                }
            }

            var column1 = [[
                { field: 'ck', checkbox: true },
                { field: 'DepName', title: '组织机构', width: 300, align: 'left', sortable: true },
                { field: 'UserName', title: '人名员称', width: 80, align: 'left', sortable: true },
                { field: 'LoginCode', title: '登录账号', width: 80, align: 'left', sortable: true },
                { field: 'UserRoleNames', title: '岗位名称', width: 120, align: 'left', sortable: true },
                { field: 'UserSysRoleNames', title: '通用岗位', width: 80, align: 'left', sortable: true }
            ]];

            var column2 = [[
                { field: 'DepName', title: '组织机构', width: 300, align: 'left', sortable: true },
                { field: 'UserName', title: '人名员称', width: 80, align: 'left', sortable: true },
                { field: 'LoginCode', title: '登录账号', width: 80, align: 'left', sortable: true },
                { field: 'UserRoleNames', title: '岗位名称', width: 120, align: 'left', sortable: true },
                { field: 'UserSysRoleNames', title: '通用岗位', width: 80, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定',
                    iconCls: 'icon-save',
                    handler: function () {
                        Save();
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {
                var column = [];
                if ($("#IsCheck").val() == '1') {
                    column = column1;
                } else {
                    column = column2;
                }

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    idField: "UserCode",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "desc",
                    remoteSort: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CSSupervision", "SelUser", "TableContainer", param);
                    },
                    onLoadSuccess: function (node) {
                        for (var i = 0; i < node.total; i++) {
                            var arr = $("#SelUserCode").val().split(',');
                            var index = arr.indexOf(node.rows[i].UserCode);
                            if (index >= 0) {
                                var arrnew = $("#SelUserCode").val().split(',');
                                arrnew.splice(index, 1);//先删除  下一句会触发oncheck事件  不删除会重复
                                $("#SelUserCode").val(arrnew.join(","));

                                var arrnew = $("#SelUserName").val().split(',');
                                arrnew.splice(index, 1);//先删除  下一句会触发oncheck事件  不删除会重复
                                $("#SelUserName").val(arrnew.join(","));

                                $('#TableContainer').datagrid('checkRow', i);
                            }
                        }
                    },
                    onCheck: function (rowIndex, rowData) {
                        if ($("#SelUserCode").val() > "") {
                            $("#SelUserCode").val($("#SelUserCode").val() + "," + rowData.UserCode);
                            $("#SelUserName").val($("#SelUserName").val() + "," + rowData.UserName);
                        } else {
                            $("#SelUserCode").val(rowData.UserCode);
                            $("#SelUserName").val(rowData.UserName);
                        }
                    },
                    onUncheck: function (rowIndex, rowData) {
                        var arr = $("#SelUserCode").val().split(',');
                        var index = arr.indexOf(rowData.UserCode);
                        arr.splice(index, 1);
                        $("#SelUserCode").val(arr.join(","));

                        arr = $("#SelUserName").val().split(',');
                        index = arr.indexOf(rowData.UserName);
                        arr.splice(index, 1);
                        $("#SelUserName").val(arr.join(","));
                    },
                    onCheckAll: function (rows) {
                        var arr = $("#SelUserCode").val().split(',');
                        var list = "";
                        for (var i = 0; i < rows.length; i++) {
                            var index = arr.indexOf(rows[i].UserCode);
                            if (index >= 0)
                                arr.splice(index, 1);
                            list += ',' + rows[i].UserCode;
                        }
                        $("#SelUserCode").val(arr.join(",") + list);

                        arr = $("#SelUserName").val().split(',');
                        list = "";
                        for (var i = 0; i < rows.length; i++) {
                            var index = arr.indexOf(rows[i].UserName);
                            if (index >= 0)
                                arr.splice(index, 1);
                            list += ',' + rows[i].UserName;
                        }
                        $("#SelUserName").val(arr.join(",") + list);
                    },
                    onUncheckAll: function (rows) {
                        var arr = $("#SelUserCode").val().split(',');
                        for (var i = 0; i < rows.length; i++) {
                            var index = arr.indexOf(rows[i].UserCode);
                            if (index >= 0)
                                arr.splice(index, 1);
                        }
                        $("#SelUserCode").val(arr.join(","));

                        var arr = $("#SelUserName").val().split(',');
                        for (var i = 0; i < rows.length; i++) {
                            var index = arr.indexOf(rows[i].UserName);
                            if (index >= 0)
                                arr.splice(index, 1);
                        }
                        $("#SelUserName").val(arr.join(","));
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            $(function () {
                $("#IsCheck").val(GetQueryString('IsCheck'));
                $("#CloseParent").val(GetQueryString('CloseParent'));
                $("#SelUserCode").val(localStorage.getItem('SelUserCode'));
                $("#SelUserName").val(localStorage.getItem('SelUserName'));
                $("#CommId").val(GetQueryString('CommId'));
                $("#CheckTypeId").val(GetQueryString('CheckTypeId'));
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
