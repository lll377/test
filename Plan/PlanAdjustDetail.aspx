<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanAdjustDetail.aspx.cs" Inherits="M_Main.Plan.PlanAdjustDetail" %>

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
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">计划单号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="PlanNO" onclick="PlanChoice();" style="width: 90%;" name="PlanNO" runat="server" />
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
                    <input type="text" id="BlameDepCodeName" style="width: 90%;" class="easyui-validatebox" readonly="readonly" name="BlameDepCodeName" runat="server" /><!---class="easyui-datebox"  data-options="required:true"---->
                </td>
            </tr>
            <%-- <tr>
                <td class="DialogTdTitle">计划单备注：
                </td>
                <td class="DialogTdContent" colspan="7">
                    <textarea class="easyui-validatebox" id="Remark" name="Remark" style="width: 98.45%;" readonly="readonly" runat="server"></textarea>
                </td>
            </tr>--%>

            <tr>
                <td class="DialogTdTitle">序号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="Sort" style="width: 90%;" readonly="readonly" name="Sort" runat="server" />

                </td>
                <td class="DialogTdTitle">计划类型： 
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="PlanType" name="PlanType" runat="server" />
                    <input type="text" class="easyui-validatebox" id="PlanTypeName" style="width: 90%;" readonly="readonly" name="PlanTypeName" runat="server" />

                </td>

                <%-- </tr>
             <tr>--%>
                <td class="DialogTdTitle">计划名称：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" id="PlanName" style="width: 96.5%;height:20px;" readonly="readonly" name="PlanName" runat="server"></textarea>
                </td>

            </tr>
            <tr>
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
                <%-- </tr>
                  <tr>--%>
                <td class="DialogTdTitle">计划内容：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" id="BeforePlanContent" style="width: 96.5%;height:20px;" readonly="readonly" name="BeforePlanContent" runat="server"></textarea>

                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划说明：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" id="BeforePlanExplain" style="width: 96.5%;height:20px;" readonly="readonly" name="BeforePlanExplain" runat="server"></textarea>

                </td>
                <%--</tr>
             <tr>--%>
                <td class="DialogTdTitle">计划目标：
                </td>
                <td class="DialogTdContent">
                    <textarea class="easyui-validatebox" id="BeforeTarget" style="width: 90%;height:20px;" readonly="readonly" name="BeforeTarget" runat="server"></textarea>

                </td>
                <td class="DialogTdTitle">计划费用（元）：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="BeforePlanCost" style="width: 90%;" readonly="readonly" name="BeforePlanCost" runat="server" />

                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">节点分解：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" id="BeforePlanNode" style="width: 96.5%;" readonly="readonly" name="BeforePlanNode" runat="server" />

                </td>
    
                <td class="DialogTdTitle">考评性质：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="CheckType" style="width: 90%;" readonly="readonly" name="CheckType" runat="server" />

                </td>
                <td class="DialogTdTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考评方法： 
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="CheckWay" style="width: 90%;" readonly="readonly" name="CheckWay" runat="server" />

                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">考评依据：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" id="CheckBasis" style="width: 96.5%;height:20px;" readonly="readonly" name="CheckBasis" runat="server"></textarea>
                </td>
                <%--   </tr>
              <tr>--%>
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
            </tr>
            <tr>
                <%-- <td class="DialogTdTitle">计划备注： 
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" id="PlanRemark" style="width: 96.5%;" readonly="readonly" name="PlanRemark" runat="server" ></textarea>

                </td>--%>
                <%--  </tr>
              <tr>--%>
                <td class="DialogTdTitle">调整类型：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <select id="ChangeType" isdctype="true" dctype="调整类型" clientidmode="Static" name="ChangeType"
                        style="width: 150px; border: 1px solid #cccccc; height: 23px;" runat="server">
                        <option value="计划变更">计划变更
                        </option>
                        <option value="计划终止">计划终止
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">调整原因：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" data-options="required:true" id="ChangeReson" style="width: 96.5%;height:20px;" name="ChangeReson" runat="server"></textarea>

                </td>
                <%--</tr>
            
                  <tr>--%>
                <td class="DialogTdTitle">计划开始时间
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChangePlanStartTime" style="width: 90%;" onclick="checkDate()" name="ChangePlanStartTime" runat="server" />
                </td>
                <td class="DialogTdTitle">计划结束时间
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChangePlanEndTime" style="width: 90%;" onclick="checkDate()" name="ChangePlanEndTime" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划内容
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" data-options="required:true" id="ChangePlanContent" style="width: 96.5%;height:20px;" name="PlanContent" runat="server"></textarea>

                </td>
                <%-- </tr>
               <tr>--%>
                <td class="DialogTdTitle">计划说明
                </td>
                <td class="DialogTdContent" colspan="3">
                    <textarea class="easyui-validatebox" data-options="required:false" id="ChangePlanExplain" style="width: 96.5%;height:20px;" name="ChangePlanExplain" runat="server"></textarea>

                </td>
            </tr>
            <!------------------------->
            <tr>
                <td class="DialogTdTitle">计划目标 
                </td>
                <td class="DialogTdContent">
                    <textarea class="easyui-validatebox" data-options="required:true" id="ChangeTarget" style="width: 90%;height:20px;" name="ChangeTarget" runat="server"></textarea>
                </td>
                <td class="DialogTdTitle">计划费用（元）
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChangePlanCost" style="width: 90%;" name="ChangePlanCost" runat="server" onkeyup="onlyNumber(this)" onblur="planchange()" placeholder="只能输入数字" />
                </td>
                <%-- </tr>
              <tr>--%>
                <td class="DialogTdTitle">节点分解
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChangePlanNode" style="width: 96.5%;" name="ChangePlanNode" runat="server" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto;">
            <div id="TableContainer" style="height: auto;"></div>
        </div>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>
        <input type="hidden" id="ImportantPlanTitlenId" name="ImportantPlanTitlenId" runat="server" />
        <input type="hidden" id="PlanCostNum" name="PlanCostNum" runat="server" />
        <input type="hidden" id="PointNum" name="PointNum" runat="server" />
        <input type="hidden" id="GetCostNum" name="GetCostNum" runat="server" />
        <script type="text/javascript">
            $("#BtnIsPrint").click(function () {
                HDialog.Info("暂未开发！");
            });
            function btnClose() {
                HDialog.Close("");
            }
            function checkDate() {
                WdatePicker({ dateFmt: 'yyyy-MM-dd' });
            }
            function PlanChoice() {
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
                    $("#CheckType").val(rows.CheckType);
                    $("#CheckWay").val(rows.CheckWay);
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
            $("input[type='submit']").click(function (e) {
                var IsSubmitFlag = true;
                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }
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

                if ($("#ImportantPlanTitlenId").val() != ""){
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
                    alert(SumPlanCost)
                    if (PlanCostNum < SumPlanCost) {
                        HDialog.Info("计划费用不能大于当前选择重点计划的计划费用。");
                        return;
                    }
                    }
            }
        </script>
    </form>
</body>
</html>
