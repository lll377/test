<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentRoleBrowse.aspx.cs" Inherits="M_Main.SysNew.DepartmentRoleBrowse" %>

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
        .SearchTable {
            padding: 10px;
            height: auto;
        }
            .SearchTable td {
                 padding: 5px;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" style="width: 380px; height: 130px;" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="">岗位名称
                    </td>
                    <td class="">
                        <input type="text" id="RoleName" name="RoleName" />
                    </td>
                    <td class="">显示下属机构
                    </td>
                    <td class="">
                        <input type="checkbox" id="IsLevel" name="IsLevel" value="1" checked />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px; ">
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

            if ($("#DepCode").val().toLowerCase() == "empty") {
                column = [[
                    {
                        field: 'RoleName', title: '岗位名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.RoleCode + "','edit');\">" + row.RoleName + "</a>";
                            return str;
                        }
                    },
                    {
                        field: 'UserCount', title: '人数', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"UserList('" + row.RoleCode + "','" + row.DepName + "');\">" + row.UserCount + "</a>";
                            return str;
                        }
                    },
                    { field: 'RoleDescribe', title: '备注', width: 300, align: 'left', sortable: true }

                ]];
            }
            else {
                column = [[
                    { field: 'ck', checkbox: true },
                    {
                        field: 'DepName', title: '组织机构', width: 250, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = row.DepName;
                            if (str == "") str = "无所属机构"
                            return str;
                        }
                    },
                    {
                        field: 'RoleName', title: '岗位名称', width: 125, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.RoleCode + "','edit');\">" + row.RoleName + "</a>";
                            return str;
                        }
                    },
                    { field: 'SysRoleName', title: '通用岗位', width: 150, align: 'left', sortable: true },
                    {
                        field: 'UserCount', title: '人数', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"UserList('" + row.RoleCode + "','" + row.DepName + "');\">" + row.UserCount + "</a>";
                            return str;
                        }
                    },
                    { field: 'RoleDescribe', title: '备注', width: 200, align: 'left', sortable: true }

                ]];
            }

            var toolbar;
            if ($("#DepCode").val().toLowerCase() == "empty") {
                toolbar = [
                    {
                        text: '新增',
                        iconCls: 'icon-add',
                        handler: function () {
                            Detail('', 'add');
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#TableContainer").datagrid("getChecked");
                            if (row != null && row != undefined && row != "") {
                                var RoleCode = '';
                                for (var i = 0; i < row.length; i++) {
                                    RoleCode += row[i].RoleCode + ",";
                                }
                                RoleCode = RoleCode.substr(0, RoleCode.length - 1);
                                DelRecord(RoleCode);
                            } else {
                                HDialog.Info("请勾选至少一行数据进行操作！");
                            }
                        }
                    }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-filter',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            $('#SearchDlg').dialog('open');
                        }
                    }, '-',
                    {
                        text: '<font color=red>&nbsp;&nbsp;&nbsp;&nbsp;*点击左侧“通用岗位”增加通用岗位，点击左侧组织机构增加具体岗位；</font>'
                    }
                ];
            } else {
                toolbar = [
                    {
                        text: '新增',
                        iconCls: 'icon-add',
                        handler: function () {
                            Detail('', 'add');
                        }
                    }, '-',
                    {
                        text: '绑定岗位',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#TableContainer").datagrid("getChecked");
                            if (row != null && row != undefined && row != "") {
                                var RoleCode = '';
                                for (var i = 0; i < row.length; i++) {
                                    RoleCode += row[i].RoleCode + ",";
                                }
                                RoleCode = RoleCode.substr(0, RoleCode.length - 1);
                                SelRole(RoleCode);
                            } else {
                                HDialog.Info("请勾选至少一行数据进行操作！");
                            }
                        }
                    }, '-',
                    {
                        text: '设置人员',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#TableContainer").datagrid("getChecked");
                            if (row != null && row != undefined && row != "") {
                                var RoleCode = '';
                                for (var i = 0; i < row.length; i++) {
                                    RoleCode += row[i].RoleCode + ",";
                                }
                                RoleCode = RoleCode.substr(0, RoleCode.length - 1);
                                SelUser(RoleCode);
                            } else {
                                HDialog.Info("请勾选至少一行数据进行操作！");
                            }
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#TableContainer").datagrid("getChecked");
                            if (row != null && row != undefined && row != "") {
                                var RoleCode = '';
                                for (var i = 0; i < row.length; i++) {
                                    RoleCode += row[i].RoleCode + ",";
                                }
                                RoleCode = RoleCode.substr(0, RoleCode.length - 1);
                                DelRecord(RoleCode);
                            } else {
                                HDialog.Info("请勾选至少一行数据进行操作！");
                            }
                        }
                    }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-filter',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            $('#SearchDlg').dialog('open');
                        }
                    }, '-',
                    {
                        text: '<font color=red>&nbsp;&nbsp;&nbsp;&nbsp;*点击左侧“通用岗位”增加通用岗位，点击左侧组织机构增加具体岗位；</font>'
                    }
                ];
            }


            function SelRole(RoleCode) {
                HDialog.Open('500', '500', '../DialogNew/SelCommRole.aspx', '选择通用岗位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var arrRet = _Data.split(',');
                        $.messager.confirm('确定', '是否绑定' + arrRet[1], function (r) {
                            if (r) {
                                $.tool.DataGet('Role', 'SetSysRole', 'RoleCode=' + RoleCode + '&SysRoleCode=' + arrRet[0],
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        HDialog.Info("绑定成功");
                                        LoadList();
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        });
                    }
                });
            }

            function SelUser(RoleCode) {
                HDialog.Open('800', '600', '../SysNew/SelUser.aspx?DepCode=' + $("#DepCode").val(), '选择人员', true, function callback(_Data) {
                    if (_Data != ";" && _Data != "") {//**获得返回的参数信息
                        var arrRet = _Data.split(';');
                        var num = arrRet[0].split(',').length;
                        $.messager.confirm('确定', '是否设置' + num + '名人员', function (r) {
                            if (r) {
                                $.tool.DataGet('Role', 'SetUser', 'RoleCode=' + RoleCode + '&UserCode=' + arrRet[1],
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        HDialog.Info("设置成功");
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        });
                    }
                });
            }

            function DelRecord(RoleCode) {
                $.messager.confirm('确定', '是否删除勾选项', function (r) {
                    if (r) {
                        $.tool.DataPost('Role', 'DelRoleList', 'RoleCode=' + RoleCode,
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
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Role&Command=RoleList&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    remoteSort: false,
                    fitColumns: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function UserList(RoleCode, DepName) {
                //if (DepName) {

                //}
                if (DepName == "") {
                    $('.easyui-dialog').parent().appendTo($("form:first"));
                    HDialog.Open('800', '600', '../SysNew/DepartmentRoleUserList.aspx?SysRoleCode=' + RoleCode, '人员列表', true, function callback(_Data) {
                    });
                } else {
                    $('.easyui-dialog').parent().appendTo($("form:first"));
                    HDialog.Open('800', '600', '../SysNew/DepartmentRoleUserList.aspx?RoleCode=' + RoleCode, '人员列表', true, function callback(_Data) {
                    });
                }

            }

            function Detail(RoleCode, OpType, DepName) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('700', '350', '../SysNew/DepartmentRoleManage.aspx?SortDepCode=' + $("#DepCode").val() + '&RoleCode=' + RoleCode + '&RoleType=' + $("#DepCode").val() + '&OpType=' + OpType, '岗位详细', true, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
