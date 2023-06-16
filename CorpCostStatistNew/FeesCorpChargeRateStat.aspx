<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesCorpChargeRateStat.aspx.cs" Inherits="M_Main.CorpCostStatistNew.FeesCorpChargeRateStat" %>

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
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 91.7%;
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
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 800px; height: 310px; padding: 10px;">
            <table style="width: 100%; overflow: hidden" class="DialogTable">
                <tr>
                    <td class="TdTitle">费用期间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" id="EditBeginDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" name="EditBeginDate" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" runat="server" style="width: 163px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">收款时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" id="ChargeBeginDate" runat="server" name="ChargeBeginDate" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" runat="server" onclick="WdatePicker({ startDate: '%y-%M-01 23:59:59', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" id="ChargeEndDate" name="ChargeEndDate" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" onclick="SelCommInfo();"></textarea>
                        <input id="hiCommNames" type="hidden"
                            name="hiCommNames" runat="server"><input id="CommIDs" type="hidden"
                                name="CommIDs" runat="server">
                        <input id="hiCommID" type="hidden" name="hiCommID" runat="server"></td>
                </tr>
                <tr>
                    <%--<td class="TdTitle">统计范围</td>
                    <td class="TdContentSearch">
                        <select id="IsHigh" name="IsHigh" runat="server">
                            <option value="1">费用大项</option>
                            <option value="0">费用小项</option>
                        </select>
                    </td>--%>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames"
                            name="CostNames" runat="server" /><input id="CorpCostIDs" type="hidden"
                                name="CorpCostIDs" runat="server" /><input id="hiCostNames" type="hidden"
                                    name="hiCostNames" runat="server" /></td>
                    <td class="TdTitle">是否包含退款</td>
                    <td class="TdContentSearch">
                        <select id="IsRefund" name="IsRefund" runat="server">
                            <option value="0" selected>否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
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
        <%--<div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 550px; height: 180px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、费用项目已按本金、佣金分解，当只选择佣金费项而不选择本金费项统计时，佣金费项将不包含本金费项分解过来的结果。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、期末往年欠费=期初往年欠费-本期实收往年欠费-本期预交冲抵往年欠费-本期减免冲销往年欠费；<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期末本年前期欠费=期初本年前期欠费-本期实收本年前期欠费-本期预交冲抵本年前期欠费-本期减免冲销本年前期欠费；<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期末本期应收欠费=本期应收-前期实收本期-本期实收本期-前期预交冲抵本期-本期预交冲抵本期-前期减免冲销本期-本期减免冲销本期。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、往年欠费回收率=（本期实收往年欠费+本期预交冲抵往年欠费）/（年初往年欠费-本年前期减免冲销往年欠费-本期减免冲销往年欠费）*100%；<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本年前期欠费回收率=（本期实收本年前期欠费+本期预交冲抵本年前期欠费）/（期初本年前期欠费-本期减免冲销本年前期欠费）*100%；<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本期收缴率=（前期实收本期+本期实收本期+前期预交冲抵本期+本期预交冲抵本期）/（本期应收-前期减免冲销本期-本期减免冲销本期）。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>；4、实收中未计合同违约金。</td>
                </tr>
            </table>
        </div>--%>
        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 750px; height: 440px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: red; font-size:14px;'>
                <tr>
                    <td valign="top" style='color: red; font-size:14px;'>备注：<br /> 
