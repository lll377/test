﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRPrint.aspx.cs" Inherits="M_Main.ComprehensivePatrols.QRPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>二维码打印</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../jscript/jquery-1.8.2.js"></script>

    <%--<script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>--%>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/excanvas.js"></script>
    <script type="text/javascript" src="../jscript/qrcode.js"></script>

    <!--media=print 这个属性可以在打印时有效-->
    <style media="print">
        .Noprint {
            display: none;
            height: 1px;
            border: none;
            border-top: 1px dashed #fff;
        }

        .PageNext {
            page-break-after: always;
        }
    </style>

    <style>
        .datagrid-mask-msg {
            height: 20px;
        }

        ul.imglist {
            margin: 10px auto;
            padding: 0px;
            width: 633px;
            overflow: hidden;
            border-top: 1px #bbb dashed;
            border-left: 1px #bbb dashed;
            border-right: 0px #bbb dashed;
        }

            ul.imglist li {
                float: left;
                padding: 5px;
                padding-top: 15px;
                margin: 0;
                width: 200px;
                height: 310px;
                border-bottom: 1px #bbb dashed;
                border-right: 1px #bbb dashed;
                list-style: none;
                overflow: hidden;
            }

                ul.imglist li hr {
                    margin: 4px;
                    border: 0px dashed #cccccc;
                    width: 200px;
                }

                ul.imglist li canvas {
                    margin: 0 auto;
                    display: block;
                    width: 160px;
                    height: 160px;
                    border: 0px #f00 solid;
                    overflow: hidden;
                }

                ul.imglist li img.logo {
                    width: 100px;
                    height: 45px;
                }

                ul.imglist li span {
                    display: block;
                    width: 160px;
                    word-wrap: break-word;
                    border: 0px #f00 solid;
                    font-size: 12px;
                    text-align: left;
                    padding-left: 20px;
                    /*overflow: hidden;
                    white-space: nowrap;
                    text-overflow: ellipsis;*/
                }
    </style>
</head>
<body class="document">
    <div id="11"></div>
    <input type="hidden" name="path" id="path" runat="server" />
    <input id="CommID" name="CommID" type="hidden" />
    <input id="CommName" name="CommName" type="hidden" runat="server"/>
    <input id="PointId" name="PointId" type="hidden" />
    <div id="mian"></div>
    <script type="text/javascript">
        //截取字符串
        function intercept(val) {
            //if (str && str != "") {
            //    if (val.length > 20) {
            //        val = val.substring(0, 20) + "...";
            //    }
            //}
            return val;
        }
        $(function () {
            var PointId = Cache.GetData("PointIdList");
            var CommID = Cache.GetData("PointCommID");
            $("#PointId").val(PointId);
            $("#CommID").val(CommID);
            console.log(PointId);
            console.log(CommID);
            //var logo = "JWlogo.jpg";
            $.tool.DataPostJson('CpComPatrols', 'GetListDataTablebProjectPoint', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    //console.log(data);
                    var strHtml = "";
                    $.each(data, function (i, item) {
                        if (i % 9 == 0) {
                            strHtml += "<ul class=\"imglist\">";
                        }
                        if ($("#CommName").val() == "") {
                            strHtml += "<li><div id='" + item.PointId + "'  ></div><hr><span>编码:" + item.PointCode + "</span><span>名称:" + intercept(item.PointName) + "</span><span>地址:" + intercept(item.Addr) + "</span></li>";
                        } else {
                            strHtml += "<li><div id='" + item.PointId + "'  ></div><hr><span>项目:" + intercept(item.CommName) + "</span><span>编码:" + item.PointCode + "</span><span>名称:" + intercept(item.PointName) + "</span><span>地址:" + intercept(item.Addr) + "</span></li>";
                        }
                        if (i % 9 == 8) {
                            strHtml += "</ul>";
                            strHtml += "<hr align=\"center\" width=\"1%\" size=\"1\" noshade class=\"NOPRINT\">";
                            strHtml += "<div class=\"PageNext \"></div>";
                        }
                    });
                    if (data.length < 8) {
                        strHtml += "</ul>";
                        strHtml += "<hr align=\"center\" width=\"1%\" size=\"1\" noshade class=\"NOPRINT\">";
                        strHtml += "<div class=\"PageNext NOPRINT\"></div>";
                    }
                    // console.log(strHtml);
                    $("#mian").html(strHtml);
                    setTimeout(loadQrCode(data), 1500);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        });

        //延时加载二维码
        function loadQrCode(data) {
            $.each(data, function (i, item) {
                if (i == 0) {
                    $.messager.progress({
                        title: '温馨提示',
                        msg: '正在生成二维码,请稍候...',
                        interval: 2000
                    });
                }

                $('#' + item.PointId).qrcode({
                    render: 'canvas',
                    text: item.PointId,
                    height: 200,
                    width: 200,
                    typeNumber: -1,			//计算模式
                    correctLevel: QRErrorCorrectLevel.M,//纠错等级
                    background: "#ffffff",	//背景颜色
                    foreground: "#000000",	//前景颜色
                    //logo图片地址
                    src: "../images/logo.jpg",

                });
                //var qrcode = new QRCode(item.PointId, {
                //    text: item.PointId,
                //    width: 160,
                //    height: 160,
                //    colorDark: '#000000',
                //    colorLight: '#ffffff',
                //    correctLevel: QRCode.CorrectLevel.H,
                //    //二维码中心图片 
                //    iconSrc: "../images/logo.jpg",
                //    //二维码中心图片边框弧度 
                //    iconRadius: 5,
                //    //二维码中心图片边框宽度 
                //    iconBorderWidth: 1,
                //    //二维码中心图片边框颜色 
                //    iconBorderColor: "#ffffff"
                //});
                if (data.length == (i + 1)) {
                    $.messager.progress('close');
                }
            });

        }
    </script>
</body>
</html>
