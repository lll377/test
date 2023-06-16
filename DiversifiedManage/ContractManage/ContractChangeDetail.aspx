<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractChangeDetail.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractChangeDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="/HM/M_Main/UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="/HM/M_Main/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同变更页面</title>
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
        input {
            height: 28px;
            line-height: 28px;
        }

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
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input id="OpType" type="hidden" name="OpType" runat="server">
        <input id="CommID" type="hidden" name="CommID" runat="server">
        <input id="ID" type="hidden" name="ID" runat="server"><!-- 自动生成的合同变更id 流程使用 具有唯一性 -->
        <input id="ContractID" type="hidden" name="ContractID" runat="server"><!-- 合同主表id -->
        <input id="ContID" type="hidden" name="ContID" runat="server"><!-- 合同主表id -->
        <input id="PointResult" name="PointResult" type="hidden" runat="server">
        <input id="SettingResult" name="SettingResult" type="hidden" runat="server">
        <input id="OtherTableResult" name="OtherTableResult" type="hidden" runat="server"><!-- 合同其他信息字段内容 -->
        <input type="hidden" id="AuditStatus" name="AuditStatus" value="未启动" runat="server" />
        <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
            <div id="tab0" data-issel="true" title="合同登记信息" style="overflow: auto; padding: 10px;">
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
                                <input id="ContractCategory" name="ContractCategory" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
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
                                    valueField:'id',textField:'text',
                                    data: [{id: '两方合同',text: '两方合同'},{id: '三方合同',text: '三方合同'}]"
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
                                <input id="BuyerCustName" name="BuyerCustName" class="easyui-textbox"
                                    data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'84%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelBuyer();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#BuyerCustID').val('')
                                            }}] "
                                    runat="server" />
                                <a id="tipBuyerCust" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'"></a>
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
                                <input type="text" id="BuyerConnectpeople" name="BuyerConnectpeople" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title">付款方联系电话</td>
                            <td class="text">
                                <input type="text" id="BuyerConnectTel" name="BuyerConnectTel" class="easyui-textbox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">付款方享受优惠政策</td>
                            <td class="text">
                                <input type="text" id="BuyerPreferentialPolicy" name="BuyerPreferentialPolicy" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title">优惠证件编号</td>
                            <td class="text">
                                <input type="text" id="BuyerPreferentialPolicyIdCode" name="BuyerPreferentialPolicyIdCode" class="easyui-textbox" runat="server" />
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
                                <input type="text" id="ContractBeginTime" name="ContractBeginTime" class="easyui-datebox" runat="server"
                                    data-options="editable:false,required:true,onChange:ContractTimeSelect" />
                            </td>
                            <td class="title">合同结束时间</td>
                            <td class="text">
                                <input type="text" id="ContractEndTime" name="ContractEndTime" class="easyui-datebox" runat="server"
                                    data-options="editable:false,required:true,onChange:ContractTimeSelect" />
                            </td>
                            <td class="title">合同期限(月)</td>
                            <td class="text">
                                <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-numberbox"
                                    data-options="required:true,min:1,precision:0" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">合同到期提醒时间</td>
                            <td class="text">
                                <input type="text" id="ContractRemindOfExpiraTimetion" name="ContractRemindOfExpiraTimetion" class="easyui-datebox" runat="server" data-options="editable:false" />
                            </td>
                            <td class="title">优惠免租结束时间</td>
                            <td class="text">
                                <input type="text" id="RentFreeEndTime" name="RentFreeEndTime" class="easyui-datebox" runat="server"
                                    data-options="editable:false,onChange:RentFreeEndTimeSelect" />
                            </td>
                            <td class="title">优惠原因</td>
                            <td class="text">
                                <input type="text" id="RentFreeReason" name="RentFreeReason" class="easyui-textbox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">点位编号</td>
                            <td class="text" colspan="5">
                                <input id="PointNames" name="PointNames" class="easyui-textbox" runat="server" data-options="multiline:true,width:'90%',height:'50px'" disabled="disabled" />
                                <input type="hidden" id="PointIDs" name="PointIDs" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">点位地址</td>
                            <td class="text" colspan="5">
                                <input type="text" id="PointAddr" name="PointAddr" class="easyui-textbox" runat="server"
                                    disabled="disabled" data-options="width:'90%',height:'40px',multiline:true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">点位描述</td>
                            <td class="text" colspan="5">
                                <input type="text" id="PointDis" name="PointDis" class="easyui-textbox" runat="server"
                                    disabled="disabled" data-options="width:'90%',height:'40px',multiline:true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">点位用途</td>
                            <td class="text" colspan="5">
                                <input type="text" id="PointPurpose" name="PointPurpose" class="easyui-textbox" runat="server" data-options="width:'90%',height:'40px',multiline:true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">点位数量(个)</td>
                            <td class="text">
                                <input type="text" id="PointNumber" name="PointNumber" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                            </td>
                            <td class="title">计费数量(个)</td>
                            <td class="text">
                                <input type="text" id="PointChargeNumber" name="PointChargeNumber" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr>
                            <td class="title">点位面积(平米)</td>
                            <td class="text">
                                <input type="text" id="PointArea" name="PointArea" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                            </td>
                            <td class="title">计费面积(平米)</td>
                            <td class="text">
                                <input type="text" id="PointChargeArea" name="PointChargeArea" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr>
                            <td class="title">计费方式/计算方式</td>
                            <td class="text" colspan="5">
                                <div style="display: inline-block;">
                                    <div style="margin-bottom: 10px">
                                        <input class="easyui-checkbox" id="ChargeCalculation1" name="ChargeCalculationx" data-options="value:'1',label:'总额固定方式',labelWidth:90,labelPosition:'after',labelAlign:'left'" />
                                    </div>
                                    <div style="margin-bottom: 10px">
                                        <input class="easyui-checkbox" id="ChargeCalculation2" name="ChargeCalculationx" data-options="value:'2',label:'据实结算方式',labelWidth:90,labelPosition:'after',labelAlign:'left'" />
                                    </div>
                                    <div style="margin-bottom: 10px">
                                        <input class="easyui-checkbox" id="ChargeCalculation3" name="ChargeCalculationx" data-options="value:'3',label:'营业提成方式',labelWidth:90,labelPosition:'after',labelAlign:'left'" />
                                    </div>
                                    <input type="hidden" id="ChargeCalculation" name="ChargeCalculation" runat="server" />
                                </div>
                                <div style="display: inline-block;">
                                    <div style="margin-bottom: 10px">
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod1" name="ChargeCalculation1"
                                            data-options="value:'3',label:'按每天单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod2" name="ChargeCalculation1"
                                            data-options="value:'0',label:'按每月单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod3" name="ChargeCalculation1"
                                            data-options="value:'1',label:'按缴费周期总额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod4" name="ChargeCalculation1"
                                            data-options="value:'2',label:'按合同期间总额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                    </div>
                                    <div style="margin-bottom: 10px">
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod5" name="ChargeCalculation2"
                                            data-options="value:'4',label:'按数量*单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod6" name="ChargeCalculation2"
                                            data-options="value:'5',label:'按实际发生额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                    </div>
                                    <div style="margin-bottom: 10px">
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod7" name="ChargeCalculation3"
                                            data-options="value:'6',label:'按提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod8" name="ChargeCalculation3"
                                            data-options="value:'7',label:'按保底+提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                          <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod9" name="ChargeCalculation3"
                                            data-options="value:'8',label:'保底、提成就高',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                                    </div>
                                    <input type="hidden" id="CalculationMethod" name="CalculationMethod" runat="server" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="title">计费标准(元)</td>
                            <td class="text">
                                <input type="text" id="ChargeStandard" name="ChargeStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:4" runat="server" />
                            </td>
                            <td class="title">计费标准单位</td>
                            <td class="text">
                                <input type="text" id="ChargeUnit" name="ChargeUnit" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
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
                                <input type="text" id="PropertyManageCostStandard" name="PropertyManageCostStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">物管费标准单位</td>
                            <td class="text">
                                <input type="text" id="PropertyManageCostUnit" name="PropertyManageCostUnit" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr class="CostStandard">
                            <td class="title">水费标准(元)</td>
                            <td class="text">
                                <input type="text" id="WaterCostStandard" name="WaterCostStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">水费标准单位</td>
                            <td class="text">
                                <input type="text" id="WaterCostUnit" name="WaterCostUnit" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr class="CostStandard">
                            <td class="title">电费标准(元)</td>
                            <td class="text">
                                <input type="text" id="ElectricCostStandard" name="ElectricCostStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">电费标准单位</td>
                            <td class="text">
                                <input type="text" id="ElectricCostUnit" name="ElectricCostUnit" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr class="CostStandard">
                            <td class="title">气费标准(元)</td>
                            <td class="text">
                                <input type="text" id="GasCostStandard" name="GasCostStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">气费标准单位</td>
                            <td class="text">
                                <input type="text" id="GasCostUnit" name="GasCostUnit" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr class="CostStandard">
                            <td class="title">空调费标准(元)</td>
                            <td class="text">
                                <input type="text" id="AirConditionerCostStandard" name="AirConditionerCostStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">空调费标准单位</td>
                            <td class="text">
                                <input type="text" id="AirConditionerCostUnit" name="AirConditionerCostUnit" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr class="CostStandard">
                            <td class="title">供热费标准(元)</td>
                            <td class="text">
                                <input type="text" id="HeatSupplyCostStandard" name="HeatSupplyCostStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">供热费标准单位</td>
                            <td class="text">
                                <input type="text" id="HeatSupplyCostUnit" name="HeatSupplyCostUnit" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr class="CostStandard">
                            <td class="title">垃圾清运费标准(元)</td>
                            <td class="text">
                                <input type="text" id="WasteTransportCostStandard" name="WasteTransportCostStandard" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">垃圾清运费标准单位</td>
                            <td class="text">
                                <input type="text" id="WasteTransportCostUnit" name="WasteTransportCostUnit" class="easyui-textbox" runat="server" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr>
                            <td class="title">保底收入金额(元)</td>
                            <td class="text">
                                <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-numberbox" data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">保底营业金额(元)</td>
                            <td class="text">
                                <input type="text" id="GuaranteeBusinessAmount" name="GuaranteeBusinessAmount" class="easyui-numberbox" data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">保底金额收取方式</td>
                            <td class="text">
                                <input id="GuaranteeAmountCollectionWay" name="GuaranteeAmountCollectionWay" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',
                                    data: [{id: '按计费周期收取',text: '按计费周期收取'},{id: '按合同期间收取',text: '按合同期间收取'}]"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">合同总额(元)</td>
                            <td class="text">
                                <input type="text" id="ContractTotalPrice" name="ContractTotalPrice" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                            </td>
                            <td class="title">营业提成比例(%)</td>
                            <td class="text">
                                <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-numberbox" data-options="min:0,max:100,precision:2" runat="server" />
                            </td>
                            <td class="title">营业提成起提金额(元)</td>
                            <td class="text">
                                <input type="text" id="BusinessRoyaltyRaiseAmount" name="BusinessRoyaltyRaiseAmount" class="easyui-numberbox" data-options="min:0,precision:2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">上次合同总额(元)</td>
                            <td class="text">
                                <input type="text" id="LastContractTotalPrice" name="LastContractTotalPrice" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">合同保证金(元)</td>
                            <td class="text">
                                <input type="text" id="ContractDepositPrice" name="ContractDepositPrice" class="easyui-numberbox"
                                    data-options="min:0,precision:2" runat="server" />
                            </td>
                            <td class="title">合同保证金描述</td>
                            <td class="text">
                                <input type="text" id="ContractDepositDis" name="ContractDepositDis" class="easyui-textbox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">计费期间</td>
                            <td class="text">
                                <input id="ChargingMode" name="ChargingMode" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '0',text: '按对时'},{id: '1',text: '按整月'}]"
                                    runat="server" />
                            </td>
                            <td class="TdTitle" colspan="2" style="text-align: left;">
                                <input class="easyui-checkbox" id="IsContinuityChargingName" name="IsContinuityChargingName" data-options="label:'按对时按每月单价计算时,多个期间不同单价,是否连续计费?',labelWidth:320,labelPosition:'after',labelAlign:'left'" runat="server" />
                                <input type="hidden" id="IsContinuityCharging" name="IsContinuityCharging" value="0" runat="server" />
                            <td class="title">付款方式</td>
                            <td class="text">
                                <input type="text" id="PaymentMethod" name="PaymentMethod" class="easyui-textbox" runat="server" />
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
                                <input id="IsModelContract" name="IsModelContract" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
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
                                <input type="text" id="ModelUpdateContent" name="ModelUpdateContent" class="easyui-textbox" runat="server" data-options="width:'90%',height:'40px',multiline:true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">合同内容提要</td>
                            <td class="text" colspan="5">
                                <input type="text" id="ContractDescribe" name="ContractDescribe" class="easyui-textbox" runat="server" data-options="width:'90%',height:'80px',multiline:true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">合同内容描述</td>
                            <td class="text" colspan="5">
                                <input type="text" id="ContractDis" name="ContractDis" class="easyui-textbox" runat="server" data-options="width:'90%',height:'80px',multiline:true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">备注</td>
                            <td class="text" colspan="5">
                                <input type="text" id="Remark" name="Remark" class="easyui-textbox" runat="server" data-options="width:'90%',height:'40px',multiline:true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">合同份数</td>
                            <td class="text">
                                <input type="text" id="ContractNumber" name="ContractNumber" class="easyui-numberbox" data-options="min:0,precision:0" runat="server" />
                            </td>
                            <td class="title">每份页数</td>
                            <td class="text">
                                <input type="text" id="ContractPaperNumber" name="ContractPaperNumber" class="easyui-numberbox" data-options="min:0,precision:0" runat="server" />
                            </td>
                            <td class="title">附件数量</td>
                            <td class="text">
                                <input type="text" id="AdjunctNumber" name="AdjunctNumber" class="easyui-numberbox" data-options="min:0,precision:0" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">签约时间</td>
                            <td class="text">
                                <input type="text" id="ContractSignTime" name="ContractSignTime" class="easyui-datebox" runat="server" data-options="editable:false" />
                            </td>
                            <td class="title">登记时间</td>
                            <td class="text">
                                <input type="text" id="ContractRegisterTime" name="ContractRegisterTime" class="easyui-datebox" runat="server" data-options="editable:false" />
                            </td>
                            <td class="title"></td>
                            <td class="text"></td>
                        </tr>
                        <tr>
                            <td class="title">机构部门/负责人</td>
                            <td class="text" colspan="5">
                                <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox"
                                    data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'52%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#DutyDepCode').val('');
                                            $('#DutyUserCode').val('');
                                            }}] "
                                    runat="server" />
                                <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                                <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
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
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">合同变更信息</legend>
                    <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="title">变更类型</td>
                            <td class="text">
                                <input id="ContractChangeType" name="ContractChangeType" class="easyui-combobox" data-options="required: true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '变更',text: '变更'},{id: '终止',text: '终止'}],onChange:ContractChangeTypeSelect"
                                    runat="server" />
                            </td>
                            <td class="title">终止类型</td>
                            <td class="text">
                                <input id="ContractTerminationType" name="ContractTerminationType" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '',text: ''},{id: '正常终止',text: '正常终止'},{id: '非正常终止',text: '非正常终止'}]"
                                    runat="server" disabled="disabled" />
                            </td>
                            <td class="title">所属机构</td>
                            <td class="text">
                                <input id="AuditDepartmentName" name="AuditDepartmentName" class="easyui-textbox"
                                    data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelAuditDepartment();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#AuditDepartment').val('');
                                            }}] "
                                    runat="server" />
                                <input type="hidden" id="AuditDepartment" name="AuditDepartment" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="title">变更说明</td>
                            <td class="text" colspan="5">
                                <input type="text" id="ContractChangeExplain" name="ContractChangeExplain" class="easyui-textbox" runat="server" data-options="width:'90%',height:'40px',multiline:true" />
                            </td>
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
                        <%-- <div id="tabSubItem3" data-issel="false" title="其它费用" style="overflow: hidden;">
                        <div id="TableContainerOtherFees" style="background-color: #cccccc;"></div>
                    </div>--%>
                    </div>
                </div>
                <!-- 流程内容 -->
                <div id="OAFlow" style="height: auto; margin: 0px auto;">
                    <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                    <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
                </div>
                <!-- 按钮工具栏 -->
                <div style="text-align: center; width: 100%; padding: 5px 0;">
                    <input class="button" type="button" id="BtnClose" value="关闭" />
                    <input class="button" id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
                    <input class="button" id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
                    <input class="button" id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
                    <input class="button" id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
                    <input class="button" id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
                    <input class="button" id="BtnSaveAndClose" type="submit" value="保存并关闭" onserverclick="BtnSaveAndClose_ServerClick" runat="server" />
                    <input class="button" id="BtnSave" type="submit" value="保存并修改" onserverclick="BtnSave_ServerClick" runat="server" />
                    <input class="button" id="BtnPrint" type="button" value="打印" style="display: none;" runat="server" />
                </div>
            </div>
            <div id="tab1" data-issel="false" title="合同附件信息" style="overflow: hidden;">
                <table class="bootstrap_table baseinfo" id="toolbartable" border="0" cellspacing="0" cellpadding="0" style="display: none;">
                    <tr>
                        <td style="width: 70px;"><span>选择附件:</span></td>
                        <td style="width: 120px;">
                            <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="width:'250px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                        </td>
                        <td style="width: 70px;"><span>附件名称:</span></td>
                        <td style="width: 120px;">
                            <input id="FileName" name="FileName" class="easyui-textbox" />
                        </td>
                        <td style="width: 70px;">
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="SaveFile();">保存</a>
                        </td>
                        <td style="width: auto;">
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="DelFile();">删除</a>
                        </td>
                    </tr>
                </table>
                <div style="width: 100%; background-color: #cccccc;" id="TableContainerFile"></div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        //初始化页面控件高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $('#tab').css("height", h + 'px');
            $("#tab0,#tab1").css({ "height": h - $('.tabs-header').height() + "px" });
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            $('#tabSubItem').tabs({
                onSelect: tabSubItemSelect
            });
            $('#TableContainerPoint').css("width", w - 41 + "px");
        }
        //主页面切换
        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //合同附件信息
                    setTimeout(function () {
                        LoadFileGrid();
                    }, 300);
                }
            }
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
                } else if (index == 3) {
                    //其他费用
                    setTimeout(function () {
                        LoadOtherFeesGrid();
                    }, 300);
                }
            }
        }
        //变更类型切换
        function ContractChangeTypeSelect(record) {
            if (record == "终止") {
                $('#ContractTerminationType').combobox({
                    required: true,
                    disabled: false
                });
            } else {
                $('#ContractTerminationType').combobox({
                    required: false,
                    disabled: true
                });
            }
        }
        //选择付款方
        function SelBuyer() {
            var param = { "CommID": $('#CommID').val() };
            LayerDialog.OpenWin('1000', '600', '../DiversifiedManage/Dialog/SelContractCustomer.aspx?' + $.param(param), "选择付款方", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    var OldCustID = $('#BuyerCustID').val();
                    $("#BuyerCustID").val(data.CustID);
                    $("#BuyerCustName").textbox("setValue", data.CustName);
                    $("#BuyerPaperName").textbox("setValue", data.PaperName);
                    $("#BuyerPaperCode").textbox("setValue", data.PaperCode);
                    $("#BuyerLiveAddr").textbox("setValue", data.Address);
                    $("#BuyerPostCode").textbox("setValue", data.PostCode);
                    $("#BuyerLegalPeople").textbox("setValue", data.LegalRepr);
                    $("#BuyerConnectpeople").textbox("setValue", data.CustName);
                    $("#BuyerConnectTel").textbox("setValue", data.LinkmanTel);
                    //判断如果修改了付款方的话 需要将标准的费用承担对象修改为当前承租方
                    if (OldCustID != data.CustID) {
                        //计算费用
                        $.tool.DataPostJson('DiversifiedManage', 'ContractChangeUpdateCustID', "ContractID=" + $('#ContractID').val() + "&NewCustID=" + data.CustID + "&OldCustID=" + OldCustID,
                            function Init() {
                            },
                            function callback(data) {
                                if (data.result) {
                                    $('#SettingResult').val(data.data);
                                    //获取当前选择的是不是计费标准页面
                                    var tabSubItem = $('#tabSubItem').tabs('getSelected');
                                    if ($(tabSubItem).attr("id") == "tabSubItem1") {
                                        LoadContractSetting();
                                    } else {
                                        var ItemTabSet = $('#tabSubItem').tabs('getTab', 1);
                                        ItemTabSet.data("issel", false);
                                    }
                                } else {
                                    $.messager.alert('温馨提示', data.msg);
                                }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }

                }
            });
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
        //选择 机构部门/负责人
        function SelDutyDepNameAndUserName() {
            LayerDialog.OpenWin('640', '400', '../DiversifiedManage/Dialog/SelContractDutyUserAndDep.aspx', "机构部门/负责人选择", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#DutyUserCode').val(data.UserCode);
                    $('#DutyDepCode').val(data.DepCode);
                    $('#DutyDepNameAndUserName').textbox("setValue", data.DepName + "-" + data.UserName);
                }
            });
        }

        //选择所属机构
        function SelAuditDepartment() {
            LayerDialog.OpenWin('640', '400', '../DiversifiedManage/Dialog/SelDepartment.aspx', "所属机构选择", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#AuditDepartment').val(data.attributes.DepCode);
                    $('#AuditDepartmentName').textbox("setValue", data.text);
                }
            });
        }

        /* 合同附件 */
        var FileColumn = [[
            {
                field: 'FullPath', title: '附件编号', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (value != "") {

                        var Slash = value.lastIndexOf("/") + 1;
                        var FileName = value.substr(Slash);
                        var point = FileName.lastIndexOf(".");
                        return FileName.substring(0, point);
                    }
                    return "";
                }
            },
            {
                field: 'FileName', title: '附件名称', width: 160, align: 'left', formatter: function (value, row, index) {
                    value = GetAHtml(row.FullPath, value);
                    return value;
                }
            },
            {
                field: 'FileSize', title: '附件类型', width: 40, align: 'center', formatter: function (value, row, index) {
                    if (row.FullPath != "") {
                        var point = row.FullPath.lastIndexOf(".");
                        return row.FullPath.substr(point);
                    }
                    return "";
                }
            },
            {
                field: 'AddTime', title: '添加日期', width: 60, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:MM:ss')
                }
            }
        ]];
        //加载附件
        function LoadFileGrid() {
            var FileToolbar = '#toolbartable'
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                FileToolbar = '';
            }
            $("#TableContainerFile").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                columns: FileColumn,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: true,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: FileToolbar,
                rownumbers: true,
                border: false,
                height: '100%',
                onBeforeLoad: function (param) {
                    param.Class = "DivfManage_FileAnnex";
                    param.Method = "GetList";
                    param["AttachedID"] = $('#ContractID').val();
                },
                onLoadSuccess: function (data) {

                }
            });
        }
        //格式化附件样式
        function GetAHtml(url, fileName) {
            var html = "";
            if (url && url != "") {
                html = "<a target=\"_blank\" id=\"11831617369\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + fileName + "</a>";
            }
            return html;
        }
        //上传附件
        function SaveFile() {
            var file = $("input[name='uploadFile']")[0].files[0];
            if (file) {
                var maxsize = 200 * 1024 * 1024;
                var tipFileSize = 200;
                var fileType = file.type;
                var fileSize = file.size;
                var fileName = file.name;

                if (fileSize > parseInt(maxsize)) {
                    $.messager.alert('温馨提示', "不能上传超过" + tipFileSize + "M的附件！", 'error');
                    return false;
                }
                var lastIndex = fileName.lastIndexOf(".");
                var suffix = fileName.substr(lastIndex + 1);//后缀

                var formData = new FormData();
                formData.append('file', file);
                formData.append('CorpId', "6008");
                formData.append('ExtName', suffix);
                formData.append('DicName', "DivfManage");
                $.ajax({
                    //url: "http://localhost:1241/HM/FileUpload/FileUpload.aspx",
                    url: "/HM/M_Main/FileTransferred/FileTransferred.ashx",
                    type: 'post',
                    cache: false,
                    processData: false,
                    contentType: false,
                    dataType: "json",
                    async: false,
                    data: formData,
                    beforeSend: function (xhr) { $.messager.progress({ title: "温馨提示", msg: "正在上传...", interval: 3000 }); },
                    success: function (data, status) {
                        if (data.result) {
                            //var lastIndex = data.data.lastIndexOf("/");
                            //var fileName = data.data.substr(lastIndex + 1);//后缀
                            //var jsonData = [{ "FullPath": , "FileName": fileName, "FileSize": fileSize, "FileRemark": FileRemark }];
                            //AppendImg(jsonData);
                            UploadCallBack(data.data, fileName, fileSize);
                        } else {
                            $.messager.alert('错误', "服务器发生错误!", 'error');
                        }
                        $.messager.progress('close');
                    },
                    error: function (data) {
                        $.messager.alert('错误', "服务器发生错误!", 'error');
                        $.messager.progress('close');
                    }
                });
                return false; //.NET按钮控件取消提交
            } else {
                $.messager.alert('温馨提示', '请选择文件!');
            }
        }
        //上传保存数据库
        function UploadCallBack(FileURL, FileName, fileSize) {
            var s = FileName.lastIndexOf("\\");
            var e = FileName.lastIndexOf(".");
            var fileNameTemp = $('#FileName').textbox("getValue");//文件名不带后缀

            var fileType = FileName.substring(e, FileName.length);//文件后缀
            var parameterStr = {
                FileName: fileNameTemp + fileType,
                FullPath: FileURL,
                AttachedID: $('#ID').val(),
                FileRemark: "",
                FileSize: fileSize
            };
            $.dataPostJson('DivfManage_FileAnnex', 'Save', parameterStr, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $("#uploadFile").filebox('clear');
                        $('#FileName').textbox('clear');
                        LoadFileGrid();
                    } else {
                        $.messager.alert('温馨提示', data.msg);
                    }
                },
                function completeCallback() {

                }, function errorCallback() {

                });
        }
        //删除附件
        function DelFile() {
            var SelectRow = $('#TableContainerFile').datagrid("getSelected");
            if (SelectRow == null) {
                $.messager.alert('温馨提示', "请选择需要删除的附件");
                return;
            }
            var idList = SelectRow.ID;
            $.dataPostJson('DivfManage_FileAnnex', 'Del', { "idList": idList }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        $.messager.alert('温馨提示', "附件删除成功");
                        LoadFileGrid();
                    } else {
                        $.messager.alert('温馨提示', data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }



        /* 点位信息 */
        var PointColumn = [[
            { field: 'CommName', title: '项目名称', width: '110', align: 'left' },
            { field: 'ContractPointType', title: '点位类型', width: '80', align: 'left' },
            { field: 'ContractPointCategory', title: '点位类别', width: '90', align: 'left' },
            { field: 'ContractPointRegion', title: '点位区域', width: '100', align: 'left' },
            { field: 'ContractPointNumber', title: '点位编号', width: '200', align: 'left' },
            { field: 'ContractPointArea', title: '点位面积', width: '70', align: 'center' },
            {
                field: 'ChargeNumber', title: '计费数量', width: '70', align: 'center', editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        precision: 2,
                        required: true
                    }
                }
            },
            {
                field: 'PointBeginTime', title: '开始时间', width: '100', align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false,
                        required: true,
                        onChange: function (date) {
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
                field: 'PointEndTime', title: '结束时间', width: '100', align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false,
                        required: true,
                        onChange: function (date) {
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
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: '110', align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false
                    }
                }
            },

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
        var PointToolbar = [
            {
                text: '保存',
                iconCls: 'icon-save',
                handler: function () {
                    //先结束一次编辑
                    if (endEditionForPoint()) {
                        //将列表数据存放到 PointResult 中
                        var RowsCount = $("#TableContainerPoint").datagrid("getRows");
                        if (RowsCount == 0) {
                            $('#PointResult').val("");
                        } else {
                            $('#PointResult').val(JSON.stringify(RowsCount));
                        }
                        $.messager.alert('温馨提示', "点位信息数据保存成功");
                    }
                }
            }
        ];
        //编辑的行号
        var editIndexForPoint = undefined;
        //*****编辑
        function endEditionForPoint() {
            if (editIndexForPoint == undefined) {
                return true
            }
            if ($('#TableContainerPoint').datagrid('validateRow', editIndexForPoint)) {
                $('#TableContainerPoint').datagrid('endEdit', editIndexForPoint);
                editIndexForPoint = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellForPoint(Rowindex, field, value) {
            if ($("#AuditStatus").val() != "未启动" && $("#AuditStatus").val() != "已驳回") {
                endEditionForPoint();
                return false;
            }
            $('#TableContainerPoint').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainerPoint').datagrid("getSelected");
            if (endEditionForPoint()) {
                if (field == "ChargeNumber" || field == "PointBeginTime" || field == "PointEndTime" || field == "RentFreeEndTime") {
                    if (!isValueNull(SelecteRow.OutTime)) {
                        $('#TableContainerPoint').datagrid('beginEdit', Rowindex);
                    }
                }
                editIndexForPoint = Rowindex;
            }
        }
        function onAfterEditForPoint(rowIndex, row, changes) {
            var updated = $('#TableContainerPoint').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#TableContainerPoint').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForPoint != undefined) {
                    $("#TableContainerPoint").datagrid('acceptChanges', editIndexForPoint);
                    $('#TableContainerPoint').datagrid('endEdit', editIndexForPoint);
                    var PointData = $('#TableContainerPoint').datagrid("getRows");
                    //编辑成功后计算 
                    var PointChargeNumber = 0; //计费数量
                    var PointChargeArea = 0.00; // 点位计费面积
                    for (var k = 0; k < PointData.length; k++) {
                        PointNumber = PointNumber + 1;
                        PointArea = PointArea + parseFloat(PointData[k].ContractPointArea);
                        //【计费数量】判断 点位计费单位为“个”时默认1，点位计费单位为“平米”时默认面积
                        if (PointData[k].CalculateCostUnit == "平米") {
                            PointChargeArea = PointChargeArea + parseFloat(PointData[k].ContractPointArea);
                        } else if (PointData[k].CalculateCostUnit == "个") {
                            PointChargeNumber = PointChargeNumber + parseFloat(PointData[k].ChargeNumber);
                        }
                    }
                    $('#PointChargeNumber').textbox("setValue", PointChargeNumber); //计费数量
                    $('#PointChargeArea').textbox("setValue", PointChargeArea); // 点位计费面积
                }
            }
        }
        //加载点位信息
        function LoadPointGrid() {
            var Data = [];
            if ($('#PointResult').val() != "") {
                Data = JSON.parse($('#PointResult').val());
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                PointToolbar = [];
            }
            $("#TableContainerPoint").datagrid({
                data: Data,
                nowrap: false,
                columns: PointColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: false,
                toolbar: PointToolbar,
                rownumbers: true,
                border: false,
                height: "100%",
                rowStyler: function (index, row) {
                    if (isValueNull(row.OutTime)) {
                        //有退租时间代表是已退租 不允许编辑
                        return "background-color:#F5F5F5";
                    }
                },
                onClickCell: onClickCellForPoint,
                onAfterEdit: onAfterEditForPoint,
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
        var SettingToolbar = [
            {
                text: '新增标准',
                iconCls: 'icon-add',
                handler: function () {
                    ContractSettingDetail("insert", '');
                }
            }, '-',
            {
                text: '批量新增标准',
                iconCls: 'icon-add',
                handler: function () {
                    ContractSettingBatchInsert();
                }
            }, '-',
            {
                text: '修改标准',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainerSetting").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert('温馨提示', '请选择需要变更的计费标准!');
                        return;
                    }
                    ContractSettingDetail("edit", row);
                }
            }, '-',
            {
                text: '复制标准',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainerSetting").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert('温馨提示', '请选择需要复制的计费标准!');
                        return;
                    }
                    CopySettingDetail(row);
                }
            }, '-',
            {
                text: '删除标准',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerSetting").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert('温馨提示', '请选择需要删除的计费标准!');
                        return;
                    }
                    var DelRowIndex = $("#TableContainerSetting").datagrid("getRowIndex", row);
                    $("#TableContainerSetting").datagrid("deleteRow", DelRowIndex);//删除行
                    var LeaseSettingRows = $('#TableContainerSetting').datagrid("getRows");
                    $('#SettingResult').val(JSON.stringify(LeaseSettingRows));
                }
            }, '-',
            {
                text: '<div style="color:blue;">(说明：新增、修改合同标准后，必须先保存合同信息才能计算合同费用、更新标准为连续时间。)</div>'
            }
        ];
        //批量新增标准
        function ContractSettingBatchInsert() {
            var PointData = $('#TableContainerPoint').datagrid("getRows");//点位信息数据
            var ChargeCalculationData = []; //计费方式数据
            $('#ChargeCalculation1,#ChargeCalculation2,#ChargeCalculation3').each(function (e) {
                if ($(this).checkbox('options').checked == true) {
                    var ChargeItem = {
                        Name: $(this).checkbox('options').label,
                        id: $(this).val(),
                        SubName: '',
                        SubID: ''
                    }
                    $("input[radiobuttonname='" + $(this).attr("id") + "']").each(function () {
                        if ($(this).radiobutton("options").checked) {
                            ChargeItem.SubName = $(this).radiobutton('options').label;
                            ChargeItem.SubID = $(this).radiobutton('options').value;
                        }
                    });
                    ChargeCalculationData.push(ChargeItem)
                }
            });
            if (ChargeCalculationData.length == 0) {
                $.messager.alert('温馨提示', "请先选择计费方式！");
                return;
            }
            const CustID = $("#BuyerCustID").val();
            const CustName = $("#BuyerCustName").textbox("getValue");
            if (CustID == "" || CustName == "") {
                $.messager.alert('温馨提示', "请选择付款方，批量新增标准默认客户为合同付款方！");
                return;
            }
            var ContractSetting = {
                PointData: PointData, //点位信息 全量信息
                ChargeCalculationData: ChargeCalculationData //计费方式 信息
            };
            localStorage.setItem("ContractBatchSetting", JSON.stringify(ContractSetting));
            var param = {
                "ContractCommID": $('#CommID').val(),
                "CustID": CustID,
                "CustName": CustName,
                "ContractBeginTime": $('#ContractBeginTime').combobox("getValue"),
                "ContractEndTime": $('#ContractEndTime').combobox("getValue")
            };
            LayerDialog.OpenWin('740', '530', '../DiversifiedManage/ContractManage/ContractSettingBatchManage.aspx?' + $.param(param), "合同计费标准批量设置", false, function callback(data) {
                if (isValueNull(data)) {
                    let varObj = $.parseJSON(data);
                    varObj.forEach((ItemRow) => {
                        $('#TableContainerSetting').datagrid('insertRow', {
                            index: 0,
                            row: {
                                ID: ItemRow.ID,
                                ContractID: ItemRow.ContractID,
                                ContID: ItemRow.ContID,
                                CommID: ItemRow.CommID,
                                CommName: ItemRow.CommName,
                                CustID: ItemRow.CustID,
                                CustName: ItemRow.CustName,
                                RoomID: ItemRow.RoomID,
                                RoomSign: ItemRow.RoomSign,
                                PointID: ItemRow.PointID,
                                PointNumber: ItemRow.PointNumber,
                                BeginDate: ItemRow.BeginDate,
                                EndDate: ItemRow.EndDate,
                                DueDate: ItemRow.DueDate,
                                CostID: ItemRow.CostID,
                                CostName: ItemRow.CostName,
                                ChargeCalculation: ItemRow.ChargeCalculation,
                                CalculationMethod: ItemRow.CalculationMethod,
                                ContPeriod: ItemRow.ContPeriod,
                                ContPrice: ItemRow.ContPrice,
                                ChargeNumber: ItemRow.ChargeNumber,
                                GuaranteeAmount: ItemRow.GuaranteeAmount,
                                BusinessRoyaltyRatio: ItemRow.BusinessRoyaltyRatio,
                                ContractDelinAmountStandard: ItemRow.ContractDelinAmountStandard,
                                ContractDelinBeginDay: ItemRow.ContractDelinBeginDay,
                                ContractDelinBeginMonth: ItemRow.ContractDelinBeginMonth
                            }
                        });
                    });
                    var ContractSettingRows = $('#TableContainerSetting').datagrid("getRows");
                    $('#SettingResult').val(JSON.stringify(ContractSettingRows));
                }
            });
        }
        //计费标准详情
        function ContractSettingDetail(OpType, ItemRow) {
            var PointData = $('#TableContainerPoint').datagrid("getRows");//点位信息数据
            var ChargeCalculationData = []; //计费方式数据
            $('#ChargeCalculation1,#ChargeCalculation2,#ChargeCalculation3').each(function (e) {
                if ($(this).checkbox('options').checked == true) {
                    var ChargeItem = {
                        Name: $(this).checkbox('options').label,
                        id: $(this).val(),
                        SubName: '',
                        SubID: ''
                    }
                    $("input[radiobuttonname='" + $(this).attr("id") + "']").each(function () {
                        if ($(this).radiobutton("options").checked) {
                            ChargeItem.SubName = $(this).radiobutton('options').label;
                            ChargeItem.SubID = $(this).radiobutton('options').value;
                        }
                    });
                    ChargeCalculationData.push(ChargeItem)
                }
            });
            if (ChargeCalculationData.length == 0) {
                $.messager.alert('温馨提示', "请先选择计费方式！");
                return;
            }

            //判断如果是新增的话需要默认有些数据   修改就将ItemRow数据放到localStorage中
            var SettingData = {
                ID: Math.uuid(),
                ContractID: $('#ID').val(),
                ContID: $('#ContID').val(),
                CommID: $('#CommID').val(),
                CommName: $('#CommName').textbox("getValue"),
                CustID: $("#BuyerCustID").val(),
                CustName: $("#BuyerCustName").textbox("getValue"),
                RoomID: "",
                RoomSign: "",
                PointID: "",
                PointNumber: "",
                BeginDate: "",
                EndDate: "",
                DueDate: "",
                CostID: "",
                CostName: "",
                ChargeCalculation: '',
                CalculationMethod: '',
                ContPeriod: "",
                ContPrice: $('#ChargeStandard').numberbox("getValue"),
                ChargeNumber: '',
                GuaranteeAmount: '',
                BusinessRoyaltyRatio: $('#BusinessRoyaltyRatio').numberbox("getValue"),
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
                SettingData.CommName = ItemRow.CommName;
                SettingData.CustID = ItemRow.CustID;
                SettingData.CustName = ItemRow.CustName;
                SettingData.RoomID = ItemRow.RoomID;
                SettingData.RoomSign = ItemRow.RoomSign;
                SettingData.PointID = ItemRow.PointID;
                SettingData.PointNumber = ItemRow.PointNumber;
                SettingData.BeginDate = ItemRow.BeginDate;
                SettingData.EndDate = ItemRow.EndDate;
                SettingData.DueDate = ItemRow.DueDate;
                SettingData.CostID = ItemRow.CostID;
                SettingData.CostName = ItemRow.CostName;
                SettingData.ChargeCalculation = ItemRow.ChargeCalculation;
                SettingData.CalculationMethod = ItemRow.CalculationMethod;
                SettingData.ContPeriod = ItemRow.ContPeriod;
                SettingData.ContPrice = ItemRow.ContPrice;
                SettingData.ChargeNumber = ItemRow.ChargeNumber;
                SettingData.GuaranteeAmount = ItemRow.GuaranteeAmount;
                SettingData.BusinessRoyaltyRatio = ItemRow.BusinessRoyaltyRatio;
                SettingData.ContractDelinAmountStandard = ItemRow.ContractDelinAmountStandard;
                SettingData.ContractDelinBeginDay = ItemRow.ContractDelinBeginDay;
                SettingData.ContractDelinBeginMonth = ItemRow.ContractDelinBeginMonth;
                //判断当前点位是否为已退租  如果是已退租点位 修改时就不允许选择其他点位
                var Node = PointData.filter(function (e) {
                    return e.ContractPointID == ItemRow.PointID && e.OutTime != "";
                });
                if (Node.length > 0) {
                    PointData = Node;
                } else {
                    Node = PointData.filter(function (e) {
                        return e.OutTime == "" || e.OutTime == null;
                    });
                    if (Node.length > 0) {
                        PointData = Node;
                    } else {
                        PointData = [];
                    }
                }
            } else {
                //新增时只能选择没有退租的点位
                var Node = PointData.filter(function (e) {
                    return e.OutTime == "" || e.OutTime == null;
                });
                if (Node.length > 0) {
                    PointData = Node;
                } else {
                    PointData = [];
                }
            }
            var LeaseContractSetting = {
                PointData: PointData, //点位信息 全量信息
                SettingData: SettingData, //标准信息
                ChargeCalculationData: ChargeCalculationData //计费方式 信息
            };
            localStorage.setItem("ContractSetting", JSON.stringify(LeaseContractSetting));
            var param = { "OpType": OpType };
            LayerDialog.OpenWin('740', '530', '../DiversifiedManage/ContractManage/ContractSettingManage.aspx?' + $.param(param), "合同计费标准设置", false, function callback(data) {
                if (isValueNull(data)) {
                    var varObj = $.parseJSON(data);
                    if (OpType == "insert") {
                        //新增
                        $('#TableContainerSetting').datagrid('insertRow', {
                            index: 0,
                            row: {
                                ID: varObj.ID,
                                ContractID: varObj.ContractID,
                                ContID: varObj.ContID,
                                CommID: varObj.CommID,
                                CommName: varObj.CommName,
                                CustID: varObj.CustID,
                                CustName: varObj.CustName,
                                RoomID: varObj.RoomID,
                                RoomSign: varObj.RoomSign,
                                PointID: varObj.PointID,
                                PointNumber: varObj.PointNumber,
                                BeginDate: varObj.BeginDate,
                                EndDate: varObj.EndDate,
                                DueDate: varObj.DueDate,
                                CostID: varObj.CostID,
                                CostName: varObj.CostName,
                                ChargeCalculation: varObj.ChargeCalculation,
                                CalculationMethod: varObj.CalculationMethod,
                                ContPeriod: varObj.ContPeriod,
                                ContPrice: varObj.ContPrice,
                                ChargeNumber: varObj.ChargeNumber,
                                GuaranteeAmount: varObj.GuaranteeAmount,
                                BusinessRoyaltyRatio: varObj.BusinessRoyaltyRatio,
                                ContractDelinAmountStandard: varObj.ContractDelinAmountStandard,
                                ContractDelinBeginDay: varObj.ContractDelinBeginDay,
                                ContractDelinBeginMonth: varObj.ContractDelinBeginMonth
                            }
                        });
                    } else {
                        var UpdateRowIndex = $('#TableContainerSetting').datagrid('getRowIndex', ItemRow);
                        //修改
                        $('#TableContainerSetting').datagrid('updateRow', {
                            index: UpdateRowIndex,
                            row: {
                                CommID: varObj.CommID,
                                CommName: varObj.CommName,
                                CustID: varObj.CustID,
                                CustName: varObj.CustName,
                                RoomID: varObj.RoomID,
                                RoomSign: varObj.RoomSign,
                                PointID: varObj.PointID,
                                PointNumber: varObj.PointNumber,
                                BeginDate: varObj.BeginDate,
                                EndDate: varObj.EndDate,
                                DueDate: varObj.DueDate,
                                CostID: varObj.CostID,
                                CostName: varObj.CostName,
                                ChargeCalculation: varObj.ChargeCalculation,
                                CalculationMethod: varObj.CalculationMethod,
                                ContPeriod: varObj.ContPeriod,
                                ContPrice: varObj.ContPrice,
                                ChargeNumber: varObj.ChargeNumber,
                                GuaranteeAmount: varObj.GuaranteeAmount,
                                BusinessRoyaltyRatio: varObj.BusinessRoyaltyRatio,
                                ContractDelinAmountStandard: varObj.ContractDelinAmountStandard,
                                ContractDelinBeginDay: varObj.ContractDelinBeginDay,
                                ContractDelinBeginMonth: varObj.ContractDelinBeginMonth
                            }
                        });
                    }
                    var ContractSettingRows = $('#TableContainerSetting').datagrid("getRows");
                    $('#SettingResult').val(JSON.stringify(ContractSettingRows));
                }
            });
        }
        //复制计费标准
        function CopySettingDetail(ItemRow) {
            localStorage.setItem("ContractSettingCopy", JSON.stringify(ItemRow));
            LayerDialog.OpenWin('740', '530', '../DiversifiedManage/ContractManage/ContractSettingCopy.aspx', "合同计费标准复制", false, function callback(data) {
                if (isValueNull(data)) {
                    var DataArry = data.split('&');
                    for (var i = 0; i < DataArry.length; i++) {
                        var ItemArry = DataArry[i].split(",");
                        $('#TableContainerSetting').datagrid('insertRow', {
                            index: 0,
                            row: {
                                ID: Math.uuid(),
                                ContractID: ItemRow.ContractID,
                                ContID: ItemRow.ContID,
                                CommID: ItemArry[2],
                                CommName: ItemArry[3],
                                CustID: ItemArry[0],
                                CustName: ItemArry[1],
                                RoomID: ItemRow.RoomID,
                                RoomSign: ItemRow.RoomSign,
                                PointID: ItemRow.PointID,
                                PointNumber: ItemRow.PointNumber,
                                BeginDate: ItemRow.BeginDate,
                                EndDate: ItemRow.EndDate,
                                DueDate: ItemRow.DueDate,
                                CostID: ItemRow.CostID,
                                CostName: ItemRow.CostName,
                                ChargeCalculation: ItemRow.ChargeCalculation,
                                CalculationMethod: ItemRow.CalculationMethod,
                                ContPeriod: ItemRow.ContPeriod,
                                ContPrice: ItemRow.ContPrice,
                                ChargeNumber: ItemRow.ChargeNumber,
                                GuaranteeAmount: ItemRow.GuaranteeAmount,
                                BusinessRoyaltyRatio: ItemRow.BusinessRoyaltyRatio,
                                ContractDelinAmountStandard: ItemRow.ContractDelinAmountStandard,
                                ContractDelinBeginDay: ItemRow.ContractDelinBeginDay,
                                ContractDelinBeginMonth: ItemRow.ContractDelinBeginMonth
                            }
                        });
                    }
                    $.messager.alert('温馨提示', "复制标准成功！");
                    var ContractSettingRows = $('#TableContainerSetting').datagrid("getRows");
                    $('#SettingResult').val(JSON.stringify(ContractSettingRows));
                }
            });
        }

        //加载计费标准
        function LoadContractSetting() {
            var Data = [];
            if ($('#SettingResult').val() != "") {
                Data = JSON.parse($('#SettingResult').val());
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                SettingToolbar = [];
            }
            $("#TableContainerSetting").datagrid({
                data: Data,
                nowrap: false,
                columns: SettingColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: false,
                toolbar: SettingToolbar,
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
            { field: 'ck', checkbox: true },
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
            text: '费用计算',
            iconCls: 'icon-save',
            handler: function () {
                //判断合同是否保存
                if ($('#OpType').val() == "insert") {
                    $.messager.alert('温馨提示', '请先保存合同变更!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '合同变更处于审核中或者合同已审核!');
                    return;
                }
                //计算费用
                $.tool.DataPostJson('DiversifiedManage', 'ContractChangeFeesCalc', "ContID=" + $('#ContID').val() + "&ContractID=" + $('#ContractID').val() + "&ID=" + $('#ID').val(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert('温馨提示', data.msg);
                            LoadFeesGrid();
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }, '-',
        {
            text: '费用登记',
            iconCls: 'icon-add',
            handler: function () {
                //判断合同是否保存
                if ($('#ContID').val() == "") {
                    $.messager.alert('温馨提示', '请先保存合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '合同变更处于审核中或者合同已审核!');
                    return;
                }
                HDialog.Open(900, 500, '../ChargesNew/FeesSporadicManage.aspx?OPType=Insert&SrcType=2&ContID=' + $('#ContID').val() + '&CustID=' + $('#BuyerCustID').val() + '&CustName=' + $('#BuyerCustName').textbox("getValue"), '新增合同费用', false, function (_Data) {
                    if (_Data != '') {
                        $.messager.alert('温馨提示', _Data);
                        LoadFeesGrid();
                    }
                });
            }
        }, '-', {
            text: '单笔删除',
            iconCls: 'icon-cancel',
            handler: function () {
                //判断合同是否保存
                if ($('#ContID').val() == "") {
                    $.messager.alert('温馨提示', '请先保存合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '合同变更处于审核中或者合同已审核!');
                    return;
                }
                if (IsMerge == "1") {
                    $.messager.alert('温馨提示', '不允许操作合并后的费用信息!');
                    return;
                }
                var SelectedRow = $('#TableContainerContractFees').datagrid("getSelected");
                if (SelectedRow == null) {
                    $.messager.alert('温馨提示', "请选择需要删除的合同费用");
                    return;
                }
                $.tool.DataPostJson('DiversifiedManage', 'ContractChangeDeleteOneFees', "CommID=" + SelectedRow.CommID + "&ContID=" + $('#ContID').val() + "&ID=" + SelectedRow.ID,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert('温馨提示', "删除成功");
                            LoadFeesGrid();
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }, '-', {
            text: '批量删除',
            iconCls: 'icon-cancel',
            handler: function () {
                //判断合同是否保存
                if ($('#ContID').val() == "") {
                    $.messager.alert('温馨提示', '请先保存合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '合同变更处于审核中或者合同已审核!');
                    return;
                }
                if (IsMerge == "1") {
                    $.messager.alert('温馨提示', '不允许操作合并后的费用信息!');
                    return;
                }
                var CheckedRows = $('#TableContainerContractFees').datagrid("getChecked");
                if (CheckedRows.length == 0) {
                    $.messager.alert('温馨提示', "请勾选需要删除的费用");
                    return;
                }
                var IdList = "";
                for (var i = 0; i < CheckedRows.length; i++) {
                    IdList += CheckedRows[i].ID + ",";
                }
                if (IdList.length > 0) {
                    IdList = IdList.substring(0, IdList.length - 1);
                }

                $.tool.DataPostJson('DiversifiedManage', 'ContractChangeDeleteFees', "CommID=" + $('#CommID').val() + "&ContID=" + $('#ContID').val() + "&IdList=" + IdList,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert('温馨提示', "删除成功");
                            LoadFeesGrid();
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }, '-', {
            text: '拆分提前终止后的费用',
            iconCls: 'icon-cut',
            handler: function () {
                if ($('#ContID').val() == "") {
                    $.messager.alert('温馨提示', '请先保存合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '合同变更处于审核中或者已审核!');
                    return;
                }
                $.tool.DataPostJson('DiversifiedManage', 'ContractSplitAfterFees', "ContractID=" + $('#ContractID').val() + "&ContID=" + $('#ContID').val() + "&CommID=" + $('#CommID').val(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert('温馨提示', "拆分提前终止后的费用成功");
                            LoadFeesGrid();
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }, '-', {
            text: '删除提前终止后的费用',
            iconCls: 'icon-cancel',
            handler: function () {
                if ($('#ContID').val() == "") {
                    $.messager.alert('温馨提示', '请先保存合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '合同变更处于审核中或者已审核!');
                    return;
                }
                $.tool.DataPostJson('DiversifiedManage', 'ContractDeleteAfterFees', "ContractID=" + $('#ContractID').val() + "&ContID=" + $('#ContID').val(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert('温馨提示', "删除提前终止后的费用成功，合同变更审核通过后生效");
                            LoadFeesGrid();
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }, '-', {
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
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                FeesToolBar = [{
                    text: '<input class="easyui-checkbox" id="IsMerge" name="IsMerge" data-options="label:\'是否合并\',labelWidth:80,labelPosition:\'after\',labelAlign:\'left\'" />'
                }];
            }
            $("#TableContainerContractFees").datagrid({
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
                    param.Class = "DiversifiedManage";
                    param.Command = "ContractChangeFeesList";
                    param["ContID"] = $("#ContID").val();
                    param["CommID"] = $("#CommID").val();
                    param["AuditStatus"] = $("#AuditStatus").val();
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

        /* 其他费用 */
        var OtherFeesColumn = [[
            { field: 'CommName', title: '项目名称', width: '140', align: 'left' },
            { field: 'CustName', title: '客户名称', width: 100, align: 'left' },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left' },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'left' },
            { field: 'ParkName', title: '车位编号', width: 120, align: 'left' },
            { field: 'CostName', title: '费用名称', width: 140, align: 'left' },
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
            { field: 'IsBankName', title: '托收状态', width: 80, align: 'center' },
            { field: 'IsFreezeName', title: '冻结状态', width: 80, align: 'center' },
            { field: 'IsPropertyName', title: '垫付状态', width: 80, align: 'center' },
            { field: 'IsPrecName', title: '预交状态', width: 80, align: 'center' }
        ]];
        var OtherFeestoolbar = [
            {
                text: '拆分',
                iconCls: 'icon-cut',
                handler: function () {
                    var row = $("#TableContainerOtherFees").datagrid("getSelected");
                    if (row != null) {
                        if (row.FeesID != 0) {
                            var IsOperator;
                            IsOperator = FeesIsOperator(row);
                            var IsSplit = IsOperator.split('|')[2];
                            if (IsSplit.split(':')[0] == "true") {
                                FeesOperator(row, "split");
                            }
                            else {
                                $.messager.alert('温馨提示', IsSplit.split(':')[1]);
                            }
                        }
                        else {
                            $.messager.alert('温馨提示', '请选择要拆分的费用');
                        }
                    } else {
                        $.messager.alert('温馨提示', '请选择要拆分的费用');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerOtherFees").datagrid("getSelected");
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
                                $.messager.alert('温馨提示', IsDel.split(':')[1]);
                            }
                        }
                        else {
                            $.messager.alert('温馨提示', '请选择要删除的费用');
                        }
                    } else {
                        $.messager.alert('温馨提示', '请选择要删除的费用');
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
                                conent = "../ChargesNew/FeesSporadicManage.aspx?OPType=Edit&SrcType=2&FeesID=" + rowData.FeesID + "&CostGeneType=" + $('#CostGeneType').val();
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
                                $.messager.alert('温馨提示', _Data);
                                LoadOtherFeesGrid();
                            }
                        });
                    }
                    else {
                        $.messager.alert('温馨提示', _Data);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        }
        //加载其他费用列表
        function LoadOtherFeesGrid() {
            $("#TableContainerOtherFees").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                pageSize: 150,
                pageList: [150, 300, 500],
                columns: OtherFeesColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                toolbar: OtherFeestoolbar,
                pagination: true,
                rownumbers: true,
                border: false,
                height: "100%",
                showFooter: true,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "OtherFeesSearch";
                    param["CustID"] = $('#BuyerCustID').val();
                    param["ContID"] = $('#ContID').val();
                    param["CommID"] = $('#CommID').val();
                },
                onLoadSuccess: function (data) {
                    //加载页脚
                    $('#TableContainerOtherFees').datagrid('reloadFooter', [
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
            var rows = $('#TableContainerOtherFees').datagrid('getRows');
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

            //获取合同其他信息 OtherTableResult
            var UserInput = [];
            $(".UserInput").each(function () {
                var UserItem = {
                    ContractFieldSetID: $(this).attr("id"),
                    FieldValue: $(this).val()
                }
                UserInput.push(UserItem);
            });
            $('#OtherTableResult').val(JSON.stringify(UserInput));

            //先结束一次编辑
            endEditionForPoint();
            var RowsCount = $("#TableContainerPoint").datagrid("getRows");
            //可以存在不选择点位的情况 
            $('#PointResult').val(JSON.stringify(RowsCount));
            //先验证页面上的点位数据是否录入合法
            for (var i = 0; i < RowsCount.length; i++) {
                if (RowsCount[i]["ChargeNumber"] == "") {
                    $.messager.alert('温馨提示', "点位【" + RowsCount[i]["ContractPointNumber"] + "】的计费数量不能为空！");
                    return false;
                }
                if (RowsCount[i]["PointBeginTime"] == "") {
                    $.messager.alert('温馨提示', "点位【" + RowsCount[i]["ContractPointNumber"] + "】的开始时间不能为空！");
                    return false;
                }
                if (RowsCount[i]["PointEndTime"] == "") {
                    $.messager.alert('温馨提示', "点位【" + RowsCount[i]["ContractPointNumber"] + "】的结束时间不能为空！");
                    return false;
                }
                //判断租赁结束时间是否是小于租赁开始时间
                if ((new Date(RowsCount[i]["PointEndTime"])) < (new Date(RowsCount[i]["PointBeginTime"]))) {
                    $.messager.alert('温馨提示', "点位【" + RowsCount[i]["ContractPointNumber"] + "】的结束时间不能小于开始时间！");
                    return false;
                }
            }
            //需要验证点位数据是否正确
            $.tool.DataPostJsonAsync('DiversifiedManage', 'ValidateContractPoint', "ContractID=" + $('#ContractID').val() + "&PointData=" + $('#PointResult').val(),
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
                $.messager.alert('温馨提示', IsValidate);
                return false;
            }
            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //预算计划审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            //判断必须要有 变更类别
            var ContractChangeTypeVal = $('#ContractChangeType').combobox("getValue");
            if (!isValueNull(ContractChangeTypeVal)) {
                $.messager.alert('温馨提示', "请选择变更类别");
                return;
            }
            //判断是否是 终止 如果是终止就必须选择 终止类型
            if (ContractChangeTypeVal == "终止" && $('#ContractTerminationType').combobox("getValue") == "") {
                $.messager.alert('温馨提示', "变更类型为终止时，必须选择终止类型");
                return;
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            $.tool.DataPostJsonAsync('DiversifiedManage', 'GetContractWorkFlow',
                "ContractChangeType=" + ContractChangeTypeVal + "&RentOutType=" + $('#ContractTerminationType').combobox("getValue") + "&AuditType=2",
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
                $.messager.alert('温馨提示', ErrorMessage);
                return;
            }
            if (FlowId == "") {
                $.messager.alert('温馨提示', "请设置对应合同签订的审核流程");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=1202&biaoshi=1&random=" + Math.random();
            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                if (_Data != '') {
                    var obj = JSON.parse(_Data);
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                }
            });
        }
        //加载合同其他信息
        function LoadOtherContractData() {
            var OtherContractData = $('#OtherTableResult').val();
            if (isValueNull(OtherContractData)) {
                var IsDisabled = "";
                if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                    IsDisabled = "disabled='disabled'"
                }
                OtherContractData = $.parseJSON(OtherContractData);
                var IsRequired = false;
                for (var i = 0; i < OtherContractData.length; i++) {
                    if (OtherContractData[i].FieldIsRequired == "是") {
                        IsRequired = true;
                    }
                    var ItemTimeValue = OtherContractData[i].FieldValue;
                    if (OtherContractData[i].FieldType == "数值") {
                        if (ItemTimeValue == "null") {
                            ItemTimeValue = "";
                        }
                        $('.OtherTable').append("<tr><td class='title'><span>" + OtherContractData[i].FieldName +
                            "</span></td><td class='text'><input type='text' " + IsDisabled + " value='" + ItemTimeValue + "' id='" + OtherContractData[i].ContractFieldSetID +
                            "' name='" + OtherContractData[i].ContractFieldSetID +
                            "' class='easyui-numberbox UserInput' data-options='required:" + IsRequired + ",precision:2' />" +
                            "</td><td class='title'></td><td class='text'></td><td class='title'></td><td class='text'></td></tr>");
                    } else if (OtherContractData[i].FieldType == "文本") {
                        if (ItemTimeValue == "null") {
                            ItemTimeValue = "";
                        }
                        $('.OtherTable').append("<tr><td class='title'><span>" + OtherContractData[i].FieldName +
                            "</span></td><td class='text'><input type='text' " + IsDisabled + " value='" + ItemTimeValue + "' id='" + OtherContractData[i].ContractFieldSetID +
                            "' name='" + OtherContractData[i].ContractFieldSetID +
                            "' class='easyui-textbox UserInput' data-options='required:" + IsRequired + "'  />" +
                            "</td><td class='title'></td><td class='text'></td><td class='title'></td><td class='text'></td></tr>");
                    } else if (OtherContractData[i].FieldType == "时间") {
                        if (isValueNull(ItemTimeValue)) {
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

            $('#tipBuyerCust').tooltip({
                position: 'top',
                content: '<div><p>重新选付款方</p>'
                    + '<p>1、费用开始时间大于等于变更日期的计费标准，自动将计费标准上的客户名称修改为新的付款方名称</p>' +
                    '<p>2、合同变更审核通过后，费用开始时间大于等于变更日期的未收取、未冲抵、未减免费用，自动将费用上的客户名称修改为新的付款方名称</p></div>',
            });

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
            //计费方式切换
            $('#ChargeCalculation1,#ChargeCalculation2,#ChargeCalculation3').checkbox({
                onChange: function (checked) {
                    ChargeCalculationSelect(checked, $(this));
                }
            });
            //切换计算方式 选择范围
            function ChargeCalculationSelect(checked, obj) {
                var disabledValue = true;
                if (checked) {
                    //选择
                    disabledValue = false;
                } else {
                    //取消选择
                    disabledValue = true;
                }
                switch (obj.val()) {
                    case "1":
                        if (disabledValue) {
                            $('#CalculationMethod1,#CalculationMethod2,#CalculationMethod3,#CalculationMethod4').radiobutton({
                                checked: false,
                                disabled: disabledValue
                            });
                            CalculationMethodChange("");
                        } else {
                            $('#CalculationMethod1,#CalculationMethod2,#CalculationMethod3,#CalculationMethod4').radiobutton({
                                disabled: disabledValue
                            });
                            $('#CalculationMethod1').radiobutton("check");
                            CalculationMethodChange("3");
                        }
                        break;
                    case "2":
                        if (disabledValue) {
                            $('#CalculationMethod5,#CalculationMethod6').radiobutton({
                                checked: false,
                                disabled: disabledValue
                            });
                        } else {
                            $('#CalculationMethod5,#CalculationMethod6').radiobutton({
                                disabled: disabledValue
                            });
                            $('#CalculationMethod5').radiobutton("check");
                        }
                        break;
                    case "3":
                        if (disabledValue) {
                            $('#CalculationMethod7,#CalculationMethod8,#CalculationMethod9').radiobutton({
                                checked: false,
                                disabled: disabledValue
                            });
                            $('#GuaranteeAmountCollectionWay').combobox({ required: false });
                        } else {
                            $('#GuaranteeAmountCollectionWay').combobox({ required: true });
                            $('#CalculationMethod7,#CalculationMethod8,#CalculationMethod9').radiobutton({
                                disabled: disabledValue
                            });
                            $('#CalculationMethod7').radiobutton("check");
                        }
                        break;
                }
                var ChargeCalculationValue = '';
                $('#ChargeCalculation1,#ChargeCalculation2,#ChargeCalculation3').each(function (e) {
                    if ($(this).checkbox('options').checked == true) {
                        ChargeCalculationValue = ChargeCalculationValue + $(this).val() + ',';
                    }
                });
                if (ChargeCalculationValue.length > 0) {
                    ChargeCalculationValue = ChargeCalculationValue.substr(0, ChargeCalculationValue.length - 1);
                }
                $('#ChargeCalculation').val(ChargeCalculationValue);
                ReloadCalculationMethodVal();
            }
            //计算方式切换
            $('#CalculationMethod1,#CalculationMethod2,#CalculationMethod3,#CalculationMethod4,#CalculationMethod5,#CalculationMethod6,#CalculationMethod7,#CalculationMethod8,#CalculationMethod9').radiobutton({
                onChange: function (checked) {
                    if ($(this).attr("id") == "CalculationMethod1" || $(this).attr("id") == "CalculationMethod2" || $(this).attr("id") == "CalculationMethod3" || $(this).attr("id") == "CalculationMethod4") {
                        CalculationMethodChange($(this).val());
                    }
                    ReloadCalculationMethodVal();
                }
            });
            function ReloadCalculationMethodVal() {
                var CalculationMethodVal = '';
                $("input[radiobuttonname='ChargeCalculation1'],input[radiobuttonname='ChargeCalculation2'],input[radiobuttonname='ChargeCalculation3']").each(function () {
                    if ($(this).radiobutton("options").checked) {
                        CalculationMethodVal = CalculationMethodVal + $(this).radiobutton('options').value + ",";
                    }
                });
                if (CalculationMethodVal.length > 0) {
                    CalculationMethodVal = CalculationMethodVal.substr(0, CalculationMethodVal.length - 1);
                }
                $('#CalculationMethod').val(CalculationMethodVal);
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
                    $('#GuaranteeAmountCollectionWay').combobox({ required: true });
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
            $('#IsContinuityChargingName').checkbox({
                onChange: function (checked) {
                    if (checked) {
                        $('#IsContinuityCharging').val("1");
                    } else {
                        $('#IsContinuityCharging').val("0");
                    }
                }
            })
            if ($('#IsContinuityCharging').val() == "1") {
                $('#IsContinuityChargingName').checkbox("check");
            }
            LoadPointGrid() //加载点位信息
            LoadOtherContractData();//加载合同的其他信息

            //判断状态 是否是需要禁用控件
            if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                $(".easyui-radiobutton").radiobutton({ disabled: true });
                $(".easyui-checkbox").checkbox({ disabled: true });
            }
            //注册点击事件
            $("#BtnClose").click(function (e) {
                LayerDialog.Close('');
            });

            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                $.tool.pageLoading();

                //保存和送审的时候才验证
                if ($(this).attr("id") != "BtnSaveStartWorkFlow" && $(this).attr("id") != "BtnSaveAndClose" && $(this).attr("id") != "BtnSave") {
                    $.tool.pageUnLoading();
                    return true;
                }
                if (IsSubmitFlag == false) {
                    $.messager.alert('温馨提示', "5秒内不要重复点击");
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
                            $.messager.alert('温馨提示', "请选择审批流程");
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
                        $('#' + id).textbox({
                            required: true
                        });
                    } else {
                        $('#' + id).textbox({
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
