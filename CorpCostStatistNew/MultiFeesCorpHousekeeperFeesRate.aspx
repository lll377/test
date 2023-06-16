<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiFeesCorpHousekeeperFeesRate.aspx.cs" Inherits="M_Main.CorpCostStatistNew.MultiFeesCorpHousekeeperFeesRate" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>

    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>



    <script language="javascript" type="text/javascript">

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

        <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />

        <input id="hiRoomSigns" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" type="hidden" name="RoomIDs" runat="server" />

        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server" />

        <input id="CustID" type="hidden" name="CustID" runat="server" />
        <input id="hiCustName" type="hidden" name="hiCustName" runat="server" />
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />

        <input id="RoomStates" type="hidden" name="RoomStates" runat="server" />
        <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" runat="server" />

        <input id="CarparkIDs" type="hidden" name="CarparkIDs" runat="server" />
        <input id="hiCarparkNames" type="hidden" name="hiCarparkNames" runat="server" />

        <input id="ParkIDs" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiParkNames" type="hidden" name="hiParkNames" runat="server" />

        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" />

        <input id="StanIDs" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" type="hidden" name="hiStanNames" runat="server" />

        <input id="hiCommID" type="hidden" name="hiCommID" runat="server" />
        <input id="hiLoginUserCode" type="hidden" name="hiLoginUserCode" runat="server" />
        <input id="hiIsSQLData" type="hidden" name="hiIsSQLData" runat="server" />

        <input id="hiLoadFeesPaid" type="hidden" name="hiLoadFeesPaid" runat="server" />
        <input id="hiLoadFeesPaidPrec" type="hidden" name="hiLoadFeesPaidPrec" runat="server" />
        <input id="hiLoadFeesPaidLt" type="hidden" name="hiLoadFeesPaidLt" runat="server" />
        <input id="IsDetail" type="hidden" name="IsDetail" runat="server" />
        <input id="hiDetailType" type="hidden" name="hiDetailType" runat="server" />
        <input id="hiStatID" type="hidden" name="hiStatID" runat="server" />
        <input id="ApplicationPath" type="hidden" name="ApplicationPath" runat="server" />
        <input id="hiIsPrec" type="hidden" value="1" name="hiIsPrec" runat="server">
        <input id="PageIndex" type="hidden" name="PageIndex" runat="server" />
        <input id="PrintParms" type="hidden" name="PrintParms" runat="server" />
        <input id="CostGeneType" type="hidden" name="CostGeneType" runat="server" />
        <input id="OptCode" type="hidden" name="OptCode" runat="server" />
        <input id="Flag" type="hidden" name="Flag" runat="server">
        <input id="SelectBuild" type="hidden" name="SelectBuild" runat="server">

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 800px; height: 300px; padding: 10px;">
            <table class="DialogTable" id="SearchTable">
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
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" class="easyui-combobox" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" class="easyui-combobox" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server" /></td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames" class="easyui-searchbox" data-options="editable:false" searcher="SelStan"
                            name="StanNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">车位区域</td>
                    <td class="TdContentSearch">
                        <input id="CarparkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCarpark"
                            name="CarparkNames" runat="server" />
                    </td>
                    <td class="TdTitle">车位</td>
                    <td class="TdContentSearch">
                        <input id="ParkNames" class="easyui-searchbox" data-options="editable:false" searcher="SelPark"
                            name="ParkNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState"
                            name="RoomStateNames" runat="server" />
                    </td>
                    <td class="TdTitle">预收是否计入</td>
                    <td class="TdContentSearch">
                        <input type="checkbox" id="IsPrec" name="IsPrec" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:ExcuteOnServer(); ">统计</a></td>
                </tr>
            </table>
        </div>

        <div id="DlgDetail" class="easyui-dialog" title="收费率明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div id='tb'>
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
            </div>
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>
        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 880px; height: 200px; padding: 10px;">
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
                    <td>4、实收未计合同违约金。</td>
                </tr>
            </table>
        </div>


        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height() - 35;
                //var h1 = h - 37;
                $("#TableContainer").css("height", h + "px");

                $("#TableContainerDetail").css("height", "440px");

                var travelExpenseFrame = document.getElementById("pag");
            }

            InitTableHeight();

            var column = [
                [
                    { colspan: 3, title: '期初欠费' },
                    { colspan: 2, title: '应收费用' },
                    { colspan: 5, title: '实收费用' },
                    { colspan: 5, title: '预交冲抵' },
                    { colspan: 6, title: '减免冲销(以费用时间为准，不考虑收费时间)' },
                    { colspan: 4, title: '欠收费用' },
                    { colspan: 5, title: '收缴率' }
                ], [
                    {
                        field: 'BeginBefLastDebtsAmount', title: '年初往年欠费', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            //if (row.StatType == 0 || row.StatType == 1) {
                            //    //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BeginBefLastDebtsAmount');\">" + value + "</a>";
                            //}
                            //else {
                            //    return value;
                            //}
                            return value;
                        }
                    },
                    {
                        field: 'BeginBefPeriodDebtsAmount', title: '期初往年欠费', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BeginBefPeriodDebtsAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BeginBefThisDebtsAmount', title: '本年前期欠费', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BeginBefThisDebtsAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'CurDueAmount', title: '本期应收', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'CurDueAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'TotalDueAmount', title: '小计', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'TotalDueAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefLastPaidAmount', title: '往年', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefLastPaidAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefThisPaidAmount', title: '本年前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefThisPaidAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fab_Cc_PaidAmount', title: '前期实收本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fab_Cc_PaidAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fab_Ccd_PaidAmount', title: '本期实收本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fab_Ccd_PaidAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'TotalPaidAmount', title: '小计', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'TotalPaidAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefLastPrecOffsetAmount', title: '往年', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefLastPrecOffsetAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefThisPrecOffsetAmount', title: '本年前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefThisPrecOffsetAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fab_Cc_PrecAmount', title: '前期冲抵本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fab_Cc_PrecAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fab_Ccd_PrecAmount', title: '本期冲抵本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fab_Ccd_PrecAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'TotalPrecOffsetAmount', title: '小计', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'TotalPrecOffsetAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fe_Cea_WaivAmount', title: '本年前期减免往年', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fe_Cea_WaivAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fe_Cab_WaivAmount', title: '本期减免往年', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fe_Cab_WaivAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefThisWaivOffsetAmount', title: '本期减免本年前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefThisWaivOffsetAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fab_Ca_WaivAmount', title: '前期减免本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fab_Ca_WaivAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'Fab_Cab_WaivAmount', title: '本期减免本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fab_Cab_WaivAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'TotalWaivOffsetAmount', title: '小计', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'TotalWaivOffsetAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefLastDebtsAmount', title: '往年', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefLastDebtsAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefThisDebtsAmount', title: '本年前期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefThisDebtsAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'CurDebtsAmount', title: '本期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'CurDebtsAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'TotalDebtsAmount', title: '小计', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {

                            //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'TotalDebtsAmount');\">" + value + "</a>";
                            return value;
                        }
                    },
                    {
                        field: 'BefLastFeesRate', title: '往年欠费回收率(%)', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: 'BefThisFeesRate', title: '本年前期欠费回收率(%)', align: 'left', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: 'CurFeesRate', title: '本期收缴率(%)', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: 'CurYearFeesRate', title: '本年收缴率(%)', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    },
                    {
                        field: 'AllFeesRate', title: '本年应收及往年欠费收缴率(%)', align: 'left', sortable: true, width: 160, formatter: function (value, row, index) {
                            if (value != "") {
                                return value + "%";
                            }
                        }
                    }
                ]

            ];
            var frozenColumns = [[
                { field: 'OrganName', title: '区域名称', align: 'left', sortable: true, width: 100 },
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 100 },
                { field: 'HouseUserName', title: '管家名称', align: 'left', sortable: true, width: 100 }
            ]];


            var Headcolumn = [[
                { field: 'OrganName', rowspan: 2, title: '区域名称', align: 'left', sortable: true, width: 100 },
                { field: 'CommName', rowspan: 2, title: '项目名称', align: 'left', sortable: true, width: 100 },
                { field: 'HouseUserName', rowspan: 2, title: '管家名称', align: 'left', sortable: true, width: 100 },
                { colspan: 3, title: '期初欠费' },
                { colspan: 2, title: '应收费用' },
                { colspan: 5, title: '实收费用' },
                { colspan: 5, title: '预交冲抵' },
                { colspan: 6, title: '减免冲销(以费用时间为准，不考虑收费时间)' },
                { colspan: 4, title: '欠收费用' },
                { colspan: 5, title: '收缴率' }
            ], [
                { field: 'BeginBefLastDebtsAmount', title: '年初往年欠费', align: 'left', sortable: true, width: 100 },
                { field: 'BeginBefPeriodDebtsAmount', title: '期初往年欠费', align: 'left', sortable: true, width: 100 },
                { field: 'BeginBefThisDebtsAmount', title: '本年前期欠费', align: 'left', sortable: true, width: 100 },
                {
                    field: 'CurDueAmount', title: '本期应收', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalDueAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'BefLastPaidAmount', title: '往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisPaidAmount', title: '本年前期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Cc_PaidAmount', title: '前期实收本期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Ccd_PaidAmount', title: '本期实收本期', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalPaidAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'BefLastPrecOffsetAmount', title: '往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisPrecOffsetAmount', title: '本年前期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Cc_PrecAmount', title: '前期冲抵本期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Ccd_PrecAmount', title: '本期冲抵本期', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalPrecOffsetAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'Fe_Cea_WaivAmount', title: '本年前期减免往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fe_Cab_WaivAmount', title: '本期减免往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisWaivOffsetAmount', title: '本期减免本年前期', align: 'left', sortable: true
                },
                {
                    field: 'Fab_Ca_WaivAmount', title: '前期减免本期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Cab_WaivAmount', title: '本期减免本期', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalWaivOffsetAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                { field: 'BefLastDebtsAmount', title: '往年', align: 'left', sortable: true, width: 100 },
                { field: 'BefThisDebtsAmount', title: '本年前期', align: 'left', sortable: true, width: 100 },
                { field: 'CurDebtsAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                { field: 'TotalDebtsAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'BefLastFeesRate', title: '往年欠费回收率(%)', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisFeesRate', title: '本年前期欠费回收率(%)', align: 'left', sortable: true, width: 160
                },
                {
                    field: 'CurFeesRate', title: '本期收缴率(%)', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'CurYearFeesRate', title: '本年收缴率(%)', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'AllFeesRate', title: '本年应收及往年欠费收缴率(%)', align: 'left', sortable: true, width: 160
                }
            ]];

            var ExcelCol = [
                { field: 'OrganName', title: '区域名称', align: 'left', sortable: true, width: 100 },
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 100 },
                { field: 'HouseUserName', title: '管家名称', align: 'left', sortable: true, width: 100 },
                { field: 'BeginBefLastDebtsAmount', title: '年初往年欠费', align: 'left', sortable: true, width: 100 },
                { field: 'BeginBefPeriodDebtsAmount', title: '期初往年欠费', align: 'left', sortable: true, width: 100 },
                { field: 'BeginBefThisDebtsAmount', title: '本年前期欠费', align: 'left', sortable: true, width: 100 },
                {
                    field: 'CurDueAmount', title: '本期应收', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalDueAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'BefLastPaidAmount', title: '往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisPaidAmount', title: '本年前期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Cc_PaidAmount', title: '前期实收本期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Ccd_PaidAmount', title: '本期实收本期', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalPaidAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'BefLastPrecOffsetAmount', title: '往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisPrecOffsetAmount', title: '本年前期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Cc_PrecAmount', title: '前期冲抵本期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Ccd_PrecAmount', title: '本期冲抵本期', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalPrecOffsetAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'Fe_Cea_WaivAmount', title: '本年前期减免往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fe_Cab_WaivAmount', title: '本期减免往年', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisWaivOffsetAmount', title: '本期减免本年前期', align: 'left', sortable: true
                },
                {
                    field: 'Fab_Ca_WaivAmount', title: '前期减免本期', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'Fab_Cab_WaivAmount', title: '本期减免本期', align: 'left', sortable: true, width: 100
                },
                { field: 'TotalWaivOffsetAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                { field: 'BefLastDebtsAmount', title: '往年', align: 'left', sortable: true, width: 100 },
                { field: 'BefThisDebtsAmount', title: '本年前期', align: 'left', sortable: true, width: 100 },
                { field: 'CurDebtsAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                { field: 'TotalDebtsAmount', title: '小计', align: 'left', sortable: true, width: 100 },
                {
                    field: 'BefLastFeesRate', title: '往年欠费回收率(%)', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'BefThisFeesRate', title: '本年前期欠费回收率(%)', align: 'left', sortable: true, width: 160
                },
                {
                    field: 'CurFeesRate', title: '本期收缴率(%)', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'CurYearFeesRate', title: '本年收缴率(%)', align: 'left', sortable: true, width: 100
                },
                {
                    field: 'AllFeesRate', title: '本年应收及往年欠费收缴率(%)', align: 'left', sortable: true, width: 160
                }];
            var columnDetail = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 100 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
                { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, width: 100 },
                { field: 'FeeDueYearMonth', title: '费用日期', align: 'left', sortable: true, width: 100 },
                {
                    field: 'AccountsDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = row.AccountsDueDate.ToCustomizeDate();
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = row.FeesStateDate.ToCustomizeDate();
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = row.FeesEndDate.ToCustomizeDate();
                        return str;
                    }
                },
                { field: 'FeesAmount', title: '金额', align: 'left', sortable: true, width: 100 },
                { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, width: 100 },
                { field: 'WaivAmount', title: '减免冲销', align: 'left', sortable: true, width: 100 },
                { field: 'RefundAmount', title: '退款金额', align: 'left', sortable: true, width: 100 },
                { field: 'ExpenseAmount', title: '付款金额', align: 'left', sortable: true, width: 100 },
                { field: 'OptDate', title: '操作时间', align: 'left', sortable: true, width: 100 },
                { field: 'IsCommisionName', title: '是否佣金', align: 'left', sortable: true, width: 100 }

            ]]

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

                //var isCheck = document.getElementById('CkIsDetail').checked;
                //if (isCheck) {
                //    document.getElementById('IsDetail').value = "1";
                //}
                //else {
                //    document.getElementById('IsDetail').value = "0";
                //}

                var vIsPrec = document.getElementById('IsPrec').checked;
                if (vIsPrec) {
                    document.getElementById('hiIsPrec').value = "1";
                }
                else {
                    document.getElementById('hiIsPrec').value = "0";
                }
            }

            function ShowDetail(sStatID, DetailType) {
                document.getElementById('hiStatID').value = sStatID;
                document.getElementById('hiDetailType').value = DetailType;

                $("#TableContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesStaticHousekeeper&Command=LoadDataDetail&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnDetail,
                    fitColumns: false,
                    singleSelect: true,
                    rownumbers: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: '#tb',
                    sortOrder: "asc"
                });

                $('#DlgDetail').parent().appendTo($("form:first"))
                $('#DlgDetail').dialog('open');
            }

            var beforeLoad = function (param) {


                if (document.getElementById('hiIsSQLData').value != "-1") {
                    var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                    var ht = parseInt($(window).scrollTop());
                    $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                    $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
                    $('#divtime').html("正在查询中,请等待，耗时: 0秒");
                }

                $("select").each(function () {

                    var key = $(this).attr("id");
                    if (key != "") {
                        if (!param[key]) {
                            param[key] = $(this).val();
                        }
                    }
                });

                $("input").each(function () {

                    var key = $(this).attr("id");
                    if (key != "") {
                        if (!param[key]) {
                            param[key] = $(this).val();
                        }
                    }
                });
                var gridOpts = $('#TableContainer').datagrid('getPager').data("pagination").options;

                param.page = gridOpts.pageNumber;
                param.rows = gridOpts.pageSize;
            };

            var intervalProcess;


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
                        SearchDlg2();
                    }
                }
            ];

            function Export(strXlsName, exportGrid) {
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

        //, '-',
        //{
        //text: '打印',
        //    iconCls: 'icon-print',
        //handler: function () {
        //    ToPrint();
        //}
        //}
        //function ToPrint() {
        //    $.tool.DataGet('FeesCommissChargeRateStatist', 'CommissChargeRateStatistPrint', $('#NewFeesDueCutSearch').serialize(),
        //        function Init() {
        //        },
        //        function callback(_Data) {
        //            var Data = eval("(" + _Data + ")"); //转换为json对象

        //            if (Data.rows.length > 0) {
        //                obj = Data.rows[0];
        //                if (obj.EtFileName != "" && obj.FileName != "") {

        //                    var ReportURL = "../include/print.aspx?wj=" + obj.FileName + "&et=" + obj.EtFileName + ""
        //                    showOperatWin(ReportURL);
        //                }
        //            }


        //        },
        //        function completeCallback() {
        //        },
        //        function errorCallback() {
        //        });
        //}
        </script>

        <script type="text/javascript">
            var ProgressInterval;

            function ExcuteOnServer() {
                document.getElementById('hiIsSQLData').value = "1";

                //var isCheck = document.getElementById('CkIsDetail').checked;

                //if (isCheck) {
                //    document.getElementById('IsDetail').value = "1";
                //}
                //else {
                //    document.getElementById('IsDetail').value = "0";
                //}

                var vIsPrec = document.getElementById('IsPrec').checked;

                if (vIsPrec) {
                    document.getElementById('hiIsPrec').value = "1";
                }
                else {
                    document.getElementById('hiIsPrec').value = "0";
                }

                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);

                //LoadList(1, 50);
                //$('#SearchDlg').dialog('close');
                btnClear_OnClick();
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('FeesStaticHousekeeper', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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
                    pageSize: 500,
                    pageList: [500, 1000, 2000],
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
                        param = $.JQForm.GetParam("FeesStaticHousekeeper", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
                //$.tool.DataPost2('FeesStaticHousekeeper', 'LoadData', "page=" + page + "&rows=" + rows + "&" + $('#NewFeesDueCutSearch').serialize(),
                //       function Init() {
                //       },
                //       function callback(_Data) {
                //           var Data = eval("(" + _Data + ")"); //转换为json对象

                //           $("#TableContainer").datagrid({
                //               data: Data,
                //               method: "post",
                //               title: '',
                //               loadMsg: '',
                //               toolbar: toolbar,
                //               pageSize: rows,
                //               pageList: [50, 100, 200],
                //               columns: column,
                //               frozenColumns: frozenColumns,
                //               fitColumns: false,
                //               border: false,
                //               singleSelect: true,
                //               rownumbers: true,
                //               pagination: true,
                //               nowrap: false,
                //               width: "100%",
                //               sortOrder: "asc",
                //               onAfter: function (target) {                            
                //                   //ResPorcessbar();
                //                   var pg = $("#TableContainer").datagrid("getPager");
                //                   if (pg) {
                //                       $(pg).pagination({
                //                           onBeforeRefresh: function () {

                //                           },
                //                           onRefresh: function (pageNumber, pageSize) {

                //                           },
                //                           onChangePageSize: function () {
                //                           },
                //                           onSelectPage: function (Pn, Ps) {
                //                               LoadList(Pn, Ps);

                //                               if ($('#TableContainer').datagrid('options') != null) {
                //                                   $('#TableContainer').datagrid('options').pageNumber = Pn;
                //                                   $('#TableContainer').datagrid('options').pageSize = Ps;
                //                               }
                //                           }
                //                       });
                //                   }

                //               },
                //               rowStyler: function (index, row) {
                //                   if (row.StatType == 1) {
                //                       return 'color:red;';
                //                   }
                //               },
                //               onLoadSuccess: function (data) {

                //                   var value = $('#Divprogressbar').progressbar('getValue');
                //                   if (value < 100) {
                //                       value = 100;
                //                       $('#Divprogressbar').progressbar('setValue', value);
                //                   }

                //                   //var obj = data.rows[1];
                //                   //if (obj != null) {
                //                   //    var LbTitle = "费用时间从：" + obj.FeeDueDate1 + "到:" + obj.FeeDueDate2 + "  收款时间从：" + obj.ChargeDate1 + "到:" + obj.ChargeDate2;
                //                   //    document.getElementById('tbtitle').innerHTML = LbTitle;
                //                   //}
                //               },
                //               onLoadError: function () {
                //                   //window.clearInterval(intervalProcess);

                //               }

                //           });
                //       },
                //       function completeCallback() {
                //       },
                //       function errorCallback() {
                //           //window.clearInterval(intervalProcess);
                //       });
            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesStaticHousekeeper', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
                var i = parseInt(Obj[0].Curr);
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }

            function ToExcel() {
                var StatID = document.getElementById('hiStatID').value;
                var DetailType = document.getElementById('hiDetailType').value;
                var hiIsPrec = document.getElementById('hiIsPrec').value;

                window.location.href = "../CorpCostStatistNew/FeesStaticHousekeeperDetailCre.aspx?StatID=" + StatID + "&DetailType=" + DetailType + "&hiIsPrec=" + hiIsPrec;
            }

            function SelBuild() {

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


            function SelRegion() {

                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var RegionSNums = "";
                        var RegionNames = "";

                        $('#RegionSNums').val(RegionSNums);
                        $('#RegionNames').searchbox('setValue', RegionNames);
                        $('#hiRegionNames').val(RegionNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {

                                RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                                RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                        $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));

                        $('#hiRegionNames').val(RegionNames);

                    }
                });

            }

            function SelCarpark() {

                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx", '车位区域选择', false, function callback(_Data) {


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

            function SelPark() {

                HDialog.Open('700', '400', "../dialogNew/MultiParkDlg.aspx", '车位选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新                        

                        var data = _Data.split('|');
                        if (data.length > 0) {
                            var ParkIDs = "";
                            var ParkNames = "";

                            for (var i = 0; i < data.length; i++) {
                                if (data[i] != "") {
                                    var obj = JSON.parse(data[i]);
                                    if (obj.ParkID != 0) {
                                        ParkIDs = ParkIDs + "," + obj.ParkID;
                                        ParkNames = ParkNames + ',' + obj.ParkName;
                                    }
                                }
                            }

                            $('#ParkIDs').val(ParkIDs.substring(1, ParkIDs.length));
                            $('#ParkNames').searchbox('setValue', ParkNames.substring(1, ParkNames.length));
                        }
                    }
                });

            }

            function SelCost() {

                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
            }

            function SelStan() {
                var tmpCostIDs = $('#CostIDs').val();

                if (tmpCostIDs == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");

                    $('#btnSelCost').focus();
                    return false;
                }

                var w = 700;
                var h = 400;

                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#StanIDs').val(varObjects[0]);
                        $('#StanNames').searchbox('setValue', varObjects[1]);

                        var varObjects = _Data.split("|");
                        var StanIDs = "";
                        var StanNames = "";

                        $('#StanIDs').val(StanIDs);
                        $('#StanNames').searchbox('setValue', StanNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                StanIDs = StanIDs + "," + varObjects[i].split(',')[0];
                                StanNames = StanNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#StanIDs').val(StanIDs.substring(1, StanIDs.length));
                        $('#StanNames').searchbox('setValue', StanNames.substring(1, StanNames.length));

                    }
                });

                return false;
            }

            function SelRoomState() {

                var strRoomStates = "";

                HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random(), '房屋状态选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#RoomStates').val(varObjects[0]);
                        $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                        $('#hiRoomStateNames').val(varObjects[0]);
                        //var arrRoomStateSNums = varObjects[0].split(',');
                        //$('#RoomStateNum').val(arrRoomStateSNums.length);
                    }

                });
            }

            function btnClear_OnClick() {

                $('#BuildSNums').val('');
                $('#BuildNames').searchbox('setValue', '');
                $('#RegionSNums').val('');
                $('#RegionNames').searchbox('setValue', '');
                $('#hiRegionNames').val('');

                $('#CustTypeID').val('');
                $('#ChargeTypeID').val('');

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                //$('#RoomState').val('');
                $('#SearchRange').val('');
                $('#BankName').val('');

                $('#CarparkIDs').val('');
                $('#CarparkNames').searchbox('setValue', '');

                $('#ParkIDs').val('');
                $('#ParkNames').searchbox('setValue', '');

                $('#CostIDs').val('');
                $('#CostNames').searchbox('setValue', '');

                $('#StanIDs').val('');
                $('#StanNames').searchbox('setValue', '');

                $('#RoomStates').val('');
                $('#RoomStateNames').searchbox('setValue', '');
                $('#hiRoomStateNames').val('');
                //$('#RoomStateNum').val('');

                $('#IsPrec').val('');
                //$('#IsProperty').val('');

            }


        </script>

    </form>
</body>
</html>
