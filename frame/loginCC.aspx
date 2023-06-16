<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginCC.aspx.cs" Inherits="M_Main.frame.loginCC" %>

<!DOCTYPE html>
<!-- saved from url=(0030)https://www.tw369.com/login/ -->
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>登录</title>
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
</head>
<body class="login-bg">
    <div class="" style="display: none; position: absolute;">
        <div class="aui_outer">
            <table class="aui_border">
                <tbody>
                    <tr>
                        <td class="aui_nw"></td>
                        <td class="aui_n"></td>
                        <td class="aui_ne"></td>
                    </tr>
                    <tr>
                        <td class="aui_w"></td>
                        <td class="aui_c">
                            <div class="aui_inner">
                                <table class="aui_dialog">
                                    <tbody>
                                        <tr>
                                            <td colspan="2" class="aui_header">
                                                <div class="aui_titleBar">
                                                    <div class="aui_title" style="cursor: move;"></div>
                                                    <a class="aui_close" href="javascript:;"></a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="aui_icon" style="display: none;">
                                                <div class="aui_iconBg" style="background: none;"></div>
                                            </td>
                                            <td class="aui_main" style="width: auto; height: auto;">
                                                <div class="aui_content" style="padding: 20px 25px;"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="aui_footer">
                                                <div class="aui_buttons" style="display: none;"></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </td>
                        <td class="aui_e"></td>
                    </tr>
                    <tr>
                        <td class="aui_sw"></td>
                        <td class="aui_s"></td>
                        <td class="aui_se" style="cursor: se-resize;"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

   
    <div class="login-main-areaNew" id="TianCThree" >
        <div id="TianCFor" class="login-main-areaNewImg">
            <div class="auto login-inner">
                <div class="clearfix">



                    <div class="login-main pie-for-element animated fadeInDown" style="position: absolute;">
                        <div class="login-title">
                            用户登录
                        </div>
                        <p class="error-info" id="errorInfo"></p>
                        <form method="post" action="logining.aspx" id="loginSubmit">
                            <input type="hidden" name="redirectURL" value="">
                            <div class="login-form-item form-item-bg form-item-bg-user">
                                <input runat="server" type="text" name="AccountName" placeholder="用户账号" id="AccountName" class="input-focus-handle ui-autocomplete-input" value="" autocomplete="off">
                                <div id="emailAutoComplete" class="email-complete-list">
                                    <ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none;"></ul>
                                </div>
                            </div>
                            <div class="login-form-item form-item-bg form-item-bg-lock password-input-wrap">
                                <input runat="server" id="Password" type="password" name="Password" placeholder="登录密码" class="input-focus-handle">
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
                            <div class="login-options">
                                <label for="usernameSave" class="idsave-check">
                                    <span class="checkbox-icon checkbox-icon-checked" id="checkboxTrigger"></span>
                                    <input type="checkbox" id="usernameSave" name="usernameSave" />
                                    记住登录名
                                </label>
                                <a href="http://www.tw369.com/site/index.html" target="_blank">忘记密码？</a>
                            </div>
                            <input type="submit" value="登 录" id="loginButton" onclick="return SaveUser();" class="login-submit default-transition default-font">
                            <input type="hidden" id="IsEncrypt" name="IsEncrypt" value="false" />
                            <input type="hidden" id="CorpId" name="CorpId" value="1000" runat="server" />
                        </form>
                        <div class="go-reg">
                            还没有账号？立即<a href="http://www.tw369.com/site/index.html" target="_blank">免费注册</a>
                        </div>
                    </div>

                </div>
                <div class="bg-change">
                </div>
            </div>
            <%--position: fixed;left: 20px;bottom:0px;--%>
            <div style="position: fixed;left: 20px;bottom:0px;color: #fff;font-size: 16px;" id="TianCOne">
                <p>
                    <span style="margin-right:30px"> 第一步：FireFox浏览器 <a style="color: #ffc000;" target="_blank" href="http://www.firefox.com.cn">下载安装</a> </span>
                    第二步：下载控件并安装 <a style="color: #ffc000;" target="_blank" href="http://125.64.16.10/ClientSetup/WebOffice.rar">下载安装</a>
                </p>
            </div>

        </div>
    </div>

    <div style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
    <span role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></span>

    <input type="hidden" id="msg" name="msg" runat="server" />
    <input type="hidden" id="CommName" name="CommName" runat="server" />
    <script type="text/javascript">

        function SaveUser() {
            // alert(document.getElementById("usernameSave").checked);
            //检查验证码
            if (validateCode() == false) {
                event.preventDefault();
                return false;
            };
            if (document.getElementById("usernameSave").checked) {
                localStorage.TwUserName = $("#AccountName").val();
                //信和要求不要记住密码
                localStorage.TwPwd = "";
                //localStorage.TwPwd = $("#Password").val();
            }
            return true;
            //var form = document.getElementById('loginSubmit');
            //form.submit();
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


        //function IsTianCheng() {
        //    if ($("#CommName").val() == "长城") {

        //        $("#TopDiv").hide();
        //        $("#BottomDiv").hide();

        //        $("#TianCOne").show();
        //        $("#TianCTow").hide();


        //        $("#TianCThree").removeClass("login-main-area");
        //        $("#TianCThree").addClass("login-main-areaNew");
        //        $("#TianCFor").addClass("login-main-areaNewImg");
        //    } 
        //}
        //IsTianCheng();

    </script>
</body>
</html>

