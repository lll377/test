<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RefundReport.aspx.cs" Inherits="M_Main.StatisReport.RefundReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>暂收费用收退汇总表</title>
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
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 200px;
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
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="Attribute" name="Attribute" value="" type="hidden" />
        <input id="CostIDs" name="CostIDs" value="" type="hidden" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContent">
                        <label id="CommName" runat="server"></label>
                    </td>
                    <td class="TdTitle">费用类型
                    </td>
                    <td class="TdContent">
                        <label id="CostType" runat="server">暂收类</label>
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
                    <td class="TdTitle">统计开始时间
                    </td>
                    <td class="TdContent">
                        <input id="StartDate" name="StartDate" onclick="WdatePicker()" runat="server" />
                    </td>
                    <td class="TdTitle">统计结束时间
                    </td>
                    <td class="TdContent">
                        <input id="EndDate" name="EndDate" onclick="WdatePicker()" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">

                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">查询</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function Clear() {
                $("#CostIDs").val("");
                $("#CostNames").val("");
            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;
                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $("#CostIDs").val(varObjects[0]);
                        $("#CostNames").val(varObjects[1]);
                    }
                });
            }
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var frozenColumns = [[
                { field: '费用大项', title: '费用大项', align: 'left', sortable: true, width: 200 },
                { field: '费用小项', title: '费用小项', align: 'left', sortable: true, width: 200 }
            ]]

            var column;
            column = [

                [
                    {
                        field: '期初余额', title: '期初余额', width: 150, align: 'center', sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '本期收款', title: '本期收款', width: 150, align: 'center', sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '本期退款', title: '本期退款', width: 120, align: 'center', sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '期末余额', title: '期末余额', width: 80, align: 'center', sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '本年收款', title: '本年收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '本年退款', title: '本年退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '本年余额', title: '本年余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '1月收款', title: '1月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '1月退款', title: '1月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '1月余额', title: '1月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '2月收款', title: '2月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '2月退款', title: '2月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '2月余额', title: '2月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '3月收款', title: '3月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '3月退款', title: '3月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '3月余额', title: '3月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '4月收款', title: '4月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '4月退款', title: '4月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '4月余额', title: '4月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '5月收款', title: '5月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '5月退款', title: '5月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '5月余额', title: '5月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '6月收款', title: '6月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '6月退款', title: '6月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '6月余额', title: '6月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '7月收款', title: '7月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '7月退款', title: '7月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '7月余额', title: '7月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '8月收款', title: '8月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '8月退款', title: '8月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '8月余额', title: '8月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '10月收款', title: '10月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '10月退款', title: '10月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '10月余额', title: '10月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '11月收款', title: '11月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '11月退款', title: '11月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '11月余额', title: '11月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '12月收款', title: '12月收款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '12月退款', title: '12月退款', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '12月余额', title: '12月余额', align: 'center', width: 80, sortable: true, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    }
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
                    text: '暂收费用收退汇总表打印',
                    iconCls: 'icon-print',
                    handler: function () {
                        ReportPrint("RefundReport");
                    }
                }
            ];

            function ReportPrint(Cmd) {
                if ($("#StartDate").val() == "") {
                    HDialog.Info("开始时间不能为空");
                    return;
                }
                if ($("#EndDate").val() == "") {
                    HDialog.Info("结束时间不能为空");
                    return;
                }
                var strAttribute = "<Attribute><CostNames>" + $("#CostNames").val() + "</CostNames><StartDate>" + $("#StartDate").val() + "</StartDate><EndDate>" + $("#EndDate").val() + "</EndDate></Attribute>";
                $.tool.Print(Cmd, strAttribute);
            }

            function SetAttribute() {
                var strAttribute = "<Attribute><CostNames>" + $("#CostNames").val() + "</CostNames><StartDate>" + $("#StartDate").val() + "</StartDate><EndDate>" + $("#EndDate").val() + "</EndDate></Attribute>";
                $("#Attribute").val(strAttribute);
            }

            var ProgressInterval;
            function Search() {
                LoadData();
            }
            function SearchData() {
                if ($("#StartDate").val() == "") {
                    HDialog.Info("统计开始时间不能为空");
                    return;
                }
                if ($("#EndDate").val() == "") {
                    HDialog.Info("统计结束时间不能为空");
                    return;
                }
                $("#SearchDlg").dialog("close");
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 3000);
            }
            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('RefundReport', 'StartTask', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        LoadData();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载数据
            function LoadData() {
                SetAttribute();
                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
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
                        param = $.JQForm.GetParam("RefundReport", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }


            LoadData();

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('RefundReport', 'TakeProgress', $('#frmForm').serialize(),
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

            function formatNumberRgx(num) {
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };
        </script>
    </form>
</body>
</html>
