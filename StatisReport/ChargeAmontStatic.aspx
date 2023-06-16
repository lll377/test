<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargeAmontStatic.aspx.cs" Inherits="M_Main.StatisReport.ChargeAmontStatic" %>


<!DOCTYPE html>
<html>
<head>
    <title>收款统计报表</title>
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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 240px;
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
        <input id="hCommID" name="hCommID" value="" type="hidden" runat="server" />
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input style="width: 8px" id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
         <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 550px; height: 240px; padding-left: 10px; padding-top: 5px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red; font-size:14px;'>
                <tr>
                    <td valign="top" style='color: red; font-size:14px;'>备注：<br />
                       1、用于统计一年中每月、每种收款方式收取的费用金额；“T+1”表示不管统计条件如何设置，数据范围截止上日；<br />
2、统计范围：选择全部时，统计结果为收款减去退款的金额。<br />



                    </td>
                </tr>
            </table>
        </div>
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer" style="width: 100%;"></div>
        <div id="TableContainerTwo" style="width: 100%;" class="easyui-datagrid"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelComm();"></textarea>
                    </td>
                </tr>
                

                <tr>
                    <td class="TdTitle">收款年度
                    </td>
                    <td class="TdContent">
                        <input id="ChargeYear" name="ChargeYear" onClick="WdatePicker({ readOnly: true, dateFmt: 'yyyy '})"  runat="server" />
                    </td>
                    <td class="TdTitle">收款截至月份</td>
                    <td class="TdContent">
                        <select id="ChargeMonth" name="ChargeMonth" runat="server">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">收款方式
                    </td>
                    <td class="TdContent">
                        <select id="ChargeMode" name="ChargeMode" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">统计范围</td>
                    <td class="TdContent">
                        <select id="FlagKeyAll" name="FlagKeyAll" runat="server">
                            <option selected value="">全部</option>
                            <option value="">收款</option>
                            <option value="">退款</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">查询</a>--%>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                        <%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="Clear();">清空</a>--%>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height() / 3 * 2;
                var h2 = $(window).height() / 3
                $("#TableContainer").css("height", h + "px");

                $("#TableContainerTwo").css("height", h2 + "px");
            }
            InitFunction();

            $(function () {
                if ($("#hCommID").val() !== null && $("#hCommID").val() != "") {
                    $("#ViewType").combobox({
                        onLoadSuccess: function () {
                            $(this).combobox('setValue', 'Comm');
                        }
                    });
                    $("#ViewType").combobox({
                        disabled: true
                    });
                }

                //获取进度
                $.tool.DataPostNoLoading('ArrearageAgeReport', 'TakeProgress', $('#frmForm').serialize(),
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
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }

            function SelEnd() {
                var Sd = $("#ChargeYear").val();
                var Left_Sd = Sd.substr(0, 4);
                WdatePicker({ dateFmt: Left_Sd })
            }
            function SelStart() {


                WdatePicker()
            }

            function Clear() {

                $("#CostNames").val("");
                $("#ChargeYear").val("");
            }

 

            var column =
                [[
                    { field: '单位', title: '单位', align: 'left', width: 300, sortable: false },
                    { field: '收款方式', title: '收款方式', align: 'center', width: 100, sortable: false },

                    {
                        field: '金额', title: '金额', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '1月', title: '1月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },

                    {
                        field: '2月', title: '2月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '3月', title: '3月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '4月', title: '4月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '5月', title: '5月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '6月', title: '6月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '7月', title: '7月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '8月', title: '8月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        } },
                    {
                        field: '9月', title: '9月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '10月', title: '10月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else {
                                return '0.00';
                            }
                        } },
                    {
                        field: '11月', title: '11月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } },
                    {
                        field: '12月', title: '12月', align: 'center', width: 100, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                            else
                            {
                                return '0.00';
                            }
                        } }
                ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '收款报表',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            window.location.href = "ChargeAmontStaticToExcel.aspx";
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
                LoadDatChargeMode();
            }

            var frozenColumns = [[
                { field: '收款方式', title: '收款方式', align: 'left',width:100, sortable: true },
                {
                    field: '金额', title: '金额', align: 'left', width: 100, sortable: true, formatter: function (value) {
                        if (value != "") {

                            return formatNumberRgx(value);
                        }
                    } },
                { field: '比例', title: '比例', align: 'left',width:100, sortable: true }
            ]]

               function LoadDatChargeMode() {

       

            $("#TableContainerTwo").datagrid({
                 url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
                    pageSize: [100],
                    pageList: [100, 200, 500, 1000],
                    columns: frozenColumns,
                    singleSelect: true,
                    fitColumns: false,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                       
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("ChargeAmontStatic", "LoadDataTwo", "TableContainerTwo", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
            });
            }


            function SearchData() {
                if ($("#CommIDs").val() == "") {
                    HDialog.Info("请选择管理项目");
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
                $.tool.DataPostNoLoading('ChargeAmontStatic', 'StartTask', $('#frmForm').serialize(),
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
                        param = $.JQForm.GetParam("ChargeAmontStatic", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('ChargeAmontStatic', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadData();
                            LoadDatChargeMode();
                            CloseProgress();
                        }
                        else {

                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {

                                LoadData();
                                LoadDatChargeMode();
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
            TakeProgress();

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
    </form>
</body>
</html>
