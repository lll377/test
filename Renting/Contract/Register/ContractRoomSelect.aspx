<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractRoomSelect.aspx.cs" Inherits="M_Main.Renting.Contract.Register.ContractRoomSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-租赁合同-计费标准中（选择合同已选房屋）</title>
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
    <style type="text/css">
        .form-horizontal {
            padding: 3px;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <div id="TableContainer" style="width: 100%; height: 100%; background-color: #cccccc;"></div>
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
                </div>
            </div>
        </form>
    </div>
    <input type="hidden" id="IsMultiple" name="IsMultiple" value="否" />
    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            let param = $.getUrlParam();
            if (param.IsMultiple != null) {
                $("#IsMultiple").val(param.IsMultiple);
            }
            if ($("#IsMultiple").val() == "是") {
                column[0].unshift({ field: 'ck', checkbox: true });
            }

            InitDataGrid();
        });
        var column = [[
            { field: 'RoomSign', title: '房屋编号', width: 140, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 140, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 80, align: 'center' },
            { field: 'RoomChargeArea', title: '计租面积', width: 80, align: 'center' },
            { field: 'ChargeStandard', title: '计费标准', width: 80, align: 'center' },
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
            { field: 'RentFreeEndTime', title: '优惠免租结束时间', width: 120, align: 'center' },
            { field: 'PostPoneBeginTime', title: '顺延起租开始时间', width: 120, align: 'center' },
            {
                field: 'CheckInTime', title: '入住时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'RentOutTime', title: '退租时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            }
        ]];
        function InitDataGrid() {
            var RoomData = localStorage.getItem("ContractSettingItemRoom");
            //设置值为空
            localStorage.setItem("ContractSettingItemRoom", "");
            if (RoomData.length > 0) {
                RoomData = JSON.parse(RoomData);
            }
            var IsMultiple = $("#IsMultiple").val() == "是" ? true : false;
            $("#TableContainer").datagrid({
                data: RoomData,
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: column,
                rownumbers: true,
                singleSelect: !IsMultiple,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: '#toolbar',
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    if ($("#IsMultiple").val() == "否") {
                        var data = [];
                        data.push(row);
                        LayerDialog.ReturnIsJson = true;
                        LayerDialog.Close(data);
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
        }
        function Save() {
            if ($("#IsMultiple").val() == "否") {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row) {
                    var data = [];
                    data.push(row);
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(data);
                } else {
                    $.messager.alert("温馨提示", '请选择一行房屋数据的数据!');
                }
            } else {
                var rows = $("#TableContainer").datagrid("getChecked");
                if (rows.length > 0) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(rows);
                } else {
                    $.messager.alert("温馨提示", '请勾选一行房屋数据的数据!');
                }
            }
        }

    </script>
</body>
</html>
