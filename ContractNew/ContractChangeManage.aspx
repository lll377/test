<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractChangeManage.aspx.cs" Inherits="M_Main.ContractNew.ContractChangeManage" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>经营合同变更页面</title>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />

    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>


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

        #FeesSettingDialog input[type=radio] {
            height: 16px;
        }

        #FeesSettingDialog label {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="ContractManage" runat="server">
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />

        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <input type="hidden" id="CommName" name="CommName" runat="server" />
        <input id="IsDelete" type="hidden" name="IsDelete" runat="server">
        <input type="hidden" id="ContID" name="ContID" runat="server" />
        <input id="DGridContIID" name="DGridContIID" type="hidden" runat="server" />
        <input type="hidden" id="ContractChangeManageID" name="ContractChangeManageID" runat="server" />
        <input id="ChangeState" name="ChangeState" type="hidden" runat="server" value="未启动" />
        <input type="hidden" id="Margin" name="Margin" runat="server" />

        <div>
            <div class="TopHead">
                <input type="button" id="BtnClose" value="关闭" />
                <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
                <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
                <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
                <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
                <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
                <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
                <input id="BtnIsPrint" type="button" value="打印" runat="server" />
                <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="return  ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
                <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
            </div>
            <div style="height: 4px;"></div>
            <table class="DialogTable">
                <tr>
                    <td class="DialogTdTitle">合同编号：
                    </td>
                    <td class="DialogTdContent"><%--PlanChoice(); onclick="ContractContSign();"--%>
                        <input type="text" class="easyui-validatebox" disabled="disabled" id="ContSign" style="width: 90%;" name="ContSign" runat="server" />

                    </td>
                    <td class="DialogTdTitle">变更类型：</td>
                    <td class="DialogTdContent">
                        <select id="ChangeType" readonly="readonly" name="ChangeType" runat="server" data-options="required:true">
                            <option value="变更" style="color: #000000;">变更</option>
                            <option value="终止" style="color: #000000;">终止</option>
                            <option value="关闭" style="color: #000000;">关闭</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle" style="color: red;">变更类别：
                    </td>
                    <td class="DialogTdContent">
                        <select id="ChangeCategoryID" name="ChangeCategoryID" runat="server" style="width: 120px; border: 1px #cccccc solid;" class="easyui-validatebox "></select>
                    </td>
                    <td class="DialogTdTitle" style="color: red;">变更原因：</td>
                    <td class="DialogTdContent">
                        <input id="ChangeReason" name="ChangeReason" style="width: 90%;" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle" style="color: red;">变更说明：
                    </td>
                    <td class="DialogTdContent" colspan="3">
                        <input id="ChangeExplain" name="ChangeExplain" style="width: 96%;" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td class="DialogTdTitle">原合同开始时间：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" style="width: 90%;" disabled="disabled" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            id="ContStartDate" name="ContStartDate" runat="server" />
                    </td>
                    <td class="DialogTdTitle">现合同开始时间：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" style="width: 90%;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" onkeypress="CheckDate();"
                            id="ThisContStartDate" name="ThisContStartDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">原合同结束时间：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" style="width: 90%;" disabled="disabled" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            id="ContEndDate" name="ContEndDate" runat="server" />
                    </td>
                    <td class="DialogTdTitle">现合同结束时间：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" style="width: 90%;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" onkeypress="CheckDate();"
                            id="ThisContEndDate" name="ThisContEndDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">原合同期限：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" id="ContractPeriod" disabled="disabled" style="width: 90%;" readonly="readonly" name="ContractPeriod" runat="server" />
                    </td>
                    <td class="DialogTdTitle">现合同期限：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" id="ThisContractPeriod" style="width: 90%;" name="ThisContractPeriod" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">原合同提醒时间：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" style="width: 90%;" disabled="disabled" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            id="EarlyWarningDate" name="EarlyWarningDate" runat="server" />
                    </td>
                    <td class="DialogTdTitle">现合同提醒时间：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" style="width: 90%;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            id="ThisEarlyWarningDate" name="ThisEarlyWarningDate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">原合同金额：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" id="ContAmount" style="width: 90%;" disabled="disabled" name="ContAmount" runat="server" />
                    </td>
                    <td class="DialogTdTitle">现合同金额：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" id="ThisContAmount" style="width: 90%;" name="ThisContAmount" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">原计费周期：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" id="PayPeriod" style="width: 90%;" disabled="disabled" name="PayPeriod" runat="server" />
                    </td>
                    <td class="DialogTdTitle">现计费周期：
                    </td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-validatebox" id="ThisPayPeriod" onkeyup="value=value.replace(/[^\d]/g,'')" onblur="javascript:GetPayPeriod();" style="width: 90%;" name="ThisPayPeriod" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">原计费方式：
                    </td>
                    <td class="DialogTdContent">
                        <select id="PayType" name="PayType" disabled="disabled" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="DialogTdTitle">现计费方式：
                    </td>
                    <td class="DialogTdContent">
                        <select id="ThisPayType" name="ThisPayType" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">原合同违约金延期</td>
                    <td class="TdContent">
                        <input style="z-index: 0" id="DelinType1" name="DelinType" disabled="disabled" value="0" checked type="radio" runat="server" />按
                        <input class="easyui-validatebox" id="DelinDelay" disabled="disabled" onblur='valuevalidatebox(this.id)' name="DelinDelay" runat="server" style="height: 22px; width: 40px; z-index: 0" />天之后;<br />
                        <input style="z-index: 0" id="DelinType2" name="DelinType" disabled="disabled" value="1" type="radio" runat="server" />推迟
                        <input id="DelinMonth" class="easyui-validatebox" disabled="disabled" style="height: 22px; width: 40px; z-index: 0" name="DelinMonth" onblur='valuevalidatebox(this.id)' runat="server" />月按
                        <input style="height: 22px; width: 40px; z-index: 0" disabled="disabled" id="DelinDay" class="easyui-validatebox" name="DelinDay" onblur='valuevalidatebox(this.id)' runat="server" />号开始(日期超过的,从次月计算)</td>
                    <td class="DialogTdTitle">现合同违约金延期</td>
                    <td class="TdContent">
                        <input style="z-index: 0" id="ThisDelinType1" name="ThisDelinType" value="0" checked type="radio" runat="server" />按
                        <input class="easyui-validatebox" id="ThisDelinDelay" onblur='valuevalidatebox(this.id)' name="ThisDelinDelay" runat="server" style="height: 22px; width: 40px; z-index: 0" />天之后;<br />
                        <input style="z-index: 0" id="ThisDelinType2" name="ThisDelinType" value="1" type="radio" runat="server" />推迟
                        <input id="ThisDelinMonth" class="easyui-validatebox" style="height: 22px; width: 40px; z-index: 0" name="ThisDelinMonth" onblur='valuevalidatebox(this.id)' runat="server" />月按
                        <input style="height: 22px; width: 40px; z-index: 0" id="ThisDelinDay" class="easyui-validatebox" name="ThisDelinDay" onblur='valuevalidatebox(this.id)' runat="server" />号开始(日期超过的,从次月计算)</td>

                </tr>
                <tr>
                    <td class="DialogTdTitle">原合同违约金比率：
                    </td>
                    <td class="DialogTdContent">
                        <input class="easyui-validatebox" id="DelinRates" disabled="disabled" name="DelinRates" runat="server" />(小数/天)
                    </td>
                    <td class="DialogTdTitle">现合同违约金比率：
                    </td>
                    <td class="DialogTdContent">
                        <input class="easyui-validatebox" id="ThisDelinRates" name="ThisDelinRates" runat="server" />(小数/天)
                    </td>
                </tr>
            </table>
            <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto; margin-top: 5px;">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" id="htbz" name="htbz" refpage="htbz" refsel="1"><a data-toggle="tab" href="#tab-20" aria-expanded="true">合同标准</a>
                        </li>
                        <li class="" name="htfy" id="htfy" refpage="htfy" refsel="0"><a data-toggle="tab" href="#tab-21" aria-expanded="false">合同费用</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-20" class="tab-pane active">
                            <div class="panel-body" style="padding: 0px;">
                                <input id="hiDGridCont" runat="server" type="hidden" name="hiDGridCont" />
                                <div class="SearchContainer" id="DGridCont" style="height: 300px"></div>
                            </div>
                        </div>
                        <div id="tab-21" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="datagrid-toolbar" id="divtt">
                                    <table style="width: 100%" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="float: right">
                                                <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="CaluFees();">计算费用</a>
                                                &nbsp;
                                            <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="AddFees();">新增费用</a>
                                                &nbsp;
                                            <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="DeleteFeesSingle();">删除费用</a>
                                                &nbsp;
                                            <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="DeleteFees();">批量删除</a>
                                        </tr>
                                    </table>
                                </div>
                                <div class="SearchContainer" id="DGridFee" style="height: 300px"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="OAFlow" style="height: auto; margin: 0px auto;">
                <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
            </div>
        </div>
        <div id="FeesSettingDialog" class="easyui-dialog" title="合同计费设置" data-options="iconCls:'icon-search',closed: true,modal:true,top:350"
            style="width: 900px; height: 260px;">
            <table width="100%">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCostNameByStand" data-options="editable:false" id="StandCommName" name="StandCommName" runat="server">
                        <input type="hidden" id="StandCommID" name="StandCommID" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="StandCustName" maxlength="50" name="StandCustName" class="easyui-searchbox" searcher="SelCustByStand" data-options="editable:false" runat="server" />
                        <input id="StandCustID" style="width: 8px; height: 19px" type="hidden" size="1" name="StandCustID" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">计费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeType" name="ChargeType" onchange="FeesSettingDialogChargeTypeChange(this)" runat="server">
                            <option value="根据合同标准计费">根据合同标准计费</option>
                            <option value="根据合同执行计费">根据合同执行计费</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始日期</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onkeypress="CheckDate();" id="BeginDate" onclick="WdatePicker()"
                            name="BeginDate" runat="server"></td>
                    <td class="TdTitle">结束日期</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onkeypress="CheckDate();" id="EndDate" onclick="WdatePicker()"
                            name="EndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCostName" data-options="required:true, editable:false" id="CostName" name="CostName" runat="server">
                        <input class="easyui-validatebox" id="hiCostName" style="height: 22px; width: 8px" type="hidden"
                            size="1" name="hiCostName" runat="server"><input class="easyui-validatebox" id="CostID" style="height: 22px; width: 8px" type="hidden"
                                size="1" name="CostID" runat="server"></td>
                    <td class="TdTitle">
                        <asp:Label ID="ShowName2" runat="server">应收日期</asp:Label></td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onkeypress="CheckDate();" id="DueDate" onclick="WdatePicker()"
                            name="DueDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">计算方式</td>
                    <td class="TdContentSearch" id="tdJSFS1">
                        <input id="CalcType1" onclick="rdoCalcType_OnClick();" type="radio" checked value="0" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按每月单价</label>
                        <input id="CalcType2" onclick="rdoCalcType_OnClick();" type="radio" value="1" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按缴费周期总额</label>
                        <input id="CalcType3" onclick="rdoCalcType_OnClick();" type="radio" value="2" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按缴费总额</label>
                    </td>
                    <td class="TdContentSearch" id="tdJSFS2" style="display: none;">
                        <input id="CalcType4" onclick="rdoCalcType_OnClick();" type="radio" value="3" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按数量单价</label>
                        <input id="CalcType5" onclick="rdoCalcType_OnClick();" type="radio" value="4" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按实际发生额</label>
                    </td>
                    <td class="TdTitle">
                        <div id="labelCalcType">单价(元/月)</div>
                    </td>
                    <td class="TdContentSearch">
                        <input class="easyui-validatebox" id="ContPrice" onblur='valuevalidatebox(this.id)'
                            name="ContPrice" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">数量</td>
                    <td class="TdContentSearch">
                        <input class="easyui-validatebox" id="ContNum" onblur='valuevalidatebox(this.id)'
                            name="ContNum" runat="server"></td>
                    <td class="TdTitle">递增方式</td>
                    <td class="TdContentSearch">
                        <input id="IncreType1" onclick="rdoIncreType_OnClick();" type="radio" checked value="0"
                            name="IncreType" runat="server"><label style="vertical-align: middle">按总额递增</label>
                        <input id="IncreType2" onclick="rdoIncreType_OnClick();" type="radio" value="1" name="IncreType"
                            runat="server"><label style="vertical-align: middle">按单价递增</label></td>
                </tr>
                <tr>
                    <td class="TdTitle">
                        <div id="LabelIncreRate">递增率(%)</div>
                    </td>
                    <td class="TdContentSearch">
                        <input class="easyui-validatebox" onblur='valuevalidatebox(this.id)' id="IncreRate" name="IncreRate"
                            runat="server"></td>
                    <td class="TdTitle">递增周期(月)</td>
                    <td class="TdContentSearch">
                        <input class="easyui-validatebox" onblur='valuevalidatebox(this.id)' id="IncrePeriod" name="IncrePeriod"
                            runat="server"></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <input class="button" id="btnOK" onserverclick="btnOK_ServerClick1" onclick="javascript: if (btnOK_Onclick() == false) return false;"
                            type="button" value="确定" name="btnOK" runat="server" style="height: 30px" />
                        <input class="button" id="btnUpdate" type="button" value="修改" onserverclick="btnUpdate_ServerClick1" style="display: none; height: 30px" onclick="javascript: if (btnUpdate_Onclick() == false) return false;" name="btnUpdate" runat="server" />
                        <input type="button" id="btnStandSave" style="display: none;" name="btnStandSave" runat="server" onserverclick="btnStandSave_ServerClick" value="保存" />
                        <input id="btnDridContDel" name="btnDridContDel" onserverclick="btnDridContDel_ServerClick" type="button" style="display: none" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
            </table>
        </div>

        <script type="text/javascript">

            function rdoCalcType_OnClick() {
                if (ContractManage.CalcType1.checked) {
                    getObject("labelCalcType").innerHTML = "单价(元/月)";
                    getObject("ContNum").disabled = false;
                    getObject("IncreType2").disabled = false;
                    $('#ContPrice').css("display", "");
                }
                else {
                    if (ContractManage.CalcType2.checked) {
                        getObject("labelCalcType").innerHTML = "周期总额(元)";
                        getObject("ContNum").value = "";
                        getObject("ContNum").disabled = true;
                        getObject("IncreType1").checked = true;
                        getObject("IncreType2").checked = false;
                        getObject("IncreType2").disabled = true;
                        $('#ContPrice').css("display", "");
                    }
                    else {
                        if (ContractManage.CalcType3.checked) {
                            getObject("labelCalcType").innerHTML = "总金额(元)";
                            getObject("ContNum").value = "";
                            getObject("ContNum").disabled = true;
                            getObject("IncreType1").checked = true;
                            getObject("IncreType2").checked = false;
                            getObject("IncreType2").disabled = true;
                            $('#ContPrice').css("display", "");
                        } else {
                            if (ContractManage.CalcType4.checked) {
                                getObject("labelCalcType").innerHTML = "单价(元/月)";
                                $('#ContPrice').css("display", "");

                            } else {
                                getObject("labelCalcType").innerHTML = "";
                                getObject("ContPrice").value = "";
                                $('#ContPrice').css("display", "none");
                            }
                        }
                    }
                }
            }


            function GetPayPeriod() {
                var vPayPeriod = $('#ThisPayPeriod').val();
                if (vPayPeriod > 100) {
                    alert("计费周期需要在1-100内！");
                    $('#ThisPayPeriod').val("100");
                    return false;
                }
                else if (vPayPeriod <= 0) {
                    alert("计费周期需要在1-100内！");
                    $('#ThisPayPeriod').val("1");
                    return false;
                }
            }

            function btnOK_Onclick() {
                if ($('#ChargeType').val() == "根据合同标准计费") {
                    if (ContractManage.BeginDate.value == "") {
                        HDialog.Info("请输入开始日期,此项不能为空!");
                        ContractManage.BeginDate.focus();
                        return false;
                    }
                    if (ContractManage.EndDate.value == "") {
                        HDialog.Info("请输入结束日期,此项不能为空!");
                        ContractManage.EndDate.focus();
                        return false;
                    }

                    if (ContractManage.DueDate.value == "") {
                        HDialog.Info("请输入应收日期,此项不能为空!");
                        ContractManage.DueDate.focus();
                        return false;
                    }
                    if (ContractManage.CalcType1.checked) {
                        if (ContractManage.ContNum.value == "") {
                            HDialog.Info("请输入数量,此项不能为空!");
                            ContractManage.ContNum.focus();
                            return false;
                        }
                    }

                    if (ContractManage.IncrePeriod.value != "") {
                        var varIncrePeriod = parseInt(ContractManage.IncrePeriod.value, 10);
                        var varPayPeriod = parseInt(ContractManage.PayPeriod.value, 10);
                        var varMultiple = parseInt(varIncrePeriod / varPayPeriod) + 1;
                        var varMod = varIncrePeriod % varPayPeriod;
                        var varNewPeriod = varMultiple * varPayPeriod;
                        if (varMod != 0) {
                            HDialog.Info("请输入递增周期,此项应为缴费周期的倍数!");
                            ContractManage.IncrePeriod.value = varNewPeriod;
                            ContractManage.IncrePeriod.focus();
                            return false;
                        }
                    }
                }

                if (ContractManage.CostID.value == "" || ContractManage.CostID.value == "0") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    ContractManage.CostName.focus();
                    return false;
                }

                if (ContractManage.StandCustID.value == "" || ContractManage.StandCustID.value == "0") {
                    HDialog.Info("请选择客户,此项不能为空!");
                    ContractManage.CostName.focus();
                    return false;
                }

                if (ContractManage.CalcType5.checked == false) {
                    if (ContractManage.ContPrice.value == "") {
                        HDialog.Info("请输入单价,此项不能为空!");
                        ContractManage.ContPrice.focus();
                        return false;
                    }
                }

                //if (ContractManage.ContPrice.value == "") {
                //    HDialog.Info("请输入单价,此项不能为空!");
                //    ContractManage.ContPrice.focus();
                //    return false;
                //}

                return true;
            }
            function btnUpdate_Onclick() {
                var Result = btnOK_Onclick();
                if (!Result) {
                    return false;
                }
                return true;
            }
            //计费方式验证
            function valuevalidatebox(obj) {
                if (isNaN($('#' + obj).val()) > 0) {
                    HDialog.Info("请输入大于的数字");
                    $('#' + obj).val('');
                    return false;
                }
            }
            //设置界面宽高
            function InitPurchaseTableHeight() {
                var w = $(window).width();
                var h = $(window).height();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("height", h - 140 + "px");

            }
            InitPurchaseTableHeight();

            $(".tabs-container li").click(function () {
                switch ($(this).attr("name")) {
                    case "htfy":
                        //合同费用
                        setTimeout("LoadFeesList()", 10);
                        break;
                }
            });

            //计算租金
            function CaluFees() {
                if ($("#State").val() == "已审核" || $("#State").val() == "审核中") {
                    HDialog.Info('合同变更已审核或者正在审核中!');
                    return false;
                }
                //计算费用
                $.tool.DataPost('Contract', 'ConFeesCalc_Ex', 'ContID=' + $('#ContID').val() + "&PayPeriod=" + $('#ThisPayPeriod').val() + "&PayType=" + $('#ThisPayType').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data.split('|');
                        HDialog.Info(r[1]);
                        if (r[0] == "true") {
                            LoadFeesList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }
            //添加费用
            function AddFees() {
                if ($("#State").val() == "已审核" || $("#State").val() == "审核中") {
                    HDialog.Info('合同变更已审核或者正在审核中!');
                    return false;
                }
                var w = 900;
                var h = 450;
                HDialog.Open(w, h, '../ContractNew/FeesSporadicManageByContract.aspx?OPType=Insert&ContID=' + $('#ContID').val(), '新增费用', false, function (_Data) {
                    if (_Data != '') {
                        HDialog.Info(_Data);
                        LoadFeesList();
                    }
                });
            }
            //删除费用  删除未审核和已审核费用 单条
            function DeleteFeesSingle() {
                DeleteFees();
            }
            //批量删除费用
            function DeleteFees() {
                var rows = $('#DGridFee').datagrid("getSelections");
                var IDList = "";
                var FeesID = "";
                if (rows.length == 0) {
                    HDialog.Info("请选择需要删除的费用！");
                    return false;
                }
                if ($("#State").val() == "已审核" || $("#State").val() == "审核中") {
                    HDialog.Info('合同变更已审核或者正在审核中!');
                    return false;
                }
                var FeesTypeStr = "未审核费用";
                var Items = rows.filter(function (e) {
                    return e.FeesType == "已审核费用";
                });
                var ItemsNo = rows.filter(function (e) {
                    return e.FeesType == "未审核费用";
                });
                //if (Items.length > 1) {
                //    HDialog.Info('已审核费用不允许批量删除!');
                //    return false;
                //}
                if (ItemsNo.length > 0 && Items.length > 0) {
                    HDialog.Info('已审核费用和未审核费用不允许同时删除!');
                    return false;
                }
                //只有一条已审核费用  或者  有多条未审核费用
                for (var i = 0; i < rows.length; i++) {

                    if (rows[i].FeesType == "未审核费用") {
                        if (IDList.length > 0) {
                            IDList += "," + rows[i].IID;
                        }
                        else {
                            IDList = rows[i].IID;
                        }
                    }
                    if (rows[i].FeesType == "已审核费用") {
                        FeesTypeStr = "已审核费用";
                        if (FeesID.length > 0) {
                            FeesID += "," + rows[i].IID;
                        }
                        else {
                            FeesID = rows[i].IID;
                        }
                    }
                }
                if (FeesTypeStr == "已审核费用") {
                    HDialog.Prompt("是否确认删除此费用", function () {
                        //变更里面的删除费用需要通过临时表中数据来判断  如果不审核通过那么就不生效
                        $.tool.DataPost('Contract', 'AuditionChangeDelFees', 'IDList=' + FeesID + "&ContID=" + $('#ContID').val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                var r = _Data.split('|');
                                HDialog.Info(r[1]);
                                if (r[0] == "true") {
                                    LoadFeesList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            }
                        );
                    });
                } else {
                    //删除未审核费用
                    $.tool.DataPost('Contract', 'AuditingConFeesDelAndSingle', 'IDList=' + IDList + "&ContID=" + $('#ContID').val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var r = _Data.split('|');
                            HDialog.Info(r[1]);
                            if (r[0] == "true") {
                                LoadFeesList();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            function FeesOperator(rowData, type) {
                //变更里面的删除费用需要通过临时表中数据来判断  如果不审核通过那么就不生效
                //var FeesRow = JSON.stringify(rowData);
                //$('#FeesRow').val(FeesRow);
                //$('#OperatorType').val(type);
                ////保存到隐藏文本框;
                //$.tool.DataPostNoLoading('Fees', "feescheck", $('#ContractManage').serialize(),
                //function Init() {
                //},
                //function callback(_Data) {
                //    if (_Data == "true") {
                //        var cotent = "";
                //        var Title = "";
                //        var width = 900;
                //        var height = 450;
                //        switch (type) {
                //            case "update":
                //                Title = "修改费用";
                //                conent = "../ChargesNew/FeesSporadicManage.aspx?OPType=Edit&FeesID=" + rowData.IID + "&CostGeneType=" + $('#CostGeneType').val();
                //                break;
                //            case "delete":
                //                Title = "删除费用";
                //                width = 600;
                //                height = 250;
                //                conent = "../DialogNew/FeesAmendDelDlg.aspx?FeesID=" + rowData.IID;
                //                break;
                //            case "split":
                //                Title = "拆分费用";
                //                conent = "../ChargesNew/FeesSplitManage.aspx?OPType=Edit&FeesID=" + rowData.IID + "&CostGeneType=" + $('#CostGeneType').val();
                //                break;
                //        }
                //        HDialog.Open(width, height, conent, Title, false, function callback(_Data) {
                //            if (_Data != "") {
                //                HDialog.Info(_Data);
                //                LoadContractFeesList();
                //            }
                //        });
                //    }
                //    else {
                //        HDialog.Info(_Data);
                //    }
                //},
                //function completeCallback() {

                //},
                //function errorCallback() {

                //});
            }

            // 合同计费信息设置 选择标准项目
            function SelCostNameByStand() {
                HDialog.Open(700, 400, '../DialogNew/CommDlg.aspx', "选择管理项目", false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var data = JSON.parse(_Data);
                        $('#StandCommName').searchbox("setValue", data.text);
                        $('#StandCommID').val(data.attributes.InPopedom);
                        //选择项目要把客户 费用项目设置为空
                        $('#StandCustName').searchbox("setValue", "");
                        $('#StandCustID').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#hiCostName').val("");
                        $('#CostID').val("");
                    }
                });
            }

            function SelCustByStand() {
                if ($('#StandCommID').val() == "") {
                    HDialog.Info("请选择标准项目");
                    return false;
                }
                var conent = "../DialogNew/CustDlg.aspx?CommID=" + $('#StandCommID').val();
                HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#StandCustName').searchbox("setValue", data.CustName);
                    $('#StandCustID').val(data.CustID);
                });
            }

            function SelCostName() {
                if ($('#StandCommID').val() == "") {
                    HDialog.Info("请选择标准项目");
                    return false;
                }
                //var conent = "../DialogNew/CostDlg.aspx?CommID=" + $('#StandCommID').val();
                //var w = 600;
                //var h = 450;
                var conent = "../dialogNew/CorpCommCostDlg.aspx?CommID=" + $('#StandCommID').val() + "&Ram=" + Math.random();
                var w = 700;
                var h = 400;

                HDialog.Open(w, h, conent, '收费项目选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CostID').val(data.CostID);
                    $('#CostName').searchbox("setValue", data.CostName);
                    $('#hiCostName').val(data.CostName);

                });
            }

            // 合同计费信息设置  计费类型改变
            function FeesSettingDialogChargeTypeChange(obj) {
                switch ($(obj).val()) {
                    case "根据合同标准计费":
                        $('#tdJSFS1').css("display", "");
                        $('#tdJSFS2').css("display", "none");
                        //$('#StandCustName').searchbox("setValue", "");
                        //$('#StandCustID').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#hiCostName').val("");
                        $('#CostID').val("");
                        getObject("CalcType1").checked = true;
                        $('#FeesSettingDialog table tr').each(function (index) {
                            $(this).css("display", "");
                            if (index == 3) {
                                $(this).children("td").eq(2).show();
                                $(this).children("td").eq(3).show();
                            }
                        });
                        $('#ContPrice').css("display", "");
                        getObject("labelCalcType").innerHTML = "单价(元/月)";
                        break;
                    case "根据合同执行计费":
                        $('#tdJSFS1').css("display", "none");
                        $('#tdJSFS2').css("display", "");
                        //$('#StandCustName').searchbox("setValue", "");
                        //$('#StandCustID').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#hiCostName').val("");
                        $('#CostID').val("");
                        getObject("CalcType4").checked = true;
                        $('#FeesSettingDialog table tr').each(function (index) {
                            if (index == 2 || index == 5 || index == 6) {
                                $(this).css("display", "none");
                            }
                            if (index == 3) {
                                $(this).children("td").eq(2).hide();
                                $(this).children("td").eq(3).hide();
                            }
                        });
                        getObject("labelCalcType").innerHTML = "单价(元/月)";
                        break;
                }
            }

            var FeesColumn = [[
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                //{ field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },

                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true }, // 添加退款
                { field: 'FeesType', title: '费用状态', width: 100, align: 'left', sortable: true }
            ]];

            function LoadFeesList() {
                $('#ChangeState').val($("#State").val());
                $("#DGridFee").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    //pageSize: top.ListPageSize,
                    //pageList: top.ListPageList,
                    columns: FeesColumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: false,
                    pagination: false,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Contract", "ContractFeesListEx", "DGridFee", param);
                    },
                    onLoadSuccess: function (data) {
                        var DueAmount = 0.00;
                        var PaidAmount = 0.00;
                        var PrecAmount = 0.00;
                        var WaivAmount = 0.00;
                        var DebtsAmount = 0.00;
                        var RefundAmount = 0.00;
                        //循环 计算合计内容
                        $.each(data.rows, function (i, item) {
                            DueAmount = DueAmount + parseFloat(ToDecimal(item.DueAmount, 2));
                            PaidAmount = PaidAmount + parseFloat(ToDecimal(item.PaidAmount, 2));
                            PrecAmount = PrecAmount + parseFloat(ToDecimal(item.PrecAmount, 2));
                            WaivAmount = WaivAmount + parseFloat(ToDecimal(item.WaivAmount, 2));
                            DebtsAmount = DebtsAmount + parseFloat(item.DebtsAmount);
                            RefundAmount = RefundAmount + parseFloat(item.RefundAmount);
                        });

                        //计算合计内容
                        $('#DGridFee').datagrid('reloadFooter', [
                            {
                                CommName: "合计",
                                DueAmount: ToDecimal(DueAmount, 2),
                                PaidAmount: ToDecimal(PaidAmount, 2),
                                PrecAmount: ToDecimal(PrecAmount, 2),
                                WaivAmount: ToDecimal(WaivAmount, 2),
                                DebtsAmount: ToDecimal(DebtsAmount, 2),
                                RefundAmount: ToDecimal(RefundAmount, 2)
                            }
                        ]);
                    }
                });
            }

            LoadFeesList();
            var DGridContcolumn = [[
                { field: 'StandCommName', title: '项目名称', width: '150', align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: '150', align: 'left', sortable: true },
                { field: 'ChargeType', title: '计费类型', width: '150', align: 'left', sortable: true },
                { field: 'DueDate', title: '应收日期', width: '150', align: 'left', sortable: true },
                { field: 'BeginDate', title: '开始日期', width: '150', align: 'left', sortable: true },
                { field: 'EndDate', title: '结束日期', width: '150', align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: '150', align: 'left', sortable: true },
                { field: 'ContNum', title: '数量', width: '150', align: 'left', sortable: true },
                { field: 'CalcTypeName', title: '计算方式', width: '150', align: 'left', sortable: true },
                { field: 'ContPrice', title: '单价', width: '150', align: 'left', sortable: true },
                { field: 'IncreTypeName', title: '递增方式', width: '150', align: 'left', sortable: true },
                { field: 'IncreRate', title: '递增率/金额', width: '150', align: 'left', sortable: true },
                { field: 'IncrePeriod', title: '递增周期', width: '150', align: 'left', sortable: true }
            ]];

            var DGridConttoolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        //默认设置当前项目
                        //设置默认值
                        $('#StandCommName').searchbox("setValue", $('#CommName').val());
                        $('#StandCommID').val($('#CommId').val());
                        $("#ChargeType").find("option:contains('根据合同标准计费')").attr("selected", true);
                        $('#BeginDate').val("");
                        $('#EndDate').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#CostID').val("");
                        $('#DueDate').val("");

                        $('#StandCustID').val("");
                        $('#StandCustName').searchbox("setValue", "");

                        getObject("CalcType1").checked = true;
                        getObject("labelCalcType").innerHTML = "单价(元/月)";
                        $('#ContNum').val("");
                        getObject("IncreType1").checked = true;
                        $('#IncrePeriod').val("");
                        $('#IncreRate').val("");
                        $('#ContPrice').val("");

                        //新增标准时默认 开始时间  结束时间 应收时间是合同的时间
                        if ($('#ThisContStartDate').val() != "") {
                            $('#BeginDate').val($('#ThisContStartDate').val());
                            $('#DueDate').val($('#ThisContStartDate').val());
                        }
                        if ($('#ThisContEndDate').val() != "") {
                            $('#EndDate').val($('#ThisContEndDate').val());
                        }


                        $('#btnOK').show();
                        $('#btnUpdate').hide();
                        $('#tdJSFS1').css("display", "");
                        $('#tdJSFS2').css("display", "none");

                        $('#FeesSettingDialog table tr').each(function (index) {
                            $(this).css("display", "");
                            if (index == 3) {
                                $(this).children("td").eq(2).show();
                                $(this).children("td").eq(3).show();
                            }
                        });
                        $('#FeesSettingDialog').parent().appendTo($("form:first"))
                        $('#FeesSettingDialog').dialog('open');
                    }
                }, '-',
                {
                    text: '修改',
                    iconCls: 'icon-save',
                    handler: function () {
                        var selectedRow = $('#DGridCont').datagrid('getSelected');
                        if (selectedRow == null) {
                            HDialog.Info("请选择需要修改的标准");
                            return;
                        }
                        if (selectedRow.ChargeType == "根据合同标准计费") {
                            $('#tdJSFS1').css("display", "");
                            $('#tdJSFS2').css("display", "none");
                            $('#FeesSettingDialog table tr').each(function (index) {
                                $(this).css("display", "");
                                if (index == 3) {
                                    $(this).children("td").eq(2).show();
                                    $(this).children("td").eq(3).show();
                                }
                            });
                        } else {
                            $('#tdJSFS1').css("display", "none");
                            $('#tdJSFS2').css("display", "");
                            $('#FeesSettingDialog table tr').each(function (index) {
                                if (index == 2 || index == 5 || index == 6) {
                                    $(this).css("display", "none");
                                }
                                if (index == 3) {
                                    $(this).children("td").eq(2).hide();
                                    $(this).children("td").eq(3).hide();
                                }
                            });
                        }

                        $.JQForm._Data = JSON.stringify(selectedRow);
                        $.JQForm.FillForm();
                        switch (selectedRow.CalcType) {
                            case "0":
                                getObject("CalcType1").checked = true;
                                getObject("labelCalcType").innerHTML = "单价(元/月)";
                                break;
                            case "1":
                                getObject("CalcType2").checked = true;
                                getObject("labelCalcType").innerHTML = "周期总额(元)";
                                break;
                            case "2":
                                getObject("CalcType3").checked = true;
                                getObject("labelCalcType").innerHTML = "总金额(元)";
                                break;
                            case "3":
                                getObject("CalcType4").checked = true;
                                getObject("labelCalcType").innerHTML = "单价(元/月)";
                                $('#ContPrice').css("display", "");
                                break;
                            case "4":
                                getObject("CalcType5").checked = true;
                                getObject("labelCalcType").innerHTML = "";
                                $('#ContPrice').css("display", "none");
                                break;
                        }
                        $('#DGridContIID').val(selectedRow.IID);
                        $('#CostName').searchbox("setValue", selectedRow.CostName);
                        $('#CostID').val(selectedRow.CostID);
                        $('#StandCommName').searchbox("setValue", selectedRow.StandCommName);
                        $('#StandCommID').val(selectedRow.StandCommID);

                        $('#StandCustName').searchbox("setValue", selectedRow.CustName);
                        $('#StandCustID').val(selectedRow.CustID);

                        $('#btnOK').hide();
                        $('#btnUpdate').show();
                        $('#FeesSettingDialog').parent().appendTo($("form:first"))
                        $('#FeesSettingDialog').dialog('open');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#DGridCont").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选择删除项！');
                            return;
                        }
                        else {
                            $('#DGridContIID').val(row.IID);
                            $('#btnDridContDel').click();
                        }
                    }
                }, '-',
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = $("#DGridCont").datagrid("getRows");
                        if (row.length == 0) {
                            HDialog.Info('没有需要保存的合同标准数据！');
                            return;
                        } else {
                            $('#btnStandSave').click();
                        }
                    }
                }, '-',
                {
                    text: '<div style="color:blue;">(说明：新增、修改合同标准后，必须先保存合同标准才能计算合同费用。)</div>'
                }
            ];

            if ($("#State").val() != "未启动" && $("#State").val() != "已驳回") {
                $('#divtt').hide();
                DGridConttoolbar = [];
                $("#ThisDelinType1").attr("disabled", "disabled");
                $("#ThisDelinType2").attr("disabled", "disabled");
            }

            function LoadDGridCont() {
                var Data = $('#hiDGridCont').val();
                var obj = JSON.parse(Data);
                $("#DGridCont").datagrid({
                    data: obj.rows,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: DGridContcolumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: false,
                    width: "100%",
                    toolbar: DGridConttoolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onLoadSuccess: function (data) {
                        //$('#FeesSettingDialog').dialog('close');
                    }
                });
            }
            LoadDGridCont();

            $("#BtnIsPrint").click(function () {
                //HDialog.Info("暂未开发！");
            });

            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (IsSubmitFlag == false) {
                    HDialog.Info("3秒内不要重复点击");
                    return false;
                }
                //var valideteReturn = Validate();
                //if (valideteReturn == "false") {
                //    return false;
                //}
                if (ClientClick()) {
                    IsSubmitFlag = false;
                    setTimeout('IsSubmitFlag=true', 3000);
                    var isValid = $("#ContractManage").form('validate');
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
                } else {
                    return false;
                }
            });

            function ClientClick() {
                //判断    本次合同金额+合同保证金≠合同费用明细金额之和
                //if ($('#ThisContAmount').val() != "" && $('#Margin').val() != "") {
                //    var FooterRows = $('#DGridFee').datagrid("getFooterRows");
                //    if (FooterRows == null) {
                //        HDialog.Info("请加载合同费用列表");
                //        return false;
                //    }
                //    var TotalDecimal = parseFloat($('#ThisContAmount').val()) + parseFloat($('#Margin').val()); // 合同费用之和
                //    if (FooterRows[0].DueAmount != ToDecimal(TotalDecimal, 2)) {
                //        HDialog.Info("本次合同金额+合同保证金≠合同费用明细金额之和，请确认；");
                //        return false;
                //    }
                //}
                return true;
            }

            // 单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if ($('#ChangeCategoryID').val() == "") {
                    HDialog.Info("请选择变更类别");
                    return;
                }
                if ($('#ChangeReason').val() == "") {
                    HDialog.Info("请输入变更原因");
                    return;
                }
                if ($('#ChangeExplain').val() == "") {
                    HDialog.Info("请输入变更说明");
                    return;
                }
                //获取审批流程
                $.tool.DataPostAsync('AuditCorpCostItemContract', 'List', 'AuditType=10&page=1&rows=10000&ChangeType1=' + $('#ChangeCategoryID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            var Items = eval("(" + _Data + ")");
                            if (Items.rows.length == 0) {
                                HDialog.Info("请设置合同变更流程后再进行操作!");
                                return;
                            }
                            var FlowId = "";
                            for (var i = 0; i < Items.rows.length; i++) {
                                if (i == 0) {
                                    FlowId = Items.rows[i].WorkFlowID;
                                } else {
                                    FlowId += "," + Items.rows[i].WorkFlowID;

                                }
                            }
                            if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=1202&biaoshi=1&FlowId=" + FlowId + "&random=" + Math.random();
                                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                                    if (_Data != '') {
                                        var obj = JSON.parse(_Data);
                                        LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                                        document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                                        document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                                    }
                                });
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }
        </script>
    </form>
</body>
</html>
