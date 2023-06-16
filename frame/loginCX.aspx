<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginCX.aspx.cs" Inherits="M_Main.frame.loginCX" %>

<!DOCTYPE html>
<!-- saved from url=(0030)https://www.tw369.com/login/ -->
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />  
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <script src="../jscript/jquery-1.8.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/logincx.css" rel="stylesheet">
    <style type="text/css">

        @media screen and (max-width:768px){
              /*不大于768px的设备尺寸中 响应式布局的特定样式*/

        }

    </style>
</head>
<body class="signin animated fadeInDown">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-11">
                <%--<div class="signin-info" id="HelpInfo">
                    <ul class="m-b" style="font-size:16px;font-family:微软雅黑;">
                       
                        <li style="margin-bottom:8px;">第一步：FireFox浏览器 <a style="color:#ffc000;" target="_blank" href="http://www.firefox.com.cn">下载安装</a></li>
                        <li style="margin-bottom:8px;">第二步：下载控件并安装 <a style="color:#ffc000;" target="_blank" href="http://125.64.16.10/ClientSetup/WebOffice.rar">下载安装</a></li>
                        <li style="margin-bottom:8px;">遇到问题？请联系客服经理：<span style="color:#ffc000">400-702-0018</span></li>
                        <li style="margin-bottom:8px;">我想试用，请联系销售经理：<span style="color:#ffc000">(028)63170808</span></li>
                        <li style="margin-bottom:8px;">国家版权局软著登字第1205328号</li>
                        <div style="font-size:16px;font-family:微软雅黑;padding-top:8px;text-align:left;width:100%;">
                            物管APP二维码
                            <img src="../images/cxwx.jpg" style="width:80px;height:80px;" />
                        </div>
                    </ul>
                    
                </div>--%>
            </div>
            <div class="col-sm-12" >
                <form method="post" action="logining.aspx">
	 	     <input type="hidden" id="CommName" name="CommName" runat="server" />
                    <div style="font-weight:bold;font-size:18px;width:100%;text-align:center;margin-bottom:20px;font-family:微软雅黑;">欢迎使用长信卓尔物业管理系统</div>
                    <input id="AccountName" name="AccountName" type="text" class="form-control uname" placeholder="用户名" style="height:50px;border-radius:5px;margin-bottom:35px;" />
                    <input id="Password" name="Password"  type="password" class="form-control pword m-b" placeholder="密码" style="height:50px;border-radius:5px;margin-bottom:30px;" />

                    <button class="btn btn-success btn-block" id="BtnLogin" style="height:50px;border-radius:5px;border:1px solid #A29E9F;font-size:16pt;font-weight:bold;margin-bottom:10px;">登&nbsp;&nbsp;&nbsp;录</button>
                    <input type="hidden" id="IsEncrypt" name="IsEncrypt" value="false" />
                    <input type="hidden" id="CorpId" name="CorpId" value="1000" runat="server" />

                    <div class="signin-info" id="HelpInfo">
                    <ul class="m-b" style="font-size:16px;font-family:微软雅黑;">
                       
                        <li style="margin-bottom:8px;">第一步：FireFox浏览器 <a style="color:#ffc000;" target="_blank" href="http://www.firefox.com.cn">下载安装</a></li>
                        <li style="margin-bottom:8px;">第二步：下载控件并安装 <a style="color:#ffc000;" target="_blank" href="http://39.101.176.131/ClientSetup/WebOffice.rar">下载安装</a></li>
                        <%--<li style="margin-bottom:8px;">遇到问题？请联系客服经理：<span style="color:#ffc000">400-702-0018</span></li>
                        <li style="margin-bottom:8px;">我想试用，请联系销售经理：<span style="color:#ffc000">(028)63170808</span></li>
                        <li style="margin-bottom:8px;">国家版权局软著登字第1205328号</li>--%>
                        <div style="font-size:16px;font-family:微软雅黑;padding-top:8px;text-align:left;width:100%;">
                            物管APP二维码
                            <img src="../images/cxwx.jpg" style="width:80px;height:80px;" />
                        </div>
                    </ul>
                    
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
