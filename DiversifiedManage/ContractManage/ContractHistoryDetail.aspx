<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractHistoryDetail.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractHistoryDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同历史</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link href="../../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/format.js"></script>
    <script type="text/javascript" src="../../jscript/uuid.js"></script>
    <style type="text/css">
        .tabs-header {
            background-color: white;
        }

        .bootstrap_table tr td.title {
            width: 12%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 20%;
            text-align: left;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .textbox-label {
            width: 30px;
            cursor: pointer;
            font-size: 12px;
            font-weight: normal;
        }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }

        #SubItem .tabs-panels {
            border-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="ID" type="hidden" name="ID" runat="server">
        <input id="CommID" type="hidden" name="CommID" runat="server">
        <input id="ContID" type="hidden" name="ContID" runat="server">
        <input id="ContractID" type="hidden" name="ContractID" runat="server">
        <input id="PointResult" name="PointResult" type="hidden" runat="server">
        <input id="SettingResult" name="SettingResult" type="hidden" runat="server">
        <input id="HistoryID" name="HistoryID" type="hidden" runat="server" />
        <%--<input id="FeesResult" name="FeesResult" type="hidden" runat="server">--%>
        <input id="OtherTableResult" name="OtherTableResult" type="hidden" runat="server"><!-- 合同其他信息字段内容 -->
        <div id="InformationContent" style="overflow: auto; padding: 10px;">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">合同基本信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title"><span>项目名称</span></td>
                        <td class="text">
                            <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"><span>合同类型</span></td>
                        <td class="text">
                            <input id="ContractCategory" name="ContractCategory" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',value:'收入合同',data: [{id: '收入合同',text: '收入合同'}]"
                                runat="server" disabled="disabled" />
                        </td>
                        <td class="title"><span>合同类别</span></td>
                        <td class="text">
                            <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" runat="server" disabled="disabled" />
                            <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>服务类别</span></td>
                        <td class="text">
                            <input id="BusinessType" name="BusinessType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',
                                    data: [{id: '房屋租赁',text: '房屋租赁'},{id: '车位租赁',text: '车位租赁'},{id: '广告租赁',text: '广告租赁'},{id: '场地租赁',text: '场地租赁'},
                                    {id: '物业有偿服务',text: '物业有偿服务'},{id: '美居服务',text: '美居服务'},{id: '社区新零售',text: '社区新零售'}]"
                                runat="server" disabled="disabled" />
                        </td>
                        <td class="title"><span>签约类型</span></td>
                        <td class="text">
                            <input type="text" id="SigningType" name="SigningType" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"><span>合同编号</span></td>
                        <td class="text">
                            <input type="text" id="ContractSign" name="ContractSign" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>合同名称</span></td>
                        <td class="text" colspan="3">
                            <input type="text" id="ContractName" name="ContractName" class="easyui-textbox" runat="server" data-options="width:'84%'" disabled="disabled" />
                        </td>
                        <td class="title"><span>合同签约方数</span></td>
                        <td class="text">
                            <input id="ContractSignNumbers" name="ContractSignNumbers" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '两方合同',text: '两方合同'},{id: '三方合同',text: '三方合同'}]"
                                runat="server" disabled="disabled" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">收款方信息(称谓：
                        <input class="easyui-radiobutton" id="Seller0" name="Seller"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left',checked:true" disabled="disabled" />
                    <input class="easyui-radiobutton" id="Seller1" name="Seller"
                        data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                    <input class="easyui-radiobutton" id="Seller2" name="Seller"
                        data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                    )</legend>
                <input type="hidden" id="SellerCall" name="SellerCall" value="0" runat="server" />
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">收款方名称</td>
                        <td class="text" colspan="3">
                            <input type="text" id="SellerName" name="SellerName" class="easyui-textbox" runat="server" data-options="width:'84%'" disabled="disabled" />
                            <input type="hidden" id="SellerID" name="SellerID" runat="server" />
                        </td>
                        <td class="title">收款方证件名称</td>
                        <td class="text">
                            <input type="text" id="SellerPaperName" name="SellerPaperName" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">收款方证件号码</td>
                        <td class="text">
                            <input type="text" id="SellerPaperCode" name="SellerPaperCode" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">收款方(注册)地址</td>
                        <td class="text">
                            <input type="text" id="SellerRegAddr" name="SellerRegAddr" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">收款方邮政编码</td>
                        <td class="text">
                            <input type="text" id="SellerPostCode" name="SellerPostCode" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">收款方法定代表人</td>
                        <td class="text">
                            <input type="text" id="SellerLegalPeople" name="SellerLegalPeople" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">收款方联系人</td>
                        <td class="text">
                            <input type="text" id="SellerConnectpeople" name="SellerConnectpeople" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">收款方联系电话</td>
                        <td class="text">
                            <input type="text" id="SellerConnectTel" name="SellerConnectTel" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">付款方信息(称谓：
                         <input class="easyui-radiobutton" id="Buyer0" name="Buyer"
                             data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                    <input class="easyui-radiobutton" id="Buyer1" name="Buyer"
                        data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left',checked:true" disabled="disabled" />
                    <input class="easyui-radiobutton" id="Buyer2" name="Buyer"
                        data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                    )</legend>
                <input type="hidden" id="BuyerCall" name="BuyerCall" value="1" runat="server" />
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">付款方名称</td>
                        <td class="text" colspan="3">
                            <input id="BuyerCustName" name="BuyerCustName" class="easyui-textbox" runat="server" data-options="width:'84%'" disabled="disabled" />
                            <input type="hidden" id="BuyerCustID" name="BuyerCustID" runat="server" />
                        </td>
                        <td class="title">付款方证件名称</td>
                        <td class="text">
                            <input type="text" id="BuyerPaperName" name="BuyerPaperName" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">付款方证件号码</td>
                        <td class="text">
                            <input type="text" id="BuyerPaperCode" name="BuyerPaperCode" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">付款方联系地址</td>
                        <td class="text">
                            <input type="text" id="BuyerLiveAddr" name="BuyerLiveAddr" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">付款方邮政编码</td>
                        <td class="text">
                            <input type="text" id="BuyerPostCode" name="BuyerPostCode" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">付款方法定代表人</td>
                        <td class="text">
                            <input type="text" id="BuyerLegalPeople" name="BuyerLegalPeople" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">付款方联系人</td>
                        <td class="text">
                            <input type="text" id="BuyerConnectpeople" name="BuyerConnectpeople" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">付款方联系电话</td>
                        <td class="text">
                            <input type="text" id="BuyerConnectTel" name="BuyerConnectTel" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">付款方享受优惠政策</td>
                        <td class="text">
                            <input type="text" id="BuyerPreferentialPolicy" name="BuyerPreferentialPolicy" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">优惠证件编号</td>
                        <td class="text">
                            <input type="text" id="BuyerPreferentialPolicyIdCode" name="BuyerPreferentialPolicyIdCode" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset" id="ManageDiv">
                <legend class="frame-legend">管理方信息(称谓： 
                        <input class="easyui-radiobutton" id="Manage0" name="Manage"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                    <input class="easyui-radiobutton" id="Manage1" name="Manage"
                        data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                    <input class="easyui-radiobutton" id="Manage2" name="Manage"
                        data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left',checked:true" disabled="disabled" />
                    )</legend>
                <input type="hidden" id="ManageCall" name="ManageCall" value="2" runat="server" />
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">管理方名称</td>
                        <td class="text" colspan="3">
                            <input id="ManageName" name="ManageName" class="easyui-textbox" runat="server" data-options="width:'84%'" disabled="disabled" />
                            <input type="hidden" id="ManageID" name="ManageID" runat="server" />
                        </td>
                        <td class="title">管理方证件名称</td>
                        <td class="text">
                            <input type="text" id="ManagePaperName" name="ManagePaperName" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">管理方证件号码</td>
                        <td class="text">
                            <input type="text" id="ManagePaperCode" name="ManagePaperCode" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">管理方(注册)地址</td>
                        <td class="text">
                            <input type="text" id="ManageRegAddr" name="ManageRegAddr" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">管理方邮政编码</td>
                        <td class="text">
                            <input type="text" id="ManagePostCode" name="ManagePostCode" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">管理方法定代表人</td>
                        <td class="text">
                            <input type="text" id="ManageLegalPeople" name="ManageLegalPeople" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">管理方联系人</td>
                        <td class="text">
                            <input type="text" id="ManageConnectpeople" name="ManageConnectpeople" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">管理方联系电话</td>
                        <td class="text">
                            <input type="text" id="ManageConnectTel" name="ManageConnectTel" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">合同计费信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">合同开始时间</td>
                        <td class="text">
                            <input type="text" id="ContractBeginTime" name="ContractBeginTime" class="easyui-datebox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">合同结束时间</td>
                        <td class="text">
                            <input type="text" id="ContractEndTime" name="ContractEndTime" class="easyui-datebox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">合同期限(月)</td>
                        <td class="text">
                            <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-numberbox"
                                disabled="disabled" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">合同到期提醒时间</td>
                        <td class="text">
                            <input type="text" id="ContractRemindOfExpiraTimetion" name="ContractRemindOfExpiraTimetion" class="easyui-datebox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">优惠免租结束时间</td>
                        <td class="text">
                            <input type="text" id="RentFreeEndTime" name="RentFreeEndTime" class="easyui-datebox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">优惠原因</td>
                        <td class="text">
                            <input type="text" id="RentFreeReason" name="RentFreeReason" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">点位编号</td>
                        <td class="text" colspan="5">
                            <input id="PointNames" name="PointNames" class="easyui-textbox" disabled="disabled" data-options="multiline:true,width:'90%',height:'50px'" runat="server" />
                            <input type="hidden" id="PointIDs" name="PointIDs" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">点位地址</td>
                        <td class="text" colspan="5">
                            <input type="text" id="PointAddr" name="PointAddr" class="easyui-textbox" runat="server" disabled="disabled"
                                data-options="width:'90%',height:'40px',multiline:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">点位描述</td>
                        <td class="text" colspan="5">
                            <input type="text" id="PointDis" name="PointDis" class="easyui-textbox" runat="server" disabled="disabled"
                                data-options="width:'90%',height:'40px',multiline:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">点位用途</td>
                        <td class="text" colspan="5">
                            <input type="text" id="PointPurpose" name="PointPurpose" class="easyui-textbox" runat="server" disabled="disabled"
                                data-options="width:'90%',height:'40px',multiline:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">点位数量(个)</td>
                        <td class="text">
                            <input type="text" id="PointNumber" name="PointNumber" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">计费数量(个)</td>
                        <td class="text">
                            <input type="text" id="PointChargeNumber" name="PointChargeNumber" class="easyui-textbox " runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr>
                        <td class="title">点位面积(平米)</td>
                        <td class="text">
                            <input type="text" id="PointArea" name="PointArea" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">计费面积(平米)</td>
                        <td class="text">
                            <input type="text" id="PointChargeArea" name="PointChargeArea" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr>
                        <td class="title">计费方式</td>
                        <td class="text" colspan="5">
                            <input class="easyui-checkbox" id="ChargeCalculation1" name="ChargeCalculationx" data-options="value:'1',label:'总额固定方式',labelWidth:90,labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                            <input class="easyui-checkbox" id="ChargeCalculation2" name="ChargeCalculationx" data-options="value:'2',label:'据实结算方式',labelWidth:90,labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                            <input class="easyui-checkbox" id="ChargeCalculation3" name="ChargeCalculationx" data-options="value:'3',label:'营业提成方式',labelWidth:90,labelPosition:'after',labelAlign:'left'" disabled="disabled" />
                            <input type="hidden" id="ChargeCalculation" name="ChargeCalculation" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">计算方式</td>
                        <td class="text" colspan="5">
                            <div style="height: 28px;">
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod1" name="ChargeCalculation1"
                                    data-options="value:'3',label:'按每天单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod2" name="ChargeCalculation1"
                                    data-options="value:'0',label:'按每月单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod3" name="ChargeCalculation1"
                                    data-options="value:'1',label:'按缴费周期总额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod4" name="ChargeCalculation1"
                                    data-options="value:'2',label:'按合同期间总额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                            </div>
                            <div style="height: 28px;">
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod5" name="ChargeCalculation2"
                                    data-options="value:'4',label:'按数量*单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod6" name="ChargeCalculation2"
                                    data-options="value:'5',label:'按实际发生额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                            </div>
                            <div style="height: 28px;">
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod7" name="ChargeCalculation3"
                                    data-options="value:'6',label:'按提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod8" name="ChargeCalculation3"
                                    data-options="value:'7',label:'按保底+提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod9" name="ChargeCalculation3"
                                    data-options="value:'8',label:'保底、提成就高',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                            </div>
                            <input type="hidden" id="CalculationMethod" name="CalculationMethod" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">计费标准(元)</td>
                        <td class="text">
                            <input type="text" id="ChargeStandard" name="ChargeStandard" class="easyui-numberbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">计费标准单位</td>
                        <td class="text">
                            <input type="text" id="ChargeUnit" name="ChargeUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle" colspan="6" style="text-align: left;">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="BtnOpenOrClose">更多标准展开/折叠</a>
                        </td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="title">物管费标准(元)</td>
                        <td class="text">
                            <input type="text" id="PropertyManageCostStandard" name="PropertyManageCostStandard" class="easyui-numberbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">物管费标准单位</td>
                        <td class="text">
                            <input type="text" id="PropertyManageCostUnit" name="PropertyManageCostUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="title">水费标准(元)</td>
                        <td class="text">
                            <input type="text" id="WaterCostStandard" name="WaterCostStandard" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">水费标准单位</td>
                        <td class="text">
                            <input type="text" id="WaterCostUnit" name="WaterCostUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="title">电费标准(元)</td>
                        <td class="text">
                            <input type="text" id="ElectricCostStandard" name="ElectricCostStandard" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">电费标准单位</td>
                        <td class="text">
                            <input type="text" id="ElectricCostUnit" name="ElectricCostUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="title">气费标准(元)</td>
                        <td class="text">
                            <input type="text" id="GasCostStandard" name="GasCostStandard" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">气费标准单位</td>
                        <td class="text">
                            <input type="text" id="GasCostUnit" name="GasCostUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="title">空调费标准(元)</td>
                        <td class="text">
                            <input type="text" id="AirConditionerCostStandard" name="AirConditionerCostStandard" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">空调费标准单位</td>
                        <td class="text">
                            <input type="text" id="AirConditionerCostUnit" name="AirConditionerCostUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="title">供热费标准(元)</td>
                        <td class="text">
                            <input type="text" id="HeatSupplyCostStandard" name="HeatSupplyCostStandard" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">供热费标准单位</td>
                        <td class="text">
                            <input type="text" id="HeatSupplyCostUnit" name="HeatSupplyCostUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr class="CostStandard">
                        <td class="title">垃圾清运费标准(元)</td>
                        <td class="text">
                            <input type="text" id="WasteTransportCostStandard" name="WasteTransportCostStandard" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">垃圾清运费标准单位</td>
                        <td class="text">
                            <input type="text" id="WasteTransportCostUnit" name="WasteTransportCostUnit" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr>
                        <td class="title">保底收入金额(元)</td>
                        <td class="text">
                            <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">保底营业金额(元)</td>
                        <td class="text">
                            <input type="text" id="GuaranteeBusinessAmount" name="GuaranteeBusinessAmount" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">保底金额收取方式</td>
                        <td class="text">
                            <input id="GuaranteeAmountCollectionWay" name="GuaranteeAmountCollectionWay" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',value:'按计费周期收取',
                                    data: [{id: '按计费周期收取',text: '按计费周期收取'},{id: '按合同期间收取',text: '按合同期间收取'}]"
                                runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">合同总额(元)</td>
                        <td class="text">
                            <input type="text" id="ContractTotalPrice" name="ContractTotalPrice" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">营业提成比例(%)</td>
                        <td class="text">
                            <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">营业提成起提金额(元)</td>
                        <td class="text">
                            <input type="text" id="BusinessRoyaltyRaiseAmount" name="BusinessRoyaltyRaiseAmount" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">上次合同总额(元)</td>
                        <td class="text">
                            <input type="text" id="LastContractTotalPrice" name="LastContractTotalPrice" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">合同保证金(元)</td>
                        <td class="text">
                            <input type="text" id="ContractDepositPrice" name="ContractDepositPrice" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">合同保证金描述</td>
                        <td class="text">
                            <input type="text" id="ContractDepositDis" name="ContractDepositDis" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">计费期间</td>
                        <td class="text">
                            <input id="ChargingMode" name="ChargingMode" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',value:'0',data: [{id: '0',text: '按对时'},{id: '1',text: '按整月'}]"
                                runat="server" disabled="disabled" />
                        </td>
                        <td class="TdTitle" colspan="2" style="text-align: left;">
                            <input class="easyui-checkbox" id="IsContinuityChargingName" name="IsContinuityChargingName" data-options="label:'按对时按每月单价计算时,多个期间不同单价,是否连续计费?',labelWidth:320,labelPosition:'after',labelAlign:'left'" runat="server" />
                            <input type="hidden" id="IsContinuityCharging" name="IsContinuityCharging" value="0" runat="server" />
                        <td class="title">付款方式</td>
                        <td class="text">
                            <input type="text" id="PaymentMethod" name="PaymentMethod" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">合同内容信息</legend>
                <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">是否范本合同</td>
                        <td class="text">
                            <input id="IsModelContract" name="IsModelContract" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',value:'是',data: [{id: '是',text: '是'},{id: '否',text: '否'}]"
                                runat="server" disabled="disabled" />
                        </td>
                        <td class="title">合同范本来源</td>
                        <td class="text">
                            <input type="text" id="ModelContractSource" name="ModelContractSource" class="easyui-textbox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title"></td>
                        <td class="text"></td>
                    </tr>
                    <tr>
                        <td class="title">范本修改内容</td>
                        <td class="text" colspan="5">
                            <input type="text" id="ModelUpdateContent" name="ModelUpdateContent" class="easyui-textbox" runat="server" data-options="width:'90%',height:'40px',multiline:true" disabled="disabled" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">合同内容提要</td>
                        <td class="text" colspan="5">
                            <input type="text" id="ContractDescribe" name="ContractDescribe" class="easyui-textbox" runat="server" disabled="disabled"
                                data-options="width:'90%',height:'80px',multiline:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">合同内容描述</td>
                        <td class="text" colspan="5">
                            <input type="text" id="ContractDis" name="ContractDis" class="easyui-textbox" runat="server" disabled="disabled"
                                data-options="width:'90%',height:'80px',multiline:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">备注</td>
                        <td class="text" colspan="5">
                            <input type="text" id="Remark" name="Remark" class="easyui-textbox" runat="server" disabled="disabled"
                                data-options="width:'90%',height:'40px',multiline:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">合同份数</td>
                        <td class="text">
                            <input type="text" id="ContractNumber" name="ContractNumber" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">每份页数</td>
                        <td class="text">
                            <input type="text" id="ContractPaperNumber" name="ContractPaperNumber" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                        <td class="title">附件数量</td>
                        <td class="text">
                            <input type="text" id="AdjunctNumber" name="AdjunctNumber" class="easyui-numberbox" disabled="disabled" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">机构部门/负责人</td>
                        <td class="text">
                            <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox" disabled="disabled" runat="server" />
                            <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                            <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                        </td>
                        <td class="title">签约时间</td>
                        <td class="text">
                            <input type="text" id="ContractSignTime" name="ContractSignTime" class="easyui-datebox" runat="server" disabled="disabled" />
                        </td>
                        <td class="title">登记时间</td>
                        <td class="text">
                            <input type="text" id="ContractRegisterTime" name="ContractRegisterTime" class="easyui-datebox" runat="server" disabled="disabled" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">合同其它信息</legend>
                <table class="bootstrap_table baseinfo OtherTable" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class='title'></td>
                        <td class='text'></td>
                        <td class='title'></td>
                        <td class='text'></td>
                        <td class='title'></td>
                        <td class='text'></td>
                    </tr>
                </table>
            </fieldset>
            <!-- 合同子表内容数据 -->
            <div id="SubItem" style="height: 340px;">
                <div id="tabSubItem" class="easyui-tabs" data-options="fit:true">
                    <div id="tabSubItem0" data-issel="true" title="点位信息" style="overflow: hidden;">
                        <div id="TableContainerPoint" style="background-color: #cccccc;"></div>
                    </div>
                    <div id="tabSubItem1" data-issel="false" title="计费标准" style="overflow: hidden;">
                        <div id="TableContainerSetting" style="background-color: #cccccc;"></div>
                    </div>
                    <div id="tabSubItem2" data-issel="false" title="合同费用" style="overflow: hidden;">
                        <div id="TableContainerContractFees" style="background-color: #cccccc;"></div>
                    </div>
                </div>
            </div>
            <!-- 按钮工具栏 -->
            <div style="text-align: center; width: 100%; padding: 10px 0;">
                <input class="button" type="button" id="BtnClose" value="关闭" />
            </div>
        </div>
    </form>
    <script type="text/javascript">
        //初始化页面控件高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $('#InformationContent').css("height", h + 'px');
            $('#tabSubItem').tabs({
                onSelect: tabSubItemSelect
            });
            $('#TableContainerPoint').css("width", w - 41 + "px");
        }
        //合同子表信息切换
        function tabSubItemSelect(title, index) {
            var ItemTab = $('#tabSubItem').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //合同计费信息
                    setTimeout(function () {
                        LoadContractSetting();
                    }, 300);
                } else if (index == 2) {
                    //合同费用
                    setTimeout(function () {
                        LoadFeesGrid();
                    }, 300);
                }
            }
        }

        /* 点位信息 */
        var PointColumn = [[
            { field: 'CommName', title: '项目名称', width: '110', align: 'left' },
            { field: 'ContractPointType', title: '点位类型', width: '80', align: 'left' },
            { field: 'ContractPointCategory', title: '点位类别', width: '90', align: 'left' },
            { field: 'ContractPointRegion', title: '点位区域', width: '100', align: 'left' },
            { field: 'ContractPointNumber', title: '点位编号', width: '200', align: 'left' },
            { field: 'ContractPointArea', title: '点位面积', width: '70', align: 'center' },
            { field: 'ChargeNumber', title: '计费数量', width: '70', align: 'center' },
            { field: 'PointBeginTime', title: '开始时间', width: '100', align: 'center' },
            { field: 'PointEndTime', title: '结束时间', width: '100', align: 'center' },
            { field: 'RentFreeEndTime', title: '优惠免租结束时间', width: '110', align: 'center' },

            {
                field: 'InTime', title: '启用时间', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'OutTime', title: '退租时间', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            }
        ]];
        //加载点位信息
        function LoadPointGrid() {
            var Data = [];
            if ($('#PointResult').val() != "") {
                Data = JSON.parse($('#PointResult').val());
            }
            $("#TableContainerPoint").datagrid({
                data: Data,
                nowrap: false,
                columns: PointColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: false,
                toolbar: [],
                rownumbers: true,
                border: false,
                height: "100%",
                onLoadSuccess: function (data) {

                }
            });
        }

        /* 计费标准 */
        var SettingColumn = [[
            { field: 'CommName', title: '项目名称', width: '100', align: 'center' },
            { field: 'CustName', title: '客户名称', width: '200', align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'center' },
            {
                field: 'PointNumber', title: '点位编号', width: '260', align: 'left', formatter: function (value, row, index) {
                    if (isValueNull(value)) {
                        return "<a style=\"color:blue\" onclick=\"ContractSettingPointDetail_Click('" + row.CommID + "','" + row.PointID + "')\" href=\"javascript:void(0);\">" + value + "</a>";
                    }
                    return "";
                }
            },
            { field: 'BeginDate', title: '开始时间', width: '100', align: 'center' },
            { field: 'EndDate', title: '结束时间', width: '100', align: 'center' },
            { field: 'DueDate', title: '应收时间', width: '100', align: 'center' },
            { field: 'CostName', title: '费用项目', width: '120', align: 'center' },
            {
                field: 'ChargeCalculation', title: '计费方式', width: '100', align: 'center', formatter: function (value, row, index) {
                    if (value == "1") {
                        return "总额固定方式";
                    } else if (value == "2") {
                        return "据实结算方式";
                    } else if (value == "3") {
                        return "营业提成方式";
                    }
                }
            },
            {
                field: 'CalculationMethod', title: '计算方式', width: '100', align: 'center', formatter: function (value, row, index) {
                    if (value == "0") {
                        return "按每月单价";
                    } else if (value == "1") {
                        return "按缴费周期总额";
                    } else if (value == "2") {
                        return "按合同期间总额";
                    } else if (value == "3") {
                        return "按每天单价";
                    } else if (value == "4") {
                        return "按数量*单价";
                    } else if (value == "5") {
                        return "按实际发生额";
                    } else if (value == "6") {
                        return "按提成";
                    } else if (value == "7") {
                        return "按保底+提成";
                    } else if (value == "8") {
                        return "保底、提成就高";
                    }
                }
            },
            { field: 'ContPeriod', title: '计费周期', width: '100', align: 'center' },
            { field: 'ContPrice', title: '计费标准', width: '100', align: 'center' },
            { field: 'ChargeNumber', title: '计费数量', width: '100', align: 'center' },
            { field: 'GuaranteeAmount', title: '保底金额', width: '80', align: 'center' },
            { field: 'BusinessRoyaltyRatio', title: '提成比例', width: '80', align: 'center' },
            {
                field: 'ContractDelinBeginMonth', title: '合同违约金起计时间', width: '200', align: 'left', formatter: function (value, row, index) {
                    if (isValueNull(value)) {
                        return "应收时间延后(" + value + ")月(" + row.ContractDelinBeginDay + ")日起计";
                    } else {
                        if (isValueNull(row.ContractDelinBeginDay)) {
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
            if ($('#SettingResult').val() != "") {
                Data = JSON.parse($('#SettingResult').val());
            }
            $("#TableContainerSetting").datagrid({
                data: Data,
                nowrap: false,
                columns: SettingColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: false,
                toolbar: [],
                rownumbers: true,
                border: false,
                height: '100%',
                onLoadSuccess: function (data) {

                }
            });
        }
        //合同标准点位明细
        function ContractSettingPointDetail_Click(CommID, PointIDs) {
            var param = {
                "CommID": CommID,
                "PointIDs": PointIDs
            };
            localStorage.setItem("ContractSettingPointDetail", JSON.stringify(param));
            LayerDialog.OpenWin('1000', '530', '../DiversifiedManage/ContractManage/ContractSettingPointDetail.aspx', "合同标准点位明细", false, function callback(data) {
            });
        }

        /* 合同费用 */
        var FeesColumn = [[
            { field: 'FeesType', title: '费用状态', width: '80', align: 'center' },
            { field: 'CommName', title: '项目名称', width: '140', align: 'left' },
            { field: 'CustName', title: '客户名称', width: '200', align: 'left' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: '200', align: 'left' },
            { field: 'CostName', title: '费用项目', width: '140', align: 'left' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: '160', align: 'center' },
            {
                field: 'AccountsDueDate', title: '应收日期', width: '100', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStartDate', title: '开始日期', width: '100', align: 'center', formatter: function (value, row, index) {
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
            { field: 'DebtsAmount', title: '欠费金额', width: '80', align: 'center' }
        ]];
        let IsMerge = '0';
        var FeesToolBar = [{
            text: '<input class="easyui-checkbox" id="IsMerge" name="IsMerge" data-options="label:\'是否合并\',labelWidth:80,labelPosition:\'after\',labelAlign:\'left\'" />'
        }];
        //判断是否需要合并费用
        function IsMergeChange(checked) {
            if (checked) {
                IsMerge = "1"
            } else {
                IsMerge = "0"
            }
            LoadFeesGrid();
        }

        //加载费用列表
        function LoadFeesGrid() {
            $("#TableContainerContractFees").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                columns: FeesColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: false,
                toolbar: FeesToolBar,
                rownumbers: true,
                border: false,
                height: '100%',
                showFooter: true,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "ContractFeesList_History";
                    param["HistoryID"] = $("#HistoryID").val();
                    param["IsMerge"] = IsMerge;
                },
                onLoadSuccess: function (data) {
                    //加载页脚
                    $('#TableContainerContractFees').datagrid('reloadFooter', [
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
                    //判断是否已经渲染过了 如果渲染过了就不再渲染
                    $('#IsMerge').checkbox({
                        onChange: IsMergeChange,
                        checked: IsMerge == "1" ? true : false
                    });
                }
            });
        }
        //指定列求和
        function computeHTFY(colName) {
            var rows = $('#TableContainerContractFees').datagrid('getRows');
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

        //加载合同其他信息
        function LoadOtherContractData() {
            var OtherContractData = $('#OtherTableResult').val();
            if (isValueNull(OtherContractData)) {
                var IsDisabled = "disabled='disabled'";
                OtherContractData = $.parseJSON(OtherContractData);
                var IsRequired = false;
                for (var i = 0; i < OtherContractData.length; i++) {
                    if (OtherContractData[i].FieldIsRequired == "是") {
                        IsRequired = true;
                    }
                    var ItemTimeValue = OtherContractData[i].FieldValue;
                    if (OtherContractData[i].FieldType == "数值") {
                        $('.OtherTable').append("<tr><td class='title'><span>" + OtherContractData[i].FieldName +
                            "</span></td><td class='text'><input type='text' " + IsDisabled + " value='" + ItemTimeValue + "' id='" + OtherContractData[i].ContractFieldSetID +
                            "' name='" + OtherContractData[i].ContractFieldSetID +
                            "' class='easyui-numberbox UserInput' data-options='required:" + IsRequired + ",precision:2' />" +
                            "</td><td class='title'></td><td class='text'></td><td class='title'></td><td class='text'></td></tr>");
                    } else if (OtherContractData[i].FieldType == "文本") {
                        $('.OtherTable').append("<tr><td class='title'><span>" + OtherContractData[i].FieldName +
                            "</span></td><td class='text'><input type='text' " + IsDisabled + " value='" + ItemTimeValue + "' id='" + OtherContractData[i].ContractFieldSetID +
                            "' name='" + OtherContractData[i].ContractFieldSetID +
                            "' class='easyui-textbox UserInput' data-options='required:" + IsRequired + "'  />" +
                            "</td><td class='title'></td><td class='text'></td><td class='title'></td><td class='text'></td></tr>");
                    } else if (OtherContractData[i].FieldType == "时间") {

                        if (ItemTimeValue != "") {
                            ItemTimeValue = $.dateFormat(ItemTimeValue, 'yyyy-MM-dd');
                        }
                        $('.OtherTable').append("<tr><td class='title'><span>" + OtherContractData[i].FieldName +
                            "</span></td><td class='text'><input type='text' " + IsDisabled + " value='" + ItemTimeValue + "' id='" + OtherContractData[i].ContractFieldSetID +
                            "' name='" + OtherContractData[i].ContractFieldSetID +
                            "' class='easyui-datebox UserInput' data-options='required:" + IsRequired + ",editable:false' />" +
                            "</td><td class='title'></td><td class='text'></td><td class='title'></td><td class='text'></td></tr>");
                    }
                }
                $.parser.parse(".OtherTable")//重新渲染，参数为要渲染的容器
            }
        }

        function CalculationMethodChange(val) {
            switch (val.toString()) {
                case "3":
                    $('#ChargeUnit').textbox("setValue", "元/日");
                    break;
                case "0":
                    $('#ChargeUnit').textbox("setValue", "元/月");
                    break;
                case "1":
                    $('#ChargeUnit').textbox("setValue", "元/周期总额");
                    break;
                case "2":
                    $('#ChargeUnit').textbox("setValue", "元/租期总额");
                    break;
                default:
                    $('#ChargeUnit').textbox("setValue", "");
                    break;
            }
        }

        $(function () {
            //初始化页面高度
            InitTableHeight();

            //设置背景色
            $('.ClassDisable').each(function () {
                $(this).textbox('textbox').css('opacity', '0.5');
                $(this).textbox('textbox').css('background', '#E3E3E3');
            })

            //加载合同签约方数 
            if ($('#ContractSignNumbers').combobox("getValue") == "三方合同") {
                $("#ManageDiv").show();
            } else if ($('#ContractSignNumbers').combobox("getValue") == "两方合同") {
                $("#ManageDiv").hide();
            } else {
                $('#ContractSignNumbers').combobox("setValue", "两方合同")
                $("#ManageDiv").hide();
            }

            //有数据时进行加载 
            if ($('#SellerCall').val() == "1") {
                $('#Seller1').radiobutton({ checked: true });
            } else if ($('#SellerCall').val() == "2") {
                $('#Seller2').radiobutton({ checked: true });
            } else {
                $('#Seller0').radiobutton({ checked: true });
            }

            if ($('#BuyerCall').val() == "1") {
                $('#Buyer1').radiobutton({ checked: true });
            } else if ($('#BuyerCall').val() == "2") {
                $('#Buyer2').radiobutton({ checked: true });
            } else {
                $('#Buyer0').radiobutton({ checked: true });
            }

            if ($('#ManageCall').val() == "1") {
                $('#Manage1').radiobutton({ checked: true });
            } else if ($('#ManageCall').val() == "2") {
                $('#Manage2').radiobutton({ checked: true });
            } else {
                $('#Manage0').radiobutton({ checked: true });
            }
            //判断选中 计费方式
            if ($('#ChargeCalculation').val() != "") {
                var ChargeCalculationVal = $('#ChargeCalculation').val();
                var CalculationMethodVal = $('#CalculationMethod').val();
                if (ChargeCalculationVal.indexOf('1') > -1) {
                    $('#ChargeCalculation1').checkbox("check");
                    //验证当前计费下选中的是哪一个 计算方式
                    if (CalculationMethodVal.indexOf('3') > -1) {
                        $('#CalculationMethod1').radiobutton("check");
                    } else if (CalculationMethodVal.indexOf('0') > -1) {
                        $('#CalculationMethod2').radiobutton("check");
                    } else if (CalculationMethodVal.indexOf('1') > -1) {
                        $('#CalculationMethod3').radiobutton("check");
                    } else if (CalculationMethodVal.indexOf('2') > -1) {
                        $('#CalculationMethod4').radiobutton("check");
                    } else {
                        $('#CalculationMethod1').radiobutton("check");
                    }
                }
                if (ChargeCalculationVal.indexOf('2') > -1) {
                    $('#ChargeCalculation2').checkbox("check");
                    //验证当前计费下选中的是哪一个 计算方式
                    if (CalculationMethodVal.indexOf('4') > -1) {
                        $('#CalculationMethod5').radiobutton("check");
                    } else if (CalculationMethodVal.indexOf('5') > -1) {
                        $('#CalculationMethod6').radiobutton("check");
                    } else {
                        $('#CalculationMethod5').radiobutton("check");
                    }
                }
                if (ChargeCalculationVal.indexOf('3') > -1) {
                    $('#ChargeCalculation3').checkbox("check");
                    //验证当前计费下选中的是哪一个 计算方式
                    if (CalculationMethodVal.indexOf('6') > -1) {
                        $('#CalculationMethod7').radiobutton("check");
                    } else if (CalculationMethodVal.indexOf('7') > -1) {
                        $('#CalculationMethod8').radiobutton("check");
                    } else if (CalculationMethodVal.indexOf('8') > -1) {
                        $('#CalculationMethod9').radiobutton("check");
                    } else {
                        $('#CalculationMethod7').radiobutton("check");
                    }
                }
            }
            if ($('#IsContinuityCharging').val() == "1") {
                $('#IsContinuityChargingName').checkbox("check");
            }
            LoadPointGrid() //加载点位信息
            LoadOtherContractData();//加载合同的其他信息

            $(".easyui-radiobutton").radiobutton({ disabled: true });
            $(".easyui-checkbox").checkbox({ disabled: true });

            //注册点击事件
            $("#BtnClose").click(function (e) {
                LayerDialog.Close('');
            });

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
        });
    </script>
</body>
</html>
