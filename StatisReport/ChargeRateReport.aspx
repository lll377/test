<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargeRateReport.aspx.cs" Inherits="M_Main.StatisReport.ChargeRateReport" %>


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
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 820px; height: 420px; padding: 10px;">
            <table style="width: 100%; overflow: hidden" class="DialogTable">
                <tr>
                    <td class="TdTitle">费用截止年月</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 163px;" id="CutYearMonth" onclick="WdatePicker({ dateFmt: 'yyyy-MM' })" runat="server" name="CutYearMonth" /></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
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
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" colspan="3">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames"
                            name="CostNames" runat="server" /><input id="CorpCostIDs" type="hidden"
                                name="CorpCostIDs" runat="server" /><input id="hiCostNames" type="hidden"
                                    name="hiCostNames" runat="server" /></td>
                </tr>
                <tr id="DiyTr">
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <select id="RegionSNums" name="RegionSNums" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildSNums" type="hidden" size="1" name="BuildSNums" runat="server" />
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false" name="BuildNames" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark" name="CarparkNames" runat="server" />
                        <input class="Control_ItemInput" id="CarparkIDs" style="width: 8px;" type="hidden" size="1" name="CarparkIDs" runat="server" />
                        <input class="Control_ItemInput" id="hiCarparkNames" style="width: 8px;" type="hidden" size="1" name="hiCarparkNames" runat="server" />
                    </td>

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
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'135px',multiple:true," runat="server">
                        </select></td>
                    <td class="TdTitle">收款方式</td>
                    <td class="TdContentSearch">
                        <select id="ChargeMode" name="ChargeMode" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'135px',multiple:true," runat="server" style="width: 50%">
                        </select></td>

                </tr>
                <tr>
                    <td class="TdTitle">统计范围</td>
                    <td class="TdContentSearch">
                        <select id="ListType" name="ListType" runat="server">
                            <option value="1">费用大项</option>
                            <option value="0">费用小项</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch">
                        <input id="hiIsPrec" type="hidden" name="hiIsPrec" runat="server" />
                        <input type="checkbox" id="IsPrec" name="IsPrec" style="display: none;" />
                    </td>
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

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 550px; height: 180px; padding-left: 10px; padding-top: 5px;">
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

                {
                    field: '期初往年欠费', title: '期初往年欠费', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else
                        {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "")
                        {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },

                {
                    field: '本月应收', title: '本月应收', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "")
                        {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },

                {
                    field: '实收往年', title: '往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "")
                        {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '实收本月', title: '本月', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '实收本年', title: '本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '实收小计', title: '小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },

                {
                    field: '冲抵往年', title: '往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '冲抵本月', title: '本月', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '冲抵本年', title: '本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '冲抵小计', title: '小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },

                {
                    field: '减免往年', title: '往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '减免本月', title: '本月', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '减免本年', title: '本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '减免小计', title: '小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },

                {
                    field: '欠收往年', title: '欠收往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '欠收本年', title: '欠收本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },
                {
                    field: '欠收小计', title: '欠收小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                        else {
                            return formatNumberRgx(0);
                        }
                    }
                },

                { field: '往年欠费回收率', title: '往年欠费回收率(%)', align: 'center', sortable: true, width: 160 },
                { field: '本月收缴率', title: '本月收缴率(%)', align: 'center', sortable: true, width: 500 }
            ];

            var column = [
                [
                    { colspan: 2, title: '期初欠费' },
                    { colspan: 1, title: '应收费用' },

                    { colspan: 4, title: '实收费用' },
                    { colspan: 4, title: '预交冲抵' },
                    { colspan: 4, title: '减免冲销' },
                    { colspan: 3, title: '欠收费用' },
                    { colspan: 2, title: '收缴率' }
                ],
                [
                    {
                        field: '期初往年欠费', title: '期初往年欠费', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年前期欠费', title: '本年前期欠费', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    {
                        field: '本月应收', title: '本月应收', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    {
                        field: '实收往年', title: '往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '实收本月', title: '本月', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '实收本年', title: '本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '实收小计', title: '小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    {
                        field: '冲抵往年', title: '往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵本月', title: '本月', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵本年', title: '本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '冲抵小计', title: '小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    {
                        field: '减免往年', title: '往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '减免本月', title: '本月', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '减免本年', title: '本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '减免小计', title: '小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    {
                        field: '欠收往年', title: '欠收往年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '欠收本年', title: '欠收本年', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '欠收小计', title: '欠收小计', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

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

            var frozenColumns = [[
                { field: 'Company', title: '单位', align: 'left', sortable: true, width: 300 },
                { field: 'DealYearMonth', title: '月份', align: 'left', sortable: true, width: 100 }
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
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('收费率报表Excel', $('#TableContainer'));
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

            function ExcuteOnServer() {

                var tmpCommID = $('#CommIDs').val();
                if (tmpCommID == '') {
                    HDialog.Info('请选择管理项目！');
                    return false;
                }
                var tmpCostName = $("#CostNames").val();
                if (tmpCostName == "")
                {
                    HDialog.Info('请选择统计费项');
                    return;
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
                btnClear_OnClick();
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('ChargeRateReport', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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

                frozenColumns[0][0].title = title;

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
                        param = $.JQForm.GetParam("ChargeRateReport", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('ChargeRateReport', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
