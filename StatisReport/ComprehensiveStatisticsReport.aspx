<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprehensiveStatisticsReport.aspx.cs" Inherits="M_Main.StatisReport.ComprehensiveStatisticsReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>综合统计报表</title>
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
                width: 17%;
            }

            .SearchTable .TdContent {
                width: 33%;
            }

        #CostNames {
            width: 91.7%;
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
</head>
<body>
    <form id="frmForm">
        <input id="Attribute" name="Attribute" value="" type="hidden" />
        <input id="CostIDs" name="CostIDs" value="" type="hidden" />
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <input id="hOrganCode" name="hOrganCode" value="" type="hidden" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 440px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: red; font-size: 14px;'>
                <tr>
                    <td valign="top" style='color: red; font-size: 14px;'>备注：<br />
                        1、用于统计某一期间综合性的收款、退款、欠费、预交余额；“T+1”表示不管统计条件如何设置，数据范围截止上日；<br />
                        2、	期初欠费：截止到开始时间的欠费金额；<br />
                        3、	期初预交余额：截止开始时间的预存余额；<br />
                        4、	本期应收金额：所选时间段内的应收金额；<br />
                        5、	前期实收本期：开始时间之前收取的所选时间段内的费用金额；<br />
                        6、	本期实收前期：所选时间段内收取的开始时间之前的费用金额；<br />
                        7、	本期实收本期：所选时间段内收取的所选时间段内的费用金额；<br />
                        8、	本期实收后期：所选时间段内收取的结束时间之后的费用金额；<br />
                        9、本期实收预存：	所选时间段内收取的预存费用金额；<br />
                        10、前期预交冲抵本期：开始时间之前预交冲抵的所选时间段内的费用金额；<br />
                        11、本期预交冲抵前期：所选时间段内预交冲抵的开始时间之前的费用金额；<br />
                        12、本期预交冲抵本期：所选时间段内预交冲抵的所选时间段内的费用金额；<br />
                        13、本期预交冲抵后期：所选时间段内预交冲抵的结束时间之后的费用金额；<br />
                        14、前期减免冲销本期：开始时间之前减免冲销的所选时间段内的费用金额；<br />
                        15、本期减免冲销前期：所选时间段内减免冲销的开始时间之前的费用金额；<br />
                        16、本期减免冲销本期：所选时间段内减免冲销的所选时间段内的费用金额；<br />
                        17、本期减免冲销后期：所选时间段内减免冲销的结束时间之后的费用金额；<br />
                        18、本期退款前期：所选时间段内退还的开始时间之前的费用金额；<br />
                        19、本期退款本期：所选时间段内退还的所选时间段内的费用金额；<br />
                        20、本期退款后期：所选时间段内退还的结束时间之后的费用金额；<br />
                        21、本期退款预存：所选时间段内退还的预存费用金额；<br />
                        22、期末欠费：截止到结束时间的欠费金额；<br />
                        23、预收本年：所选时间段内收取的结束时间至当年年末的费用金额；
                        <br />
                        24、预收次年：所选时间段内收取的结束时间次年的费用金额；
                        <br />
                        25、预收次年以后：所选时间段内收取的结束时间次年以后的费用金额；<br />
                        26、期末预存余额：截止结束时间的预存余额；<br />
                        27、期末预交余额合计：预收本年、预收次年、预收次年以后、期末预存余额的合计金额。<br />

                    </td>
                </tr>
            </table>
        </div>
        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" onclick="SelComm();" runat="server" ru="server" readonly></textarea>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">(费用/收款)开始时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesStartDate" name="FeesStartDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" />
                    </td>
                    <td class="TdTitle">(费用/收款)结束时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesEndDate" name="EndDate" class="Wdate" onclick=" WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" />
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">费用项目
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CostNames" name="CostNames" runat="server" onclick="SelCost();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">统计范围</td>
                    <td class="TdContent">
                        <select name="ListType" id="ListType">
                            <option value="2">费用大项</option>
                            <option selected="selected" value="0">费用小项</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">

                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(function () {

                //获取进度
                $.tool.DataPostNoLoading('WriteOffOrganReport', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadData();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {
                                LoadData();
                            }
                            else {
                                LoadData();
                                //展示进度
                                ShowProgress();
                                //获取执行情况进度
                                ProgressInterval = setInterval("TakeProgress()", 1000);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            });

            function SelComm() {

                if ($('#hCommID').val() == '') {
                    var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIDs").val(arrRet.id);
                        $("#CommNames").val(arrRet.name);
                    });
                }
            }

            function Clear() {
                $("#CostIDs").val("");
                $("#CostNames").val("");
                $("#CommNames").val("");
                $("#CommIDs").val("");
                $("#StartDate").val("");
                $("#EndDate").val("");
            }

            function SelCost() {
                if ($('#hCommID').val() == '') {
                    HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                        var varReturn = _data;
                        if (varReturn != "") {//**获得返回 刷新
                            var varObjects = varReturn.split("\t");
                            $('#CostIDs').val(varObjects[0]);
                            $('#CostNames').val(varObjects[1]);
                        }

                    });
                }
                else {
                    HDialog.Open('700', '450', "../dialogNew/MultiCorpCommCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                        var varReturn = _data;
                        if (varReturn != "") {//**获得返回 刷新
                            var varObjects = varReturn.split("\t");
                            $("#CostIDs").val(varObjects[0]);
                            $("#CostNames").val(varObjects[1]);
                        }
                    });
                }
            }

            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width();

                $("#CostIDs").val('0')

                $("#TableContainer").css("height", h + "px");
                $("#TableContainer").css("width", w + "px");
                if ($('#hCommID').val() != '') {
                    $('#ViewType').val('Comm');
                    $('#ViewType').prop('disabled', 'disabled');
                }
            }
            InitFunction();

            var frozenColumns = [[
                { field: '单位', title: '单位', align: 'center', sortable: true, width: 300 },
                { field: '费用项目', title: '费用名称', align: 'center', sortable: true, width: 100 }
            ]]

            var column;
            column = [
                [
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '期初欠费', title: '期初欠费<br />(1)', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '期初预交余额', title: '期初预交余额<br />(2)', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '本期应收金额', title: '本期应收金额<br />(3)', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '前期实收本期', title: '前期实收本期<br />(4)', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    { colspan: 4, align: 'center', title: '本期实收' },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '前期预交冲抵本期', title: '前期预交冲抵本期<br />(9)', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    { colspan: 4, align: 'center', title: '本期预交冲抵' },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '前期减免冲销本期', title: '前期减免冲销本期<br />(13)', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    { colspan: 3, align: 'center', title: '本期减免冲销' },
                    { colspan: 4, align: 'center', title: '本期退款' },
                    {
                        colspan: 1, rowspan: 2, width: 225, align: 'center', field: '期末欠费', title: '期末欠费<br />(21=1+3-4-5-6-9-10-11-13-14-15)', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    { colspan: 5, align: 'center', title: '期末预交余额' }

                ],
                [
                    //本期实收
                    {
                        field: '本期实收前期', title: '前期<br />(5)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期实收本期', title: '本期<br />(6)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期实收后期', title: '后期<br />(7=22+23+24)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期预存收款', title: '预存<br />(8)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    //本期预交冲抵
                    {
                        field: '本期预交冲抵前期', title: '前期<br />(10)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期预交冲抵本期', title: '本期<br />(11)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期预交冲抵后期', title: '后期<br />(12)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '综合预存冲抵', title: '综合预存冲抵<br />', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    //本期减免冲销
                    {
                        field: '本期减免冲销前期', title: '前期<br />(14)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期减免冲销本期', title: '本期<br />(15)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期减免冲销后期', title: '后期<br />(16)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    //本期退款
                    {
                        field: '本期退款前期', title: '前期<br />(17)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期退款本期', title: '本期<br />(18)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期退款后期', title: '后期<br />(19)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本期预存退款', title: '预存<br />(20)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    //期末预交余额
                    {
                        field: '期末预交余额预收本年', title: '预收本年<br />(22)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '期末预交余额预收次年', title: '预收次年<br />(23)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '期末预交余额预收次年以后', title: '预收次年以后<br />(24)', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '期末预交余额预存', title: '期末预存余额<br />(25=2+8-10-11-12-20)', align: 'center', width: 150, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '期末预交余额合计', title: '合计<br />(26=22+23+24+25)', align: 'center', width: 150, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    }

                ]
            ];




            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {

                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            window.location.href = "ComprehensiveStatisticsReportToExcel.aspx";
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

            var ProgressInterval;

            function Search() {
                LoadData();
            }

            function SearchData() {

                if ($("#LastStaticYearMonth").val() == "" || $("#ThisStaticYearMonth").val() == "") {
                    HDialog.Info("日期不能为空");
                    return;
                }

                if ($("#OrganCode").val() != "01") {
                    if ($("#CommIDs").val() == "") {
                        HDialog.Info("请选择管理项目");
                        return;
                    }
                }
                if ($("#CostIDs").val() == "0") {

                    HDialog.Info("请选择需要统计的费用项目");
                    return;

                }

                if ($("#FeesStartDate").val() == "") {
                    HDialog.Info("请选择费用开始时间");
                    return;
                }
                if ($("#FeesEndDate").val() == "") {
                    HDialog.Info("请选择费用结束时间");
                    return;
                }
                var begintime = new Date($("#FeesStartDate").val());
                var endtime = new Date($("#FeesEndDate").val());

                if (begintime > endtime) {
                    HDialog.Info('费用结束时间不能小于费用开始时间！');
                    return;
                }

                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('ComprehensiveStatisticsReport', 'StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载数据
            function LoadData() {
                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
                    pageSize: [100],
                    pageList: [100, 200, 500, 1000],
                    columns: column,
                    frozenColumns: frozenColumns,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        $.tool.MergeEasyUiGrid("TableContainer", "单位");
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("ComprehensiveStatisticsReport", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                        return 'height:20px;';
                    }

                });


            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('ComprehensiveStatisticsReport', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadData();
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {
                                $('#hiIsSQLData').val('1');
                                LoadData();
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

            $(".Wdate").change(function () {


            });

            function formatNumberRgx(num) {
                if (num != undefined) {
                    var parts = num.toString().split(".");
                    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    return parts.join(".");
                } else {
                    return '0.00';
                }
            };
        </script>
    </form>
</body>
</html>



