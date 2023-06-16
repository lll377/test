<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanAdjustDetailPlaning.aspx.cs" Inherits="M_Main.Plan.PlanAdjustDetailPlaning" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划调整</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }

        .DialogTable tr {
            line-height: 33px;
        }
        .DialogTable tr input{
            border: 1px solid #cccccc;
            height:24px;
        }
    </style>
    <script type="text/javascript">

</script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="TopHead">
            <input type="hidden" id="AddTime" name="AddTime" runat="server" />
            <input type="hidden" id="OpType" name="OpType" runat="server" />
            <input type="hidden" id="GridData" name="GridData" runat="server" />
            <input type="hidden" id="BussId" name="BussId" runat="server" />

            <input type="hidden" id="ChangeId" name="ChangeId" runat="server" />
            <input type="hidden" id="PlanId" name="PlanId" runat="server" />
            <input type="hidden" id="DetailId" name="DetailId" runat="server" />
            <input type="hidden" id="AuditingState" name="AuditingState" runat="server" />


            <input type="button" id="BtnClose" onclick="btnClose();" value="关闭" />
            <input id="BtnSave" type="submit" value="保存" onclick="btnSave()" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr style="height: 35px;">
                <td colspan="8" style="border: 0px solid #000000; text-align: center; font-size: 15px; border-color: #ffffff; background: #cccccc;">计划单信息</td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划单号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="PlanNO" onclick="" style="width: 90%;" name="PlanNO" runat="server" />
                </td>
                <td class="DialogTdTitle">计划周期：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="PlanCycle" name="PlanCycle" runat="server" />
                    <input type="text" class="easyui-validatebox" readonly="readonly" id="PlanCycleName" style="width: 90%;" name="PlanCycleName" runat="server" />
                </td>

                <td class="DialogTdTitle">责任人：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="BlamePId" name="BlamePId" runat="server" />
                    <input type="text" class="easyui-validatebox" readonly="readonly" id="BlamePIdName" style="width: 90%;" name="BlamePIdName" runat="server" />
                </td>
                <td class="DialogTdTitle">责任部门：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="BlameDepCode" name="BlameDepCode" runat="server" />
                    <input type="text" id="BlameDepCodeName" style="width: 90%;" class="easyui-validatebox" readonly="readonly" name="BlameDepCodeName" runat="server" />
                </td>
            </tr>
            <tr style="height: 35px;">
                <td colspan="8" style="border: 3px solid #000000; text-align: center; font-size: 15px; border-color: #ffffff; background: #cccccc;">调整前计划信息</td>
            </tr>
            <tr>
                <td class="DialogTdTitle">序号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="Sort" style="width: 90%;" readonly="readonly" name="Sort" runat="server" />
                </td>
                <td class="DialogTdTitle">计划编码：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="PlanCoding" style="width: 90%;" readonly="readonly" name="PlanCoding" runat="server" />
                </td>
                <td class="DialogTdTitle">计划年月：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="PlanYearMonth" style="width: 90%;" readonly="readonly" name="PlanYearMonth" runat="server" />
                </td>
                <td class="DialogTdTitle">计划类型： 
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="PlanType" name="PlanType" runat="server" />
                    <input type="text" class="easyui-validatebox" id="PlanTypeName" style="width: 90%;" readonly="readonly" name="PlanTypeName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划名称：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input class="easyui-validatebox" id="PlanName" style="width: 96.5%; " readonly="readonly" name="PlanName" runat="server"></input>
                </td>
                <td class="DialogTdTitle">计划开始时间：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="BeforePlanStartTime" style="width: 90%;" readonly="readonly" name="BeforePlanStartTime" runat="server" />
                </td>
                <td class="DialogTdTitle">计划结束时间：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="BeforePlanEndTime" style="width: 90%;" readonly="readonly" name="BeforePlanEndTime" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划内容：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input class="easyui-validatebox" id="BeforePlanContent" style="width: 96.5%; " readonly="readonly" name="BeforePlanContent" runat="server" />
                </td>
                <td class="DialogTdTitle">计划说明：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input class="easyui-validatebox" id="BeforePlanExplain" style="width: 96.5%; " readonly="readonly" name="BeforePlanExplain" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划目标：
                </td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="BeforeTarget" style="width: 90%;" readonly="readonly" name="BeforeTarget" runat="server" />
                </td>
                <td class="DialogTdTitle">计划费用（元）：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="BeforePlanCost" style="width: 90%;" readonly="readonly" name="BeforePlanCost" runat="server" />
                </td>
                <td class="DialogTdTitle">是否关联预算：
                </td>
                <td class="DialogTdContent">
                    <select id="IsConnectBudget" name="IsConnectBudget"
                        style="width: 90%; border: 1px #cccccc solid; height: 25px;" class="easyui-validatebox" disabled="disabled" runat="server" data-options="required:true">
                        <option value="1">是</option>
                        <option value="0" selected="selected">否</option>
                    </select>
                </td>
                <td class="DialogTdTitle">关联预算方式：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="ConnectBudgetWay" readonly="readonly" style="width: 90%;" name="ConnectBudgetWay" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">关联预算科目：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="ConnectBudgetProject" style="width: 90%;" readonly="readonly" name="ConnectBudgetProject" runat="server" />
                </td>
                <td class="DialogTdTitle">税率：
                </td>
                <td class="DialogTdContent">
                    <input type="text" id="Rate" name="Rate" class="easyui-validatebox" readonly="readonly" runat="server" style="width: 90%;" onkeyup="value=numTest(value)?value:''" onafterpaste="value=numTest(value)?value:''" />
                </td>
                <td class="DialogTdTitle">费用主管部门：</td>
                <td class="DialogTdContent">
                    <input id="PayDepName" name="PayDepName" type="text" class="easyui-validatebox" readonly="readonly" style="width: 90%;" />
                    <input type="hidden" name="PayDepCode" id="PayDepCode" value="" /></td>
                <td class="DialogTdTitle">节点分解：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="BeforePlanNode" style="width: 90%;" readonly="readonly" name="BeforePlanNode" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">所占分值：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="Point" style="width: 90%;" readonly="readonly" name="Point" runat="server" />
                </td>
                <td class="DialogTdTitle">所占金额（元）： 
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="GetCost" style="width: 90%;" readonly="readonly" name="GetCost" runat="server" />
                </td>
                <td class="DialogTdTitle">责任人： 
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="DutyUser" name="DutyUser" runat="server" />
                    <input type="text" class="easyui-validatebox" readonly="readonly" id="DutyUserName" style="width: 90%;" name="DutyUserName" runat="server" />
                </td>
                <td class="DialogTdTitle">考评人： 
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="EvaluationUser" name="EvaluationUser" runat="server" />
                    <input type="text" class="easyui-validatebox" readonly="readonly" id="EvaluationUserName" style="width: 90%;" name="EvaluationUserName" runat="server" />
                </td>
                <%--   <td class="DialogTdTitle">考评性质：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="CheckType" style="width: 90%;" readonly="readonly" name="CheckType" runat="server" />

                </td>
                <td class="DialogTdTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考评方法： 
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="CheckWay" style="width: 90%;" readonly="readonly" name="CheckWay" runat="server" />

                </td>
                <td class="DialogTdTitle">考评依据：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input class="easyui-validatebox" id="CheckBasis" style="width: 96.5%;height:20px;" readonly="readonly" name="CheckBasis" runat="server"></input>
                </td>--%>
            </tr>
            <tr style="height: 35px;">
                <td colspan="8" style="border: 3px solid #000000; text-align: center; font-size: 15px; border-color: #ffffff; background: #cccccc;">调整后计划信息</td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划调整类型：
                </td>
                <td class="DialogTdContent">
                    <select id="ChangeType" isdctype="true" dctype="计划调整类型" clientidmode="Static" name="ThisChangeType"
                        style="width: 90%; border: 1px solid #cccccc; height: 25px;" runat="server">
                        <option class="ChageTypeAdd" value="新增">新增
                        </option>
                        <option class="ChageTypeUpdate" value="变更">变更
                        </option>
                        <option class="ChageTypeUpdate" value="终止">终止
                        </option>
                        <option class="ChageTypeUpdate" value="取消">取消
                        </option>
                    </select>
                </td>
                <td class="DialogTdTitle">调整原因：
                </td>
                <td class="DialogTdContent" colspan="6">
                    <input class="easyui-validatebox" data-options="required:true" id="ChangeReson" style="width: 96.5%; " name="ChangeReson" runat="server"></input>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划内容
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input class="easyui-validatebox" data-options="required:true" id="ThisChangePlanContent" style="width: 96.5%; " name="ThisChangePlanContent" runat="server"></input>
                </td>
                <td class="DialogTdTitle">计划说明
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input class="easyui-validatebox" id="ThisChangePlanExplain" style="width: 96.5%; " name="ThisChangePlanExplain" runat="server"></input>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划开始时间
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ThisPlanStartTime" style="width: 90%;" onclick="checkDate()" name="ThisPlanStartTime" runat="server" />
                </td>
                <td class="DialogTdTitle">计划结束时间
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ThisPlanEndTime" style="width: 90%;" onclick="checkDate()" name="ThisPlanEndTime" runat="server" />
                </td>
                <td class="DialogTdTitle">是否关联预算：
                </td>
                <td class="DialogTdContent">
                    <select id="ThisIsConnectBudget" name="ThisIsConnectBudget" disabled="disabled"
                        style="width: 90%; height: 25px; border: 1px #cccccc solid;" class="easyui-validatebox" runat="server" data-options="required:true">
                        <option value="1">是</option>
                        <option value="0" selected="selected">否</option>
                    </select>
                </td>
                <td class="DialogTdTitle">关联预算方式：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="ThisConnectBudgetWay" value="生成预算调整" disabled="disabled" style="width: 90%;" readonly="readonly" name="ThisConnectBudgetWay" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">关联预算科目：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" class="easyui-validatebox" id="ThisConnectBudgetProject" disabled="disabled" style="width: 90%;" readonly="readonly" name="ThisConnectBudgetProject" runat="server" />
                    <input type="text" class="easyui-validatebox" id="ThisConnectBudgetProjectName" disabled="disabled" style="width: 90%;" readonly="readonly" name="ThisConnectBudgetProjectName" runat="server" />
                </td>
                <td class="DialogTdTitle">税率：
                </td>
                <td class="DialogTdContent">
                    <input type="text" id="ThisRate" name="ThisRate" class="easyui-validatebox" readonly="readonly" data-options="required:false" runat="server" style="width: 90%;" onkeyup="value=numTest(value)?value:''" onafterpaste="value=numTest(value)?value:''" />
                </td>
                <td class="DialogTdTitle">费用主管部门：</td>
                <td class="DialogTdContent">
                    <input id="ThisPayDepName" name="ThisPayDepName" type="text" class="easyui-validatebox" readonly="readonly" style="width: 90%;" />
                </td>
                <td class="DialogTdTitle">计划目标 
                </td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="ThisChangeTarget" style="width: 90%;" name="ThisChangeTarget" runat="server" />
                </td>
            </tr>
            <!------------------------->
            <tr>
                <td class="DialogTdTitle">计划费用（元）
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ThisChangePlanCost" style="width: 90%;" name="ThisChangePlanCost" runat="server" onkeyup="onlyNumber(this)" onblur="planchange()" placeholder="只能输入数字" />
                </td>
                <td class="DialogTdTitle">节点分解
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="ThisChangePlanNode" style="width: 90%;" name="ThisChangePlanNode" runat="server" />
                </td>
                <td class="DialogTdTitle">责任人： 
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="ThisDutyUser" name="ThisDutyUser" runat="server" />
                    <input type="text" class="easyui-validatebox" readonly="readonly" id="ThisDutyUserName" style="width: 90%;" name="ThisDutyUserName" runat="server" onclick="SelDutyUser()" />
                </td>
                <td class="DialogTdTitle">考评人： 
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="ThisEvaluationUser" name="ThisEvaluationUser" runat="server" />
                    <input type="text" class="easyui-validatebox" readonly="readonly" id="ThisEvaluationUserName" style="width: 90%;" name="ThisEvaluationUserName" runat="server" onclick="SelEvaluationUser()" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto;">
            <div id="TableContainer" style="height: auto;"></div>
        </div>
        <input type="hidden" id="IsAdd" name="IsAdd" runat="server" />
        <input type="hidden" id="UpdateState" name="UpdateState" runat="server" />
        <input type="hidden" id="ImportantPlanTitlenId" name="ImportantPlanTitlenId" runat="server" />
        <input type="hidden" id="PlanCostNum" name="PlanCostNum" runat="server" />
        <input type="hidden" id="PointNum" name="PointNum" runat="server" />
        <input type="hidden" id="GetCostNum" name="GetCostNum" runat="server" />
        <script type="text/javascript">
            //选择责任人
            function SelDutyUser() {
                var w = top.$(window).width();
                var h = top.$(window).height();
                localStorage.setItem("SelUserCode", $("#ThisDutyUser").val());
                localStorage.setItem("SelUserName", $("#ThisDutyUserName").val());

                HDialog.Open(w, h, '../Plan/SelUser.aspx?IsCheck=0', "选择责任人", false, function callback(_Data) {
                    localStorage.removeItem('SelUserCode');
                    localStorage.removeItem('SelUserName');
                    if (_Data > '') {
                        $("#ThisDutyUser").val(_Data.split('|')[0]);
                        $("#ThisDutyUserName").val(_Data.split('|')[1]);
                    }
                });
            }

            //选择考评人
            function SelEvaluationUser() {
                var w = top.$(window).width();
                var h = top.$(window).height();
                localStorage.setItem("SelUserCode", $("#ThisEvaluationUser").val());
                localStorage.setItem("SelUserName", $("#ThisEvaluationUserName").val());

                HDialog.Open(w, h, '../Plan/SelUser.aspx?IsCheck=0&IsNoControl=0', "选择考评人", false, function callback(_Data) {
                    localStorage.removeItem('SelUserCode');
                    localStorage.removeItem('SelUserName');
                    if (_Data > '') {
                        $("#ThisEvaluationUser").val(_Data.split('|')[0]);
                        $("#ThisEvaluationUserName").val(_Data.split('|')[1]);
                    }
                });
            }

            function numTest(num) {
                var reg = /^(\d?\d(\.\d*)?|100)$/;
                if (!num.match(reg)) {
                    return false;
                } else {
                    return true;
                }
            }

            var ReturnPlaningJsonObjectAll = []; //保存缓存数据

            $("#BtnIsPrint").click(function () {
                HDialog.Info("暂未开发！");
            });
            function btnClose() {
                HDialog.Close("");
            }

            function btnSave() {
                var ConnectBudgetProjectNameAlar = '无';
                if ($('#ThisConnectBudgetProjectName').val() != '') {

                    ConnectBudgetProjectNameAlar = $('#ThisConnectBudgetProjectName').val();
                }

                //清空缓存
                Cache.SetData("ReturnPlaningJsonObjectAll", "");
                var ReturnJsonObj = {
                    DetailId: $("#DetailId").val(),
                    ChangeType: $("#ChangeType").val(),
                    ChangeReson: $("#ChangeReson").val(),
                    ThisPlanStartTime: $("#ThisPlanStartTime").val(),
                    ThisPlanEndTime: $("#ThisPlanEndTime").val(),
                    ThisChangePlanContent: $("#ThisChangePlanContent").val(),
                    ThisChangePlanExplain: $("#ThisChangePlanExplain").val(),
                    ThisIsConnectBudget: $("#ThisIsConnectBudget").val(),
                    ThisConnectBudgetWay: $("#ThisConnectBudgetWay").val(),
                    ThisConnectBudgetProject: $("#ThisConnectBudgetProject").val(),
                    ThisConnectBudgetProjectName: ConnectBudgetProjectNameAlar,
                    ThisChangeTarget: $("#ThisChangeTarget").val(),
                    ThisChangePlanCost: $("#ThisChangePlanCost").val(),
                    Rate: $("#ThisRate").val(),
                    ThisChangePlanNode: $("#ThisChangePlanNode").val(),
                    DutyUser: $("#DutyUser").val(),
                    EvaluationUser: $("#EvaluationUser").val(),
                    DutyUserName: $("#DutyUserName").val(),
                    EvaluationUserName: $("#EvaluationUserName").val(),
                    ThisDutyUser: $("#ThisDutyUser").val(),
                    ThisEvaluationUser: $("#ThisEvaluationUser").val(),
                    ThisDutyUserName: $("#ThisDutyUserName").val(),
                    ThisEvaluationUserName: $("#ThisEvaluationUserName").val()

                };
                ReturnPlaningJsonObjectAll.push(ReturnJsonObj);
                Cache.SetData("ReturnPlaningJsonObjectAll", JSON.stringify(ReturnPlaningJsonObjectAll));
                HDialog.Close("true");


            }

            function checkDate() {
                WdatePicker({ dateFmt: 'yyyy-MM-dd' });
            }

            function PlanChoice() {
                return;
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Plan/PlanListDialog.aspx', '选择计划单', true, function callback(_Data) {

                    var rows = JSON.parse(_Data);
                    $("#DetailId").val(rows.DetailId);
                    $("#PlanId").val(rows.PlanId);
                    $("#PlanNO").val(rows.PlanNO);
                    $("#PlanCycle").val(rows.PlanCycle);
                    $("#PlanCycleName").val(rows.PlanCycleName);
                    $("#BlamePId").val(rows.BlamePId);
                    $("#BlamePIdName").val(rows.BlamePIdName);
                    $("#BlameDepCode").val(rows.BlameDepCode);
                    $("#BlameDepCodeName").val(rows.BlameDepCodeName);
                    $("#Remark").val(rows.Remark);
                    $("#Sort").val(rows.Sort);
                    $("#PlanType").val(rows.PlanType);
                    $("#PlanTypeName").val(rows.PlanTypeName);
                    $("#PlanName").val(rows.PlanName);
                    $("#BeforePlanStartTime").val(formatDate(rows.PlanStartTime, "yyyy-MM-dd"));
                    $("#BeforePlanEndTime").val(formatDate(rows.PlanEndTime, "yyyy-MM-dd"));
                    $("#BeforePlanContent").val(rows.PlanContent);
                    $("#BeforePlanExplain").val(rows.PlanExplain);
                    $("#BeforePlanCost").val(rows.PlanCost);
                    $("#BeforePlanNode").val(rows.PlanNode);
                    $("#BeforeTarget").val(rows.Target);
                    $("#CheckBasis").val(rows.CheckBasis);
                    $("#Point").val(rows.Point);
                    $("#GetCost").val(rows.GetCost);
                    $("#PlanRemark").val(rows.PlanRemark);
                    $("#ImportantPlanTitlenId").val(rows.ImportantPlanTitlenId);
                    $.tool.DataPostAsync('CsPlan', 'GetImplementPlanSengin', 'ImportantPlanTitlenId=' + $("#ImportantPlanTitlenId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $("#PlanCostNum").val(_Data);;
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                });

            }

            //加载计划
            function LoadData() {

                //加载直接传过来的对象
                rows = Cache.GetData("PlaningJsonDetailListRowData");
                if (rows != undefined && rows != "") {
                    $.JQForm._Data = rows;
                    $.JQForm.FillForm();
                    //加载 选择控件值
                    rows = eval("(" + rows.replace(/\\/g, "/") + ")");

                    if ($("#IsAdd").val() == '1')//判断新增还是修改计划
                    {
                        $("#ChangeType").val("新增");

                        $(".ChageTypeAdd").show();
                        $(".ChageTypeUpdate").hide();
                    } else {
                        $("#ChangeType").val("变更");
                        $(".ChageTypeAdd").hide();

                        $(".ChageTypeUpdate").show();

                    }
                    if (rows.ChangeType != null && rows.ChangeType != "") {

                        $("#ChangeType").val(rows.ChangeType);
                    } else {

                    }
                    if ($("#UpdateState").val() == '99') {
                        $("input").attr("disabled", "disabled");
                        $("select").attr("disabled", "disabled");
                    }


                    $("#ChangeReson").val(rows.ChangeReson);
                    $("#ThisPlanStartTime").val(formatDate(rows.ThisPlanStartTime, "yyyy-MM-dd"));
                    $("#ThisPlanEndTime").val(formatDate(rows.ThisPlanEndTime, "yyyy-MM-dd"));
                    $("#ThisChangePlanContent").val(rows.ThisChangePlanContent);
                    $("#ThisChangePlanExplain").val(rows.ThisChangePlanExplain);
                    $("#ThisIsConnectBudget").val(rows.ThisIsConnectBudget);
                    $("#ThisConnectBudgetWay").val("生成预算调整");
                    $("#ThisConnectBudgetProject").val(rows.ThisConnectBudgetProject);
                    $("#ThisConnectBudgetProjectName").val(rows.ThisConnectBudgetProjectName);
                    $("#IsConnectBudget").val(rows.ThisIsConnectBudget);
                    $("#ConnectBudgetWay").val("生成预算调整");
                    $("#ConnectBudgetProject").val(rows.ThisConnectBudgetProjectName);
                    $("#ThisChangeTarget").val(rows.ThisChangeTarget);
                    $("#ThisChangePlanCost").val(rows.ThisChangePlanCost);
                    $("#ThisChangePlanNode").val(rows.ThisChangePlanNode);
                    $("#BeforePlanNode").val(rows.ThisChangePlanNode);

                    $("#PayDepName").val(rows.PayDepName);
                    $("#ThisPayDepName").val(rows.PayDepName);
                    $("#Rate").val(rows.Rate);
                    $("#ThisRate").val(rows.Rate);

                    $("#DutyUser").val(rows.DutyUser);
                    $("#ThisDutyUser").val(rows.DutyUser);
                    $("#DutyUserName").val(rows.DutyUserName);
                    $("#ThisDutyUserName").val(rows.DutyUserName);
                    $("#EvaluationUser").val(rows.EvaluationUser);
                    $("#ThisEvaluationUser").val(rows.EvaluationUser);
                    $("#EvaluationUserName").val(rows.EvaluationUserName);
                    $("#ThisEvaluationUserName").val(rows.EvaluationUserName);

                    $("#PayDepCode").val(rows.PayDepCode);
                    if ('1' == '1') {
                        $("#DetailId").val(rows.DetailId);
                        $("#PlanId").val(rows.PlanId);
                        $("#PlanNO").val(rows.PlanNO);
                        $("#PlanCycleName").val(rows.PlanCycleAdd);
                        $("#BlamePIdName").val(rows.BlamePNameAdd);
                        $("#BlameDepCodeName").val(rows.BlameDepNameAdd);
                        $("#Remark").val(rows.Remark);
                        $("#Sort").val(rows.Sort);
                        $("#PlanType").val(rows.PlanType);
                        $("#PlanTypeName").val(rows.PlanTypeName);
                        $("#PlanName").val(rows.PlanName);
                        $("#BeforePlanStartTime").val(formatDate(rows.PlanStartTime, "yyyy-MM-dd"));
                        $("#BeforePlanEndTime").val(formatDate(rows.PlanEndTime, "yyyy-MM-dd"));
                        $("#BeforePlanContent").val(rows.PlanContent);
                        $("#BeforePlanExplain").val(rows.PlanExplain);
                        $("#BeforePlanCost").val(rows.PlanCost);

                        $("#BeforeTarget").val(rows.Target);
                        $("#Point").val(rows.Point);
                        $("#GetCost").val(rows.GetCost);
                        $("#PlanRemark").val(rows.PlanRemark);
                        $("#ImportantPlanTitlenId").val(rows.ImportantPlanTitlenId);

                    }
                    else {  //暂时不用
                        if ($("#IsAdd").val() == 0) {

                            //赋予初始值
                            $.tool.DataPostAsync('CsPlanChange', 'GetPlanDetail', 'DetailId=' + $("#DetailId").val(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                    var rows = varObjects[0];
                                    $("#DetailId").val(rows.DetailId);
                                    $("#PlanId").val(rows.PlanId);
                                    $("#PlanNO").val(rows.PlanNO);
                                    $("#PlanCycle").val(rows.PlanCycle);
                                    $("#PlanCycleName").val(rows.PlanCycleName);
                                    $("#BlamePId").val(rows.BlamePId);
                                    $("#BlamePIdName").val(rows.BlamePIdName);
                                    $("#BlameDepCode").val(rows.BlameDepCode);
                                    $("#BlameDepCodeName").val(rows.BlameDepCodeName);
                                    $("#Remark").val(rows.Remark);
                                    $("#Sort").val(rows.Sort);
                                    $("#PlanType").val(rows.PlanType);
                                    $("#PlanTypeName").val(rows.PlanTypeName);
                                    $("#PlanName").val(rows.PlanName);
                                    $("#BeforePlanStartTime").val(formatDate(rows.PlanStartTime, "yyyy-MM-dd"));
                                    $("#BeforePlanEndTime").val(formatDate(rows.PlanEndTime, "yyyy-MM-dd"));
                                    $("#BeforePlanContent").val(rows.PlanContent);
                                    $("#BeforePlanExplain").val(rows.PlanExplain);
                                    $("#BeforePlanCost").val(rows.PlanCost);
                                    $("#BeforePlanNode").val(rows.PlanNode);
                                    $("#BeforeTarget").val(rows.Target);
                                    $("#CheckType").val(rows.CheckType);
                                    $("#CheckWay").val(rows.CheckWay);
                                    $("#CheckBasis").val(rows.CheckBasis);
                                    $("#Point").val(rows.Point);
                                    $("#GetCost").val(rows.GetCost);
                                    $("#PlanRemark").val(rows.PlanRemark);
                                    $("#ImportantPlanTitlenId").val(rows.ImportantPlanTitlenId);

                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                }, false);
                        }
                    }

                    //清除缓存
                    Cache.SetData("PlaningJsonDetailListRowData", "");
                }
            }

            $("input[type='submit']").click(function (e) {
                var IsSubmitFlag = true;
                //if (IsSubmitFlag == false) {
                //    HDialog.Info("10秒内不要重复点击");
                //    return false;
                //}
                if (checkSubmit() == false) return false;
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);
                UpdateAmount(0);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                        HDialog.Info("请选择审批流程");
                        return false;
                    }

                    return true;
                }
                else {
                    return false;
                }
            });
            function SelWorkFlowType() {
                if ($("#PlanNO").val() == "") {
                    HDialog.Info("请选择计划单"); return;
                }

                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0017&Filter=0802&biaoshi=1&random=" + Math.random();

                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                        document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                        document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                    }
                });
            }



            function onlyNumber(obj) {
                //得到第一个字符是否为负号
                var t = obj.value.charAt(0);
                //先把非数字的都替换掉，除了数字和.
                obj.value = obj.value.replace(/[^\d\.]/g, '');
                //必须保证第一个为数字而不是.
                obj.value = obj.value.replace(/^\./g, '');
                //保证只有出现一个.而没有多个.
                obj.value = obj.value.replace(/\.{2,}/g, '.');
                //保证.只出现一次，而不能出现两次以上
                obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
                //如果第一位是负号，则允许添加
                if (t == '-') {
                    obj.value = '-' + obj.value;
                }
                //if (/^\d+\.?\d{0,2}$/.test(obj.value)) {
                //    obj.value = obj.value;
                //} else {
                //    obj.value = obj.value.substring(0, obj.value.length - 1);
                //}
            }

            //判断该修改计划是否管理重点计划，若管理则需判断


            function planchange() {
                if ($("#PlanNO").val() == "") {
                    HDialog.Info("请选择计划！");
                    $("#BeforePlanCost").val("");
                    return;
                }
                var ChangePlanCost = $("#ChangePlanCost").val();
                var BeforePlanCost = $("#BeforePlanCost").val();
                var PlanCostNum = $("#PlanCostNum").val();
                var SumPlanCost;

                if ($("#ImportantPlanTitlenId").val() != "") {
                    $.tool.DataPostAsync('CsPlan', 'GetImplementPlanNum', 'ImportantPlanTitlenId=' + $("#ImportantPlanTitlenId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (ChangePlanCost != "" && ChangePlanCost != null) {
                                SumPlanCost = parseFloat(ChangePlanCost) + parseFloat(varObjects[0].SumPlanCost) - parseFloat(BeforePlanCost);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);

                    if (PlanCostNum < SumPlanCost) {
                        HDialog.Info("计划费用不能大于当前选择重点计划的计划费用。");
                        return;
                    }
                }
            }

            LoadData();
        </script>
    </form>
</body>
</html>
