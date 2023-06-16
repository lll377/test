<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskMaintainUpdate.aspx.cs" Inherits="M_Main.Supervision.TaskMaintainUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改任务</title>
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
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .dlg_table {
            margin-bottom: 53px;
        }

        .datagrid-toolbar tr td {
            padding: 0px;
        }

        .dlg_table tr td.title {
            width: 10%;
        }

        .dlg_table tr td.text {
            width: 40%;
        }

        .easyui-textbox {
            width: 35%;
        }

        .easyui-numberbox {
            width: 35%;
        }

        .easyui-combobox {
            width: 35%;
        }

        .easyui-datetimebox {
            width: 35%;
        }

        .colspan {
            width: 84.5%;
        }

        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="dlg_table">
                <tr>
                    <td class="title">任务执行检查:</td>
                    <td class="text" colspan="3">
                        <input id="Task" name="Task" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮选择任务执行检查岗位/检查人!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: false,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelRoleOrUser('Task'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    ClearRoleOrUser('Task');
                                }
                            }]" />
                        <input type="hidden" id="TaskRoleCode" name="TaskRoleCode" />
                        <input type="hidden" id="TaskUserCode" name="TaskUserCode" />
                        <input type="hidden" id="TaskRoleName" name="TaskRoleName" />
                        <input type="hidden" id="TaskUserName" name="TaskUserName" />
                        <input type="hidden" id="TaskType" name="TaskType" />
                    </td>
                </tr>
                <tr>
                    <td class="title">开始时间:</td>
                    <td class="text">
                        <input type="text" id="BeginTime" name="BeginTime" class="easyui-datetimebox" data-options="required:false,
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                     $(e.data.target).datetimebox('clear');
                                }
                            }]" />
                    </td>
                    <td class="title">结束时间:</td>
                    <td class="text">
                        <input type="text" id="EndTime" name="EndTime" class="easyui-datetimebox" data-options="required:false,
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).datetimebox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title" colspan="4">无需修改项请勿录入数据</td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="CommId" name="CommId" value="" />
        <input type="hidden" id="TaskIds" name="TaskIds" value="" />
        <script type="text/javascript">
            //选择责任岗位或责任人
            function SelRoleOrUser(Name) {
                if ($("#" + Name + 'Type').val() == "Role") {
                    localStorage.setItem("SelRoleCode", $("#" + Name + 'RoleCode').val());
                    localStorage.setItem("SelRoleName", $("#" + Name + 'RoleName').val());
                    localStorage.setItem("SelUserCode", '');
                    localStorage.setItem("SelUserName", '');
                } else if ($("#" + Name + 'Type').val() == "User") {
                    localStorage.setItem("SelRoleCode", '');
                    localStorage.setItem("SelRoleName", '');
                    localStorage.setItem("SelUserCode", $("#" + Name + 'UserCode').val());
                    localStorage.setItem("SelUserName", $("#" + Name + 'UserName').val());
                } else {
                    localStorage.setItem("SelRoleCode", '');
                    localStorage.setItem("SelRoleName", '');
                    localStorage.setItem("SelUserCode", '');
                    localStorage.setItem("SelUserName", '');
                }
                HDialog.Open('700', '500', '../Supervision/SelRoleOrUser.aspx?IsCheck=1&RoleOrUser=' + $("#" + Name + 'Type').val() + '&CommId=' + $("#CommId").val(), "选择通用岗位或人员", false, function callback(_Data) {
                    localStorage.removeItem('SelRoleCode');
                    localStorage.removeItem('SelRoleName');
                    localStorage.removeItem('SelUserCode');
                    localStorage.removeItem('SelUserName');
                    if (_Data > '') {
                        $("#" + Name).textbox('setValue', _Data.split('|')[0]);
                        $("#" + Name).textbox('setText', _Data.split('|')[1]);
                        $("#" + Name + _Data.split('|')[2] + 'Code').val(_Data.split('|')[0]);
                        $("#" + Name + _Data.split('|')[2] + 'Name').val(_Data.split('|')[1]);
                        $("#" + Name + 'Type').val(_Data.split('|')[2]);
                        if (_Data.split('|')[2] == "Role") {
                            $("#" + Name + 'UserCode').val('');
                            $("#" + Name + 'UserName').val('');
                        } else {
                            $("#" + Name + 'RoleCode').val('');
                            $("#" + Name + 'RoleName').val('');
                        }
                    }
                });
            }

            function ClearRoleOrUser(Name) {
                $('#' + Name).textbox('clear');
                $('#' + Name + 'RoleCode').val(null);
                $('#' + Name + 'UserCode').val(null);
            }

            function Close() {
                HDialog.Close("");
            }

            function Save() {
                if ($("#Task").textbox('getValue') == "" && $("#BeginTime").datetimebox('getValue') == "" && $("#EndTime").datetimebox('getValue') == "") {
                    HDialog.Info("请至少录入一项修改信息");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'UpdateTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("修改成功");
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#CommId").val(GetQueryString('CommId'));
                $("#TaskIds").val(localStorage.getItem('TaskIds'));
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
