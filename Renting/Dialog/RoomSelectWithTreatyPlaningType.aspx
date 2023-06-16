<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomSelectWithTreatyPlaningType.aspx.cs" Inherits="M_Main.Renting.Dialog.RoomSelectWithTreatyPlaningType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-合约包含的房屋选择</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <style type="text/css">
        .form-horizontal {
            padding: 3px;
        }

            .form-horizontal .form-group {
                margin: 0;
                margin-top: 5px;
            }

                .form-horizontal .form-group:first-child {
                    margin: 0;
                }
    </style>
</head>
<body class="easyui-layout" style="padding: 0px; margin: 0px; overflow: hidden;">
    <div data-options="region:'north',split:false,border:false" style="height: 300px;">
        <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    </div>
    <div data-options="region:'center',title:'已选房屋'" style="background: #eee;">
        <table id="dgSelected" border="0" cellspacing="0" cellpadding="0"></table>
    </div>
    <input type="hidden" name="TreatyPlaningType" id="TreatyPlaningType" runat="server" />
    <input type="hidden" name="RoomIDs" id="RoomIDs" runat="server" />
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">房屋编号</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="RoomSign" name="RoomSign" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">房屋名称</label>
                <div class="col-sm-3 col-xs-3">
                    <input id="RoomName" name="RoomName" runat="server" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
                <div class="col-sm-4 col-xs-4">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:100" onclick="SelectRoomOk();">确定选择</a>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript">
        $(function () {
            var TreatyPlaningType = $.getUrlParam("TreatyPlaningType");
            var RoomIDs = $.getUrlParam("RoomIDs");
            if (TreatyPlaningType != null) {
                $("#TreatyPlaningType").val(TreatyPlaningType);
            }
            if (RoomIDs != null) {
                $("#RoomIDs").val(RoomIDs);
            }
            InitDataGrid();//加载 未选房屋
            InitSelectedDataGrid(); // 加载 已选房屋
        });

        /* 未选房屋 */
        var column = [[
            { field: 'ck', checkbox: true },
            { field: 'RoomSign', title: '房屋编号', width: 200, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 200, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'center' },
            { field: 'RegionName', title: '组团区域', width: 100, align: 'center' },
            { field: 'BuildName', title: '楼宇', width: 200, align: 'center' },
            { field: 'UnitSNum', title: '单元', width: 100, align: 'center' },
            { field: 'FloorSNum', title: '楼层', width: 100, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准', width: 100, align: 'center' },
            { field: 'RentCostItemName', title: '租金费项', width: 100, align: 'center' },
            { field: 'RentRoomState', title: '房屋状态', width: 80, align: 'center' }
        ]];

        //加载未选点位
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
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
                toolbar: "#toolbar",
                rowStyler: function (index, row) {
                    if (row.RentRoomState == '已租') {
                        return 'color:#44B5FE;';
                    } else if (row.RentRoomState == '认租') {
                        return 'color:#8978F0;';
                    } else if (row.RentRoomState == '待租') {
                        return 'color:#DC8DDA;';
                    }
                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("RentingPublicClass", "GetRoomListWithTreatyPlaningType", param);
                },
                onLoadSuccess: function (data) {

                }
            });
        }

        //确定选择房屋
        function SelectRoomOk() {
            var rows = $("#dg").datagrid("getChecked");
            if (rows.length > 0) {
                //循环构建选择的点位IDs 
                let RoomIDsValue = $("#RoomIDs").val();
                rows.forEach((itemRow) => {
                    if (!RoomIDsValue.includes(itemRow.RoomID)) {
                        if (RoomIDsValue.endsWith(",")) {
                            RoomIDsValue = RoomIDsValue + String(itemRow.RoomID);
                        } else {
                            if (RoomIDsValue.length == 0) {
                                RoomIDsValue = String(itemRow.RoomID);
                            } else {
                                RoomIDsValue = RoomIDsValue + ',' + String(itemRow.RoomID);
                            }
                        }
                    }
                });
                $("#RoomIDs").val(RoomIDsValue);
                InitDataGrid();
                InitSelectedDataGrid();
            } else {
                $.messager.alert('温馨提示', "请至少勾选一行数据");
            }
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
                        let RoomIDsValue = $("#RoomIDs").val();
                        rows.forEach((itemRow) => {
                            if (RoomIDsValue.includes(itemRow.RoomID + ",")) {
                                RoomIDsValue = RoomIDsValue.replace(String(itemRow.RoomID) + ",", "");
                            } else {
                                RoomIDsValue = RoomIDsValue.replace(String(itemRow.RoomID), "");
                            }
                            //判断尾部是否为，
                            if (RoomIDsValue.endsWith(",")) {
                                RoomIDsValue = RoomIDsValue.substring(0, RoomIDsValue.length - 1);
                            }
                        });
                        $("#RoomIDs").val(RoomIDsValue);
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
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(rows);
                }
            }
        ];
        //加载已选点位
        function InitSelectedDataGrid() {
            $("#dgSelected").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                fit: true,
                columns: column,
                rownumbers: true,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: true,
                border: false,
                pagination: false,
                width: "100%",
                toolbar: ToolbarSelected,
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("RentingPublicClass", "GetRoomListWithSelected", param);
                },
                onLoadSuccess: function (data) {
                }
            });
        }
    </script>
</body>
</html>
