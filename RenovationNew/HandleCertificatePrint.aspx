<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleCertificatePrint.aspx.cs" Inherits="M_Main.RenovationNew.HandleCertificatePrint" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>装修许可证打印</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../jscript/jquery-1.8.2.js"></script>
    <%--<script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>--%>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <%--<script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>--%>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../jscript/excanvas.js"></script>
    <script type="text/javascript" src="../jscript/utf.js"></script>
    <script type="text/javascript" src="../jscript/jquery.qrcode.js"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>

    <!--media=print 这个属性可以在打印时有效-->
    <style media="print">
        .Noprint {
            display: none;
            height: 1px;
            border: none;
            border-top: 1px dashed white;
        }

        .PageNext {
            border: 1px dashed white;
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
            width: 732px;
            overflow: hidden;
            border-top: 1px #bbb dashed;
            border-left: 1px #bbb dashed;
            border-right: 0px #bbb dashed;
        }

            ul.imglist li {
                float: left;
                padding: 5px;
                margin: 0;
                width: 355px;
                height: 220px;
                border-bottom: 1px #bbb dashed;
                border-right: 1px #bbb dashed;
                list-style: none;
                overflow: hidden;
            }

                ul.imglist li p.title {
                    font-size: 14px;
                    font-weight: bold;
                    text-align: center;
                }

        label {
            font-weight: normal;
            text-decoration: underline;
        }

        .mtable {
            width: 100%;
            margin: 0;
            padding: 0;
        }

            .mtable tr {
                /*border:1px solid;*/
                margin: 0;
                padding: 0;
            }

            .mtable td {
                /*border:1px solid;*/
                padding: 0px;
                margin: 0;
                vertical-align: top;
            }

                .mtable td.f1 {
                    font-size: 14px;
                    font-weight: bold;
                }

                .mtable td.text-center {
                    text-align: center;
                }

                .mtable td div.mtitle {
                    width: 270px;
                    height: 80px;
                    font-size: 18px;
                    font-weight: bold;
                    line-height: 26px;
                    text-align: center;
                    overflow: hidden;
                }


                .mtable td.title {
                    /*max-width: 95px;
                    overflow:hidden;*/
                }

                .mtable td.content {
                    padding-left: 5px;
                }

            .mtable tr td canvas {
                width: 80px;
                height: 80px;
            }

            .mtable .head {
                width: 80px;
                height: 96px;
                border: 1px solid #000000;
                padding: 1px;
                margin: 0px;
            }
    </style>
</head>
<body class="document">
    <div id="mian"></div>
    <script type="text/javascript">
        $(function () {
            var id = $.getUrlParam("ID");
            var main = $.getUrlParam("Main");
            if (main == 0) {
                var param = { "ID": id };
                $.dataPostJson('Renovation', 'GetListHandleCertificateDataTable', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        var html = "";
                        $.each(data, function (i, item) {
                            if (i % 8 == 0) {
                                html += "<ul class=\"imglist\">";
                            }
                            html += "<li><table class=\"mtable\"><tr><td><div class=\"mtitle\"><p>" + item.CommName + "服务中心装修人员</p><p>"+item.OutEnterCertificateName+"</p></div></td><td><div id=\"qrcode" + item.ID + "\">";
                            html += "</div ></td ></tr ></table > <table class=\"mtable\"><tr><td class=\"title text-center\"><img class=\"head\"src=\"" + item.Photo + "\"/></td>";
                            html += "<td class=\"content\">姓名:<label>" + item.Name + "</label><br/>公司:<label>" + item.BuildCompany + "</label><br/>装修单元:<label>" + item.RoomSign + "</label><br/>";
                            html += "有效期: <label>" + $.dateFormat(item.CertificateStartDate, "yyyy年MM月dd日") + "</label>至<label>" + $.dateFormat(item.CertificateEndDate, "yyyy年MM月dd日") + "</label></td></tr>";
                            html += "<tr><td class=\"title text-center\">NO:<label>" + item.OutEnterCertificateNum + "</label></td> <td class=\"f1 text-center\"><%=LoginCorpName%></td></tr></table></li>";
                            if ((i > 0 && i % 8 == 7) || (i + 1) == data.length) {
                                html += "</ul><div class=\"Noprint\"></div><div class=\"PageNext\"></div>";
                            }
                        });
                        $("#mian").html(html);
                        $.each(data, function (i, item) {
                            $("#qrcode" + item.ID).qrcode({
                                render: "canvas",
                                text: item.ID,
                                width: "200",               //二维码的宽度
                                height: "200",              //二维码的高度
                                background: "#ffffff",       //二维码的后景色
                                foreground: "#000000",        //二维码的前景色
                                src: "../images/logo.jpg",             //二维码中间的图片
                                imgWidth: 50,
                                imgHeight: 50
                            });
                        });
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            } else {
                var param = { "ID": $.getUrlParam("TemplateID") };
                $.dataPostJson('Renovation_HandleCertificateTemplate', 'GetModel', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        var array, html = "", htmlLi;
                        for (var i = 0; i < id.split(',').length; i++) {
                            if (i % 8 == 0) {
                                html += "<ul class=\"imglist\">";
                            }
                            array = data.Content.split(/[\r\n]/g);
                            htmlLi = "";
                            $.each(array, function (i, val) {
                                htmlLi += "<p>" + val + "</p>";
                            });
                            html += "<li><p class=\"title\">使用须知</p>" + htmlLi + "</li>";
                            // console.log(i + ":" + (i > 0 && i % 8 == 0));
                            if ((i > 0 && i % 8 == 7) || (i + 1) == id.split(',').length) {
                                html += "</ul><div class=\"Noprint\"></div><div class=\"PageNext\"></div>";
                                console.log(html);
                            }
                        }
                        //console.log(html);
                        $("#mian").html(html);
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }

        });
    </script>
</body>
</html>
