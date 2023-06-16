<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractReviewProcess.aspx.cs" Inherits="M_Main.CostManageNew.ContractReviewProcess" %>


<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>合同评审信息</title>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/GetWorkFlowId.js"></script>
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
</head>
<body>
    <form id="frmForm" runat="server">
        <%--盘点IDeas--%>
        <input type="hidden" id="Id" name="Id" runat="server" value="" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />


        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="Originator" name="Originator" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />
        <%--盘点单号--%>
        <input type="hidden" value="" runat="server" id="InventoryNum" name="InventoryNum" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <%--<input type="hidden" id="State" name="State" value="未启动" runat="server" />--%>
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />

        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">所属项目：
                </td>
                <td class="DialogTdContent">
                    <input id="CommName" name="CommName" class="easyui-validatebox" runat="server" readonly="readonly" />
                    <input type="hidden" id="CommId" name="CommId" runat="server" />
                </td>
                <td class="DialogTdTitle">机构部门：
                </td>
                <td class="DialogTdContent">
                    <input id="DepName" name="DepName" class="easyui-validatebox" runat="server" readonly="readonly" />
                    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
                </td>
                <td class="DialogTdTitle">负责人：
                </td>
                <td class="DialogTdContent">
                    <input id="PrincipalName" name="PrincipalName" class="easyui-validatebox" runat="server" readonly="readonly" />
                    <input type="hidden" id="Principal" name="Principal" runat="server" />
                </td>
                <td class="DialogTdTitle">合同编号：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractNo" name="ContractNo" class="easyui-validatebox" readonly="readonly" runat="server" />
                    <a id="personnalShow" style="color: blue; cursor: pointer; width: 50px;" onclick="ContractShow()">查看详情</a>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">合同名称：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractName" name="ContractName" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">合同类型：
                </td>
                <td class="DialogTdContent">
                    <input id="TypeName" name="TypeName" type="text" class="easyui-validatebox" readonly="readonly" runat="server" />
                    <input type="hidden" name="ContractType" id="ContractType" value="" runat="server" />
                </td>
                <td class="DialogTdTitle">签约类型：
                </td>
                <td class="DialogTdContent">
                    <input id="SignedType" name="SignedType" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">供方单位：
                </td>
                <td class="DialogTdContent">
                    <input id="SupplierName" name="SupplierName" type="text" class="easyui-validatebox" readonly="readonly" runat="server" />
                    <input type="hidden" name="SupplierId" id="SupplierId" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">是否战略分供方：
                </td>
                <td class="DialogTdContent">
                    <input id="IsStrategySupplier" name="IsStrategySupplier" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">合同期限：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractPeriod" name="ContractPeriod" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">开始时间：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractBegin" name="ContractBegin" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">结束时间：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractEnd" name="ContractEnd" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">合同内容</td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input type="text" id="ContractContent" name="ContractContent" readonly="readonly" runat="server" />
                </td>
            </tr>
            <%--合同描述--%>
            <tr>
                <td class="DialogTdTitle">合同描述</td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input type="text" id="ContractDesc" name="ContractDesc" readonly="readonly" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">上次合同金额：
                </td>
                <td class="DialogTdContent">
                    <input id="PriorPeriodMoney" name="PriorPeriodMoney" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">本次合同金额：
                </td>
                <td class="DialogTdContent">
                    <input id="ContractMoney" name="ContractMoney" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">合同质保金：
                </td>
                <td class="DialogTdContent">
                    <input id="MarginMoney" name="MarginMoney" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">合同违约金：
                </td>
                <td class="DialogTdContent">
                    <input id="PenaltyMoneh" name="PenaltyMoneh" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">付款方式：
                </td>
                <td class="DialogTdContent">
                    <input id="PayType" name="PayType" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
                <td class="DialogTdTitle">评审期限：
                </td>
                <td class="DialogTdContent">
                    <input id="ReviewLimit" name="ReviewLimit" class="easyui-validatebox" readonly="readonly" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input type="text" class="easyui-validatebox" id="Remark" name="Remark" readonly="readonly" runat="server" />
                </td>
            </tr>
        </table>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <script type="text/javascript">

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();


            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                        HDialog.Info("请选择审批流程");
                        return false;
                    }
                    var trlength = $("#WorkFlowNodeList tr").length;
                    if (trlength < 2) {
                        HDialog.Info("请给该流程设置处理人");
                        return false;
                    }
                    return true;
                }
                else {
                    return false;
                }
            });


            //采购申请单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                    var FlowId = GetWorkFlow.CostWorkFlowId('0701', $("#ContractType").val(), $("#ContractMoney").val());
                    if (FlowId == undefined || FlowId == "undefined") {
                        FlowId = "";
                    }
                    if (FlowId == "") {
                        HDialog.Info("请设置审核流程!");
                        return;
                    }

                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0701&biaoshi=1&FlowId=" + FlowId + "&InfoId=" + FlowId + "&random=" + Math.random();
                    HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                        if (_Data != '') {
                            var obj = JSON.parse(_Data);
                            LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                            document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                            document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                        }
                    });
            }

            //查看合同详情
            function ContractShow() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                if ($("#Id").val() == null || $("#Id").val() == "" || $("#Id").val() == undefined) {
                    HDialog.Info("请选择查看合同");
                    return;
                }
                HDialog.Open(w, h, '../CostManageNew/FromTabs.aspx?changBS=1&OpType=edit&Id=' + $("#Id").val(), '查看合同信息', true, function callback(_Data) {
                });
            }

            //打印
            $("#BtnIsPrint").click(function (e) {
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var InstanceTypeCode = "0015";
                var Attribute = "<Attribute><Id>" + $("#Id").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId><InstanceTypeCode>" + InstanceTypeCode + "</InstanceTypeCode></Attribute>";
                $.tool.Print("ContractReviewFrom", Attribute);
            });
        </script>

    </form>
</body>
</html>

