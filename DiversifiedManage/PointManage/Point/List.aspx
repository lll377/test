<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Point.List" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>点位登记</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body>
    <input id="IsDelete" name="IsDelete" value="0" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td class="edittool">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true,onClick:function(){Edit('新增','Add');}">新增</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td class="edittool"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,onClick:function(){Edit('编辑','Edit');}">编辑</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td class="edittool"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true,onClick:function(){Del()}">删除</a></td>
                    <td class="edittool">
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Import();}">点位导入</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Export();}">点位导出</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>

                    <td><a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看点位详情/点位使用信息!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: 460px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset searchtool">
                <legend class="frame-legend">查询项目</legend>
                <div class="col-sm-12 col-xs-12" style="padding: 0">
                    <input type="hidden" id="CommID" name="CommID" />
                    <input id="CommName" name="CommName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,multiline:true,height:60,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#CommID').val('');
                            }}] " />
                </div>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">点位信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">序号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">点位类型</label>
                    <div class="col-sm-5 col-xs-5" style="padding-right: 0">
                        <input id="Type" name="Type" class="easyui-combobox" />
                        <div id="div_OptNumber" style="display: inline-block;">
                            <label class="control-text" id="lbl_OptNumber"></label>
                            <%--<input type="hidden" id="OptNumber" name="OptNumber" />--%>
                            <input id="OptNumber" name="OptNumber" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'199',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelOptNumber();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#OptNumber').val('');
                            }}] " />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">点位类别</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="CategoryID" name="CategoryID" />
                        <input id="CategoryName" name="CategoryName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCategory();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#CategoryID').val('');
                            }}] " />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">点位区域</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="RegionID" name="RegionID" />
                        <input id="RegionName" name="RegionName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRegion();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#RegionID').val('');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">点位编号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Number" name="Number" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:'unnormal'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">点位名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Name" name="Name" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">点位位置</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Position" name="Position" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">所属楼宇</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StoreyLayer_BuildSNum" name="StoreyLayer_BuildSNum" type="hidden" />
                        <input id="StoreyLayer_UnitSNum" name="StoreyLayer_UnitSNum" type="hidden" />
                        <input id="StoreyLayer_FloorSNum" name="StoreyLayer_FloorSNum" type="hidden" />
                        <input id="StoreyLayer" name="StoreyLayer" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelStoreyLayer();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#StoreyLayer_BuildSNum').val('');
                            $('#StoreyLayer_UnitSNum').val('');
                            $('#StoreyLayer_FloorSNum').val('');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">点位面积</label>
                    <div class="col-sm-11 col-xs-11">
                        <input id="StartArea" name="StartArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndArea" name="EndArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'<='" />
                        <label class="control-text">(单位:平米)</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">点位尺寸</label>
                    <div class="col-sm-11 col-xs11">
                        <label class="control-text">长</label>
                        <input id="StartSizeLength" name="StartSizeLength" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',suffix:' cm',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndSizeLength" name="EndSizeLength" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',suffix:' cm',prompt:'<='" />
                        <label class="control-text" style="padding-left: 20px">宽</label>
                        <input id="StartSizeWidth" name="StartSizeWidth" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',suffix:' cm',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndSizeWidth" name="EndSizeWidth" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',suffix:' cm',prompt:'<='" />
                        <label class="control-text" style="padding-left: 20px">高</label>
                        <input id="StartSizeHeight" name="StartSizeHeight" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',suffix:' cm',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndSizeHeight" name="EndSizeHeight" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',width:'75px',suffix:' cm',prompt:'<='" />
                        <label class="control-text">(单位:厘米)</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">是否安装表计</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="IsInstall" name="IsInstall" class="easyui-combobox sf" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">是否停用</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="IsDisable" name="IsDisable" class="easyui-combobox sf" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">招商规划</label>
                    <div class="col-sm-5 col-xs-5">
                        <input type="hidden" id="TradePlanID" name="TradePlanID" />
                        <input id="TradePlanName" name="TradePlanName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:false,multiline:false,width:'100%',
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelDictionary();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#TradePlanID').val('');
                            }}] " />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">计费单位</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="CalculateCostUnit" name="CalculateCostUnit" class="easyui-combobox" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">指导价格</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Price" name="Price" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ¥'" />
                        <label class="control-text">(单位:元)</label>
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">价格单位</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="PriceUnit" name="PriceUnit" class="easyui-combobox" />
                        <label class="control-text" id="lblCalculateCostUnit"></label>
                    </div>
                </div>
            </fieldset>
            <%--<div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                </div>
            </div>--%>
        </form>
        <div style="height: 50px"></div>
        <div class="fixed-tool-search">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        function SelComm() {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/Dialog/Comm.aspx?' + $.param({ "IsPowerPost": "否", "IsPowerLevel": "是" }), '选择项目', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var id = "", text = "";
                    $.each(data, function (i, item) {
                        id += "," + item.CommID;
                        text += "," + item.CommName;
                    });
                    id = id.substr(1);
                    text = text.substr(1);
                    $("#CommID").val(id);
                    $("#CommName").textbox('setValue', text);
                }
            });
        }

        function SelOptNumber() {
            var typeValue = $("#Type").combobox('getValue');
            var pagePath = "/HM/M_Main/DiversifiedManage/Dialog/Room.aspx";
            if (typeValue == "车位") {
                pagePath = "/HM/M_Main/DiversifiedManage/Dialog/Park.aspx";
            }
            LayerDialog.OpenWin('1000', '500', pagePath, '选择' + typeValue, true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    var val = "";
                    if (typeValue == "房屋") {
                        val = data.RoomSign;
                        $("#Name").textbox('setValue', data.RoomName);
                        $("#Area").numberbox('setValue', data.BuildArea);
                        var storeyLayer = data.BuildName + "-" + data.UnitSNum + "单元-" + data.FloorSNum + "层";
                        ControlStoreyLayer(false, storeyLayer);
                    } else {
                        val = data.ParkName;
                        $("#Area").numberbox('setValue', data.ParkArea);
                        ControlStoreyLayer(true, '');
                    }
                    $("#OptNumber").textbox('setValue', val);
                    $("#Number").textbox('setValue', val);
                }
            });
        }
        function SelDictionary() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Dictionary.aspx?' + $.param({ "Type": "招商规划" }), '选择招商规划', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#TradePlanID").val(data.ID);
                    $("#TradePlanName").textbox('setValue', data.Name);
                }
            });
        }


        function SelCategory() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Category.aspx', '选择点位类别', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#CategoryID").val(data.ID);
                    $("#CategoryName").textbox('setValue', data.Name);
                }
            });
        }

        function SelRegion() {
            LayerDialog.OpenWin('1000', '500', '/HM/M_Main/DiversifiedManage/Dialog/Region.aspx', '选择点位区域', true, function callback(data) {
                if (data) {
                    data = $.parseJSON(data);
                    $("#RegionID").val(data.ID);
                    $("#RegionName").textbox('setValue', data.Region);
                }
            });
        }

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

        function ControlOptNumber(isShow, text) {
            if (isShow) {
                $("#div_OptNumber").show();
                //$("#OptNumber").combobox('enable');
            } else {
                $("#div_OptNumber").hide();
                //$("#OptNumber").combobox('disable');
            }
            $("#lbl_OptNumber").text(text + "编号");
            $("#OptNumber").textbox('setValue', "");
        }

        function ControlStoreyLayer(isEnable, value) {
            //if (isEnable) {
            //    $("#StoreyLayer").textbox('enable').textbox('setValue', value);
            //} else {
            //    $("#StoreyLayer").textbox('disable').textbox('setValue', value);
            //}
        }
        $(function () {
            InitPage();
        });
        function InitPage() {

            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            var search = $.getUrlParam("search");
            if (!!search) {
                var param = {};
                $.dataPostJson('DivfManage_Dialog', 'GetModelCurOrganCommunity', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (!data.result) {
                            if (!!data.CommID && data.CommID != "0") {
                                $(".searchtool").hide();
                                //$("#CommID").val(data.CommID);
                                //$("#CommName").textbox('setValue', data.CommName).textbox("disable");
                            }
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
                $(".edittool").hide();
            }

            ControlOptNumber(false, '');
            var data = [{ id: '房屋', text: '房屋' }, { id: '车位', text: '车位' }, { id: '广告', text: '广告' }, { id: '场地', text: '场地' }];
            $('#Type').combobox({
                editable: false,
                required: false,
                width: '100px',
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                        ControlOptNumber(false, '');
                    }
                }],
                onSelect: function (record) {
                    if (record.text == "房屋") {
                        ControlStoreyLayer(false, '');
                        ControlOptNumber(true, record.text);
                    } else if (record.text == "车位") {
                        ControlStoreyLayer(true, '');
                        ControlOptNumber(true, record.text);
                    } else {
                        ControlStoreyLayer(true, '');
                        ControlOptNumber(false, record.text);
                    }
                }
            });
            data = [{ id: '是', text: '是' }, { id: '否', text: '否' }];
            $('.sf').combobox({
                editable: false,
                required: false,
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });

            var data = [{ id: '个', text: '个' }, { id: '平米', text: '平米' }];
            $('#CalculateCostUnit').combobox({
                editable: false,
                required: false,
                //width: '100%',
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                        $("#lblCalculateCostUnit").html('');
                    }
                }],
                onChange: function (newValue, oldValue) {
                    $("#lblCalculateCostUnit").html(" / " + newValue);
                }
            });

            var data = [{ id: '日', text: '日' }, { id: '月', text: '月' }, { id: '季', text: '季' }, { id: '年', text: '年' }];
            $('#PriceUnit').combobox({
                editable: false,
                required: false,
                //width: '100%',
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id',
                textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });
        }


        var column = [[
            //{ field: 'ck', checkbox: true },

            { field: 'CommName', title: '项目名称', width: 200, align: 'center', sortable: false },
            { field: 'Type', title: '点位类型', width: 100, align: 'center', sortable: false },
            { field: 'CategoryName', title: '点位类别', width: 150, align: 'center', sortable: false },
            { field: 'Number', title: '点位编号', width: 250, align: 'center', sortable: false },
            { field: 'RegionName', title: '点位区域', width: 150, align: 'center', sortable: false },
            { field: 'StoreyLayer', title: '所属楼宇', width: 200, align: 'center', sortable: false },
            { field: 'IsInstall', title: '是否安装表计', width: 100, align: 'center', sortable: false },
            {
                field: 'IsDisable', title: '是否停用', width: 100, align: 'center', sortable: false, styler: function (value, row, index) {
                    if (value == "是") {
                        return 'background-color:#ffee00;color:red;';
                    }
                }
            },
            { field: 'TradePlanName', title: '招商规划', width: 100, align: 'center', sortable: false },
            { field: 'Price', title: '指导价格(元)', width: 100, align: 'center', sortable: false },
            {
                field: 'UseState', title: '当前状态', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            { field: 'CustName', title: '当前客户', width: 100, align: 'center', sortable: false },
            {
                field: 'PointBeginTime', title: '开始时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'PointEndTime', title: '结束时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'AddTime', title: '登记时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'QRCode', title: '二维码', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    var urlParam = $.param(row);
                    value = "<a onclick=\"QRCode('" + urlParam + "');\" href=\"javascript:void(0);\">查看二维码</a>";
                    return value;
                }
            },
            {
                field: 'OptNumber1', title: '房屋编号', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "房屋") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            {
                field: 'OptNumber2', title: '车位编号', width: 150, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (row.Type == "车位") {
                        value = row.OptNumber;
                    }
                    return value;
                }
            },
            { field: 'Name', title: '点位名称', width: 250, align: 'center', sortable: false },
            { field: 'Position', title: '点位位置', width: 250, align: 'center', sortable: false },
            { field: 'Area', title: '点位面积(平方米)', width: 110, align: 'center', sortable: false },
            {
                field: 'SizeLength', title: '点位尺寸(厘米)', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "长:&nbsp;" + row.SizeLength + "&emsp;宽:&nbsp;" + row.SizeWidth + "&emsp;高:&nbsp;" + row.SizeHeight;
                    //if (!!row.SizeLength) {
                    //    value = "长:&nbsp;" + row.SizeLength;
                    //}
                    //if (!!row.SizeWidth) {
                    //    value += "&emsp;宽:&nbsp;" + row.SizeWidth;
                    //}
                    //if (!!row.SizeHeight) {
                    //    value += "&emsp;高:&nbsp;" + row.SizeHeight;
                    //}
                    return value;
                }
            },
            {
                field: 'Remark', title: '备注', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!value && value.length >= 14) {
                        value = value.substring(0, 14) + "...";
                    }
                    return value;
                }
            },
            { field: 'CalculateCostUnit', title: '计费单位', width: 100, align: 'center', sortable: false },
            {
                field: 'PriceUnit', title: '价格单位', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (!!row.CalculateCostUnit) {
                        value = row.PriceUnit + "&nbsp;/&nbsp;" + row.CalculateCostUnit;
                    }
                    return value;
                }
            },

            { field: 'Sort', title: '序号', width: 80, align: 'center', sortable: false },
            {
                field: 'Opt', title: '操作', width: 150, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            },
        ]];
        function InitDataGrid() {

            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("DivfManage_Point", "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }

        function Edit(title, opType) {
            var id = "";
            if (opType == "Edit") {
                var row = $("#dg").datagrid("getSelected");
                if (row) {
                    if (row.IsDisable == "是") {
                        $.messager.alert("温馨提示", '点位编号: [ ' + row.Number + ' ] 该点位已被停用,禁止编辑!');
                        return;
                    }
                    id = row.ID;
                } else {
                    $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    return;
                }
            }
            var param = { "OpType": opType, "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Point/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Point/Tab.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }
        function QRCode(urlParam) {
            //var urlParam = { "ID": id };
            LayerDialog.Open('250', '450', '/HM/M_Main/DiversifiedManage/PointManage/Point/QrCode.aspx?' + urlParam, "二维码", true, function callback(data) {
            });

        }
        function Del() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                $.messager.confirm('确定', '是否删除?', function (r) {
                    if (r) {
                        $.dataPostJson('DivfManage_Point', 'Del', { "idList": row.ID }, true, false,
                            function Init() {
                            },
                            function callback(data) {
                                if (data.result) {
                                    InitDataGrid();
                                } else { $.messager.alert("温馨提示", data.msg); }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }
                });
            } else {
                $.messager.alert("温馨提示", '请选择需要删除的数据!');
            }
        }

        function Export() {
            var param = $.getParam();
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TableName = "点位信息";
            param.Class = "DivfManage_Point";
            param.Method = "GetListSqlWhere";
            console.log($.param(param));
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }

        function Import() {
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Point/Import.aspx?' + $.param({}), "导入", true, function callback(data) {
                InitDataGrid();
            });
        }

    </script>
</body>
</html>
