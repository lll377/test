<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpaceShowQrCode.aspx.cs" Inherits="M_Main.EquipmentNew.SpaceShowQrCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <%--<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>--%>
    <script type="text/javascript" src="../jscript/jquery-1.8.2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../jscript/qrcode.js"></script>
    <script type="text/javascript" src="../jscript/excanvas.js"></script>
</head>
<body>
    <input type="hidden" name="path" id="path" runat="server" />
    <form id="frmFrom">
        <div style="padding: 5px;">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">二维码:
                    </td>
                    <td class="text">
                        <div id="QRCodesPath"></div>
                    </td>
                </tr>
                <tr>
                    <td class="title">机房名称:
                    </td>
                    <td class="text">
                        <label id="SpaceName"></label>
                    </td>
                </tr>
                <tr>
                    <td class="title">设备系统:
                    </td>
                    <td class="text">
                        <label id="SystemIdName"></label>
                    </td>
                </tr>
                <tr>
                    <td class="title">机房地址:
                    </td>
                    <td class="text">
                        <p id="SpaceAddress"></p>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">

        $(function () {
            PageInit();
        });
        function PageInit() {
            var SpaceId = GetQueryString("SpaceId");
            var SpaceName = GetQueryString("SpaceName");
            var SystemIdName = GetQueryString("SystemIdName");
            var SpaceAddress = GetQueryString("SpaceAddress");

            $("#SpaceName").text(SpaceName);
            $("#SystemIdName").text(SystemIdName);
            $("#SpaceAddress").text(SpaceAddress);
            $('#QRCodesPath').qrcode({
                render: 'canvas',
                text: SpaceId,
                height: 200,
                width: 200,
                typeNumber: -1,			//计算模式
                correctLevel: QRErrorCorrectLevel.M,//纠错等级
                background: "#ffffff",	//背景颜色
                foreground: "#000000",	//前景颜色
                //logo图片地址
                src: "../images/logo.jpg",

            });
            //var qrcode = new QRCode("QRCodesPath", {
            //    text: SpaceId,
            //    width: 200,
            //    height: 200,
            //    colorDark: '#000000',
            //    colorLight: '#ffffff',
            //    correctLevel: QRCode.CorrectLevel.L,
            //    //二维码中心图片 
            //    iconSrc: "../images/logo.jpg",
            //    //二维码中心图片边框弧度 
            //    iconRadius: 5,
            //    //二维码中心图片边框宽度 
            //    iconBorderWidth: 1,
            //    //二维码中心图片边框颜色 
            //    iconBorderColor: "#ffffff"
            //});


        }
    </script>
</body>
</html>

