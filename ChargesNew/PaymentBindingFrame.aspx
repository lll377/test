﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentBindingFrame.aspx.cs" Inherits="M_Main.ChargesNew.PaymentBindingFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>缴费科目捆绑设置</title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 80%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <div class="Container">
        <div id="ContainerLeft" class="ContainerLeft">
            <iframe src="PaymentBindingLeft.aspx" id="PaymentBindingLeft" name="PaymentBindingLeft" style="border: none; width: 100%;"></iframe>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <iframe src="PaymentBindingRight.aspx" id="PaymentBindingRight" name="PaymentBindingRight" style="border: none; width: 100%;"></iframe>
        </div>
    </div>
    <script type="text/javascript">
        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width() * 0.20 - 1;
            $("#PaymentBindingLeft").css("width", w + "px");
            $("#PaymentBindingLeft").css("height", h + "px");
            $("#PaymentBindingRight").css("height", h + "px");
        }
        InitFunction();
    </script>
</body>
</html>
