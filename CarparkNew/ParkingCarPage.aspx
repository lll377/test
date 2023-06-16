<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingCarPage.aspx.cs" Inherits="M_Main.CarparkNew.ParkingCarPage" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>车位管理--添加车辆信息</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="ParkID" type="hidden" size="1" name="ParkID" runat="server">
        <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server">
        <input id="CustID" type="hidden" size="1" name="CustID" runat="server">
        <input id="CustName" type="hidden" size="1" name="CustName" runat="server">
        <input id="RoomSign" type="hidden" size="1" name="RoomSign" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">

    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
        $("#TableContainer").css("width", w + "px");
    }

    var toolbar = [
        {
            text: '新增',
            iconCls: 'icon-add',
            handler: function () {
                ViewDetail("绑定车辆信息", 'add', "");
            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择删除项！');
                    return;
                }
                DelRecord(row.ID);
            }
        }];

    var column = [[
        { field: 'ID', title: 'ID', width: '5%', align: 'left', sortable: true, hidden: true },
        { field: 'CarNum', title: '车牌号码', width: '10%', align: 'left', sortable: true },
        { field: 'Brand', title: '车辆品牌', width: '10%', align: 'left', sortable: true },
        { field: 'Owner', title: '车主姓名', width: '10%', align: 'left', sortable: true },
        { field: 'Category', title: '车辆类别', width: '10%', align: 'left', sortable: true },
        { field: 'Color', title: '车辆颜色', width: '10%', align: 'left', sortable: true },
        { field: 'Displacement', title: '排量', width: '10%', align: 'left', sortable: true },
        { field: 'CustName', title: '客户名称', width: '10%', align: 'left', sortable: true },
        { field: 'RoomSign', title: '房间名称', width: '10%', align: 'left', sortable: true },
        { field: 'ParkName', title: '车位名称', width: '20%', align: 'left', sortable: true }
        /*{
            field: '删除', title: '删除', width: '10%', align: 'left', sortable: true,
            formatter: function (value, row, index) {
                str = "<a class=\"HrefStyle\"  href='#' onclick=\"DelRecord( '" + row.ID + "' );\">删 除</a>";
                return str;
            }
        }*/
    ]];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: false,
            rownumbers: true,
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("ParkingCarDatePeriod", "search", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }

    function ViewDetail(title, OpType, ID) {
        var roomId = $('#RoomID').val();
        var custId = $('#CustID').val();
        var custName = $('#CustName').val();
        var roomSign = $('#RoomSign').val();
        var parkId = $('#ParkID').val();
        HDialog.Open(800, 300, '../CarparkNew/ParkingCarManage.aspx?CarID=' + ID + '&OpType=' + OpType + '&CustID=' + custId + '&RoomID=' + roomId
            + '&CustName=' + custName + '&RoomSign=' + roomSign + '&ParkID=' + parkId + "",
            title, false, function callback(_Data) {
                console.log(_Data)
                //if (_Data == "true") {
                    InitTableHeight();
                    LoadList();
                //}
            });
    }

    function DelRecord(Id) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('ParkingCarDatePeriod', 'delete', 'Id=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "true") {
                            HDialog.Info('删除成功');
                        }
                        else { HDialog.Info('删除失败'); }
                        LoadList();

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }

</script>
