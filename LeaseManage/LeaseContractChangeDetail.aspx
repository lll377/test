﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseContractChangeDetail.aspx.cs" Inherits="M_Main.LeaseManage.LeaseContractChangeDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同合同变更</title>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../jscript/format.js"></script>
    <style type="text/css">
        body, html, form {
            padding: 0px;
            margin: 0px;
            overflow: hidden;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            line-height: 20px;
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
            width: 10%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .tabs-container .tabs-left .panel-body {
            margin-left: 0px;
        }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }

        .toolbartable {
            margin: 0;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }

        .TdContentSearch .InputRadio {
            cursor: pointer;
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input id="OpType" type="hidden" name="OpType" runat="server">
        <input id="CommID" type="hidden" name="CommID" runat="server">
        <input id="ID" type="hidden" name="ID" runat="server"><!-- 自动生成的合同id 流程使用 具有唯一性 -->
        <input id="ContractID" type="hidden" name="ContractID" runat="server"><!-- 合同主表id -->
        <input id="ContID" type="hidden" name="ContID" runat="server" />
        <input id="LeaseRoomResult" name="LeaseRoomResult" type="hidden" runat="server">
        <input id="LeaseSettingResult" name="LeaseSettingResult" type="hidden" runat="server">
        <input type="hidden" id="AuditStatus" name="AuditStatus" value="未启动" runat="server" />
        <div class="Content" style="overflow: auto; padding: 10px;">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">基本信息</legend>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">合同类型:</td>
                        <td class="TdContentSearch">
                            <select id="ContractCategory" name="ContractCategory" class="easyui-combobox" style="width: 80px;" runat="server" data-options="editable:false,panelHeight:'auto',disabled:true">
                                <option value="租赁合同">租赁合同</option>
                            </select>
                        </td>
                        <td class="TdTitle">合同类别:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractTypeName" name="ContractTypeName" runat="server" readonly class="easyui-validatebox TdContentSearchDisable" />
                        </td>
                        <td class="TdTitle">业务类别:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="BusinessTypeName" name="BusinessTypeName" runat="server" readonly class="easyui-validatebox TdContentSearchDisable" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">签约类型:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="SigningType" name="SigningType" runat="server" readonly class="easyui-validatebox TdContentSearchDisable" />
                        </td>
                        <td class="TdTitle">合同名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractName" name="ContractName" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">合同编号:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractSign" name="ContractSign" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">出租方信息</legend>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">出租方名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserName" name="LeaserName" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">出租方证件名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserPaperNameName" name="LeaserPaperNameName" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">出租方证件号码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserPaperCode" name="LeaserPaperCode" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">出租方(注册)地址:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserRegAddr" name="LeaserRegAddr" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        </td>
                        <td class="TdTitle">出租方邮政编码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserPostCode" name="LeaserPostCode" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">出租方法定代表人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserLegalPeople" name="LeaserLegalPeople" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">出租方联系人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserConnectpeople" name="LeaserConnectpeople" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        </td>
                        <td class="TdTitle">出租方联系电话:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserConnectTel" name="LeaserConnectTel" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">承租方信息</legend>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">承租方名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryCustName" name="TenantryCustName" searcher="SelTenantryCust" runat="server"
                                data-options="required:true,editable:false" class="easyui-searchbox" />
                            <a id="tipTenantryCust" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
                            <input type="hidden" id="TenantryCustID" name="TenantryCustID" runat="server" />
                        </td>
                        <td class="TdTitle">承租方证件名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryPaperName" name="TenantryPaperName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">承租方证件号码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryPaperCode" name="TenantryPaperCode" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">承租方(注册)地址:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryRegAddr" name="TenantryRegAddr" maxlength="240" runat="server" data-options="required:true" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">承租方经营(居住)地址:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryLiveAddr" name="TenantryLiveAddr" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">承租方邮政编码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryPostCode" name="TenantryPostCode" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">承租方法定代表人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryLegalPeople" name="TenantryLegalPeople" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">承租方联系人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryConnectpeople" name="TenantryConnectpeople" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">承租方联系电话:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryConnectTel" name="TenantryConnectTel" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">经营业态:</td>
                        <td class="TdContentSearch">
                            <select id="TenantryPlanFormat" name="TenantryPlanFormat" style="width: 120px;" class="easyui-combobox" runat="server"
                                data-options="editable:false,panelHeight:'auto',width:'auto'">
                            </select>
                        </td>
                        <td class="TdTitle">经营品牌:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryManageBrand" name="TenantryManageBrand" maxlength="45" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle">经营级别:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryManageLevel" name="TenantryManageLevel" maxlength="45" class="easyui-validatebox" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">享受优惠政策:</td>
                        <td class="TdContentSearch">
                            <select id="TenantryPreferentialPolicy" name="TenantryPreferentialPolicy" style="width: 120px;" class="easyui-combobox" runat="server"
                                data-options="editable:false,panelHeight:'auto',width:'auto'">
                            </select>
                        </td>
                        <td class="TdTitle">优惠证件编号:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryPreferentialPolicyIdCode" name="TenantryPreferentialPolicyIdCode" maxlength="140" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">管理方信息</legend>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">管理方名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideName" name="ManageSideName" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">管理方证件名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSidePaperNameName" name="ManageSidePaperNameName" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">管理方证件号码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSidePaperCode" name="ManageSidePaperCode" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">管理方(注册)地址:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideRegAddr" name="ManageSideRegAddr" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">管理方邮政编码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSidePostCode" name="ManageSidePostCode" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">管理方法定代表人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideLegalPeople" name="ManageSideLegalPeople" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">管理方联系人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideConnectPeople" name="ManageSideConnectPeople" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">管理方联系电话:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideConnectTel" name="ManageSideConnectTel" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">租赁信息</legend>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">合同开始时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractBeginTime" name="ContractBeginTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:true,onSelect:ContractTimeSelect" />
                        </td>
                        <td class="TdTitle">合同结束时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractEndTime" name="ContractEndTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:true,onSelect:ContractTimeSelect" />
                        </td>
                        <td class="TdTitle">合同期限(月):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-numberbox"
                                data-options="required:true,min:1,precision:0" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">合同到期提醒:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractRemindOfExpiration" name="ContractRemindOfExpiration" class="easyui-datebox" runat="server" data-options="editable:false" />
                        </td>
                        <td class="TdTitle">优惠免租结束时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RentFreeEndTime" name="RentFreeEndTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,onSelect:RentFreeEndTimeSelect" />
                        </td>
                        <td class="TdTitle">优惠原因:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RentFreeReason" name="RentFreeReason" maxlength="240" class="easyui-validatebox" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">顺延起租开始时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="PostPoneBeginTime" name="PostPoneBeginTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,onSelect:PostPoneBeginTimeSelect" />
                        </td>
                        <td class="TdTitle">顺延原因:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="PostPoneReason" name="PostPoneReason" maxlength="240" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">租赁房屋:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="LeaseRoomSigns" name="LeaseRoomSigns" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">房屋地址:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="LeaseRoomAddr" name="LeaseRoomAddr" maxlength="1500" runat="server" class="easyui-validatebox"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">房屋描述:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="LeaseRoomDis" name="LeaseRoomDis" maxlength="1500" runat="server" class="easyui-validatebox"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">租赁用途:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="LeaseRoomPurpose" name="LeaseRoomPurpose" maxlength="1500" runat="server" class="easyui-validatebox"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">建筑面积(平米):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaseRoomBuildArea" name="LeaseRoomBuildArea" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">计租面积(平米):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaseRoomRentalArea" name="LeaseRoomRentalArea" class="easyui-numberbox"
                                data-options="required:true,min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">计租方式:</td>
                        <td class="TdContentSearch" colspan="5">
                            <label class="InputRadio">
                                <input type="radio" id="WayToRentCalculation" name="WayToRentCalculation" value="0" runat="server" checked />&nbsp;<span>定额方式</span></label>
                            <label class="InputRadio">
                                <input type="radio" name="WayToRentCalculation" value="1" runat="server" disabled="disabled" />&nbsp;<span>提成方式</span></label>
                            <label class="InputRadio">
                                <input type="radio" name="WayToRentCalculation" value="2" runat="server" disabled="disabled" />&nbsp;<span>保底+提成方式</span></label>
                            <label class="InputRadio">
                                <input type="radio" name="WayToRentCalculation" value="3" runat="server" disabled="disabled" />&nbsp;<span>保底、提成就高方式</span></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">计算方式:</td>
                        <td class="TdContentSearch" colspan="3">
                            <label class="InputRadio">
                                <input type="radio" id="CalculationMethod2" name="CalculationMethod" value="3" runat="server" checked />&nbsp;<span>按每天单价</span></label>
                            <label class="InputRadio">
                                <input type="radio" id="CalculationMethod1" name="CalculationMethod" value="0" runat="server" />&nbsp;<span>按每月单价</span></label>
                            <label class="InputRadio">
                                <input type="radio" id="CalculationMethod3" name="CalculationMethod" value="1" runat="server" />&nbsp;<span>按缴费周期总额</span></label>
                            <label class="InputRadio">
                                <input type="radio" id="CalculationMethod4" name="CalculationMethod" value="2" runat="server" />&nbsp;<span>按租赁期间总额</span></label>
                        </td>
                        <td class="TdTitle">租金标准(<lable id="RentStandardUnit">元/月.平米</lable>):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RentStandard" name="RentStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle" colspan="6" style="text-align: left;">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="BtnOpenOrClose">更多标准展开/折叠</a>
                        </td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">物管费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="PropertyManageCostStandard" name="PropertyManageCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">物管费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="PropertyManageCostUnit" name="PropertyManageCostUnit" maxlength="24" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">水费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WaterCostStandard" name="WaterCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">水费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WaterCostUnit" name="WaterCostUnit" maxlength="24" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">电费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ElectricCostStandard" name="ElectricCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">电费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ElectricCostUnit" name="ElectricCostUnit" maxlength="24" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">气费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="GasCostStandard" name="GasCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">气费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="GasCostUnit" name="GasCostUnit" maxlength="24" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">空调费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="AirConditionerCostStandard" name="AirConditionerCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">空调费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="AirConditionerCostUnit" name="AirConditionerCostUnit" maxlength="24" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">供热费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="HeatSupplyCostStandard" name="HeatSupplyCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">供热费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="HeatSupplyCostUnit" name="HeatSupplyCostUnit" maxlength="24" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">垃圾清运费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WasteTransportCostStandard" name="WasteTransportCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">垃圾清运费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WasteTransportUnit" name="WasteTransportUnit" maxlength="24" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">合同总价(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractTotalPrice" name="ContractTotalPrice" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">上次合同总价(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LastContractTotalPrice" name="LastContractTotalPrice" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                        <td class="TdTitle">合同保证金(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractDeposit" name="ContractDeposit" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">合同保证金描述:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractDepositDes" name="ContractDepositDes" maxlength="90" class="easyui-validatebox" runat="server" />
                        </td>
                        <td class="TdTitle">计费方式:</td>
                        <td class="TdContentSearch">
                            <select id="ChargingMode" name="ChargingMode" class="easyui-combobox" style="width: 80px;" runat="server" data-options="editable:false,panelHeight:'auto',width:'auto'">
                                <option value="0">按对时</option>
                                <option value="1">按整月</option>
                            </select>
                        </td>
                        <td class="TdTitle" colspan="2" style="text-align: left;">
                            <input id="IsContinuityCharging" type="checkbox" value="" name="IsContinuityCharging" runat="server">&nbsp;按对时按每月单价计算时,多个期间不同单价,是否连续计费?</td>
                    </tr>
                    <tr>
                        <td class="TdTitle">支付方式:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="PaymentMethod" name="PaymentMethod" maxlength="1800" runat="server" class="easyui-validatebox"></textarea>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">其它信息</legend>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">是否范本合同:</td>
                        <td class="TdContentSearch">
                            <select id="IsModelContract" name="IsModelContract" class="easyui-combobox" style="width: 60px;" runat="server" data-options="editable:false,panelHeight:'auto',disabled:true">
                                <option value="是">是</option>
                                <option value="否">否</option>
                            </select>
                        </td>
                        <td class="TdTitle">合同范本来源:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ModelContractSource" name="ModelContractSource" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">范本修改内容:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="ModelUpdateContent" name="ModelUpdateContent" runat="server" readonly class="easyui-validatebox TdContentSearchDisable"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">合同内容描述:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="ContractDescribe" name="ContractDescribe" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">备注:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="Remark" name="Remark" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">合同份数:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractNumber" name="ContractNumber" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">每份页数:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractPaperNumber" name="ContractPaperNumber" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">附件数量:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="AdjunctNumber" name="AdjunctNumber" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">机构部门/负责人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        </td>
                        <td class="TdTitle">签约时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractSignTime" name="ContractSignTime" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">登记时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractRegisterTime" name="ContractRegisterTime" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">变更信息</legend>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">变更类型:</td>
                        <td class="TdContentSearch">
                            <select id="ContractChangeType" name="ContractChangeType" class="easyui-combobox" style="width: 60px;" runat="server" data-options="editable:false,panelHeight:'auto',required:true,onSelect:ContractChangeTypeSelect">
                                <option value="变更">变更</option>
                                <option value="退租">退租</option>
                            </select>
                        </td>
                        <td class="TdTitle">退租类型:</td>
                        <td class="TdContentSearch">
                            <select id="RetreatRentType" name="RetreatRentType" class="easyui-combobox" style="width: 120px;" runat="server" data-options="editable:false,panelHeight:'auto'">
                                <option value=""></option>
                                <option value="正常退租">正常退租</option>
                                <option value="非正常退租">非正常退租</option>
                            </select>
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">变更说明:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="ContractChangeExplain" name="ContractChangeExplain" runat="server" maxlength="1800" class="easyui-validatebox"></textarea>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <!-- 房屋租赁子表内容数据 -->
            <div id="SubItem">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" id="fuzl" name="fuzl" refpage="fuzl" refsel="1"><a data-toggle="tab" href="#tab-11" aria-expanded="true">租赁房屋</a>
                        </li>
                        <li class="" name="jfbz" id="jfbz" refpage="jfbz" refsel="0"><a data-toggle="tab" href="#tab-12" aria-expanded="false">计费标准</a>
                        </li>
                        <li class="" name="htfy" id="htfy" refpage="htfy" refsel="0"><a data-toggle="tab" href="#tab-13" aria-expanded="false">合同费用</a>
                        </li>
                        <li class="" name="qtfy" id="qtfy" refpage="qtfy" refsel="0"><a data-toggle="tab" href="#tab-14" aria-expanded="false">其他费用</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <!-- 租赁房屋 -->
                        <div id="tab-11" class="tab-pane active">
                            <div class="panel-body" style="padding: 0px;">
                                <div style="width: 100%; background-color: #cccccc;" id="TableContainerZLFW"></div>
                            </div>
                        </div>
                        <!-- 计费标准 -->
                        <div id="tab-12" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div style="width: 100%; background-color: #cccccc;" id="TableContainerJFBZ"></div>
                            </div>
                        </div>
                        <!-- 合同费用 -->
                        <div id="tab-13" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <table class="FeesToolBar" border="0" cellspacing="0" cellpadding="0" style="width: 100%; display: none;">
                                    <tr>
                                        <td style="text-align: right;">
                                            <a href="#" class="easyui-linkbutton" id="jszj" data-options="iconCls:'icon-save'" onclick="CaluFees();">计算租金</a>
                                            <a href="#" class="easyui-linkbutton" id="fydj" data-options="iconCls:'icon-add'" onclick="AddFees();">费用登记</a>
                                            <a href="#" class="easyui-linkbutton" id="dbsc" data-options="iconCls:'icon-cancel'" onclick="DeleteOneFees();">单笔删除</a>
                                            <a href="#" class="easyui-linkbutton" id="plsc" data-options="iconCls:'icon-cancel'" onclick="DeleteFees();">批量删除</a>
                                            <a href="#" class="easyui-linkbutton" id="cutFees" data-options="iconCls:'icon-cancel'" onclick="CutFeesAfter();">拆分租赁结束后的费用</a>
                                            <a href="#" class="easyui-linkbutton" id="sczlhfy" data-options="iconCls:'icon-cancel'" onclick="DeleteFeesAfter();">删除租赁结束后的费用</a>
                                        </td>
                                    </tr>
                                </table>
                                <div style="width: 100%; background-color: #cccccc;" id="TableContainerHTFY"></div>
                            </div>
                        </div>
                        <!-- 其他费用 -->
                        <div id="tab-14" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div style="width: 100%; background-color: #cccccc;" id="TableContainerQTFY"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 流程内容 -->
            <div id="OAFlow" style="height: auto; margin: 0px auto;">
                <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
            </div>
            <!-- 按钮工具栏 -->
            <div style="text-align: center; width: 100%; padding: 5px 0; height: 40px;">
                <input class="button" type="button" id="BtnClose" value="关闭" />
                <input class="button" id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
                <input class="button" id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
                <input class="button" id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
                <input class="button" id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
                <input class="button" id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
                <input class="button" id="BtnSave" type="submit" value="保存并修改" onserverclick="BtnSave_ServerClick" runat="server" />
                <input class="button" id="BtnSaveAndClose" type="submit" value="保存并关闭" onserverclick="BtnSaveAndClose_ServerClick" runat="server" />
                <input class="button" id="BtnPrint" type="button" value="打印" style="display: none;" runat="server" />
            </div>
        </div>
    </form>
    <script type="text/javascript">
        //初始化页面控件高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $(".Content").css({ "height": h + "px" });
            $('.panel-body').css({ "height": h + "px" });
            $('#SubItem .panel-body').css({ "height": "340px" });
        }

        //合同开始时间选择
        function ContractTimeSelect(date) {
            //获取开始
            var BeginTime = $('#ContractBeginTime').datebox("getValue");
            //获取结束时间
            var EndTime = $('#ContractEndTime').datebox("getValue");
            if (EndTime != "" && BeginTime != "") {
                if ((new Date(BeginTime)) >= (new Date(EndTime))) {
                    $(this).datebox("setValue", "");
                } else {
                    //计算月度差 填入【合同期限（月）】
                    var MonthDifference = CalcDiffMonth(BeginTime, EndTime);
                    $('#ContractPeriod').numberbox("setValue", MonthDifference);
                }
            }
            //判断 优惠免租结束时间
            if ($('#RentFreeEndTime').datebox("getValue") != "" && BeginTime != "") {
                if ((new Date(BeginTime)) >= (new Date($('#RentFreeEndTime').datebox("getValue")))) {
                    var RentFreeEndTime = AddDate(new Date(BeginTime), 1);
                    $('#RentFreeEndTime').datebox("setValue", $.dateFormat(RentFreeEndTime, 'yyyy-MM-dd'));
                }
            }
            //判断 顺延起租开始时间
            if ($('#PostPoneBeginTime').datebox("getValue") != "" && BeginTime != "") {
                if ((new Date(BeginTime)) >= (new Date($('#PostPoneBeginTime').datebox("getValue")))) {
                    var PostPoneBeginTime = AddDate(new Date(BeginTime), 1);
                    $('#PostPoneBeginTime').datebox("setValue", $.dateFormat(PostPoneBeginTime, 'yyyy-MM-dd'));
                }
            }
        }
        //优惠免租结束时间选择
        function RentFreeEndTimeSelect(date) {
            var ContractBeginTime = $('#ContractBeginTime').datebox("getValue");
            if (ContractBeginTime != "") {
                if ((new Date(ContractBeginTime)) >= (new Date($('#RentFreeEndTime').datebox("getValue")))) {
                    var RentFreeEndTime = AddDate(new Date(ContractBeginTime), 1);
                    $('#RentFreeEndTime').datebox("setValue", $.dateFormat(RentFreeEndTime, 'yyyy-MM-dd'));
                }
            }
        }
        //顺延起租开始时间
        function PostPoneBeginTimeSelect(date) {
            var ContractBeginTime = $('#ContractBeginTime').datebox("getValue");
            if (ContractBeginTime != "") {
                if ((new Date(ContractBeginTime)) >= (new Date($('#PostPoneBeginTime').datebox("getValue")))) {
                    var PostPoneBeginTime = AddDate(new Date(ContractBeginTime), 1);
                    $('#PostPoneBeginTime').datebox("setValue", $.dateFormat(PostPoneBeginTime, 'yyyy-MM-dd'));
                }
            }
        }
        //计算月份差 填入【合同期限（月）】
        function CalcDiffMonth(BeginTime, EndTime) {
            // 拆分年月日
            BeginTime = BeginTime.split('-');
            // 得到日期
            var BeginTimeDays = parseInt(BeginTime[2]);
            // 得到月数
            BeginTime = parseInt(BeginTime[0]) * 12 + parseInt(BeginTime[1]);
            // 拆分年月日
            EndTime = EndTime.split('-');
            // 得到日期
            var EndTimeDays = parseInt(EndTime[2]);
            // 得到月数
            EndTime = parseInt(EndTime[0]) * 12 + parseInt(EndTime[1]);
            var m = Math.ceil(EndTime - BeginTime);
            if (m == 0) {
                m = 1;
            } else {
                if (EndTimeDays >= BeginTimeDays) {
                    m = m + 1;
                }
            }
            return m;
        }
        function AddDate(dateTime, days) {
            dateTime = dateTime.setDate(dateTime.getDate() + days);
            dateTime = new Date(dateTime);
            return dateTime;
        }
        //选择承租方
        function SelTenantryCust() {
            HDialog.Open('760', '400', "../DialogNew/CustDlg.aspx", '承租方选择', false, function callback(_Data) {
                if (_Data != "") {
                    var data = JSON.parse(_Data);
                    var OldCustID = $('#TenantryCustID').val();
                    $('#TenantryCustName').searchbox("setValue", data.CustName);
                    $('#TenantryCustID').val(data.CustID);
                    $('#TenantryPaperName').val(data.PaperName);
                    $('#TenantryPaperCode').val(data.PaperCode);
                    $('#TenantryLiveAddr').val(data.Address);
                    $('#TenantryPostCode').val(data.PostCode);
                    $('#TenantryLegalPeople').val(data.LegalRepr);
                    $('#TenantryConnectpeople').val(data.Recipient);
                    $('#TenantryConnectTel').val(data.MobilePhone);
                    //判断如果修改了承租方的话 需要将标准的费用承担对象修改为当前承租方
                    if (OldCustID != data.CustID) {
                        //计算费用
                        $.tool.DataPostJson('LeaseManage', 'LeaseContractChangeUpdateCustID', "ContractID=" + $('#ContractID').val() + "&NewCustID=" + data.CustID + "&OldCustID=" + OldCustID,
                            function Init() {
                            },
                            function callback(data) {
                                if (data.result) {
                                    $('#LeaseSettingResult').val(data.data);
                                    $(".tabs-container li").each(function (e) {
                                        if ($(this).attr("name") == "jfbz") {
                                            if ($(this).hasClass("active")) {
                                                LoadContractSetting();
                                                return false;//实现break功能
                                            } else {
                                                $(this).attr("refsel", "1");
                                            }
                                        }
                                    });
                                } else {
                                    HDialog.Info(data.msg);
                                }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }
                }
            });
        }
        //变更类型选择
        function ContractChangeTypeSelect(record) {
            if (record.value == "退租") {
                $('#RetreatRentType').combobox({
                    required: true
                });
            } else {
                $('#RetreatRentType').combobox({
                    required: false
                });
            }
        }

        /* 租赁房屋 */
        var RoomColumn = [[
            { field: 'RoomSign', title: '房屋编号', width: '170', align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: '170', align: 'left' },
            { field: 'BuildArea', title: '建筑面积', width: '80', align: 'center' },
            {
                field: 'RoomRentalArea', title: '计租面积', width: '80', align: 'center', editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        precision: 2,
                        required: true
                    }
                }
            },
            {
                field: 'LeaseBeginTime', title: '租赁开始时间', width: '120', align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false,
                        required: true,
                        onSelect: function (date) {
                            //判断合同开始时间是否为空
                            var BeginTime = $('#ContractBeginTime').datebox("getValue");
                            if (BeginTime != "") {
                                if ((new Date(date)) < (new Date(BeginTime))) {
                                    $(this).datebox("setValue", BeginTime);
                                }
                            }
                        }
                    }
                }
            },
            {
                field: 'LeaseEndTime', title: '租赁结束时间', width: '120', align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false,
                        required: true,
                        onSelect: function (date) {
                            //判断合同结束时间是否为空
                            var EndTime = $('#ContractEndTime').datebox("getValue");
                            if (EndTime != "") {
                                if ((new Date(date)) > (new Date(EndTime))) {
                                    $(this).datebox("setValue", EndTime);
                                }
                            }
                        }
                    }
                }
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: '140', align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false
                    }
                }
            },
            {
                field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: '140', align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false
                    }
                }
            },
            {
                field: 'CheckInTime', title: '入住时间', width: '140', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'RentOutTime', title: '退租时间', width: '140', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'LeaseStateName', title: '房屋状态', width: '80', align: 'center' }
        ]];
        var RoomToolbar = [
            {
                text: '保存',
                iconCls: 'icon-save',
                handler: function () {
                    //先结束一次编辑
                    if (endEditionForLeaseRoom()) {
                        //将列表数据存放到 LeaseRoomResult 中
                        var RowsCount = $("#TableContainerZLFW").datagrid("getRows");
                        if (RowsCount == 0) {
                            $('#LeaseRoomResult').val("");
                        } else {
                            $('#LeaseRoomResult').val(JSON.stringify(RowsCount));
                        }
                        HDialog.Info("租赁房屋数据保存成功");
                    }
                }
            }
        ];
        //编辑的行号
        var editIndexForLeaseRoom = undefined;
        //*****编辑
        function endEditionForLeaseRoom() {
            if (editIndexForLeaseRoom == undefined) {
                return true
            }
            if ($('#TableContainerZLFW').datagrid('validateRow', editIndexForLeaseRoom)) {
                $('#TableContainerZLFW').datagrid('endEdit', editIndexForLeaseRoom);
                editIndexForLeaseRoom = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellFoLeaseRoom(Rowindex, field, value) {
            if ($("#AuditStatus").val() != "未启动" && $("#AuditStatus").val() != "已驳回") {
                endEditionForLeaseRoom();
                return false;
            }
            $('#TableContainerZLFW').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainerZLFW').datagrid("getSelected");
            if (endEditionForLeaseRoom()) {
                if ((field == "RoomRentalArea" || field == "LeaseBeginTime" || field == "LeaseEndTime" || field == "RentFreeEndTime" || field == "PostPoneBeginTime")
                    && SelecteRow.LeaseState != "2") {
                    $('#TableContainerZLFW').datagrid('beginEdit', Rowindex);
                }
                editIndexForLeaseRoom = Rowindex;
            }
        }
        function onAfterEditForLeaseRoom(rowIndex, row, changes) {
            var updated = $('#TableContainerZLFW').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#TableContainerZLFW').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForLeaseRoom != undefined) {
                    $("#TableContainerZLFW").datagrid('acceptChanges', editIndexForLeaseRoom);
                    $('#TableContainerZLFW').datagrid('endEdit', editIndexForLeaseRoom);
                }
            }
        }
        //加载租赁房屋
        function LoadLeaseRoomGrid() {
            var Data = [];
            if ($('#LeaseRoomResult').val() != "") {
                Data = JSON.parse($('#LeaseRoomResult').val());
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                RoomToolbar = [];
            }
            $("#TableContainerZLFW").datagrid({
                data: Data,
                nowrap: false,
                columns: RoomColumn,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: RoomToolbar,
                rownumbers: true,
                border: false,
                height: "100%",
                rowStyler: function (index, row) {
                    if (row.LeaseState == '2') {
                        return "background-color:#F5F5F5";
                    }
                },
                onClickCell: onClickCellFoLeaseRoom,
                onAfterEdit: onAfterEditForLeaseRoom,
                onLoadSuccess: function (data) {

                }
            });
        }

        /* 计费标准 */
        var SettingColumn = [[
            { field: 'CustName', title: '费用承担对象', width: '200', align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: '200', align: 'center' },
            { field: 'BeginDate', title: '开始时间', width: '100', align: 'center' },
            { field: 'EndDate', title: '结束时间', width: '100', align: 'center' },
            { field: 'DueDate', title: '应收时间', width: '100', align: 'center' },
            { field: 'CostName', title: '费用项目', width: '120', align: 'center' },
            {
                field: 'CalcType', title: '计算方式', width: '100', align: 'center', formatter: function (value, row, index) {
                    if (value == "0") {
                        return "按每月单价";
                    } else if (value == "1") {
                        return "按缴费周期总额";
                    } else if (value == "2") {
                        return "按租赁期间总额";
                    } else if (value == "3") {
                        return "按每天单价";
                    }
                }
            },
            { field: 'ContPeriod', title: '计费周期', width: '100', align: 'center' },
            { field: 'ContPrice', title: '租金标准', width: '100', align: 'center' },
            { field: 'ContNum', title: '面积', width: '80', align: 'center' },
            {
                field: 'ContractDelinBeginMonth', title: '合同违约金起计时间', width: '200', align: 'left', formatter: function (value, row, index) {
                    if (value != "") {
                        return "应收时间延后(" + value + ")月(" + row.ContractDelinBeginDay + ")日起计";
                    } else {
                        if (row.ContractDelinBeginDay != "") {
                            return "应收时间(" + row.ContractDelinBeginDay + ")天之后起计";
                        }
                    }
                    return "";
                }
            },
            { field: 'ContractDelinAmountStandard', title: '合同违约金标准(小数/天)', width: '150', align: 'center' }
        ]];
        var SettingToolbar = [
            {
                text: '新增标准',
                iconCls: 'icon-add',
                handler: function () {
                    ContractSettingDetail("insert", '');
                }
            }, '-',
            {
                text: '修改标准',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainerJFBZ").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要变更的计费标准!');
                        return;
                    }
                    ContractSettingDetail("edit", row);
                }
            }, '-',
            {
                text: '删除标准',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerJFBZ").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要删除的计费标准!');
                        return;
                    }
                    var DelRowIndex = $("#TableContainerJFBZ").datagrid("getRowIndex", row);
                    $("#TableContainerJFBZ").datagrid("deleteRow", DelRowIndex);//删除行
                    var LeaseSettingRows = $('#TableContainerJFBZ').datagrid("getRows");
                    $('#LeaseSettingResult').val(JSON.stringify(LeaseSettingRows));
                }
            }, '-',
            {
                text: '更新为连续日期',
                iconCls: 'icon-edit',
                handler: function () {
                    //未完
                }
            }, '-',
            {
                text: '<div style="color:blue;">(说明：新增、修改合同标准后，必须先保存合同信息才能计算合同费用。)</div>'
            }
        ];
        //计费标准详情
        function ContractSettingDetail(OpType, ItemRow) {
            //获取 租赁房屋数据 并传入计费标准详细页面中用户标准房屋绑定
            var LeaseRoomData = $('#TableContainerZLFW').datagrid("getRows");
            if (LeaseRoomData.length == 0) {
                HDialog.Info("请选择先租赁房屋！");
                return;
            }
            //判断如果是新增的话需要默认有些数据   修改就将ItemRow数据放到localStorage中
            var SettingData = {
                ID: "",
                ContractID: $('#ID').val(),
                ContID: $('#ContID').val(),
                CommID: $('#CommID').val(),
                CustID: $("#TenantryCustID").val(),
                CustName: $("#TenantryCustName").val(),
                RoomID: "",
                RoomSign: "",
                RoomName: "",
                BeginDate: "",
                EndDate: "",
                DueDate: "",
                CostID: "",
                CostName: "",
                CalcType: $("input[name='CalculationMethod']:checked").val(),
                ContPeriod: "",
                ContPrice: $('#RentStandard').numberbox("getValue"),
                ContNum: "",
                ContractDelinAmountStandard: "",
                ContractDelinBeginDay: "",
                ContractDelinBeginMonth: ""
            }
            //修改时
            if (OpType == "edit") {
                SettingData.ID = ItemRow.ID;
                SettingData.ContractID = ItemRow.ContractID;
                SettingData.ContID = ItemRow.ContID;
                SettingData.CommID = ItemRow.CommID;
                SettingData.CustID = ItemRow.CustID;
                SettingData.CustName = ItemRow.CustName;
                SettingData.RoomID = ItemRow.RoomID;
                SettingData.RoomSign = ItemRow.RoomSign;
                SettingData.RoomName = ItemRow.RoomName;
                SettingData.BeginDate = ItemRow.BeginDate;
                SettingData.EndDate = ItemRow.EndDate;
                SettingData.DueDate = ItemRow.DueDate;
                SettingData.CostID = ItemRow.CostID;
                SettingData.CostName = ItemRow.CostName;
                SettingData.CalcType = ItemRow.CalcType;
                SettingData.ContPeriod = ItemRow.ContPeriod;
                SettingData.ContPrice = ItemRow.ContPrice;
                SettingData.ContNum = ItemRow.ContNum;
                SettingData.ContractDelinAmountStandard = ItemRow.ContractDelinAmountStandard;
                SettingData.ContractDelinBeginDay = ItemRow.ContractDelinBeginDay;
                SettingData.ContractDelinBeginMonth = ItemRow.ContractDelinBeginMonth;
                //判断当前房屋是否为已退租房屋  如果是已退租房屋 修改时就不允许选择其他房屋
                var Node = LeaseRoomData.filter(function (e) {
                    return e.RoomID == ItemRow.RoomID && parseInt(e.LeaseState) == 2;
                });
                if (Node.length > 0) {
                    LeaseRoomData = Node;
                } else {
                    Node = LeaseRoomData.filter(function (e) {
                        return parseInt(e.LeaseState) != 2;
                    });
                    if (Node.length > 0) {
                        LeaseRoomData = Node;
                    } else {
                        LeaseRoomData = [];
                    }
                }
            } else {
                //新增时只能选择没有退租的房屋
                var Node = LeaseRoomData.filter(function (e) {
                    return parseInt(e.LeaseState) != 2;
                });
                if (Node.length > 0) {
                    LeaseRoomData = Node;
                } else {
                    LeaseRoomData = [];
                }
            }

            var LeaseContractSetting = {
                RoomData: LeaseRoomData, //租赁房屋信息 全量信息
                SettingData: SettingData
            };
            localStorage.setItem("LeaseContractSetting", JSON.stringify(LeaseContractSetting));
            HDialog.Open("680", "400", '../LeaseManage/LeaseContractSettingManage.aspx?OpType=' + OpType, "租赁合同计费标准", false, function callback(_Data) {
                if (_Data != "") {
                    var varObj = JSON.parse(_Data)
                    if (OpType == "insert") {
                        //新增
                        $('#TableContainerJFBZ').datagrid('insertRow', {
                            index: 0,
                            row: {
                                ID: varObj.ID,
                                ContractID: varObj.ContractID,
                                ContID: varObj.ContID,
                                CommID: varObj.CommID,
                                CustID: varObj.CustID,
                                CustName: varObj.CustName,
                                RoomID: varObj.RoomID,
                                RoomName: varObj.RoomName,
                                RoomSign: varObj.RoomSign,
                                BeginDate: varObj.BeginDate,
                                EndDate: varObj.EndDate,
                                DueDate: varObj.DueDate,
                                CostID: varObj.CostID,
                                CostName: varObj.CostName,
                                CalcType: varObj.CalcType,
                                ContPeriod: varObj.ContPeriod,
                                ContPrice: parseFloat(varObj.ContPrice),
                                ContNum: varObj.ContNum,
                                ContractDelinAmountStandard: parseFloat(varObj.ContractDelinAmountStandard),
                                ContractDelinBeginDay: varObj.ContractDelinBeginDay,
                                ContractDelinBeginMonth: varObj.ContractDelinBeginMonth
                            }
                        });
                    } else {
                        var UpdateRowIndex = $('#TableContainerJFBZ').datagrid('getRowIndex', ItemRow);
                        //修改
                        $('#TableContainerJFBZ').datagrid('updateRow', {
                            index: UpdateRowIndex,
                            row: {
                                CustID: varObj.CustID,
                                CustName: varObj.CustName,
                                RoomID: varObj.RoomID,
                                RoomSign: varObj.RoomSign,
                                RoomName: varObj.RoomName,
                                BeginDate: varObj.BeginDate,
                                EndDate: varObj.EndDate,
                                DueDate: varObj.DueDate,
                                CostID: varObj.CostID,
                                CostName: varObj.CostName,
                                CalcType: varObj.CalcType,
                                ContPeriod: varObj.ContPeriod,
                                ContPrice: parseFloat(varObj.ContPrice),
                                ContNum: varObj.ContNum,
                                ContractDelinAmountStandard: parseFloat(varObj.ContractDelinAmountStandard),
                                ContractDelinBeginDay: varObj.ContractDelinBeginDay,
                                ContractDelinBeginMonth: varObj.ContractDelinBeginMonth
                            }
                        });
                    }
                    var LeaseSettingRows = $('#TableContainerJFBZ').datagrid("getRows");
                    $('#LeaseSettingResult').val(JSON.stringify(LeaseSettingRows));
                }
            });
        }
        //加载计费标准
        function LoadContractSetting() {
            var Data = [];
            if ($('#LeaseSettingResult').val() != "") {
                Data = JSON.parse($('#LeaseSettingResult').val());
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                SettingToolbar = [];
            }
            $("#TableContainerJFBZ").datagrid({
                data: Data,
                nowrap: false,
                columns: SettingColumn,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: SettingToolbar,
                rownumbers: true,
                border: false,
                height: '100%',
                onLoadSuccess: function (data) {

                }
            });
        }

        /* 合同费用 */
        var FeesColumn = [[
            { field: 'ck', checkbox: true },
            { field: 'FeesType', title: '费用状态', width: '80', align: 'center' },
            { field: 'CustName', title: '客户名称', width: '200', align: 'left' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: '200', align: 'left' },
            { field: 'CostName', title: '费用项目', width: '140', align: 'left' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: '140', align: 'center' },
            {
                field: 'FeesDueDate', title: '应收日期', width: '150', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStateDate', title: '开始日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DueAmount', title: '应收金额', width: '80', align: 'center' },
            { field: 'PaidAmount', title: '实收金额', width: '80', align: 'center' },
            { field: 'PrecAmount', title: '预交冲抵', width: '80', align: 'center' },
            { field: 'WaivAmount', title: '减免冲销', width: '80', align: 'center' },
            { field: 'DebtsAmount', title: '欠费金额', width: '80', align: 'center' },
            {
                field: 'ID', title: '费用拆分', width: '100', align: 'center', formatter: function (value, row, index) {
                    var str = "";
                    if (row.FeesType == "已审核费用") {
                        str = "<a style=\"color:blue\" onclick=\"FeesSplit('" + row.ID + "')\" href=\"javascript:void(0);\">" + "费用拆分" + "</a>";
                    }
                    if ($("#AuditStatus").val() != "未启动" && $("#AuditStatus").val() != "已驳回") {
                        str = "";
                    }
                    return str;
                }
            }
        ]];
        //加载费用列表
        function LoadFeesGrid() {
            var FeesToolBar = ".FeesToolBar";
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                FeesToolBar = [];
            }
            $("#TableContainerHTFY").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: FeesColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                pagination: false,
                toolbar: FeesToolBar,
                rownumbers: true,
                border: false,
                height: '100%',
                showFooter: true,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "LeaseContractChangeFeesList";
                    param["ContID"] = $("#ContID").val();
                    param["CommID"] = $("#CommID").val();
                    param["AuditStatus"] = $("#AuditStatus").val();
                },
                onLoadSuccess: function (data) {
                    //加载页脚
                    $('#TableContainerHTFY').datagrid('reloadFooter', [
                        {
                            ID: 'footer',
                            CustName: "<span style='color:red'>合计</span>",
                            DueAmount: "<span style='color:red'>" + computeHTFY("DueAmount") + "</span>",
                            PaidAmount: "<span style='color:red'>" + computeHTFY("PaidAmount") + "</span>",
                            PrecAmount: "<span style='color:red'>" + computeHTFY("PrecAmount") + "</span>",
                            WaivAmount: "<span style='color:red'>" + computeHTFY("WaivAmount") + "</span>",
                            DebtsAmount: "<span style='color:red'>" + computeHTFY("DebtsAmount") + "</span>"
                        }
                    ]);
                }
            });
        }
        //指定列求和
        function computeHTFY(colName) {
            var rows = $('#TableContainerHTFY').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                if (rows[i][colName] != "") {
                    total += parseFloat(rows[i][colName]);
                }
            }
            return ToDecimal(total, 2);
        }
        //计算合同费用
        function CaluFees() {
            //判断合同是否保存
            if ($('#ContID').val() == "") {
                HDialog.Info('请先保存租赁合同!');
                return;
            }
            if ($('#OpType').val() == "insert") {
                HDialog.Info('请先保存合同变更!');
                return;
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                HDialog.Info('租赁合同变更处于审核中或者合同已审核!');
                return;
            }
            //计算费用
            $.tool.DataPostJson('LeaseManage', 'LeaseContractChangeFeesCalc', "ContID=" + $('#ContID').val() + "&ContractID=" + $('#ContractID').val() + "&ID=" + $('#ID').val(),
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        HDialog.Info(data.msg);
                        LoadFeesGrid();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //费用登记
        function AddFees() {
            if ($('#ContID').val() == "") {
                HDialog.Info('请先保存租赁合同!');
                return;
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                HDialog.Info('租赁合同变更处于审核中或者已审核!');
                return;
            }
            HDialog.Open(900, 500, '../ChargesNew/FeesSporadicManage.aspx?OPType=Insert&LeaseContID=' + $('#ContID').val() + '&CustID=' + $('#TenantryCustID').val() + '&CustName=' + $('#TenantryCustName').searchbox("getValue"), '新增租赁合同费用', false, function (_Data) {
                if (_Data != '') {
                    HDialog.Info(_Data);
                    LoadFeesGrid();
                }
            });
        }
        //单笔费用删除
        function DeleteOneFees() {
            if ($('#ContID').val() == "") {
                HDialog.Info('请先保存租赁合同!');
                return;
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                HDialog.Info('租赁合同变更处于审核中或者已审核!');
                return;
            }
            var SelectedRow = $('#TableContainerHTFY').datagrid("getSelected");
            if (SelectedRow == null) {
                HDialog.Info("请选择需要删除的租赁合同变更费用");
                return;
            }
            $.tool.DataPostJson('LeaseManage', 'LeaseContractChangeDeleteOneFees', "CommID=" + SelectedRow.CommID + "&ContID=" + $('#ContID').val() + "&ID=" + SelectedRow.ID,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        HDialog.Info("删除成功");
                        LoadFeesGrid();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //批量删除费用
        function DeleteFees() {
            if ($('#ContID').val() == "") {
                HDialog.Info('请先保存租赁合同!');
                return;
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                HDialog.Info('租赁合同处于审核中或者合同已审核!');
                return;
            }
            var CheckedRows = $('#TableContainerHTFY').datagrid("getChecked");
            if (CheckedRows.length == 0) {
                HDialog.Info("请勾选需要删除的费用");
                return;
            }
            var IdList = "";
            for (var i = 0; i < CheckedRows.length; i++) {
                IdList += CheckedRows[i].ID + ",";
            }
            if (IdList.length > 0) {
                IdList = IdList.substring(0, IdList.length - 1);
            }

            $.tool.DataPostJson('LeaseManage', 'LeaseContractChangeDeleteFees', "CommID=" + $('#CommID').val() + "&ContID=" + $('#ContID').val() + "&IdList=" + IdList,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        HDialog.Info("删除成功");
                        LoadFeesGrid();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //拆分租赁结束后的费用
        function CutFeesAfter() {
            //待完成
            if ($('#ContID').val() == "") {
                HDialog.Info('请先保存租赁合同!');
                return;
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                HDialog.Info('租赁合同变更处于审核中或者已审核!');
                return;
            }
            $.tool.DataPostJson('LeaseManage', 'LeaseContractSplitAfterFees', "ContractID=" + $('#ContractID').val() + "&ContID=" + $('#ContID').val() + "&CommID=" + $('#CommID').val(),
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        HDialog.Info("拆分租赁结束后费用成功");
                        LoadFeesGrid();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //删除租赁结束后的费用
        function DeleteFeesAfter() {
            if ($('#ContID').val() == "") {
                HDialog.Info('请先保存租赁合同!');
                return;
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                HDialog.Info('租赁合同变更处于审核中或者已审核!');
                return;
            }
            $.tool.DataPostJson('LeaseManage', 'LeaseContractDeleteAfterFees', "ContractID=" + $('#ContractID').val() + "&ContID=" + $('#ContID').val(),
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        HDialog.Info("删除租赁结束后费用成功，租赁合同变更审核通过后生效");
                        LoadFeesGrid();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        //费用拆分
        function FeesSplit(FeesID) {
            if (FeesID != 0) {
                var conent = "../ChargesNew/FeesSplitManage.aspx?OPType=Edit&FeesID=" + FeesID;
                HDialog.Open('900', '400', conent, '费用拆分', false, function callback(_Data) {
                    if (_Data != '') {
                        LoadFeesGrid();
                    }
                });
            }
            else {
                HDialog.Info('当前费用不允许删除');
            }
        }

        /* 其他费用 */
        var QTFYColumn = [[
            { field: 'CustName', title: '客户名称', width: 100, align: 'left' },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'left' },
            { field: 'ParkName', title: '车位编号', width: 80, align: 'left' },
            { field: 'CostName', title: '费用名称', width: 100, align: 'left' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left' },
            {
                field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DueAmount', title: '应收金额', width: 100, align: 'left' },
            { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left' },
            { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left' },
            { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left' },
            { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left' },
            { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left' },
            { field: 'IsBankName', title: '托收状态', width: '50', align: 'center' },
            { field: 'IsFreezeName', title: '冻结状态', width: '50', align: 'center' },
            { field: 'IsPropertyName', title: '垫付状态', width: '50', align: 'center' },
            { field: 'IsPrecName', title: '预交状态', width: '50', align: 'center' }
        ]];
        var QTFYtoolbar = [
            {
                text: '拆分',
                iconCls: 'icon-cut',
                handler: function () {
                    var row = $("#TableContainerQTFY").datagrid("getSelected");
                    if (row != null) {
                        if (row.FeesID != 0) {
                            var IsOperator;
                            IsOperator = FeesIsOperator(row);
                            var IsSplit = IsOperator.split('|')[2];
                            if (IsSplit.split(':')[0] == "true") {
                                FeesOperator(row, "split");
                            }
                            else {
                                HDialog.Info(IsSplit.split(':')[1]);
                            }
                        }
                        else {
                            HDialog.Info('请选择要拆分的费用');
                        }
                    } else {
                        HDialog.Info('请选择要拆分的费用');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerQTFY").datagrid("getSelected");
                    if (row != null) {
                        if (row.FeesID != 0) {
                            var IsOperator;
                            IsOperator = FeesIsOperator(row);
                            var IsDel = IsOperator.split('|')[1];
                            if (IsDel.split(':')[0] == "true") {
                                HDialog.Prompt("是否确认删除此费用", function () {
                                    FeesOperator(row, "delete");
                                });
                            }
                            else {
                                HDialog.Info(IsDel.split(':')[1]);
                            }
                        }
                        else {
                            HDialog.Info('请选择要删除的费用');
                        }
                    } else {
                        HDialog.Info('请选择要删除的费用');
                    }
                }
            }
        ];
        function FeesIsOperator(row) {
            var IsSplit = "false:false";
            var IsDel = "false:false";
            var IsUpdate = "false:false";
            var iCostGeneType = 0;
            var strSysCostSign = row.SysCostSign;
            var strDueAmount = row.DueAmount;
            var strDebtsAmount = row.DebtsAmount;
            var strAccountFlag = row.AccountFlag;
            var strCostName = row.CostName;
            var strIsBank = row.IsBank;
            var strIsFreeze = row.IsFreeze;
            var strIsProperty = row.IsProperty;
            var strIsPrec = row.IsPrec;
            var strMeterSign = row.MeterSign;
            var iIncidentID = ToDecimal(row.IncidentID, 0);
            var iLeaseContID = ToDecimal(row.LeaseContID, 0);
            var iContID = ToDecimal(row.ContID, 0);
            if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                && ((iCostGeneType != 0 && ToDecimal(strAccountFlag, 0) == 100) || (iCostGeneType == 0))
                && (ToDecimal(strIsBank, 0) == 0)
                && (ToDecimal(strIsFreeze, 0) == 0)
                && (ToDecimal(strIsProperty, 0) == 0)
                && (ToDecimal(strIsPrec, 0) == 0)) {
                if (strMeterSign == "") {
                    IsUpdate = "true:true"
                    IsDel = "true:true";
                    IsSplit = "true:true";
                }
                else {
                    IsUpdate = "false:抄表类费用不允许修改";
                    IsDel = "false:抄表类费用不允许删除";
                    IsSplit = "false:抄表类费用不允许拆分";
                }
            }
            else {
                if ((ToDecimal(strDueAmount, 2) != ToDecimal(strDebtsAmount, 2))) {
                    IsUpdate = "false:应收金额不等于欠收金额不允许修改";
                    IsDel = "false:应收金额不等于欠收金额不允许删除";
                    IsSplit = "false:应收金额不等于欠收金额不允许拆分";
                }
                if ((iCostGeneType != 0 && ToDecimal(strAccountFlag, 0) == 0)) {
                    IsUpdate = "false:入账费用在应收输入模块中不允许修改";
                    IsDel = "false:入账费用在应收输入模块中不允许删除";
                }
                if (ToDecimal(strIsBank, 0) != 0) {
                    IsUpdate = "false:费用已托收不允许修改";
                    IsDel = "false:费用已托收不允许删除";
                    IsSplit = "false:费用已托收不允许拆分";
                }
                if (ToDecimal(strIsFreeze, 0) != 0) {
                    IsUpdate = "false:费用已冻结不允许修改";
                    IsDel = "false:费用已冻结不允许删除";
                    IsSplit = "false:费用已冻结不允许拆分";
                }
                if (ToDecimal(strIsProperty, 0) != 0) {
                    IsUpdate = "false:费用已垫付不允许修改";
                    IsDel = "false:费用已垫付不允许删除";
                    IsSplit = "false:费用已垫付不允许拆分";
                }
                if (ToDecimal(strIsPrec, 0) != 0) {
                    IsUpdate = "false:费用已预收不允许修改";
                    IsDel = "false:费用已预收不允许删除";
                    IsSplit = "false:费用已预收不允许拆分";
                }
            }

            if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                && (ToDecimal(strIsBank, 0) == 0)
                && (ToDecimal(strIsFreeze, 0) == 0)
                && (ToDecimal(strIsProperty, 0) == 0)
                && (ToDecimal(strIsPrec, 0) == 0)
                && (strMeterSign == "")) {
                IsSplit = "true:true";
            }
            else {
                if (ToDecimal(strIsBank, 0) != 0) {
                    IsUpdate = "false:费用已托收不允许修改";
                    IsDel = "false:费用已托收不允许删除";
                    IsSplit = "false:费用已托收不允许拆分";
                }
                if (ToDecimal(strIsFreeze, 0) != 0) {
                    IsUpdate = "false:费用已冻结不允许修改";
                    IsDel = "false:费用已冻结不允许删除";
                    IsSplit = "false:费用已冻结不允许拆分";
                }
                if (ToDecimal(strIsProperty, 0) != 0) {
                    IsUpdate = "false:费用已垫付不允许修改";
                    IsDel = "false:费用已垫付不允许删除";
                    IsSplit = "false:费用已垫付不允许拆分";
                }
                if (ToDecimal(strIsPrec, 0) != 0) {
                    IsUpdate = "false:费用已预收不允许修改";
                    IsDel = "false:费用已预收不允许删除";
                    IsSplit = "false:费用已预收不允许拆分";
                }
            }
            if (strSysCostSign == "B0005" && strCostName != "补交") {
                IsUpdate = "false:产权税费不允许修改";
                IsDel = "false:产权税费不允许删除";
                IsSplit = "false:产权税费不允许拆分";
            }
            if ((iIncidentID > 0 || iLeaseContID > 0 || iContID > 0) && (iCostGeneType != 0)) {
                if (iIncidentID > 0) {
                    IsUpdate = "false:特约服务类费用不允许修改";
                    IsDel = "false:特约服务类费用不允许删除";
                    IsSplit = "false:特约服务类费用不允许拆分";
                }
                else {
                    IsUpdate = "false:合同费用不允许修改";
                    IsDel = "false:合同费用不允许删除";
                    IsSplit = "false:合同费用不允许拆分";
                }
            }
            //0 修改，1删除，2修改
            return IsUpdate + "|" + IsDel + "|" + IsSplit;
        }
        function FeesOperator(rowData, type) {
            var FeesRow = JSON.stringify(rowData);
            //保存到隐藏文本框;
            $.tool.DataPostNoLoading('Fees', "feescheck", "FeesRow=" + FeesRow + "&OperatorType=" + type,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        var cotent = "";
                        var Title = "";
                        var width = 900;
                        var height = 450;
                        switch (type) {
                            case "update":
                                Title = "修改费用";
                                conent = "../ChargesNew/FeesSporadicManage.aspx?OPType=Edit&FeesID=" + rowData.FeesID + "&CostGeneType=" + $('#CostGeneType').val();
                                break;
                            case "delete":
                                Title = "删除费用";
                                width = 600;
                                height = 250;
                                conent = "../DialogNew/FeesAmendDelDlg.aspx?FeesID=" + rowData.FeesID;
                                break;
                            case "split":
                                Title = "拆分费用";
                                conent = "../ChargesNew/FeesSplitManage.aspx?OPType=Edit&FeesID=" + rowData.FeesID + "&CostGeneType=" + $('#CostGeneType').val();
                                break;
                        }
                        HDialog.Open(width, height, conent, Title, false, function callback(_Data) {
                            if (_Data != "") {
                                HDialog.Info(_Data);
                                LoadOtherFeesGrid();
                            }
                        });
                    }
                    else {
                        HDialog.Info(_Data);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        }
        //加载其他费用列表
        function LoadOtherFeesGrid() {
            $("#TableContainerQTFY").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                pageSize: 150,
                pageList: [150, 300, 500],
                columns: QTFYColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                toolbar: QTFYtoolbar,
                pagination: true,
                rownumbers: true,
                border: false,
                height: "100%",
                showFooter: true,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "LeaseManage";
                    param.Command = "OtherFeesSearch";
                    param["CustID"] = $('#TenantryCustID').val();
                    param["ContID"] = $('#ContID').val();
                },
                onLoadSuccess: function (data) {
                    //加载页脚
                    $('#TableContainerQTFY').datagrid('reloadFooter', [
                        {
                            FeesID: 'footer',
                            RoomSign: "<span style='color:red'>合计</span>",
                            DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                            PaidAmount: "<span style='color:red'>" + compute("PaidAmount") + "</span>",
                            PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>",
                            WaivAmount: "<span style='color:red'>" + compute("WaivAmount") + "</span>",
                            RefundAmount: "<span style='color:red'>" + compute("RefundAmount") + "</span>",
                            DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>"
                        }
                    ]);
                }
            });
        }
        //指定列求和
        function compute(colName) {
            var rows = $('#TableContainerQTFY').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                if (rows[i][colName] != "") {
                    total += parseFloat(rows[i][colName]);
                }
            }
            return ToDecimal(total, 2);
        }

        //页面数据验证
        function ClientClick() {
            var IsValidate = "";
            //先结束一次编辑
            endEditionForLeaseRoom();
            var RowsCount = $("#TableContainerZLFW").datagrid("getRows");
            if (RowsCount == 0) {
                $('#LeaseRoomResult').val("");
                HDialog.Info("请选择租赁房屋");
                return false;
            } else {
                $('#LeaseRoomResult').val(JSON.stringify(RowsCount));
            }
            //先验证页面上的租赁房屋数据是否录入合法
            for (var i = 0; i < RowsCount.length; i++) {
                if (RowsCount[i]["RoomRentalArea"] == "") {
                    HDialog.Info("房屋【" + RowsCount[i]["RoomSign"] + "】的计租面积不能为空！");
                    return false;
                }
                if (RowsCount[i]["LeaseBeginTime"] == "") {
                    HDialog.Info("房屋【" + RowsCount[i]["RoomSign"] + "】的租赁结束时间不能为空！");
                    return false;
                }
                if (RowsCount[i]["LeaseEndTime"] == "") {
                    HDialog.Info("房屋【" + RowsCount[i]["RoomSign"] + "】的租赁结束时间不能为空！");
                    return false;
                }
                //判断租赁结束时间是否是小于租赁开始时间
                if ((new Date(RowsCount[i]["LeaseEndTime"])) < (new Date(RowsCount[i]["LeaseBeginTime"]))) {
                    HDialog.Info("房屋【" + RowsCount[i]["RoomSign"] + "】的租赁结束时间不能小于租赁开始时间！");
                    return false;
                }
            }
            //需要验证租赁房屋数据是否正确
            $.tool.DataPostJsonAsync('LeaseManage', 'ValidateLeaseContractRoom', "ContractID=" + $('#ContractID').val() + "&RoomData=" + $('#LeaseRoomResult').val(),
                function Init() {
                },
                function callback(_Data) {
                    if (!_Data.result) {
                        IsValidate = _Data.msg;
                    }
                },
                function _completeCallBack() {
                },
                function errorCallback() {
                });
            if (IsValidate != "") {
                HDialog.Info(IsValidate);
                return false;
            }
            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //预算计划审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            //判断必须要有应急类型
            if ($('#ContractChangeType').combobox("getValue") == "") {
                HDialog.Info("请选择租赁合同变更类型");
                return;
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            $.tool.DataPostJsonAsync('LeaseManage', 'GetLeaseContractWorkFlow', "ContractChangeType=" + $('#ContractChangeType').combobox("getValue"),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data.result) {
                        FlowId = _Data.data;
                    } else {
                        ErrorMessage = _Data.msg;
                    }
                },
                function _completeCallBack() {
                },
                function errorCallback() {
                });

            if (ErrorMessage != "") {
                HDialog.Info(ErrorMessage);
                return;
            }
            if (FlowId == "") {
                HDialog.Info("请设置对应租赁合同变更审核流程");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=1205&biaoshi=1&random=" + Math.random();
            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                if (_Data != '') {
                    var obj = JSON.parse(_Data);
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                }
            });
        }

        $(function () {
            //初始化页面高度
            InitTableHeight();

            $('#tipTenantryCust').tooltip({
                position: 'top',
                content: '<div><p>重新选承租方</p>'
                    + '<p>1、费用承担对象与承租方相同的、费用开始时间大于等于变更日期的计费标准，自动将费用承担对象修改为新的承租方名称</p>' +
                    '<p>2、租赁合同变更审核通过后，费用承担对象与承租方相同的、费用开始时间大于等于变更日期的未收取费用，自动将费用客户名称修改为新的承租方名称</p></div>',
            });

            $(".tabs-container li").click(function () {
                if ($(this).attr("refsel") == "1") {
                    return;
                }
                $(this).attr("refsel", "1");
                switch ($(this).attr("name")) {
                    case "fuzl":
                        //租赁房屋
                        setTimeout("LoadLeaseRoomGrid()", 10);
                        break;
                    case "jfbz":
                        //计费标准
                        setTimeout("LoadContractSetting()", 10);
                        break;
                    case "htfy":
                        //合同费用
                        setTimeout("LoadFeesGrid()", 10);
                        break;
                    case "qtfy":
                        //其他费用
                        setTimeout("LoadOtherFeesGrid()", 10);
                        break;
                }
            });
            LoadLeaseRoomGrid(); //加载租赁房屋

            //判断状态 是否是需要禁用控件
            if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                $("textarea,input[type='radio'],input[type='checkbox']").attr("disabled", "disabled");
            }
            //注册点击事件
            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                $.tool.pageLoading();
                //先结束一次编辑
                endEditionForLeaseRoom();

                //保存和送审的时候才验证
                if ($(this).attr("id") != "BtnSaveStartWorkFlow" && $(this).attr("id") != "BtnSave" && $(this).attr("id") != "BtnSaveAndClose") {
                    $.tool.pageUnLoading();
                    return true;
                }
                //关闭编辑状态
                //endEditing();
                if (IsSubmitFlag == false) {
                    HDialog.Info("5秒内不要重复点击");
                    $.tool.pageUnLoading();
                    return false;
                }
                IsSubmitFlag = false;
                setTimeout(function () {
                    IsSubmitFlag = true
                }, 5000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (ClientClick()) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                            HDialog.Info("请选择审批流程");
                            $.tool.pageUnLoading();
                            return false;
                        }
                        return true;
                    } else {
                        $.tool.pageUnLoading();
                        return false;
                    }
                }
                else {
                    $.tool.pageUnLoading();
                    return false;
                }
            });

            //datebox 添加清空
            var buttons = $.extend([], $.fn.datebox.defaults.buttons);
            buttons.splice(1, 0, {
                text: '清空',
                handler: function (target) {
                    $(target).datebox("setValue", "");
                }
            });
            $('.easyui-datebox').datebox({
                buttons: buttons
            });
            // 计算方式 点击事件
            $('input[type=radio][name=CalculationMethod]').change(function () {
                CalculationMethodChange($(this).val());
            });
            function CalculationMethodChange(val) {
                switch (val.toString()) {
                    case "0":
                        $('#RentStandardUnit').html("元/月.平米");
                        break;
                    case "3":
                        $('#RentStandardUnit').html("元/日.平米");
                        break;
                    case "1":
                        $('#RentStandardUnit').html("元/周期总额");
                        break;
                    case "2":
                        $('#RentStandardUnit').html("元/租赁总额");
                        break;
                    default:
                        $('#RentStandardUnit').html("元/日.平米");
                        break;
                }
            }
            //获取$("input[name='CalcType']:checked").val()
            CalculationMethodChange($("input[name='CalculationMethod']:checked").val());
            //默认折叠更多标准
            $(".CostStandard").hide();
            //展开折叠更多标准
            $('#BtnOpenOrClose').click(function () {
                if ($(".CostStandard").is(':visible')) {
                    $(".CostStandard").hide();
                } else {
                    $(".CostStandard").show();
                }
            });
            //更多标准内容监测
            $('.CostStandard .easyui-numberbox').numberbox({
                onChange: function (newValue, oldValue) {
                    //判断内容变更 并且内容是否存在值
                    var id = $(this).attr("id");
                    id = id.replace("Standard", "Unit");
                    //补救垃圾清运费问题
                    if (id == "WasteTransportCostUnit") {
                        id = id.replace("CostUnit", "Unit");
                    }
                    if (newValue != "") {
                        $('#' + id).validatebox({
                            required: true
                        });
                    } else {
                        $('#' + id).validatebox({
                            required: false
                        });
                        $('#' + id).val("");
                    }
                }
            });
        });

    </script>
</body>
</html>
