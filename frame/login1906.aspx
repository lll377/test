<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login1906.aspx.cs" Inherits="M_Main.frame.login1906" %>

<!DOCTYPE html>
<!-- saved from url=(0030)https://www.tw369.com/login/ -->
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>不动产智慧物管系统</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="./LoginResource/common.min.css">
    <link href="css/animate.min.css" rel="stylesheet">
    <script src="./LoginResource/jquery.min.js"></script>
    <link rel="stylesheet" href="./LoginResource/login.css">
    <link rel="stylesheet" href="./LoginResource/jquery-ui-1.11.4.custom.min.css">
    <script src="./LoginResource/jquery-ui-1.11.4.custom.min.js"></script>
    <link rel="stylesheet" href="./LoginResource/niaoyunNewDialog.css">
    <script src="./LoginResource/jquery.dialog.js"></script>
    <script src="./LoginResource/jquery.cookie.js"></script>
    <script src="./mydeskNew/js/script.js"></script>
    <%-- 
       这句话是测试GIT关闭功能
    --%>
    <style type="text/css">
        .login-title {
            font-family: FZLTZHK--GBK1-0;
            font-size: 36px;
            color: #47446A;
            margin-top:30%;
            letter-spacing: 3.67px;
            line-height: 48px;
        }

        .login-main-container {
            position:absolute;
            top:0;
            right:0;
            width: 500px;
            height: 100%;
            background-color:#fffc;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow:auto;
        } 

        .sys-title {
            font-family: FZLTZHK--GBK1-0;
            font-size: 34px;
            color:#47446A;
            margin-top: 30%;
            letter-spacing: 3.67px;
            line-height: 48px;
            text-align: center;
            margin-bottom: 30px;
        }

        .login-submit-btn {
            width: 300px;
            height: 40px;
            line-height: 40px;
            font-size: 16px;
            background-color: #E95504;
            color:#fff;
            border: none;
            outline: none;
            cursor: pointer;
            margin-top: 30px;
        }

        .login-form-item {
            border-left: 0px;
            border-right: 0;
            border-top: 0;
        }

        .input-focus-handle {
            background-color: transparent;
        }

        .code {
            color: #fff;
            background-color: #8C8C9385;
        }

        .options {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            color : #736F6F;
        }

        .tips {
            display:flex;
            margin-top: 100px;
            color: #999;
            margin-bottom: 30px;
            border-top: 1px dashed #888;
            padding-top: 20px;
        }

        .tips-title {
            margin-right: 25px;
        }

        .download {
            color: #E95504;
            text-decoration: underline;
        }

        .left-content {
            width: calc(100% - 500px);
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .input-checkbox {
            margin-right: 10px;
        }
    </style>
</head>
<body class="login-bg">
    <div id="logindiv" style="position:fixed;top:0;bottom:0;left:0;right:0;background:url(img/login1906.jpg) no-repeat;background-size:100% 100%;">
        <div class="left-content">
            <img src="img/PAlogo.png" style="position: absolute; left: 0px; top: 0px;width: 100%;" />
            <img src="img/WELCOME.png" style="width:70%;margin-top:-50px;" />
            <img src="img/PACode.png" style="position: absolute; left: 50px; bottom: 20px;width: 120px;" />
        </div>
        <div id="btndiv" class="login-main-container pie-for-element animated fadeInDown">
            <div class="sys-title">
                不动产智慧物管系统
            </div>
            <p class="error-info" id="errorInfo"></p>
            <form method="post" action="logining.aspx" id="loginSubmit">
                <input type="hidden" name="redirectURL" value="">
                <div class="login-form-item form-item-bg form-item-bg-user">
                    <input runat="server" type="text" name="AccountName" placeholder="请输入UM账号" id="AccountName" class="input-focus-handle ui-autocomplete-input" value="" autocomplete="off">
                    <div id="emailAutoComplete" class="email-complete-list">
                        <ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none;"></ul>
                    </div>
                </div>
                <div class="login-form-item form-item-bg form-item-bg-lock password-input-wrap">
                    <input runat="server" id="Password" type="password" name="Password" placeholder="请输入UM密码" class="input-focus-handle">
                    <div class="caps-lock-remind" id="capsLockRemind" style="display: none;">
                        大写锁定已打开
                    </div>
                </div>
                <div class="captcha-deck clearfix" style="display: block;">
                    <div class="login-form-item captcha-item form-item-bg form-item-bg-captcha">
                        <input type="text" id="inputCode" name="inputCode" placeholder="验证码" maxlength="4" class="input-focus-handle">
                    </div>
                    <div class="captcha-box">
                        <div id="checkCode" class="code" onclick="createCode(4)"></div>
                    </div>
                </div>
                <%--<div class="login-options">
                    <label for="usernameSave" class="idsave-check">
                        <span class="checkbox-icon checkbox-icon-checked" id="checkboxTrigger"></span>
                        <input type="checkbox" id="usernameSave" name="usernameSave" />
                        记住登录名
                    </label>
                    <a href="http://www.tw369.com/site/index.html" target="_blank" style="margin-right:22%;">忘记密码？</a>
                </div>--%>
                <input type="button" value="登 录" id="loginButton" onclick="SaveUser();" class="login-submit-btn default-transition default-font">
                <input type="hidden" id="IsEncrypt" name="IsEncrypt" value="false" />
                <input type="hidden" id="CorpId" name="CorpId" value="1000" runat="server" />
                <%--<div class="options">
                    <div class="">
                        <input type="checkbox" value="" class="input-checkbox">记住登录名
                    </div>
                    <div class="forger-password">忘记密码?</div>
                </div>--%>
                <div class="tips">
                    <div class="tips-title">提示:</div>
                    <div  class="tips-val">
                        <div>1.建议使用火狐浏览器</div>
                        <div>2.如需打印请<a class="download" href="http://125.64.16.10/ClientSetup/WebOffice.rar">下载控件</a></div>
                    </div>
                </div>
            </form>
            <%--<div class="go-reg" style="padding-left:20%;">
                还没有账号？立即<a href="http://www.tw369.com/site/index.html" target="_blank">免费注册</a>
            </div>--%>
        </div>
    </div>
    <input type="hidden" id="msg" name="msg" runat="server" />
    <script type="text/javascript">
        function SaveUser() {
            // alert(document.getElementById("usernameSave").checked);
            //检查验证码
            if (validateCode() == false) {
                event.preventDefault();
                return false;
            };
            //if (document.getElementById("usernameSave").checked) {
            //    localStorage.TwUserName = $("#AccountName").val();
            //    //信和要求不要记住密码
            //    localStorage.TwPwd = "";
            //    //localStorage.TwPwd = $("#Password").val();
            //}
            var form = document.getElementById('loginSubmit');
            form.submit();
        }
        $(document).ready(function () {
            var usernameSaveCheckBox = $("#usernameSave");
            usernameSaveCheckBox.change(function () {
                var checkboxTrigger = $("#checkboxTrigger");
                if ($(this).prop("checked")) {
                    checkboxTrigger.addClass("checkbox-icon-checked");
                } else {
                    checkboxTrigger.removeClass("checkbox-icon-checked");
                }
            });
            usernameSaveCheckBox.prop("checked", false).change();

            if (localStorage.TwUserName != null) {
                $("#AccountName").val(localStorage.TwUserName);
            }

            if (localStorage.TwPwd != null) {
                $("#Password").val(localStorage.TwPwd);
            }
        });

        function pwdEncode() {

            var base = new Base64();
            var result = base.encode($("#Password").val());
            $("#Password").val(result);
        }

        //页面加载时，生成随机验证码
        window.onload = function () {
            createCode(4);
        }

        //生成验证码的方法
        function createCode(length) {
            var code = "";
            var codeLength = parseInt(length); //验证码的长度
            var checkCode = document.getElementById("checkCode");
            ////所有候选组成验证码的字符，当然也可以用中文的
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
            //循环组成验证码的字符串
            for (var i = 0; i < codeLength; i++) {
                //获取随机验证码下标
                var charNum = Math.floor(Math.random() * 62);
                //组合成指定字符验证码
                code += codeChars[charNum];
            }
            if (checkCode) {
                //为验证码区域添加样式名
                checkCode.className = "code";
                //将生成验证码赋值到显示区
                checkCode.innerHTML = code;
            }
        }

        //检查验证码是否正确
        function validateCode() {
            //获取显示区生成的验证码
            var checkCode = document.getElementById("checkCode").innerHTML;
            //获取输入的验证码
            var inputCode = document.getElementById("inputCode").value;
            //console.log(checkCode);
            //console.log(inputCode);
            if (inputCode.length <= 0) {
                alert("请输入验证码！");
                return false;
            }
            else if (inputCode.toUpperCase() != checkCode.toUpperCase()) {
                alert("验证码输入有误！");
                createCode(4);
                return false;
            }
            else {
                //alert("验证码正确！");
                return true;
            }
        }

    </script>
</body>
</html>

