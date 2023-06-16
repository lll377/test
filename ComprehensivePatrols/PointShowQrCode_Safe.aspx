<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PointShowQrCode_Safe.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PointShowQrCode_Safe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
     <script type="text/javascript" src="../jscript/utf.js"></script>
    <script type="text/javascript" src="../jscript/jquery.qrcode.js"></script>
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
                    <td class="title">点位编号:
                    </td>
                    <td class="text">
                        <label id="PointCode"></label>
                    </td>
                </tr>
                <tr>
                    <td class="title">点位名称:
                    </td>
                    <td class="text">
                        <label id="PointName"></label>
                    </td>
                </tr>
                <tr>
                    <td class="title">点位地址:
                    </td>
                    <td class="text">
                        <p id="Addr"></p>
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

            var PointId = GetQueryString("PointId");
            var PointCode = GetQueryString("PointCode");
            var PointName = GetQueryString("PointName");
            $("#PointCode").text(PointCode);
            $("#PointName").text(PointName);
            var Addr = GetQueryString("Addr");

            //$('#QRCodesPath').qrcode({
            //    render: 'canvas',
            //    text: PointId,
            //    height: 200,
            //    width: 200,
            //    typeNumber: -1,			//计算模式
            //    correctLevel: QRErrorCorrectLevel.M,//纠错等级
            //    background: "#ffffff",	//背景颜色
            //    foreground: "#000000",	//前景颜色
            //    src: "../images/logo.jpg"
            //});

            $("#QRCodesPath").qrcode({
                render: "canvas",
                text: PointId,
                width: "200",               //二维码的宽度
                height: "200",              //二维码的高度
                background: "#ffffff",       //二维码的后景色
                foreground: "#000000",        //二维码的前景色
                src: "../images/logo.jpg",             //二维码中间的图片
                imgWidth: 50,
                imgHeight: 50
            });

            $("#Addr").text(Addr);

        }

        function utf16to8(str) { //转码
            var out, i, len, c;
            out = "";
            len = str.length;
            for (i = 0; i < len; i++) {
                c = str.charCodeAt(i);
                if ((c >= 0x0001) && (c <= 0x007F)) {
                    out += str.charAt(i);
                } else if (c > 0x07FF) {
                    out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
                    out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
                    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
                } else {
                    out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
                    out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
                }
            }
            return out;
        }
    </script>
</body>
</html>

