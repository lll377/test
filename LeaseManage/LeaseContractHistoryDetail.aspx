<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseContractHistoryDetail.aspx.cs" Inherits="M_Main.LeaseManage.LeaseContractHistoryDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同查看历史页面</title>
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
        <input id="CommID" type="hidden" name="CommID" runat="server">
        <input id="ID" type="hidden" name="ID" runat="server">
        <input id="ContID" type="hidden" name="ContID" runat="server">
        <input id="HistoryID" type="hidden" name="HistoryID" runat="server">
        <input id="LeaseRoomResult" name="LeaseRoomResult" type="hidden" runat="server">
        <input id="LeaseSettingResult" name="LeaseSettingResult" type="hidden" runat="server">
        <input id="LeaseFeesResult" name="LeaseFeesResult" type="hidden" runat="server">
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
                            <input type="text" id="LeaserName" name="LeaserName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">出租方证件名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserPaperNameName" name="LeaserPaperNameName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">出租方证件号码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaserPaperCode" name="LeaserPaperCode" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
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
                            <input type="text" id="TenantryCustName" name="TenantryCustName" runat="server" readonly class="easyui-validatebox TdContentSearchDisable" />
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
                            <input type="text" id="TenantryRegAddr" name="TenantryRegAddr" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
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
                            <input type="text" id="TenantryPlanFormatName" name="TenantryPlanFormatName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">经营品牌:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryManageBrand" name="TenantryManageBrand" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">经营级别:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryManageLevel" name="TenantryManageLevel" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">享受优惠政策:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryPreferentialPolicyName" name="TenantryPreferentialPolicyName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">优惠证件编号:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="TenantryPreferentialPolicyIdCode" name="TenantryPreferentialPolicyIdCode" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
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
                            <input type="text" id="ManageSideName" name="ManageSideName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">管理方证件名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSidePaperNameName" name="ManageSidePaperNameName" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">管理方证件号码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSidePaperCode" name="ManageSidePaperCode" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">管理方(注册)地址:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideRegAddr" name="ManageSideRegAddr" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        </td>
                        <td class="TdTitle">管理方邮政编码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSidePostCode" name="ManageSidePostCode" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">管理方法定代表人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideLegalPeople" name="ManageSideLegalPeople" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">管理方联系人:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideConnectPeople" name="ManageSideConnectPeople" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                        </td>
                        <td class="TdTitle">管理方联系电话:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ManageSideConnectTel" name="ManageSideConnectTel" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
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
                            <input type="text" id="ContractBeginTime" name="ContractBeginTime" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">合同结束时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractEndTime" name="ContractEndTime" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">合同期限(月):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">合同到期提醒:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractRemindOfExpiration" name="ContractRemindOfExpiration" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">优惠免租结束时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RentFreeEndTime" name="RentFreeEndTime" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">优惠原因:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RentFreeReason" name="RentFreeReason" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">顺延起租开始时间:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="PostPoneBeginTime" name="PostPoneBeginTime" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">顺延原因:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="PostPoneReason" name="PostPoneReason" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
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
                            <textarea id="LeaseRoomAddr" name="LeaseRoomAddr" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">房屋描述:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="LeaseRoomDis" name="LeaseRoomDis" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">租赁用途:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="LeaseRoomPurpose" name="LeaseRoomPurpose" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">建筑面积(平米):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaseRoomBuildArea" name="LeaseRoomBuildArea" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">计租面积(平米):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="LeaseRoomRentalArea" name="LeaseRoomRentalArea" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
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
                                <input type="radio" id="CalculationMethod2" name="CalculationMethod" value="3" runat="server" checked disabled="disabled" />&nbsp;<span>按每天单价</span></label>
                            <label class="InputRadio">
                                <input type="radio" id="CalculationMethod1" name="CalculationMethod" value="0" runat="server" disabled="disabled" />&nbsp;<span>按每月单价</span></label>
                            <label class="InputRadio">
                                <input type="radio" id="CalculationMethod3" name="CalculationMethod" value="1" runat="server" disabled="disabled" />&nbsp;<span>按缴费周期总额</span></label>
                            <label class="InputRadio">
                                <input type="radio" id="CalculationMethod4" name="CalculationMethod" value="2" runat="server" disabled="disabled" />&nbsp;<span>按租赁期间总额</span></label>
                        </td>
                        <td class="TdTitle">租金标准(<lable id="RentStandardUnit">元/月.平米</lable>):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RentStandard" name="RentStandard" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
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
                            <input type="text" id="PropertyManageCostStandard" name="PropertyManageCostStandard" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">物管费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="PropertyManageCostUnit" name="PropertyManageCostUnit" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">水费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WaterCostStandard" name="WaterCostStandard" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">水费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WaterCostUnit" name="WaterCostUnit" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">电费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ElectricCostStandard" name="ElectricCostStandard" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">电费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ElectricCostUnit" name="ElectricCostUnit" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">气费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="GasCostStandard" name="GasCostStandard" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">气费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="GasCostUnit" name="GasCostUnit" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">空调费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="AirConditionerCostStandard" name="AirConditionerCostStandard" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">空调费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="AirConditionerCostUnit" name="AirConditionerCostUnit" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">供热费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="HeatSupplyCostStandard" name="HeatSupplyCostStandard" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">供热费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="HeatSupplyCostUnit" name="HeatSupplyCostUnit" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle"></td>
                        <td class="TdContentSearch"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="TdTitle">垃圾清运费标准(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WasteTransportCostStandard" name="WasteTransportCostStandard" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">垃圾清运费标准单位:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="WasteTransportUnit" name="WasteTransportUnit" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
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
                            <input type="text" id="LastContractTotalPrice" name="LastContractTotalPrice" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                        <td class="TdTitle">合同保证金(元):</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractDeposit" name="ContractDeposit" class="easyui-validatebox TdContentSearchDisable" readonly runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">合同保证金描述:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="ContractDepositDes" name="ContractDepositDes" class="easyui-validatebox TdContentSearchDisable" runat="server" readonly />
                        </td>
                        <td class="TdTitle">计费方式:</td>
                        <td class="TdContentSearch">
                            <select id="ChargingMode" name="ChargingMode" class="easyui-combobox" style="width: 80px;" runat="server" data-options="editable:false,panelHeight:'auto',width:'auto',disabled:true">
                                <option value="0">按对时</option>
                                <option value="1">按整月</option>
                            </select>
                        </td>
                        <td class="TdTitle" colspan="2" style="text-align: left;">
                            <input id="IsContinuityCharging" type="checkbox" value="" disabled="disabled" name="IsContinuityCharging" runat="server">&nbsp;按对时按每月单价计算时,多个期间不同单价,是否连续计费?</td>
                    </tr>
                    <tr>
                        <td class="TdTitle">支付方式:</td>
                        <td class="TdContentSearch" colspan="5">
                            <textarea id="PaymentMethod" name="PaymentMethod" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
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
                            <input type="text" id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" runat="server" readonly class="easyui-validatebox TdContentSearchDisable" />
                            <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                            <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
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
                                <div style="width: 100%; background-color: #cccccc;" id="TableContainerHTFY"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 按钮工具栏 -->
            <div style="text-align: center; width: 100%; padding: 5px 0; height: 40px;">
                <input class="button" type="button" id="BtnClose" value="关闭" />
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

        /* 租赁房屋 */
        var RoomColumn = [[
            { field: 'RoomSign', title: '房屋编号', width: '170', align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: '170', align: 'left' },
            { field: 'BuildArea', title: '建筑面积', width: '80', align: 'center' },
            { field: 'RoomRentalArea', title: '计租面积', width: '80', align: 'center' },
            { field: 'LeaseBeginTime', title: '租赁开始时间', width: '120', align: 'center' },
            { field: 'LeaseEndTime', title: '租赁结束时间', width: '120', align: 'center' },
            { field: 'RentFreeEndTime', title: '优惠免租结束时间', width: '140', align: 'center' },
            { field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: '140', align: 'center' },
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
        //加载租赁房屋
        function LoadLeaseRoomGrid() {
            var Data = [];
            if ($('#LeaseRoomResult').val() != "") {
                Data = JSON.parse($('#LeaseRoomResult').val());
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
                rownumbers: true,
                border: false,
                height: "100%",
                rowStyler: function (index, row) {
                    if (row.LeaseState == '2') {
                        return "background-color:#F5F5F5";
                    }
                },
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
        //加载计费标准
        function LoadContractSetting() {
            var Data = [];
            if ($('#LeaseSettingResult').val() != "") {
                Data = JSON.parse($('#LeaseSettingResult').val());
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
                rownumbers: true,
                border: false,
                height: '100%',
                onLoadSuccess: function (data) {
                }
            });
        }

        /* 合同费用 */
        var FeesColumn = [[
            { field: 'CustName', title: '客户名称', width: '200', align: 'left' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: '200', align: 'left' },
            { field: 'CostName', title: '费用项目', width: '140', align: 'left' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: '140', align: 'center' },
            { field: 'FeesDueDate', title: '应收日期', width: '150', align: 'center' },
            { field: 'FeesStateDate', title: '开始日期', width: '100', align: 'center' },
            { field: 'FeesEndDate', title: '结束日期', width: '100', align: 'center' },
            { field: 'DueAmount', title: '应收金额', width: '80', align: 'center' },
            { field: 'PaidAmount', title: '实收金额', width: '80', align: 'center' },
            { field: 'PrecAmount', title: '预交冲抵', width: '80', align: 'center' },
            { field: 'WaivAmount', title: '减免冲销', width: '80', align: 'center' },
            { field: 'DebtsAmount', title: '欠费金额', width: '80', align: 'center' }
        ]];
        //加载费用列表
        function LoadFeesGrid() {
            var Data = [];
            if ($('#LeaseFeesResult').val() != "") {
                Data = JSON.parse($('#LeaseFeesResult').val());
            }
            $("#TableContainerHTFY").datagrid({
                data: Data,
                nowrap: false,
                columns: FeesColumn,
                pageSize: 300,
                pageList: [300, 500, 1000],
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                rownumbers: true,
                border: false,
                height: '100%',
                showFooter: true,
                onLoadSuccess: function (data) {
                    //加载页脚
                    $('#TableContainerHTFY').datagrid('reloadFooter', [
                        {
                            ID: 'footer',
                            CustName: "<span style='color:red'>合计</span>",
                            DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                            PaidAmount: "<span style='color:red'>" + compute("PaidAmount") + "</span>",
                            PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>",
                            WaivAmount: "<span style='color:red'>" + compute("WaivAmount") + "</span>",
                            DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>"
                        }
                    ]);
                }
            });
        }

        //指定列求和
        function compute(colName) {
            var rows = $('#TableContainerHTFY').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                if (rows[i][colName] != "") {
                    total += parseFloat(rows[i][colName]);
                }
            }
            return ToDecimal(total, 2);
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }


        $(function () {
            //初始化页面高度
            InitTableHeight();
            $(".tabs-container li").click(function () {
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
                }
            });
            LoadLeaseRoomGrid(); //加载租赁房屋
            //注册点击事件
            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });
            // 计算方式 点击事件
            $('input[type=radio][name=CalculationMethod]').change(function () {
                CalculationMethodChange($(this).val());
            });
            function CalculationMethodChange(val) {
                switch (val) {
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
