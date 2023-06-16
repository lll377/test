<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UseSearch.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Point.UseSearch" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>点位使用信息</title>
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
    <input id="search" name="search" type="hidden" />
    <input id="ContractPointID" name="ContractPointID" type="hidden" />
    <input id="MerchantsID" name="MerchantsID" type="hidden" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel',plain:true,onClick:function(){Export();}">导出</a></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 1000px; height: 540px;" data-options="
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
                <legend class="frame-legend">基本信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">合同编号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ContractSign" name="ContractSign" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:'unnormal'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">合同名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="ContractName" name="ContractName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:'unnormal'"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">点位编号</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Number" name="Number" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:'unnormal'" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">点位类型</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Type" name="Type" class="easyui-textbox" />
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
                    <label class="col-sm-1 col-xs-1 control-label">点位面积</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartArea" name="StartArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndArea" name="EndArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'<='" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">计费数量</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartChargeNumber" name="StartChargeNumber" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',prompt:'>='" />
                        <label class="control-text">-</label>
                        <input id="EndChargeNumber" name="EndChargeNumber" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',prompt:'<='" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">开始时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartPointBeginTime" name="StartPointBeginTime" class="easyui-datebox" data-options="prompt:'>=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" /><label class="control-text">-</label>
                        <input id="EndPointBeginTime" name="EndPointBeginTime" class="easyui-datebox" data-options="prompt:'<=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />

                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">结束时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartPointEndTime" name="StartPointEndTime" class="easyui-datebox" data-options="prompt:'>=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" /><label class="control-text">-</label>
                        <input id="EndPointEndTime" name="EndPointEndTime" class="easyui-datebox" data-options="prompt:'<=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal">
                        优惠免租<br />
                        结束时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartRentFreeEndTime" name="StartRentFreeEndTime" class="easyui-datebox" data-options="prompt:'>=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" /><label class="control-text">-</label>
                        <input id="EndRentFreeEndTime" name="EndRentFreeEndTime" class="easyui-datebox" data-options="prompt:'<=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">启用时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartInTime" name="StartInTime" class="easyui-datebox" data-options="prompt:'>=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" /><label class="control-text">-</label>
                        <input id="EndInTime" name="EndInTime" class="easyui-datebox" data-options="prompt:'<=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label" style="line-height: normal">退租时间</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="StartOutTime" name="StartOutTime" class="easyui-datebox" data-options="prompt:'>=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" /><label class="control-text">-</label>
                        <input id="EndOutTime" name="EndOutTime" class="easyui-datebox" data-options="prompt:'<=',editable:false,icons:[{iconCls:'icon-clear',handler: function(e){$(e.data.target).datebox('clear');}}]" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">客户名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="CustName" name="CustName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
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

        $(function () {
            InitPage();
        });
        function InitPage() {
            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            var param = $.getUrlParam();
            console.log(param);
            if (!!param && !!param.search) {
                if (!!param.ID) {
                    if (param.beacon == "Point") {
                        $("#ContractPointID").val(param.ID);
                    } else {
                        $("#MerchantsID").val(param.ID);
                    }
                    $("#toolbar").html('');
                }
                $("#search").val(param.search);
                //$.dataPostJson('DivfManage_Dialog', 'GetModelCurOrganCommunity', {}, true, false,
                //    function Init() {
                //    },
                //    function callback(data) {
                //        if (!data.result) {
                //            if (!!data.CommID && data.CommID != "0") {
                //                $(".searchtool").hide();
                //                //$("#CommID").val(data.CommID);
                //                //$("#CommName").textbox('setValue', data.CommName).textbox("disable");
                //            }
                //        }
                //    },
                //    function completeCallback() {
                //    }, function errorCallback() {
                //    });
            }
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
                        //ControlOptNumber(false, '');
                    }
                }],
                onSelect: function (record) {
                    //if (record.text == "房屋") {
                    //    ControlStoreyLayer(false, '');
                    //    ControlOptNumber(true, record.text);
                    //} else if (record.text == "车位") {
                    //    ControlStoreyLayer(true, '');
                    //    ControlOptNumber(true, record.text);
                    //} else {
                    //    ControlStoreyLayer(true, '');
                    //    ControlOptNumber(false, record.text);
                    //}
                }
            });
        }

        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'CommName', title: '项目名称', width: 200, align: 'center', sortable: false },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center', sortable: false },
            { field: 'ContractSign', title: '合同编号', width: 150, align: 'center', sortable: false },
            { field: 'ContractName', title: '合同名称', width: 300, align: 'center', sortable: false },
            {
                field: 'Type', title: '点位类型', width: 150, align: 'center', sortable: false
            },
            {
                field: 'CategoryName', title: '点位类别', width: 150, align: 'center', sortable: false
            },
            { field: 'RegionName', title: '点位区域', width: 100, align: 'center', sortable: false },
            { field: 'Number', title: '点位编号', width: 250, align: 'center', sortable: false },
            { field: 'Area', title: '点位面积', width: 100, align: 'center', sortable: false },
            { field: 'ChargeNumber', title: '计费数量', width: 100, align: 'center', sortable: false },
            {
                field: 'PointBeginTime', title: '开始时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'PointEndTime', title: '结束时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'RentFreeEndTime', title: '优惠免租<br/>结束时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'InTime', title: '启用时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'OutTime', title: '退租时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
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
                toolbar: '#toolbar',
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    //Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "ContractSign";
                    param.SortOrder = 1;
                    param.IsDelete = 0;

                    param = $.getDataGridParam("DivfManage_Point", "GetListContractPoint", param);
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

        function Edit(title, id) {
            var OpType = "Add";
            if (isValueNull(id)) { OpType = "Edit"; }
            var param = { "OpType": OpType, "ID": id };
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
        function Del(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.dataPostJson('DivfManage_Point', 'Del', { "idList": idList }, true, false,
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
        }
        function Export() {
            var param = $.getParam();
            param.PageSize = 5000;
            param.IsPagination = "否";
            param.IsZip = "否";
            param.TableName = "点位使用信息";
            param.Class = "DivfManage_Point";
            param.Method = "GetListContractPointSqlWhere";
            window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param));
        }
    </script>
</body>
</html>
