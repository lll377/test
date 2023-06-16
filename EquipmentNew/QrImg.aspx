<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrImg.aspx.cs" Inherits="M_Main.EquipmentNew.QrImg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <%--<script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>--%>
      <script type="text/javascript" src="../jscript/jquery-1.8.2.js"></script>
    <%--<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>--%>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
     <script type="text/javascript" src="../jscript/qrcode.js"></script>
    <script type="text/javascript" src="../jscript/excanvas.js"></script>
    <style type="text/css">
        img {
            width: 200px;
            height: 200px;
            margin: auto 0px;
        }
    </style>
</head>
<body>
    <form id="frmFrom">
        <div style="padding: 5px;">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">二维码:
                    </td>
                    <td class="text">
                        <div id="QRCodesPath"></div>
                        <%--<img src="#" alt="" id="QrImages" runat="server" />--%>
                    </td>
                </tr>
                <tr>
                    <td class="title">项目:
                    </td>
                    <td class="text">
                        <label id="CommName" runat="server"></label>
                    </td>
                </tr>
                <tr>
                    <td class="title">设备名称:
                    </td>
                    <td class="text">
                        <label id="EquipmentName" runat="server"></label>
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
            var KeyId = GetQueryStringDecodeURI("KeyId");
            var CommName = GetQueryStringDecodeURI("CommName");
            console.log(GetQueryStringDecodeURI("CommName"));
            var EquipmentName = GetQueryStringDecodeURI("EquipmentName");

            $("#CommName").text(CommName);
            $("#EquipmentName").text(EquipmentName);
             $('#QRCodesPath').qrcode({
                render: 'canvas',
                text: KeyId,
                height: 200,
                width: 200,
                typeNumber: -1,			//计算模式
                correctLevel: QRErrorCorrectLevel.M,//纠错等级
                background: "#ffffff",	//背景颜色
                foreground: "#000000",	//前景颜色
                //logo图片地址
                src: "../images/logo.jpg",

            });


        }
    </script>
</body>
</html>

