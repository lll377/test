<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Contract.Handle.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同-合同办理</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />

    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <style type="text/css">
        .tabs-header {
            background-color: white;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: auto;">
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
        <div id="tab0" data-issel="true" title="待入住" style="overflow: hidden;">
            <div id="TableContainerWait" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab1" data-issel="false" title="已入住" style="overflow: hidden;">
            <div id="TableContainerComplete" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab2" data-issel="false" title="待退租" style="overflow: hidden;">
            <div id="TableContainerWaitExist" style="background-color: #cccccc;"></div>
        </div>
        <div id="tab3" data-issel="false" title="已退租" style="overflow: hidden;">
            <div id="TableContainerCompleteExist" style="background-color: #cccccc;"></div>
        </div>
    </div>
    <!-- 待入住 -->
    <div id="dlg_Wait" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formWait" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">待入住房屋查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryCustName1" name="TenantryCustName1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RoomSign1" name="RoomSign1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractName1" name="ContractName1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractSign1" name="ContractSign1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectpeople1" name="TenantryConnectpeople1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectTel1" name="TenantryConnectTel1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">租赁开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentBeginTime1" name="StartRentBeginTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentBeginTime1" name="EndRentBeginTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">租赁结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentEndTime1" name="StartRentEndTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentEndTime1" name="EndRentEndTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        优惠免租<br />
                        结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentFreeEndTime1" name="StartRentFreeEndTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentFreeEndTime1" name="EndRentFreeEndTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        顺延起租<br />
                        开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartPostPoneBeginTime1" name="StartPostPoneBeginTime1" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndPostPoneBeginTime1" name="EndPostPoneBeginTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartCheckInTime1" name="StartCheckInTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndCheckInTime1" name="EndCheckInTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">退租时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentOutTime1" name="StartRentOutTime1" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentOutTime1" name="EndRentOutTime1" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="CheckInUserName1" name="CheckInUserName1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">退租办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RentOutUserName1" name="RentOutUserName1" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadWaitGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formWait').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 已入住 -->
    <div id="dlg_Complete" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formComplete" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">待入住房屋查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryCustName2" name="TenantryCustName2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RoomSign2" name="RoomSign2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractName2" name="ContractName2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractSign2" name="ContractSign2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectpeople2" name="TenantryConnectpeople21" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectTel2" name="TenantryConnectTel2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">租赁开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentBeginTime2" name="StartRentBeginTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentBeginTime2" name="EndRentBeginTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">租赁结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentEndTime2" name="StartRentEndTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentEndTime2" name="EndRentEndTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        优惠免租<br />
                        结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentFreeEndTime2" name="StartRentFreeEndTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentFreeEndTime2" name="EndRentFreeEndTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        顺延起租<br />
                        开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartPostPoneBeginTime2" name="StartPostPoneBeginTime2" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndPostPoneBeginTime2" name="EndPostPoneBeginTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartCheckInTime2" name="StartCheckInTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndCheckInTime2" name="EndCheckInTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">退租时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentOutTime2" name="StartRentOutTime2" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentOutTime2" name="EndRentOutTime2" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="CheckInUserName2" name="CheckInUserName2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">退租办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RentOutUserName2" name="RentOutUserName2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadCompleteGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formComplete').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 待退租 -->
    <div id="dlg_WaitExist" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formWaitExist" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">待入住房屋查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryCustName3" name="TenantryCustName3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RoomSign3" name="RoomSign3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractName3" name="ContractName3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractSign3" name="ContractSign3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectpeople3" name="TenantryConnectpeople3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectTel3" name="TenantryConnectTel3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">租赁开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentBeginTime3" name="StartRentBeginTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentBeginTime3" name="EndRentBeginTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">租赁结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentEndTime3" name="StartRentEndTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentEndTime3" name="EndRentEndTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        优惠免租<br />
                        结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentFreeEndTime3" name="StartRentFreeEndTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentFreeEndTime3" name="EndRentFreeEndTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        顺延起租<br />
                        开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartPostPoneBeginTime3" name="StartPostPoneBeginTime3" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndPostPoneBeginTime3" name="EndPostPoneBeginTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartCheckInTime3" name="StartCheckInTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndCheckInTime3" name="EndCheckInTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">退租时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentOutTime3" name="StartRentOutTime3" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentOutTime3" name="EndRentOutTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="CheckInUserName3" name="CheckInUserName3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">退租办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RentOutUserName3" name="RentOutUserName3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadWaitExistGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formWaitExist').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 已退租 -->
    <div id="dlg_CompleteExist" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formCompleteExist" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">待入住房屋查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryCustName4" name="TenantryCustName4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RoomSign4" name="RoomSign4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractName4" name="ContractName4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="ContractSign4" name="ContractSign4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectpeople4" name="TenantryConnectpeople4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="TenantryConnectTel4" name="TenantryConnectTel4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">租赁开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentBeginTime4" name="StartRentBeginTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentBeginTime4" name="EndRentBeginTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">租赁结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentEndTime4" name="StartRentEndTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentEndTime4" name="EndRentEndTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        优惠免租<br />
                        结束时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentFreeEndTime4" name="StartRentFreeEndTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentFreeEndTime4" name="EndRentFreeEndTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        顺延起租<br />
                        开始时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartPostPoneBeginTime4" name="StartPostPoneBeginTime4" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndPostPoneBeginTime4" name="EndPostPoneBeginTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartCheckInTime4" name="StartCheckInTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndCheckInTime4" name="EndCheckInTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">退租时间</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="StartRentOutTime4" name="StartRentOutTime4" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="EndRentOutTime4" name="EndRentOutTime4" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">入住办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="CheckInUserName4" name="CheckInUserName4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">退租办理人</label>
                    <div class="col-sm-2 col-xs-2">
                        <input id="RentOutUserName4" name="RentOutUserName4" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadCompleteExistGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formCompleteExist').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            var w = $(window).width();
            $('#tab').css("height", h + 'px');
            $('#tab0,#tab1,#tab2,#tab3').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            LoadWaitGrid();//待入住
        });

        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //已入住
                    setTimeout(function () {
                        LoadCompleteGrid();
                    }, 300);
                } else if (index == 2) {
                    //待退租
                    setTimeout(function () {
                        LoadWaitExistGrid();
                    }, 300);
                } else if (index == 3) {
                    //已退租
                    setTimeout(function () {
                        LoadCompleteExistGrid();
                    }, 300);
                }
            }
        }
        /* 待入住 */
        var toolbarWait = [
            {
                text: '入住确认',
                iconCls: 'icon-ok',
                handler: function () {
                    var CheckedRows = $('#TableContainerWait').datagrid("getChecked");
                    if (CheckedRows.length == 0) {
                        $.messager.alert('温馨提示', "请选择需要办理入住的房屋数据");
                        return;
                    }
                    var ContractRoomIDs = "";
                    for (var i = 0; i < CheckedRows.length; i++) {
                        ContractRoomIDs += CheckedRows[i].ID + ",";
                    }
                    if (ContractRoomIDs.length > 0) {
                        ContractRoomIDs = ContractRoomIDs.substring(0, ContractRoomIDs.length - 1);
                    }
                    var param = { "ContractRoomIDs": ContractRoomIDs };
                    LayerDialog.OpenWin('450', '340', '/HM/M_Main/Renting/Contract/Handle/RoomCheckIn.aspx?' + $.param(param), "入住确认", false, function callback(_Data) {
                        if (_Data != "") {
                            $.messager.alert('温馨提示', "房屋入住确认成功");
                            LoadWaitGrid();
                            //将已入住页面重新加载
                            var ItemTabSet = $('#tab').tabs('getTab', 1);
                            ItemTabSet.data("issel", false);
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Wait').dialog('open');
                }
            }
        ];
        var columnWait = [[
            { field: 'ck', checkbox: true },
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 140, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'center' },
            { field: 'RoomChargeArea', title: '计租面积', width: 100, align: 'center' },
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
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'CheckInTime', title: '入住时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'CheckInUserName', title: '入住办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'RentOutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'RentOutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'RentOutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 待入住 房屋列表
        function LoadWaitGrid() {
            $("#TableContainerWait").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                fit: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnWait,
                rownumbers: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbarWait,
                onBeforeLoad: function (param) {
                    param.SortField = "RentBeginTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.Class = "Renting_ContractHandle";
                    param.Method = "GetList";
                    param.SearchFlag = "Wait"
                    var paramJson = $.getFromParam("formWait");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Wait').dialog('close');
        }

        /* 已入住 */
        var toolbarComplete = [
            {
                text: '费用转移',
                iconCls: 'icon-edit',
                handler: function () {
                    var SelectedRow = $('#TableContainerComplete').datagrid("getSelected");
                    if (SelectedRow == null) {
                        $.messager.alert('温馨提示', "请选择需要进行费用转移的房屋");
                        return;
                    }
                    var w = $(window).width();
                    var h = $(window).height();
                    LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Handle/FeesTramsfer.aspx?LeaseRoomID=' + SelectedRow.ID, "租赁合同费用转移", false, function callback(_Data) {
                        if (_Data != "") {
                            LoadCompleteGrid();
                        }
                    });
                }
            }, '-',
            {
                text: '费用反转移',
                iconCls: 'icon-edit',
                handler: function () {
                    var SelectedRow = $('#TableContainerComplete').datagrid("getSelected");
                    if (SelectedRow == null) {
                        $.messager.alert('温馨提示', "请选择需要进行费用反转移的房屋");
                        return;
                    }
                    var w = $(window).width();
                    var h = $(window).height();
                    LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Handle/FeesRollBack.aspx?LeaseRoomID=' + SelectedRow.ID, "租赁合同费用反转移", false, function callback(_Data) {
                        if (_Data != "") {
                            LoadCompleteGrid();
                        }
                    });
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_Complete').dialog('open');
                }
            }
        ];
        var columnComplete = [[
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 140, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'center' },
            { field: 'RoomChargeArea', title: '计租面积', width: 100, align: 'center' },
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
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'CheckInTime', title: '入住时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'CheckInUserName', title: '入住办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'RentOutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'RentOutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'RentOutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 已入住 房屋列表
        function LoadCompleteGrid() {
            $("#TableContainerComplete").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                fit: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnComplete,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                height: '100%',
                toolbar: toolbarComplete,
                onBeforeLoad: function (param) {
                    param.SortField = "TenantryCustID,RoomID";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.Class = "Renting_ContractHandle";
                    param.Method = "GetList";
                    param.SearchFlag = "Complete"
                    var paramJson = $.getFromParam("formComplete");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('2', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_Complete').dialog('close');
        }

        /* 待退租 */
        var toolbarWaitExist = [
            {
                text: '退租确认',
                iconCls: 'icon-ok',
                handler: function () {
                    var CheckedRows = $('#TableContainerWaitExist').datagrid("getChecked");
                    if (CheckedRows.length == 0) {
                        $.messager.alert('温馨提示', "请选择需要办理退租的房屋数据");
                        return;
                    }
                    var ContractRoomIDs = "";
                    for (var i = 0; i < CheckedRows.length; i++) {
                        ContractRoomIDs += CheckedRows[i].ID + ",";
                    }
                    if (ContractRoomIDs.length > 0) {
                        ContractRoomIDs = ContractRoomIDs.substring(0, ContractRoomIDs.length - 1);
                    }
                    var param = { "ContractRoomIDs": ContractRoomIDs };
                    LayerDialog.OpenWin('450', '340', '/HM/M_Main/Renting/Contract/Handle/RoomRentOut.aspx?' + $.param(param), "房屋退租确认", false, function callback(_Data) {
                        if (_Data != "") {
                            $.messager.alert('温馨提示', "退租确认成功");
                            LoadWaitExistGrid();
                            //将已退租页面重新加载
                            var ItemTabSet = $('#tab').tabs('getTab', 3);
                            ItemTabSet.data("issel", false);
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_WaitExist').dialog('open');
                }
            }
        ];
        var columnWaitExist = [[
            { field: 'ck', checkbox: true },
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 140, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'center' },
            { field: 'RoomChargeArea', title: '计租面积', width: 100, align: 'center' },
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
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'CheckInTime', title: '入住时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'CheckInUserName', title: '入住办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'RentOutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'RentOutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'RentOutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 待退租 房屋列表
        function LoadWaitExistGrid() {
            $("#TableContainerWaitExist").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fit: true,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnWaitExist,
                rownumbers: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbarWaitExist,
                onBeforeLoad: function (param) {
                    param.SortField = "RentEndTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.Class = "Renting_ContractHandle";
                    param.Method = "GetList";
                    param.SearchFlag = "WaitExist"
                    var paramJson = $.getFromParam("formWaitExist");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('3', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_WaitExist').dialog('close');
        }

        /* 已退租 */
        var toolbarCompleteExist = [
            {
                text: '费用转移',
                iconCls: 'icon-edit',
                handler: function () {
                    var SelectedRow = $('#TableContainerCompleteExist').datagrid("getSelected");
                    if (SelectedRow == null) {
                        $.messager.alert('温馨提示', "请选择需要进行费用转移的房屋");
                        return;
                    }
                    var w = $(window).width();
                    var h = $(window).height();
                    LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Handle/FeesTramsfer.aspx?LeaseRoomID=' + SelectedRow.ID, "租赁合同费用转移", false, function callback(_Data) {
                        if (_Data != "") {
                            LoadCompleteExistGrid();
                        }
                    });
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_CompleteExist').dialog('open');
                }
            }
        ];
        var columnCompleteExist = [[
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 160, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 140, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'center' },
            { field: 'RoomChargeArea', title: '计租面积', width: 100, align: 'center' },
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
                field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            {
                field: 'CheckInTime', title: '入住时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            },
            { field: 'CheckInUserName', title: '入住办理人', width: 100, align: 'center' },
            {
                field: 'MaxListDate', title: '最近抄表时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'DebtsAmount', title: '当前欠费金额', width: 100, align: 'center' },
            {
                field: 'RentOutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'RentOutUserName', title: '退租办理人', width: 100, align: 'center' },
            { field: 'RentOutReason', title: '退租原因', width: 200, align: 'center' }
        ]];
        //加载 已退租 房屋列表
        function LoadCompleteExistGrid() {
            $("#TableContainerCompleteExist").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fit: true,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnCompleteExist,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbarCompleteExist,
                onBeforeLoad: function (param) {
                    param.SortField = "RentEndTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.Class = "Renting_ContractHandle";
                    param.Method = "GetList";
                    param.SearchFlag = "CompleteExist"
                    var paramJson = $.getFromParam("formCompleteExist");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('4', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_CompleteExist').dialog('close');
        }

    </script>
</body>
</html>

