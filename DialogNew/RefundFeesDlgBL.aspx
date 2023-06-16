<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RefundFeesDlgBL.aspx.cs" Inherits="M_Main.DialogNew.RefundFeesDlgBL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>退款查询</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .DialogTable {
            font-size: 12px;
            font-family: 'Microsoft YaHei UI';
            table-layout: fixed;
        }

            .DialogTable .DialogTdTitle {
                height: 25px;
                /*width: 100px;*/
                text-align: right;
            }

            .DialogTable .DialogTdContent {
                height: 25px;
                /*width: 180px;*/
                text-align: left;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiCustName" type="hidden" name="hiCustName" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" runat="server" />
        <input id="hiBuildNames" type="hidden" size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0" style="width: 100%" class="DialogTable">
                <tr>
                    <td colspan="8">
                        <table class="DialogTable" id="t3" style="width: 100%;">
                            <tr>
                                <td class="DialogTdTitle">退款类型</td>
                                <td class="DialogTdContent">
                                    <select id="DListRefundType" runat="server" name="DListRefundType" onchange="DListRefundTypeChange();">
                                        <option value="1" selected>实收、冲抵费用退款</option>
                                        <option value="2">预存余额退款</option>
                                    </select>
                                </td>
                                <td class="DialogTdTitle"></td>
                                <td class="DialogTdContent"></td>
                                <td class="DialogTdTitle"></td>
                                <td class="DialogTdContent"></td>
                                <td class="DialogTdTitle"></td>
                                <td class="DialogTdContent"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <table class="DialogTable" id="t1" style="width: 100%;">
                            <tr>
                                <td class="DialogTdTitle">退款类型</td>
                                <td class="DialogTdContent">
                                    <select id="BusinessType" style="width: 80%;" name="BusinessType" runat="server">
                                        <option value="0" selected>全部</option>
                                        <option value="1">实收</option>
                                        <%--<option value="2">预收</option>--%>
                                        <option value="3">冲抵</option>
                                    </select></td>
                                <td class="DialogTdTitle">楼宇</td>
                                <td class="DialogTdContent">
                                    <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false" name="BuildNames" runat="server" />
                                </td>
                                <td class="DialogTdTitle">客户名称</td>
                                <td class="DialogTdContent">
                                    <input id="CustName" searcher="SelCust" style="width: 80%;" name="CustName" class="easyui-searchbox" runat="server" />
                                    <input id="CustID" type="hidden" name="CustID" runat="server" /></td>
                                <td class="DialogTdTitle">可选房号</td>
                                <td class="DialogTdContent">
                                    <select id="SelectRoomID" style="width: 80%;" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                                        <option selected></option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td class="DialogTdTitle">房屋编号</td>
                                <td class="DialogTdContent">
                                    <input id="RoomSign" searcher="SelRoom" style="width: 80%;" name="RoomSign" class="easyui-searchbox" runat="server" data-options="required:false" />
                                    <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server" />
                                    <input id="hiRoomSign" type="hidden" size="1" name="hiRoomSign" runat="server" /></td>
                                <td class="DialogTdTitle">收据号码</td>
                                <td class="DialogTdContent">
                                    <input type="text" class="easyui-validatebox" id="BillsSign" runat="server" />
                                </td>
                                <td class="DialogTdTitle">收款/冲抵时间从</td>
                                <td class="DialogTdContent">
                                    <input type="text" class="Wdate" id="EditBeginDate" name="EditBeginDate" style="width: 80%;" runat="server"
                                        onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd ', skin: 'default' })"
                                        format="date" />
                                </td>
                                <td class="DialogTdTitle">到</td>
                                <td class="DialogTdContent">
                                    <input type="text" class="Wdate" id="EditEndDate" name="EditEndDate" style="width: 80%;" runat="server"
                                        onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd ', skin: 'default' })"
                                        format="date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="DialogTdTitle">费用项目</td>
                                <td colspan="7" class="DialogTdContent">
                                    <input id="CostNames" class="easyui-searchbox" searcher="SelCost" style="width: 96%;"
                                        name="CostNames" runat="server" />
                                    <input id="CostIDs" type="hidden" size="1" name="CostIDs" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="8">
                                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="RefundLoad();">确定筛选</a>
                                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="SaveChoose();">确定选择</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <table class="DialogTable" id="t2" style="display: none; width: 100%">
                            <tr>
                                <td class="DialogTdTitle" style="width: 12.5%;">客户名称</td>
                                <td class="TdContentSearch" style="width: 12.5%;">
                                    <input id="CustName2" searcher="SelCust2" style="width: 180px;" name="CustName2" class="easyui-searchbox" runat="server" />
                                    <input id="CustID2" type="hidden" size="1" name="CustID2" runat="server" />
                                    <input id="hiCustName2" type="hidden" size="1" name="hiCustName2" runat="server" /></td>
                                <td class="DialogTdTitle" style="width: 12.5%;">可选房号</td>
                                <td class="TdContentSearch" style="width: 12.5%;">
                                    <select id="SelectRoomID2" style="width: 180px;" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID2" runat="server">
                                        <option selected></option>
                                    </select></td>
                                <td class="DialogTdTitle" style="width: 12.5%;">房屋编号</td>
                                <td class="TdContentSearch" style="width: 12.5%;">
                                    <input id="RoomSign2" searcher="SelRoom2" style="width: 180px;" name="RoomSign2" class="easyui-searchbox" runat="server" data-options="required:false" />
                                    <input id="RoomID2" type="hidden" size="1" name="RoomID2" runat="server" />
                                    <input id="hiRoomSign2" type="hidden" size="1" name="hiRoomSign2" runat="server" /></td>
                                <td class="DialogTdTitle"></td>
                                <td class="DialogTdContent"></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="8">
                                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="RefundLoad2();">确定筛选</a>
                                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="SaveChoose();">确定选择</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>

        <div id="RefundDiv" name="RefundDiv">
            <div class="SearchContainer" id="TableContainer" name="TableContainer">
            </div>
        </div>
        <div id="PreDiv" name="PreDiv">
            <div class="SearchContainer" id="TableContainer2" name="TableContainer2">
            </div>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">

    function InitFunction() {
        var h = $(window).height();
        $("#TableContainer").css("height", (h - 148) + "px");
        $("#TableContainer2").css("height", (h - 120) + "px");
    }
    InitFunction();

    var toolbar = [
        {
            text: '确定选择',
            iconCls: 'icon-save',
            handler: function () {
                var rows = $('#TableContainer').datagrid('getChecked');
                if (rows == "") {
                    HDialog.Info('请勾选费项!');
                    return;
                }
                else {
                    var str = JSON.stringify(rows);
                    var res = "{\"total\":" + rows.length + ", \"rows\":" + str + "}";
                    HDialog.Close(res);
                }
            }
        }, '-',
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }
    ];

    function SaveChoose() {
        var CustID = '';
        var RoomID = '';
        if ($('#DListRefundType').val() == "1") {
            CustID = $('#CustID').val();
            RoomID = $('#RoomID').val();
            var rows = $('#TableContainer').datagrid('getChecked');
            if (rows == "") {
                HDialog.Info('请勾选费项!');
                return;
            }
            else {
                var str = JSON.stringify(rows);
                var res = "{\"total\":{\"total\":" + rows.length + ", \"rows\":" + str + "},\"RoomID\":\"" + RoomID + "\",\"CustID\":\"" + CustID + "\"}";
                HDialog.Close(res);
            }
        }
        if ($('#DListRefundType').val() == "2") {
            CustID = $('#CustID2').val();
            RoomID = $('#RoomID2').val();
            var rows = $('#TableContainer2').datagrid('getChecked');
            if (rows == "") {
                HDialog.Info('请勾选费项!');
                return;
            }
            else {
                var str = JSON.stringify(rows);
                var res = "{\"total\":{\"total\":" + rows.length + ", \"rows\":" + str + "},\"RoomID\":\"" + RoomID + "\",\"CustID\":\"" + CustID + "\"}";
                HDialog.Close(res);
            }
        }
    }

    function SelBuild() {
        var varReturn;
        HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {
            if (_Data != "") {//**获得返回 刷新
                var varObjects = _Data.split("|");
                var BuildSNums = "";
                var BuildNames = "";
                $('#BuildSNums').val(BuildSNums);
                $('#BuildNames').searchbox('setValue', BuildNames);

                for (var i = 0; i < varObjects.length; i++) {
                    if (varObjects[i].indexOf(",") > 0) {
                        var d1 = varObjects[i].split(",")[0];
                        var d2 = varObjects[i].split(",")[1];

                        BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                        BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                    }
                }
                $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
            }
        });
    }

    function OpenDlg() {
        if ($('#DListRefundType').val() == "1") {
            $('#SearchDlg').parent().appendTo($("form:first"))
            $('#SearchDlg').dialog('open');
        }
        if ($('#DListRefundType').val() == "2") {
            $('#SearchDlg2').parent().appendTo($("form:first"))
            $('#SearchDlg2').dialog('open');
        }

    }

    function DListRefundTypeChange() {
        if ($('#DListRefundType').val() == "2") {
            var h = $(window).height();
            $("#RefundDiv").hide();
            $("#PreDiv").show();
            $('#SearchDlg').dialog('close');
            $('#SearchDlg2').parent().appendTo($("form:first"))
            $('#SearchDlg2').dialog('open');
            $('#DListRefundType').val(1);

            //$('#CustName2').searchbox("setValue", '');
            //$('#CustID2').val('');
            //$('#RoomSign2').searchbox("setValue", '');
            //$('#RoomID2').val('');
            //$('#SelectRoomID2').combobox('clear');
            $("#hiIsSQLData").val('');
            LoadList2();
            $('#DListRefundType').val(2)


            $("#t1").hide();
            $("#t2").show();
        }

        if ($('#DListRefundType').val() == "1") {

            $("#t2").hide();
            $("#t1").show();

            var h = $(window).height();
            $("#RefundDiv").show();
            $("#PreDiv").hide();
            $('#SearchDlg2').dialog('close');

            $('#SearchDlg').parent().appendTo($("form:first"))
            $('#SearchDlg').dialog('open');

            //$('#CustName').searchbox("setValue", '');
            //$('#CustID').val('');
            //$('#RoomSign').searchbox("setValue", '');
            //$('#RoomID').val('');
            //$('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
            $('#BillsSign').val('');

            $('#BillsSign').val('');
            $('#CostIDs').val('');
            $('#CostNames').searchbox('setValue', '');
            $('#DListRefundType').val(1)
            $("#hiIsSQLData").val('');
            LoadList();
        }
    }

    function RefundLoad() {
        $("#hiIsSQLData").val(1);
        //if ($('#RoomID').val() == '') {
        //    HDialog.Info('请选择房屋！');
        //    return false;
        //}
        LoadList();
    }

    function RefundLoad2() {
        $("#hiIsSQLData").val(1);
        //if ($('#RoomID2').val() == '') {
        //    HDialog.Info('请选择房屋！');
        //    return false;
        //}
        LoadList2();
    }


    var column = [[
        { field: 'ck', checkbox: true },
        { field: 'RecdID', title: 'RecdID', hidden: true },
        { field: 'BusinessTypeName', title: '退款类型', width: 100, align: 'left', sortable: true, hidden: true },
        { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true, hidden: true },
        { field: 'ParkName', title: '车位编号', width: 120, align: 'left', sortable: true },
        { field: 'BillsSign', title: '收据号码', width: 120, align: 'left', sortable: true },
        {
            field: 'ChargeDate', title: '收款/冲抵时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.ChargeDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'CostName', title: '费用名称', width: 120, align: 'left', sortable: true
        },
        {
            field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
        },
        {
            field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ChargeAmount', title: '收款/冲抵金额', width: 100, align: 'left', sortable: true,
            //formatter: function (value, row, index) {
            //    var str = "";
            //    var param = 'BusinessType=' + row.BusinessType + '&RecdID=' + row.RecdID + '&FeesID=' + row.FeesID + '&ReceID=' + row.strReceID + '';
            //    str = "<a class=\"HrefStyle\"  href='#' onclick=\"RefundFeesSecAudit('" + param + "');\">" + row.ChargeAmount + "</a>";
            //    return str;
            //}
        },
        { field: 'LateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },
        { field: 'CanRefundAllAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
        { field: 'isCanRefundAmount', title: '可申请金额', width: 100, align: 'left', sortable: true },
        { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
        { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true }

    ]];

    var column1 = [[
        { field: 'ck', checkbox: true },
        { field: 'PrecID', title: 'PrecID', hidden: true },
        { field: 'BusinessTypeName', title: '退款类型', width: 100, align: 'left', sortable: true, hidden: true },
        { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
        { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
        { field: 'ParkNames', title: '车位编号', width: 180, align: 'left', sortable: true },
        {
            field: 'ChargeAmount', title: '预交余额', width: 180, align: 'left', sortable: true,
            //formatter: function (value, row, index) {
            //    var str = "";
            //    str = "<a class=\"HrefStyle\"  href='#' onclick=\"PreCostsRefundSecAudit('" + row.PrecID + "');\">" + row.ChargeAmount + "</a>";
            //    return str;
            //}
        },
        { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
        { field: 'ParIsPrecNamekName', title: '是否参与冲抵', width: 180, align: 'left', sortable: true },
        {
            field: 'CostName', title: '冲抵费用项目', width: 180, align: 'left', sortable: true
        },
        { field: 'CanRefundAllAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
        { field: 'isCanRefundAmount', title: '可申请金额', width: 100, align: 'left', sortable: true },
        { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
        { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true }

    ]];

    function RefundFeesSecAudit(param) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../ChargesNew/RefundFeesSecAudit.aspx?' + param,
            '退款提交', false, function (_data) {
                LoadList();
            });
    }

    function PreCostsRefundSecAudit(strPrecID) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../ChargesNew/PreCostsRefundSecAudit.aspx?PrecID=' + strPrecID,
            '退款提交', false, function (_data) {
                LoadList2();
            });
    }

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            //toolbar: toolbar,
            width: "100%",
            sortOrder: "asc",
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("RefundFees", "RefundFeesDetail", "TableContainer", param);
            }
        });

        $('#SearchDlg').dialog('close');
    }


    function LoadList2() {
        $("#TableContainer2").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column1,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            sortOrder: "asc",
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("RefundFees", "RefundPreCosts", "TableContainer2", param);
            },
            onLoadSuccess: function (data) {
            }, onDblClickRow: function (rowIndex, rowData) {

            }
        });
        $('#SearchDlg2').dialog('close');
    }

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


        var w = $(window).width();
        var h = $(window).height();

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                function Init() {
                },
                function callback(_Data) {

                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {

                        var RoomData = [];
                        for (var i = 0; i < varObjects.length; i++) {

                            var vIsDelLive = varObjects[i].IsDelLive;
                            var strTmp = "";

                            if (vIsDelLive == 1) {
                                strTmp = "(历史)";
                            }
                            var RoomID = varObjects[i].RoomID;
                            var RoomSign = varObjects[i].RoomSign;
                            var Buildarea = varObjects[i].BuildArea;

                            var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                        }
                        $('#SelectRoomID').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {


                                var data = $('#SelectRoomID').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                            $('#RoomID').val(data[i].RoomID.split('|')[0]);

                                            break;
                                        }
                                    }
                                }
                            }
                        });
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        });
    }


    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";

        var w = $(window).width();
        var h = $(window).height();

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);


            $('#SelectRoomID').combobox({
                data: '',
                valueField: 'RoomID',
                textField: 'RoomText'
            });

        });
    }


    function SelCust2() {

        $('#CustName2').searchbox("setValue", '');
        $('#CustID2').val('');
        $('#RoomSign2').searchbox("setValue", '');
        $('#RoomID2').val('');
        $('#SelectRoomID2').combobox('clear');


        var w = $(window).width();
        var h = $(window).height();

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName2').searchbox("setValue", data.CustName);
            $('#CustID2').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                function Init() {
                },
                function callback(_Data) {

                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {

                        var RoomData = [];
                        for (var i = 0; i < varObjects.length; i++) {

                            var vIsDelLive = varObjects[i].IsDelLive;
                            var strTmp = "";

                            if (vIsDelLive == 1) {
                                strTmp = "(历史)";
                            }
                            var RoomID = varObjects[i].RoomID;
                            var RoomSign = varObjects[i].RoomSign;
                            var Buildarea = varObjects[i].BuildArea;

                            var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                        }
                        $('#SelectRoomID2').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {

                                var data = $('#SelectRoomID2').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign2').searchbox('setValue', data[i].RoomText);
                                            $('#RoomID2').val(data[i].RoomID.split('|')[0]);


                                            break;
                                        }
                                    }
                                }
                            }
                        });
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        });
    }


    function SelRoom2() {
        $('#CustName2').searchbox("setValue", '');
        $('#CustID2').val('');
        $('#RoomSign2').searchbox("setValue", '');
        $('#RoomID2').val('');
        $('#SelectRoomID2').combobox('clear');

        var conent = "../DialogNew/RoomDlg.aspx";

        var w = $(window).width();
        var h = $(window).height();

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign2').searchbox("setValue", data.RoomSign);
            $('#CustName2').searchbox("setValue", data.CustName);
            $('#CustID2').val(data.CustID);
            $('#RoomID2').val(data.RoomID);


            $('#SelectRoomID2').combobox({
                data: '',
                valueField: 'RoomID',
                textField: 'RoomText'
            });

        });
    }


    function SelCost() {
        var w = 700;
        var h = 400;
        HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {
            if (_Data != "") {//**获得返回 刷新
                var varObjects = _Data.split("\t");

                $('#CostIDs').val(varObjects[0]);
                $('#CostNames').searchbox('setValue', varObjects[1]);

            }
        });
    }
    $(function () {
        $('#CustName').searchbox("setValue", $("#hiCustName").val());
        $('#CustName2').searchbox("setValue", $("#hiCustName").val());
        LoadList();
    })
</script>
