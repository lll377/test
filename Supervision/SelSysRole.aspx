<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelSysRole.aspx.cs" Inherits="M_Main.Supervision.SelSysRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择通用岗位</title>
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
    <div id="tt" class="datagrid-toolbar" style="padding: 5px; width: 100%">
        <table>
            <tbody>
                <tr>
                    <td>
                        <a href="javascript:;" class="l-btn l-btn-small l-btn-plain" onclick="Save();">
                            <span class="l-btn-left l-btn-icon-left">
                                <span class="l-btn-text">确定</span>
                                <span class="l-btn-icon icon-save">&nbsp;</span>
                            </span>
                        </a>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <span class="l-btn-left l-btn-icon-left">
                            <span class="l-btn-text" style="margin: 0 6px 0 6px;">岗位名称：</span>
                            <span>
                                <input type="text" id="RoleName" name="RoleName" class="easyui-textbox" data-options="
                                icons: [{
                                    iconCls: 'icon-clear',
                                    handler: function (e) {
                                        $(e.data.target).textbox('clear');
                                    }
                                }]" />
                            </span>
                        </span>
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <a href="javascript:;" class="l-btn l-btn-small l-btn-plain" onclick="LoadList();">
                            <span class="l-btn-left l-btn-icon-left">
                                <span class="l-btn-text">筛选</span>
                                <span class="l-btn-icon icon-search">&nbsp;</span>
                            </span>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div style="background-color: #cccccc;" id="TableContainer"></div>
    <input type="hidden" id="IsCheck" name="IsCheck" />
    <input type="hidden" id="CloseParent" name="CloseParent" />
    <input type="hidden" id="SelRoleCode" name="SelRoleCode" />
    <input type="hidden" id="SelRoleName" name="SelRoleName" />
    <input type="hidden" id="CheckTypeId" name="CheckTypeId" />
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }

        function Save() {
            var str = '';
            if ($("#IsCheck").val() == '1') {
                str = $("#SelRoleCode").val() + "|" + $("#SelRoleName").val()+'|Role';
            } else {
                var row = $("#TableContainer").datagrid("getSelected");
                str = row.RoleCode + "|" + row.RoleName + '|Role';
            }
            if ($('#CloseParent').val() == '1') {
                window.parent.HDialog.Close(str);
            } else {
                HDialog.Close(str);
            }
        }

        var column1 = [[
            { field: 'ck', checkbox: true },
            { field: 'RoleName', title: '岗位名称', align: 'left', width: 50, sortable: true }
        ]];

        var column2 = [[
            { field: 'RoleName', title: '岗位名称', align: 'left', width: 50, sortable: true }
        ]];

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
                idField: "RoleCode",
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
                toolbar: "#tt",
                sortOrder: "desc",
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CSSupervision", "GetSysRoleList", "TableContainer", param);
                },
                onLoadSuccess: function (node) {
                    for (var i = 0; i < node.total; i++) {
                        var arr = $("#SelRoleCode").val().split(',');
                        var index = arr.indexOf(node.rows[i].RoleCode);
                        if (index >= 0) {
                            var arrnew = $("#SelRoleCode").val().split(',');
                            arrnew.splice(index, 1);//先删除  下一句会触发oncheck事件  不删除会重复
                            $("#SelRoleCode").val(arrnew.join(","));

                            var arrnew = $("#SelRoleName").val().split(',');
                            arrnew.splice(index, 1);//先删除  下一句会触发oncheck事件  不删除会重复
                            $("#SelRoleName").val(arrnew.join(","));

                            $('#TableContainer').datagrid('checkRow', i);
                        }
                    }
                },
                onCheck: function (rowIndex, rowData) {
                    if ($("#SelRoleCode").val() > "") {
                        $("#SelRoleCode").val($("#SelRoleCode").val() + "," + rowData.RoleCode);
                        $("#SelRoleName").val($("#SelRoleName").val() + "," + rowData.RoleName);
                    } else {
                        $("#SelRoleCode").val(rowData.RoleCode);
                        $("#SelRoleName").val(rowData.RoleName);
                    }
                },
                onUncheck: function (rowIndex, rowData) {
                    var arr = $("#SelRoleCode").val().split(',');
                    var index = arr.indexOf(rowData.RoleCode);
                    arr.splice(index, 1);
                    $("#SelRoleCode").val(arr.join(","));

                    arr = $("#SelRoleName").val().split(',');
                    index = arr.indexOf(rowData.RoleName);
                    arr.splice(index, 1);
                    $("#SelRoleName").val(arr.join(","));
                },
                onCheckAll: function (rows) {
                    var arr = $("#SelRoleCode").val().split(',');
                    var list = "";
                    for (var i = 0; i < rows.length; i++) {
                        var index = arr.indexOf(rows[i].RoleCode);
                        if (index >= 0)
                            arr.splice(index, 1);
                        list += ',' + rows[i].RoleCode;
                    }
                    $("#SelRoleCode").val(arr.join(",") + list);

                    arr = $("#SelRoleName").val().split(',');
                    list = "";
                    for (var i = 0; i < rows.length; i++) {
                        var index = arr.indexOf(rows[i].RoleName);
                        if (index >= 0)
                            arr.splice(index, 1);
                        list += ',' + rows[i].RoleName;
                    }
                    $("#SelRoleName").val(arr.join(",") + list);
                },
                onUncheckAll: function (rows) {
                    var arr = $("#SelRoleCode").val().split(',');
                    for (var i = 0; i < rows.length; i++) {
                        var index = arr.indexOf(rows[i].RoleCode);
                        if (index >= 0)
                            arr.splice(index, 1);
                    }
                    $("#SelRoleCode").val(arr.join(","));

                    var arr = $("#SelRoleName").val().split(',');
                    for (var i = 0; i < rows.length; i++) {
                        var index = arr.indexOf(rows[i].RoleName);
                        if (index >= 0)
                            arr.splice(index, 1);
                    }
                    $("#SelRoleName").val(arr.join(","));
                }
            });
        }

        $(function () {
            $("#IsCheck").val(GetQueryString('IsCheck'));
            $("#CloseParent").val(GetQueryString('CloseParent'));
            $("#SelRoleCode").val(localStorage.getItem('SelRoleCode'));
            $("#SelRoleName").val(localStorage.getItem('SelRoleName'));
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
</body>
</html>
