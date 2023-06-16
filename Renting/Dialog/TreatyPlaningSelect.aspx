<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreatyPlaningSelect.aspx.cs" Inherits="M_Main.Renting.Dialog.TreatyPlaningSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择合约规划</title>
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
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body class="easyui-layout" style="padding: 0px; margin: 0px; overflow: hidden;">
    <div data-options="region:'north',split:false,border:false" style="height: 300px;">
        <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    </div>
    <div data-options="region:'center'" style="background: #eee;">
        <table id="TableContainerRoom" border="0" cellspacing="0" cellpadding="0"></table>
    </div>
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <label class="control-label">合约类型</label>
                    <input id="TreatyPlaningType" name="TreatyPlaningType" class="easyui-textbox" data-options="prompt:'',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <label class="control-label">房屋编号</label>
                    <input id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="prompt:'',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
                </div>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            InitDataGrid();
        });
        var column = [[
            { field: 'CommName', title: '项目名称', width: 200, align: 'center' },
            { field: 'TreatyPlaningType', title: '合约类型', width: 140, align: 'center' },
            { field: 'ContractPeriod', title: '合同期限(月)', width: 100, align: 'center' },
            { field: 'ChargeCalculationName', title: '计费方式', width: 120, align: 'center' },
            { field: 'CalculationMethodName', title: '计算方式', width: 120, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准', width: 80, align: 'center' },
            { field: 'GuaranteeAmount', title: '保底金额(元)', width: 100, align: 'center' },
            { field: 'BusinessRoyaltyRaiseAmount', title: '营业提成起提金额(元)', width: 150, align: 'center' },
            { field: 'ContractDepositPrice', title: '合同保证金(元)', width: 100, align: 'center' },
            { field: 'ContPeriod', title: '计费周期(月)', width: 80, align: 'center' },
            { field: 'RoomCount', title: '房屋数量(套)', width: 80, align: 'center' },
            { field: 'BuildAreaCount', title: '建筑面积(平米)', width: 100, align: 'center' }
        ]];
        function InitDataGrid() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: '#toolbar',
                remoteSort: false,
                onSelect: function (rowIndex, rowData) {
                    LoadRoomList(rowData.ID);
                },
                onDblClickRow: function (index, row) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 1;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("Renting_TreatyPlaning", "GetTreatyPlaningSelectList", param);
                },
                onLoadSuccess: function (data) {
                    if (data.rows.length > 0) {
                        $('#TableContainer').datagrid("selectRow", "0");
                    } else {
                        LoadRoomList("");
                    }
                },
                onLoadError: function (data) {
                    LoadRoomList("");
                }
            });
        }
        function Save() {
            var row = $("#TableContainer").datagrid("getSelected");
            if (row) {
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(row);
            } else {
                $.messager.alert("温馨提示", '请选择一行需要的数据!');
            }
        }

        //加载合约规划下的房屋
        var Roomcolumn = [[
            { field: 'BuildName', title: '楼宇名称', width: 100, align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 80, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准', width: 80, align: 'center' },
            { field: 'RentCostItemName', title: '租金费项', width: 100, align: 'center' },
            { field: 'RentRoomState', title: '状态', width: 60, align: 'center' }
        ]];

        function LoadRoomList(TreatyPlaningID) {
            $("#TableContainerRoom").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
                columns: Roomcolumn,
                rownumbers: true,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: true,
                border: true,
                pagination: false,
                width: "100%",
                toolbar: null,
                rowStyler: function (index, row) {
                    if (row.RentRoomState =='已租') {
                        return 'color:#44B5FE;';
                    } else if (row.RentRoomState == '认租') {
                        return 'color:#8978F0;';
                    } else if (row.RentRoomState == '待租') {
                        return 'color:#DC8DDA;';
                    }
                },
                onBeforeLoad: function (param) {
                    param.TreatyPlaningID = TreatyPlaningID;
                    param.RoomSign = $('#RoomSign').val();
                    param = $.getDataGridParam("Renting_TreatyPlaning", "GetTreatyPlaningRoomList", param);
                },
                onLoadSuccess: function (data) {
                }
            });
        }

    </script>
</body>
</html>
