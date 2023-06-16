<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationChangeAuditManage.aspx.cs" Inherits="M_Main.RenovationNew.RenovationChangeAuditManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>装修变更申请详细页面</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <style type="text/css">
        .SearchTable {   
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            width: 165px;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 94%;
            height: 40px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 15%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }
    </style>
</head>
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">客户名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CustName" name="CustName" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        <input type="hidden" id="CustID" name="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">房屋编号:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoomSign" name="RoomSign" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
                        <input type="hidden" id="RoomName" name="RoomName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">变更项目:</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="ChangeItem" name="ChangeItem" maxlength="1000" runat="server" class="easyui-validatebox" data-options="required:true"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">变更原因:</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="ChangeReason" name="ChangeReason" maxlength="1000" runat="server" class="easyui-validatebox" data-options="required:true"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">变更内容:</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="ChangeContent" name="ChangeContent" maxlength="1000" runat="server" class="easyui-validatebox" data-options="required:true"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">变更前预计完工时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="OldEstimateEndDate" name="OldEstimateEndDate" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                    </td>
                    <td class="TdTitle">变更前预计装修天数:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="OldEstimateEndDay" name="OldEstimateEndDay" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">变更后预计完工时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="NewEstimateEndDate" name="NewEstimateEndDate" runat="server" class="easyui-datebox" data-options="editable:false,required:true,onSelect:NewEstimateEndDateSelect" />
                    </td>
                    <td class="TdTitle">变更后预计装修天数:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="NewEstimateEndDay" name="NewEstimateEndDay" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">经办人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ChargePerson" name="ChargePerson" runat="server" class="easyui-validatebox" data-options="required:true" />
                    </td>
                    <td class="TdTitle">经办时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ChargeTime" name="ChargeTime" runat="server" class="easyui-datebox" data-options="editable:false,required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">备注:</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="Remark" name="Remark" maxlength="1000" runat="server" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 10px 0;">
            <input type="submit" class="button" value="保存" id="BtnSave" onserverclick="BtnSave_ServerClick" runat="server" />
            <input type="submit" class="button" value="送审" id="BtnStart" onserverclick="BtnStart_ServerClick" runat="server" />
            <input type="submit" class="button" value="审批通过" id="BtnCheckPass" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input type="submit" class="button" value="审批不通过" id="BtnCheckNoPass" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input type="submit" class="button" value="驳回" id="BtnReturn" onserverclick="BtnReturn_ServerClick" runat="server" />
            <input type="button" class="button" value="放弃返回" id="BtnCancle" onclick="btnClose();" />
        </div>

        <input type="hidden" id="RID" name="RID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="ID" name="ID" runat="server" />
        <input type="hidden" id="AuditState" name="AuditState" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="FeesRoleSortCodes" name="FeesRoleSortCodes" runat="server" />
        <input type="hidden" id="FeesRoleCodes" name="FeesRoleCodes" runat="server" />
        <script type="text/javascript">
            //返回关闭
            function btnClose() {
                HDialog.Close("");
            }
            //变更后预计完工时间 改变事件
            function NewEstimateEndDateSelect(date) {
                var NowDate = $('#NewEstimateEndDate').datebox("getValue") + " 00:00:00";
                date = new Date(NowDate);
                var OldEstimateEndDateStr = $('#OldEstimateEndDate').val() + " 00:00:00";
                var OldEstimateEndDayStr = $('#OldEstimateEndDay').val();
                var RenoBeginTime = DiffDate((new Date(OldEstimateEndDateStr)), OldEstimateEndDayStr);
                if (RenoBeginTime > date) {
                    $('#NewEstimateEndDate').datebox("setValue", '');
                    $('#NewEstimateEndDay').val("");
                    HDialog.Info("预计完工时间不能小于开始装修时间");
                    return;
                }
                var NewDays = getDays(RenoBeginTime, date);
                if (NewDays < 0) {
                    $('#NewEstimateEndDate').datebox("setValue", '');
                    $('#NewEstimateEndDay').val("");
                    HDialog.Info("预计完工时间不能小于开始装修时间");
                    return;
                }
                $('#NewEstimateEndDay').val(NewDays);


                //if (OldDate > date) {

                //    //$('#NewEstimateEndDate').datebox("setValue", "");
                //} else {

                //}
            }

            function getDays(strDateStart, strDateEnd) {
                var iDays;
                iDays = parseInt(Math.ceil(Math.abs(strDateStart - strDateEnd) / 1000 / 60 / 60 / 24 + 1))//把相差的毫秒数转换为天数 
                return iDays;
            }

            function DiffDate(dateTime, days) {
                dateTime = dateTime.setDate(dateTime.getDate() - days + 1);
                dateTime = new Date(dateTime);
                return dateTime;
            }

            $(function () {
                history.pushState(null, null, document.URL);
                window.addEventListener('popstate', function () {
                    history.pushState(null, null, document.URL);
                });

                //按钮页面提交事件 
                $("input[type='submit']").click(function (e) {
                    $.tool.pageLoading();
                    if ($("#frmForm").form('validate')) {
                        $.tool.pageUnLoading();
                        return true;
                    } else {
                        $.tool.pageUnLoading();
                        return false;
                    }
                });

                if ($('#AuditState').val() == "已审核" || $('#AuditState').val() == "审核不通过" || $('#AuditState').val() == "审核中") {
                    $('textarea').attr("disabled", "disabled");
                    $('.SearchTable input').each(function () {
                        if ($(this).hasClass("easyui-datebox")) {
                            $(this).datebox({ disabled: true })
                        } else if (!$(this).hasClass("button")) {
                            $(this).attr("disabled", "disabled");
                        }
                    });
                }
            });
        </script>

    </form>
</body>
</html>
