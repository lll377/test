<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesReportNew2.aspx.cs" Inherits="M_Main.StatisReport.FeesReportNew2" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/export.js"></script>

    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 230px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        #CostNames {
            width: 550px;
            height: 30px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 550px;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>

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
<body scroll="no">
    <form id="NewFeesDueCutSearch" runat="server">
        <input id="AllData" size="1" type="hidden" name="AllData" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="IsGather" type="hidden" size="1" name="IsGather" runat="server" />
        <input id="hidCommId" type="hidden" name="hidCommId" runat="server" />
        <input id="hiStatisMome" type="hidden" name="hiStatisMome" runat="server" />
        <input id="hiCompanyID" type="hidden" name="hiCompanyID" runat="server" />
        <input id="hiCorpCostID" type="hidden" name="hiCorpCostID" runat="server" />
        <input id="hiDetailType" type="hidden" name="hiDetailType" runat="server" />
        <input id="hiIsPrec" type="hidden" name="hiIsPrec" runat="server" />

        <input id="HiIsAll" type="hidden" name="HiIsAll" value="1" />

        <input type="checkbox" id="IsPrec" name="IsPrec" style="display: none;" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 820px; height: 330px; padding: 10px;">
            <table style="width: 100%; overflow: hidden;" class="DialogTable">

                <tr>
                    <td class="TdTitle" style="width: 200px;">管理项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                        <input id="hiCommNames" type="hidden"
                            name="hiCommNames" runat="server"><input id="CommIDs" type="hidden"
                                name="CommIDs" runat="server">
                        <input id="hiCommID" type="hidden" name="hiCommID" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames"
                            name="CostNames" runat="server" /><input id="CorpCostIDs" type="hidden"
                                name="CorpCostIDs" runat="server" /><input id="hiCostNames" type="hidden"
                                    name="hiCostNames" runat="server" /></td>
                </tr>
                <tr>

                    <td class="TdTitle">房屋状态</td>
                    <td class="TdContentSearch">
                        <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState"
                            name="RoomStateNames" runat="server" /><input id="RoomStates"
                                type="hidden" name="RoomStates" runat="server" />
                        <input id="hiRoomStateNames"
                            type="hidden" name="hiRoomStateNames" runat="server" />
                        <input style="width: 30px;" id="RoomStateNum" type="hidden"
                            size="14" name="RoomStateNum" runat="server" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>

                <tr>
                    <td class="TdTitle" style="width: 150px;">费用开始时间</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" id="DueBeginDate" runat="server" name="DueBeginDate" /></td>
                    <td class="TdTitle" style="width: 150px;">费用结束时间</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" runat="server" onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" id="DueEndDate" name="DueEndDate" /></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 150px;">收款开始时间</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" id="ChargeBeginDate" runat="server" name="ChargeBeginDate" /></td>
                    <td class="TdTitle" style="width: 150px;">收款结束时间</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" runat="server" onclick="WdatePicker({ startDate: '%y-%M-01 23:59:59', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" id="ChargeEndDate" name="ChargeEndDate" /></td>
                </tr>

                <tr>
                    <td class="TdTitle">收款方式</td>
                    <td class="TdContentSearch">
                        <select id="ChargeMode" name="ChargeMode" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'135px',multiple:true," runat="server" style="width: 50%">
                        </select></td>

                    <td class="TdTitle">统计范围</td>
                    <td class="TdContentSearch">
                        <select id="ModeType" name="ModeType">
                            <option value="">全部</option>
                            <option value="收款" selected="selected">收款</option>
                            <option value="退款">退款</option>
                        </select></td>

                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch">
                        <input type="checkbox" id="IsRefund" name="IsRefund" style="display: none;" />
                        <input id="hiIsRefund" type="hidden" name="hiIsRefund" runat="server" style="display: none;">
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="JavaScript:ExcuteOnServer();">统计</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="DlgDetail" class="easyui-dialog" title="收费率明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div id='tb'>
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
            </div>
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 550px; height: 205px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: red; font-size:14px;'>
                <tr>
                    <td valign="top" style='color: red; font-size:14px;'>备注：<br />
                        1、用于统计某一期间收取的费用金额；“T+1”表示不管统计条件如何设置，数据范围截止上日；<br />
2、交房状态：是指生成费用时的交房状态；<br />
3、统计范围：选择全部时，统计结果为收款减去退款的金额；<br />
4、收到前期：收到费用开始时间之前的费用金额；<br />
5、收到本期：收到费用开始时间至费用结束时间之间的费用金额；<br />
6、收到后期：收到费用结束时间之后的费用金额。<br />


                    </td>
                </tr>
            </table>
        </div>

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <input type="hidden" id="IsFirstLoad" name="IsFirstLoad" value="1" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(function () {
                $("#CustTypeID").combobox('setValue', '');
                $("#ChargeMode").combobox('setValue', '');
                var hidCommId = parseInt($("#hidCommId").val());
                if (hidCommId == 0) {
                    $("#StatisMome").parent().parent().hide();
                }
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#TableContainerDetail").css("height", "440px");
                var travelExpenseFrame = document.getElementById("pag");
                if ($("#hiCommID").val() != 0) {
                    $("#CommNames").attr('disabled', 'true');
                    $("#DiyTr").show();
                } else {
                    $("#DiyTr").hide();
                }
            }

            InitTableHeight();

            var Headcolumn = [
                [
                    {
                        title: '收费率报表（按金额）', colspan: 21
                    }
                ],
                [
                    {
                        title: '费用截止时间:' + $('#CutYearMonth').val() + ' 收款时间从:' + $('#ChargeBeginDate').val() + '到' + $('#ChargeEndDate').val(), colspan: 21, align: 'left'
                    }
                ],
                [
                    { field: 'Company', title: '单位', align: 'left', sortable: true, width: 100 },
                    { field: 'CorpCostName', title: '费用名称', align: 'left', sortable: true, width: 100 },

                    { field: '期初往年欠费', title: '期初往年欠费', align: 'center', sortable: true, width: 120 },
                    { field: '本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 120 },

                    { field: '本月应收', title: '本月应收', align: 'center', sortable: true, width: 120 },

                    { field: '实收往年', title: '往年', align: 'center', sortable: true, width: 120 },
                    { field: '实收本月', title: '本月', align: 'center', sortable: true, width: 120 },
                    { field: '实收本年', title: '本年', align: 'center', sortable: true, width: 120 },
                    { field: '实收小计', title: '小计', align: 'center', sortable: true, width: 120 },

                    { field: '冲抵往年', title: '往年', align: 'center', sortable: true, width: 120 },
                    { field: '冲抵本月', title: '本月', align: 'center', sortable: true, width: 120 },
                    { field: '冲抵本年', title: '本年', align: 'center', sortable: true, width: 120 },
                    { field: '冲抵小计', title: '小计', align: 'center', sortable: true, width: 120 },

                    { field: '减免往年', title: '往年', align: 'center', sortable: true, width: 120 },
                    { field: '减免本月', title: '本月', align: 'center', sortable: true, width: 120 },
                    { field: '减免本年', title: '本年', align: 'center', sortable: true, width: 120 },
                    { field: '减免小计', title: '小计', align: 'center', sortable: true, width: 120 },

                    { field: '欠收往年', title: '欠收往年', align: 'center', sortable: true, width: 120 },
                    { field: '欠收本年', title: '欠收本年', align: 'center', sortable: true, width: 120 },
                    { field: '欠收小计', title: '欠收小计', align: 'center', sortable: true, width: 120 },

                    {
                        field: '往年欠费回收率', title: '往年欠费回收率(%)', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本月收缴率', title: '本月收缴率(%)', align: 'center', sortable: true, width: 500, formatter: function (value) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    }
                ]
            ];

            var ExcelCol = [
                { field: 'Company', title: '单位', align: 'left', sortable: true, width: 100 },
                { field: 'CorpCostName', title: '费用名称', align: 'left', sortable: true, width: 100 },

                { field: '期初往年欠费', title: '期初往年欠费', align: 'center', sortable: true, width: 120 },
                { field: '本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 120 },

                { field: '本月应收', title: '本月应收', align: 'center', sortable: true, width: 120 },

                { field: '实收往年', title: '往年', align: 'center', sortable: true, width: 120 },
                { field: '实收本月', title: '本月', align: 'center', sortable: true, width: 120 },
                { field: '实收本年', title: '本年', align: 'center', sortable: true, width: 120 },
                { field: '实收小计', title: '小计', align: 'center', sortable: true, width: 120 },

                { field: '冲抵往年', title: '往年', align: 'center', sortable: true, width: 120 },
                { field: '冲抵本月', title: '本月', align: 'center', sortable: true, width: 120 },
                { field: '冲抵本年', title: '本年', align: 'center', sortable: true, width: 120 },
                { field: '冲抵小计', title: '小计', align: 'center', sortable: true, width: 120 },

                { field: '减免往年', title: '往年', align: 'center', sortable: true, width: 120 },
                { field: '减免本月', title: '本月', align: 'center', sortable: true, width: 120 },
                { field: '减免本年', title: '本年', align: 'center', sortable: true, width: 120 },
                { field: '减免小计', title: '小计', align: 'center', sortable: true, width: 120 },

                { field: '欠收往年', title: '欠收往年', align: 'center', sortable: true, width: 120 },
                { field: '欠收本年', title: '欠收本年', align: 'center', sortable: true, width: 120 },
                { field: '欠收小计', title: '欠收小计', align: 'center', sortable: true, width: 120 },

                { field: '往年欠费回收率', title: '往年欠费回收率(%)', align: 'center', sortable: true, width: 160 },
                { field: '本月收缴率', title: '本月收缴率(%)', align: 'center', sortable: true, width: 500 }
            ];

            var column = [
                [
                    { colspan: 5, title: '合计' },
                    { colspan: 5, title: '收到前期' },
                    { colspan: 5, title: '收到本期' },
                    { colspan: 5, title: '收到后期' },
                    { colspan: 3, title: '收到预存' }
                ],
                [
                    {
                        field: '合计_含税金额', title: '含税金额<br /> （1=6+11+16+21）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '合计_不含税金额', title: '不含税金额<br />（2=7+12+17+22）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '合计_税额', title: '税额<br />（3=8+13+18+23）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '合计_违约金', title: '违约金<br />（4=9+14+19）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '合计', title: '总额<br />（5=1+4）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },

                    {
                        field: '收到前期_含税金额', title: '含税金额<br /> （6=7+8）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到前期_不含税金额', title: '不含税金额<br />（7）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到前期_税额', title: '税额<br />（8）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到前期_违约金', title: '违约金<br />（9）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到前期_合计', title: '总额<br />（10=6+9）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },

                    {
                        field: '收到本期_含税金额', title: '含税金额<br /> （11=12+13）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到本期_不含税金额', title: '不含税金额<br />（12）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到本期_税额', title: '税额<br />（13）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到本期_违约金', title: '违约金<br />（14）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到本期_合计', title: '总额<br />（15=11+14）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },

                    {
                        field: '收到后期_含税金额', title: '含税金额<br /> （16=17+18）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到后期_不含税金额', title: '不含税金额<br />（17）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到后期_税额', title: '税额<br />（18）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到后期_违约金', title: '违约金<br />（19）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到后期_合计', title: '总额<br />（20=16+19）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },

                    {
                        field: '收到预存_含税金额', title: '含税金额<br /> （21=22+23）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到预存_不含税金额', title: '不含税金额<br />（22）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        }
                    },
                    {
                        field: '收到预存_税额', title: '税额<br />（23）', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        }
                    }

                ]
            ];

            var frozenColumns = [[
                { field: '单位', title: '单位', align: 'left', sortable: true, width: 200 },
                { field: '费用科目', title: '费用名称', align: 'left', sortable: true, width: 100 }
            ]];

            function SearchDlg() {
                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
            function SearchDlg2() {
                $('#DlgMemo').parent().appendTo($("form:first"))
                $('#DlgMemo').dialog('open');
            }

            function setIsSQLData() {

                document.getElementById('hiIsSQLData').value = 1;

                var vIsPrec = document.getElementById('IsPrec').checked;
                if (vIsPrec) {
                    document.getElementById('hiIsPrec').value = "1";
                }
                else {
                    document.getElementById('hiIsPrec').value = "0";
                }

                var vIsRefund = document.getElementById('IsRefund').checked;
                if (vIsRefund) {
                    document.getElementById('hiIsRefund').value = "1";
                }
                else {
                    document.getElementById('hiIsRefund').value = "0";
                }
            }

            var intervalProcess;

            var toolbar = [
                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#IsGather').val("0");
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '显示明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#HiIsAll").val("0");
                        LoadList(1, 500);

                    }
                }, '-',
                {
                    text: '显示汇总',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#HiIsAll").val("1");
                        LoadList(1, 500);
                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            // Export('收费率报表Excel', $('#TableContainer'));

                            window.location.href = 'FeesReportNew2ToExcel.aspx';
                        }
                    }
                }, '-',
                {
                    text: '备注',
                    iconCls: 'icon-help',
                    handler: function () {
                        $('#DlgMemo').parent().appendTo($("form:first"))
                        $('#DlgMemo').dialog('open');
                    }
                }

            ];


        </script>

        <script type="text/javascript">
            var ProgressInterval;

            function InitColums() {
                var c1 = "", c2 = "";
                var begintime = new Date($("#ChargeBeginDate").val());
                var endtime = new Date($("#ChargeEndDate").val());

                for (var i = 1; i < 13; i++) {
                    var m = begintime.getMonth() + 1;
                    c1 += " ,{ colspan: 5, title: '" + begintime.getFullYear() + "-" + m + "月' }";

                    c2 += " { field: '接管户数" + i + "', title: '接管户数', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '交房户数" + i + "', title: '交房户数', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '计费户数" + i + "', title: '计费户数', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '应收金额" + i + "', title: '应收金额', align: 'center', sortable: true, width: 120 },";
                    c2 += " { field: '环比及差异金额" + i + "', title: '较上月差异金额', align: 'center', sortable: true, width: 120,formatter: function (value, row, index)";
                    c2 += " { var str = value; if(str==\"\"){ return '0.00'; }else{ return formatNumberRgx(str);}  } ";
                    c2 += " },"

                    m = m + 1;
                    var tt = "";
                    if (m == 13) {
                        tt = (begintime.getFullYear() + 1) + "-01"
                    }
                    else {
                        tt = begintime.getFullYear() + "-" + m
                    }
                    begintime = new Date(tt);
                    // alert(begintime);
                    // alert(tt + "====" + begintime + "====" + endtime);
                    if (begintime > endtime) {
                        break;
                    }
                }

                var columStr = " [ [";
                columStr += "       { colspan: 1, rowspan: 2, width: 100, align: 'center', field: '应收合计', title: '应收合计' }";
                columStr += c1;
                columStr += "  ], [" + c2;
                columStr += "  ] ]";
                alert(columStr);
                column = eval("(" + columStr + ")");

            }

            function ExcuteOnServer() {


                var begintime = new Date($("#ChargeBeginDate").val());
                var endtime = new Date($("#ChargeEndDate").val());

                if (begintime >= endtime) {
                    HDialog.Info('收款结束时间不能小于收款开始时间！');
                    return false;
                }

                var begintime1 = new Date($("#DueBeginDate").val());
                var endtime1 = new Date($("#DueEndDate").val());

                if (begintime >= endtime) {
                    HDialog.Info('收款结束时间不能小于收款开始时间！');
                    return false;
                }
                if (begintime1 >= endtime1) {
                    HDialog.Info('费用结束时间不能小于费用开始时间！');
                    return false;
                }
                var tmpCommID = $('#CommIDs').val();
                if (tmpCommID == '') {
                    HDialog.Info('请选择管理项目！');
                    return false;
                }
                var tmpCostNames = $('#CostNames').val();
                if (tmpCostNames == '') {
                    HDialog.Info('请选择统计费项！');
                    return false;
                }
                

                document.getElementById('hiIsSQLData').value = "1";

                var vIsPrec = document.getElementById('IsPrec').checked;

                if (vIsPrec) {
                    document.getElementById('hiIsPrec').value = "1";
                }
                else {
                    document.getElementById('hiIsPrec').value = "0";
                }

                var vIsRefund = document.getElementById('IsRefund').checked;
                if (vIsRefund) {
                    document.getElementById('hiIsRefund').value = "1";
                }
                else {
                    document.getElementById('hiIsRefund').value = "0";
                }
                $('#IsFirstLoad').val("0");
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);

                //LoadList(1, 500);
                //$('#SearchDlg').dialog('close');
                // btnClear_OnClick();
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesReportNew2', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList(page, rows) {
                var statisMome = $("#StatisMome option:selected").val();
                var title = "";
                if (statisMome == 0) title = "单位名称";
                else if (statisMome == 1) title = "楼宇名称";
                else if (statisMome == 2) title = "资源名称";
                else if (statisMome == 3) title = "客户名称";

                // frozenColumns[0][0].title = title;

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: 200,
                    pageList: [200, 500, 800, 1000, 2000],
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesReportNew2", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesReportNew2', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {

                            LoadList(1, 500);
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {
                                $('#hiIsSQLData').val('1');
                                LoadList(1, 500);
                                CloseProgress();
                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 250) / 2, top: ht + 240 });
            }

            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }


            function ToExcel() {
                var StatisMome = $('#hiStatisMome').val();
                var CompanyID = $('#hiCompanyID').val();
                var CorpCostID = $('#hiCorpCostID').val(); //document.getElementById('hiCorpCostID').value;
                var DetailType = $('#hiDetailType').val(); //document.getElementById('hiDetailType').value;
                window.location.href = "../CorpCostStatistNew/FeesCorpChargeRate_NewDetailCre.aspx"
                    + "?StatisMome=" + StatisMome
                    + "&CompanyID=" + CompanyID
                    + "&CorpCostID=" + CorpCostID
                    + "&DetailType=" + DetailType;
            }

            function SelCommInfo() {

                var w = $(window).width() * 0.8;
                var h = $(window).height() * 0.8;

                HDialog.Open(w, h, '../DialogNew/SelComm.aspx?IsCheck=1&isCommID=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }


            function SelRoomState() {

                var strRoomStates = "";

                HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random(), '房屋状态选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                        $('#RoomStates').val(varObjects[0]);
                    }

                });
            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CorpCostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }

                });

            }

            function SelBuild() {
                var tmpCommID = $('#CommIDs').val();

                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx" + "?CommID=" + tmpCommID, '楼宇选择', false, function callback(_Data) {
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

            function SelCarpark() {
                var tmpCommID = $('#CommIDs').val();

                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx" + "?CommID=" + tmpCommID, '车位区域选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");


                        var CarparkIDs = "";
                        var CarparkNames = "";
                        $('#CarparkIDs').val(CarparkIDs);
                        $('#CarparkNames').searchbox('setValue', CarparkNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                CarparkIDs = CarparkIDs + "," + varObjects[i].split(',')[0];
                                CarparkNames = CarparkNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#CarparkIDs').val(CarparkIDs.substring(1, CarparkIDs.length));
                        $('#CarparkNames').searchbox('setValue', CarparkNames.substring(1, CarparkNames.length));

                    }
                });
            }

            function btnClear_OnClick() {

                //$('#CommIDs').val('');
                //$('#CommNames').searchbox('setValue', '');

                $('#RoomStates').val('');
                $('#RoomStateNames').searchbox('setValue', '');
                $('#hiRoomStateNames').val('');

                $('#CorpCostIDs').val('');
                $('#CostNames').searchbox('setValue', '');
                $('#hiCostNames').val('');

                $('#IsPrec').val('');
                $('#IsRefund').val('');
                //$('#IsProperty').val('');

            }

            function Export(strXlsName, exportGrid) {
                var statisMome = $("#StatisMome option:selected").val();
                var title = "";
                if (statisMome == 0) title = "单位名称";
                else if (statisMome == 1) title = "楼宇名称";
                else if (statisMome == 2) title = "资源名称";
                else if (statisMome == 3) title = "客户名称";
                Headcolumn[1][0].title = '费用截止时间:' + $('#CutYearMonth').val() + ' 收款时间从:' + $('#ChargeBeginDate').val() + '到' + $('#ChargeEndDate').val();
                Headcolumn[2][0].title = title;
                ExcelCol[0].title = title;

                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }

            function formatNumberRgx(num) {
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };
        </script>

    </form>
</body>
</html>