1、用于统计某一期间收费率的达成情况；“T+1”表示不管统计条件如何设置，数据范围截止上日；<br />
2、年初往年欠费：收款时间截止上年12月31日、费用时间截止上年12月31日的欠费金额；<br />
3、	期初往年欠费：收款时间截止所选收款开始时间、费用时间截止上年12月31日的欠费金额；<br />
4、期初本年前期欠费：收款时间截止所选收款开始时间、费用时间1月1号至所选费用开始时间的欠费金额；<br />
5、期初欠费小计：	期初往年欠费、本年前期欠费的合计金额；<br />
6、	本期应收：所选费用时间段内的应收金额；<br />
7、全部应收小计：期初往年欠费、本年前期欠费、本期应收的合计金额；<br />
8、	本期实收往年：所选收款时间段内收取的、费用时间截止上年12月31日的欠费金额；<br />
9、	本期实收本年前期：所选收款时间段内收取的、费用时间1月1号至所选费用开始时间的欠费金额；<br />
10、前期实收本期：收款时间截止所选收款开始时间之前收取的、所选费用期间段内的费用金额；<br />
11、本期实收本期：所选收款时间段内收取的、所选费用期间段内的费用金额；<br />
12、本期实收后期：所选收款时间段内收取的、所选费用结束时间之后的费用金额；<br />
13、本期实收小计：本期实收往年、本期实收本年前期、本期实收本期、本期实收后期的合计金额；<br />
14、本期冲抵往年：所选收款时间段内预交冲抵的、费用时间截止上年12月31日的欠费金额；<br />
15、本期冲抵本年前期：所选收款时间段内预交冲抵的、费用时间1月1日至所选费用开始时间的欠费金额；<br />
16、前期冲抵本期：截止所选收款开始时间之前预交冲抵的、所选费用期间段内的费用金额；<br />
17、本期冲抵本期：所选收款时间段内预交冲抵的、所选费用期间段内的费用金额；<br />
18、本期冲抵后期：所选收款时间段内预交冲抵的、所选费用结束时间之后的费用金额；<br />
19、本期冲抵小计：本期冲抵往年、本期冲抵本年前期、本期冲抵本期、本期冲抵后期的合计金额；<br />
20、本年前期减免往年：本年1月1日至所选收款开始时间段内减免冲销的、费用时间截止上年12月31日的欠费金额；<br />
21、本期减免往年：所选收款时间段内减免冲销的、费用时间截止上年12月31日的欠费金额；<br />
22、本期减免本年前期：所选收款时间段内减免冲销的、费用时间1月1日至所选费用开始时间的欠费金额；<br />
23、前期减免本期：截止所选收款开始时间之前减免冲销的、所选费用期间段内的费用金额；<br />
24、本期减免本期：所选收款时间段内减免冲销的、所选费用期间段的费用金额；<br />
25、本期减免后期：所选收款时间段内减免冲销的、所选费用结束时间之后的费用金额；<br />
26、本期减免小计：本期减免往年、本期减免本年前期、本期减免本期、本期减免后期的合计金额；<br />
27、期末往年欠费：收款时间截止所选收款结束时间、费用时间截止上年12月31日的欠费金额；<br />
28、期末本年前期欠费：收款时间截止所选收款结束时间、费用时间1月1号至所选费用开始时间的欠费金额；<br />
29、期末本期欠费：收款时间截止所选收款结束时间、所选费用期间段内的欠费金额；<br />
30、期末欠费小计：期末往年欠费、期末本年前期欠费、期末本期欠费的合计金额；<br />
31、往年欠费回收率=(本期实收往年 + 本期冲抵往年) / (年初往年欠费-本年前期减免往年- 本期减免往年) * 100 %；<br />
32、本年前期欠费回收率= (本期实收本年前期 + 本期冲抵本年前期) / (本年前期欠费  - 本期减免本年前期) * 100%；<br />
33、本月收缴率=(前期实收本期 + 本期实收本期+前期冲抵本期+本期冲抵本期) / (本期应收 -前期减免本期 - 本期减免本期) * 100%；<br />
34、本年累计收缴率=（截止收款结束时间收取和预交冲抵的、本年1月1日至费用结束时间的费用金额）/（本年1月1日至费用结束时间的应收金额-截止收款结束时间减免冲销的、本年1月1日至费用结束时间的费用金额）*100%；<br />
35、本年应收及往年欠费收缴率=（本年1月1日至收款结束时间收取和预交冲抵的往年欠费金额+截止收款结束时间收取和预交冲抵的、本年1月1日至费用结束时间的费用金额）/（年初往年欠费金额+本年1月1日至费用结束时间的应收金额-本年1月1日至收款结束时间减免冲销的往年欠费金额-截止收款结束时间减免冲销的、本年1月1日至费用结束时间的费用金额）*100%。



                    </td>
                </tr>
            </table>
        </div>

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <input type="hidden" id="IsFirstLoad" name="IsFirstLoad" value="0" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

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

            var column = [
                [
                    { colspan: 1, title: '年初欠费' },
                    { colspan: 3, title: '期初欠费' },
                    { colspan: 2, title: '应收费用' },
                    { colspan: 6, title: '实收费用' },
                    { colspan: 6, title: '预交冲抵' },
                    { colspan: 7, title: '减免冲销' },
                    { colspan: 4, title: '期末欠费' },
                    { colspan: 5, title: '收缴率' },
                ], [
                    {
                        field: '年初往年欠费', title: '往年欠费', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '期初往年欠费', title: '往年欠费', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '期初欠费小计', title: '期初欠费小计', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本月应收', title: '本期应收', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '全部应收小计', title: '全部应收小计', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '实收往年', title: '本期实收往年', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '实收本年前期', title: '本期实收本年前期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '前期实收本期', title: '前期实收本期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '实收本月', title: '本期实收本期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期实收后期', title: '本期实收后期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '实收小计', title: '本期实收小计', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵往年', title: '本期冲抵往年', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵本年前期', title: '本期冲抵本年前期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '前期冲抵本期', title: '前期冲抵本期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵本月', title: '本期冲抵本期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵后期', title: '本期冲抵后期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵小计', title: '本期冲抵小计', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年前期减免往年', title: '本年前期减免往年', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '减免往年', title: '本期减免往年', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期减免本年前期', title: '本期减免本年前期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '前期减免本期', title: '前期减免本期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '减免本月', title: '本期减免本期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期减免后期', title: '本期减免后期', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '减免小计', title: '本期减免小计', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '欠收往年', title: '往年欠费', align: 'center', sortable: true, width: 160, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '期末本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '欠收本年', title: '本期欠费', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '欠收小计', title: '期末欠费小计', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '往年欠费回收率', title: '往年欠费回收率(%)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本年前期欠费回收率', title: '本年前期欠费回收率(%)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本月收缴率', title: '本期收缴率(%)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本年累计收缴率', title: '本年累计收缴率(%)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本年应收及往年欠费收缴率', title: '本年应收及往年欠费收缴率(%)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    }
                ], [
                    { field: '年初往年欠费', title: '(1)', align: 'center', sortable: true, width: 160 },
                    { field: '期初往年欠费', title: '(2)', align: 'center', sortable: true, width: 160 },
                    { field: '本年前期欠费', title: '(3)', align: 'center', sortable: true, width: 160 },
                    {
                        field: '期初欠费小计', title: '(4=2+3)', align: 'center', sortable: true, width: 160
                    },
                    { field: '本月应收', title: '(5)', align: 'center', sortable: true, width: 160 },
                    {
                        field: '全部应收小计', title: '(6=4+5)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '实收往年', title: '(7)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '实收本年前期', title: '(8)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '前期实收本期', title: '(9)', align: 'center', sortable: true, width: 160
                    },
                    { field: '实收本月', title: '(10)', align: 'center', sortable: true, width: 160 },
                    {
                        field: '本期实收后期', title: '(11)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '实收小计', title: '(12=7+8+10+11)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '冲抵往年', title: '(13)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '冲抵本年前期', title: '(14)', align: 'center', sortable: true, width: 160
                    },
                    { field: '前期冲抵本期', title: '(15)', align: 'center', sortable: true, width: 160 },
                    {
                        field: '冲抵本月', title: '(16)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '冲抵后期', title: '(17)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '冲抵小计', title: '(18=13+14+16+17)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '本年前期减免往年', title: '(19)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '减免往年', title: '(20)', align: 'center', sortable: true, width: 160
                    },
                    {
                        field: '本期减免本年前期', title: '(21)', align: 'center', sortable: true, width: 160
                    },
                    { field: '前期减免本期', title: '(22)', align: 'center', sortable: true, width: 160 },
                    { field: '减免本月', title: '(23)', align: 'center', sortable: true, width: 160 },
                    { field: '本期减免后期', title: '(24)', align: 'center', sortable: true, width: 160 },
                    { field: '减免小计', title: '(25=20+21+23+24)', align: 'center', sortable: true, width: 160 },
                    { field: '欠收往年', title: '(26=2-7-13-20)', align: 'center', sortable: true, width: 160 },
                    {
                        field: '期末本年前期欠费', title: '(27=3-8-14-21)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value;
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '欠收本年', title: '(28=5-9-10-15-16-22-23)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value;
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '欠收小计', title: '(29=26+27+28)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '往年欠费回收率', title: '(7+13)/(1-19-20)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本年前期欠费回收率', title: '(8+14)/(3-21)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本月收缴率', title: '(9+10+15+16)/(5-22-23)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本年累计收缴率', title: '(30)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: '本年应收及往年欠费收缴率', title: '(31)', align: 'center', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    }
                ]
            ];
            var frozenColumns = [[
                { field: 'Company', title: '区域', align: 'left', sortable: true, width: 300 },
                //{ field: 'CommName', title: '管理项目', align: 'left', sortable: true, width: 200 },
                { field: 'CorpCostName', title: '费用名称', align: 'left', sortable: true, width: 200 },
                { field: '费用类型', title: '费用类型', align: 'left', sortable: true, width: 200 }
            ]]

            function SearchDlg() {
                //btnClear_OnClick();
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
            }

            var intervalProcess;

            var toolbar = [

                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#IsGather').val("1");
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: '显示明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#hiIsSQLData').val("-1");
                        $('#IsGather').val("0");
                        LoadList(1, 500);
                    }
                }, '-',
                {
                    text: '显示汇总',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#hiIsSQLData').val("-1");
                        $('#IsGather').val("1");
                        LoadList(1, 500);
                    }
                }
                , '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            window.location.href = 'FeesCorpChargeRateStatCreateExcel.aspx'
                        }
                    }
                }
                , '-',
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

            function ExcuteOnServer() {
                if (Date.parse($("#EditBeginDate").val()) > Date.parse($("#EditEndDate").val())) {
                    HDialog.Info('费用开始时间必须小于结束时间');
                    return;
                }
                if (Date.parse($("#ChargeBeginDate").val()) > Date.parse($("#ChargeEndDate").val())) {
                    HDialog.Info('收款开始时间必须小于结束时间');
                    return;
                }
                document.getElementById('hiIsSQLData').value = "1";
                var commName = $("#CommNames").val();
                var corpCostName = $("#CostNames").val();
                if (commName == "") {
                    HDialog.Info('请选择统计项目');
                    return;
                }
                if (corpCostName == "") {
                    HDialog.Info('请选择统计费项');
                    return;
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
                //btnClear_OnClick();
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesCorpChargeRate', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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
                        param = $.JQForm.GetParam("FeesCorpChargeRate", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesCorpChargeRate', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
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
                var StatID = document.getElementById('hiStatID').value;
                var DetailType = document.getElementById('hiDetailType').value;
                window.location.href = "../CostStatist/MultiFeesCommissChargeRateDetailCre.aspx?StatID=" + StatID + "&DetailType=" + DetailType;
            }



            function SelCommInfo() {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1&isCommID=1', "选择管理项目", false, function callback(_Data) {
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

            function btnClear_OnClick() {

                $('#CommIDs').val('');
                $('#CommNames').val('');

                $('#RoomStates').val('');
                $('#RoomStateNames').searchbox('setValue', '');
                $('#hiRoomStateNames').val('');

                $('#CorpCostIDs').val('');
                $('#CostNames').searchbox('setValue', '');
                $('#hiCostNames').val('');

                $('#IsPrec').val('');
                //$('#IsProperty').val('');

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
