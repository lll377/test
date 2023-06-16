<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiversTranFee.aspx.cs" Inherits="M_Main.HouseNew.WaiversTranFee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <table id="Table1">
        <tr>
            <td colspan="4"></td>
        </tr>
        <tr>
            <td class="TdTitle">现业主名称:</td>
            <td class="TdContentSearch">
                <asp:Label ID="LbCustName" runat="server"></asp:Label>
            </td>
            <td class="TdTitle">房屋编号:</td>
            <td class="TdContentSearch">
                <asp:Label ID="LbRoomSign" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="TdTitle">原业主名称:</td>
            <td class="TdContentSearch">
                <asp:Label ID="LbMasterName" runat="server"></asp:Label>
            </td>
            <td class="TdTitle">变更时间:</td>
            <td class="TdContentSearch">
                <asp:Label ID="LbChargeTime" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <form id="form1" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
            <input type="hidden" id="CustID" runat="server" />
            <input type="hidden" id="EditBeginDate" runat="server" />
            <input type="hidden" id="EditEndDate" runat="server" />
            <input type="hidden" id="rows" runat="server" value="1000" />
            <input type="hidden" id="page" runat="server" value="1" />
            <input type="hidden" id="WaivTypeName" runat="server" value="按总额减免" />
            <input type="hidden" id="RoomID" runat="server" />
            <input type="hidden" id="IsWaivOver" runat="server" value="1" />
        </div>
    </form>
    <input type="hidden" id="LiveID" runat="server" />
    <input type="hidden" id="NewCustID" runat="server" />
    <input type="hidden" id="FeesIDs" runat="server" />
    <input type="hidden" id="PrecIDs" runat="server" />
    <input type="hidden" id="LimitCount" runat="server" />
    <div style="text-align: center; padding-top: 10px">
        <input class="button" id="btnSave" type="button" value="确定转移" name="btnSave" runat="server" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server" />
    </div>
    <div id="toolbar">
        <table style="width: 100%;">
            <tr>
                <td style="padding-left: 5px;"><span class="fa fa-laptop"></span>原业主减免费用</td>
            </tr>
        </table>
    </div>
</body>
</html>

<script>

    var w = $(window).width();
    var h = $(window).height();

    $(function () {
        $("#TableContainer").css("height", h * 0.8 + "px");
        LoadList();
        $("#btnReturn").click(function () {
            HDialog.Close("");
        });
        $("#btnSave").click(function () {
            $.messager.confirm('确定', '是否转移选定项', function (r) {
                if (r) {
                    var rows = $("#TableContainer").datagrid('getSelections');
                    if (rows == null || rows == '') {
                        HDialog.Info('请选择费用！');
                        return;
                    }
                    var waivIDs = "";
                    var IsCanTransfer = true;
                    $.each(rows, function (id, values) {
                        waivIDs += values.WaivID + ',';
                        if (values.IsCanTransfer == "False") {
                            IsCanTransfer = false;
                            return false;
                        }
                    });
                    if (!IsCanTransfer) {
                        HDialog.Info("包含不可转移的协议！！！");
                        return false;
                    }
                    waivIDs = waivIDs.substring(0, waivIDs.length - 1);
                    $.tool.DataGet('WaiversFees', 'WaiversTranFee', 'WaivIDs=' + waivIDs + '&NewCustID=' + $("#NewCustID").val() + '&CustID=' + $("#CustID").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info('转移成功');
                            }
                            else { HDialog.Info('转移失败'); }
                            LoadList();

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            });

        });
    });

    var toolbar = "";

    var frozenColumns = [[
        { field: 'ck', checkbox: true },
        { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true }
    ]];
    var column = [[
        { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true },
        { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
        { field: 'CostNames', title: '费用名称', width: 180, align: 'left', sortable: true },
        { field: 'WaiversCategory', title: '减免业务类型', width: 100, align: 'left', sortable: true },
        { field: 'WaivAmount', title: '减免总金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivedAmount', title: '已减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivModifyAmount', title: '取消减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivMonthAmount', title: '每月减免金额', width: 100, align: 'left', sortable: true },
        { field: 'WaivRates', title: '减免比例', width: 80, align: 'left', sortable: true },
        { field: 'WaivTypeName', title: '减免类型', width: 100, align: 'left', sortable: true },
        {
            field: 'WaivStateDuring', title: '开始时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivStateDuring, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'WaivEndDuring', title: '结束时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivEndDuring, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'UserName', title: '减免登记人', width: 100, align: 'left', sortable: true },
        { field: 'WaivCreDate', title: '减免登记时间', width: 150, align: 'left', sortable: true },
        { field: 'WaivReason', title: '减免原因', width: 130, align: 'left', sortable: true },
        { field: 'WaivMemo', title: '备注', width: 120, align: 'left', sortable: true },
        {
            field: 'IsAudit', title: '审核状态', width: 80, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.IsAudit == 1) {
                    str = "<font  style='color:Red;'>已通过</font>";
                } else if (row.IsAudit == 2) {
                    str = "<font  style='color:Blue;'>未通过</font>";
                }
                else {
                    str = "<font  style='color:Green;'>未审核</font>";
                }
                return str;
            }
        },
        { field: 'WaivAgreement', title: '减免协议编号', width: 120, align: 'left', sortable: true },
        { field: 'WaivContent', title: '协议内容', width: 200, align: 'left', sortable: true },
        {
            field: 'WaivAgreementDate', title: '协议时间', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.WaivAgreementDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'LastMoney', title: '结算后剩余金额', width: 100, align: 'left', sortable: true },
    ]];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=WaiversFees&Command=getwaiversfeelist&' + $("#form1").serialize(),
            method: "post",
            nowrap: false,
            toolbar: "#toolbar",
            pageSize: [100],
            pageList: [100, 500],
            columns: column,
            frozenColumns: frozenColumns,
            check: true,
            fitColumns: false,
            remoteSort: false,
            singleSelect: false,
            pagination: false,
            width: "100%",
            border: false,
            showFooter: true
        });
    }

</script>
