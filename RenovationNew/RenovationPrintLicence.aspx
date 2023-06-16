<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationPrintLicence.aspx.cs" Inherits="M_Main.RenovationNew.RenovationPrintLicence" %>


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
            width: 633px;
            overflow: hidden;
            border-top: 1px #bbb dashed;
            border-left: 1px #bbb dashed;
            border-right: 0px #bbb dashed;
        }

            ul.imglist li {
                float: left;
                padding: 5px;
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

        .main {
            width: 649px;
            border: 0px solid #000000;
            margin: 0 auto;
            overflow: hidden;
            font-size: 12px;
        }

            .main h1 {
                text-align: center;
                font-size: 25px;
                font-weight: bold;
                line-height: 40px;
                padding: 10px 0;
            }

            .main p {
                line-height: 30px;
                font-weight: bold;
            }

                .main p.p_left {
                    text-align: right;
                }

                .main p.color {
                    color: #808080;
                    font-weight: normal;
                    text-indent: 2em;
                }

            .main label {
                font-weight: normal;
                text-decoration: underline;
            }

            .main p.indent2em {
                font-weight: normal;
                text-indent: 2em;
            }

            .main p.indent2 {
                font-weight: normal;
                text-indent: 50px;
            }

            .main div.context {
                min-height: 455px;
            }


        .baseinfo {
            width: 100%;
            margin: 0;
            padding: 0;
        }



            .baseinfo .logo1 {
                width: 200px;
            }

            .baseinfo .logo2 {
                width: 40px;
            }

            .baseinfo td.w50 {
                padding: 0;
                margin: 0;
                width: 50%;
            }

        table.lower {
            font-size: 13px;
        }

        p.lower {
            margin-top: 5px;
        }
    </style>
</head>
<body class="document">
    <input type="hidden" name="path" id="path" runat="server" />
    <input id="CommID" name="CommID" type="hidden" />
    <input id="PointId" name="PointId" type="hidden" />
    <div class="main">
        <table class="baseinfo" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="left" valign="top">
                    <img src="../images/logo2.png" class="logo1" /></td>
                <td align="right" valign="top">
                    <div id="QRCodesPath"></div>
                </td>
            </tr>
        </table>
        <h1>装饰装修施工许可证</h1>
        <p class="p_left">NO:&emsp;<label id="LicenceNum"></label></p>
        <p>一、装修单元:&emsp;门牌号(位置)<label id="RoomName"></label></p>
        <p>二、施工单位:&emsp;<label id="BuildCompany"></label></p>
        <table class="baseinfo" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="w50">
                    <p>三、施工负责人:&emsp;<label id="NewSiteLeadPerson"></label></p>
                </td>
                <td class="w50">
                    <p>联系电话:&emsp;<label id="NewSiteLeadPersonPhone"></label></p>
                </td>
            </tr>
        </table>
        <p>四、有效期限:&emsp;<label id="StartDate"></label></p>
        <p>
            五、施工单位:
        </p>
        <p class="indent2em">
            周一至周五：每天<label id="dt1">_______</label>至<label id="dt2">_______</label>和<label id="dt3">_______</label>至<label id="dt4">_______</label>（非法定节日）
        </p>
        <p class="indent2em">
            周六至周日：每天<label id="dt5">_______</label>至<label id="dt6">_______</label>和<label id="dt7">_______</label>至<label id="dt8">_______</label>（非法定节日） 
        </p>
        <p class="indent2em">
            周六、周日及节假日不得进行产生噪音或刺激性气味的施工（国家法定节假日期间暂停施工，物业服务中心特别通知时除外）	 	 	 	 	 	 	 	 	 	 	  
        </p>
        <p>六、核准装修项目:</p>
        <div id="RenovationContent" class="context">
        </div>
        <table class="baseinfo lower" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="w50">
                    <p>发证单位:&emsp;<label id="CommName"></label></p>
                </td>
                <td class="w50" style="text-align: right">
                    <p>日期:&emsp;<label id="AuditStatePassDate"></label></p>
                </td>
            </tr>
        </table>
        <p class="color lower">备注:1、本证必须张贴在户门显眼位置；2、本证内容不得涂改，以打印内容为准。</p>
    </div>

    <div id="mian"></div>
    <script type="text/javascript">
        function InitDataPrintDate() {
            $.dataPostJson('Renovation', 'GetModelPrintDate', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    if (!!data) {
                        $.setParam(data);
                    }

                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
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
            var id = $.getUrlParam("ID");
            $("#QRCodesPath").qrcode({
                render: "canvas",
                text: id,
                width: "75",               //二维码的宽度
                height: "75",              //二维码的高度
                background: "#ffffff",       //二维码的后景色
                foreground: "#000000",        //二维码的前景色
                src: "../images/logo.jpg",             //二维码中间的图片
                imgWidth: 10,
                imgHeight: 10
            });
            var param = {"ID":id};
            $.dataPostJson('Renovation', 'GetModelRenovation',param, true, false,
                function Init() {
                },
                function callback(data) {
                    data = data[0];
                    var array = data.RenovationContent.split(/[\r\n]/g);
                    var html = "";
                    $.each(array, function (i, val) { //两个参数，第一个参数表示遍历的数组的下标，第二个参数表示下标对应的值
                        //html += "<p class='indent2em'>" + (i + 1) + ".<label>" + val + "</label></p>";
                        html += "<p class='indent2em'><label>" + val + "</label></p>";
                    });
                    data.RenovationContent = html;
                    data.StartDate = $.dateFormat(data.StartDate, "yyyy年MM月dd日") + " 至 " + $.dateFormat(data.EstimateEndDate, "yyyy年MM月dd日");
                    data.CommName = data.CommName + "物业服务中心";
                    data.AuditStatePassDate = $.dateFormat(data.AuditStatePassDate, "yyyy年MM月dd日");
                    $.setParam(data);
                    InitDataPrintDate();
                    // $("#RenovationContent").html(html);
                },
                function completeCallback() {
                }, function errorCallback() {
                });


        });
    </script>
</body>
</html>
