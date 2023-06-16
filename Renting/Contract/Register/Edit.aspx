<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Contract.Register.Edit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="/HM/M_Main/UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="/HM/M_Main/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-合同登记编辑页面</title>
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

        .fixed-breadcrumb-top {
            top: 36px;
            right: 20px;
            position: fixed;
            z-index: 2;
        }

        .active {
            cursor: pointer;
        }
    </style>
</head>
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <form id="frmForm" class="form-horizontal" role="form" runat="server" style="padding: 0px;">
        <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
            <div id="tab0" data-issel="true" title="合同登记信息" style="overflow: auto; padding: 10px;">
                <div class=" fixed-breadcrumb-top" style="">
                    <ul class="breadcrumb">
                        <li class="active" data-flag="concise">简洁模式</li>
                        <li class="active" data-flag="complete">完整模式</li>
                    </ul>
                </div>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">合同基本信息</legend>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">项目名称</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">合同类型</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
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
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">签约类型</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="SigningType" name="SigningType" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">出租方信息(称谓：
                        <input class="easyui-radiobutton" id="Leaser0" name="Leaser"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left',checked:true" />
                        <input class="easyui-radiobutton" id="Leaser1" name="Leaser"
                            data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left'" />
                        <input class="easyui-radiobutton" id="Leaser2" name="Leaser"
                            data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left'" />
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
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">证件名称</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="LeaserPaperName" name="LeaserPaperName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
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
                    <div class="form-group IsHideClass">
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
                        <input class="easyui-radiobutton" id="Tenantry2" name="Tenantry"
                            data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left'" />
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
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">证件名称</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="TenantryPaperName" name="TenantryPaperName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
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
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">法定代表人</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
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
                    <div class="form-group IsHideClass">
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
                    <legend class="frame-legend">管理方信息(称谓：
                        <input class="easyui-radiobutton" id="Manage0" name="Manage"
                            data-options="value:'0',label:'甲方',labelPosition:'after',labelAlign:'left'" />
                        <input class="easyui-radiobutton" id="Manage1" name="Manage"
                            data-options="value:'1',label:'乙方',labelPosition:'after',labelAlign:'left'" />
                        <input class="easyui-radiobutton" id="Manage2" name="Manage"
                            data-options="value:'2',label:'丙方',labelPosition:'after',labelAlign:'left',checked:true" />
                        )</legend>
                    <input type="hidden" id="ManageCall" name="ManageCall" value="2" runat="server" />
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">管理方名称</label>
                        <div class="col-sm-7 col-xs-7">
                            <input id="ManageName" name="ManageName" class="easyui-textbox"
                                data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'93%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelManage();}"
                                runat="server" />
                            <input type="hidden" id="ManageID" name="ManageID" runat="server" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">证件名称</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="ManagePaperName" name="ManagePaperName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
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
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ManageLegalPeople" name="ManageLegalPeople" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ManageConnectpeople" name="ManageConnectpeople" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">联系电话</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ManageConnectTel" name="ManageConnectTel" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                    </div>
                </fieldset>
                <fieldset class="frame-fieldset">
                    <legend class="frame-legend">合同计费信息</legend>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">合同开始时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractBeginTime" name="ContractBeginTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:true,onChange:ContractBeginTimeChange" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">合同结束时间</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="ContractEndTime" name="ContractEndTime" class="easyui-datebox" runat="server" 
                                data-options="editable:false,required:true,onChange:ContractEndTimeChange"/>
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">合同期限(月)</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="ContractPeriod" name="ContractPeriod" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass" style="line-height: normal;">
                            优惠免租<br />
                            结束时间</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="RentFreeEndTime" name="RentFreeEndTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:false,onChange:RentFreeEndTimeChange" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">优惠原因</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="RentFreeReason" name="RentFreeReason" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                            合同到期<br />
                            提醒时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractRemindOfExpiraTimetion" name="ContractRemindOfExpiraTimetion" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:false" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label " style="line-height: normal;">
                            顺延起租<br />
                            开始时间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="PostPoneBeginTime" name="PostPoneBeginTime" class="easyui-datebox" runat="server"
                                data-options="editable:false,required:false,onChange:PostPoneBeginTimeChange" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">顺延原因</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="PostPoneReason" name="PostPoneReason" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomNames" name="RoomNames" class="easyui-textbox"
                                data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',multiline:true,required:true,
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
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">房屋地址</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomAddr" name="RoomAddr" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">房屋描述</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomDis" name="RoomDis" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">房屋用途</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="RoomPurpose" name="RoomPurpose" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">建筑面积(平米)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="RoomBuildArea" name="RoomBuildArea" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">计费面积(平米)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="RoomChargeArea" name="RoomChargeArea" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
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
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">计费标准(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ChargeStandard" name="ChargeStandard" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">计费标准单位</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ChargeUnit" name="ChargeUnit" class="easyui-textbox" runat="server" data-options="disabled:true" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <div class="col-sm-12 col-xs-12">
                            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="BtnOpenOrClose">更多标准展开/折叠</a>
                        </div>
                    </div>
                    <div class="form-group CostStandard IsHideClass">
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
                    <div class="form-group CostStandard IsHideClass">
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
                    <div class="form-group CostStandard IsHideClass">
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
                    <div class="form-group CostStandard IsHideClass">
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
                    <div class="form-group CostStandard IsHideClass">
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
                    <div class="form-group CostStandard IsHideClass">
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
                    <div class="form-group IsHideClass">
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
                    <div class="form-group IsHideClass">
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
                            <input type="text" id="LastContractTotalPrice" name="LastContractTotalPrice" class="easyui-numberbox"
                                data-options="tipPosition:'bottom',required:false,min:0,precision:2" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">合同保证金(元)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractDepositPrice" name="ContractDepositPrice" class="easyui-textbox" runat="server"
                                data-options="tipPosition:'bottom',required:false,disabled:true" />
                            <!-- 合约类型对应的合同保证金(单个房屋对应的合同保证金) -->
                            <input type="hidden" id="TreatyPlaningTypeContractDepositPrice" name="TreatyPlaningTypeContractDepositPrice" runat="server" />
                            <input type="hidden" id="RentCostItemID" name="RentCostItemID" runat="server" /><!-- 租金费项 -->
                            <input type="hidden" id="DepositCostItemID" name="DepositCostItemID" runat="server" /><!-- 保证金费项 -->
                            <input type="hidden" id="ContractDelinAmountStandard" name="ContractDelinAmountStandard" runat="server" /><!-- 合同违约金标准(小数/天) -->
                            <input type="hidden" id="ContractDelinBeginDay" name="ContractDelinBeginDay" runat="server" /><!-- 合同违约金起计时间 日 -->
                            <input type="hidden" id="ContractDelinBeginMonth" name="ContractDelinBeginMonth" runat="server" /><!-- 合同违约金起计时间 月 -->
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">合同保证金描述</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContractDepositDis" name="ContractDepositDis" class="easyui-textbox" runat="server" data-options="required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label">计费期间</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ChargingMode" name="ChargingMode" class="easyui-textbox" data-options="disabled:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">计费周期(月)</label>
                        <div class="col-sm-3 col-xs-3">
                            <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-textbox" data-options="disabled:true" runat="server" />
                        </div>
                        <div class="col-sm-4 col-xs-4">
                            <input class="easyui-checkbox" id="IsContinuityChargingName" name="IsContinuityChargingName" data-options="label:'按对时按每月单价计算时,多个期间不同单价,是否连续计费?',labelWidth:320,labelPosition:'after',labelAlign:'left'" runat="server" />
                            <input type="hidden" id="IsContinuityCharging" name="IsContinuityCharging" value="0" runat="server" />
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
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">合同范本来源</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="ModelContractSource" name="ModelContractSource" class="easyui-textbox" runat="server" data-options="required:false,tipPosition:'bottom'" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">范本修改内容</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="ModelUpdateContent" name="ModelUpdateContent" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">合同内容提要</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="ContractDescribe" name="ContractDescribe" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">合同内容描述</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="ContractDis" name="ContractDis" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
                        <label class="col-sm-1 col-xs-1 control-label">备注</label>
                        <div class="col-sm-11 col-xs-11">
                            <input id="Remark" name="Remark" class="easyui-textbox"
                                data-options="required:false,tipPosition:'bottom',width:'95%',height:'50px',multiline:true" runat="server" />
                        </div>
                    </div>
                    <div class="form-group IsHideClass">
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
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">签约时间</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input type="text" id="SignUpTime" name="SignUpTime" class="easyui-datebox" runat="server" data-options="editable:false,required:false" />
                        </div>
                        <label class="col-sm-1 col-xs-1 control-label IsHideClass">签约地点</label>
                        <div class="col-sm-3 col-xs-3 IsHideClass">
                            <input id="SignUpAddress" name="SignUpAddress" class="easyui-textbox" runat="server" data-options="required:false,tipPosition:'bottom'" />
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
                    <input class="button" id="BtnPrint" type="button" value="打印"  runat="server" />
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
            <div id="tab2" data-issel="false" title="合同变更信息" style="overflow: hidden;">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainerChange"></div>
            </div>
            <div id="tab3" data-issel="false" title=" 合同提成信息" style="overflow: hidden;">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainerRoyalty"></div>
            </div>
            <div id="tab4" data-issel="false" title="客户档案信息" style="overflow: auto;">
                <div class="Content" id="Information" style="overflow: auto; padding: 10px;">
                    <fieldset class="frame-fieldset">
                        <legend class="frame-legend">客户信息</legend>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="CustName" name="CustName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">出入证号</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="PassSign" name="PassSign" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">证件名称</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="PaperName" name="PaperName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="PaperCode" name="PaperCode" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="CustTypeName" name="CustTypeName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">固定电话</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="FixedTel" name="FixedTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">移动电话</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="MobilePhone" name="MobilePhone" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">传真电话</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="FaxTel" name="FaxTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">联系地址</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Address" name="Address" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">邮政编码</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="PostCode" name="PostCode" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">收 件 人</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Recipient" name="Recipient" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">电子邮件</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="EMail" name="EMail" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Linkman" name="Linkman" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="LinkmanTel" name="LinkmanTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">登录账号</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="InquireAccount" name="InquireAccount" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                            <div class="col-sm-2 col-xs-2">
                                <input id="IsUnit1" value="0" checked type="radio" name="IsUnit" style="width: 16px;" runat="server" disabled="disabled">个人客户
                                 <input id="IsUnit2" value="1" type="radio" name="IsUnit" runat="server" style="width: 16px;" disabled="disabled">单位客户
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="frame-fieldset">
                        <legend class="frame-legend">个人客户信息</legend>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">姓</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Surname" name="Surname" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">名字</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Name" name="Name" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">性别</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Sex" name="Sex" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">国籍</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Nationality" name="Nationality" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">出生日期</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Birthday" name="Birthday" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">工作单位</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="WorkUnit" name="WorkUnit" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">兴趣爱好</label>
                            <div class="col-sm-5 col-xs-5">
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="frame-fieldset">
                        <legend class="frame-legend">单位客户信息</legend>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="LegalRepr" name="LegalRepr" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">法定代表人电话</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="LegalReprTel" name="LegalReprTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">负责人</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="Charge" name="Charge" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">负责人电话</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="ChargeTel" name="ChargeTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="frame-fieldset">
                        <legend class="frame-legend">纳税主体信息</legend>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">名称</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="VATName" name="VATName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">纳税人识别号</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="VATNumber" name="VATNumber" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">地址、电话</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="VATAddLinkTel" name="VATAddLinkTel" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">开户行及帐号</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="frame-fieldset">
                        <legend class="frame-legend">银行代收信息</legend>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">银行名称</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="BankName" name="BankName" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">银行户名</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="BankIDs" name="BankIDs" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">银行账号</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="BankAccount" name="BankAccount" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">确认银行账号</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="BankAccountTwo" name="BankAccountTwo" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 col-xs-1 control-label">代收协议编号</label>
                            <div class="col-sm-2 col-xs-2">
                                <input type="text" id="BankAgreement" name="BankAgreement" runat="server" data-options="disabled:true,width:'100%'" class="easyui-textbox" />
                            </div>
                            <label class="col-sm-1 col-xs-1 control-label">备注</label>
                            <div class="col-sm-8 col-xs-8">
                                <input type="text" id="Memo" name="Memo" runat="server" data-options="disabled:true,width:'100%',height:'40px',multiline:true" class="easyui-textbox" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div id="tab5" data-issel="false" title="客户合同信息" style="overflow: hidden;">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainerOther"></div>
            </div>
        </div>
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server">
        <input type="hidden" id="CommID" name="CommID" runat="server">
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <input type="hidden" id="ID" name="ID" runat="server">
        <input type="hidden" id="ContID" name="ContID" runat="server">
        <input type="hidden" id="RentalContractID" name="RentalContractID" runat="server"><!-- 认租协议ID -->
        <input type="hidden" id="RoomResult" name="RoomResult" runat="server">
        <input type="hidden" id="SettingResult" name="SettingResult" runat="server">

        <input type="hidden" id="OtherTableResult" name="OtherTableResult" runat="server">
        <input type="hidden" id="AuditStatus" name="AuditStatus" value="未启动" runat="server" />
        <input type="hidden" id="ContractChangeType" name="ContractChangeType" runat="server">
        <input type="hidden" id="IsRentOut" name="IsRentOut" value="否" runat="server" />
    </form>
    <script type="text/javascript">
        //初始化页面控件高度
        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $('#tab').css("height", h + 'px');
            $('#tab0,#tab1,#tab2,#tab3,#tab4,#tab5').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            $('#tabSubItem').tabs({
                onSelect: tabSubItemSelect
            });
            $('#tabSubItem0,#tabSubItem1,#tabSubItem2,tabSubItem3').css("width", w - 41 + "px");
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
                } else if (index == 2) {
                    //合同变更信息
                    setTimeout(function () {
                        LoadChangeGrid();
                    }, 300);
                } else if (index == 3) {
                    //合同提成信息
                    setTimeout(function () {
                        LoadRoyaltyGrid();
                    }, 300);
                } else if (index == 4) {
                    //客户档案信息
                    setTimeout(function () {
                        LoadContractCustInformation();
                    }, 300);
                } else if (index == 5) {
                    //客户合同信息 其他合同信息
                    setTimeout(function () {
                        LoadOtherGrid();
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

                    //合同保证金
                    $('#ContractDepositPrice').textbox("setValue", "");
                    $('#TreatyPlaningTypeContractDepositPrice').val(data.ContractDepositPrice);
                    //租金费项
                    $("#RentCostItemID").val(data.RentCostItemID);
                    //保证金费项
                    $("#DepositCostItemID").val(data.DepositCostItemID);
                    //合同违约金标准(小数 / 天)
                    $("#ContractDelinAmountStandard").val(data.ContractDelinAmountStandard);
                    //合同违约金起计时间 日
                    $("#ContractDelinBeginDay").val(data.ContractDelinBeginDay);
                    //合同违约金起计时间 月
                    $("#ContractDelinBeginMonth").val(data.ContractDelinBeginMonth);


                    /* 清空房屋选择 */
                    $('#RoomNames').textbox("setValue", "");
                    $('#RoomIDs').val("");
                    //清空房屋列表
                    $('#RoomResult').val('');

                    //判断合同子表信息是否是选择的是第一个 
                    if ($('#tabSubItem').tabs()) {
                        var ItemTabSelected = $('#tabSubItem').tabs('getSelected');
                        var ItemTabSelectIndex = $('#tabSubItem').tabs('getTabIndex', ItemTabSelected);
                        if (ItemTabSelectIndex == 0) {
                            LoadRoomGrid();
                        } else {
                            var ItemTabSet = $('#tabSubItem').tabs('getTab', 0);
                            ItemTabSet.data("issel", false);
                        }
                    }

                    //清空建筑面积 计费面积
                    $('#RoomBuildArea').textbox("setValue", ""); // 建筑面积（平米）
                    $('#RoomChargeArea').textbox("setValue", ""); // 计费面积（平米）

                    /* 清空计费标准 */
                    $('#SettingResult').val('');
                    if ($('#tabSubItem').tabs()) {
                        var ItemTabSelected = $('#tabSubItem').tabs('getSelected');
                        var ItemTabSelectIndex = $('#tabSubItem').tabs('getTabIndex', ItemTabSelected);
                        if (ItemTabSelectIndex == 1) {
                            LoadSettingGrid();
                        } else {
                            var ItemTabSet = $('#tabSubItem').tabs('getTab', 1);
                            ItemTabSet.data("issel", false);
                        }
                    }

                    //判断是否存在合同开始时间 如果存在重新计算合同结束
                    var ContractBeginTime = $('#ContractBeginTime').datebox("getValue");
                    if (ContractBeginTime != "") {
                        ContractBeginTime = AddTiming(new Date(ContractBeginTime), data.ContractPeriod);
                        $('#ContractEndTime').datebox("setValue", $.dateFormat(ContractBeginTime, 'yyyy-MM-dd'));
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

        //选择管理方
        function SelManage() {
            var param = { "UnitType": "管理方" };
            LayerDialog.OpenWin('580', '400', '/HM/M_Main/Renting/Dialog/SignUnitSelect.aspx?' + $.param(param), "选择管理方", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#ManageID").val(data.ID);
                    $("#ManageName").textbox("setValue", data.UnitName);
                    $("#ManagePaperName").textbox("setValue", data.UnitPaperName);
                    $("#ManagePaperCode").textbox("setValue", data.UnitPaperCode);
                    $("#ManageRegAddr").textbox("setValue", data.UnitRegAddr);
                    $("#ManagePostCode").textbox("setValue", data.UnitPostCode);
                    $("#ManageLegalPeople").textbox("setValue", data.UnitLegalPeople);
                    $("#ManageConnectpeople").textbox("setValue", data.UnitConnectpeople);
                    $("#ManageConnectTel").textbox("setValue", data.UnitConnectTel);
                }
            });
        }

        //合同开始时间变更
        function ContractBeginTimeChange(date) {
            //判断是否存在 合同期限(月)
            var ContractPeriod = $('#ContractPeriod').textbox("getValue");
            if (ContractPeriod != "") {
                date = AddTiming(new Date(date), ContractPeriod);
                $('#ContractEndTime').datebox("setValue", $.dateFormat(date, 'yyyy-MM-dd'));
                $('#ContractRemindOfExpiraTimetion').datebox("setValue", $.dateFormat(date, 'yyyy-MM-dd'));
            } else {
                $('#ContractEndTime').datebox("setValue", "");
            }
            //判断 优惠免租结束时间
            if ($('#RentFreeEndTime').datebox("getValue") != "" && date != "") {
                if ((new Date(date)) >= (new Date($('#RentFreeEndTime').datebox("getValue")))) {
                    var RentFreeEndTime = AddDate(new Date(date), 1);
                    $('#RentFreeEndTime').datebox("setValue", $.dateFormat(RentFreeEndTime, 'yyyy-MM-dd'));
                }
            }
            //判断 优惠免租结束时间
            if ($('#PostPoneBeginTime').datebox("getValue") != "" && date != "") {
                if ((new Date(date)) >= (new Date($('#PostPoneBeginTime').datebox("getValue")))) {
                    var PostPoneBeginTime = AddDate(new Date(date), 1);
                    $('#PostPoneBeginTime').datebox("setValue", $.dateFormat(PostPoneBeginTime, 'yyyy-MM-dd'));
                }
            }
            //判断是否存在房屋数据  如果存在房屋数据需要刷新房屋的租赁开始结束时间
            var OldRoomGridData = [];
            if ($('#RoomResult').val() != "") {
                OldRoomGridData = $.parseJSON($('#RoomResult').val());
                OldRoomGridData.forEach((itemRow) => {
                    itemRow.RentBeginTime = $('#ContractBeginTime').datebox("getValue");
                    itemRow.RentEndTime = $('#ContractEndTime').datebox("getValue");
                });

                $('#RoomResult').val(JSON.stringify(OldRoomGridData));
                LoadRoomGrid();
            }
        }

        //合同结束时间变更
        function ContractEndTimeChange(date) {
            //获取开始
            var BeginTime = $('#ContractBeginTime').datebox("getValue");
            //获取结束时间
            var EndTime = $('#ContractEndTime').datebox("getValue");

            if (EndTime != "" && BeginTime != "") {
                //判断是否存在房屋数据  如果存在房屋数据需要刷新房屋的租赁开始结束时间
                var OldRoomGridData = [];
                if ($('#RoomResult').val() != "") {
                    OldRoomGridData = $.parseJSON($('#RoomResult').val());
                    OldRoomGridData.forEach((itemRow) => {
                        itemRow.RentBeginTime = $('#ContractBeginTime').datebox("getValue");
                        itemRow.RentEndTime = $('#ContractEndTime').datebox("getValue");
                    });

                    $('#RoomResult').val(JSON.stringify(OldRoomGridData));
                    LoadRoomGrid();
                }
            }
        }

        //优惠免租结束时间选择
        function RentFreeEndTimeChange(date) {
            var ContractBeginTime = $('#ContractBeginTime').datebox("getValue");
            if (ContractBeginTime != "") {
                if ((new Date(ContractBeginTime)) >= (new Date($('#RentFreeEndTime').datebox("getValue")))) {
                    var RentFreeEndTime = AddDate(new Date(ContractBeginTime), 1);
                    $('#RentFreeEndTime').datebox("setValue", $.dateFormat(RentFreeEndTime, 'yyyy-MM-dd'));
                }
            }
        }

        //顺延起租开始时间选择
        function PostPoneBeginTimeChange(date) {
            var ContractBeginTime = $('#ContractBeginTime').datebox("getValue");
            if (ContractBeginTime != "") {
                if ((new Date(ContractBeginTime)) >= (new Date($('#PostPoneBeginTime').datebox("getValue")))) {
                    var PostPoneBeginTime = AddDate(new Date(ContractBeginTime), 1);
                    $('#PostPoneBeginTime').datebox("setValue", $.dateFormat(PostPoneBeginTime, 'yyyy-MM-dd'));
                }
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
            if (parseInt(Month) == 12 && AddMonth % 12 == 0) {
                Month = parseInt(Month) + parseInt(AddMonth);
                IntervalYear = parseInt(Month / 12) - 1;
            } else {
                Month = parseInt(Month) + parseInt(AddMonth);
                IntervalYear = parseInt(Month / 12);
            }

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
            //续签时不允许重新选择 房屋
            if ($('#SigningType').textbox("getValue") == "续签") {
                return;
            }
            //判断是否已选择合约类型
            let TreatyPlaningType = $('#TreatyPlaningType').val();
            if (!isValueNull(TreatyPlaningType)) {
                $.messager.alert('温馨提示', "请选择合约类型！");
                return;
            }
            let param = { "TreatyPlaningType": TreatyPlaningType, "RoomIDs": $('#RoomIDs').val() };
            LayerDialog.OpenWin('1000', '650', '/HM/M_Main/Renting/Dialog/RoomSelectWithTreatyPlaningType.aspx?' + $.param(param), "选择合约房屋", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    //已选择的房屋列表数据
                    let OldRoomGridData = [];
                    if ($('#RoomResult').val() != "") {
                        OldRoomGridData = $.parseJSON($('#RoomResult').val());
                    }
                    let NewRoomGridData = [];
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
                            NewRoomGridData.push(ItemNode[0]);
                        } else {
                            NewRoomGridData.push({
                                ID: "",
                                ContractID: $('#ID').val(),
                                ContID: $('#ContID').val(),
                                CommID: $('#CommID').val(),
                                RoomID: String(ItemRow.RoomID),
                                RoomName: ItemRow.RoomName,
                                RoomSign: ItemRow.RoomSign,
                                BuildArea: ItemRow.BuildArea,
                                RoomChargeArea: ItemRow.BuildArea,
                                ChargeStandard: ItemRow.ChargeStandard,
                                RentCostItemID: ItemRow.RentCostItemID,
                                RentCostItemName: ItemRow.RentCostItemName,
                                RentBeginTime: $('#ContractBeginTime').datebox("getValue"),
                                RentEndTime: $('#ContractEndTime').datebox("getValue"),
                                RentFreeEndTime: $("#RentFreeEndTime").datebox("getValue"),
                                PostPoneBeginTime: $("#PostPoneBeginTime").datebox("getValue"),
                                CheckInTime: "",
                                RentOutTime: ""
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
                    if (NewRoomGridData.length > 0) {
                        $('#RoomResult').val(JSON.stringify(NewRoomGridData));
                    } else {
                        $('#RoomResult').val("");
                    }
                    LoadRoomGrid();
                    //选择房屋后需要加载 保底金额（元）【每个房屋的保底金额之和】 营业提成起提金额（元）【每个房屋的起提金额之和】 合同保证金 【每个房屋的合同保证金之和】
                    var TreatyPlaningTypeGuaranteeAmountVal = $('#TreatyPlaningTypeGuaranteeAmount').val();
                    var TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal = $('#TreatyPlaningTypeBusinessRoyaltyRaiseAmount').val();
                    var TreatyPlaningTypeContractDepositPriceVal = $('#TreatyPlaningTypeContractDepositPrice').val();
                    if (isValueNull(TreatyPlaningTypeGuaranteeAmountVal)) {
                        $('#GuaranteeAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeGuaranteeAmountVal) * NewRoomGridData.length).toFixed(2));
                    }
                    if (isValueNull(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal)) {
                        $('#BusinessRoyaltyRaiseAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal) * NewRoomGridData.length).toFixed(2));
                    }
                    if (isValueNull(TreatyPlaningTypeContractDepositPriceVal)) {
                        $('#ContractDepositPrice').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeContractDepositPriceVal) * NewRoomGridData.length).toFixed(2));
                    }

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
                formData.append('DicName', "Renting_Contract");
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

        /* 合同变更 */
        var ChangeColumn = [[
            { field: 'CommName', title: '项目名称', width: 140, align: 'center' },
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomNames', title: '房屋编号', width: 180, align: 'center', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            {
                field: 'ContractSign', title: '合同编号', width: 160, align: 'center', formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"ChangeDetail('edit','" + row.ID + "')\" href=\"javascript:void(0);\">" + value + "</a>";
                    return str;
                }
            },
            { field: 'ContractName', title: '合同名称', width: 160, align: 'center' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractChangeType', title: '变更类型', width: '100', align: 'center' },
            { field: 'WorkStartUserName', title: '发起人', width: '100', align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: '150', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: '100', align: 'center' },
            {
                field: 'ID', title: '变更前合同', width: '100', align: 'center', formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"ContractHistoryView('" + row.ID + "')\" href=\"javascript:void(0);\">查看历史</a>";
                    return str;
                }
            }
        ]];
        var ChangeToolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    //判断是否存在审核中和未启动数据
                    $.dataPostJson('Renting_ContractChange', 'ContractChangeAddValidate', { "ContractID": $('#ID').val() }, true, false,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                ChangeDetail("add", '');
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerChange").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert('温馨提示', '请选择需要删除的租赁合同变更数据!');
                        return;
                    }
                    if (row.AuditStatus == "已审核" || row.AuditStatus == "审核中") {
                        $.messager.alert('温馨提示', '当前租赁合同变更不允许删除!');
                        return;
                    }
                    $.messager.confirm('温馨提示', '确定删除选择的租赁合同变更数据?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_ContractChange', 'DelContractChange', { "idList": row.ID, "ContractID": row.ContractID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        $.messager.alert('温馨提示', "删除成功!");
                                        LoadChangeGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }
        ];
        //加载合同变更
        function LoadChangeGrid() {
            if ($('#AuditStatus').val() != "已审核" || $('#IsRentOut').val() == "是" || $('#ContractChangeType').val() == "退租") {
                ChangeToolbar = [];
            }
            $("#TableContainerChange").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                columns: ChangeColumn,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: ChangeToolbar,
                rownumbers: true,
                border: false,
                height: "100%",
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 1;
                    param.Class = "Renting_ContractChange";
                    param.Method = "GetList";
                    param.ContractID = $("#ID").val();
                    param.CommID = $("#CommID").val();
                },
                onLoadSuccess: function (data) {

                }
            });
        }
        //合同变更详情
        function ChangeDetail(OpType, ID) {
            var w = '1200';
            var h = $(window).height();
            var param = { "OpType": OpType, "Id": ID, "ContractID": $('#ID').val() };
            LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Change/Edit.aspx?' + $.param(param), "租赁合同变更详情", false, function callback(_Data) {
                LoadChangeGrid();
            });
        }
        //合同历史
        function ContractHistoryView(ID) {
            var w = '1200';
            var h = $(window).height();
            var param = { "ID": ID };
            LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Change/HistoryDetail.aspx?' + $.param(param), "租赁合同历史详情", false, function callback(_Data) {
            });
        }

        /* 合同提成信息 */
        var RoyaltyColumn = [[
            { field: 'CommName', title: '项目名称', width: 140, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 140, align: 'center' },
            {
                field: 'ChargeCalculation', title: '计费方式', width: 100, align: 'center', formatter: function () {
                    return "营业提成方式";
                }
            },
            {
                field: 'CalculationMethod', title: '计算方式', width: 100, align: 'center', formatter: function (value, row, index) {
                    if (value == "5") {
                        return "按提成";
                    } else if (value == "6") {
                        return "按保底+提成";
                    } else {
                        return "";
                    }
                }
            },
            { field: 'ContPeriod', title: '计费周期(月)', width: '100', align: 'center' },
            { field: 'GuaranteeAmount', title: '保底金额(元)', width: '100', align: 'center' },
            { field: 'BusinessRoyaltyRatio', title: '提成比例(%)', width: '100', align: 'center' },
            { field: 'CustName', title: '客户名称', width: 160, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'CostName', title: '费用项目', width: '180', align: 'center' },
            {
                field: 'BeginDate', title: '开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'EndDate', title: '结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'DueDate', title: '应收时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'BusinessIncome', title: '营业收入(元)', width: '100', align: 'center' },
            { field: 'ReceivableGuaranteeAmount', title: '应收保底金额(元)', width: '120', align: 'center' },
            { field: 'ReceivableRoyaltyAmount', title: '应收提成金额(元)', width: '100', align: 'center' },
            { field: 'Amount', title: '本期应收金额(元)', width: '130', align: 'center' },
            { field: 'WorkStartUserName', title: '发起人', width: '100', align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: '120', align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: '100', align: 'center' }
        ]];
        //加载合同提成信息
        function LoadRoyaltyGrid() {
            $("#TableContainerRoyalty").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                columns: RoyaltyColumn,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: [],
                rownumbers: true,
                border: false,
                height: "100%",
                onBeforeLoad: function (param) {
                    param.SortField = "CommID,AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.Class = "Renting_ContractRoyalty";
                    param.Method = "GetRoyaltyList";
                    param.ContractID = $("#ID").val();
                },
                onLoadSuccess: function (data) {

                }
            });
        }

        /* 客户档案信息 */
        //客户档案信息
        function LoadContractCustInformation() {
            //判断是否选择了租户
            if ($("#TenantryCustID").val() == "") {
                return;
            }
            $.dataPostJson('Renting_Contract', 'GetCustomerDetailInformation', { "CommID": $('#CommID').val(), "CustID": $('#TenantryCustID').val() }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.length > 0) {
                        $('#Information').form('load', data[0]);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        /* 客户合同信息 */
        var OtherColumn = [[
            { field: 'CommName', title: '项目名称', width: 160, align: 'center' },
            { field: 'TenantryCustName', title: '客户名称', width: 120, align: 'center' },
            {
                field: 'RoomNames', title: '房屋编号', width: 180, align: 'center', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 180, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 200, align: 'center' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'ContractTotalPrice', title: '合同总额(元)', width: 100, align: 'center' },
            { field: 'ContractDepositPrice', title: '保证金(元)', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '租金标准(元)', width: 100, align: 'center' },
            { field: 'DutyDepName', title: '机构部门', width: 140, align: 'center' },
            { field: 'DutyUserName', title: '负责人', width: 100, align: 'center' },
            {
                field: 'SignUpTime', title: '签约时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'WorkStartUserName', title: '发起人', width: 100, align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 100, align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 80, align: 'center' },
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]]
        //加载 客户合同信息（其他的合同）
        function LoadOtherGrid() {
            $("#TableContainerOther").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                columns: OtherColumn,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fitColumns: false,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                toolbar: [],
                rownumbers: true,
                border: false,
                height: "100%",
                onBeforeLoad: function (param) {
                    param.SortField = "CommID,AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.Class = "Renting_Contract";
                    param.Method = "GetCustomerOtherContract";
                    param.ContractID = $("#ID").val();
                    param.TenantryCustID = $('#TenantryCustID').val();
                    param.CommID = $('#CommID').val();
                },
                onLoadSuccess: function (data) {

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
            { field: 'ChargeStandard', title: '计费标准', width: 80, align: 'center' },
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
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false,
                        required: false,
                    }
                }
            },
            {
                field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 120, align: 'center', editor: {
                    type: 'datebox',
                    options: {
                        editable: false,
                        required: false,
                    }
                }
            },
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
                        HDialog.Prompt("是否确认删除勾选的房屋数据？", function () {
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

                            //选择房屋后需要加载 1、保底金额（元）【每个房屋的保底金额之和】2、营业提成起提金额（元）【每个房屋的起提金额之和】3、合同保证金 【每个房屋的合同保证金之和】
                            var TreatyPlaningTypeGuaranteeAmountVal = $('#TreatyPlaningTypeGuaranteeAmount').val();
                            var TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal = $('#TreatyPlaningTypeBusinessRoyaltyRaiseAmount').val();
                            var TreatyPlaningTypeContractDepositPriceVal = $('#TreatyPlaningTypeContractDepositPrice').val();
                            if (isValueNull(TreatyPlaningTypeGuaranteeAmountVal)) {
                                $('#GuaranteeAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeGuaranteeAmountVal) * RowsCount.length).toFixed(2));
                            }
                            if (isValueNull(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal)) {
                                $('#BusinessRoyaltyRaiseAmount').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeBusinessRoyaltyRaiseAmountVal) * RowsCount.length).toFixed(2));
                            }
                            if (isValueNull(TreatyPlaningTypeContractDepositPriceVal)) {
                                $('#ContractDepositPrice').textbox("setValue", parseFloat(parseFloat(TreatyPlaningTypeContractDepositPriceVal) * NewRoomGridData.length).toFixed(2));
                            }
                            $.messager.alert('温馨提示', "房屋删除成功");
                        });
                    }
                }
            }, '-',
            {
                text: '<div style="color:blue;">(注意：第一次合同保存之后计费标准会自动生成不用单独添加造成重复计费。)</div>'
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
                if (field == "RoomChargeArea" || field == "RentFreeEndTime" || field == "PostPoneBeginTime") {
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
                fit: true,
                columns: RoomColumn,
                rownumbers: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: false,
                height: '100%',
                toolbar: RoomToolbar,
                remoteSort: false,
                onClickCell: onClickCellForRoom,
                onAfterEdit: onAfterEditForRoom,
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
        var SettingToolbar = [
            {
                text: '新增标准',
                iconCls: 'icon-add',
                handler: function () {
                    ContractSettingDetail("add", '');
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
                    var SettingRows = $('#TableContainerSetting').datagrid("getRows");
                    $('#SettingResult').val(JSON.stringify(SettingRows));
                }
            }, '-',
            {
                text: '更新为连续日期',
                iconCls: 'icon-edit',
                handler: function () {
                    var Rows = $("#TableContainerSetting").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有计费标准需要更新");
                        return;
                    }
                    //判断是否保存了合同
                    if ($('#ContID').val() == "") {
                        $.messager.alert('温馨提示', "请先保存租赁合同数据");
                        return;
                    }
                    $.dataPostJson('Renting_Contract', 'UpdateContractSettingDueDate', { "ContractID": $('#ID').val() }, true, false,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                $.messager.alert("温馨提示", "更新成功!");
                                $('#SettingResult').val(_Data.data);
                                LoadSettingGrid();
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            }, '-',
            {
                text: '<div style="color:blue;">(说明：新增、修改合同标准后，必须先保存合同信息才能计算合同费用、更新标准为连续时间。)</div>'
            }
        ];

        //计费编辑
        function ContractSettingDetail(OpType, ItemRow) {
            //判断是否已选择合约类型
            let TreatyPlaningType = $('#TreatyPlaningType').val();
            if (!isValueNull(TreatyPlaningType)) {
                $.messager.alert('温馨提示', "请先选择合约类型！");
                return;
            }

            if (!isValueNull($("#TenantryCustID").val())) {
                $.messager.alert('温馨提示', "请先选择客户！");
                return;
            }

            //房屋信息数据
            let RoomData = $('#TableContainerRoom').datagrid("getRows");

            if (RoomData.length == 0) {
                $.messager.alert('温馨提示', "请先选择房屋！");
                return;
            }

            //判断如果是新增的话需要默认有些数据   修改就将ItemRow数据放到localStorage中
            let SettingData = {
                ID: '',
                ContractID: $('#ID').val(),
                ContID: $('#ContID').val(),
                CommID: $('#CommID').val(),
                CommName: $('#CommName').textbox("getValue"),
                CustID: $("#TenantryCustID").val(),//客户ID
                CustName: $("#TenantryCustName").textbox("getValue"),
                RoomID: "",
                RoomSign: "",
                BeginDate: "",
                EndDate: "",
                DueDate: "",
                CostID: "",
                CostName: "",
                ChargeCalculation: $('#ChargeCalculation').val(),
                CalculationMethod: $('#CalculationMethod').val(),
                ContPeriod: $('#ContPeriod').textbox("getValue"),//计费周期取页面上的
                ContPrice: "",
                ChargeNumber: '',
                GuaranteeAmount: $('#TreatyPlaningTypeGuaranteeAmount').val(), //保底金额（元/计费周期）  取页面上的
                BusinessRoyaltyRatio: $('#BusinessRoyaltyRatio').textbox("getValue"),//提成比例（%）  取页面上的
                ContractDelinAmountStandard: $('#ContractDelinAmountStandard').val(), //合同违约金标准(小数/天) 取页面上的
                ContractDelinBeginDay: $('#ContractDelinBeginDay').val(),//合同违约金起计时间 日 取页面上的
                ContractDelinBeginMonth: $('#ContractDelinBeginMonth').val()//合同违约金起计时间 月 取页面上的
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
                SettingData.BeginDate = ItemRow.BeginDate;
                SettingData.EndDate = ItemRow.EndDate;
                SettingData.DueDate = ItemRow.DueDate;
                SettingData.CostID = ItemRow.CostID;
                SettingData.CostName = ItemRow.CostName;
                SettingData.ChargeCalculation = ItemRow.ChargeCalculation;
                SettingData.CalculationMethod = ItemRow.CalculationMethod;
                SettingData.ContPeriod = ItemRow.ContPeriod;//计费周期
                SettingData.ContPrice = ItemRow.ContPrice;
                SettingData.ChargeNumber = ItemRow.ChargeNumber;
                SettingData.GuaranteeAmount = ItemRow.GuaranteeAmount; //保底金额（元/计费周期）
                SettingData.BusinessRoyaltyRatio = ItemRow.BusinessRoyaltyRatio; //提成比例（%）
                SettingData.ContractDelinAmountStandard = ItemRow.ContractDelinAmountStandard;
                SettingData.ContractDelinBeginDay = ItemRow.ContractDelinBeginDay;
                SettingData.ContractDelinBeginMonth = ItemRow.ContractDelinBeginMonth;
            }

            let ContractSetting = {
                RoomData: RoomData, //房屋信息 全量信息
                SettingData: SettingData //标准信息
            };
            localStorage.setItem("ContractSetting", JSON.stringify(ContractSetting));
            //let param = { "OpType": OpType, "TempContPrice": $('#ChargeStandard').textbox("getValue") };
            let param = { "OpType": OpType };
            LayerDialog.OpenWin('860', '570', '/HM/M_Main/Renting/Contract/Register/Setting.aspx?' + $.param(param), "合同计费标准设置", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    data.forEach((varObj) => {
                        if (OpType == "add") {
                            //新增
                            $('#TableContainerSetting').datagrid('insertRow', {
                                index: 0,
                                row: {
                                    ID: varObj.ID,
                                    ContractID: $('#ID').val(),
                                    ContID: $('#ContID').val(),
                                    CommID: $('#CommID').val(),
                                    CommName: $('#CommName').textbox("getValue"),
                                    CustID: varObj.CustID,
                                    CustName: varObj.CustName,
                                    RoomID: varObj.RoomID,
                                    RoomSign: varObj.RoomSign,
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
                                    //CommID: varObj.CommID,
                                    //CommName: varObj.CommName,
                                    //CustID: varObj.CustID,
                                    //CustName: varObj.CustName,
                                    RoomID: varObj.RoomID,
                                    RoomSign: varObj.RoomSign,
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
                    });
                    let ContractSettingRows = $('#TableContainerSetting').datagrid("getRows");
                    $('#SettingResult').val(JSON.stringify(ContractSettingRows));
                }
            });
        }
        //加载计费标准
        function LoadSettingGrid() {
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
                if ($('#ContID').val() == "") {
                    $.messager.alert('温馨提示', '请先保存租赁合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '租赁合同处于审核中或者合同已审核!');
                    return;
                }
                //计算费用
                $.dataPostJson('Renting_Contract', 'ContractFeesCalc', { "ContID": $('#ContID').val(), "ContractID": $('#ID').val() }, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert("温馨提示", data.msg);
                            LoadFeesGrid();
                        } else { $.messager.alert("温馨提示", data.msg); }
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
                    $.messager.alert('温馨提示', '请先保存租赁合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '租赁合同处于审核中或者合同已审核!');
                    return;
                }
                var param = {
                    "OPType": "Insert",
                    "SrcType": "2",
                    "LeaseContID": $('#ContID').val(),
                    "CustID": $('#TenantryCustID').val(),
                    "CustName": $('#TenantryCustName').textbox("getValue"),
                    "CommID": $('#CommID').val()
                };
                LayerDialog.OpenWin('900', '500', '/HM/M_Main/ChargesNew/FeesSporadicManage.aspx?' + $.param(param),
                    "新增租赁合同费用", false, function callback(_Data) {
                        if (isValueNull(_Data)) {
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
                    $.messager.alert('温馨提示', '请先保存租赁合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '租赁合同处于审核中或者合同已审核!');
                    return;
                }
                if (IsMerge == "1") {
                    $.messager.alert('温馨提示', '不允许操作合并后的费用信息!');
                    return;
                }
                var SelectedRow = $('#TableContainerContractFees').datagrid("getSelected");
                if (SelectedRow == null) {
                    $.messager.alert('温馨提示', "请选择需要删除的租赁合同费用");
                    return;
                }
                $.dataPostJson('Renting_Contract', 'ContractDeleteOneFees', { "CommID": $('#CommID').val(), "ContID": $('#ContID').val(), "ID": SelectedRow.ID }, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert("温馨提示", "删除成功！");
                            LoadFeesGrid();
                        } else { $.messager.alert("温馨提示", data.msg); }
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
                    $.messager.alert('温馨提示', '请先保存租赁合同!');
                    return;
                }
                if ($('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核中") {
                    $.messager.alert('温馨提示', '租赁合同处于审核中或者合同已审核!');
                    return;
                }

                $.dataPostJson('Renting_Contract', 'ContractDeleteFees', { "CommID": $('#CommID').val(), "ContID": $('#ContID').val() }, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $.messager.alert("温馨提示", "删除成功！");
                            LoadFeesGrid();
                        } else { $.messager.alert("温馨提示", data.msg); }
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
                url: '/HM/M_Main/HC/DataPost.aspx',
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
                    param.Class = "Renting_Contract";
                    param.Method = "GetContractFeesList";
                    param.ContID = $("#ContID").val();
                    param.CommID = $("#CommID").val();
                    param.IsMerge = IsMerge;
                },
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
                    //判断是否已经渲染过了 如果渲染过了就不再渲染
                    $('#IsMerge').checkbox({
                        onChange: IsMergeChange,
                        checked: IsMerge == "1" ? true : false
                    });

                    $('#ContractTotalPrice').textbox("setValue", DueAmount);//加载合同费用
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
            let ContractSignParameter = {
                ID: $('#ID').val(),
                ContractSign: $('#ContractSign').textbox("getValue"),
                CommID: $('#CommID').val(),
                CommName: $('#CommName').textbox("getValue")
            };
            //验证合同编号是否重复
            $.dataPostJson('Renting_Contract', 'ValidateContractSign', ContractSignParameter, true, false,
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
            let ContractBeginTime = $('#ContractBeginTime').datebox("getValue");
            let ContractEndTime = $('#ContractEndTime').datebox("getValue");

            let ContractBeginTimeAddOneDay = AddDate(new Date(ContractBeginTime), 1);
            //先结束一次编辑
            endEditionForRoom();
            let RoomResultData = $("#TableContainerRoom").datagrid("getRows");
            if (RoomResultData.length > 0) {
                $('#RoomResult').val(JSON.stringify(RoomResultData));
            } else {
                $('#RoomResult').val("");
            }

            //验证合同结束时间是否满足合约规划条件
            let BaseEndTime = AddTiming(new Date(ContractBeginTime), $('#ContractPeriod').textbox("getValue"));
            if (new Date(BaseEndTime) > new Date(ContractEndTime)) {
                $.messager.alert('温馨提示', "合同结束时间不允许小于合约规划期限！");
                return false;
            }


            for (var i = 0; i < RoomResultData.length; i++) {
                if (!isValueNull(RoomResultData[i]["RoomChargeArea"])) {
                    $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的计租面积不能为空！");
                    return false;
                }
                if (!isValueNull(RoomResultData[i]["RentBeginTime"])) {
                    $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的租赁开始时间不能为空！");
                    return false;
                }
                if (!isValueNull(RoomResultData[i]["RentEndTime"])) {
                    $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的租赁结束时间不能为空！");
                    return false;
                }

                //判断租赁结束时间是否是小于租赁开始时间
                if ((new Date(RoomResultData[i]["RentEndTime"])) < (new Date(RoomResultData[i]["RentBeginTime"]))) {
                    $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的结束时间不能小于开始时间！");
                    return false;
                }

                //判断是否存在 优惠免租结束时间 并且 ≥租赁开始时间+1，＜租赁结束时间
                if (isValueNull(RoomResultData[i]["RentFreeEndTime"])) {
                    if (new Date(RoomResultData[i]["RentFreeEndTime"]) < new Date(ContractBeginTimeAddOneDay)) {
                        $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的优惠免租结束时间不能小于租赁开始时间+1天！");
                        return false;
                    }
                    if (new Date(RoomResultData[i]["RentFreeEndTime"]) >= new Date(ContractEndTime)) {
                        $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的优惠免租结束时间不能大于租赁结束时间！");
                        return false;
                    }
                }

                //判断是否存在 顺延起租开始时间 并且≥租赁开始时间+1，＜租赁结束时间
                if (isValueNull(RoomResultData[i]["PostPoneBeginTime"])) {
                    if (new Date(RoomResultData[i]["PostPoneBeginTime"]) < new Date(ContractBeginTimeAddOneDay)) {
                        $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的顺延起租开始时间不能小于租赁开始时间+1天！");
                        return false;
                    }
                    if (new Date(RoomResultData[i]["PostPoneBeginTime"]) >= new Date(ContractEndTime)) {
                        $.messager.alert('温馨提示', "房屋【" + RoomResultData[i]["RoomSign"] + "】的顺延起租开始时间不能大于租赁结束时间！");
                        return false;
                    }
                }
            }
            //验证 【合同开始、结束时间作为所选房屋的租赁开始、结束时间，与审批中、已通过的认租、新签、续签、变更合同中相同房屋的租赁时间不得重叠】
            let ValidateParameter = {
                ID: $('#ID').val(),
                RentalContractID: $('#RentalContractID').val(),//认租协议ID
                RoomData: $('#RoomResult').val()
            };
            $.dataPostJson('Renting_Contract', 'ValidateContractRoom', ValidateParameter, true, false,
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

            //送审的时候
            if (ID == "BtnSaveStartWorkFlow") {
                //var SettingResult = $('#SettingResult').val();
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
            let AuditTypeStr = "租赁合同新签";
            let FilterStr = "1261";
            if ($('#SigningType').textbox("getValue") == "续签") {
                AuditTypeStr = "租赁合同续签";
                FilterStr = "1262";
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            var parameter = {
                ContractType: $('#ContractType').val(),
                AuditType: AuditTypeStr
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
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=" + FilterStr + "&biaoshi=1&random=" + Math.random();
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
                        var CurrentValue = $(this).val();
                        $('#LeaserCall').val(CurrentValue);
                        RadioButtonSelect("Tenantry", "Manage", CurrentValue, OldSelectValue);
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
                        var CurrentValue = $(this).val();
                        $('#TenantryCall').val(CurrentValue);
                        RadioButtonSelect("Leaser", "Manage", CurrentValue, OldSelectValue);
                    }
                }
            });
            //管理方
            $('.easyui-radiobutton[radiobuttonname="Manage"]').radiobutton({
                onChange: function (checked) {
                    if (!checked) {
                        OldSelectValue = $(this).val();
                    }
                    if (checked) {
                        var CurrentValue = $(this).val();
                        $('#ManageCall').val(CurrentValue);
                        RadioButtonSelect("Leaser", "Tenantry", CurrentValue, OldSelectValue);
                    }
                }
            });
            function RadioButtonSelect(Name1, Name2, CurrentValue, OldSelectValue) {
                var BuyerCurrentValue = $("input[name='" + Name1 + "']:checked").val();
                if (CurrentValue == BuyerCurrentValue) {
                    $("input[radiobuttonname='" + Name1 + "']").each(function () {
                        if ($(this).val() == OldSelectValue) {
                            $(this).radiobutton({ checked: true });
                            $("#" + Name1 + "Call").val(OldSelectValue);
                            OldSelectValue = -1;
                            return;
                        }
                    })
                }
                if (OldSelectValue == -1) {
                    return;
                }
                var ManageCurrentValue = $("input[name='" + Name2 + "']:checked").val();
                if (CurrentValue == ManageCurrentValue) {
                    $("input[radiobuttonname='" + Name2 + "']").each(function () {
                        if ($(this).val() == OldSelectValue) {
                            $(this).radiobutton({ checked: true });
                            $("#" + Name2 + "Call").val(OldSelectValue);
                            OldSelectValue = -1;
                            return;
                        }
                    });
                }
            }

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
            $('#BtnPrint').click(function () {
                window.open("/HM/M_Main/Renting/Contract/Print/RentingContractPrint.html?ID="+$('#ID').val());
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

            $('.breadcrumb .active').click(function () {
                var Flag = $(this).data("flag");
                if (Flag == "concise") {
                    $(".IsHideClass").hide();
                    //if ($(".IsHideClass").is(':visible')) {
                    //    $(".IsHideClass").hide();
                    //} else {
                    //    $(".IsHideClass").show();
                    //}
                } else {
                    $(".IsHideClass").show();
                }
            });
        });
    </script>
</body>
</html>
