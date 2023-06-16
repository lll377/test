<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.Merchants.PotentialCustomers.FollowUp.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-招商管理-商机跟进</title>
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
        <div id="tab0" data-issel="true" title="我的客户" style="overflow: hidden;">
            <table id="TableContainerMine" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab1" data-issel="false" title="跟进信息" style="overflow: hidden;">
            <table id="TableContainerFollowUp" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <!-- 我的客户 -->
    <div id="dlg_Mine" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formMine" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustTypeName" name="CustTypeName" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCustType();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#CustTypeID').val('');
                                    }}] " />
                        <input type="hidden" id="CustTypeID" name="CustTypeID" runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustName" name="CustName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">证件号码</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="PaperCode" name="PaperCode" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">法定代表人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="LegalRepr" name="LegalRepr" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">法定代表人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="LegalReprTel" name="LegalReprTel" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">联系人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ConnectPeople" name="ConnectPeople" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">联系人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="ConnectPeopleTel" name="ConnectPeopleTel" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户经营业态</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="TradeStateName" name="TradeStateName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelTradeState();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#TradeStateID').val('');
                                    }}] " />
                        <input type="hidden" id="TradeStateID" name="TradeStateID" runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户经营品牌</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="BusinessBrand" name="BusinessBrand" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户经营级别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="BusinessLevel" name="BusinessLevel" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <%--<label class="col-sm-1 col-xs-1 control-label">跟进人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpUserName" name="FollowUpUserName" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>--%>
                    <label class="col-sm-1 col-xs-1 control-label">分派人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="AssignUserName" name="AssignUserName" class="easyui-textbox"
                            data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">分派时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="AssignTimeStart" name="AssignTimeStart" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="AssignTimeEnd" name="AssignTimeEnd" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">跟进阶段</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpStageName" name="FollowUpStageName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelFollowUpStage();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#FollowUpStageID').val('');
                                    }}] " />
                        <input type="hidden" id="FollowUpStageID" name="FollowUpStageID" runat="server" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitMineDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formMine').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 跟进信息 -->
    <div id="dlg_FollowUp" class="easyui-dialog" title="筛选" style="width: 1100px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formFollowUp" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">客户类别</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustTypeName2" name="CustTypeName2" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCustType2();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#CustTypeID').val('');
                                    }}] " />
                        <input type="hidden" id="CustTypeID2" name="CustTypeID2" runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustName2" name="CustName2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">跟进阶段</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpStageName2" name="FollowUpStageName2" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:true,width:'100%',
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelFollowUpStage2();},
                                icons:[{
                                    iconCls:'icon-clear',
                                    handler: function(e){
                                    $(e.data.target).textbox('clear');
                                    $('#FollowUpStageID').val('');
                                    }}] " />
                        <input type="hidden" id="FollowUpStageID2" name="FollowUpStageID2" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">跟进时间</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpTimeStart2" name="FollowUpTimeStart2" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">至</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpTimeEnd2" name="FollowUpTimeEnd2" class="easyui-datebox"
                            data-options="required:false,tipPosition:'bottom',width:'100%',editable:false" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户对接人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustMeetPeople2" name="CustMeetPeople2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">对接人职位</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustMeetPeoplePosition2" name="CustMeetPeoplePosition2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">对接人电话</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="CustMeetPeopleTel2" name="CustMeetPeopleTel2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">跟进人</label>
                    <div class="col-sm-3 col-xs-3">
                        <input id="FollowUpUserName2" name="FollowUpUserName2" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitFollowUpDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formFollowUp').form('clear')">清空</a>
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
            $('#tab0,#tab1').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitMineDataGrid();//加载我的客户
        });

        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //跟进信息
                    setTimeout(function () {
                        InitFollowUpDataGrid();
                    }, 300);
                }
            }
        }
        /* 我的客户 */
        //选择客户类别
        function SelCustType() {
            var param = {
                IsMultiple: "是"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/CustomerTypeSelect.aspx?' + $.param(param), "选择客户类别", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let CustTypeID = "";
                    let CustTypeName = "";
                    data.forEach((itemRow) => {
                        CustTypeID = CustTypeID + itemRow.CustTypeID + ",";
                        CustTypeName = CustTypeName + itemRow.CustTypeName + ",";
                    });
                    if (CustTypeID.endsWith(",")) {
                        CustTypeID = CustTypeID.substring(0, CustTypeID.length - 1)
                        CustTypeName = CustTypeName.substring(0, CustTypeName.length - 1)
                    }

                    $("#CustTypeID").val(CustTypeID); // 
                    $("#CustTypeName").textbox("setValue", CustTypeName); //
                }
            });
        }
        //选择客户经营业态
        function SelTradeState() {
            var param = {
                IsMultiple: "是",
                Type: "经营业态"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择经营业态", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let TradeStateID = "";
                    let TradeStateName = "";
                    data.forEach((itemRow) => {
                        TradeStateID = TradeStateID + itemRow.ID + ",";
                        TradeStateName = TradeStateName + itemRow.Name + ",";
                    });
                    if (TradeStateID.endsWith(",")) {
                        TradeStateID = TradeStateID.substring(0, TradeStateID.length - 1)
                        TradeStateName = TradeStateName.substring(0, TradeStateName.length - 1)
                    }

                    $("#TradeStateID").val(TradeStateID); // 
                    $("#TradeStateName").textbox("setValue", TradeStateName); //
                }
            });
        }
        //选择跟进阶段
        function SelFollowUpStage() {
            var param = {
                IsMultiple: "是",
                Type: "跟进阶段"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择跟进阶段", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let FollowUpStageID = "";
                    let FollowUpStageName = "";
                    data.forEach((itemRow) => {
                        FollowUpStageID = FollowUpStageID + itemRow.ID + ",";
                        FollowUpStageName = FollowUpStageName + itemRow.Name + ",";
                    });
                    if (FollowUpStageID.endsWith(",")) {
                        FollowUpStageID = FollowUpStageID.substring(0, FollowUpStageID.length - 1)
                        FollowUpStageName = FollowUpStageName.substring(0, FollowUpStageName.length - 1)
                    }

                    $("#FollowUpStageID").val(FollowUpStageID); // 
                    $("#FollowUpStageName").textbox("setValue", FollowUpStageName); //
                }
            });
        }

        var MineColumn = [[
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            {
                field: 'CustName', title: '客户名称', width: 200, align: 'center', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"MineDetail('" + row.ID + "','edit')\" \">" + value + "</a>";
                    return str;
                }
            },
            { field: 'PaperCode', title: '证件号码', width: 140, align: 'center' },
            { field: 'LegalRepr', title: '法定代表人', width: 160, align: 'center' },
            { field: 'LegalReprTel', title: '法定代表人电话', width: 140, align: 'center' },
            { field: 'ConnectPeople', title: '联系人', width: 120, align: 'center' },
            { field: 'ConnectPeopleTel', title: '联系人电话', width: 100, align: 'center' },
            { field: 'TradeStateName', title: '客户经营业态', width: 100, align: 'center' },
            { field: 'BusinessBrand', title: '客户经营品牌', width: 140, align: 'center' },
            { field: 'BusinessLevel', title: '客户经营级别', width: 140, align: 'center' },
            { field: 'FollowUpUserName', title: '跟进人', width: 100, align: 'center' },
            { field: 'AssignUserName', title: '分派人', width: 100, align: 'center' },
            {
                field: 'AssignTime', title: '分派时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'FollowUpStageName', title: '跟进阶段', width: 120, align: 'center' }
        ]];
        var MineToolbar = [
            {
                text: '跟进登记',
                iconCls: 'icon-add',
                handler: function () {
                    var row = $("#TableContainerMine").datagrid("getSelected");
                    if (row) {
                        var guid = new GUID();
                        FollowUpEdit(guid.newGUID(), 'add', row.ID, row.CustName, row.ConnectPeople, row.ConnectPeopleTel);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要跟进的客户数据!');
                    }
                }
            }, '-', {
                text: '认租签约',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainerMine").datagrid("getSelected");
                    if (row) {
                        var param = { "OpType": 'add', "ID": "", "PotentialCustomersID": row.ID };
                        var w = '1200';
                        var h = $(window).height();
                        LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Merchants/RentSubscription/Edit.aspx?' + $.param(param), "认租合同登记", true, function callback(_Data) {
                        });
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要认租签约的数据!');
                    }
                }
            }, '-',
            {
                text: '正式签约',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainerMine").datagrid("getSelected");
                    if (row) {
                        var param = { "OpType": 'add', "ID": "", "SignType": "新签", "PotentialCustomersID": row.ID };
                        var w = '1200';
                        var h = $(window).height();
                        LayerDialog.OpenWin(w, h, '/HM/M_Main/Renting/Contract/Register/Edit.aspx?' + $.param(param), "合同登记信息", true, function callback(_Data) {
                        });
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要正式签约的数据!');
                    }
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_Mine").dialog("open");
                }
            }, '-',
            {
                text: '导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //判断当前页面是否存在数据
                    let Rows = $("#TableContainerMine").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                        return;
                    }
                    var dataFields = $('#TableContainerMine').datagrid('getColumnFields');
                    var dataColumnFields = [];

                    dataFields.forEach((item, index) => {
                        dataColumnFields += "," + item + " '" + $('#TableContainerMine').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                    });
                    if (dataColumnFields.startsWith(',')) {
                        dataColumnFields = dataColumnFields.slice(1);
                    }
                    var param = {};
                    var paramJson = $.getFromParam("formMine");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                    param.DataColumnFields = dataColumnFields;
                    param.PageSize = 5000;
                    param.IsPagination = "否";
                    param.IsZip = "否";
                    param.TableName = "我的潜在客户列表信息";
                    param.Class = 'Renting_PotentialCustomers_FollowUp';
                    param.Method = "GetMinePotentialCustomerListSqlWhere";
                    console.log($.param(param));
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }];

        //加载列表
        function InitMineDataGrid() {
            $("#TableContainerMine").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: MineColumn,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: MineToolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AssignTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.Class = "Renting_PotentialCustomers_FollowUp";
                    param.Method = "GetMinePotentialCustomerList";
                    var paramJson = $.getFromParam("formMine");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $('#dlg_Mine').dialog('close');
        }

        //查看客户详情
        function MineDetail(ID) {
            var param = {
                OpType: "Detail",
                ID: ID
            }
            LayerDialog.OpenWin('900', '600', '/HM/M_Main/Renting/Merchants/PotentialCustomers/Register/Edit.aspx?' + $.param(param), "商机登记信息查看", true, function callback(_Data) {
                if (_Data != "") {
                }
            });

        }

        /* 跟进信息 */
        //选择客户类别
        function SelCustType2() {
            var param = {
                IsMultiple: "是"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/CustomerTypeSelect.aspx?' + $.param(param), "选择客户类别", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let CustTypeID = "";
                    let CustTypeName = "";
                    data.forEach((itemRow) => {
                        CustTypeID = CustTypeID + itemRow.CustTypeID + ",";
                        CustTypeName = CustTypeName + itemRow.CustTypeName + ",";
                    });
                    if (CustTypeID.endsWith(",")) {
                        CustTypeID = CustTypeID.substring(0, CustTypeID.length - 1)
                        CustTypeName = CustTypeName.substring(0, CustTypeName.length - 1)
                    }

                    $("#CustTypeID2").val(CustTypeID); // 
                    $("#CustTypeName2").textbox("setValue", CustTypeName); //
                }
            });
        }

        //选择跟进阶段
        function SelFollowUpStage2() {
            var param = {
                IsMultiple: "是",
                Type: "跟进阶段"
            }
            LayerDialog.OpenWin('600', '360', '/HM/M_Main/Renting/Dialog/DictionarySelect.aspx?' + $.param(param), "选择跟进阶段", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    var data = $.parseJSON(_Data);
                    let FollowUpStageID = "";
                    let FollowUpStageName = "";
                    data.forEach((itemRow) => {
                        FollowUpStageID = FollowUpStageID + itemRow.ID + ",";
                        FollowUpStageName = FollowUpStageName + itemRow.Name + ",";
                    });
                    if (FollowUpStageID.endsWith(",")) {
                        FollowUpStageID = FollowUpStageID.substring(0, FollowUpStageID.length - 1)
                        FollowUpStageName = FollowUpStageName.substring(0, FollowUpStageName.length - 1)
                    }

                    $("#FollowUpStageID2").val(FollowUpStageID); // 
                    $("#FollowUpStageName2").textbox("setValue", FollowUpStageName); //
                }
            });
        }

        var FollowUpColumn = [[
            { field: 'CustTypeName', title: '客户类别', width: 100, align: 'center' },
            {
                field: 'CustName', title: '客户名称', width: 200, align: 'center', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\"  onclick=\"FollowUpEdit('" + row.ID + "','edit')\" \">" + value + "</a>";
                    return str;
                }
            },
            { field: 'FollowUpStageName', title: '跟进阶段', width: 100, align: 'center' },
            {
                field: 'FollowUpTime', title: '跟进时间', width: 120, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'CustMeetPeople', title: '客户对接人', width: 200, align: 'center' },
            { field: 'CustMeetPeoplePosition', title: '对接人职位', width: 100, align: 'center' },
            { field: 'CustMeetPeopleTel', title: '对接人电话', width: 120, align: 'center' },
            { field: 'FollowUpUserName', title: '跟进人', width: 100, align: 'center' }
        ]];

        var FollowUpToolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    var guid = new GUID();
                    FollowUpEdit(guid.newGUID(), 'add');
                }
            }, '-',
            {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainerFollowUp").datagrid("getSelected");
                    if (row) {
                        FollowUpEdit(row.ID, 'edit');
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerFollowUp").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的客户跟进记录!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的客户跟进记录?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_PotentialCustomers_FollowUp', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        $.messager.alert("温馨提示", "删除成功")
                                        InitFollowUpDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_FollowUp").dialog("open");
                }
            }, '-',
            {
                text: '导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    //判断当前页面是否存在数据
                    let Rows = $("#TableContainerFollowUp").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', "没有可导出的数据，请确认！");
                        return;
                    }
                    var dataFields = $('#TableContainerFollowUp').datagrid('getColumnFields');
                    var dataColumnFields = [];

                    dataFields.forEach((item, index) => {
                        dataColumnFields += "," + item + " '" + $('#TableContainerFollowUp').datagrid("getColumnOption", item).title.replace("<br/>", "") + "'";
                    });
                    if (dataColumnFields.startsWith(',')) {
                        dataColumnFields = dataColumnFields.slice(1);
                    }
                    var param = {};
                    var paramJson = $.getFromParam("formFollowUp");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('2', '');
                        param[key] = values;
                    }
                    param.DataColumnFields = dataColumnFields;
                    param.PageSize = 5000;
                    param.IsPagination = "否";
                    param.IsZip = "否";
                    param.TableName = "我的潜在客户跟进信息";
                    param.Class = 'Renting_PotentialCustomers_FollowUp';
                    param.Method = "GetListSqlWhere";
                    window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
                }
            }];
        //加载列表
        function InitFollowUpDataGrid() {
            $("#TableContainerFollowUp").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: FollowUpColumn,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: FollowUpToolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "FollowUpTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param.Class = "Renting_PotentialCustomers_FollowUp";
                    param.Method = "GetList";
                    var paramJson = $.getFromParam("formFollowUp");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('2', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_FollowUp").dialog("close");
        }
        //编辑
        function FollowUpEdit(ID, opType, PotentialCustomersID = '', CustName = '', ConnectPeople = '', ConnectPeopleTel = '') {
            var param = {
                OpType: opType,
                ID: ID,
                PotentialCustomersID: PotentialCustomersID,
                CustName: CustName,
                ConnectPeople: ConnectPeople,
                ConnectPeopleTel: ConnectPeopleTel
            }
            LayerDialog.OpenWin('900', '530', '/HM/M_Main/Renting/Merchants/PotentialCustomers/FollowUp/Edit.aspx?' + $.param(param), "客户跟进编辑", true, function callback(_Data) {
                if (_Data != "") {
                    $.messager.alert("温馨提示", "保存成功")
                    InitFollowUpDataGrid();
                }
            });
        }

    </script>
</body>
</html>
