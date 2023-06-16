<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRefundFeesNewSecCreate1.aspx.cs" Inherits="M_Main.ChargesNew.NewRefundFeesNewSecCreate1" %>


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

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">


        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>退款类型 </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td>
                        <select id="DListRefundType" runat="server" name="DListRefundType" onchange="DListRefundTypeChange();">
                            <option value="1" selected>实收、预收、冲抵费用退款</option>
                            <option value="2">预存余额退款</option>
                        </select></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" onclick=" JavaScript:OpenDlg(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">筛选退款</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>

                    <td>
                        <div class="datagrid-btn-separator"></div>
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
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">


            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">退款类型</td>
                    <td class="TdContentSearch">
                        <select id="BusinessType" name="BusinessType" runat="server">
                            <option value="0" selected>全部</option>
                            <option value="1">实收</option>
                            <option value="2">预收</option>
                            <option value="3">冲抵</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <tr>
                        <td class="TdTitle">客户名称</td>
                        <td class="TdContentSearch">
                            <input id="CustName" searcher="SelCust" style="width: 80%;"
                                name="CustName" class="easyui-searchbox" runat="server" />
                            <input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                        <td class="TdTitle">可选房号</td>
                        <td class="TdContentSearch">
                            <select id="SelectRoomID" style="width: 80%;" class="easyui-combobox" data-options="editable:false,panelHeight: '200'" name="SelectRoomID" runat="server">
                                <option selected></option>
                            </select></td>
                    </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom" style="width: 80%;"
                            name="RoomSign" class="easyui-searchbox" runat="server" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign" runat="server" /></td>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="ParkName" type="text" name="ParkName" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">收款/冲抵时间从</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EditBeginDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" name="EditBeginDate"
                            runat="server" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EditEndDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" name="EditEndDate"
                            runat="server" /></td>

                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" searcher="SelCost" style="width: 80%;"
                            name="CostNames" runat="server" /><input id="CostIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="CostIDs"
                                runat="server" /><input id="hiCostNames" style="width: 16px; height: 22px" type="hidden" size="1" name="hiCostNames"
                                    runat="server" /><%--<input class="button_sel" id="btnSelCostIDs" style="height: 22px" onclick="javascript:if(btnSelCostIDs_OnClick()==false) return false;"
                                        type="button" name="btnSelCostIDs" runat="server">--%><input id="CostID" style="width: 16px; height: 22px" type="hidden" size="1" name="CostID"
                                            runat="server" /><input id="hiCostIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="hiCostIDs"
                                                runat="server" /></td>
                    <td class="TdTitle">收据号码</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="BillsSign" type="text" name="BillsSign" runat="server" /></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a></td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg2" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">

            <table class="DialogTable">
                <%--  <tr>
                    <td class="TdTitle">退款类型</td>
                    <td class="TdContent">
                        <select id="DListRefundType2" runat="server" name="DListRefundType2" onchange="DListRefundTypeChange2();">
                            <option value="1">实收、预收、冲抵费用退款</option>
                            <option value="2" selected>预存余额退款</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>--%>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName2" searcher="SelCust2" style="width: 80%;"
                            name="CustName2" class="easyui-searchbox" runat="server" /><input id="CustID2" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID2" runat="server" /><input id="hiCustName2" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName2" runat="server" /></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID2" style="width: 80%;" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID2" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign2" searcher="SelRoom2" style="width: 80%;"
                            name="RoomSign2" class="easyui-searchbox" runat="server" /><input id="RoomID2" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID2" runat="server" /><input id="hiRoomSign2" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign2" runat="server" /></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList2();">确定筛选</a></td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                h = h - 32;
                $("#TableContainer").css("height", h + "px");
                $("#TableContainer2").css("height", h + "px");



            }
            InitFunction();

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
                    // $("#TableContainer2").css("height", h + "px");


                    $('#SearchDlg').dialog('close');

                    $('#SearchDlg2').parent().appendTo($("form:first"))
                    $('#SearchDlg2').dialog('open');
                    $('#DListRefundType').val(1);

                    $('#CustName2').searchbox("setValue", '');
                    $('#CustID2').val('');
                    $('#RoomSign2').searchbox("setValue", '');
                    $('#RoomID2').val('');
                    $('#SelectRoomID2').combobox('clear');


                    LoadList2();
                    $('#DListRefundType').val(2)
                }

                if ($('#DListRefundType').val() == "1") {

                    var h = $(window).height();
                    $("#RefundDiv").show();

                    $("#PreDiv").hide();

                    $('#SearchDlg2').dialog('close');

                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');

                    $('#CustName').searchbox("setValue", '');
                    $('#CustID').val('');
                    $('#RoomSign').searchbox("setValue", '');
                    $('#RoomID').val('');
                    $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
                    $('#BillsSign').val('');

                    $('#BillsSign').val('');
                    $('#CostIDs').val('');
                    $('#CostNames').searchbox('setValue', '');
                    $('#DListRefundType').val(1)
                    LoadList();
                }
            }

            function DListRefundTypeChange2() {
                if ($('#DListRefundType2').val() == "1") {

                    var h = $(window).height();
                    $("#RefundDiv").show();

                    $("#PreDiv").hide();

                    $('#SearchDlg2').dialog('close');

                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                    $('#DListRefundType2').val(2);

                    $('#CustName').searchbox("setValue", '');
                    $('#CustID').val('');
                    $('#RoomSign').searchbox("setValue", '');
                    $('#RoomID').val('');
                    $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
                    $('#BillsSign').val('');

                    $('#BillsSign').val('');
                    $('#CostIDs').val('');
                    $('#CostNames').searchbox('setValue', '');

                    LoadList();
                }

            }

            function SelCost() {
                var varReturn;

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


            var column = [[
                { field: 'BusinessTypeName', title: '退款类型', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
                {
                    field: 'CostName', title: '费用名称', width: 120, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        var param = 'opType=insert&BusinessType=' + row.BusinessType + '&RecdID=' + row.RecdID + '&FeesID=' + row.FeesID + '&ReceID=' + row.ReceID + '';
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"RefundFeesSecAudit('" + param + "');\">" + row.CostName + "</a>";
                        return str;
                    }
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
                    field: 'ChargeDate', title: '收款/冲抵时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ChargeDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                {
                    field: 'ChargeAmount', title: '收款/冲抵金额', width: 100, align: 'left', sortable: true
                },
                { field: 'LateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'isCanRefundAmount', title: '可申请金额', width: 100, align: 'left', sortable: true }
                , { field: 'RefundRoleNames', title: '未审岗位', width: 200, align: 'left', sortable: true },
                {
                    field: 'IsAuditNames', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = "";
                        //return str;
                        if (row.IsAudit == "1") {
                            str = "<span style=\'color:Red\'>" + row.IsAuditNames + "</span>";
                        }
                        else if (row.IsAudit == "2") {
                            str = "<span style=\'color:Blue\'>" + row.IsAuditNames + "</span>";
                        }
                        else {
                            str = "<span style=\'color:Green\'>" + row.IsAuditNames + "</span>";
                        }
                        return str;
                    }
                }
            ]];

            var column1 = [[

                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
                { field: 'ParkNames', title: '车位编号', width: 180, align: 'left', sortable: true },
                {
                    field: 'PrecAmount', title: '预交余额', width: 180, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"PreCostsRefundSecAudit('" + row.PrecID + "');\">" + row.PrecAmount + "</a>";
                        return str;
                    }
                },
                { field: 'ParIsPrecNamekName', title: '是否参与冲抵', width: 180, align: 'left', sortable: true },
                {
                    field: 'CostNames', title: '冲抵费用项目', width: 180, align: 'left', sortable: true
                },
                { field: 'PrecMemo', title: '备注', width: 180, align: 'left', sortable: true }

            ]];

            var toolbar = [
                {
                    text: '筛选退款',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }

            ];

            function RefundFeesSecAudit(param) {

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../ChargesNew/NewRefundFeesSecAudit.aspx?' + param,
                    '退款提交', false, function (_data) {
                        LoadList();
                    });
            }

            var toolbar1 = [
                {
                    text: '查询退款',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg2').parent().appendTo($("form:first"))
                        $('#SearchDlg2').dialog('open');

                    }
                }

            ];

            function PreCostsRefundSecAudit(strPrecID) {

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../ChargesNew/NewPreCostsRefundSecAudit.aspx?PrecID=' + strPrecID,
                    '退款提交', false, function (_data) {
                        LoadList();
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
                    width: "100%",

                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RefundFees", "RefundFeesDetail", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                    //, onDblClickRow: function (rowIndex, rowData) {
                    //    var w = $(window).width();
                    //    var h = $(window).height();
                    //    HDialog.Open(w, h, '../ChargesNew/RefundFeesSecAudit.aspx?BusinessType=' + rowData.BusinessType + '&RecdID=' + rowData.RecdID + '&FeesID=' + rowData.FeesID + '&ReceID=' + rowData.ReceID, '退款提交', false, function (_data) {
                    //        LoadList();
                    //    });

                    //}
                });

                $('#SearchDlg').dialog('close');
            }
            //LoadList();
            $("#TableContainer").datagrid({url:'',columns: column,border: false});

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
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RefundFees", "RefundPreCosts", "TableContainer2", param);
                    },
                    onLoadSuccess: function (data) {
                    }, onDblClickRow: function (rowIndex, rowData) {

                    }
                });
                $('#SearchDlg2').dialog('close');
            }

            $('#btnSearch').click(function () {

                LoadList();
                Clear();
                $("#SearchDlg").dialog("close");
            });


        </script>
    </form>
</body>
</html>
