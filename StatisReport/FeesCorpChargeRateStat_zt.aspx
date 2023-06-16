<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesCorpChargeRateStat_zt.aspx.cs" Inherits="M_Main.StatisReport.FeesCorpChargeRateStat_zt" %>

<!DOCTYPE html>
<html>
<head>
    <title>收费率统计报表</title>
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
        <input id="IsGather" name="IsGather" value="1" type="hidden"  />
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

                        <br />

                    </td>
                </tr>
            </table>
        </div>
        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden; height: 320px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" onclick="SelComm();" runat="server" ru="server" readonly></textarea>
                    </td>
                </tr>

              <%--  <tr>
                    <td class="TdTitle">费用期间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 100px;" id="EditBeginDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" name="EditBeginDate" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" runat="server" style="width: 100px;" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">收款时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 100px;" onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" id="ChargeBeginDate" runat="server" name="ChargeBeginDate" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 100px;" runat="server" onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" id="ChargeEndDate" name="ChargeEndDate" /></td>
                </tr>--%>
                
                <tr>
                    <td class="TdTitle">查询年月</td>
                    <td class="TdContentSearch">
                        <input type="text" class="Wdate" style="width: 100px;" onclick="WdatePicker({ startDate: '%y-%M', dateFmt: 'yyyy-MM', alwaysUseStartDate: true })" id="YearMonth"   name="YearMonth" /></td>
                    <td class="TdTitle"> </td>
                    <td class="TdContentSearch">
                       
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
                { field: '项目名称', title: '项目名称', align: 'center', sortable: true, width: 300 },
                { field: '收费项目', title: '费用名称', align: 'center', sortable: true, width: 100 }
            ]]

            var column;
            column = [
                [
                    { colspan: 4, align: 'center', title: '本月收费' },
                    { colspan: 4, align: 'center', title: '本年收费' },
                    { colspan: 4, align: 'center', title: '往年欠费回收' },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '往期收费率', title: '往期收费率', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    { colspan: 2, align: 'center', title: '当期收费率' },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '综合收费率累积', title: '本年应收及往年欠费收缴率', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        colspan: 1, rowspan: 2, width: 150, align: 'center', field: '全年累计欠收', title: '期末欠费合计', formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    } 
                ],
                [
                    //本期实收
                    {
                        field: '当月应收', title: '本月应收', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '当月优惠及其它', title: '本月减免', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '当月实收', title: '本月实收', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '当月欠收', title: '期末本月欠收', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },


                    {
                        field: '本年应收', title: '本年应收', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年优惠及其它', title: '本年减免', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年实收', title: '本年实收', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年欠收', title: '期末本年欠收', align: 'center', width: 100, formatter: function (value) {
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
                        field: '结转以前年度欠款', title: '年初往年欠费', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '以前年度欠款优惠及其它', title: '本年减免往年欠费', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年已收回', title: '本年实收往年欠费', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },

                    {
                        field: '以前年度欠收', title: '期末往年欠费', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                     
                    {
                        field: '本月收费率', title: '本月收缴率', align: 'center', width: 100, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return formatNumberRgx(0);
                            }
                        }
                    },
                    {
                        field: '本年收费率', title: '本年收缴率', align: 'center', width: 100, formatter: function (value) {
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
                    text: '按区域显示',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#IsGather").val(1);
                        LoadData();
                    }
                }, '-',
                {
                    text: '按项目显示',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#IsGather").val(0);
                        LoadData();
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
                            window.location.href = "FeesCorpChargeRateStat_ztToExcel.aspx";
                        }
                    }


                }
                //, '-',
                //{
                //    text: '备注',
                //    iconCls: 'icon-help',
                //    handler: function () {
                //        $('#DlgMemo').parent().appendTo($("form:first"))
                //        $('#DlgMemo').dialog('open');
                //    }
                //}
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
                $.tool.DataPostNoLoading('FeesCorpChargeRate_zt', 'StartTask', $('#frmForm').serialize(),
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
                        $.tool.MergeEasyUiGrid("TableContainer", "项目名称");
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesCorpChargeRate_zt", "LoadData", "TableContainer", param);
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
                $.tool.DataPostNoLoading('FeesCorpChargeRate_zt', 'TakeProgress', $('#frmForm').serialize(),
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
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };
        </script>
    </form>
</body>
</html>



