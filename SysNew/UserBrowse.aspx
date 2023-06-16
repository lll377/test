<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserBrowse.aspx.cs" Inherits="M_Main.SysNew.UserBrowse" %>

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
    <script type="text/javascript" src="../jscript/export.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 650px;
            height: 240px;
        }

        .SearchTable {
            width: 650px;
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
                    <td class="TdTitle">人员姓名
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" />
                    </td>
                    <td class="TdTitle">登录账号
                    </td>
                    <td class="TdContent">
                        <input type="text" id="LoginCode" name="LoginCode" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">组织机构
                    </td>
                    <td class="TdContent">
                        <input type="text" id="DepName" name="DepName" />
                    </td>
                    <td class="TdTitle">所属岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="RoleName" name="RoleName" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">通用岗位
                    </td>
                    <td class="TdContent">
                        <input type="text" id="SysRoleName" name="SysRoleName" />
                    </td>
                    <td class="TdTitle">移动电话
                    </td>
                    <td class="TdContent">
                        <input type="text" id="MobilePhone" name="MobilePhone" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否开通员工APP
                    </td>
                    <td class="TdContent">
                        <input type="checkbox" id="CkMobile" name="CkMobile" />
                    </td>
                    <%--<td class="TdTitle">历史用户
                    </td>
                    <td class="TdContent">
                        <select id="IsDelete" name="IsDelete">
                            <option value="">所有</option>
                            <option value="1">是</option>
                            <option value="0" selected>否</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>--%>
                    <td class="TdTitle">员工状态</td>
                    <td class="TdContent">
                        <select id="EmployeeStatus" name="EmployeeStatus" runat="server">
                            <option value="" selected>全部</option>
                            <option value="在线">在线</option>
                            <option value="离线">离线</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">员工星级</td>
                    <td class="TdContent">
                        <select id="EmployeeStar" name="EmployeeStar" runat="server">
                        </select></td>
                    <td class="TdTitle">员工工种</td>
                    <td class="TdContent">
                        <select id="EmployeeProfession" name="EmployeeProfession" runat="server">
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">历史用户
                    </td>
                    <td class="TdContent">
                        <select id="IsDelete" name="IsDelete">
                            <option value="">所有</option>
                            <option value="1">是</option>
                            <option value="0" selected>否</option>
                        </select>
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
                { field: 'DepName', title: '组织机构', align: 'left', width: 50, sortable: true },
                {
                    field: 'UserName', title: '人名员称', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.UserCode + "','edit');\">" + row.UserName + "</a>";
                        return str;
                    }
                },
                { field: 'LoginCode', title: '登录账号', align: 'left', width: 50, sortable: true },
                { field: 'UserRoleNames', title: '岗位名称', align: 'left', width: 50, sortable: true },
                { field: 'UserSysRoleNames', title: '通用岗位', align: 'left', width: 50, sortable: true },
                { field: 'EmployeeStatus', title: '员工状态', align: 'left', width: 50, sortable: true },
                { field: 'EmployeeStar', title: '员工星级', align: 'left', width: 50, sortable: true },
                { field: 'EmployeeProfession', title: '员工工种', align: 'left', width: 50, sortable: true },
                { field: 'LastLocation', title: '当前位置', align: 'left', width: 50, sortable: true }
            ]];
            var toolbar = [
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
                        $.tool.DataGet('User', 'DelUser', 'UserCode=' + row.UserCode + '&UserName=' + row.UserName,
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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=User&Command=UserList&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
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

            function Detail(UserCode, OpType) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '725', '../SysNew/UserManage.aspx?SelDepCode=' + $("#DepCode").val() + '&UserCode=' + UserCode + '&OpType=' + OpType, '用户详细', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }

            function BatchImport() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('800', '625', '../SysNew/BatchImport.aspx?UserCode=' + UserCode + '&OpType=' + OpType, '批量导入', true, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
