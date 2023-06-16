<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncomeStatistics.aspx.cs" Inherits="M_Main.StatisReport.IncomeStatistics" %>


<!DOCTYPE html>
<html>
<head>
    <title>报事累计统计表</title>
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
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="Attribute" name="Attribute" value="" type="hidden" />
        <input id="CostIDs" name="CostIDs" value="" type="hidden" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="width: 700px; height: 180px; padding: 10px;" data-options="iconCls:'icon-search',closed: true,modal:true" >
            <table class="SearchTable">
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
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server" /></td>
                    <td class="TdTitle">统计方式
                    </td>
                    <td class="TdContent">
                        <select id="StatType" name="StatType">
                            <option value="0">按客户</option>
                            <option value="1">按房号</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">

                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计并查询</a>

                    </td>
                </tr>
            </table>
        </div>


        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">



            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#hiIsSQLData').val('-1');
            }
            InitFunction();

            var column;
            column = [
                [
                    { rowspan: 2, field: 'PeriodName', title: '费用期间', align: 'center', sortable: false, width: 100  },
                    { colspan: 2, title: '期初欠费' },
                    { colspan: 2, title: '应收' },
                    { colspan: 2, title: '本期实收' },
                    { colspan: 2, title: '本期预存冲抵' },
                    { colspan: 2, title: '本期欠费（截止所选收款截止日期）' }
                ],
                [
                    { field: 'BeforeDebtsNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'BeforeDebtsAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'DueNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'DueAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'PaidNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'PaidAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'PrecNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'PrecAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'EndDebtsNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'EndDebtsAmount', title: '金额', align: 'center', sortable: false, width: 100 }
                    
                ]
            ];

            var Headcolumn = [
                [
                    { rowspan: 2, field: 'PeriodName', title: '费用期间', align: 'center', sortable: false, width: 100 },
                    { colspan: 2, title: '期初欠费' },
                    { colspan: 2, title: '应收' },
                    { colspan: 2, title: '本期实收' },
                    { colspan: 2, title: '本期预存冲抵' },
                    { colspan: 2, title: '本期欠费（截止所选收款截止日期）' }
                ],
                [
                    { field: 'BeforeDebtsNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'BeforeDebtsAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'DueNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'DueAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'PaidNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'PaidAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'PrecNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'PrecAmount', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: 'EndDebtsNum', title: '客户/户数', align: 'center', sortable: false, width: 100 },
                    { field: 'EndDebtsAmount', title: '金额', align: 'center', sortable: false, width: 100 }

                ]
            ];

            var ExcelCol = [[
                { field: 'PeriodName', title: '费用期间', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'BeforeDebtsNum', title: '客户/户数', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'BeforeDebtsAmount', title: '金额', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'DueNum', title: '客户/户数', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'DueAmount', title: '金额', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'PaidNum', title: '客户/户数', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'PaidAmount', title: '金额', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'PrecNum', title: '客户/户数', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'PrecAmount', title: '金额', fixed: true, align: 'left', sortable: true, width: 100 },
                { field: 'EndDebtsNum', title: '客户/户数', fixed: true, align: 'left', sortable: true, width: 150 },
                { field: 'EndDebtsAmount', title: '金额', fixed: true, align: 'left', sortable: true, width: 100 }
            ]];

            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable2(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }


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
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            Export('导出报表Excel', $('#TableContainer'));
                        }

                    }
                }

            ];


            var ProgressInterval;
            function Search() {
                $('#hiIsSQLData').val('1');
                LoadData();
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


            function SearchData() {

                if ($('#EditBeginDate').val() == "") {
                    HDialog.Info("请选择费用开始日期");
                }

                if ($('#EditEndDate').val() == "") {
                    HDialog.Info("请选择费用结束日期");
                }

                if ($('#ChargeBeginDate').val() == "") {
                    HDialog.Info("请选择收款开始日期");
                }

                if ($('#ChargeEndDate').val() == "") {
                    HDialog.Info("请选择收款结束日期");
                }

                var d1 = $('#EditBeginDate').val().split("-");
                var d2 = $('#EditEndDate').val().split("-");

                if (d1[0] != d2[0]) {
                    HDialog.Info("费用日期请选择同一年");
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
                $.tool.DataPostNoLoading('IncomeStatistics', 'StartTask', $('#frmForm').serialize(),
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
            var toolall = '';
            function LoadData() {

                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: [30],
                    pageList: [30, 50, 100],
                    columns: column,
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
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        CloseProgress();

                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncomeStatistics", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }
            LoadData();
            ////展示进度
            //ShowProgress();
            ////获取执行情况进度
            //ProgressInterval = setInterval("TakeProgress()", 1000);
            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('IncomeStatistics', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            $('#hiIsSQLData').val('1');
                            CloseProgress();
                            LoadData();
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
        </script>
    </form>
</body>
</html>
