<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentControlManage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentControlManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style>
        .TdTitle {
            width: 10%;
        }

        input {
            width: 100%;
            height: 22px;
            line-height: 22px;
            border: 1px solid #95B8E7;
            border-radius: 3px;
        }

        textarea {
            resize: none;
            border: 1px solid #95B8E7;
            border-radius: 3px;
            width: 100%;
            height: 65px;
        }

        .TdContentSearch {
            padding-right: 5px;
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
        <input type="hidden" id="IncidentID" name="IncidentID" runat="server" />

        <table class="DialogTable" align="center">
            <tr>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
                <td class="TdTitle"></td>
                <td class="TdContent">
                    <input id="btnAssignmentPrint" name="btnAssignmentPrint" onserverclick="btnAssignmentPrint_ServerClick" class="button" value="打印派工单" type="button" runat="server" />

                </td>
            </tr>
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
                    <input id="IsTouSu" type="text" value="" disabled />
                </td>
            </tr>
            <tr id="huwai">
                <td class="TdTitle">公区名称：
                </td>
                <td class="TdContent" style="width: auto;">
                    <input id="RegionalPlace" type="text" style="width: 10%;" value="" disabled />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公区方位：
                    <input id="LocalePositionName" type="text" style="width: 10%;" value="" disabled />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公区功能：
                    <input id="LocaleFunctionName" type="text" style="width: 10%;" value="" disabled />

                </td>
                <td class="TdTitle">设备名称：
                </td>
                <td class="TdContent">
                    <input type="text" id="EquipmentName" name="EquipmentName" disabled />
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
                <td class="TdTitle">报事内容：
                </td>
                <td class="TdContent" colspan="3">
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
                <td class="TdTitle">受理人：
                </td>
                <td class="TdContent">
                    <input id="AdmiMan" type="text" value="" disabled />
                </td>

                <td class="TdTitle">受理时间：
                </td>
                <td class="TdContent">
                    <input id="IncidentDate" type="text" value="" disabled />
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
                <td class="TdTitle">是否收费：
                </td>
                <td class="TdContent" align="left">
                    <input id="IsFees1" type="radio" value="1" style="width:20px;" name="IsFees" runat="server" disabled="disabled" />是
                                                    <input id="IsFees2" type="radio" style="width:20px;" value="0" name="IsFees" runat="server" disabled="disabled" />否
                                                    <input type="hidden" id="hiIsFees" name="hiIsFees" runat="server" />
                </td>

            </tr>

            <tr>
                <td class="TdTitle">受理时间:</td>
                <td class="TdContent">
                    <input id="Text1" disabled name="IncidentDate" runat="server" />
                </td>
                <td class="TdTitle">受 理 人: </td>
                <td class="TdContent">
                    <input id="Text2" disabled name="AdmiMan" runat="server" />
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
                    <input type="text" id="AssistPeople" disabled /></td>
            </tr>
            <tr>
                <td class="TdTitle">分派备注：
                </td>
                <td class="TdContent" colspan="3">
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
                <td class="TdTitle">原因细类：
                </td>
                <td class="TdContent">
                    <input type="text" id="FineTypeName" disabled />
                </td>
                <td class="TdTitle">额定工时：
                </td>
                <td class="TdContent">
                    <input id="RatedWorkHour" type="text" value="" disabled/>
                    <input type="button" class="button" value="查看" onclick="WorkingHours()" />
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
                <td class="TdContent" colspan="3">
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
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事关闭</td>
            </tr>
            <tr>
                <td class="TdTitle">关闭类型：
                </td>
                <td class="TdContent">
                    <input id="CloseType" type="text" value="" disabled />
                </td>
                <td class="TdTitle">非正常关闭原因：
                </td>
                <td class="TdContent">
                    <input id="NoNormalCloseReasons" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">关闭时间：
                </td>
                <td class="TdContent">
                    <input id="CloseTime" type="text" value="" disabled />
                </td>
                <td class="TdTitle">关闭人：
                </td>
                <td class="TdContent">
                    <input id="CloseMan" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">关闭情况：
                </td>
                <td class="TdContent" colspan="3">
                    <textarea id="CloseSituation" disabled></textarea>
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事回访</td>
            </tr>
            <tr>
                <td class="TdTitle">回访结果：
                </td>
                <td class="TdContent">
                    <input id="ReplyResult" type="text" value="" disabled />
                </td>
                <td class="TdTitle">回访评价：
                </td>
                <td class="TdContent">
                    <input id="ServiceQuality" type="text" value="" disabled />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">回访内容：
                </td>
                <td class="TdContent" colspan="3">
                    <textarea id="ReplyContent" disabled></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">照片：
                </td>
                <td id="ImageContent" class="TdContent" colspan="3"></td>

            </tr>
            <tr>
                <td class="TdTitle">附件：
                </td>
                <td class="TdContent" colspan="3">
                    <div style="background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>
            </tr>

        </table>
        <div style="height: 300px;">
            <iframe id="IncidentFrame" src="" style="width: 100%; height: 100%; border: none;" class="Frm"></iframe>
        </div>
        <input style="width: 8px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server" />
        <script type="text/javascript">

            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;

                if (strPrintParms != "") {
                    //alert(strPrintParms);			
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                }
            }

            function WorkingHours() {
                HDialog.Open('800', '550', '../IncidentNewJH/IncidentWorkingHoursAudit.aspx?IncidentID=' + obj.IncidentID + '&Type=edit', "工时审核", false, function callback(_Data) {

                });
            }
            //function CleatVal() {

            //    $('#FineTypeName').val('');
            //    $('#RatedWorkHourNumber').val('');
            //    $('#DealSituation').val('');
            //    $('#FinishUser').val('');
            //    $('#KPIRatio').val(''); 
            //}
            //CleatVal();

            var obj = '';
            function InitFunction() {
                //初始化页面
                var row = Cache.GetData("IncidentInfos");
                obj = JSON.parse(row);
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
                $('#IncidentNum').val(obj.IncidentNum);
                $('#IsTouSu').val(parseInt(obj.IsTouSu) == 1 ? '是' : '否');
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
                $('#ReserveDate').val(obj.ReserveDate);
                $('#DealLimit').val(obj.DealLimit);
                $('#DealMan').val(obj.DealMan);
                $('#CoordinateNum').val(obj.CoordinateNum);
                $('#IsAmount').val(parseFloat(obj.DueAmount) > 0 ? '是' : '否');
                $('#DueAmount').val(obj.DueAmount);
                $('#MainEndDate').val(obj.MainEndDate);
                $('#CloseSituation').val(obj.CloseSituation);
                $('#NoNormalCloseReasons').val(obj.NoNormalCloseReasons);
                $('#EqId').val(obj.EqId);
                $('#EquipmentName').val(obj.EquipmentName);
                $("#DispDate").val(obj.DispDate);
                $("#DispMan").val(obj.DispMan);
                $("#DispRemarks").val(obj.DispRemarks);
                $('#ReceivingDate').val(obj.ReceivingDate);
                $('#ArriveData').val(obj.ArriveData);
                $('#FinishUser').val(obj.FinishUser);
                $('#AdmiMan').val(obj.AdmiMan);
                $('#IncidentDate').val(obj.IncidentDate);
                $('#CloseTime').val(obj.CloseTime);
                $('#CloseMan').val(obj.CloseUser);
                $('#DealSituation').val(obj.DealSituation);
                $('#ReserveDealDate').val(obj.ReserveDealDate);
                $('#AssistPeople').val(obj.CoorganizerUser);//协助人列表
                //if (obj.CloseType == null || obj.CloseType == "") {
                //    $('#CloseType').val('未关闭');
                //} else 
                if (parseInt(obj.CloseType) == 1) {
                    $('#CloseType').val('非正常关闭');
                } else if (parseInt(obj.CloseType) == 0) {
                    $('#CloseType').val('正常关闭');
                }
                $("#RatedWorkHour").val(obj.RatedWorkHour);
                $("#KPIRatio").val(obj.KPIRatio);
                $("#RatedWorkHourNumber").val(obj.RatedWorkHourNumber);
                if (parseInt(obj.ReplyResult) == 1) {
                    $("#ReplyResult").val('成功回访');
                } else if (parseInt(obj.ReplyResult) == 0 && obj.ReplyDate != null) {
                    $("#ReplyResult").val('不成功回访');
                } else {
                    $("#ReplyResult").val('未回访');
                }
                $("#ServiceQuality").val(obj.ServiceQuality);
                $("#ReplyContent").val(obj.ReplyContent);
                $("#OverdueReason").val(obj.OverdueReason);

                $("#hiIsFees").val(obj.IsFee);
                if (obj.IsFee == '1') {
                    $('#IsFees1').attr('checked', 'checked');
                } else {
                    $('#IsFees2').attr('checked', 'checked');
                }

                //加载受理、跟进、处理、关闭图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentControlManage.aspx?Method=GetFiles&IncidentID=" + obj.IncidentID,
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
                //附属信息
                var fsur = "../IncidentNewJH/ProcessingManageFooter.aspx?IncidentID=" + obj.IncidentID
                $("#IncidentFrame").attr("src", fsur);
            }
            InitFunction();
            //查看图片
            function ImageBlclick(fAdjunctCode) {
                HDialog.Open('700', '500', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + obj.IncidentID, '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }

            //查看实签图片
            function singImage() {
                var url = '../IncidentNewJH/ViewSignImage.aspx?SignImage=' + obj.SignatoryImg + '&SignAfterImage=' + obj.SignatoryConfirmImg;
                //var url = '../IncidentNewJH/ViewSignImage.aspx?SignImage=';
                HDialog.Open('700', '500', url, '实签图片', false, function callback(_Data) {

                });
            }


            /* ****附件开始*****/
            var column = [[
                { field: 'IncidentID', title: '报事ID', width: 160, align: 'left', sortable: true },
                {
                    field: 'AdjunctCode', title: '上传日期', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 8);
                    }
                },
                {
                    field: 'AdjunctName', title: '文件分类', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 2);
                    }
                },
                { field: 'FileSize', title: '文件尺寸', width: 80, align: 'left', sortable: true },
                {
                    field: 'UpLoadOp', title: '下载', width: 80, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        //var str = "<a class=\"HrefStyle\"  href='###' onclick=\"doLoadFile('" + row.AdjunctCode + "');\">下载</a>";
                        var str = "<a class=\"HrefStyle\" target='_black'  href='" + row.FilPath + "' >下载</a>";
                        return str;
                    }
                }
            ]];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=IncidentProcessingNew&Command=GetIncidentFiles&IncidentID=' + $("#IncidentID").val(),
                    method: "get",
                    nowrap: true,
                    columns: column,
                    fitColumns: false,
                    rownumbers: true,
                    pagination: false,
                    border: false,
                    remoteSort: false,
                    width: "100%",
                    onBeforeLoad: function (param) {
                        //param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, obj.IncidentID);
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
            LoadList();
            function doLoadFile(adjunctCode) {
                var url = "/HM/M_Main/IncidentNewJH/IncidentControlManage.aspx?Method=DoLoadFiles&IncidentID=" + obj.IncidentID + "&FileName=" + adjunctCode
                jQuery('<form action="' + url + '" method="post"></form>').appendTo('body').submit().remove();
            };
            /* ****附件结束*****/
        </script>


    </form>
</body>
</html>
