<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewBillsReceiptsHisBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewBillsReceiptsHisBrowse" %>



<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <script type="text/javascript">

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
    </script>
</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">

        <div class="SearchContainer" id="TableContainer">
        </div>
        <input id="btnPrint" name="btnPrint" type="button" runat="server" onserverclick="btnPrint_ServerClick" />
        <input id="AllReceData" name="AllReceData" type="hidden" runat="server" />
        <INPUT style="WIDTH: 24px; HEIGHT: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms"
								runat="server"/>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 300px;">

            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">收据类型
                    </td>
                    <td class="TdContentSearch">
                        <select id="DrReceive" runat="server" name="DrReceive" onchange="DrReceiveChange()">
                            <option value="1" selected>收款收据</option>
                            <option value="2">预交收款收据</option>
                            <option value="3">退款票据</option>
                            <option value="4">预交退款凭据</option>
                            <option value="5">收款收据(垫付)</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>

                <tr id="trSJ">
                    <td class="TdTitle">楼宇
                    </td>
                    <td class="TdContentSearch"><select id="BuildSNum" runat="server" style="width:150px"></select></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNum" name="RegionSNum" runat="server" style="width:150px">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust" style="width:150px"
                            name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">可选房号
                    </td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom"  style="width:150px"
                            name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign" runat="server" /></td>
                    <td class="TdTitle"><span id="spanskr">收款人</span></td>
                    <td class="TdContent">
                        <select id="UserCode" name="UserCode" style="width:150px" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle"><span id="spansj">收款时间从</span></td>
                    <td class="TdContent">
                        <input id="EditBeginDate" class="Wdate" style="width:150px"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" name="EditBeginDate"
                            runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EditEndDate" style="width:150px"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" name="EditEndDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始票号</td>
                    <td class="TdContent">
                        <input id="StartBillsSign" type="text" style="width:150px"
                            name="StartBillsSign" runat="server"></td>
                    <td class="TdTitle">截止票号</td>
                    <td class="TdContent">
                        <input id="EndBillsSign" type="text" style="width:150px"
                            name="EndBillsSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">
                        <span id="spanskfs">收款方式</span>
                    </td>
                    <td class="TdContent">
                        <select id="ChargeMode" name="ChargeMode" style="width:150px" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                          <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>

                    </td>
                </tr>
            </table>
        </div>
        
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
                $('#btnPrint').hide();
            }
            InitFunction();

            function DrReceiveChange()
            {
                if ($('#DrReceive').val() != 1) {
                    $("#trSJ").hide();
                    if ($('#DrReceive').val() == 3 || $('#DrReceive').val() == 4) {
                        $('#spansj').html("退款时间从");
                        $('#spanskfs').html("退款方式");
                        $('#spanskr').html("退款人");
                    }
                    else {
                        $('#spansj').html("收款时间从");
                        $('#spanskfs').html("收款方式");
                        $('#spanskr').html("收款人");
                    }
                }
                else {
                    $("#trSJ").show();
                    $('#spansj').html("收款时间从");
                    $('#spanskfs').html("收款方式");
                    $('#spanskr').html("收款人");
                }



            }

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 700;
                var h = 400;

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
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#CalcArea').val(buildArea);
                                                    $('#RoomID').val(data[i].RoomID.split("|")[0]);
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
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);
                });
            }




            var columnReceipts = [[
                       { field: 'ck', checkbox: true },
                    { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                     { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                     { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                     {
                         field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true
                     },
                     {
                         field: 'BillsDate', title: '收费日期', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                             return str;
                         }
                     },
                     { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                     { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                     { field: 'ReceMemo', title: '备注', width: 100, align: 'left', sortable: true }




            ]];

            var columnPrecReceipts = [[
                  { field: 'ck', checkbox: true },
                    { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                    { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                    {
                        field: 'PrecDate', title: '预交收款时间', width: 100, align: 'left', sortable: true
                    },
                    { field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true },
                    {
                        field: 'CostNames', title: '冲抵费用项目', width: 150, align: 'left', sortable: true
                    },
                    { field: 'PrecAmount', title: '预交金额', width: 100, align: 'left', sortable: true },
                    { field: 'UserName', title: '预交操作人', width: 100, align: 'left', sortable: true },
                    { field: 'AccountWayName', title: '处理方式', width: 100, align: 'left', sortable: true },
                    { field: 'PrecMemo', title: '备注', width: 100, align: 'left', sortable: true },
                     { field: 'PrintTimes', title: '打印次数', width: 100, align: 'left', sortable: true }

            ]];

            var columnRefundReceipts = [[

                { field: 'ck', checkbox: true },
                { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                {
                    field: 'RefundBillSNum', title: '退款票号', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'RefundDate', title: '退款日期', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.RefundDate, "yyyy-MM-dd HH:mm:ss");
                return str;
                }
                },
                { field: 'RefundMode', title: '退款方式', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '退款人', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
                { field: 'PrintTime', title: '打印次数', width: 100, align: 'left', sortable: true }


            ]];

            var columnPreRefundReceipts = [[

                { field: 'ck', checkbox: true },
                { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                {
                field: 'BillsSign', title: '退款票号', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'PrecDate', title: '退款日期', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                return str;
                }
                },
                { field: 'PrecAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '退款人', width: 100, align: 'left', sortable: true },
                { field: 'AccountWayName', title: '处理方式', width: 100, align: 'left', sortable: true },
                { field: 'PrintTimes', title: '打印次数', width: 100, align: 'left', sortable: true },
                { field: 'PrecMemo', title: '备注', width: 100, align: 'left', sortable: true }


            ]];


            var columnAdvanceReceipts = [[

                { field: 'ck', checkbox: true },
                    { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                     { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                     { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                     {
                         field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true
                     },
                     {
                         field: 'BillsDate', title: '收费日期', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                             return str;
                         }
                     },
                     { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                     { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                      { field: 'PaidAmount', title: '收款金额', width: 100, align: 'left', sortable: true },

                     { field: 'ReceMemo', title: '备注', width: 100, align: 'left', sortable: true }


            ]];


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-', {
                    text: '打印',
                    iconCls: 'icon-print',
                    handler: function () {
                     
                        var rows = $('#TableContainer').datagrid('getChecked');
                        if (rows == "") {
                            HDialog.Info('请选择要打印的票据!');
                        }
                        else {

                            var SelData = JSON.stringify(rows);
                            $('#AllReceData').val(SelData);

                            $('#btnPrint').click();
                        }

                    }
                }
            ];


            function LoadList() {

                var column = columnReceipts;

                switch ($('#DrReceive').val()) {
                    case '1':
                        column = columnReceipts;
                        break;
                    case '2':
                        column = columnPrecReceipts;
                        break;
                    case '3':
                        column = columnRefundReceipts;
                        break;
                    case '4':
                        column = columnPreRefundReceipts;
                        break;
                    case '5':
                        column = columnAdvanceReceipts;
                        break;

                }

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {

                        switch ($('#DrReceive').val()) {
                            case '1':
                                param = $.JQForm.GetParam("BillsReceiptsPrint", "Receipts", "TableContainer", param);
                                break;
                            case '2':
                                param = $.JQForm.GetParam("BillsReceiptsPrint", "PrecReceipts", "TableContainer", param);
                                break;
                            case '3':
                                param = $.JQForm.GetParam("BillsReceiptsPrint", "RefundReceipts", "TableContainer", param);
                                break;
                            case '4':
                                param = $.JQForm.GetParam("BillsReceiptsPrint", "PrecRefundReceipts", "TableContainer", param);
                                break;
                            case '5':
                                param = $.JQForm.GetParam("BillsReceiptsPrint", "AdvanceReceipts", "TableContainer", param);
                                break;
                        }
                    },
                    onLoadSuccess: function (data) {
                    }
                });

                $('#SearchDlg').dialog('close');

            }
            LoadList();


        </script>
    </form>
</body>
</html>


