<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrCodeModel.aspx.cs" Inherits="M_Main.QrCodeManage.QrCodeModel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/EquimentDictionaryCanNull.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/jquery.qrcode.js"></script>
    <script type="text/javascript" src="../jscript/excanvas.js"></script>
    <style type="text/css">
        #divContent {
            margin: 0px auto;
            width: 100%;
            margin-top: 10px;
        }

            #divContent .divcard {
                margin: auto 0px auto 0.5%;
                border: 1px #000000 solid;
                margin-top: 30px;
                width: 420px;
                height: 270px;
                margin-left: 130px;
            }

            #divContent div .divtitle {
                width: 100%;
                height: 55px;
                text-align:center;
                margin-top:15px;
            }

                #divContent div .divtitle label {
                    font-size: 26px;
                    font-weight: 400;
                }



        .divComm {
            width: 100%;
            height: 30px;
            margin-top: 0px;
        }

            .divComm .LabelC {
                margin-right: 30px;
                margin-left: 20px;
            }

            .divComm .LabelD {
                margin-left: 20%;
            }

        .divTable {
            width: 400px;
            height: 150px;
            margin-left: 10px;
        }

            .divTable table {
                width: 100%;
                height: 150px;
                background-color: #000000;
            }

                .divTable table tr {
                    font-size: 15px;
                    text-align: center;
                    BACKGROUND-COLOR: #ffffff;
                }

        .img {
            width: 100px;
            height: 95px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="divContent" runat="server">
            <%--<div class="divcard">
                <div class="divtitle">
                    <label>设备标识卡</label>
                </div>
                <div class="divComm">
                    <label class="LabelC">项目：时代大厦</label><label class="LabelD">2016/4/25</label>
                </div>
                <div class="divTable">
                    <table border="1" cellspacing="0">
                        <tr>
                            <td style="width: 16%;">设备名称</td>
                            <td style="width: 50%;">循环系统</td>
                            <td rowspan="4" style="width: 30%;">
                                <img class="img" src="../images/QrImgs/1000/20167795842.jpg" /></td>
                        </tr>
                        <tr>
                            <td>编号</td>
                            <td>KT007</td>
                        </tr>
                        <tr>
                            <td>安装位置</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>责任部门</td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>--%>
        </div>
        <input type="hidden" name="Id" id="Id" runat="server" />
        <script type="text/javascript">
            $(function () { loadQrCode(); });

            //延时加载二维码
            function loadQrCode() {
                var arr = $("#Id").val().split(',');
                for (var i = 0; i < arr.length; i++) {
                    $('#' + arr[i]).qrcode({
                        render: "canvas",
                        text: arr[i],
                        width: "100",               //二维码的宽度
                        height: "100",              //二维码的高度
                        background: "#ffffff",       //二维码的后景色
                        foreground: "#000000",        //二维码的前景色
                        src: null,             //二维码中间的图片
                    });
                }
            }

            function utf16to8(str) {
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

            function utf8to16(str) {
                var out, i, len, c;
                var char2, char3;

                out = "";
                len = str.length;
                i = 0;
                while (i < len) {
                    c = str.charCodeAt(i++);
                    switch (c >> 4) {
                        case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
                            // 0xxxxxxx
                            out += str.charAt(i - 1);
                            break;
                        case 12: case 13:
                            // 110x xxxx   10xx xxxx
                            char2 = str.charCodeAt(i++);
                            out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
                            break;
                        case 14:
                            // 1110 xxxx  10xx xxxx  10xx xxxx
                            char2 = str.charCodeAt(i++);
                            char3 = str.charCodeAt(i++);
                            out += String.fromCharCode(((c & 0x0F) << 12) |
                                ((char2 & 0x3F) << 6) |
                                ((char3 & 0x3F) << 0));
                            break;
                    }
                }

                return out;
            }
        </script>
    </form>
</body>
</html>

