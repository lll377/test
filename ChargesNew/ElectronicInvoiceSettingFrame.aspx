<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ElectronicInvoiceSettingFrame.aspx.cs" Inherits="M_Main.ChargesNew.ElectronicInvoiceSettingFrame" %>

<!DOCTYPE html>
<html>
<head>
    <title>费用科目设置</title>
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
            width: 75%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <div class="Container">
        <div id="ContainerLeft" class="ContainerLeft">
            <iframe src="ElectronicInvoiceSettingLeft.aspx" id="ElectronicInvoiceSettingLeft" name="ElectronicInvoiceSettingLeft" style="border: none; width: 100%;"></iframe>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <iframe src="ElectronicInvoiceSettingRight.aspx" id="ElectronicInvoiceSettingRight" name="ElectronicInvoiceSettingRight" style="border: none; width: 100%;"></iframe>
        </div>
    </div>
    <script type="text/javascript">
        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width() * 0.25 - 1;
            $("#ElectronicInvoiceSettingLeft").css("width", w + "px");
            $("#ElectronicInvoiceSettingLeft").css("height", h + "px");
            $("#ElectronicInvoiceSettingRight").css("height", h + "px");
        }
        InitFunction();
    </script>
</body>
</html>
