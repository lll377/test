<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TempTaskGenerationAdd.aspx.cs" Inherits="M_Main.Supervision.TempTaskGenerationAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>维护任务生成</title>
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
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; margin-left: 50px; margin-top: -180px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div style="padding: 5px;">
            <table class="dlg_table">
                <tr>
                    <td class="title">计划模板:</td>
                    <td class="text" colspan="3">
                        <input id="PlanIds" name="PlanIds" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: true,
                            buttonText: '',
                            height:'200px',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelPlan(); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">开始时间:</td>
                    <td class="text">
                        <input type="text" id="BeginTime" name="BeginTime" class="easyui-datebox" data-options="required:true" />
                    </td>
                    <td class="title">结束时间:</td>
                    <td class="text">
                        <input type="text" id="EndTime" name="EndTime" class="easyui-datebox" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务执行检查:</td>
                    <td class="text" colspan="3">
                        <input id="Task" name="Task" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮选择任务执行检查岗位/检查人!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
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
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">生成</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <script type="text/javascript">
            //选择计划模板
            function SelPlan() {
                HDialog.Open('800', '600', '../Supervision/SelPlanList.aspx', '选择计划模板', true, function callback(_Data) {
                    if (_Data != "") {
                        var varObjects = _Data.split('◆');
                        $("#PlanIds").textbox('setValue', varObjects[0]);
                        $("#PlanIds").textbox('setText', varObjects[1]);
                    }
                });
            }

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
                HDialog.Open('700', '500', '../Supervision/SelRoleOrUser.aspx?IsCheck=1&RoleOrUser=' + $("#" + Name + 'Type').val(), "选择通用岗位或人员", false, function callback(_Data) {
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

            //判断作业是否执行完成
            var ProgressInterval;
            var ProgressIntervalJD;
            function Save() {
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    $.tool.DataPostNoLoading('CSSupervision', 'TempTaskGeneration_CreateJob', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            StartTask();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            function StartTask() {
                //展示进度
                ShowProgress();
                //获取执行情况进度  
                ProgressIntervalJD = setInterval("TaskGeneration_GetCurr()", 1000);
            }

            //获取进度
            function TaskGeneration_GetCurr() {
                $.tool.DataPostNoLoading('CSSupervision', 'TempTaskGeneration_GetCurr', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {
                                HDialog.Info("生成成功");
                                HDialog.Close("1");
                                CloseProgress();
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //显示进度
            function ShowProgress() {
                $(".datagrid-mask").show();
                $(".datagrid-mask-msg").show();
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
                $("#save").removeAttr("onclick");
                $("#back").removeAttr("onclick");
            }

            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressIntervalJD);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
                $("#save").attr("onclick", "Save();");
                $("#back").attr("onclick", "Close();");
            }

            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }
        </script>
    </form>
</body>
</html>
