<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="M_Main.frame.changepassword" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>修改密码</h5>
                        <span style="color: red; padding-left: 10px;" id="msg" runat="server"></span>
                    </div>
                    <div class="ibox-content">
                        <form method="get" class="form-horizontal" id="frmForm">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">旧密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="OldPWD" name="OldPWD">
                                    <span class="help-block m-b-none">请输入系统原有密码</span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="NewPWD" name="NewPWD">
                                    <span class="help-block m-b-none">请输入新密码</span>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">确认新密码</label>

                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="SureNewPWD" name="SureNewPWD">
                                    <span class="help-block m-b-none">二次输入的密码需一致</span>
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-primary" type="button" id="BtnSave">确认修改</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/iCheck/icheck.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript">

        $("#BtnSave").click(function () {
            //平安密码策略
            if (!CheckIsCanEditPsw()) {
                HDialog.Info("用户每天至多只能修改一次密码!");
                return;
            }

            if ($("#OldPWD").val() == $("#NewPWD").val()) {
                HDialog.Info("新密码不能跟旧密码一致");
                return;
            }

            var NewPWD = $("#NewPWD").val();
            // var reg = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/]).{6,}$/;
            var reg = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/])[\da-zA-Z~!@#$%^&*()_+`\-={}:";'<>?,.\/]{8,}$/;
            if (NewPWD.length > 7) {
                if (!reg.test(NewPWD)) {
                    HDialog.Info('密码必须包含数数字、字母、特殊符号。');
                    return;
                }
            } else {
                HDialog.Info('密码长度不得少于8位。');
                return;
            }

            if ($("#NewPWD").val() != $("#SureNewPWD").val()) {
                HDialog.Info("两次输入的密码不一致");
                return;
            }

            $.tool.DataPostNoLoading('User', 'ChangePassword', $('#frmForm').serialize(),
                function Init() {
                    layer.load(2);
                },
                function callback(_Data) {
                    if (_Data.substring(0, 5) == "false") {
                        HDialog.Info(_Data.substring(6));
                    }
                    else {
                        HDialog.Info("密码修改成功");
                    }
                },
                function completeCallback() {
                    layer.closeAll();
                },
                function errorCallback() {
                });
        });
        function CheckIsCanEditPsw() {
            var isCan = true;
            $.tool.DataPostNoLoading('User', 'CheckIsCanEditPsw', $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "false") {
                        isCan = false;
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
            return isCan;
        }
    </script>

</body>

</html>
