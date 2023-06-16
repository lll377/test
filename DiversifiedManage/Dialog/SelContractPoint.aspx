<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelContractPoint.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.SelContractPoint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同管理-选择点位(包含已选未选)</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .dlg_table tr td input {
            width: 200px;
        }
    </style>
</head>
<body class="easyui-layout" style="margin: 0px; padding: 0px; overflow: hidden">
    <div data-options="region:'north',split:false,border:false" style="height: 300px;">
        <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    </div>
    <div data-options="region:'center',title:'已选点位(合计:0个)'" style="background: #eee;">
        <table id="dgSelected" border="0" cellspacing="0" cellpadding="0"></table>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="padding: 5px; width: 800px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="frm">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>项目名称</span></td>
                    <td class="text">
                        <input id="CommName" name="CommName" class="easyui-textbox" data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:false,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                    </td>
                    <td class="title"><span>点位序号</span></td>
                    <td class="text">
                        <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位类别</span></td>
                    <td class="text">
                        <input type="hidden" id="CategoryID" name="CategoryID" />
                        <input id="CategoryName" name="CategoryName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCategory();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#CategoryID').val('');
                            }}] " />
                    </td>
                    <td class="title"><span>点位区域</span></td>
                    <td class="text">
                        <input type="hidden" id="RegionID" name="RegionID" />
                        <input id="RegionName" name="RegionName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRegion();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#RegionID').val('');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input id="Number" name="Number" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span>点位名称</span></td>
                    <td class="text">
                        <input id="Name" name="Name" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位位置</span></td>
                    <td class="text">
                        <input id="Position" name="Position" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span>所属楼宇</span></td>
                    <td class="text">
                        <input id="StoreyLayer_BuildSNum" name="StoreyLayer_BuildSNum" type="hidden" />
                        <input id="StoreyLayer_UnitSNum" name="StoreyLayer_UnitSNum" type="hidden" />
                        <input id="StoreyLayer_FloorSNum" name="StoreyLayer_FloorSNum" type="hidden" />
                        <input id="StoreyLayer" name="StoreyLayer" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelStoreyLayer();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#StoreyLayer_BuildSNum').val('');
                            $('#StoreyLayer_UnitSNum').val('');
                            $('#StoreyLayer_FloorSNum').val('');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位面积</span></td>
                    <td class="text" colspan="3">
                        <input id="StartArea" name="StartArea" class="easyui-numberbox" data-options="width:100,required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndArea" name="EndArea" class="easyui-numberbox" data-options="width:100,required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'<='" />
                        <label class="control-text">(单位:平米)</label>
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>点位尺寸</span></td>
                    <td class="text" colspan="3">
                        <label class="control-text">长</label>
                        <input id="StartSizeLength" name="StartSizeLength" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'70px',suffix:' cm',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndSizeLength" name="EndSizeLength" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'70px',suffix:' cm',prompt:'<='" />
                        <label class="control-text" style="padding-left: 20px">宽</label>
                        <input id="StartSizeWidth" name="StartSizeWidth" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'70px',suffix:' cm',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndSizeWidth" name="EndSizeWidth" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'70px',suffix:' cm',prompt:'<='" />
                        <label class="control-text" style="padding-left: 20px">高</label>
                        <input id="StartSizeHeight" name="StartSizeHeight" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'70px',suffix:' cm',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndSizeHeight" name="EndSizeHeight" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'70px',suffix:' cm',prompt:'<='" />
                        <label class="control-text">(单位:厘米)</label>
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>是否安装表计</span></td>
                    <td class="text">
                        <input id="IsInstall" name="IsInstall" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100px',
                            valueField:'id',textField:'text',data: [{id: '是',text: '是'},{id: '否',text: '否'}],icons: [{
                                    iconCls: 'icon-clear',
                                    handler: function (e) {
                                        $(e.data.target).combobox('clear');
                                    }
                                    }]"
                            runat="server" />
                    </td>
                    <td class="title"><span>计费单位</span></td>
                    <td class="text">
                        <input id="CalculateCostUnit" name="CalculateCostUnit" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100px',
                            valueField:'id',textField:'text',data: [{id: '个',text: '个'},{id: '平米',text: '平米'}],icons: [{
                                    iconCls: 'icon-clear',
                                    handler: function (e) {
                                        $(e.data.target).combobox('clear');
                                    }
                                    }]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>指导价格</span></td>
                    <td class="text">
                        <input id="Price" name="Price" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ¥'" />
                        <label class="control-text">(单位:元)</label>
                    </td>
                    <td class="title"><span>价格单位</span></td>
                    <td class="text">
                        <input id="PriceUnit" name="PriceUnit" class="easyui-combobox"
                            data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100px',
                            valueField:'id',textField:'text',
                            data: [{ id: '日', text: '日' }, { id: '月', text: '月' }, { id: '季', text: '季' }, { id: '年', text: '年' }],icons: [{
                                    iconCls: 'icon-clear',
                                    handler: function (e) {
                                        $(e.data.target).combobox('clear');
                                    }
                                    }]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>招商规划</span></td>
                    <td class="text">
                        <input type="hidden" id="TradePlanID" name="TradePlanID" />
                        <input id="TradePlanName" name="TradePlanName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#TradePlanID').val('');
                            }}] " />
                    </td>
                    <td class="title"><span></span></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <input type="hidden" name="Type" id="Type" runat="server" />
    <input type="hidden" name="PointIDs" id="PointIDs" runat="server" />
    <input type="hidden" id="HidCommID" name="HidCommID" runat="server" />
    <input type="hidden" id="HidCommName" name="HidCommName" runat="server" />
    <script language="javascript" type="text/javascript">
        $(function () {
            var Type = $.getUrlParam("Type");
            var CommID = $.getUrlParam("CommID");
            var CommName = $.getUrlParam("CommName");
            var PointIDs = $.getUrlParam("PointIDs");
            if (Type != null) {
                $("#Type").val(Type);
            }
            if (CommID != null) {
                $("#HidCommID").val(CommID);
                $("#CommID").val(CommID);
            }
            if (CommName != null) {
                $("#HidCommName").val(CommName);
                $("#CommName").textbox("setValue", CommName);
            }
            if (PointIDs != null) {
                $("#PointIDs").val(PointIDs);
            }
            InitDataGrid();//加载未选点位
            InitSelectedDataGrid(); // 加载已选点位
        });

        function ClearWhere() {
            $('#frm').form('clear')
            if ($("#HidCommID").val() != "") {
                $("#CommID").val($("#HidCommID").val());
                $("#CommName").textbox("setValue", $("#HidCommName").val());
            }
        }
        //选择点位类别
        function SelCategory() {
            var param = { "Type": $('#Type').val() };
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Category.aspx?' + $.param(param), '选择点位类别', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#CategoryID").val(data.ID);
                    $("#CategoryName").textbox('setValue', data.Name);
                }
            });
        }
        //选择项目
        function SelComm() {
            LayerDialog.OpenWin('680', '500', '../DiversifiedManage/Dialog/SelContractCommByCommRole.aspx', "选择项目", false, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#CommID").val(data.attributes.CommID);
                    $("#CommName").textbox("setValue", data.text);
                }
            });
        }
        //选择点位区域
        function SelRegion() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Region.aspx', '选择点位区域', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#RegionID").val(data.ID);
                    $("#RegionName").textbox('setValue', data.Region);
                }
            });
        }
        //选择所属楼宇
        function SelStoreyLayer() {
            LayerDialog.OpenWin('400', '500', '/HM/M_Main/DiversifiedManage/Dialog/StoreyLayer.aspx', '选择所属楼宇', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    //var storeyLayer = data.BuildName + "-" + data.UnitSNum + "单元-" + data.FloorSNum + "层";
                    $("#StoreyLayer").textbox('setValue', data.attributes.Location);
                    $('#StoreyLayer_BuildSNum').val(data.attributes.BuildSNum);
                    $('#StoreyLayer_UnitSNum').val(data.attributes.UnitSNum);
                    $('#StoreyLayer_FloorSNum').val(data.attributes.FloorSNum);
                }
            });
        }
        //招商规划
        function SelDictionary() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": "招商规划" }), '选择招商规划', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#TradePlanID").val(data.ID);
                    $("#TradePlanName").textbox('setValue', data.Name);
                }
            });
        }

        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'CommName', title: '项目名称', width: 130, align: 'center', sortable: false },
            { field: 'Type', title: '点位类型', width: 100, align: 'center', sortable: false },
            { field: 'CategoryName', title: '点位类别', width: 120, align: 'center', sortable: false },
            { field: 'Number', title: '点位编号', width: 220, align: 'center', sortable: false },
            { field: 'Name', title: '点位名称', width: 220, align: 'center', sortable: false },
            { field: 'Position', title: '点位位置', width: 140, align: 'center', sortable: false },
            { field: 'RegionName', title: '点位区域', width: 120, align: 'center', sortable: false },
            {
                field: 'OptNumber1', title: '房屋编号', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "房屋") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            {
                field: 'OptNumber2', title: '车位编号', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "车位") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            { field: 'StoreyLayer', title: '所属楼宇', width: 180, align: 'center', sortable: false },
            { field: 'Area', title: '点位面积(平方米)', width: 110, align: 'center', sortable: false },
            { field: 'IsInstall', title: '是否安装表计', width: 100, align: 'center', sortable: false },
            {
                field: 'Remark', title: '备注', width: 140, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!value && value.length >= 14) {
                        value = value.substring(0, 14) + "...";
                    }
                    return value;
                }
            },
            { field: 'TradePlanName', title: '招商规划', width: 100, align: 'center', sortable: false },
            { field: 'Price', title: '指导价格(元)', width: 100, align: 'center', sortable: false },
            { field: 'CalculateCostUnit', title: '计费单位', width: 100, align: 'center', sortable: false },
            {
                field: 'PriceUnit', title: '价格单位', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!row.CalculateCostUnit) {
                        value = row.PriceUnit + "&nbsp;/&nbsp;" + row.CalculateCostUnit;
                    }
                    return value;
                }
            }
        ]];
        var Toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-',
            {
                text: '确定选择',
                iconCls: 'icon-ok',
                handler: function () {
                    var rows = $("#dg").datagrid("getChecked");
                    if (rows.length > 0) {
                        //循环构建选择的点位IDs 
                        let PointIDsValue = $("#PointIDs").val();
                        rows.forEach((itemRow) => {
                            if (!PointIDsValue.includes(itemRow.ID)) {
                                if (PointIDsValue.endsWith(",")) {
                                    PointIDsValue = PointIDsValue + itemRow.ID;
                                } else {
                                    if (PointIDsValue.length == 0) {
                                        PointIDsValue = itemRow.ID;
                                    } else {
                                        PointIDsValue = PointIDsValue + ',' + itemRow.ID;
                                    }
                                }
                            }
                        });
                        $("#PointIDs").val(PointIDsValue);
                        InitDataGrid();
                        InitSelectedDataGrid();
                    } else {
                        $.messager.alert('温馨提示', "请至少勾选一行数据");
                    }
                }
            }
        ];
        //加载未选点位
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: false,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: Toolbar,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("DiversifiedManage", "ContractSelPoint", "dg", param);
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search').dialog('close');
        }

        //已选点位工具栏
        var ToolbarSelected = [
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var rows = $("#dgSelected").datagrid("getChecked");
                    if (rows.length > 0) {
                        //循环构建选择的点位IDs 
                        let PointIDsValue = $("#PointIDs").val();
                        rows.forEach((itemRow) => {
                            if (PointIDsValue.includes(itemRow.ID + ",")) {
                                PointIDsValue = PointIDsValue.replace(itemRow.ID + ",", "");
                            } else {
                                PointIDsValue = PointIDsValue.replace(itemRow.ID, "");
                            }
                            //判断尾部是否为，
                            if (PointIDsValue.endsWith(",")) {
                                PointIDsValue = PointIDsValue.substring(0, PointIDsValue.length - 1);
                            }
                        });
                        $("#PointIDs").val(PointIDsValue);
                        InitDataGrid();
                        InitSelectedDataGrid();
                    } else {
                        $.messager.alert('温馨提示', "请至少勾选一行需要删除的数据");
                    }
                }
            }, '-',
            {
                text: '保存',
                iconCls: 'icon-save',
                handler: function () {
                    var rows = $("#dgSelected").datagrid("getRows");
                    if (rows.length == 0) {
                        $.messager.alert('温馨提示', "请至少选择一条点位数据");
                        return;
                    }
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(rows);
                }
            }
        ];
        //加载已选点位
        function InitSelectedDataGrid() {
            $("#dgSelected").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                columns: column,
                rownumbers: true,
                fitColumns: false,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: ToolbarSelected,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "DiversifiedManage";
                    param.Command = "ContractSelPoint_GetSelected";
                    param["PointIDs"] = $('#PointIDs').val();
                },
                onLoadSuccess: function (data) {
                    //设置已选点位合计数
                    $('.easyui-layout').layout('panel', 'center').panel({ title: '已选点位(合计:' + data.total + '个)' });
                }
            });
        }
    </script>
</body>
</html>
