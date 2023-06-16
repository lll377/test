<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesColligateStat.aspx.cs" Inherits="M_Main.CorpCostStatistNew.FeesColligateStat" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>


    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <%--<link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />--%>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>


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
        <input id="RoomStateNum" type="hidden" name="RoomStateNum" runat="server" />

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
        <input id="StaticType" type="hidden" name="StaticType" runat="server" />

        <input id="hiFeesDateType" type="hidden" name="hiFeesDateType" runat="server" />
        <input id="hiListType" type="hidden" name="hiListType" runat="server" />

        <input id="hiLoadFeesPaid" type="hidden" name="hiLoadFeesPaid" runat="server" />
        <input id="hiLoadFeesPaidPrec" type="hidden" name="hiLoadFeesPaidPrec" runat="server" />
        <input id="hiLoadFeesPaidLt" type="hidden" name="hiLoadFeesPaidLt" runat="server" />
        <input id="IsDetail" type="hidden" name="IsDetail" runat="server" />
        <input id="hiDetailType" type="hidden" name="hiDetailType" runat="server" />
        <input id="hiStatID" type="hidden" name="hiStatID" runat="server" />
        <input id="ApplicationPath" type="hidden" name="ApplicationPath" runat="server" />
        <input id="hiIsPrec" type="hidden" value="1" name="hiIsPrec" runat="server" />
        <input id="PageIndex" type="hidden" name="PageIndex" runat="server" />
        <input id="PrintParms" type="hidden" name="PrintParms" runat="server" />
        <input id="CostGeneType" type="hidden" name="CostGeneType" runat="server" />
        <input id="OptCode" type="hidden" name="OptCode" runat="server" />
        <input id="Flag" type="hidden" name="Flag" runat="server" />

        <div style="background: #F4F4F4; height: 35px; vertical-align: middle">

            <table border="0" style="font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: auto;" align="left" valign="middle">统计时间从&nbsp;<input type="text" class="easyui-datebox" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datebox" id="EditEndDate" name="EditEndDate" />
                        <input type="checkbox" id="CkIsDetail" name="CkIsDetail" style="display: none;" /><input type="checkbox" id="IsPrec" name="IsPrec" style="display: none;" />
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="JavaScript:ExcuteOnServer(); ">统计</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchDlg();">筛选条件</a>
                        <a href="#" id='FeesToExcel' class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" onclick="FeesToExcel();">导出Excel</a>
                        <a href="#" id='memo' class="easyui-linkbutton" data-options="iconCls:'icon-help'" onclick="SearchDlg2();">查看备注</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 350px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" /></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            name="RegionNames" runat="server" /></td>
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
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" runat="server" style="width: 120px">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState"
                            name="RoomStateNames" runat="server" />
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
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContentSearch">
                        <select id="FeesDateType" class="easyui-combobox" name="FeesDateType" runat="server">
                            <option value="1" selected>费用日期</option>
                            <option value="2">应收日期</option>
                        </select></td>
                    <td class="TdTitle">统计范围</td>
                    <td class="TdContentSearch">
                        <select id="ListType" class="easyui-combobox" name="ListType" runat="server">
                            <option value="0" selected>费用项目</option>
                            <option value="1">收费标准</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="JavaScript:ExcuteOnServer(); ">统计</a></td>
                </tr>
            </table>
        </div>

        <div id="DlgDetail" class="easyui-dialog" title="费用综合统计明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1024px; height: 500px; padding: 10px;">
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>
        <div id='tb'>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
        </div>
        <div id='tbtitle' style='height: 24px; color: Red'></div>

         <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width:700px; height: 500px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr><td>备注：</td></tr>
                    <tr><td>1、	用于统计某一期间综合性的收款、退款、欠费、预交余额； </td></tr>
                    <tr><td>2、	期初欠费：截止开始时间的欠费金额；</td></tr>
                    <tr><td>3、	期初未退：截止开始时间已收、未退的暂收类费用金额；</td></tr>
                    <tr><td>4、	期初预交余额：截止开始时间的预存余额；</td></tr>
                    <tr><td>5、	本期应收金额：所选时间段内的应收金额；</td></tr>
                    <tr><td>6、	前期实收本期：开始时间之前收取的所选时间段内的费用金额；</td></tr>
                    <tr><td>7、	本期实收前期：所选时间段内收取的开始时间之前的费用金额；</td></tr>
                    <tr><td>8、	本期实收本期：所选时间段内收取的所选时间段内的费用金额；</td></tr>
                    <tr><td>9、	本期实收后期：所选时间段内收取的结束时间之后的费用金额；</td></tr>
                    <tr><td>10、本期实收预存：所选时间段内收取的预存费用金额；</td></tr>
                    <tr><td>11、前期预交冲抵本期：开始时间之前预交冲抵的所选时间段内的费用金额；</td></tr>
                    <tr><td>12、本期预交冲抵前期：所选时间段内预交冲抵的开始时间之前的费用金额；</td></tr>
                    <tr><td>13、本期预交冲抵本期：所选时间段内预交冲抵的所选时间段内的费用金额；</td></tr>
                    <tr><td>14、本期预交冲抵后期：所选时间段内预交冲抵的结束时间之后的费用金额；</td></tr>
                    <tr><td>15、前期减免冲销本期：开始时间之前减免冲销的所选时间段内的费用金额；</td></tr>
                    <tr><td>16、本期减免冲销前期：所选时间段内减免冲销的开始时间之前的费用金额；</td></tr>
                    <tr><td>17、本期减免冲销本期：所选时间段内减免冲销的所选时间段内的费用金额；</td></tr>
                    <tr><td>18、本期减免冲销后期：所选时间段内减免冲销的结束时间之后的费用金额；</td></tr>
                    <tr><td>19、本期退款前期：所选时间段内退还的开始时间之前的费用金额；</td></tr>
                    <tr><td>20、本期退款本期：所选时间段内退还的所选时间段内的费用金额；</td></tr>
                    <tr><td>21、本期退款后期：所选时间段内退还的结束时间之后的费用金额；</td></tr>
                    <tr><td>22、本期退款预存：所选时间段内退还的预存费用金额；</td></tr>
                    <tr><td>23、期末欠费：截止结束时间的欠费金额；</td></tr>
                    <tr><td>24、期末未退：截止结束时间已收、未退的暂收类费用金额； </td></tr>
                    <tr><td>25、期末预存余额：截止结束时间的预存余额；</td></tr>               
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

            }

            InitTableHeight();
            var frozenColumns = [[
                { field: 'CostName', rowspan: 2, title: '费用名称', align: 'left', sortable: true },
                { field: 'StanName', rowspan: 2, title: '标准名称', align: 'left', sortable: true }
            ]]

            var column = [
                [
                    {
                        field: 'BeginDebtsAmount1', rowspan: 2, title: '期初欠费<br>[1]', align: 'left', sortable: true, width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: 'BeginDebtsAmount2', rowspan: 2, title: '期初未退<br>[2]', align: 'left', sortable: true, width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    // { field: 'BeginDebtsAmount3', rowspan: 2, title: '期初未付', align: 'left', sortable: true, width: 100 },
                    {
                        field: 'BeginPrecPayAmount', rowspan: 2, title: '期初预交余额<br>[3]', align: 'left', sortable: true, width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: 'CurDueAmount', rowspan: 2, title: '本期应收金额<br>[4]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'CurDueAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'BefPaidThisAmount', rowspan: 2, title: '前期实收本期<br>[5]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefPaidThisAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    { colspan: 4, title: '本期实收' },
                    {
                        field: 'BefPrecThisAmount', rowspan: 2, title: '前期预交冲抵本期<br>[10]', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefPrecThisAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    { colspan: 3, title: '本期预交冲抵' },
                    {
                        field: 'Fab_Cc_WaivAmount', rowspan: 2, title: '前期减免冲抵本期<br>[14]', align: 'left', sortable: true, width: 120, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'Fab_Cc_WaivAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    { colspan: 3, title: '本期减免冲抵' },
                    { colspan: 4, title: '本期退款' },
                    //  { colspan: 3, title: '本期付款' },
                    {
                        field: 'EndDebtsAmount1', rowspan: 2, title: '期末欠费<br>[22=1+4-5-6-7-10-11-12-14-15-16]', align: 'left', sortable: true, width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: 'EndDebtsAmount2', rowspan: 2, title: '期末未退<br>[23=2+6+7+8+11+12+13-17-18-19]', align: 'left', sortable: true, width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    //  { field: 'EndDebtsAmount3', rowspan: 2, title: '期末未付', align: 'left', sortable: true, width: 100 },
                    {
                        field: 'EndPrecPayAmount', rowspan: 2, title: '期末预交余额<br>[24=3+9-11-12-13-21]', align: 'left', sortable: true, width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    }
                ], [

                    {
                        field: 'BefPaidAmount', title: '前期<br>[6]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefPaidAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'CurPaidAmount', title: '本期<br>[7]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'CurPaidAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'AftPaidAmount', title: '后期<br>[8]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'AftPaidAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'AftPaidPrecAmount', title: '预存<br>[9]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'AftPaidAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'BefPrecAmount', title: '前期<br>[11]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefPrecAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'CurPrecAmount', title: '本期<br>[12]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'CurPrecAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'AftPrecAmount', title: '后期<br>[13]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'AftPrecAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'BefWaivAmount', title: '前期<br>[15]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefWaivAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'CurWaivAmount', title: '本期<br>[16]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'CurWaivAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'AftWaivAmount', title: '后期<br>[17]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'AftWaivAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'BefRefundAmount', title: '前期<br>[18]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'BefRefundAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'CurRefundAmount', title: '本期<br>[19]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'CurRefundAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'AftRefundAmount', title: '后期<br>[20]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'AftRefundAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    },
                    {
                        field: 'AftRefundPrecAmount', title: '预存<br>[21]', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            if (row.StatType == 0 || row.StatType == 4) {
                                //return "<a href=\"#\" id=\"" + row.StatID + "\" onclick=\"ShowDetail(this.id,'AftRefundAmount');\">" + value + "</a>";
                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(value);
                            }
                            //return value;
                        }
                    }
                ]

            ];


             var Headcolumn = [
                [
                    { field: 'CostName', rowspan: 2, title: '费用名称', align: 'left', sortable: true },
                    { field: 'StanName', rowspan: 2, title: '标准名称', align: 'left', sortable: true },
                    { field: 'BeginDebtsAmount1', rowspan: 2, title: '期初欠费<br>[1]', align: 'left', sortable: true, width: 100 },
                    { field: 'BeginDebtsAmount2', rowspan: 2, title: '期初未退<br>[2]', align: 'left', sortable: true, width: 100 },
                    //{ field: 'BeginDebtsAmount3', rowspan: 2, title: '期初未付', align: 'left', sortable: true, width: 100 },
                    { field: 'BeginPrecPayAmount', rowspan: 2, title: '期初预交余额<br>[3]', align: 'left', sortable: true, width: 100 },
                    { field: 'CurDueAmount', rowspan: 2, title: '本期应收金额<br>[4]', align: 'left', sortable: true, width: 100 },
                    { field: 'BefPaidThisAmount', rowspan: 2, title: '前期实收本期<br>[5]', align: 'left', sortable: true, width: 100 },
                    { colspan: 4, title: '本期实收' },
                    { field: 'BefPrecThisAmount', rowspan: 2, title: '前期预交冲抵本期<br>[10]', align: 'left', sortable: true, width: 100 },
                    { colspan: 3, title: '本期预交冲抵' },
                    { field: 'Fab_Cc_WaivAmount', rowspan: 2, title: '前期减免冲销本期<br>[14]', align: 'left', sortable: true, width: 100 },
                    { colspan: 3, title: '本期减免冲销' },
                    { colspan: 4, title: '本期退款' },
                    //{ colspan: 3, title: '本期付款' },
                    { field: 'EndDebtsAmount1', rowspan: 2, title: '期末欠费<br>[22=1+4-5-6-7-10-11-12-14-15-16]', align: 'left', sortable: true, width: 100 },
                    { field: 'EndDebtsAmount2', rowspan: 2, title: '期末未退<br>[23=2+6+7+8+11+12+13-17-18-19]', align: 'left', sortable: true, width: 100 },
                    //{ field: 'EndDebtsAmount3', rowspan: 2, title: '期末未付', align: 'left', sortable: true, width: 100 },
                    { field: 'EndPrecPayAmount', rowspan: 2, title: '期末预交余额<br>[24=3+9-11-12-13-21]', align: 'left', sortable: true, width: 100 }
                ], [
                    { field: 'BefPaidAmount', title: '前期<br>[6]', align: 'left', sortable: true, width: 100 },
                    { field: 'CurPaidAmount', title: '本期<br>[7]', align: 'left', sortable: true, width: 100 },
                    { field: 'AftPaidAmount', title: '后期<br>[8]', align: 'left', sortable: true, width: 100 },
                    { field: 'AftPaidPrecAmount', title: '预存<br>[9]', align: 'left', sortable: true, width: 100 },

                    { field: 'BefPrecAmount', title: '前期<br>[11]', align: 'left', sortable: true, width: 100 },
                    { field: 'CurPrecAmount', title: '本期<br>[12]', align: 'left', sortable: true, width: 100 },
                    { field: 'AftPrecAmount', title: '后期<br>[13]', align: 'left', sortable: true, width: 100 },

                    { field: 'BefWaivAmount', title: '前期<br>[15]', align: 'left', sortable: true, width: 100 },
                    { field: 'CurWaivAmount', title: '本期<br>[16]', align: 'left', sortable: true, width: 100 },
                    { field: 'AftWaivAmount', title: '后期<br>[17]', align: 'left', sortable: true, width: 100 },

                    { field: 'BefRefundAmount', title: '前期<br>[18]', align: 'left', sortable: true, width: 100 },
                    { field: 'CurRefundAmount', title: '本期<br>[19]', align: 'left', sortable: true, width: 100 },
                    { field: 'AftRefundAmount', title: '后期<br>[20]', align: 'left', sortable: true, width: 100 },
                    { field: 'AftRefundPrecAmount', title: '预存<br>[21]', align: 'left', sortable: true, width: 100 }
                    //{ field: 'BefExpenseAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                    //{ field: 'CurExpenseAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                    //{ field: 'AftExpenseAmount', title: '后期', align: 'left', sortable: true, width: 100 }
                ]
            ];

            var ExcelCol = [
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true },
                { field: 'StanName', title: '标准名称', align: 'left', sortable: true },
                { field: 'BeginDebtsAmount1', title: '期初欠费[1]', align: 'left', sortable: true, width: 100 },
                { field: 'BeginDebtsAmount2', title: '期初未退[2]', align: 'left', sortable: true, width: 100 },
                //{ field: 'BeginDebtsAmount3', title: '期初未付', align: 'left', sortable: true, width: 100 },
                { field: 'BeginPrecPayAmount', title: '期初预交余额[3]', align: 'left', sortable: true, width: 100 },
                { field: 'CurDueAmount', title: '本期应收金额[4]', align: 'left', sortable: true, width: 100 },
                { field: 'BefPaidThisAmount', title: '前期实收本期[5]', align: 'left', sortable: true, width: 100 },
                { field: 'BefPaidAmount', title: '前期[6]', align: 'left', sortable: true, width: 100 },
                { field: 'CurPaidAmount', title: '本期[7]', align: 'left', sortable: true, width: 100 },
                { field: 'AftPaidAmount', title: '后期[8]', align: 'left', sortable: true, width: 100 },
                { field: 'AftPaidPrecAmount', title: '预存[9]', align: 'left', sortable: true, width: 100 },
                { field: 'BefPrecThisAmount', title: '前期预交冲抵本期[10]', align: 'left', sortable: true, width: 100 },
                { field: 'BefPrecAmount', title: '前期[11]', align: 'left', sortable: true, width: 100 },
                { field: 'CurPrecAmount', title: '本期[12]', align: 'left', sortable: true, width: 100 },
                { field: 'AftPrecAmount', title: '后期[13]', align: 'left', sortable: true, width: 100 },
                { field: 'Fab_Cc_WaivAmount', title: '前期减免冲销本期[14]', align: 'left', sortable: true, width: 100 },
                { field: 'BefWaivAmount', title: '前期[15]', align: 'left', sortable: true, width: 100 },
                { field: 'CurWaivAmount', title: '本期[16]', align: 'left', sortable: true, width: 100 },
                { field: 'AftWaivAmount', title: '后期[17]', align: 'left', sortable: true, width: 100 },
                { field: 'BefRefundAmount', title: '前期[18]', align: 'left', sortable: true, width: 100 },
                { field: 'CurRefundAmount', title: '本期[19]', align: 'left', sortable: true, width: 100 },
                { field: 'AftRefundAmount', title: '后期[20]', align: 'left', sortable: true, width: 100 },
                { field: 'AftRefundPrecAmount', title: '预存[21]', align: 'left', sortable: true, width: 100 },
                //{ field: 'BefExpenseAmount', title: '前期', align: 'left', sortable: true, width: 100 },
                //{ field: 'CurExpenseAmount', title: '本期', align: 'left', sortable: true, width: 100 },
                //{ field: 'AftExpenseAmount', title: '后期', align: 'left', sortable: true, width: 100 },
                { field: 'EndDebtsAmount1', title: '期末欠费[22=1+4-5-6-7-10-11-12-14-15-16]', align: 'left', sortable: true, width: 100 },
                { field: 'EndDebtsAmount2', title: '期末未退[23=2+6+7+8+11+12+13-17-18-19]', align: 'left', sortable: true, width: 100 },
                //{ field: 'EndDebtsAmount3', title: '期末未付', align: 'left', sortable: true, width: 100 },
                { field: 'EndPrecPayAmount', title: '期末预交余额[24=3+9-11-12-13-21]', align: 'left', sortable: true, width: 100 }
            ];

            var columnDetail = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 100 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100 },
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
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
                //{ field: 'ExpenseAmount', title: '付款金额', align: 'left', sortable: true, width: 100 },
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
                //$("#sfmxsc").attr('enable', 'true');
                //$('#sfmxsc').linkbutton('enable');
                $('#ltjzsc').linkbutton('enable');

                document.getElementById('hiIsSQLData').value = 1;

                var isCheck = document.getElementById('CkIsDetail').checked;
                if (isCheck) {
                    document.getElementById('IsDetail').value = "1";
                }
                else {
                    document.getElementById('IsDetail').value = "0";
                }

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
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesColligate&Command=LoadDataDetail&' + $("#NewFeesDueCutSearch").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    pageSize: 500,
                    pageList: [500, 1000, 2000],
                    columns: columnDetail,
                    fitColumns: false,
                    singleSelect: true,
                    nowrap: false,
                    pagination: true,
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

        </script>

        <script type="text/javascript">
            var ProgressInterval;

            function ExcuteOnServer() {
                document.getElementById('hiIsSQLData').value = "1";

                var isCheck = document.getElementById('CkIsDetail').checked;

                if (isCheck) {
                    document.getElementById('IsDetail').value = "1";
                }
                else {
                    document.getElementById('IsDetail').value = "0";
                }

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
                $.tool.DataPostNoLoading('FeesColligate', 'StartTask', $('#NewFeesDueCutSearch').serialize(),
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
                $.tool.DataPost2('FeesColligate', 'LoadData', "page=" + page + "&rows=" + rows + "&" + $('#NewFeesDueCutSearch').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象

                        $("#TableContainer").datagrid({
                            data: Data,
                            method: "post",
                            title: '',
                            loadMsg: '',
                            pageSize: rows,
                            pageList: [500, 1000, 2000],
                            columns: column,
                            frozenColumns: frozenColumns,
                            fitColumns: false,
                            border: false,
                            singleSelect: true,
                            rownumbers: true,
                            pagination: true,
                            nowrap: false,
                            width: "100%",
                            sortOrder: "asc",
                            onAfter: function (target) {

                                //var value = $('#Divprogressbar').progressbar('getValue');
                                //if (value < 100) {

                                //    value = 100;
                                //    $('#Divprogressbar').progressbar('setValue', value);

                                //}
                                //window.clearInterval(intervalProcess);
                                document.getElementById('hiIsSQLData').value = 0;
                                if (document.getElementById('hiIsSQLData').value != "-1") {
                                    document.getElementById('hiIsSQLData').value = 0;
                                }
                                //ResPorcessbar();

                                var pg = $("#TableContainer").datagrid("getPager");
                                if (pg) {
                                    $(pg).pagination({
                                        onBeforeRefresh: function () {

                                        },
                                        onRefresh: function (pageNumber, pageSize) {

                                        },
                                        onChangePageSize: function () {
                                        },
                                        onSelectPage: function (Pn, Ps) {
                                            LoadList(Pn, Ps);

                                            if ($('#TableContainer').datagrid('options') != null) {
                                                $('#TableContainer').datagrid('options').pageNumber = Pn;
                                                $('#TableContainer').datagrid('options').pageSize = Ps;
                                            }
                                        }
                                    });
                                }

                            },
                            rowStyler: function (index, row) {
                                if (row.StatType == 4) {
                                    return 'color:red;';
                                }
                            },
                            onLoadSuccess: function (data) {

                                //var value = $('#Divprogressbar').progressbar('getValue');
                                //if (value < 100) {

                                //    value = 100;
                                //    $('#Divprogressbar').progressbar('setValue', value);

                                //}

                                //var obj = data.rows[1];

                                //if (obj != null) {
                                //    var LbTitle = "费用时间从：" + obj.FeeDueDate1 + "到:" + obj.FeeDueDate2 + "  收款时间从：" + obj.ChargeDate1 + "到:" + obj.ChargeDate2;
                                //    document.getElementById('tbtitle').innerHTML = LbTitle;
                                //}
                            },
                            onLoadError: function () {
                                //window.clearInterval(intervalProcess);

                            }

                        });
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                        //window.clearInterval(intervalProcess);
                    });
            }

            LoadList(1, 500);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('FeesColligate', 'TakeProgress', $('#NewFeesDueCutSearch').serialize(),
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
                var i = 20; // parseInt(Obj[0].Curr);

                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }

            function ToExcel() {
                var StatID = document.getElementById('hiStatID').value;
                var DetailType = document.getElementById('hiDetailType').value;
                window.location.href = "../CostStatist/MultiFeesColligateStatistDetailCre.aspx?StatID=" + StatID + "&DetailType=" + DetailType;
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

                    $.tool.DataPost2('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
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
                                                    //var buildArea = data[i].RoomID.split("|")[1];
                                                    //$('#BuildArea').val(buildArea);
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

                    //$('#BuildArea').val(data.BuildArea);
                    //$('#CalcArea').val(data.BuildArea);
                });

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

            function SelRooms() {
                var varReturn;

                var w = $(window).width();;
                var h = $(window).height();;

                HDialog.Open(w, h, "../dialogNew/MultiRoomDlg.aspx", '房屋多选', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新

                        var data = _Data;// SelAll + "◆" + SelRoomSigns + "◆" + SelRoomIDs;
                        var SelAll = data.split('◆')[0];
                        var SelRoomSigns = data.split('◆')[1];
                        var SelRoomIDs = data.split('◆')[2];

                        if (SelAll == "1") {
                            $('#RoomSigns').searchbox('setValue', '全部');
                        }
                        else {
                            $('#RoomSigns').searchbox('setValue', SelRoomSigns);;
                        }

                        $('#SelRoomSigns').val(SelRoomSigns);
                        $('#SelRoomIDs').val(SelRoomIDs);
                        $('#RoomIDs').val(SelRoomIDs);

                        $('#SelAll').val(SelAll);

                        return true;
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
                        var arrRoomStateSNums = varObjects[0].split(',');
                        $('#RoomStateNum').val(arrRoomStateSNums.length);
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
                $('#RoomStateNum').val('');

                $('#IsPrec').val('');
                $('#IsProperty').val('');

            }

            function FeesToExcel() {
                var rowData = $('#TableContainer').datagrid('getData');
                if (rowData == '') {
                    HDialog.Info('请先生成报表');
                }
                else {
                    Export('综合统计报表Excel', $('#TableContainer'));
                }

            }


            function ChangeToTable3(printDatagrid, HeadcolumnsList, columnsList) {
                var tableString = '<table cellspacing="0" class="pb">';
                var frozenColumns = undefined;  // 得到frozenColumns对象
                var columns = HeadcolumnsList; //printDatagrid.datagrid("options").columns;    // 得到columns对象
                var nameList = columnsList;
               

                // 载入title
                if (typeof columns != 'undefined' && columns != '') {
                    $(columns).each(function (index) {
                        tableString += '\n<tr>';
                        if (typeof frozenColumns != 'undefined' && typeof frozenColumns[index] != 'undefined') {
                            for (var i = 0; i < frozenColumns[index].length; ++i) {
                                if (!frozenColumns[index][i].hidden) {
                                    tableString += '\n<th width="' + frozenColumns[index][i].width + '"';
                                    if (typeof frozenColumns[index][i].rowspan != 'undefined' && frozenColumns[index][i].rowspan > 1) {
                                        tableString += ' rowspan="' + frozenColumns[index][i].rowspan + '"';
                                    }
                                    if (typeof frozenColumns[index][i].colspan != 'undefined' && frozenColumns[index][i].colspan > 1) {
                                        tableString += ' colspan="' + frozenColumns[index][i].colspan + '"';
                                    }
                                    tableString += '>' + frozenColumns[0][i].title + '</th>';
                                }
                            }
                        }
                        for (var i = 0; i < columns[index].length; ++i) {
                            if (!columns[index][i].hidden) {
                                tableString += '\n<th width="' + columns[index][i].width + '"';
                                if (typeof columns[index][i].rowspan != 'undefined' && columns[index][i].rowspan > 1) {
                                    tableString += ' rowspan="' + columns[index][i].rowspan + '"';
                                }
                                if (typeof columns[index][i].colspan != 'undefined' && columns[index][i].colspan > 1) {
                                    tableString += ' colspan="' + columns[index][i].colspan + '"';
                                }
                                tableString += '>' + columns[index][i].title + '</th>';
                            }
                        }
                        tableString += '\n</tr>';
                    });
                }
                // 载入内容
                var rows = printDatagrid.datagrid("getRows"); // 这段代码是获取当前页的所有行
                for (var i = 0; i < rows.length; i++) {
                    tableString += '\n<tr>';
                    for (var j = 0; j < nameList.length; j++) {


                        tableString += '\n<td';
                        if (nameList[j].align != 'undefined' && nameList[j].align != '') {
                            tableString += ' style="text-align:' + nameList[j].align + ';"';
                        }
                        tableString += '>';
                        var FiledName = nameList[j].field;
                        if (FiledName == "BeginDebtsAmount1") {
                            if (rows[i].BeginDebtsAmount1 != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "CostName") {
                            if (rows[i].FiledName != "") {
                                tableString += ('' + rows[i][FiledName] + '');
                            } else tableString += "";
                        } else if (FiledName == "StanName") {
                            if (rows[i].StanName != "") {
                                tableString += ('' + rows[i][FiledName] + '');
                            } else tableString += "";
                        } else if (FiledName == "BeginDebtsAmount2") {
                            if (rows[i].BeginDebtsAmount2 != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "BeginPrecPayAmount") {
                            if (rows[i].BeginPrecPayAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "CurDueAmount") {
                            if (rows[i].CurDueAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "BefPaidThisAmount") {
                            if (rows[i].BefPaidThisAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "BefPaidAmount") {
                            if (rows[i].BefPaidAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "CurPaidAmount") {
                            if (rows[i].CurPaidAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "AftPaidAmount") {
                            if (rows[i].AftPaidAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "BefPrecThisAmount") {
                            if (rows[i].BefPrecThisAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "BefPrecAmount") {
                            if (rows[i].BefPrecAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "CurPrecAmount") {
                            if (rows[i].CurPrecAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "AftPrecAmount") {
                            if (rows[i].AftPrecAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "Fab_Cc_WaivAmount") {
                            if (rows[i].Fab_Cc_WaivAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "BefWaivAmount") {
                            if (rows[i].BefWaivAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "CurWaivAmount") {
                            if (rows[i].CurWaivAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "AftWaivAmount") {
                            if (rows[i].AftWaivAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "BefRefundAmount") {
                            if (rows[i].BefRefundAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "CurRefundAmount") {
                            if (rows[i].CurRefundAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "AftRefundAmount") {
                            if (rows[i].AftRefundAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "EndDebtsAmount1") {
                            if (rows[i].EndDebtsAmount1 != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "EndDebtsAmount2") {
                            if (rows[i].EndDebtsAmount2 != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } else if (FiledName == "EndPrecPayAmount") {
                            if (rows[i].EndPrecPayAmount != "") {
                                var parts = rows[i][FiledName].toString().split(".");
                                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                tableString += ('' + parts.join(".") + '');
                            } else tableString += "";
                        } 
                        tableString += '</td>';
                    }
                    tableString += '\n</tr>';
                }
                tableString += '\n</table>';
                return tableString;
            }

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

            function formatNumberRgx(num) {
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };
        </script>

    </form>
</body>
</html>
