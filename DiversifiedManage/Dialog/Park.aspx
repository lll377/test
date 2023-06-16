<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Park.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Park" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>车位选择</title>
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
    <style type="text/css">
        .form-horizontal {
            padding: 3px;
        }
    </style>
</head>
<body>
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <label class="control-label">车位编号</label>
                    <input id="ParkName" name="ParkName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <label class="control-label">客户名称</label>
                    <input id="CustName" name="CustName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <label class="control-label">房屋编号</label>
                    <input id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <label class="control-label">房屋名称</label>
                    <input id="RoomName" name="RoomName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
                </div>
            </div>
        </form>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitDataGrid();
        });
        var column = [[
            { field: 'CarparkName', title: '车位区域', width: 100, align: 'center', sortable: false },
            { field: 'ParkCategoryName', title: '车位类别', width: 100, align: 'center', sortable: false },
            { field: 'ParkType', title: '车位类型', width: 100, align: 'center', sortable: false },
            { field: 'ParkName', title: '车位编号', width: 200, align: 'center', sortable: false },
            { field: 'ParkArea', title: '车位面积', width: 100, align: 'center', sortable: false },
            {
                field: 'ContSubDate', title: '合同交付时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'ActualSubDate', title: '实际交付时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'TakeOverDate', title: '接管时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'StanAmount', title: '收费标准', width: 100, align: 'center', sortable: false },
            { field: 'UseState', title: '当前状态', width: 100, align: 'center', sortable: false },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center', sortable: false },
            { field: 'RoomSign', title: '房屋编号', width: 200, align: 'center', sortable: false },
            { field: 'RoomName', title: '房屋名称', width: 200, align: 'center', sortable: false },
            { field: 'RoomPropertyRights', title: '房屋产权性质', width: 100, align: 'center', sortable: false },
            { field: 'RoomPropertyUses', title: '房屋使用性质', width: 100, align: 'center', sortable: false },
            { field: 'ParkingCarSign', title: '停车卡号', width: 100, align: 'center', sortable: false },
            { field: 'CarSign', title: '车牌号码', width: 100, align: 'center', sortable: false },
            { field: 'CarEmission', title: '排量', width: 100, align: 'center', sortable: false },
            { field: 'PropertyUses', title: '使用状态', width: 100, align: 'center', sortable: false },
            { field: 'PropertyRight', title: '车位产权性质', width: 100, align: 'center', sortable: false },
            {
                field: 'HandDate', title: '办理时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'ParkStartDate', title: '开始时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            {
                field: 'ParkEndDate', title: '结束时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            },
            { field: 'ChargeCycleName', title: '计费周期', width: 100, align: 'center', sortable: false }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: false,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("DivfManage_Dialog", "GetListPark", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
        }
        function Save() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(row);
            } else {
                $.messager.alert("温馨提示", '请选择一行需要的数据!');
            }
        }


    </script>
</body>
</html>
