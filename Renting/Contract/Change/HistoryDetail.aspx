<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistoryDetail.aspx.cs" Inherits="M_Main.Renting.Contract.Change.HistoryDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同历史信息</title>
    <link href="/HM/M_Main/css/base.css" rel="stylesheet" />
    <link href="/HM/M_Main/css/button.css" rel="stylesheet" />
    <link href="/HM/M_Main/css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />

    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/format.js"></script>

    <style type="text/css">
        fieldset input {
            height: 28px;
            line-height: 28px;
        }

        .tabs-header {
            background-color: white;
        }

        fieldset input {
            width: 75%;
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
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <form id="frmForm" class="form-horizontal" role="form" runat="server" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合同基本信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">项目名称</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合同类型</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="ContractCategory" name="ContractCategory" class="easyui-combobox" data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',value:'收入合同',data: [{id: '收入合同',text: '收入合同'}],disabled:true"
                        runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合同类别</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                    <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                <div class="col-sm-7 col-xs-7">
                    <input type="text" id="ContractSign" name="ContractSign" class="easyui-textbox" runat="server" data-options="required:false,tipPosition:'bottom',width:'93%',disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合约类型</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="TreatyPlaningTypeName" name="TreatyPlaningTypeName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                    <input type="hidden" id="TreatyPlaningType" name="TreatyPlaningType" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                <div class="col-sm-7 col-xs-7">
                    <input type="text" id="ContractName" name="ContractName" class="easyui-textbox" runat="server" data-options="required:false,tipPosition:'bottom',width:'93%',disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">签约类型</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="SigningType" name="SigningType" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">出租方信息(称谓：
                        <input class="easyui-radiobutton" id="Leaser0" name="Leaser"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left',disabled:true" />
                <input class="easyui-radiobutton" id="Leaser1" name="Leaser"
                    data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left',disabled:true" />
                <input class="easyui-radiobutton" id="Leaser2" name="Leaser"
                    data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left',disabled:true" />
                )</legend>
            <input type="hidden" id="LeaserCall" name="LeaserCall" value="0" runat="server" />
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">出租方名称</label>
                <div class="col-sm-7 col-xs-7">
                    <input type="text" id="LeaserName" name="LeaserName" class="easyui-textbox" runat="server" data-options="disabled:true,width:'93%'" />
                    <input type="hidden" id="LeaserID" name="LeaserID" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">证件名称</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LeaserPaperName" name="LeaserPaperName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LeaserPaperCode" name="LeaserPaperCode" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">(注册)地址</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LeaserRegAddr" name="LeaserRegAddr" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">邮政编码</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LeaserPostCode" name="LeaserPostCode" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">
                    法定代表人</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LeaserLegalPeople" name="LeaserLegalPeople" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LeaserConnectpeople" name="LeaserConnectpeople" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LeaserConnectTel" name="LeaserConnectTel" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">承租方信息(称谓：
                        <input class="easyui-radiobutton" id="Tenantry0" name="Tenantry"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left',disabled:true" />
                <input class="easyui-radiobutton" id="Tenantry1" name="Tenantry"
                    data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left',disabled:true" />
                <input class="easyui-radiobutton" id="Tenantry2" name="Tenantry"
                    data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left',disabled:true" />
                )</legend>
            <input type="hidden" id="TenantryCall" name="TenantryCall" value="1" runat="server" />
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">承租方名称</label>
                <div class="col-sm-7 col-xs-7">
                    <input id="TenantryCustName" name="TenantryCustName" class="easyui-textbox"
                        data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'93%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelTenantryCust();},disabled:true"
                        runat="server" />
                    <input type="hidden" id="TenantryCustID" name="TenantryCustID" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">证件名称</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryPaperName" name="TenantryPaperName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryPaperCode" name="TenantryPaperCode" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系地址</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryLiveAddr" name="TenantryLiveAddr" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">邮政编码</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryPostCode" name="TenantryPostCode" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">
                    法定代表人</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryLegalPeople" name="TenantryLegalPeople" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryConnectpeople" name="TenantryConnectpeople" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryConnectTel" name="TenantryConnectTel" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">
                    享受优惠政策</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryPreferentialPolicy" name="TenantryPreferentialPolicy" class="easyui-textbox" runat="server"
                        data-options="required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">
                    优惠政策编号</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="TenantryPreferentialPolicyIdCode" name="TenantryPreferentialPolicyIdCode" class="easyui-textbox" runat="server"
                        data-options="required:false,disabled:true" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">管理方信息(称谓：
                        <input class="easyui-radiobutton" id="Manage0" name="Manage"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left',disabled:true" />
                <input class="easyui-radiobutton" id="Manage1" name="Manage"
                    data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left',disabled:true" />
                <input class="easyui-radiobutton" id="Manage2" name="Manage"
                    data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left',disabled:true" />
                )</legend>
            <input type="hidden" id="ManageCall" name="ManageCall" value="ManageCall" runat="server" />
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">管理方名称</label>
                <div class="col-sm-7 col-xs-7">
                    <input type="text" id="ManageName" name="ManageName" class="easyui-textbox" runat="server" data-options="disabled:true,width:'93%'" />
                    <input type="hidden" id="ManageID" name="ManageID" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">证件名称</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ManagePaperName" name="ManagePaperName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ManagePaperCode" name="ManagePaperCode" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">(注册)地址</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ManageRegAddr" name="ManageRegAddr" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">邮政编码</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ManagePostCode" name="ManagePostCode" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ManageLegalPeople" name="ManageLegalPeople" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ManageConnectpeople" name="ManageConnectpeople" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ManageConnectTel" name="ManageConnectTel" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合同计费信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">合同开始时间</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractBeginTime" name="ContractBeginTime" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合同结束时间</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractEndTime" name="ContractEndTime" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合同期限(月)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                    优惠免租<br />
                    结束时间</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="RentFreeEndTime" name="RentFreeEndTime" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">优惠原因</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="RentFreeReason" name="RentFreeReason" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                    合同到期<br />
                    提醒时间</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractRemindOfExpiraTimetion" name="ContractRemindOfExpiraTimetion" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:false,disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                    顺延起租<br />
                    开始时间</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="PostPoneBeginTime" name="PostPoneBeginTime" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">顺延原因</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="PostPoneReason" name="PostPoneReason" class="easyui-textbox" runat="server" data-options="required:false,disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="RoomNames" name="RoomNames" class="easyui-textbox" runat="server" data-options="multiline:true,width:'95%',height:'50px',disabled:true" />
                    <input type="hidden" id="RoomIDs" name="RoomIDs" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">房屋地址</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="RoomAddr" name="RoomAddr" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">房屋描述</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="RoomDis" name="RoomDis" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">房屋用途</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="RoomPurpose" name="RoomPurpose" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">建筑面积(平米)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="RoomBuildArea" name="RoomBuildArea" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">计费面积(平米)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="RoomChargeArea" name="RoomChargeArea" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">
                    计费方式</label>
                <div class="col-sm-3 col-xs-3">
                    <div style="margin-bottom: 10px">
                        <input class="easyui-radiobutton" id="ChargeCalculation1" name="ChargeCalculation"
                            data-options="value:'1',label:'总额固定方式',labelWidth:100,labelPosition:'after',labelAlign:'left',disabled:true" />
                    </div>
                    <div>
                        <input class="easyui-radiobutton" id="ChargeCalculation2" name="ChargeCalculation"
                            data-options="value:'2',label:'营业提成方式',labelWidth:100,labelPosition:'after',labelAlign:'left',disabled:true" />
                    </div>
                    <input type="hidden" id="ChargeCalculation" name="ChargeCalculation" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">
                    计算方式</label>
                <div class="col-sm-7 col-xs-7">
                    <div style="margin-bottom: 10px">
                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod1" name="CalculationMethod"
                            data-options="value:'3',label:'按每天单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod2" name="CalculationMethod"
                            data-options="value:'0',label:'按每月单价',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod3" name="CalculationMethod"
                            data-options="value:'1',label:'按缴费周期总额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod4" name="CalculationMethod"
                            data-options="value:'2',label:'按合同期间总额',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                    </div>
                    <div>
                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod5" name="CalculationMethod"
                            data-options="value:'5',label:'按提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                        <input class="easyui-radiobutton CalculationMethodClass" id="CalculationMethod6" name="CalculationMethod"
                            data-options="value:'6',label:'按保底+提成',labelPosition:'after',labelAlign:'left',labelWidth:90,disabled:true" />
                    </div>
                    <input type="hidden" id="CalculationMethod" name="CalculationMethod" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">计费标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ChargeStandard" name="ChargeStandard" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">计费标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ChargeUnit" name="ChargeUnit" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="BtnOpenOrClose">更多标准展开/折叠</a>
                </div>
            </div>
            <div class="form-group CostStandard">
                <label class="col-sm-1 col-xs-1 control-label">物管费标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="PropertyManageCostStandard" name="PropertyManageCostStandard" class="easyui-numberbox"
                        data-options="min:0,precision:2,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">物管费标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="PropertyManageCostUnit" name="PropertyManageCostUnit" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group CostStandard">
                <label class="col-sm-1 col-xs-1 control-label">水费标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="WaterCostStandard" name="WaterCostStandard" class="easyui-numberbox"
                        data-options="min:0,precision:2,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">水费标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="WaterCostUnit" name="WaterCostUnit" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group CostStandard">
                <label class="col-sm-1 col-xs-1 control-label">电费标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ElectricCostStandard" name="ElectricCostStandard" class="easyui-numberbox"
                        data-options="min:0,precision:2,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">电费标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ElectricCostUnit" name="ElectricCostUnit" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group CostStandard">
                <label class="col-sm-1 col-xs-1 control-label">气费标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="GasCostStandard" name="GasCostStandard" class="easyui-numberbox"
                        data-options="min:0,precision:2,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">气费标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="GasCostUnit" name="GasCostUnit" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group CostStandard">
                <label class="col-sm-1 col-xs-1 control-label">空调费标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="AirConditionerCostStandard" name="AirConditionerCostStandard" class="easyui-numberbox"
                        data-options="min:0,precision:2,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">空调费标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="AirConditionerCostUnit" name="AirConditionerCostUnit" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group CostStandard">
                <label class="col-sm-1 col-xs-1 control-label">供热费标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="HeatSupplyCostStandard" name="HeatSupplyCostStandard" class="easyui-numberbox"
                        data-options="min:0,precision:2,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">供热费标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="HeatSupplyCostUnit" name="HeatSupplyCostUnit" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group CostStandard">
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                    垃圾清运费<br />
                    标准(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="WasteTransportCostStandard" name="WasteTransportCostStandard" class="easyui-numberbox"
                        data-options="min:0,precision:2,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                    垃圾清运费<br />
                    标准单位</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="WasteTransportCostUnit" name="WasteTransportCostUnit" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">保底金额(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-textbox" data-options="disabled:true" runat="server" />
                    <!-- 合约类型对应的保底金额(单个房屋对应的保底金额) -->
                    <input type="hidden" id="TreatyPlaningTypeGuaranteeAmount" name="TreatyPlaningTypeGuaranteeAmount" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                    保底金额<br />
                    收取方式</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="GuaranteeAmountCollectionWay" name="GuaranteeAmountCollectionWay" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">营业提成比例(%)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                    营业提成<br />
                    起提金额(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="BusinessRoyaltyRaiseAmount" name="BusinessRoyaltyRaiseAmount" class="easyui-textbox" data-options="disabled:true" runat="server" />
                    <!-- 合约类型对应的营业提成起提金额(元)(单个房屋对应的营业提成起提金额(元)) -->
                    <input type="hidden" id="TreatyPlaningTypeBusinessRoyaltyRaiseAmount" name="TreatyPlaningTypeBusinessRoyaltyRaiseAmount" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合同总额(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractTotalPrice" name="ContractTotalPrice" class="easyui-textbox"
                        data-options="tipPosition:'bottom',required:false,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">上次合同总额(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="LastContractTotalPrice" name="LastContractTotalPrice" class="easyui-textbox"
                        data-options="tipPosition:'bottom',required:false,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">合同保证金(元)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractDepositPrice" name="ContractDepositPrice" class="easyui-textbox"
                        data-options="tipPosition:'bottom',required:false,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合同保证金描述</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractDepositDis" name="ContractDepositDis" class="easyui-textbox" runat="server"
                        data-options="required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">计费期间</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ChargingMode" name="ChargingMode" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">计费周期(月)</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
                <div class="col-sm-4 col-xs-4">
                    <input class="easyui-checkbox" id="IsContinuityChargingName" name="IsContinuityChargingName" data-options="label:'按对时按每月单价计算时,多个期间不同单价,是否连续计费?',labelWidth:320,labelPosition:'after',labelAlign:'left',disabled:true" runat="server" />
                    <input type="hidden" id="IsContinuityCharging" name="IsContinuityCharging" value="0" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">付款方式</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="PaymentMethod" name="PaymentMethod" class="easyui-combobox"
                        data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',valueField:'id',textField:'text',disabled:true,
                                 data: [{id: '线上支付',text: '线上支付'},
                                        {id: '现金支付',text: '现金支付'},
                                        {id: '公对公转账',text: '公对公转账'}]"
                        runat="server" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合同内容信息</legend>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">是否范本合同</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="IsModelContract" name="IsModelContract" class="easyui-combobox" data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '是',text: '是'},{id: '否',text: '否'}],disabled:true"
                        runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">合同范本来源</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ModelContractSource" name="ModelContractSource" class="easyui-textbox" runat="server"
                        data-options="required:false,tipPosition:'bottom',disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label"></label>
                <div class="col-sm-3 col-xs-3">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">范本修改内容</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="ModelUpdateContent" name="ModelUpdateContent" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">合同内容提要</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="ContractDescribe" name="ContractDescribe" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">合同内容描述</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="ContractDis" name="ContractDis" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">备注</label>
                <div class="col-sm-11 col-xs-11">
                    <input id="Remark" name="Remark" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">合同份数</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractNumber" name="ContractNumber" class="easyui-numberbox"
                        data-options="min:0,precision:0,required:false,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">每份页数</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="ContractPaperNumber" name="ContractPaperNumber" class="easyui-numberbox"
                        data-options="min:0,precision:0,required:false,disabled:true" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">附件数量</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="AdjunctNumber" name="AdjunctNumber" class="easyui-numberbox"
                        data-options="min:0,precision:0,required:false,disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">机构部门/负责人</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox" data-options="disabled:true" runat="server" />
                    <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                    <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">签约时间</label>
                <div class="col-sm-3 col-xs-3">
                    <input type="text" id="SignUpTime" name="SignUpTime" class="easyui-datebox" runat="server" data-options="editable:false,required:false,disabled:true" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">签约地点</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="SignUpAddress" name="SignUpAddress" class="easyui-textbox" runat="server" data-options="required:false,tipPosition:'bottom',disabled:true" />
                </div>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合同其它信息</legend>
            <div class="form-group OtherTable">
            </div>
        </fieldset>
        <!-- 合同子表内容数据 -->
        <div id="SubItem" style="height: 340px;">
            <div id="tabSubItem" class="easyui-tabs" data-options="fit:true">
                <div id="tabSubItem0" data-issel="true" title="房屋信息" style="overflow: hidden;">
                    <div id="TableContainerRoom" style="background-color: #cccccc;"></div>
                </div>
                <div id="tabSubItem1" data-issel="false" title="计费标准" style="overflow: hidden;">
                    <div id="TableContainerSetting" style="background-color: #cccccc;"></div>
                </div>
                <div id="tabSubItem2" data-issel="false" title="合同费用" style="overflow: hidden;">
                    <div id="TableContainerContractFees" style="background-color: #cccccc;"></div>
                </div>
                <div id="tabSubItem3" data-issel="false" title="其它费用" style="overflow: hidden;">
                    <div id="TableContainerOtherFees" style="background-color: #cccccc;"></div>
                </div>
            </div>
        </div>
        <!-- 按钮工具栏 -->
        <div style="text-align: center; width: 100%; padding: 10px 0;">
            <input class="button" type="button" id="BtnClose" value="关闭" />
        </div>
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server">
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <input type="hidden" id="ID" name="ID" runat="server">
        <input type="hidden" id="ContID" name="ContID" runat="server">
        <input type="hidden" id="ContractID" name="ContractID" runat="server">
        <input type="hidden" id="RentalContractID" name="RentalContractID" runat="server"><!-- 认租协议ID -->
        <input type="hidden" id="RoomResult" name="RoomResult" runat="server">
        <input type="hidden" id="SettingResult" name="SettingResult" runat="server">

        <input type="hidden" id="FeesResult" name="FeesResult" runat="server">
        <input type="hidden" id="OtherTableResult" name="OtherTableResult" runat="server">
        <input type="hidden" id="AuditStatus" name="AuditStatus" value="未启动" runat="server" />
    </form>
    <script type="text/javascript">
        //初始化页面控件高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $('#frmForm').css("height", h + "px");
            $('#tabSubItem').tabs({
                onSelect: tabSubItemSelect
            });
            $('#tabSubItem0,#tabSubItem1,#tabSubItem2,tabSubItem3').css("width", w - 41 + "px");
        }

        //合同子表信息切换
        function tabSubItemSelect(title, index) {
            var ItemTab = $('#tabSubItem').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 0) {
                    //合同房屋
                    setTimeout(function () {
                        LoadRoomGrid();
                    }, 300);
                } else if (index == 1) {
                    //合同计费信息
                    setTimeout(function () {
                        LoadSettingGrid();
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

        /* 房屋信息 */
        var RoomColumn = [[
            { field: 'ck', checkbox: true },
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 140, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 80, align: 'center' },
            { field: 'RoomChargeArea', title: '计租面积', width: 80, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准', width: 80, align: 'center' },
            { field: 'RentCostItemName', title: '租金费项', width: 100, align: 'center' },
            {
                field: 'RentBeginTime', title: '租赁开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'RentEndTime', title: '租赁结束时间', width: 100, align: 'center' },
            { field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center' },
            { field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 120, align: 'center' },
            {
                field: 'CheckInTime', title: '入住时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'RentOutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            }
        ]];

        function LoadRoomGrid() {
            var Data = [];
            if ($('#RoomResult').val() != "") {
                Data = JSON.parse($('#RoomResult').val());
            }
            $("#TableContainerRoom").datagrid({
                data: Data,
                method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
                columns: RoomColumn,
                rownumbers: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: false,
                height: '100%',
                toolbar: [],
                remoteSort: false,
                rowStyler: function (index, row) {
                    if (isValueNull(row.RentOutTime)) {
                        //有退租时间代表是已退租 不允许编辑
                        return "background-color:#F5F5F5";
                    }
                },
                onLoadSuccess: function (data) {
                }
            });
        }

        /* 计费标准 */
        var SettingColumn = [[
            { field: 'CommName', title: '项目名称', width: '140', align: 'center' },
            { field: 'CustName', title: '客户名称', width: '200', align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'center' },
            { field: 'BeginDate', title: '开始时间', width: '100', align: 'center' },
            { field: 'EndDate', title: '结束时间', width: '100', align: 'center' },
            { field: 'DueDate', title: '应收时间', width: '100', align: 'center' },
            { field: 'CostName', title: '费用项目', width: '120', align: 'center' },
            {
                field: 'ChargeCalculation', title: '计费方式', width: '100', align: 'center', formatter: function (value, row, index) {
                    if (value == "1") {
                        return "总额固定方式";
                    } else if (value == "2") {
                        return "营业提成方式";
                    }
                    return "";
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
                    } else if (value == "5") {
                        return "按提成";
                    } else if (value == "6") {
                        return "按保底+提成";
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
        function LoadSettingGrid() {
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

        /* 合同费用 */
        var FeesColumn = [[
            { field: 'FeesType', title: '费用状态', width: '80', align: 'center' },
            { field: 'CommName', title: '项目名称', width: '140', align: 'center' },
            { field: 'CustName', title: '客户名称', width: '200', align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: '200', align: 'center' },
            { field: 'CostName', title: '费用项目', width: '140', align: 'center' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: '160', align: 'center' },
            {
                field: 'AccountsDueDate', title: '应收日期', width: '100', align: 'center', formatter: function (value, row, index) {
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
            { field: 'DebtsAmount', title: '欠费金额', width: '80', align: 'center' }
        ]];

        //加载费用列表
        function LoadFeesGrid() {
            var Data = [];
            if ($('#FeesResult').val() != "") {
                Data = JSON.parse($('#FeesResult').val());
            }
            $("#TableContainerContractFees").datagrid({
                data: Data,
                //url: '/HM/M_Main/HC/DataPost.aspx',
                //method: "post",
                nowrap: false,
                columns: FeesColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: false,
                toolbar: [],
                rownumbers: true,
                border: false,
                height: '100%',
                showFooter: true,
                //onBeforeLoad: function (param) {
                //    param.Class = "Renting_ContractChange";
                //    param.Method = "GetContractChangeFeesList";
                //    param.ContID = $("#ContID").val();
                //    param.CommID = $("#CommID").val();
                //    param.AuditStatus = $("#AuditStatus").val();
                //    param.IsMerge = IsMerge;
                //},
                onLoadSuccess: function (data) {
                    var DueAmount = computeHTFY("DueAmount");
                    var PaidAmount = computeHTFY("PaidAmount");
                    var PrecAmount = computeHTFY("PrecAmount");
                    var WaivAmount = computeHTFY("WaivAmount");
                    var DebtsAmount = computeHTFY("DebtsAmount");
                    //加载页脚
                    $('#TableContainerContractFees').datagrid('reloadFooter', [
                        {
                            ID: 'footer',
                            CustName: "<span style='color:red'>合计</span>",
                            DueAmount: "<span style='color:red'>" + DueAmount + "</span>",
                            PaidAmount: "<span style='color:red'>" + PaidAmount + "</span>",
                            PrecAmount: "<span style='color:red'>" + PrecAmount + "</span>",
                            WaivAmount: "<span style='color:red'>" + WaivAmount + "</span>",
                            DebtsAmount: "<span style='color:red'>" + DebtsAmount + "</span>"
                        }
                    ]);
                }
            });
        }
        //指定列求和
        function computeHTFY(colName) {
            var rows = $('#TableContainerContractFees').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                if (isValueNull(rows[i][colName])) {
                    total += parseFloat(rows[i][colName]);
                }
            }
            return parseFloat(total).toFixed(2);
        }

        /* 其他费用 */
        var OtherFeesColumn = [[
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 160, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 160, align: 'center' },
            { field: 'ParkName', title: '车位编号', width: 120, align: 'center' },
            { field: 'CostName', title: '费用名称', width: 140, align: 'center' },
            { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'center' },
            {
                field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesStateDate', title: '开始日期', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'FeesEndDate', title: '结束日期', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DueAmount', title: '应收金额', width: 100, align: 'center' },
            { field: 'PaidAmount', title: '实收金额', width: 100, align: 'center' },
            { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'center' },
            { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'center' },
            { field: 'RefundAmount', title: '退款金额', width: 100, align: 'center' },
            { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'center' },
            { field: 'IsBankName', title: '托收状态', width: 80, align: 'center' },
            { field: 'IsFreezeName', title: '冻结状态', width: 80, align: 'center' },
            { field: 'IsPropertyName', title: '垫付状态', width: 80, align: 'center' },
            { field: 'IsPrecName', title: '预交状态', width: 80, align: 'center' }
        ]];

        //加载其他费用列表
        function LoadOtherFeesGrid() {
            $("#TableContainerOtherFees").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: OtherFeesColumn,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                toolbar: [],
                pagination: true,
                rownumbers: true,
                border: false,
                height: "100%",
                onBeforeLoad: function (param) {
                    param.Class = "Renting_Contract";
                    param.Method = "GetOtherFeesList";
                    param.CustID = $("#TenantryCustID").val();
                    param.ContID = $("#ContID").val();
                    param.CommID = $("#CommID").val();
                },
                onLoadSuccess: function (data) {
                }
            });
        }

        //页面数据验证
        function ClientClick(ID) {
            //启用页面控件 保存时才能获取数据
            let IsValidate = "";

            /* 房屋信息 */
            let ContractBeginTime = $('#ContractBeginTime').datebox("getValue");
            let ContractBeginTimeAddOneDay = AddDate(new Date(ContractBeginTime), 1);
            //先结束一次编辑
            endEditionForRoom();
            let RoomResultData = $("#TableContainerRoom").datagrid("getRows");
            $('#RoomResult').val(JSON.stringify(RoomResultData));
            for (var i = 0; i < RoomResultData.length; i++) {
                if (RoomResultData[i]["RoomChargeArea"] == "") {
                    $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的计租面积不能为空！");
                    return false;
                }

                if (RoomResultData[i]["RentBeginTime"] == "") {
                    $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的租赁开始时间不能为空！");
                    return false;
                }
                if (RoomResultData[i]["RentEndTime"] == "") {
                    $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的租赁结束时间不能为空！");
                    return false;
                }
                //判断租赁结束时间是否是小于租赁开始时间
                if ((new Date(RoomResultData[i]["RentEndTime"])) < (new Date(RoomResultData[i]["RentBeginTime"]))) {
                    $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的结束时间不能小于开始时间！");
                    return false;
                }

                //判断是否存在 优惠免租结束时间 并且 ≥租赁开始时间+1，＜租赁结束时间
                if (RoomResultData[i]["RentFreeEndTime"] != "") {
                    if (new Date(RoomResultData[i]["RentFreeEndTime"]) < new Date(ContractBeginTimeAddOneDay)) {
                        $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的优惠免租结束时间不能小于租赁开始时间+1天！");
                        return false;
                    }
                    if (new Date(RoomResultData[i]["RentFreeEndTime"]) >= new Date(RoomResultData[i]["RentEndTime"])) {
                        $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的优惠免租结束时间不能大于租赁结束时间！");
                        return false;
                    }
                }

                //判断是否存在 顺延起租开始时间 并且≥租赁开始时间+1，＜租赁结束时间
                if (RoomResultData[i]["PostPoneBeginTime"] != "") {
                    if (new Date(RoomResultData[i]["PostPoneBeginTime"]) < new Date(ContractBeginTimeAddOneDay)) {
                        $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的顺延起租开始时间不能小于租赁开始时间+1天！");
                        return false;
                    }
                    if (new Date(RoomResultData[i]["PostPoneBeginTime"]) >= new Date(RoomResultData[i]["RentEndTime"])) {
                        $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的顺延起租开始时间不能大于租赁结束时间！");
                        return false;
                    }
                }
            }
            //验证 【合同开始、结束时间作为所选房屋的租赁开始、结束时间，与审批中、已通过的认租、新签、续签、变更合同中相同房屋的租赁时间不得重叠】
            let ValidateParameter = {
                ID: $('#ID').val(),
                ContractID: $('#ContractID').val(),
                RentalContractID: $('#RentalContractID').val(),//认租协议ID
                RoomData: $('#RoomResult').val()
            };
            $.dataPostJson('Renting_ContractChange', 'ValidateContractRoom', ValidateParameter, true, false,
                function Init() {
                },
                function callback(data) {
                    if (!data.result) {
                        IsValidate = data.msg;
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });

            if (isValueNull(IsValidate)) {
                $.messager.alert('温馨提示', IsValidate);
                return false;
            }

            $('#frmForm input').attr("disabled", false);
            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            //判断必须要有 变更类别
            var ContractChangeTypeVal = $('#ContractChangeType').combobox("getValue");
            if (!isValueNull(ContractChangeTypeVal)) {
                $.messager.alert('温馨提示', "请选择变更类别");
                return;
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            var parameter = {
                ContractType: "",
                ChangeType: ContractChangeTypeVal,
                AuditType: "租赁合同变更"
            }
            $.dataPostJson('RentingPublicClass', 'GetRentingWorkFlow', parameter, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        FlowId = data.data;
                    } else {
                        ErrorMessage = data.msg;
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
            if (ErrorMessage != "") {
                $.messager.alert('温馨提示', ErrorMessage);
                return;
            }
            if (FlowId == "") {
                $.messager.alert('温馨提示', "请设置对应" + AuditTypeStr + "的审核流程");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=1263&biaoshi=1&random=" + Math.random();
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
        function LoadOtherTableData() {
            var OtherContractData = $('#OtherTableResult').val();
            if (isValueNull(OtherContractData)) {
                let data = $.parseJSON(OtherContractData);
                data.forEach((ItemRow) => {
                    let Options = "required:false";
                    let ClassName = "easyui-numberbox";

                    if (ItemRow.FieldIsRequired == "是") {
                        Options = "required:true";
                    }
                    if (ItemRow.FieldType == "数值") {
                        Options += ",precision:2";
                        ClassName = "easyui-numberbox";
                        if (ItemRow.FieldValue == "null") {
                            ItemRow.FieldValue = "";
                        }
                    }
                    else if (ItemRow.FieldType == "文本") {
                        Options += "";
                        ClassName = "easyui-textbox"
                        if (ItemRow.FieldValue == "null") {
                            ItemRow.FieldValue = "";
                        }
                    } else if (ItemRow.FieldType == "时间") {
                        Options += ",editable:false";
                        ClassName = "easyui-datebox";
                        if (ItemRow.FieldValue != "") {
                            ItemRow.FieldValue = $.dateFormat(ItemRow.FieldValue, 'yyyy-MM-dd');
                        }
                    }
                    $('.OtherTable').append("<div class='form-group'>" +
                        "<label class='col-sm-1 col-xs-1 control-label'>" + ItemRow.FieldName + "</label>" +
                        "<div class='col-sm-3 col-xs-3'>" +
                        "<input id='" + ItemRow.ContractFieldSetID + "' name='" + ItemRow.ContractFieldSetID + "' disabled='disabled' value='" + ItemRow.FieldValue + "' class='" + ClassName + " UserInput' sdata-options='" + Options + "' /> </div></div>");
                });
                $.parser.parse(".OtherTable")//重新渲染，参数为要渲染的容器
            }
        }

        $(function () {
            //初始化页面高度
            InitTableHeight();

            //加载称谓
            if ($('#LeaserCall').val() != "") {
                $(".easyui-radiobutton[radiobuttonname=Leaser]").each(function () {
                    if ($(this).val() == $('#LeaserCall').val()) {
                        $(this).radiobutton("check");
                    }
                });
            }
            if ($('#TenantryCall').val() != "") {
                $(".easyui-radiobutton[radiobuttonname=Tenantry]").each(function () {
                    if ($(this).val() == $('#TenantryCall').val()) {
                        $(this).radiobutton("check");
                    }
                });
            }
            if ($('#ManageCall').val() != "") {
                $(".easyui-radiobutton[radiobuttonname=Manage]").each(function () {
                    if ($(this).val() == $('#ManageCall').val()) {
                        $(this).radiobutton("check");
                    }
                });
            }
            //加载计算方式、计费方式
            if ($('#ChargeCalculation').val() != "") {
                $('.easyui-radiobutton[radiobuttonname="ChargeCalculation"]').each(function () {
                    if ($(this).val() == $('#ChargeCalculation').val())
                        $(this).radiobutton("check");
                });
                $('.easyui-radiobutton[radiobuttonname="CalculationMethod"]').each(function () {
                    if ($(this).val() == $('#CalculationMethod').val())
                        $(this).radiobutton("check");
                });
            }

            LoadRoomGrid();//加载房屋列表
            LoadOtherTableData();//加载合同的其他信息

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

