<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Merchants.RentSubscription.Edit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="/HM/M_Main/UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="/HM/M_Main/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-招商管理-商机管理-认租合同登记编辑页面</title>
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

    <style type="text/css">
        input {
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
    </style>
</head>
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <form id="frmForm" class="form-horizontal" role="form" runat="server" style="padding: 0px;">
        <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
            <div id="tab0" data-issel="true" title="合同登记信息" style="overflow: auto; padding: 10px;">
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">合同基本信息</legend>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">项目名称</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">合同类型</label>
                        <div class="col-sm-3 col-xs-3">
                            <input id="ContractCategory" name="ContractCategory" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',value:'收入合同',data: [{id: '收入合同',text: '收入合同'}]"
                                runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">合同类别</label>
                        <div class="col-sm-3 col-xs-3">
                            <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox"
                                data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelContractType();}"
                                runat="server" />
                            <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                        <div class="col-sm-7 col-xs-7">
                            <input type="text" id="ContractSign" name="ContractSign" class="easyui-textbox" runat="server" data-options="required:true,tipPosition:'bottom',width:'93%'" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">合约类型</label>
                        <div class="col-sm-3 col-xs-3">
                            <input id="TreatyPlaningTypeName" name="TreatyPlaningTypeName" class="easyui-textbox"
                                data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelTreatyPlaningType();}"
                                runat="server" />
                            <input type="hidden" id="TreatyPlaningType" name="TreatyPlaningType" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                        <div class="col-sm-7 col-xs-7">
                            <input type="text" id="ContractName" name="ContractName" class="easyui-textbox" runat="server" data-options="required:true,tipPosition:'bottom',width:'93%'" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">出租方信息(称谓：
                        <input class="easyui-radiobutton" id="Leaser0" name="Leaser"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left',checked:true" />
                        <input class="easyui-radiobutton" id="Leaser1" name="Leaser"
                            data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left'" />
                        )</legend>
                    <input type="hidden" id="LeaserCall" name="LeaserCall" value="0" runat="server" />
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">出租方名称</label>
                        <div class="col-sm-7 col-xs-7">
                            <input id="LeaserName" name="LeaserName" class="easyui-textbox"
                                data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'93%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelLeaser();}"
                                runat="server" />
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
                            <input type="text" id="LeaserConnectpeople" name="LeaserConnectpeople" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="LeaserConnectTel" name="LeaserConnectTel" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">承租方信息(称谓：
                        <input class="easyui-radiobutton" id="Tenantry0" name="Tenantry"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left'" />
                        <input class="easyui-radiobutton" id="Tenantry1" name="Tenantry"
                            data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left',checked:true" />
                        )</legend>
                    <input type="hidden" id="TenantryCall" name="TenantryCall" value="1" runat="server" />
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">承租方名称</label>
                        <div class="col-sm-7 col-xs-7">
                            <input id="TenantryCustName" name="TenantryCustName" class="easyui-textbox"
                                data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'93%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelTenantryCust();}"
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
                            <input type="text" id="TenantryConnectpeople" name="TenantryConnectpeople" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="TenantryConnectTel" name="TenantryConnectTel" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">
                            享受优惠政策</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="TenantryPreferentialPolicy" name="TenantryPreferentialPolicy" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">
                            优惠政策编号</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="TenantryPreferentialPolicyIdCode" name="TenantryPreferentialPolicyIdCode" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">合同计费信息</legend>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">合同签订时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractSignBeginTime" name="ContractSignBeginTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:true,onChange:ContractSignBeginTimeChange" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">至</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractSignEndTime" name="ContractSignEndTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:true,onChange:ContractSignBeginTimeChange" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                            合同到期<br />
                            提醒时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractRemindOfExpiraTimetion" name="ContractRemindOfExpiraTimetion" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:false" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">房屋交付时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="RoomDeliveryBeginTime" name="RoomDeliveryBeginTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:true,onChange:RoomDeliveryBeginTimeChange" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">至</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="RoomDeliveryEndTime" name="RoomDeliveryEndTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:true,onChange:RoomDeliveryBeginTimeChange" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">租赁开始时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="RentBeginTime" name="RentBeginTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:false,onChange:RentBeginTimeChange" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">至</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="RentEndTime" name="RentEndTime" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">合同期限(月)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomNames" name="RoomNames" class="easyui-textbox"
                                data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRoom();},width:'95%',height:'50px',
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#RoomIDs').val('');
                                            $('#RoomBuildArea').textbox('setValue','');
                                            $('#RoomChargeArea').textbox('setValue','');
                                            $('#RoomResult').val('');
                                            LoadRoomGrid();
                                            }}] "
                                runat="server" />
                            <input type="hidden" id="RoomIDs" name="RoomIDs" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">房屋地址</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomAddr" name="RoomAddr" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">房屋描述</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomDis" name="RoomDis" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">房屋用途</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomPurpose" name="RoomPurpose" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
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
                                data-options="min:0,precision:2" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">物管费标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="PropertyManageCostUnit" name="PropertyManageCostUnit" class="easyui-textbox" runat="server" />
                        </div>
                    </div>
                    <div class="form-group CostStandard">
                        <label class="col-sm-1 col-xs-1 control-label">水费标准(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="WaterCostStandard" name="WaterCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">水费标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="WaterCostUnit" name="WaterCostUnit" class="easyui-textbox" runat="server" />
                        </div>
                    </div>
                    <div class="form-group CostStandard">
                        <label class="col-sm-1 col-xs-1 control-label">电费标准(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ElectricCostStandard" name="ElectricCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">电费标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ElectricCostUnit" name="ElectricCostUnit" class="easyui-textbox" runat="server" />
                        </div>
                    </div>
                    <div class="form-group CostStandard">
                        <label class="col-sm-1 col-xs-1 control-label">气费标准(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="GasCostStandard" name="GasCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">气费标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="GasCostUnit" name="GasCostUnit" class="easyui-textbox" runat="server" />
                        </div>
                    </div>
                    <div class="form-group CostStandard">
                        <label class="col-sm-1 col-xs-1 control-label">空调费标准(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="AirConditionerCostStandard" name="AirConditionerCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">空调费标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="AirConditionerCostUnit" name="AirConditionerCostUnit" class="easyui-textbox" runat="server" />
                        </div>
                    </div>
                    <div class="form-group CostStandard">
                        <label class="col-sm-1 col-xs-1 control-label">供热费标准(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="HeatSupplyCostStandard" name="HeatSupplyCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">供热费标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="HeatSupplyCostUnit" name="HeatSupplyCostUnit" class="easyui-textbox" runat="server" />
                        </div>
                    </div>
                    <div class="form-group CostStandard">
                        <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                            垃圾清运费<br />
                            标准(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="WasteTransportCostStandard" name="WasteTransportCostStandard" class="easyui-numberbox"
                                data-options="min:0,precision:2" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                            垃圾清运费<br />
                            标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="WasteTransportCostUnit" name="WasteTransportCostUnit" class="easyui-textbox" runat="server" />
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
                        <label class="col-sm-1 col-xs-1 control-label">定金金额(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="DepositAmount" name="DepositAmount" class="easyui-numberbox"
                                data-options="min:0,precision:2,tipPosition:'bottom',required:true" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">定金冲抵费项</label>
                        <div class="col-sm-3 col-xs-3">
                            <input id="DepositCostItemName" name="DepositCostItemName" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDepositCostItem();}"
                                runat="server" />
                            <input type="hidden" id="DepositCostItemID" name="DepositCostItemID" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">计费期间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ChargingMode" name="ChargingMode" class="easyui-textbox" data-options="disabled:true" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">计费周期(月)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-textbox" data-options="disabled:true" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">付款方式</label>
                        <div class="col-sm-3 col-xs-3">
                            <input id="PaymentMethod" name="PaymentMethod" class="easyui-combobox"
                                data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',valueField:'id',textField:'text',
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
                            <input id="IsModelContract" name="IsModelContract" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                                    valueField:'id',textField:'text',data: [{id: '是',text: '是'},{id: '否',text: '否'}]"
                                runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">合同范本来源</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ModelContractSource" name="ModelContractSource" class="easyui-textbox" runat="server" data-options="required:false,tipPosition:'bottom'" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label"></label>
                        <div class="col-sm-3 col-xs-3">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">范本修改内容</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="ModelUpdateContent" name="ModelUpdateContent" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">合同内容提要</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="ContractDescribe" name="ContractDescribe" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">合同内容描述</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="ContractDis" name="ContractDis" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">备注</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="Remark" name="Remark" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">合同份数</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractNumber" name="ContractNumber" class="easyui-numberbox"
                                data-options="min:0,precision:0,required:false" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">每份页数</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractPaperNumber" name="ContractPaperNumber" class="easyui-numberbox"
                                data-options="min:0,precision:0,required:false" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">附件数量</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="AdjunctNumber" name="AdjunctNumber" class="easyui-numberbox"
                                data-options="min:0,precision:0,required:false" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">机构部门/负责人</label>
                        <div class="col-sm-3 col-xs-3">
                            <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox"
                                data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName();}"
                                runat="server" />
                            <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                            <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">签约时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="SignUpTime" name="SignUpTime" class="easyui-datebox" runat="server" data-options="editable:false,required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">签约地点</label>
                        <div class="col-sm-3 col-xs-3">
                            <input id="SignUpAddress" name="SignUpAddress" class="easyui-textbox" runat="server" data-options="required:false,tipPosition:'bottom'" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">合同其它信息</legend>
                    <div class="form-group OtherTable">
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">房屋信息</legend>
                    <div style="height: 340px;">
                        <div id="TableContainerRoom" style="background-color: #cccccc; height: 100%; width: 100%;"></div>
                    </div>
                </fieldset>
                <!-- 流程内容 -->
                <div id="OAFlow" style="height: auto; margin: 0px auto;">
                    <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                    <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
                </div>
                <!-- 按钮工具栏 -->
                <div style="text-align: center; width: 100%; padding: 10px 0;">
                    <input class="button" type="button" id="BtnClose" value="关闭" />
                    <input class="button" id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
                    <input class="button" id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
                    <input class="button" id="btnJump" type="submit" value="跳过" onserverclick="btnJump_ServerClick" runat="server" />
                    <input class="button" id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
                    <input class="button" id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
                    <input class="button" id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
                    <input class="button" id="BtnSaveAndClose" type="submit" value="保存并关闭" onserverclick="BtnSaveAndClose_ServerClick" runat="server" />
                    <input class="button" id="BtnSave" type="submit" value="保存并修改" onserverclick="BtnSave_ServerClick" runat="server" />
                    <input class="button" id="BtnPrint" type="button" value="打印" style="display: none;" runat="server" />
                </div>
            </div>
            <div id="tab1" data-issel="false" title="合同附件信息" style="overflow: hidden;">
                <div class="form-group Filetoolbar" style="background-color: #fff; padding: 3px; margin: 0px;">
                    <label class="col-sm-1 col-xs-1 control-label">选择附件:</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="uploadFile" name="uploadFile" class="easyui-filebox" data-options="required:false,width:'210px',buttonText:'选择文件',prompt:'请选择一个文件...'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">附件名称:</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="FileName" name="FileName" class="easyui-textbox" data-options="required:false,width:'180px',icons:[{
                                                    iconCls:'icon-clear',
                                                    handler: function(e){
                                                    $(e.data.target).textbox('clear');
                                                    }}] " />
                    </div>
                    <div class="col-sm-6 col-xs-6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="SaveFile()">上传</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="DelFile();">删除</a>
                    </div>
                </div>
                <div style="width: 100%; background-color: #cccccc;" id="TableContainerFile"></div>
            </div>
        </div>
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server">
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <input type="hidden" id="ID" name="ID" runat="server">
        <input type="hidden" id="RoomResult" name="RoomResult" runat="server">
        <input type="hidden" id="OtherTableResult" name="OtherTableResult" runat="server">
        <input type="hidden" id="AuditStatus" name="AuditStatus" value="未启动" runat="server" />
    </form>
    <script type="text/javascript">
        //初始化页面控件高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $('#tab').css("height", h + 'px');
            $('#tab0,#tab1').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });

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
        //选择 合同类别
        function SelContractType() {
            var param = { "Ismultiple": "0" };
            LayerDialog.OpenWin('580', '400', '/HM/M_Main/Renting/Dialog/CotractTypeSelect.aspx?' + $.param(param), "选择合同类别", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ContractType").val(data.id);
                    $("#ContractTypeName").textbox("setValue", data.text);
                    //根据选择的合同类别 加载合同其他信息
                    LoadContractOtherBaseInformation();
                }
            });
        }

        //根据选择的合同类别 加载合同其他信息
        function LoadContractOtherBaseInformation() {
            $.dataPostJson("Renting_RentalContract", 'GetContractTypeFieldSetDetail', { "ContractType": $('#ContractType').val() }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (isValueNull(data)) {
                        data.forEach((ItemRow) => {
                            let Options = "required:false";
                            let ClassName = "easyui-numberbox";

                            if (ItemRow.FieldIsRequired == "是") {
                                Options = "required:true";
                            }
                            if (ItemRow.FieldType == "数值") {
                                Options += ",precision:2";
                                ClassName = "easyui-numberbox";
                            }
                            else if (ItemRow.FieldType == "文本") {
                                Options += "";
                                ClassName = "easyui-textbox";
                            } else if (ItemRow.FieldType == "时间") {
                                Options += ",editable:false";
                                ClassName = "easyui-datebox";
                            }
                            $('.OtherTable').append("<div class='form-group'>" +
                                "<label class='col-sm-1 col-xs-1 control-label'>" + ItemRow.FieldName + "</label>" +
                                "<div class='col-sm-3 col-xs-3'>" +
                                "<input id='" + ItemRow.ID + "' name='" + ItemRow.ID + "' class='" + ClassName + " UserInput' sdata-options='" + Options + "' /> </div></div>");
                        })
                        $.parser.parse(".OtherTable")//重新渲染，参数为要渲染的容器
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        //选择 合约类型
        function SelTreatyPlaningType() {
            LayerDialog.OpenWin('900', '650', '/HM/M_Main/Renting/Dialog/TreatyPlaningSelect.aspx', "选择合约类型", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    let data = $.parseJSON(_Data);
                    $("#TreatyPlaningType").val(data.ID); //合约类型ID
                    $("#TreatyPlaningTypeName").textbox("setValue", data.TreatyPlaningType);//合约类型名称
                    $('#ContractPeriod').textbox("setValue", data.ContractPeriod)//合同期限(月)
                    $('#ChargeCalculation').val(data.ChargeCalculation);//计费方式
                    $('.easyui-radiobutton[radiobuttonname="ChargeCalculation"]').each(function () {
                        if ($(this).val() == data.ChargeCalculation)
                            $(this).radiobutton("check");
                    });
                    $('#CalculationMethod').val(data.CalculationMethod);//计算方式
                    $('.easyui-radiobutton[radiobuttonname="CalculationMethod"]').each(function () {
                        if ($(this).val() == data.CalculationMethod)
                            $(this).radiobutton("check");
                    });
                    $('#ChargeStandard').textbox("setValue", data.ChargeStandard);//计费标准（元）
                    $('#ChargeUnit').textbox("setValue", data.ChargeUnit);//计费标准单位
                    //保底金额 如果选择了房屋，根据合约类型自动求和，不允许修改
                    $('#GuaranteeAmount').textbox("setValue", "");
                    $('#TreatyPlaningTypeGuaranteeAmount').val(data.GuaranteeAmount);
                    //保底金额收取方式
                    $('#GuaranteeAmountCollectionWay').textbox("setValue", data.GuaranteeAmountCollectionWay);
                    //营业提成比例（%）
                    $('#BusinessRoyaltyRatio').textbox("setValue", data.BusinessRoyaltyRatio);
                    //营业提成起提金额（元） 如果选择了房屋，根据合约类型自动求和，不允许修改
                    $('#BusinessRoyaltyRaiseAmount').textbox("setValue", "");
                    $('#TreatyPlaningTypeBusinessRoyaltyRaiseAmount').val(data.BusinessRoyaltyRaiseAmount);
                    //计费期间
                    $('#ChargingMode').textbox("setValue", data.ChargingMode);
                    //计费周期(月)
                    $('#ContPeriod').textbox("setValue", data.ContPeriod);
                    //清空房屋选择
                    $('#RoomNames').textbox("setValue", "");
                    $('#RoomIDs').val("");
                    //清空房屋列表
                    $('#RoomResult').val('');
                    LoadRoomGrid();

                    //清空建筑面积 计费面积
                    $('#RoomBuildArea').textbox("setValue", ""); // 建筑面积（平米）
                    $('#RoomChargeArea').textbox("setValue", ""); // 计费面积（平米）

                    //判断是否存在租赁开始时间 如果存在重新计算租赁结束时间
                    var RentBeginTime = $('#RentBeginTime').datebox("getValue");
                    if (RentBeginTime != "") {
                        RentBeginTime = AddTiming(new Date(RentBeginTime), data.ContractPeriod);
                        $('#RentEndTime').textbox("setValue", $.dateFormat(RentBeginTime, 'yyyy-MM-dd'));
                    }
                }
            });
        }

        //选择出租方
        function SelLeaser() {
            var param = { "UnitType": "出租方" };
            LayerDialog.OpenWin('580', '400', '/HM/M_Main/Renting/Dialog/SignUnitSelect.aspx?' + $.param(param), "选择出租方", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#LeaserID").val(data.ID);
                    $("#LeaserName").textbox("setValue", data.UnitName);
                    $("#LeaserPaperName").textbox("setValue", data.UnitPaperName);
                    $("#LeaserPaperCode").textbox("setValue", data.UnitPaperCode);
                    $("#LeaserRegAddr").textbox("setValue", data.UnitRegAddr);
                    $("#LeaserPostCode").textbox("setValue", data.UnitPostCode);
                    $("#LeaserLegalPeople").textbox("setValue", data.UnitLegalPeople);
                    $("#LeaserConnectpeople").textbox("setValue", data.UnitConnectpeople);
                    $("#LeaserConnectTel").textbox("setValue", data.UnitConnectTel);
                }
            });
        }

        //选择承租方
        function SelTenantryCust() {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/RentingCustomersSelect.aspx', "选择承租方", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#TenantryCustID").val(data.CustID);
                    $("#TenantryCustName").textbox("setValue", data.CustName);
                    $("#TenantryPaperName").textbox("setValue", data.PaperName);
                    $("#TenantryPaperCode").textbox("setValue", data.PaperCode);
                    $("#TenantryLiveAddr").textbox("setValue", data.Address);
                    $("#TenantryPostCode").textbox("setValue", data.PostCode);
                    $("#TenantryLegalPeople").textbox("setValue", data.LegalRepr);
                    $("#TenantryConnectpeople").textbox("setValue", data.CustName);
                    $("#TenantryConnectTel").textbox("setValue", data.LinkmanTel);
                }
            });
        }

        //合同签订时间变更
        function ContractSignBeginTimeChange() {
            //获取开始
            var BeginTime = $('#ContractSignBeginTime').datebox("getValue");
            //获取结束时间
            var EndTime = $('#ContractSignEndTime').datebox("getValue");

            if (BeginTime != "" && EndTime == "") {
                $('#ContractSignEndTime').datebox("setValue", $.dateFormat(BeginTime, 'yyyy-MM-dd'));
            }
            if (EndTime != "" && BeginTime != "") {
                if ((new Date(BeginTime)) > (new Date(EndTime))) {
                    $(this).datebox("setValue", "");
                }
            }

        }

        //房屋交付时间变更
        function RoomDeliveryBeginTimeChange() {
            //获取开始
            var BeginTime = $('#RoomDeliveryBeginTime').datebox("getValue");
            //获取结束时间
            var EndTime = $('#RoomDeliveryEndTime').datebox("getValue");

            if (BeginTime != "" && EndTime == "") {
                $('#RoomDeliveryEndTime').datebox("setValue", $.dateFormat(BeginTime, 'yyyy-MM-dd'));
            }
            if (EndTime != "" && BeginTime != "") {
                if ((new Date(BeginTime)) > (new Date(EndTime))) {
                    $(this).datebox("setValue", "");
                }
            }
        }

        //租赁开始时间变更
        function RentBeginTimeChange(date) {
            //判断是否存在 合同期限(月)
            var ContractPeriod = $('#ContractPeriod').textbox("getValue");
            if (ContractPeriod != "") {
                date = AddTiming(new Date(date), ContractPeriod);
                $('#RentEndTime').textbox("setValue", $.dateFormat(date, 'yyyy-MM-dd'));
            } else {
                $('#RentEndTime').textbox("setValue", "");
            }
            //判断是否存在房屋数据  如果存在房屋数据需要刷新房屋的租赁开始结束时间
            var OldRoomGridData = [];
            if ($('#RoomResult').val() != "") {
                OldRoomGridData = $.parseJSON($('#RoomResult').val());
                OldRoomGridData.forEach((itemRow) => {
                    itemRow.RentBeginTime = $('#RentBeginTime').datebox("getValue");
                    itemRow.RentEndTime = $('#RentEndTime').textbox("getValue");
                });

                $('#RoomResult').val(JSON.stringify(OldRoomGridData));
                LoadRoomGrid();
            }
        }

        //按对时规则添加月份
        function AddTiming(dateTime, AddMonth) {
            var Year = dateTime.getFullYear();
            var Month = dateTime.getMonth() + 1;
            var Days = dateTime.getDate();

            var IntervalYear = 0;
            var IntervalMonth = 0;
            //月份加上添加月份
            Month = parseInt(Month) + parseInt(AddMonth);
            IntervalYear = parseInt(Month / 12);
            IntervalMonth = (Month % 12) == 0 ? 12 : (Month % 12); //加月后的月份
            Year = parseInt(Year) + parseInt(IntervalYear); //加月后的年份

            var totalDays = mGetDate(Year, IntervalMonth);
            if (parseInt(totalDays) < Days) {
                Days = totalDays;
            }
            var NewDate = Year + '-' + IntervalMonth + '-' + Days;
            return DiffDate(new Date(NewDate), 1);
        }

        //获取月份的总天数
        function mGetDate(year, month) {
            var d = new Date(year, month, 0);
            return d.getDate();
        }
        //减日期
        function DiffDate(dateTime, days) {
            dateTime = dateTime.setDate(dateTime.getDate() - days);
            dateTime = new Date(dateTime);
            return dateTime;
        }

        //添加日期
        function AddDate(dateTime, days) {
            dateTime = dateTime.setDate(dateTime.getDate() + days);
            dateTime = new Date(dateTime);
            return dateTime;
        }

        //添加月份
        function AddMonths(dateTime, Month) {
            dateTime = dateTime.setMonth(parseInt(dateTime.getMonth()) + parseInt(Month));
            dateTime = new Date(dateTime);
            return dateTime;
        }

        //选择认租房屋
        function SelRoom() {
            //判断是否已选择合约类型
            let TreatyPlaningType = $('#TreatyPlaningType').val();
            if (!isValueNull(TreatyPlaningType)) {
                $.messager.alert('温馨提示', "请选择合约类型！");
                return;
            }
            var param = { "TreatyPlaningType": TreatyPlaningType, "RoomIDs": $('#RoomIDs').val() };
            LayerDialog.OpenWin('1000', '650', '/HM/M_Main/Renting/Dialog/RoomSelectWithTreatyPlaningType.aspx?' + $.param(param), "选择合约房屋", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    //已选择的房屋列表数据
                    var OldRoomGridData = [];
                    if ($('#RoomResult').val() != "") {
                        OldRoomGridData = $.parseJSON($('#RoomResult').val());
                    }

                    let RoomBuildArea = 0.00;//房屋建筑面积
                    let RoomChargeArea = 0.00;//房屋计费面积
                    let RoomIDs = "";
                    let RoomNames = "";
                    //循环选择的房屋
                    data.forEach((ItemRow) => {
                        RoomIDs = RoomIDs + String(ItemRow.RoomID) + ',';//房屋ID
                        RoomNames = RoomNames + ItemRow.RoomSign + ',';//房屋名称
                        RoomBuildArea = parseFloat(RoomBuildArea) + parseFloat(ItemRow.BuildArea);//建筑面积
                        //判断原来的房屋列表是否已存在当前房屋 不存在就新增
                        var ItemNode = OldRoomGridData.filter(function (e) {
                            return e.RoomID == ItemRow.RoomID;
                        });
                        if (ItemNode != null && ItemNode.length > 0) {
                            RoomChargeArea = parseFloat(RoomChargeArea) + parseFloat(ItemNode[0].RoomChargeArea);//房屋计费面积
                        } else {
                            OldRoomGridData.push({
                                ID: "",
                                RentalContractID: $('#ID').val(),
                                CommID: $('#CommID').val(),
                                RoomID: String(ItemRow.RoomID),
                                RoomName: ItemRow.RoomName,
                                RoomSign: ItemRow.RoomSign,
                                BuildArea: ItemRow.BuildArea,
                                RoomChargeArea: ItemRow.BuildArea,
                                RentBeginTime: $('#RentBeginTime').datebox("getValue"),
                                RentEndTime: $('#RentEndTime').textbox("getValue"),
                                ChargeStandard: ItemRow.ChargeStandard,
                                RentCostItemID: ItemRow.RentCostItemID,
                                RentCostItemName: ItemRow.RentCostItemName
                            });
                            RoomChargeArea = parseFloat(RoomChargeArea) + parseFloat(ItemRow.BuildArea);//房屋计费面积
                        }
                    });
                    if (RoomIDs.endsWith(',')) {
                        RoomIDs = RoomIDs.substring(0, RoomIDs.length - 1);
                        RoomNames = RoomNames.substring(0, RoomNames.length - 1);
                    }
                    $('#RoomIDs').val(RoomIDs);
                    $('#RoomNames').textbox("setValue", RoomNames);
                    $('#RoomBuildArea').textbox("setValue", RoomBuildArea);
                    $('#RoomChargeArea').textbox("setValue", parseFloat(RoomChargeArea).toFixed(4));
                    //存在点位信息 需要重新加载点位列表
                    if (OldRoomGridData.length > 0) {
                        $('#RoomResult').val(JSON.stringify(OldRoomGridData));
                    } else {
                        $('#RoomResult').val("");
                    }
                    LoadRoomGrid();
                    //选择房屋后需要加载 保底金额（元）【每个房屋的保底金额之和】 营业提成起提金额（元）【每个房屋的起提金额之和】
                    var TreatyPlaningTypeGuaranteeAmountVal = $('#TreatyPlaningTypeGuaranteeAmount').val();
                    var TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal = $('#TreatyPlaningTypeBusinessRoyaltyRaiseAmount').val();
                    if (isValueNull(TreatyPlaningTypeGuaranteeAmountVal)) {
                        $('#GuaranteeAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeGuaranteeAmountVal) * OldRoomGridData.length).toFixed(2));
                    }
                    if (isValueNull(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal)) {
                        $('#BusinessRoyaltyRaiseAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal) * OldRoomGridData.length).toFixed(2));
                    }

                }
            });

        }

        //选择定金冲抵费项
        function SelDepositCostItem() {
            var param = { "CommID": $("#CommID").val() };
            LayerDialog.OpenWin('700', '400', '/HM/M_Main/DialogNew/CorpCommCostDlg.aspx?' + $.param(param), "选择定金冲抵费用项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#DepositCostItemID").val(data.CostID);
                    $("#DepositCostItemName").textbox("setValue", data.CostName);
                }
            });
        }

        //选择 机构部门/负责人
        function SelDutyDepNameAndUserName() {
            LayerDialog.OpenWin('640', '400', '/HM/M_Main/Renting/Dialog/DepartAndUserSelect.aspx', "机构部门/负责人选择", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#DutyUserCode').val(data.UserCode);
                    $('#DutyDepCode').val(data.DepCode);
                    $('#DutyDepNameAndUserName').textbox("setValue", data.DepName + "-" + data.UserName);
                }
            });
        }

        /* 房屋信息 */
        var RoomColumn = [[
            { field: 'ck', checkbox: true },
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 140, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 80, align: 'center' },
            {
                field: 'RoomChargeArea', title: '计租面积', width: 80, align: 'center', editor: {
                    type: 'numberbox',
                    options: {
                        min: 0,
                        precision: 4,
                        required: true
                    }
                }
            },
            { field: 'ChargeStandard', title: '计费标准', width: 100, align: 'center' },
            { field: 'RentCostItemName', title: '租金费项', width: 100, align: 'center' },
            {
                field: 'RentBeginTime', title: '租赁开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'RentEndTime', title: '租赁结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            }
        ]];

        var RoomToolbar = [
            {
                text: '保存',
                iconCls: 'icon-save',
                handler: function () {
                    //先结束一次编辑
                    if (endEditionForRoom()) {
                        //将列表数据存放到 PointResult 中
                        var RowsCount = $("#TableContainerRoom").datagrid("getRows");
                        if (RowsCount.length == 0) {
                            $('#RoomResult').val("");
                        } else {
                            $('#RoomResult').val(JSON.stringify(RowsCount));
                        }
                        $.messager.alert('温馨提示', "房屋数据保存成功");
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    //先结束一次编辑
                    if (endEditionForRoom()) {
                        var row = $("#TableContainerRoom").datagrid("getChecked");
                        if (row.length == 0) {
                            $.messager.alert('温馨提示', '请勾选需要删除的房屋!');
                            return;
                        }
                        HDialog.Prompt("是否确认删除勾选的点位数据？", function () {
                            row.forEach((ItemRow) => {
                                let RowIndex = $("#TableContainerRoom").datagrid("getRowIndex", ItemRow);
                                $("#TableContainerRoom").datagrid("deleteRow", RowIndex);
                            });

                            var RowsCount = $("#TableContainerRoom").datagrid("getRows");
                            let RoomBuildArea = 0.00;//房屋建筑面积
                            let RoomChargeArea = 0.00;//房屋计费面积
                            let RoomIDs = "";
                            let RoomNames = "";

                            //循环选择的房屋
                            RowsCount.forEach((ItemRow) => {
                                RoomIDs = RoomIDs + String(ItemRow.RoomID) + ',';//房屋ID
                                RoomNames = RoomNames + ItemRow.RoomSign + ',';//房屋名称
                                RoomBuildArea = parseFloat(RoomBuildArea) + parseFloat(ItemRow.BuildArea);//建筑面积
                                RoomChargeArea = parseFloat(RoomChargeArea) + parseFloat(ItemRow.RoomChargeArea);//房屋计费面积
                            });

                            if (RoomIDs.endsWith(',')) {
                                RoomIDs = RoomIDs.substring(0, RoomIDs.length - 1);
                                RoomNames = RoomNames.substring(0, RoomNames.length - 1);
                            }
                            $('#RoomIDs').val(RoomIDs);
                            $('#RoomNames').textbox("setValue", RoomNames);
                            $('#RoomBuildArea').textbox("setValue", RoomBuildArea);
                            $('#RoomChargeArea').textbox("setValue", parseFloat(RoomChargeArea).toFixed(4));
                            if (RowsCount.length > 0) {
                                $('#RoomResult').val(JSON.stringify(RowsCount));
                            } else {
                                $('#RoomResult').val("");
                            }

                            //选择房屋后需要加载 保底金额（元）【每个房屋的保底金额之和】 营业提成起提金额（元）【每个房屋的起提金额之和】
                            var TreatyPlaningTypeGuaranteeAmountVal = $('#TreatyPlaningTypeGuaranteeAmount').val();
                            var TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal = $('#TreatyPlaningTypeBusinessRoyaltyRaiseAmount').val();
                            if (isValueNull(TreatyPlaningTypeGuaranteeAmountVal)) {
                                $('#GuaranteeAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeGuaranteeAmountVal) * RowsCount.length).toFixed(2));
                            }
                            if (isValueNull(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal)) {
                                $('#BusinessRoyaltyRaiseAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal) * RowsCount.length).toFixed(2));
                            }
                            $.messager.alert('温馨提示', "房屋删除成功");
                        });
                    }
                }
            }
        ];

        //编辑的行号
        var editIndexForRoom = undefined;
        //*****编辑
        function endEditionForRoom() {
            if (editIndexForRoom == undefined) {
                return true
            }
            if ($('#TableContainerRoom').datagrid('validateRow', editIndexForRoom)) {
                $('#TableContainerRoom').datagrid('endEdit', editIndexForRoom);
                editIndexForRoom = undefined;
                return true;
            } else {
                return false;
            }
        }

        function onClickCellForRoom(Rowindex, field, value) {
            if ($("#AuditStatus").val() != "未启动" && $("#AuditStatus").val() != "已驳回") {
                endEditionForRoom();
                return false;
            }
            $('#TableContainerRoom').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainerRoom').datagrid("getSelected");
            if (endEditionForRoom()) {
                if (field == "RoomChargeArea") {
                    $('#TableContainerRoom').datagrid('beginEdit', Rowindex);
                }
                editIndexForRoom = Rowindex;
            }
        }

        function onAfterEditForRoom(rowIndex, row, changes) {
            var updated = $('#TableContainerRoom').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                $('#TableContainerRoom').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForRoom != undefined) {
                    $("#TableContainerRoom").datagrid('acceptChanges', editIndexForRoom);
                    $('#TableContainerRoom').datagrid('endEdit', editIndexForRoom);
                    var RoomData = $('#TableContainerRoom').datagrid("getRows");
                    //编辑成功后计算 
                    var RoomChargeArea = 0.00; // 计费面积
                    RoomData.forEach((itemRow) => {
                        RoomChargeArea = parseFloat(RoomChargeArea) + parseFloat(itemRow.RoomChargeArea);
                    })
                    $('#RoomChargeArea').textbox("setValue", parseFloat(RoomChargeArea).toFixed(4)); // 计费面积（平米）
                    $('#RoomResult').val(JSON.stringify(RoomData));//保存数据
                }
            }
        }

        function LoadRoomGrid() {
            var Data = [];
            if ($('#RoomResult').val() != "") {
                Data = JSON.parse($('#RoomResult').val());
            }
            if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                RoomToolbar = [];
            }
            $("#TableContainerRoom").datagrid({
                data: Data,
                method: "post",
                nowrap: false,
                fitColumns: true,
                columns: RoomColumn,
                rownumbers: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: true,
                pagination: false,
                width: "100%",
                height: '100%',
                toolbar: RoomToolbar,
                remoteSort: false,
                onClickCell: onClickCellForRoom,
                onAfterEdit: onAfterEditForRoom,
                onLoadSuccess: function (data) {
                }
            });
        }

        /* 附件信息 */
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
            $("#TableContainerFile").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                columns: FileColumn,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: true,
                fit: true,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: '.Filetoolbar',
                rownumbers: true,
                border: false,
                onBeforeLoad: function (param) {
                    param.Class = "Renting_FileAnnex";
                    param.Method = "GetList";
                    param.SortField = "AddTime";
                    param.SortOrder = 1;
                    param.AttachedID = $('#ID').val();
                },
                onLoadSuccess: function (data) {

                }
            });
        }
        //格式化附件样式
        function GetAHtml(url, fileName) {
            var html = "";
            if (url && url != "") {
                html = "<a target=\"_blank\" id=\"11831617369\" style=\"text-decoration:none;\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + fileName + "</a>";
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
                formData.append('DicName', "Renting_RentalContract");
                $.ajax({
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
            $.dataPostJson('Renting_FileAnnex', 'Save', parameterStr, true, false,
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
            $.dataPostJson('Renting_FileAnnex', 'Del', { "idList": idList }, true, false,
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


        //页面数据验证
        function ClientClick(ID) {
            //启用页面控件 保存时才能获取数据
            let IsValidate = "";
            let ContractSignParameter = {
                ID: $('#ID').val(),
                ContractSign: $('#ContractSign').textbox("getValue"),
                CommID: $('#CommID').val(),
                CommName: $('#CommName').textbox("getValue")
            };
            //验证合同编号是否重复
            $.dataPostJson('Renting_RentalContract', 'ValidateContractSign', ContractSignParameter, true, false,
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

            //获取合同其他信息 OtherTableResult
            let UserInput = [];
            $(".UserInput").each(function () {
                var UserItem = {
                    ContractFieldSetID: $(this).attr("id"),
                    FieldValue: $(this).val()
                }
                UserInput.push(UserItem);
            });
            $('#OtherTableResult').val(JSON.stringify(UserInput));

            /* 房屋信息 */
            //先结束一次编辑
            endEditionForRoom();
            let RoomResultData = $("#TableContainerRoom").datagrid("getRows");
            if (RoomResultData.length > 0) {
                $('#RoomResult').val(JSON.stringify(RoomResultData));
            } else {
                $('#RoomResult').val("");
            }

            for (var i = 0; i < RoomResultData.length; i++) {
                if (!isValueNull(RoomResultData[i]["RoomChargeArea"])) {
                    $.messager.alert('温馨提示', "房屋【" + RowsCount[i]["RoomName"] + "】的计租面积不能为空！");
                    return false;
                }
            }
            //判断是否同时存在房屋和租赁开始结束时间
            let RentBeginTime = $('#RentBeginTime').datebox("getValue");
            let RentEndTime = $('#RentEndTime').textbox("getValue");
            if (RoomResultData.length > 0 && RentBeginTime != "" && RentEndTime != "") {
                //同时存在数据时需要验证 【与审批中、已通过的认租、新签、续签、变更合同中相同房屋的租赁时间不得重叠】
                let ValidateParameter = {
                    ID: $('#ID').val(),
                    RoomData: $('#RoomResult').val()
                };
                $.dataPostJson('Renting_RentalContract', 'ValidateContractRoom', ValidateParameter, true, false,
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
            }

            $('#frmForm input').attr("disabled", false);
            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            //判断必须要有合同类别
            if ($('#ContractType').val() == "") {
                $.messager.alert('温馨提示', "请选择合同类别");
                return;
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            var parameter = {
                ContractType: $('#ContractType').val(),
                AuditType: "认租签约"
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
                $.messager.alert('温馨提示', "请设置对应认租签约的审核流程");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=1260&biaoshi=1&random=" + Math.random();
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
                var IsDisabled = "";
                if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                    IsDisabled = "disabled='disabled'";
                }
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
                        "<input id='" + ItemRow.ContractFieldSetID + "' name='" + ItemRow.ContractFieldSetID + "' " + IsDisabled + " value='" + ItemRow.FieldValue + "' class='" + ClassName + " UserInput' sdata-options='" + Options + "' /> </div></div>");
                });
                $.parser.parse(".OtherTable")//重新渲染，参数为要渲染的容器
            }
        }


        $(function () {
            //初始化页面高度
            InitTableHeight();

            //附件信息
            $('#uploadFile').filebox({
                onChange: function (newValue, oldValue) {
                    if (newValue != undefined && newValue != null && newValue != "") {
                        var s = newValue.lastIndexOf("\\");
                        var e = newValue.lastIndexOf(".");
                        var fileName = newValue.substring(s + 1, e);//文件名不带后缀
                        $("#FileName").textbox("setValue", fileName);
                    }
                }
            });

            //称谓切换
            var OldSelectValue = -1;
            //出租方
            $('.easyui-radiobutton[radiobuttonname="Leaser"]').radiobutton({
                onChange: function (checked) {
                    if (!checked) {
                        OldSelectValue = $(this).val();
                    }
                    if (checked) {
                        $('#LeaserCall').val($(this).val());
                        RadioButtonSelect("Tenantry");
                    }
                }
            });
            //承租方
            $('.easyui-radiobutton[radiobuttonname="Tenantry"]').radiobutton({
                onChange: function (checked) {
                    if (!checked) {
                        OldSelectValue = $(this).val();
                    }
                    if (checked) {
                        $('#TenantryCall').val($(this).val());
                        RadioButtonSelect("Leaser");
                    }
                }
            });
            function RadioButtonSelect(Name) {
                if (OldSelectValue == -1) {
                    return;
                }
                $(".easyui-radiobutton[radiobuttonname=" + Name + "]").each(function () {
                    if ($(this).val() == OldSelectValue) {
                        $(this).radiobutton("check");
                        OldSelectValue = -1;
                        return;
                    }
                });
            }
            //加载称谓
            if ($('#LeaserCall').val() != "") {
                OldSelectValue = $('#LeaserCall').val();
                RadioButtonSelect("Leaser");
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

            //判断状态 是否是需要禁用控件
            if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                $(".easyui-radiobutton").radiobutton({ disabled: true });
                $(".easyui-checkbox").checkbox({ disabled: true });
                $(".easyui-numberbox").numberbox({ disabled: true });
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
                    if (ClientClick($(this).attr("id"))) {
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
