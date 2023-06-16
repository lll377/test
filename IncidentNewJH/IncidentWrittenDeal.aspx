<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentWrittenDeal.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentWrittenDeal" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>


    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script src="../editor/kindeditor.js" type="text/javascript"></script>

    <script src="../editor/plugins/code/prettify.js" type="text/javascript"></script>
    <link href="../editor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>




    <style>
        .TdTitle {
            width: 10%;
        }

        input:disabled, textarea:disabled {
            border: 1px solid #DDD;
            background-color: #F5F5F5;
            color: #ACA899;
        }

        .textbox .textbox-text {
            padding: 0;
        }

        .noBorder input[type="text"] {
            border: none;
        }
    </style>
</head>
<body onload="Win_OnLoad()" style="overflow-y: scroll;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="IncidentID" name="IncidentID" runat="server" />
        <input type="hidden" id="CustID" name="CustID" runat="server" />
        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
        <input type="hidden" id="UserName" name="UserName" runat="server" />

        <input style="width: 8px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server" />
        <table id="Table3" class="DialogTable">
            <tr>
                <td height="3">
                    <table style="font-size: 12px" id="TablePrint" class="SchTable" cellspacing="0" cellpadding="0"
                        width="100%" runat="server">
                        <tr>
                            <td colspan="4" align="right" style="padding-right: 123px;">
                                <input id="btnAssignmentPrint" name="btnAssignmentPrint" onserverclick="btnAssignmentPrint_ServerClick" class="button" value="打印派工单" type="button" runat="server">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <table class="DialogTable" align="center" style="width: 100%">
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事受理</td>
            </tr>
            <tr>
                <td class="TdTitle">报事类型：
                </td>
                <td class="TdContent">
                    <input id="DrClass" type="text" value="" disabled />
                </td>
                <td class="TdTitle">报事方式：
                </td>
                <td class="TdContent">
                    <input id="IncidentMode" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事来源：
                </td>
                <td class="TdContent">
                    <input id="IncidentSource" type="text" value="" disabled />
                </td>
                <td class="TdTitle">报事位置：
                </td>
                <td class="TdContent">
                    <input id="IncidentPlace" type="text" value="" disabled runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事编号：
                </td>
                <td class="TdContent">
                    <input id="IncidentNum" type="text" value="" disabled />
                </td>
                <td class="TdTitle">是否投诉：
                </td>
                <td class="TdContent">
                    <input id="IsTousu" type="text" value="" disabled />
                </td>
            </tr>
            <tr id="huwai">
                <td class="TdTitle">公区名称：
                </td>
                <td class="TdContent">
                    <input id="RegionalPlace" type="text" style="width: 15%;" value="" disabled />&nbsp;&nbsp;公区方位：
                    <input id="LocalePositionName" type="text" style="width: 15%;" value="" disabled />&nbsp;&nbsp;公区功能：
                    <input id="LocaleFunctionName" type="text" style="width: 15%;" value="" disabled />
                </td>
                <td class="TdTitle">设备：
                </td>
                <td class="TdContent noBorder">
                    <input type="text" class="easyui-searchbox" disabled style="width: 76%; border: 0;" id="EquipmentName" name="EquipmentName" searcher="SelTaskEqName" />
                    <input id="EqId" type="hidden" value="" />
                </td>
            </tr>
            <tr id="hunei">
                <td class="TdTitle">房屋编号：
                </td>
                <td class="TdContent">
                    <input id="RoomSign" type="text" value="" disabled />
                </td>
                <td class="TdTitle">客户名称：
                </td>
                <td class="TdContent">
                    <input id="CustName" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报事人：
                </td>
                <td class="TdContent">
                    <input id="IncidentMan" type="text" value="" disabled />
                </td>

                <td class="TdTitle">报事电话：
                </td>
                <td class="TdContent">
                    <input id="Phone" type="text" value="" disabled />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">报事内容：
                </td>
                <td class="TdContent" colspan="5">
                    <textarea id="IncidentContent" style="width: 89%;" disabled></textarea>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">报事责任：
                </td>
                <td class="TdContent">
                    <input type="radio" id="IncidentDuty1" name="IncidentDuty" value="物业类" disabled /><label for="IncidentDuty1">物业类</label>
                    <input type="radio" id="IncidentDuty" name="IncidentDuty" value="地产类" disabled /><label for="IncidentDuty">地产类</label>
                </td>
                <td class="TdTitle">报事类别:
                </td>
                <td class="TdContent noBorder">
                    <input type="text" class="easyui-searchbox" style="width: 76%; border: 0;" id="TypeName" name="TypeName" searcher="SelTypeName" runat="server" disabled />
                    <input id="BigCorpTypeID" type="hidden" name="BigCorpTypeID" />
                    <input id="BigCorpTypeCode" type="hidden" name="BigCorpTypeCode" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">预约处理时间:
                </td>
                <td class="TdContent">
                    <input id="ReserveDate" type="text" value="" disabled />
                </td>
                <td class="TdTitle">是否收费
                </td>
                <td class="TdContent">
                    <input id="IsFees1" type="radio" value="1" name="IsFees" runat="server" disabled="disabled" />是
                                                    <input id="IsFees2" type="radio" value="0" name="IsFees" runat="server" disabled="disabled" />否
                                                    <input type="hidden" id="hiIsFees" name="hiIsFees" runat="server" />
                </td>

            </tr>
            <tr>
                <td class="TdTitle">受理时间:</td>
                <td class="TdContent">
                    <input id="IncidentDate" disabled name="IncidentDate" runat="server" />
                </td>
                <td class="TdTitle">受 理 人: </td>
                <td class="TdContent">
                    <input id="AdmiMan" disabled name="AdmiMan" runat="server" />
                </td>
            </tr>

            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事分派</td>
            </tr>
            <tr>

                <td class="TdTitle">派工单号:
                </td>
                <td class="TdContent">
                    <input id="CoordinateNum" type="text" value="" disabled />
                </td>
                <td class="TdTitle">分 派 人: </td>
                <td class="TdContent">
                    <input id="DispMan" disabled name="DispMan" runat="server" />
                </td>


            </tr>
            <tr>
                <td class="TdTitle">分派时间:</td>
                <td class="TdContent">
                    <input id="DispDate" disabled name="DispDate" runat="server" />
                </td>
                <td class="TdTitle">逾期时间: </td>
                <td class="TdContent">
                    <input id="ReserveDealDate" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">责任人: </td>
                <td class="TdContent">
                    <input id="DealMan" type="text" value="" disabled /></td>
                <td class="TdTitle">协助人: </td>
                <td class="TdContent">
                    <input type="text" id="CoorganizerUserList" disabled /></td>
            </tr>
            <tr>
                <td class="TdTitle">分派备注：
                </td>
                <td class="TdContent" colspan="5">
                    <textarea id="DispRemarks" style="width: 89%;" disabled></textarea>
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事处理</td>
            </tr>

            <tr>
                <td class="TdTitle">接单时间：
                </td>
                <td class="TdContent">
                    <input type="text" id="ReceivingDate" disabled />
                </td>
                <td class="TdTitle">到场时间：
                </td>
                <td class="TdContent">
                    <input id="ArriveData" type="text" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">处理时限：
                </td>
                <td class="TdContent">
                    <input type="text" id="DealLimit" disabled runat="server" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>

            </tr>
            <%-- <tr>
                <td class="TdTitle">原因细类：
                </td>
                <td class="TdContent noBorder">
                    <input type="text" class="easyui-searchbox easyui-validatebox" data-options="required:true" style="width: 76%; border: 0;" id="FineTypeName" name="FineTypeName" searcher="SelFineTypeName" />
                    <input id="FineTypeID" type="hidden" name="FineTypeID" />
                    <input id="FineTypeCode" type="hidden" name="FineTypeCode" />
                </td>
                <td class="TdTitle">额定工时：
                </td>
                <td class="TdContent">
                    <input id="RatedWorkHour" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">绩效系数：
                </td>
                <td class="TdContent">
                    <input id="KPIRatio" type="text" value="" disabled />
                </td>
                <td class="TdTitle">完成数量：
                </td>
                <td class="TdContentSearch">
                    <input id="RatedWorkHourNumber" type="text" value="1" disabled />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">处理情况：
                </td>
                <td class="TdContent" colspan="5">
                    <textarea id="DealSituation" class="easyui-validatebox" data-options="required:true" style="width: 89%;"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">逾期原因：
                </td>
                <td class="TdContent noBorder">
                    <select id="OverdueReason" class="easyui-combobox" runat="server" style="width: 76%; border: 0;">
                        <option value=""></option>
                    </select>
                </td>
                <td class="TdTitle">是否收费：
                </td>
                <td class="TdContent">
                    <input type="radio" id="IsFrees" name="IsFrees" value="1" disabled /><label for="IsFrees">是</label>
                    <input type="radio" id="IsFrees1" name="IsFrees" value="0" disabled /><label for="IsFrees1">否</label>
                    <input type="button" class="button" value="费用输入" id="btnFees" style="width: 80px; height: 25px" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">收费金额：
                </td>
                <td class="TdContent">
                    <input id="DueAmount" type="text" value="" disabled />
                </td>
                <td class="TdTitle">实签人：
                </td>
                <td class="TdContent">
                    <input id="" type="text" value="" />
                </td>
            </tr>
            <tr style="display: none;">
                <td class="TdTitle">是否完成：
                </td>
                <td class="TdContent">
                    <input type="radio" id="IsFinish" name="IsFinish" value="1" checked /><label for="IsFinish">是</label>
                    <input type="radio" id="IsFinish1" name="IsFinish" value="0" /><label for="IsFinish1">否</label>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">完成时间：
                </td>
                <td class="TdContent">
                    <input id="MainEndDate" type="text" value="" runat="server" disabled />
                </td>
                <td class="TdTitle">完成操作人：
                </td>
                <td class="TdContent">
                    <input id="FinishMan" type="text" value="" runat="server" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle" id="imageTitle">照片<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage()">(上传)</a> ：
                </td>
                <td id="ImageContent" class="TdContent" colspan="3"></td>

            </tr>
            <tr>
                <td class="TdTitle">附件<a id="UpFile" style="color: #688aed; cursor: pointer;" onclick="UploadFile()">(上传)</a>：
                </td>
                <td class="TdContent" colspan="3">
                    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>

            </tr>--%>

            <tr>
                <td class="TdTitle" id="imageTitle">照片<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage()">(上传)</a> ：
                </td>
                <td id="ImageContent" class="TdContent" colspan="3"></td>

            </tr>
            <tr>
                <td class="TdTitle">附件<a id="UpFile" style="color: #688aed; cursor: pointer;" onclick="UploadFile()">(上传)</a>：
                </td>
                <td class="TdContent" colspan="3">
                    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="6" class="DialogTdSubmit" style="text-align: center; padding-top: 15px;">
                    <input type="button" class="button" value="跟 进" id="btngj" style="margin-right: 20px;" />
                    <input type="button" class="button" value="转 发" id="btnzf" style="margin-right: 20px;" />
                    <input type="button" class="button" value="协 助" id="btnXZ" style="margin-right: 20px;" />
                    <input type="button" class="button" value="延 期" id="btnYQ" style="margin-right: 20px;" />
                    <input type="button" class="button" value="免 费" id="btnMF" style="margin-right: 20px;" />
                    <input type="button" class="button" value="完 成" id="btnsave" style="margin-right: 20px;" />
                    <input type="button" class="button" value="放弃返回" id="BtnReturn" style="margin-right: 20px;" />
                </td>
            </tr>
        </table>
        <div style="height: 300px;">
            <iframe id="IncidentFrame" style="width: 100%; height: 100%; border: none;" class="Frm"></iframe>
        </div>
        <script type="text/javascript">


            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;

                if (strPrintParms != "") {
                    //alert(strPrintParms);			
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                }
            }

            //选择设备
            function SelTaskEqName() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/EquipmentChoiceDlg.aspx', '选择设备', false, function callback(_Data) {
                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $('#EqId').val(data.Id);
                        $('#EquipmentName').searchbox('setValue', data.EquipmentName);
                    }
                });
            }
            //报事大类
            function SelTypeName() {
                HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeBigDlg.aspx?ClassID=1&Duty=' + $('input[name="IncidentDuty"]').filter(':checked').val() + '&IsCheck=1&IsEdit=true', '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#BigCorpTypeID").val(arrRet.id);
                    $("#BigCorpTypeCode").val(arrRet.code);
                    $("#TypeName").searchbox("setValue", arrRet.TypeName);
                    $('#IsTousu').val(parseInt(arrRet.IsTouSu) == 1 ? '是' : '否');
                    if (obj.IncidentPlace == '户内') {
                        $("#DealLimit").val(arrRet.DealLimit);
                    } else if (obj.IncidentPlace == '公区') {
                        $("#DealLimit").val(arrRet.DealLimit2);
                    }
                });
            }
            //报事细类
            //function SelFineTypeName() {
            //    if ($("#TypeName").searchbox("getValue") == "") {
            //        HDialog.Info('请先选择报事类别');
            //    }
            //    else {
            //        HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeFineDlg.aspx?TypeCode=' + $("#BigCorpTypeCode").val() + '&IsCheck=1&IsEdit=true', '选择报事细类', false, function callback(_Data) {
            //            var arrRet = JSON.parse(_Data);
            //            $("#FineTypeID").val(arrRet.id);
            //            $("#FineTypeCode").val(arrRet.code);
            //            $("#FineTypeName").searchbox("setValue", arrRet.TypeName);
            //            $("#RatedWorkHour").val(arrRet.RatedWorkHour1);
            //            $("#KPIRatio").val(arrRet.KPIRatio1);
            //        });
            //    }
            //}
            //转发
            $("#btnzf").click(function () {
                var url = '../IncidentNewJH/IncidentProcessingTransmit.aspx?IncidentID=' + obj.IncidentID + "&DrClass=" + obj.DrClass + "&BigCorpTypeID=" + obj.BigCorpTypeID +
                    "&TypeName=" + obj.BigTypeName + "&IncidentDuty=" + obj.Duty + "&DealMan=" + obj.DealMan + "&UserCodes=" + obj.DealManCode + "&IncidentPlace=" + obj.IncidentPlace;
                HDialog.Open('700', '380', url, '报事转发', false, function callback(_Data) {
                    if (_Data) {
                        HDialog.Close(1);
                    }
                });
            });
            //跟进
            $("#btngj").click(function () {
                var url = '../IncidentNewJH/IncidentFollowUp.aspx?IncidentID=' + obj.IncidentID + "&Achieve=" + obj.IsBeoverdue + "&gjType=deal";
                HDialog.Open('700', '380', url, '报事跟进', false, function callback(_Data) {
                    if (_Data == 1) {
                        HDialog.Close(1);
                        //$('#IncidentFrame').attr('src', '../IncidentNewJH/ProcessingManageFooter.aspx?IncidentID=' + IncidentID.value + "&OpType=BSCL");
                    }
                });
            });
            //放弃返回
            $("#BtnReturn").click(function () {
                HDialog.Close();
            });
            //协助
            $("#btnXZ").click(function () {
                var w = 1000;
                var h = 300;
                HDialog.Open(w, h, '../IncidentNewJH/IncidentAssistManageDetail.aspx?id=&IncidentID=' + obj.IncidentID + '&OpType=insert&DealUserCode=' + obj.DealManCode + '&IncidentNum=' + obj.IncidentNum + '&CoordinateNum=' + obj.CoordinateNum + '&CommName=' + obj.CommName + '&TypeID=' + obj.TypeID, "报事协助申请", true, function callback(_Data) {
                    if (_Data != '') {
                    }
                });
            });
            //延期
            $('#btnYQ').click(function () {
                var w = 1000;
                var h = 500;
                HDialog.Open(w, h, '../IncidentNewJH/IncidentDelayApplyManageDetail.aspx?id=&IncidentID=' + obj.IncidentID + '&OpType=insert', "报事延期申请", true, function callback(_Data) {
                    if (_Data != "") {
                    }
                });
            });
            //免费
            $('#btnMF').click(function () {
                var IsFees = $("#hiIsFees").val();
                if (IsFees == '1') {
                    //收费工单费用是否收取
                    $.tool.DataGet('IncidentCheckPost', 'CheckIncidentFees', 'IncidentID=' + obj.IncidentID,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "false") {
                                HDialog.Info("费用已收取，不允许免费");
                            } else if (_Data == "false2") {
                                HDialog.Info("没有待收费费用");
                            }
                            else {
                                var w = 1000;
                                var h = 500;
                                HDialog.Open(w, h, '../IncidentNewJH/IncidentFreeApplyManageDetail.aspx?id=&IncidentID=' + obj.IncidentID + '&OpType=insert', "报事免费申请", true, function callback(_Data) {
                                    if (_Data != "") {
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    HDialog.Info("收费工单才能进行次操作");
                }
            });
            //输入费用
            //$("#btnFees").click(function () {
            //    HDialog.Open('900', '450', "../ChargesNew/FeesSporadicManage.aspx?CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').val() + "&RoomID=" + $('#RoomID').val() + "&RoomSign=" + $('#RoomSign').val() + "&IncidentID=" + $('#IncidentID').val() + "&CoordinateNum=" + $('#CoordinateNum').val() + "&IncidentDate=" + $('#IncidentDate').val(), '新增费用', false, function callback(_Data) {
            //        if (_Data != "") {
            //            //加载基本信息
            //            $.tool.DataGet('IncidentProcessingNew', 'GetIncidentInfo', "IncidentID=" + obj.IncidentID,
            //                function Init() {
            //                },
            //                function callback(_Data) {
            //                    _Data = JSON.parse(_Data);
            //                    if (_Data.total > 0) {
            //                        obj = _Data.rows[0];
            //                        $('#DueAmount').val(obj.DueAmount);
            //                        if (parseFloat(obj.DueAmount) > 0) {
            //                            $('#IsFrees').attr("checked", "checked");
            //                        }
            //                        else {
            //                            $('#IsFrees1').attr("checked", "checked");
            //                        }

            //                    }
            //                },
            //                function completeCallback() {
            //                },
            //                function errorCallback() {
            //                });
            //        }

            //    });
            //});
            //选择报事责任清空报事类别
            $("input[name='IncidentDuty']").click(function () {
                $("#TypeName").searchbox("setValue", "");
                //$("#FineTypeName").searchbox("setValue", "");
                $('#BigCorpTypeID').val("");
                //$('#FineTypeID').val("");
                $("#BigCorpTypeCode").val('');
                //$("#FineTypeCode").val('');
            })
            //是否完成
            //$("input[name='IsFinish']").click(function () {
            //    var id = $(this).attr("id");
            //    if (id == "IsFinish") {
            //        isFinish = '1'
            //        $("#MainEndDate").val(getNowFormatDate());
            //        $("#FinishMan").val($('#UserName').val());
            //    }
            //    else {
            //        $("#MainEndDate").val('');
            //        $("#FinishMan").val('');
            //        isFinish = '0'
            //    }
            //})
            function getNowFormatDate() {
                var date = new Date();
                var seperator1 = "/";
                var seperator2 = ":";
                var month = date.getMonth() + 1;
                var strDate = date.getDate();
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (strDate >= 0 && strDate <= 9) {
                    strDate = "0" + strDate;
                }
                var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                    + " " + date.getHours() + seperator2 + date.getMinutes()
                    + seperator2 + date.getSeconds();
                return currentdate;
            }
            //完成
            $("#btnsave").click(function () {

                var title = "报事完成";
                var w = $(window).width();
                var h = $(window).height();
                Cache.SetData("IncidentDeals", JSON.stringify(obj));

                var url = '../IncidentNewJH/IncidentProcessingFinish.aspx?IncidentID=' + obj.IncidentID;
                HDialog.Open(w, h, url, title, false, function callback(_Data) {
                    if (_Data == 1) {
                        HDialog.Close(1);
                    }
                });
            });
            //var isFinish = '1';
            //$("#btnsave").click(function () {
            //    //报事内容
            //    var content = $('#IncidentContent').val();
            //    if (!content) {
            //        HDialog.Info("请输入报事内容");
            //        return;
            //    }
            //    if (content.lenght > 1000) {
            //        HDialog.Info("报事不能大于1000个字");
            //        return;
            //    }
            //    //设备Id
            //    var eqId = $("#EqId").val();
            //    //报事大类
            //    var typeId = $("#BigCorpTypeID").val();
            //    //报事大类
            //    var typeIdCode = $("#BigCorpTypeCode").val();
            //    //报事细类
            //    var fineTypeID = $("#FineTypeID").val();
            //    //报事细类
            //    var fineTypeCode = $("#FineTypeCode").val();
            //    if (!fineTypeCode) {
            //        HDialog.Info("请选择报事细类");
            //        return;
            //    }
            //    //报事责任
            //    var incidentDuty = '';
            //    if ($('#IncidentDuty').attr("checked") == "checked") {
            //        incidentDuty = '地产类'
            //    } else {
            //        incidentDuty = '物产类'
            //    }
            //    //处理情况
            //    var dealSituation = $('#DealSituation').val();
            //    if (!dealSituation) {
            //        HDialog.Info("请输入处理情况");
            //        return;
            //    }
            //    if (dealSituation.lenght > 500) {
            //        HDialog.Info("处理情况不能大于500个字");
            //        return;
            //    }
            //    //逾期原因
            //    var overdueReason = $('#OverdueReason').combobox('getText');
            //    if (obj.IsBeoverdue == "是") {
            //        if (!overdueReason) {
            //            HDialog.Info('已逾期必须输入逾期原因');
            //            return;
            //        }
            //    }
            //    //是否投诉
            //    var isTousu = $('#IsTousu').val();
            //    if (isTousu == "是") {
            //        isTousu = 1;
            //    } else {
            //        isTousu = 0;
            //    }
            //    //处理期限
            //    var dealLimit = $('#DealLimit').val();
            //    //收费金额
            //    var dueAmount = $('#DueAmount').val();
            //    //额定工时
            //    var ratedWorkHour = $('#RatedWorkHour').val();
            //    //绩效系数
            //    var kPIRatio = $('#KPIRatio').val();
            //    //完成数量
            //    var ratedWorkHourNumber = $('#RatedWorkHourNumber').val();

            //    //报事处理
            //    $.tool.DataGet('IncidentProcessingNew', 'IncidentDeal', "IncidentID=" + obj.IncidentID + "&EqId" + eqId + "&IncidentContent=" +
            //        escape(content) + "&BigCorpTypeID=" + typeId + "&BigCorpTypeCode=" + typeIdCode + "&FineTypeID=" + fineTypeID + "&FineTypeCode=" + fineTypeCode
            //        + "&IncidentDuty=" + incidentDuty + "&DealSituation=" + escape(dealSituation) + "&OverdueReason=" + overdueReason + "&IsFinish=" + isFinish + "&IsTousu=" + isTousu
            //        + "&DealLimit=" + dealLimit + "&DueAmount=" + dueAmount + "&RatedWorkHour=" + ratedWorkHour + "&KPIRatio=" + kPIRatio + "&RatedWorkHourNumber=" + ratedWorkHourNumber,
            //        function Init() {
            //        },
            //        function callback(_Data) {
            //            if (_Data == 'true') {
            //                HDialog.Info('保存成功');
            //                HDialog.Close('1');
            //            }
            //        },
            //        function completeCallback() {
            //        },
            //        function errorCallback() {
            //        });

            //});
            var obj = '';
            //初始化
            function InitFunction() {
                //初始化页面                 
                var row = Cache.GetData("IncidentDeals");
                obj = JSON.parse(row);
                //加载基本信息
                $.tool.DataGet('IncidentProcessingNew', 'GetIncidentInfo', "IncidentID=" + obj.IncidentID + "&CommID=" + obj.CommID,
                    function Init() {
                    },
                    function callback(_Data) {
                        _Data = JSON.parse(_Data);
                        if (_Data.total > 0) {
                            obj = _Data.rows[0];
                            $('#IncidentID').val(obj.IncidentID);
                            $('#DrClass').val(parseInt(obj.DrClass) == 1 ? '书面报事' : '口派报事');
                            $('#IncidentMode').val(obj.IncidentMode);
                            $('#IncidentSource').val(obj.IncidentSource);
                            $('#IncidentPlace').val(obj.IncidentPlace);
                            if (obj.IncidentPlace == '户内') {
                                $('#huwai').hide();
                            } else if (obj.IncidentPlace == '公区') {
                                //$('#hunei').hide();
                            }
                            $('#ReserveDealDate').val(obj.ReserveDealDate);
                            $('#IncidentNum').val(obj.IncidentNum);
                            $('#IsTousu').val(parseInt(obj.IsTouSu) == 1 ? '是' : '否');
                            $('#IncidentContent').val(obj.IncidentContent);
                            $('#DispRemarks').val(obj.DispRemarks);
                            $('#CustName').val(obj.CustName);
                            $('#RoomSign').val(obj.RoomSign);
                            $('#RegionalPlace').val(obj.RegionalPlace);
                            $('#LocaleFunctionName').val(obj.LocaleFunctionName);
                            $('#LocalePositionName').val(obj.LocalePositionName);
                            $('#IncidentMan').val(obj.IncidentMan);
                            $('#Phone').val(obj.Phone);
                            $('#CustID').val(obj.CustID);
                            $('#RoomID').val(obj.RoomID);
                            $('#TypeName').searchbox("setValue", obj.BigTypeName);
                            //$('#FineTypeName').searchbox("setValue", obj.FineTypeName);
                            $('#BigCorpTypeID').val(obj.BigCorpTypeID);
                            $("#BigCorpTypeCode").val(obj.BigCorpTypeCode);
                            $('#EqId').val(obj.EqId);
                            $('#EquipmentName').searchbox("setValue", obj.EquipmentName);
                            //$('#FineTypeID').val(obj.FineCorpTypeID);
                            //$('#FineTypeCode').val(obj.FineCorpTypeCode);
                            if (obj.Duty == '物业类') {
                                $('#IncidentDuty1').attr("checked", "checked");
                            }
                            else {
                                $('#IncidentDuty').attr("checked", "checked");
                            }
                            $('#ReserveDate').val(obj.ReserveDate);
                            if (!obj.DealLimit) {
                                $('#DealLimit').val('24');
                            } else {
                                $('#DealLimit').val(obj.DealLimit);
                            }
                            $('#DealMan').val(obj.DealMan);
                            //$('#DealSituation').val(obj.DealSituation);
                            $('#CoordinateNum').val(obj.CoordinateNum);
                            //$('#DueAmount').val(obj.DueAmount);
                            //if (parseFloat(obj.DueAmount) > 0) {
                            //    $('#IsFrees').attr("checked", "checked");
                            //}
                            //else {
                            //    $('#IsFrees1').attr("checked", "checked");
                            //}
                            //逾期原因                    
                            //$('#OverdueReason').combobox('setText', obj.OverdueReason);
                            $('#ReceivingDate').val(obj.ReceivingDate);
                            $('#ArriveData').val(obj.ArriveData);
                            $('#IncidentDate').val(obj.IncidentDate);
                            $("#AdmiMan").val(obj.AdmiMan);
                            $("#DispDate").val(obj.DispDate);
                            $("#DispMan").val(obj.DispMan);
                            $("#CoorganizerUserList").val(obj.CoorganizerUser);
                            $("#hiIsFees").val(obj.IsFee);
                            if (obj.IsFee == '1') {
                                $('#IsFees1').attr('checked', 'checked');
                            } else {
                                $('#IsFees2').attr('checked', 'checked');
                            }

                            //加载受理、跟进、处理、关闭图片
                            //$.ajax({
                            //    type: "POST",
                            //    url: "/HM/M_Main/IncidentNewJH/IncidentControlManage.aspx?Method=GetFiles&IncidentID=" + obj.IncidentID,
                            //    async: true,
                            //    cache: false,
                            //    dataType: 'text',
                            //    contentType: false,
                            //    processData: false,
                            //    error: function (request) {
                            //    },
                            //    success: function (data) {
                            //        if (data) {
                            //            $('#imageTitle').css('height', '120px');
                            //            $('#ImageContent').append(data);
                            //        }
                            //    }
                            //});
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                //加载受理、跟进图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentWrittenDeal.aspx?Method=GetFiles&IncidentID=" + IncidentID.value,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {

                    },
                    success: function (data) {
                        if (data) {
                            $('#imageTitle').css('height', '120px');
                            $('#ImageContent').append(data);
                        }
                    }
                });
                //加载附件
                LoadList();
            }
            $(function () {
                InitFunction();
                $('#IncidentFrame').attr('src', '../IncidentNewJH/ProcessingManageFooter.aspx?IncidentID=' + IncidentID.value + "&OpType=BSCL");
            });
            /* ****图片开始*****/
            //查看图片
            function ImageBlclick(fAdjunctCode) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + IncidentID.value, '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }
            //查看app上传的图片
            function ImageAppBlclick(imgPath) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + imgPath + "&IncidentID=" + IncidentID.value, '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }
            function UploadImage() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=处理图片", '上传图片', false, function callback(_Data) {
                    if (_Data) {
                        $('#ImageContent').append(CreateSmImg(_Data));
                        $('#imageTitle').css('height', '120px');
                    }
                });
            }
            function CreateSmImg(srcs) {
                var sindex = srcs.lastIndexOf('\\') + 1;
                var eindex = srcs.lastIndexOf('.');
                var fileName = srcs.substring(sindex, eindex);
                var sb = "";
                sb += "<div class=\"addpicdiv\" style=\"width: 71px; height: 71px; float: left; margin-right: 15px; position: relative;text-align:center;\" ondblclick=\"ImageBlclick('" + fileName + "')\">";
                sb += "<img src=\"" + srcs + "\" style=\"width: 71px; height: 71px;\" />";
                sb += "  <div style=\"position: absolute; width: 18px; height: 18px; border-radius: 18px; font-size: 13px; background-color: #e0a70b; color: white; text-align: center; vertical-align: middle; top: -5px; left: 60px; cursor: pointer\" onclick=\"closeImage(this,'" + fileName + "')\">";
                sb += "  ×";
                sb += "   </div>";
                sb += "   <label style=\"font-size:8px;top: -5px;position: relative;\">" + fileName.substring(0, 8) + "(处理)</label>";
                sb += " </div>";
                return sb;
            }
            //通用 删除图片或附件
            function closeImage(obj, AdjunctCode) {
                //删除图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentWrittenDeal.aspx?Method=DeleteFile&IncidentID=" + IncidentID.value + "&FileName=" + AdjunctCode,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {
                        alert('出错');
                    },
                    success: function (data) {
                        $(obj).parent().remove();
                        var imageContent = $.trim($('#ImageContent').html());
                        if (!imageContent) {
                            $('#imageTitle').css('height', '10px')
                        }
                    }
                });
            }
            /* ****图片结束*****/
            /* ****附件开始*****/
            var column = [[
                { field: 'IncidentID', title: '报事ID', width: 100, align: 'left', sortable: true },
                {
                    field: 'AdjunctCode', title: '上传日期', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 8);
                    }
                },
                {
                    field: 'AdjunctName', title: '文件分类', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 2);
                    }
                },
                { field: 'FileSize', title: '文件大小', width: 120, align: 'left', sortable: true },
                {
                    field: 'DeleteOp', title: '删除', width: 100, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (row.AdjunctName == '处理文件') {
                            str = "<a class=\"HrefStyle\"  href='###' onclick=\"PostRequest('DeleteFile', '" + row.AdjunctCode + "');\">删除</a>";
                        }
                        return str;
                    }
                },
                {
                    field: 'UpLoadOp', title: '下载', width: 100, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        //var str = "<a class=\"HrefStyle\"  href='###' onclick=\"doLoadFile('" + row.AdjunctCode + "');\">下载</a>";
                        var str = "<a class=\"HrefStyle\" target='_black'  href='" + row.FilPath + "' >下载</a>";
                        return str;
                    }
                }
            ]];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
                    columns: column,
                    fitColumns: false,
                    rownumbers: true,
                    pagination: false,
                    border: false,
                    remoteSort: false,
                    width: "100%",
                    onBeforeLoad: function (param) {
                        param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, IncidentID.value);
                    }
                });
            }
            function GetParamNoPageKey(Class, Command, GridContainer, Param, incidentID) {
                Param.Method = "DataPost";
                Param.Class = Class;
                Param.Command = Command;
                Param.IncidentID = incidentID;
                return Param;
            };
            //上传文件
            function UploadFile() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=处理文件", '上传文件', false, function callback(_Data) {
                    if (_Data) {
                        LoadList();
                    }
                });
            }
            //删除文件
            function PostRequest(method, adjunctCode) {
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentWrittenDeal.aspx?Method=" + method + "&IncidentID=" + IncidentID.value + "&FileName=" + adjunctCode,
                    async: true,
                    cache: false,
                    error: function (request) {
                        alert('出错');
                    },
                    success: function (data) {
                        if (method == 'DeleteFile') {
                            LoadList();
                        }
                    }
                });
            }
            function doLoadFile(adjunctCode) {
                var url = "/HM/M_Main/IncidentNewJH/IncidentWrittenDeal.aspx?Method=DoLoadFiles&IncidentID=" + IncidentID.value + "&FileName=" + adjunctCode
                jQuery('<form action="' + url + '" method="post"></form>').appendTo('body').submit().remove();
            };
            /* ****附件结束*****/
        </script>


    </form>
</body>
</html>
