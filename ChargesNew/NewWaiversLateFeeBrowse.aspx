<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewWaiversLateFeeBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewWaiversLateFeeBrowse" %>


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

</head>
<body>
    <form id="frmForm" runat="server">

        <input id="CommID" name="CommID" type="hidden" runat="server" />
        <input id="AllData" name="AllData" type="hidden" runat="server" />
        <input id="hiWaivType" name="hiWaivType" type="hidden" runat="server" />
        <input id="hiLateFeeEndDate" name="hiLateFeeEndDate" type="hidden" runat="server" />
        <input id="FeesRoleCodes" type="hidden" name="FeesRoleCodes" runat="server">
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">应收日期从</td>
                    <td class="TdContentSearch">
                        <select id="CreYear1" name="CreYear1" runat="server">
                            <option selected></option>
                        </select>年<select id="CreMonth1" name="CreMonth1" runat="server">
                            <option selected></option>
                        </select>月</td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <select id="CreYear2" name="CreYear2" runat="server">
                            <option selected></option>
                        </select>年<select id="CreMonth2" name="CreMonth2" runat="server">
                            <option selected></option>
                        </select>月</td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:false" searcher="SelCust" runat="server" dd="dd" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" style="width: 98%" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />

                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames"
                            name="CostNames" runat="server" /><input class="Control_ItemInput" id="CostIDs" style="width: 8px;" type="hidden"
                                            size="1" name="CostIDs" runat="server" /><input class="Control_ItemInput" id="hiCostNames" style="width: 8px; height: 22px" type="hidden"
                                                size="1" name="hiCostNames" runat="server" /></td>
                    <td class="TdTitle">减免状态</td>
                    <td class="TdContentSearch">
                        <select id="IsWaived" name="IsWaived" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>


                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="减免方式选择" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">减免方式</td>
                    <td class="TdContent">
                        <select id="WaivType" name="WaivType" runat="server" onchange="WaivTypeOnChange();"></select></td>
                    <td class="TdTitle">
                        <asp:Label ID="lbWaivFeesAmount" runat="server">减免金额</asp:Label></td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" onkeypress="CheckNumeric();" id="WaivFeesAmount" maxlength="50"
                            name="WaivFeesAmount" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">
                        <asp:Label ID="lbLateFeeEndDate" runat="server">计算截止日期</asp:Label></td>
                    <td class="TdContent">
                        <input class="Wdate" id="LateFeeEndDate" onclick="WdatePicker()" name="LateFeeEndDate" runat="server"></td>
                    <td class="TdTitle">
                        <asp:Label ID="lbWaivRates" runat="server">减免比例</asp:Label></td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" onkeypress="CheckNumeric();" id="WaivRates" maxlength="50"
                            name="WaivRates" runat="server">%</td>
                </tr>
                <tr>
                    <td class="TdTitle">减免备注</td>
                    <td class="TdContent" colspan="3">
                        <input class="Control_ItemInput" id="WaivMemo"
                            name="WaivMemo" runat="server"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="WaiversLateFeeInWaiv();">确定减免</a>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            function WaivTypeOnChange() {
                var strWaivType = document.getElementById('WaivType').value;


                hiWaivType.Value = strWaivType;

                WaivFeesAmount.Value = "";
                LateFeeEndDate.Value = "";
                WaivRates.Value = "";

                $('#WaivFeesAmount').attr("disabled", "disabled");
                $('#LateFeeEndDate').attr("disabled", "disabled");
                $('#WaivRates').attr("disabled", "disabled");
                $('#LateFeeEndDate').val('');
                //按减免金额
                if (strWaivType == "1" || strWaivType == "4") {
                    $('#WaivFeesAmount').removeAttr("disabled");
                }
                //按减免时间
                if (strWaivType == "2") {
                    $('#LateFeeEndDate').removeAttr("disabled");

                    $('#LateFeeEndDate').val($('#hiLateFeeEndDate').val());

                }
                //按减免比例
                if (strWaivType == "3") {
                    $('#WaivRates').removeAttr("disabled");
                }


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
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#CalcArea').val(buildArea);

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

                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);
                });

            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCommCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }

                });

            }


            var column = [[

                { field: 'ck', checkbox: true },

                { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 120, align: 'left', sortable: true },
                {
                    field: 'FeesDueDate', title: '应收日期', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },

                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
                { field: 'OldLateFeeAmount', title: '现在的合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'WaivTypeName', title: '减免方式', width: 100, align: 'center', sortable: true },
                { field: 'WaivBaseFeesAmount', title: '减免基数', width: 100, align: 'center', sortable: true },
                { field: 'WaivFeesAmount', title: '减免金额', width: 100, align: 'center', sortable: true },
                { field: 'WaivLateFeeAmount', title: '减免的合同违约金', width: 130, align: 'left', sortable: true },
                {
                    field: 'LateFeeEndDate', title: '计算截至日期', width: 120, align: 'center', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.LateFeeEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'WaivRates', title: '减免比例', width: 100, align: 'center', sortable: true },
                { field: 'WaivDate', title: '减免登记时间', width: 100, align: 'center', sortable: true },
                { field: 'WaivMemo', title: '减免备注', width: 100, align: 'center', sortable: true }




            ]];


            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '减免登记',
                    iconCls: 'icon-save',
                    handler: function () {

                        if ($('#IsWaived').val() == "1") {
                            HDialog.Info('请选择减免状态为否!');
                        }
                        else {
                            var rows = $('#TableContainer').datagrid('getChecked');
                            if (rows == "") {
                                HDialog.Info('请选择费用!');
                            }
                            else {

                                var SelData = JSON.stringify(rows);

                                $('#AllData').val(SelData);
                                //HDialog.Prompt('合同违约金减免确认', function () {
                                //    $('#SearchDlg2').parent().appendTo($("form:first"))
                                //    $('#SearchDlg2').dialog('open');

                                //});
                                $('#SearchDlg2').parent().appendTo($("form:first"))
                                $('#SearchDlg2').dialog('open');

                            }
                        }


                    }
                }, '-',
                {
                    text: '撤销减免',
                    iconCls: 'icon-cancel',
                    handler: function () {

                        if ($('#IsWaived').val() == "0") {
                            HDialog.Info('请选择减免状态为是!');
                        }
                        else {
                            var rows = $('#TableContainer').datagrid('getChecked');
                            if (rows == "") {
                                HDialog.Info('请选择费用!');
                            }
                            else {

                                var SelData = JSON.stringify(rows);
                                $('#AllData').val(SelData);

                                HDialog.Prompt('合同违约金撤销减免', function () {
                                    $.tool.DataPostChk('frmForm', 'AuditManage', 'WaiversLateFeeUnWaiv', $('#frmForm').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data.split('|');

                                            if (r[0] == "true") {
                                                LoadList();
                                            }
                                            HDialog.Info(r[1]);

                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                });

                            }
                        }


                    }
                }, '-',
                {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = "../ChargesNew/NewWaiversLateFeeExcel.aspx?";
                    }
                }
            ];


            //指定列求和
            function compute(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }

            function WaiversLateFeeInWaiv() {
                $('#SearchDlg2').dialog('close');
                $.tool.DataPostChk('frmForm', 'AuditManage', 'WaiversLateFeeInWaiv', $('#frmForm').serialize() + "&iIsAudit=1",
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data.split('|');
                        if (r[0] == "true") {
                            LoadList();
                        }
                        HDialog.Info(r[1]);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
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
                    showFooter: true,
                    view: myview,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("AuditManage", "WaiversLateFeeList", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }

                    },
                    onLoadSuccess: function (data) {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                CustName: "<span style='color:red'>合计</span>",
                                DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                                DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>",
                                OldLateFeeAmount: "<span style='color:red'>" + compute("OldLateFeeAmount") + "</span>",
                                WaivFeesAmount: "<span style='color:red'>" + compute("WaivFeesAmount") + "</span>",
                                WaivLateFeeAmount: "<span style='color:red'>" + compute("WaivLateFeeAmount") + "</span>"
                            }
                        ]);
                    }
                });
                $("#SearchDlg").dialog("close");
                $('#SearchDlg2').dialog('close');


            }
            LoadList();

        </script>
    </form>
</body>
</html>


