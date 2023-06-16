<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyEventReportDetailPrint.aspx.cs" Inherits="M_Main.Emergency.EmergencyEventReportDetailPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急事件报告打印</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../jscript/jquery-1.8.2.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/excanvas.js"></script>
    <script type="text/javascript" src="../jscript/utf.js"></script>
    <style type="text/css">
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

        .w33 {
            padding: 0;
            margin: 0;
            width: 33%;
        }

        .w66 {
            padding: 0;
            margin: 0;
            width: 66%;
        }
    </style>
</head>
<body class="document">
    <input type="hidden" name="path" id="path" runat="server" />
    <input id="CommID" name="CommID" type="hidden" />
    <input id="PointId" name="PointId" type="hidden" />
    <div class="main">
        <h1>应急事件报告单</h1>
        <table class="baseinfo" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="w33">
                    <p>项目名称:&emsp;<label id="CommName"></label></p>
                </td>
                <td class="w33">
                    <p>应急类型:&emsp;<label id="EmergencyTypeName"></label></p>
                </td>
                <td class="w33">
                    <p>应急等级:&emsp;<label id="EmergencyLevelName"></label></p>
                </td>
            </tr>
        </table>
        <table class="baseinfo" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="w66">
                    <p>事件主题:&emsp;<label id="EventTheme"></label></p>
                </td>
                <td class="w33">
                    <p>事发时间:&emsp;<label id="EventTime"></label></p>
                </td>
            </tr>
        </table>
        <table class="baseinfo" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="w66">
                    <p>事发地点:&emsp;<label id="EventAddress"></label></p>
                </td>
                <td class="w33">
                    <p>报警时间:&emsp;<label id="PoliceTime"></label></p>
                </td>
            </tr>
        </table>
        <table class="baseinfo" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="w33">
                    <p>报警人:&emsp;<label id="PolicePeople"></label></p>
                </td>
                <td class="w33">
                    <p>接警时间:&emsp;<label id="AlarmTime"></label></p>
                </td>
                <td class="w33">
                    <p>伤/亡人数:&emsp;<label id="AlarmPeople"></label></p>
                </td>
            </tr>
        </table>
        <table class="baseinfo" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="w33">
                    <p>到场时间:&emsp;<label id="AttendanceTime"></label></p>
                </td>
                <td class="w66">
                    <p>处理人:&emsp;<label id="HandlePeople"></label></p>
                </td>
            </tr>
        </table>
        <p>其他现场人员：<label id="OtherHandlePeople"></label></p>
        <p>事发经过：<label id="EventAfter"></label></p>
        <p>采取措施：<label id="TakeSteps"></label></p>
        <p>已经造成或可能造成的损失：<label id="EventLoss"></label></p>
        <p>公司可能存在的责任及风险：<label id="EventRisk"></label></p>
        <p>后期跟进处理的意见和建议：<label id="EventProposal"></label></p>
        <p>现场图片</p>
        <div class="ImgDiv" style="width: 100%; min-height: 120px;"></div>
    </div>

    <div id="mian"></div>
    <script type="text/javascript">
        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        $(function () {
            var id = GetQueryString("ID");
            $.tool.DataGet('Emergency', 'GetEmergencyEventReportByID', "ID=" + id,
                function Init() {
                },
                function callback(_Data) {
                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        $('#CommName').text(varObjects[0].CommName);
                        $('#EmergencyTypeName').text(varObjects[0].EmergencyTypeName);
                        $('#EmergencyLevelName').text(varObjects[0].EmergencyLevelName);
                        $('#EventTheme').text(varObjects[0].EventTheme);
                        if (varObjects[0].EventTime != "") {
                            $('#EventTime').text(formatDate(varObjects[0].EventTime, 'yyyy-MM-dd HH:mm:ss'));
                        }
                        $('#EventAddress').text(varObjects[0].EventAddress);
                        if (varObjects[0].PoliceTime != "") {
                            $('#PoliceTime').text(formatDate(varObjects[0].PoliceTime, 'yyyy-MM-dd HH:mm:ss'));
                        }
                        $('#PolicePeople').text(varObjects[0].PolicePeople);
                        if (varObjects[0].AlarmTime != "") {
                            $('#AlarmTime').text(formatDate(varObjects[0].AlarmTime, 'yyyy-MM-dd HH:mm:ss'));
                        }
                        $('#AlarmPeople').text(varObjects[0].AlarmPeople);
                        if (varObjects[0].AttendanceTime != "") {
                            $('#AttendanceTime').text(formatDate(varObjects[0].AttendanceTime, 'yyyy-MM-dd HH:mm:ss'));
                        }
                        $('#HandlePeople').text(varObjects[0].HandlePeople);
                        if (varObjects[0].OtherHandlePeople != null) {
                            $('#OtherHandlePeople').text(varObjects[0].OtherHandlePeople);
                        }
                        if (varObjects[0].EventAfter != null && varObjects[0].EventAfter != "") {
                            var EventAfter = varObjects[0].EventAfter.replaceAll("/r/n", "<br/>").replaceAll("/r", "<br/>")
                            $('#EventAfter').html(EventAfter);
                        }
                        if (varObjects[0].TakeSteps != null && varObjects[0].TakeSteps != "") {
                            var TakeSteps = varObjects[0].TakeSteps.replaceAll("/r/n", "<br/>").replaceAll("/r", "<br/>")
                            $('#TakeSteps').html(TakeSteps);
                        }
                        if (varObjects[0].EventLoss != null && varObjects[0].EventLoss != "") {
                            var EventLoss = varObjects[0].EventLoss.replaceAll("/r/n", "<br/>").replaceAll("/r", "<br/>")
                            $('#EventLoss').html(EventLoss);
                        }
                        if (varObjects[0].EventRisk != null && varObjects[0].EventRisk != "") {
                            var EventRisk = varObjects[0].EventRisk.replaceAll("/r/n", "<br/>").replaceAll("/r", "<br/>")
                            $('#EventRisk').html(EventRisk);
                        }
                        if (varObjects[0].EventProposal != null && varObjects[0].EventProposal != "") {
                            var EventProposal = varObjects[0].EventProposal.replaceAll("/r/n", "<br/>").replaceAll("/r", "<br/>")
                            $('#EventProposal').html(EventProposal);
                        }
                        LoadImgFunc(id);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

            //加载图片
            function LoadImgFunc(id) {
                var parameterStr = {
                    KeyID: id,
                    Type: '应急事件报告'
                }
                $.dataPostJson('Emergency_File', 'GetListDataTable', parameterStr, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data) {
                            $.each(data, function (i, Item) {
                                $('.ImgDiv').append('<div style="position: relative;margin:5px;float: left;" id=\'' + Item.ID + '\' ><img style="width:90px;height:90px;cursor:pointer" src="' + Item.FilePath + '" ></div>');
                            });
                        }
                    },
                    function completeCallback() {

                    }, function errorCallback() {

                    });
            }
        });
    </script>
</body>
</html>
