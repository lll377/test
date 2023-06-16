<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinancialMonthReport.aspx.cs" Inherits="M_Main.StatisReport.FinancialMonthReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>财务月报</title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
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
            width: 96%;
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
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden; height: 320px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">费用期间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datetimebox" id="EditBeginDate" runat="server" name="EditBeginDate" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datetimebox" id="EditEndDate" runat="server" name="EditEndDate" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收款时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datetimebox" id="ChargeBeginDate" runat="server" name="ChargeBeginDate" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datetimebox" id="ChargeEndDate" runat="server" name="ChargeEndDate" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="CostNames" name="CostNames" runat="server" onclick="SelCost();"></textarea>
                        <input id="CostIDs" name="CostIDs" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false" name="BuildNames" runat="server" />
                        <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false" name="RegionNames" runat="server" />
                        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
<script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        InitFunction();
        LoadData();
    });

    function Clear() {
        $("#CostIDs").val("");
        $("#CostNames").val("");
        $("#StartDate").val("");
        $("#EndDate").val("");
    }

    function SelCost() {
        HDialog.Open('700', '450', "../dialogNew/MultiCorpCommCostDlg.aspx?CommID=" + $("#hCommID").val(), '收费项目选择', false, function (_data) {
            var varReturn = _data;
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");
                $("#CostIDs").val(varObjects[0]);
                $("#CostNames").val(varObjects[1]);
            }
        });
    }

    function SelBuild() {
        HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx?CommID=" + $("#hCommID").val(), '楼宇选择', false, function callback(_Data) {
            if (_Data != "") {
                var varObjects = _Data.split("|");
                var BuildSNums = "";
                var BuildNames = "";

                for (var i = 0; i < varObjects.length; i++) {
                    if (varObjects[i].indexOf(",") > 0) {
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
        HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx?CommID=" + $("#hCommID").val(), '组团选择', false, function callback(_Data) {
            if (_Data != "") {//**获得返回 刷新
                var varObjects = _Data.split("|");
                var RegionSNums = "";
                var RegionNames = "";

                for (var i = 0; i < varObjects.length; i++) {
                    if (varObjects[i].indexOf(",") > 0) {
                        RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                        RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                    }
                }
                $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));
            }
        });
    }

    function InitFunction() {
        var h = $(window).height();
        var w = $(window).width();

        $("#TableContainer").css("height", h + "px");
        $("#TableContainer").css("width", w + "px");
    }

    var frozenColumns = [[
        { field: 'CommName', title: '项目名称', align: 'center', sortable: true, width: 200 },
        { field: 'CostName', title: '费用名称', align: 'center', sortable: true, width: 200 }
    ]]

    var column;
    column = [
        [
            { colspan: 4, align: 'center', title: '期初余额' },
            { colspan: 3, align: 'center', title: '本月应收' },
            { colspan: 5, align: 'center', title: '本月实收' },
            { colspan: 5, align: 'center', title: '本月划账' },
            { colspan: 5, align: 'center', title: '期末余额' },
            { colspan: 1, align: 'center', title: '收费率' }
        ],
        [
            //期初余额
            {
                field: '往年欠费', title: '往年欠费', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '往月欠费', title: '往月欠费', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '往年预收', title: '往年预收', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '往月预收', title: '本年往月预收', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            //本月应收
            {
                field: '结转往月', title: '结转往月', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '本月新增', title: '本月新增', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '应收总计', title: '应收总计', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            //本月实收
            {
                field: '实收往年', title: '实收往年', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '实收往月', title: '实收往月', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '实收本月', title: '实收本月', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '本月预收', title: '本月预收', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '实收总计', title: '实收总计', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            //本月划账
            {
                field: '划往年', title: '划往年', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },

            {
                field: '划往月', title: '划往月', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '划本月', title: '划本月', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '划以后', title: '划以后', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '小计', title: '小计', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            //期末余额
            {
                field: 'M_往年欠费', title: '往年欠费', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: 'M_往月欠费', title: '往月欠费', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '本月欠费', title: '本月欠费', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '本月止预收', title: '本月止预收', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            {
                field: '本月分摊', title: '本月分摊', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value);
                    }
                    else {
                        return formatNumberRgx(0);
                    }
                }
            },
            //收费率
            {
                field: '本月收缴率', title: '本月收缴率', align: 'center', width: 100, formatter: function (value) {
                    if (value != "") {

                        return formatNumberRgx(value) + '%';
                    }
                    else {
                        return formatNumberRgx(0) + '%';
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
        },'-',
        {
            text: 'Excel导出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                var rowData = $('#TableContainer').datagrid('getData');
                if (rowData == '') {
                    HDialog.Info('请先生成报表');
                }
                else {
                    window.location.href = "FinancialMonthReportCreExcel.aspx";
                }
            }
        }
    ];

    var ProgressInterval;

    function SearchData() {
        if ($("#CostIDs").val() == "") {
            HDialog.Info("请选择需要统计的费用项目");
            return;
        }
        if ($("#EditBeginDate").val() == "") {
            HDialog.Info("请选择费用开始时间");
            return;
        }
        if ($("#EditEndDate").val() == "") {
            HDialog.Info("请选择费用结束时间");
            return;
        }
        var begintime = new Date($("#EditBeginDate").val());
        var endtime = new Date($("#EditEndDate").val());

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
        $.tool.DataPostNoLoading('FinancialMonthReport', 'StartTask', $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
            },
            function completeCallback() {
            },
            function errorCallback() {
            }
        );
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
            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("FinancialMonthReport", "LoadData", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                if (row.FeesID == 'footer') {
                    return 'background-color:#F4F4F4;border:none;'; 
                }
                return 'height:20px;';
            }
        });
    }

    //获取进度
    function TakeProgress() {
        $.tool.DataPostNoLoading('FinancialMonthReport', 'TakeProgress', $('#frmForm').serialize(),
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
            }
        );
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

    function formatNumberRgx(num) {
        var parts = num.toString().split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return parts.join(".");
    };
</script>