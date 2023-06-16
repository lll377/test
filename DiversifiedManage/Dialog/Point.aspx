<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Point.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Point" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>点位选择框</title>
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
    <input id="IsCheckbox" name="IsCheckbox" value="否" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar">
        <form id="frm" class="form-horizontal" role="form">
            <input type="hidden" id="ChangeID" name="ChangeID" value="" />
            <div class="form-group">
                <label class="control-label">点位编号</label>
                <input id="Number" name="Number" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',validType:'unnormal'" />
                <label class="control-label">点位名称</label>
                <input id="Name" name="Name" class="easyui-textbox" data-options="required:false,tipPosition:'bottom'" />
                <label class="control-label">点位类别</label>
                <input type="hidden" id="CategoryID" name="CategoryID" />
                <input id="CategoryName" name="CategoryName" class="easyui-textbox" data-options="prompt:'',editable:false,tipPosition:'bottom',required:false,multiline:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCategory();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#CategoryID').val('');
                            }}] " />

                <label class="control-label">点位类型</label>
                <input id="Type" name="Type" class="easyui-combobox" />
                <div id="div_OptNumber" style="display: inline-block;">
                    <label class="control-label" id="lbl_OptNumber"></label>
                    <%--<input type="hidden" id="OptNumber" name="OptNumber" />--%>
                    <input id="OptNumber" name="OptNumber" class="easyui-textbox" data-options="prompt:'',editable:false,tipPosition:'bottom',required:false,multiline:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelOptNumber();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#OptNumber').val('');
                            }}] " />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label">点位区域</label>
                <input type="hidden" id="RegionID" name="RegionID" />
                <input id="RegionName" name="RegionName" class="easyui-textbox" data-options="prompt:'',editable:false,tipPosition:'bottom',required:false,multiline:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelRegion();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#RegionID').val('');
                            }}] " />
                <label class="control-label">点位位置</label>
                <input id="Position" name="Position" class="easyui-textbox" data-options="required:false,tipPosition:'bottom'" />
                <label class="control-label">所属楼宇</label>
                <input id="StoreyLayer_BuildSNum" name="StoreyLayer_BuildSNum" type="hidden" />
                <input id="StoreyLayer_UnitSNum" name="StoreyLayer_UnitSNum" type="hidden" />
                <input id="StoreyLayer_FloorSNum" name="StoreyLayer_FloorSNum" type="hidden" />
                <input id="StoreyLayer" name="StoreyLayer" class="easyui-textbox" data-options="prompt:'',editable:false,tipPosition:'bottom',required:false,multiline:false,
                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelStoreyLayer();},
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            $('#StoreyLayer_BuildSNum').val('');
                            $('#StoreyLayer_UnitSNum').val('');
                            $('#StoreyLayer_FloorSNum').val('');
                            }}] " />
                <label class="control-label">是否安装表计</label>
                <input id="IsInstall" name="IsInstall" class="easyui-combobox sf" style="width: 113px" />
                <label class="control-label">是否停用</label>
                <input id="IsDisable" name="IsDisable" class="easyui-combobox sf" />
            </div>
            <div class="form-group">
                <label class="control-label">点位面积</label>
                <input id="StartArea" name="StartArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'>=',width:80" />
                <label class="control-text">-</label>
                <input id="EndArea" name="EndArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'<=',width:80" />
                <label class="control-text">(单位:平米)</label>

                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
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
            var IsCheckbox = $.getUrlParam("IsCheckbox");
            $("#IsCheckbox").val(IsCheckbox);
            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            ControlOptNumber(false, '');
            var data = [{ id: '房屋', text: '房屋' }, { id: '车位', text: '车位' }, { id: '广告', text: '广告' }, { id: '场地', text: '场地' }];
            $('#Type').combobox({
                editable: false,
                required: false,
                //width: '100px',
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
            { field: 'ck', checkbox: true },
            { field: 'CommName', title: '项目名称', width: 200, align: 'center', sortable: false },
            { field: 'Type', title: '点位类型', width: 100, align: 'center', sortable: false },
            { field: 'CategoryName', title: '点位类别', width: 150, align: 'center', sortable: false },
            { field: 'RegionName', title: '点位区域', width: 150, align: 'center', sortable: false },
            { field: 'Number', title: '点位编号', width: 250, align: 'center', sortable: false },
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
            { field: 'StoreyLayer', title: '所属楼宇', width: 200, align: 'center', sortable: false },
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
            { field: 'IsInstall', title: '是否安装表计', width: 100, align: 'center', sortable: false },
            { field: 'IsDisable', title: '是否停用', width: 100, align: 'center', sortable: false },
            {
                field: 'Remark', title: '备注', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
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
            },
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
            { field: 'Sort', title: '序号', width: 80, align: 'center', sortable: false },
        ]];
        function InitDataGrid() {
            var IsCheckbox = false;
            if ($("#IsCheckbox").val() == "是") {
                IsCheckbox = true;
            }
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
                checkbox: IsCheckbox,
                singleSelect: !IsCheckbox,
                checkOnSelect: true,
                selectOnCheck: true,
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
                    if ($("#IsCheckbox").val() == "否") {
                        LayerDialog.ReturnIsJson = true;
                        LayerDialog.Close(row);
                    }
                },
                onBeforeLoad: function (param) {
                    param.SortField = "LongTimeStamp";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    if ($.getUrlParam("OriginalPoint") == "是") {//是:说明只查原始点位
                        param.MustChangeType = "";
                        param.UseState = "闲置";
                    }
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

        function Save() {
            if ($("#IsCheckbox").val() == "否") {
                var row = $("#dg").datagrid("getSelected");
                if (row) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                } else {
                    $.messager.alert("温馨提示", '请选择一行需要的数据!');
                }
            } else {
                var row = $("#dg").datagrid("getChecked");
                if (row.length > 0) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                } else {
                    $.messager.alert("温馨提示", '请选择一行需要的数据!');
                }
            }
        }

    </script>
</body>
</html>
