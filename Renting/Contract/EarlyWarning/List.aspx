<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Contract.EarlyWarning.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-租赁合同-合同预警</title>
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
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
        <div id="tab0" data-issel="true" title="合同到期预警" style="overflow: hidden;">
            <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
        </div>
        <div id="tab1" data-issel="false" title="合同提成预警" style="overflow: hidden;">
            <div id="TableContainerRoyalty" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
        </div>
    </div>
    <%--合同到期预警--%>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFrom" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">项目名称</label>
                    <div class="col-sm-11 col-xs-11">
                        <input type="text" id="CommName" name="CommName" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm('frmFrom');}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryCustName" name="TenantryCustName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="RoomNames" name="RoomNames" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectpeople" name="TenantryConnectpeople" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectTel" name="TenantryConnectTel" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractTypeName" name="ContractTypeName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractSign" name="ContractSign" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同开始时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractBeginTime" name="StartContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractBeginTime" name="EndContractBeginTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractName" name="ContractName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同结束时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractEndTime" name="StartContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractEndTime" name="EndContractEndTime" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        机构部门/<br />
                        负责人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="DutyDepNameAndUserName" name="DutyDepNameAndUserName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName('frmFrom');},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#DutyDepCode').val('');
                                            $('#DutyUserCode').val('');
                                            }}] " />
                        <input type="hidden" id="DutyDepCode" name="DutyDepCode" runat="server" />
                        <input type="hidden" id="DutyUserCode" name="DutyUserCode" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">签约时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeStart" name="SignUpTimeStart" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeEnd" name="SignUpTimeEnd" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">发起人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="WorkStartUserName" name="WorkStartUserName" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">发起时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartWorkStartDate" name="StartWorkStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndWorkStartDate" name="EndWorkStartDate" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">是否退租</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="IsRentOut" name="IsRentOut" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [{id: '否',text: '否'},{id: '是',text: '是'}]"
                            runat="server" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere('frmFrom')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <%--合同提成预警--%>
    <div id="dlg_searchRoyalty" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFromRoyalty" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">项目名称</label>
                    <div class="col-sm-11 col-xs-11">
                        <input type="text" id="CommName3" name="CommName3" class="easyui-textbox" runat="server"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',width:'100%',height:'50px',multiline:true,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm('frmFromRoyalty');}" />
                        <input type="hidden" id="CommID3" name="CommID3" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryCustName3" name="TenantryCustName3" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="RoomNames3" name="RoomNames3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectpeople3" name="TenantryConnectpeople3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TenantryConnectTel3" name="TenantryConnectTel3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractTypeName3" name="ContractTypeName3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractSign3" name="ContractSign3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同开始时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractBeginTime3" name="StartContractBeginTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractBeginTime3" name="EndContractBeginTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ContractName3" name="ContractName3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同结束时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartContractEndTime3" name="StartContractEndTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndContractEndTime3" name="EndContractEndTime3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal;">
                        机构部门/<br />
                        负责人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="DutyDepNameAndUserName3" name="DutyDepNameAndUserName3" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',multiline:false,width:'100%',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDutyDepNameAndUserName('frmFromRoyalty');},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#DutyDepCode3').val('');
                                            $('#DutyUserCode3').val('');
                                            }}] " />
                        <input type="hidden" id="DutyDepCode3" name="DutyDepCode3" runat="server" />
                        <input type="hidden" id="DutyUserCode3" name="DutyUserCode3" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">签约时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeStart3" name="SignUpTimeStart3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="SignUpTimeEnd3" name="SignUpTimeEnd3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">发起人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="WorkStartUserName3" name="WorkStartUserName3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">发起时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="StartWorkStartDate3" name="StartWorkStartDate3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="EndWorkStartDate3" name="EndWorkStartDate3" class="easyui-datebox" data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">是否退租</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="IsRentOut3" name="IsRentOut3" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',
                                    valueField:'id',textField:'text',data: [{id: '否',text: '否'},{id: '是',text: '是'}]"
                            runat="server" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="LoadRoyaltyGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere('frmFromRoyalty')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script type="text/javascript">
        //页面初始化
        $(function () {
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

            var h = $(window).height();
            var w = $(window).width();
            $('#tab').css("height", h + 'px');
            $('#tab0,#tab1').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitDataGrid();//合同到期预警
        });

        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //合同提成预警
                    setTimeout(function () {
                        LoadRoyaltyGrid();
                    }, 300);
                }
            }
        }
        function ClearWhere(frmFormName = 'frmFrom') {
            if (frmFormName == 'frmFrom') {
                $('#frmFrom').form('clear');
                if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                    $("#CommName").textbox("setValue", $('#HidCommName').val());
                    $("#CommID").val($('#HidCommID').val());
                }
            } else if (frmFormName == 'frmFromRoyalty') {
                $('#frmFromRoyalty').form('clear');
                if ($('#HidCommID').val() != "" && $('#HidCommID').val() != "0") {
                    $("#CommName3").textbox("setValue", $('#HidCommName').val());
                    $("#CommID3").val($('#HidCommID').val());
                }
            }
        }

        //选择项目
        function SelComm(frmFormName = 'frmFrom') {
            if ($('#HidCommID').val() == "" || $('#HidCommID').val() == "0") {
                LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/CommSelect.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                    if (data) {
                        data = $.parseJSON(data);
                        var id = "", text = "";
                        $.each(data, function (i, item) {
                            id += "," + item.CommID;
                            text += "," + item.CommName;
                        });
                        id = id.substr(1);
                        text = text.substr(1);
                        if (frmFormName == 'frmFrom') {
                            $("#CommID").val(id);
                            $("#CommName").textbox('setValue', text);
                        } else if (frmFormName == 'frmFromRoyalty') {
                            $("#CommID3").val(id);
                            $("#CommName3").textbox('setValue', text);
                        }
                    }
                });
            }
        }

        //选择 机构部门/负责人
        function SelDutyDepNameAndUserName(frmFormName = 'frmFrom') {
            LayerDialog.OpenWin('640', '400', '/HMM_Main/Renting/Dialog/DepartAndUserSelect.aspx', "机构部门/负责人选择", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    if (frmFormName == 'frmFrom') {
                        $('#DutyUserCode').val(data.UserCode);
                        $('#DutyDepCode').val(data.DepCode);
                        $('#DutyDepNameAndUserName').textbox("setValue", data.DepName + "-" + data.UserName);
                    } else if (frmFormName == 'frmFromRoyalty') {
                        $('#DutyUserCode3').val(data.UserCode);
                        $('#DutyDepCode3').val(data.DepCode);
                        $('#DutyDepNameAndUserName3').textbox("setValue", data.DepName + "-" + data.UserName);
                    }

                }
            });
        }


        /* 合同到期预警 */
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }
        ];
        var column = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            { field: 'EndDays', title: '合同到期时间', width: 80, align: 'center' },
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomNames', title: '房屋编号', width: 180, align: 'center', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 140, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 140, align: 'center' },
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
            { field: 'ChargeStandard', title: '租金标准', width: 100, align: 'center' },
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
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]];
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fit: true,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                rowStyler: function (index, row) {
                    if (row.EndDays != "" && parseInt(row.EndDays) < 0) {
                        return 'background-color:red;';
                    }
                },
                onBeforeLoad: function (param) {
                    param.SortField = "CommID,AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.Class = "Renting_ContractWarning";
                    param.Method = "ContractWarningList";
                    var paramJson = $.getFromParam("frmFrom");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                }
            });
            $('#dlg_search').dialog('close');
        }
        /* 合同提成预警 */
        var toolbarRoyalty = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_searchRoyalty').dialog('open');
                }
            }
        ];
        var columnRoyalty = [[
            { field: 'OrganName', title: '区域名称', width: 120, align: 'center' },
            { field: 'CommName', title: '项目名称', width: 120, align: 'center' },
            { field: 'NoChargeMonth', title: '未计费年月', width: 100, align: 'center' },
            { field: 'TenantryCustName', title: '客户名称', width: 200, align: 'center' },
            {
                field: 'RoomNames', title: '房屋编号', width: 180, align: 'center', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'TenantryConnectpeople', title: '联系人', width: 140, align: 'center' },
            { field: 'TenantryConnectTel', title: '联系电话', width: 100, align: 'center' },
            { field: 'ContractTypeName', title: '合同类别', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 140, align: 'center' },
            { field: 'ContractName', title: '合同名称', width: 140, align: 'center' },
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
            { field: 'ChargeStandard', title: '租金标准', width: 100, align: 'center' },
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
            { field: 'IsRentOut', title: '是否退租', width: 80, align: 'center' }
        ]];
        function LoadRoyaltyGrid() {
            $("#TableContainerRoyalty").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                fitColumns: false,
                columns: columnRoyalty,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: toolbarRoyalty,
                //rowStyler: function (index, row) {
                //    if (row.EndDays != "" && parseInt(row.EndDays) < 0) {
                //        return 'background-color:red;';
                //    }
                //},
                onBeforeLoad: function (param) {
                    param.Class = "Renting_ContractWarning";
                    param.Method = "ContractRoyaltyWarningList";
                    var paramJson = $.getFromParam("frmFromRoyalty");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('3', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                    $(this).datagrid("autoMergeCells", ['OrganName', 'CommName']);
                }
            });
            $('#dlg_searchRoyalty').dialog('close');
        }
    </script>
</body>
</html>
