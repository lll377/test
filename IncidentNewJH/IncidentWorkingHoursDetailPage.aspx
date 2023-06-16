<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentWorkingHoursDetailPage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentWorkingHoursDetailPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>

    <script type="text/javascript" src="../jscript/ajax.js"></script>

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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../editor/kindeditor.js" type="text/javascript"></script>
    <script src="../editor/lang/zh_CN.js" type="text/javascript"></script>
    <script src="../editor/plugins/code/prettify.js" type="text/javascript"></script>
    <link href="../editor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <link href="../editor/themes/default/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style>
        .TdTitle {
            width: 14%;
        }

        /*input {
            width: 100%;
            height: 22px;
            line-height: 22px;
            border: 1px solid #95B8E7;
            border-radius: 3px;
        }*/

        textarea {
            resize: none;
            border: 1px solid #95B8E7;
            border-radius: 3px;
            width: 100%;
            height: 65px;
        }

            input:disabled, textarea:disabled {
                border: 1px solid #DDD;
                background-color: #F5F5F5;
                color: #ACA899;
            }
    </style>
</head>
<body onload="Win_OnLoad()" style="overflow-y: scroll;">

    <form id="frmForm" runat="server">
        <input id="IncidentID" size="1" type="hidden" name="IncidentID" runat="server" />
        <input type="hidden" id="InfoId" name="InfoId" value="" runat="server" />
        <table style="font-size: 12px" id="TablePrint" class="SchTable" cellspacing="0" cellpadding="0"
            width="100%" runat="server">
            <tr>
                <td colspan="4" align="right" style="padding-right: 47px;">
                    <input id="btnAssignmentPrint" name="btnAssignmentPrint" onserverclick="btnAssignmentPrint_ServerClick" class="button" value="打印派工单" type="button" runat="server" />
                </td>
            </tr>
        </table>
        <table class="DialogTable" align="center" style="z-index: -999;">
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
                    <input id="IncidentPlace" type="text" value="" disabled />
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
                <td class="TdContent" style="width: 50%;">
                    <input id="RegionalPlace" type="text" style="width: 10%;" value="" disabled />&nbsp;&nbsp;公区方位：
                    <input id="LocalePositionName" type="text" style="width: 10%;" value="" disabled />&nbsp;&nbsp;公区功能：
                    <input id="LocaleFunctionName" type="text" style="width: 10%;" value="" disabled />
                </td>
                <td class="TdTitle">设备：
                </td>
                <td class="TdContent">
                    <input id="EquipmentName" type="text" disabled />
                    <input id="EqID" type="hidden" />
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
                <td class="TdTitle">报事内容：
                </td>
                <td class="TdContent" colspan="5">
                    <textarea id="IncidentContent" disabled></textarea>
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
                <td class="TdTitle">报事责任：
                </td>
                <td class="TdContent">
                    <input type="text" id="Duty" disabled />
                </td>
                <td class="TdTitle">报事类别：
                </td>
                <td class="TdContent">
                    <input type="text" id="TypeName" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">预约处理时间：
                </td>
                <td class="TdContent">
                    <input id="ReserveDate" type="text" value="" disabled />
                </td>
                <td class="TdTitle">是否收费
                </td>
                <td class="TdContent" align="left">
                    <input id="IsFees1" type="radio" value="1" name="IsFees" disabled="disabled" />是
                                <input id="IsFees2" type="radio" value="0" name="IsFees" disabled="disabled" />否
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

                <td class="TdTitle">派工单号：
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
                <td class="TdTitle">逾期时间：
                </td>
                <td class="TdContent">
                    <input type="text" id="ReserveDealDate" disabled />
                </td>

            </tr>


            <tr>

                <td class="TdTitle">责任人：
                </td>
                <td class="TdContent">
                    <input id="DealMan" type="text" value="" disabled />
                </td>
                <td class="TdTitle">协助人：
                </td>
                <td class="TdContent">
                    <input type="text" id="AssistPeople" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">处理时限：
                </td>
                <td class="TdContent">
                    <input type="text" id="DealLimit" disabled />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>


            </tr>
            <tr>
                <td class="TdTitle">分派备注:</td>

                <td class="TdContent" colspan="5">
                    <textarea id="DispRemarks" disabled></textarea>
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
                <td class="TdTitle">原因细类：
                </td>
                <td class="TdContent">
                    <input type="text" id="FineTypeName" disabled />
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
                <td class="TdContent">
                    <input id="RatedWorkHourNumber" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">处理情况：
                </td>
                <td class="TdContent" colspan="5">
                    <textarea id="DealSituation" disabled></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">逾期原因：
                </td>
                <td class="TdContent">
                    <input id="OverdueReason" type="text" value="" disabled />
                </td>
                <td class="TdTitle">收费金额：
                </td>
                <td class="TdContent">
                    <input id="DueAmount" type="text" value="" disabled />
                    <input id="IsAmount" type="text" value="" style="display: none" disabled="disabled" />
                </td>
            </tr>
            <tr>

                <td class="TdTitle">完成时间：
                </td>
                <td class="TdContent">
                    <input id="MainEndDate" type="text" value="" disabled />
                </td>
                <td class="TdTitle">完成操作人：
                </td>
                <td class="TdContent">
                    <input id="FinishUser" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">签字 ：
                </td>
                <td class="TdContent">
                    <input type="button" class="button" value="查看" onclick="singImage()" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle" id="imageTitle">照片<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage()">(上传)</a>：
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
                    <%--<input type="button" class="button" value="跟 进" id="BtnFollow" style="margin-right: 20px;" />
                    <input type="button" class="button" value="关 闭" id="BtnCut" style="margin-right: 20px;" />
                    <input type="button" class="button" value="退 回" id="BtnBack" style="margin-right: 20px;" />--%>
                    <input type="button" class="button" value="工时审核" id="WorkingHours" style="margin-right: 20px;" />
                    <input type="button" class="button" value="放弃返回" id="BtnReturn" style="margin-right: 20px;" />
                    <input style="width: 8px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server" />
                </td>
            </tr>
        </table>
        <div style="height: 300px;">
            <iframe id="IncidentFrame" src="" style="width: 100%; height: 100%; border: none;" class="Frm"></iframe>
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

            //查看实签图片
            function singImage() {
                var url = '../IncidentNewJH/ViewSignImage.aspx?SignImage=' + obj.SignatoryImg + '&SignAfterImage=' + obj.SignatoryConfirmImg;
                HDialog.Open('700', '500', url, '实签图片', false, function callback(_Data) {

                });
            }
            var searchType = '<% =SearchType %>';
            $("#BtnFollow").click(function () {
                HDialog.Open('780', '450', '../IncidentNewJH/IncidentFollowUp.aspx?IncidentID=' + obj.IncidentID + '&gjType=complete', '报事跟进', false, function callback(_Data) {
                    if (_Data) {
                        HDialog.Close(1);
                    }
                });
            });

            $("#BtnCut").click(function () {
                HDialog.Open('780', '450', '../IncidentNewJH/IncidentCutPage.aspx?IncidentID=' + obj.IncidentID + '&InfoId=' + $("#InfoId").val(), '关闭', false, function callback(_Data) {
                    if (_Data) {
                        HDialog.Close(1);
                    }
                });
            });
            $("#BtnBack").click(function () {
                var url = '../IncidentNewJH/IncidentBackPage.aspx?OpType=CancleFinished&IncidentID=' + obj.IncidentID + '&LastFinishTime=' + obj.MainEndDate + '&LastFinishUserCode=' + obj.FinishUserCode + '&LastFinishUser=' + obj.FinishUser;
                HDialog.Open('680', '300', url, '取消完成', false, function callback(_Data) {
                    if (_Data == 1) {
                        HDialog.Close(1);
                    }
                });
            });
            //工时审核
            $('#WorkingHours').click(function () {
                HDialog.Open('800', '550', '../IncidentNewJH/IncidentWorkingHoursAudit.aspx?IncidentID=' + obj.IncidentID, "工时审核", false, function callback(_Data) {

                });
            });
            $("#BtnReturn").click(function () {
                if ($("#InfoId").val() != "") {
                    location.href = "../IncidentNewJH/IncidentControlSeach.aspx";
                } else {
                    HDialog.Close();
                }
            });

            var obj = '';
            function InitFunction() {
                //初始化页面
                var row = Cache.GetData("IncidentReplyIDs");
                obj = JSON.parse(row);
                if (obj == null || obj.length == 0 || obj == undefined) {
                    $.tool.DataGet('IncidentAcceptNew_Search', 'IncidentSearch', 'IncidentID=' + $("#IncidentID").val(),
                        function Init() {
                        },
                        function callback(Data) {
                            obj = JSON.parse(Data);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
                $('#DrClass').val(parseInt(obj.DrClass) == 1 ? '书面报事' : '口派报事');
                $('#IncidentMode').val(obj.IncidentMode);
                $('#IncidentSource').val(obj.IncidentSource);
                $('#IncidentPlace').val(obj.IncidentPlace);
                if (obj.IncidentPlace == '户内') {
                    $('#huwai').hide();
                } else if (obj.IncidentPlace == '公区') {
                    //$('#hunei').hide();
                }
                $('#IncidentNum').val(obj.IncidentNum);
                $('#IsTousu').val(parseInt(obj.IsTouSu) == 1 ? '是' : '否');
                $('#IncidentContent').val(obj.IncidentContent);
                $('#CustName').val(obj.CustName);
                $('#RoomSign').val(obj.RoomSign);
                $('#RegionalPlace').val(obj.RegionalPlace);
                $('#LocaleFunctionName').val(obj.LocaleFunctionName);
                $('#LocalePositionName').val(obj.LocalePositionName);
                $('#IncidentMan').val(obj.IncidentMan);
                $('#Phone').val(obj.Phone);
                $('#TypeName').val(obj.BigTypeName);
                $('#FineTypeName').val(obj.FineTypeName);
                $('#Duty').val(obj.Duty);
                $("#IncidentDate").val(obj.IncidentDate);
                $("#AdmiMan").val(obj.AdmiMan);
                $('#ReserveDate').val(obj.ReserveDate);
                $("#DispDate").val(obj.DispDate);
                $("#DispMan").val(obj.DispMan);
                $("#DispRemarks").val(obj.DispRemarks);
                $('#DealLimit').val(obj.DealLimit);
                $('#DealMan').val(obj.DealMan);
                $('#CoordinateNum').val(obj.CoordinateNum);
                $('#IsAmount').val(parseFloat(obj.DueAmount) > 0 ? '是' : '否');
                $('#DueAmount').val(obj.DueAmount);
                $('#MainEndDate').val(obj.MainEndDate);
                $('#FinishUser').val(obj.FinishUser);
                $('#DealSituation').val(obj.DealSituation);
                $('#OverdueReason').val(obj.OverdueReason);
                $("#RatedWorkHour").val(obj.RatedWorkHour);
                $("#KPIRatio").val(obj.KPIRatio);
                $("#RatedWorkHourNumber").val(obj.RatedWorkHourNumber);
                $('#ReceivingDate').val(obj.ReceivingDate);
                $('#ArriveData').val(obj.ArriveData);
                $('#ReserveDealDate').val(obj.ReserveDealDate);
                $("#EqID").val(obj.EqID);
                $("#EquipmentName").val(obj.EquipmentName);
                //Cache.SetData("IncidentReplyIDs", '');

                $('#AssistPeople').val(obj.CoorganizerUser);//协助人列表

                var furl = '../IncidentNewJH/ProcessingManageFooter.aspx?IncidentID=' + obj.IncidentID + "&OpType=BSGB";
                $('#IncidentFrame').attr('src', furl);
                $('#IncidentID').val(obj.IncidentID);

                $("#hiIsFees").val(obj.IsFee);
                if (obj.IsFee == '1') {
                    $('#IsFees1').attr('checked', 'checked');
                } else {
                    $('#IsFees2').attr('checked', 'checked');
                }

                //加载受理、跟进图片,处理图片，关闭图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentCutDetailPage.aspx?Method=GetFiles&IncidentID=" + obj.IncidentID,
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

            }


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
                        param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, $("#IncidentID").val());
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }
            /* ****附件结束*****/
            $(function () {
                InitFunction();
                //加载附件
                LoadList();
            });
            /* ****图片开始*****/
            //查看图片
            function ImageBlclick(fAdjunctCode) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + obj.IncidentID, '查看图片', false, function callback(_Data) {
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
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + obj.IncidentID + "&FileDescr=关闭图片", '上传图片', false, function callback(_Data) {
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
                sb += "   <label style=\"font-size:8px;top: -5px;position: relative;\">" + fileName.substring(0, 8) + "(关闭)</label>";
                sb += " </div>";
                return sb;
            }
            //删除图片
            function closeImage(obj1, AdjunctCode) {
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentCutDetailPage.aspx?Method=DeleteFile&IncidentID=" + obj.IncidentID + "&FileName=" + AdjunctCode,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {
                        alert('出错');
                    },
                    success: function (data) {
                        $(obj1).parent().remove();
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
                { field: 'FileSize', title: '文件尺寸', width: 120, align: 'left', sortable: true },
                {
                    field: 'DeleteOp', title: '删除', width: 100, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = '';
                        if (row.AdjunctName == '关闭文件') {
                            str = "<a class=\"HrefStyle\"  href='###' onclick=\"PostRequest('DeleteFile', '" + row.AdjunctCode + "');\">删除</a>";
                        }
                        return str;
                    }
                },
                {
                    field: 'UpLoadOp', title: '下载', width: 100, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='###' onclick=\"doLoadFile('" + row.AdjunctCode + "');\">下载</a>";
                        return str;
                    }
                }
            ]];

            function GetParamNoPageKey(Class, Command, GridContainer, Param, incidentID) {
                Param.Method = "DataPost";
                Param.Class = Class;
                Param.Command = Command;
                Param.IncidentID = incidentID;
                return Param;
            };
            //上传文件
            function UploadFile() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + obj.IncidentID + "&FileDescr=关闭文件", '上传文件', false, function callback(_Data) {
                    if (_Data) {
                        LoadList();
                    }
                });
            }
            //删除文件
            function PostRequest(method, adjunctCode) {
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentCutDetailPage.aspx?Method=" + method + "&IncidentID=" + obj.IncidentID + "&FileName=" + adjunctCode,
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
                var url = "/HM/M_Main/IncidentNewJH/IncidentCutDetailPage.aspx?Method=DoLoadFiles&IncidentID=" + obj.IncidentID + "&FileName=" + adjunctCode
                jQuery('<form action="' + url + '" method="post"></form>').appendTo('body').submit().remove();
            };

        </script>
    </form>
</body>
</html>

