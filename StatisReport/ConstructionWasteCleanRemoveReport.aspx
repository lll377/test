<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConstructionWasteCleanRemoveReport.aspx.cs" Inherits="M_Main.StatisReport.ConstructionWasteCleanRemoveReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>建渣清运费收支表</title>
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

    </style>
</head>
<body>
    <form id="frmForm">
        <input id="hiDetailType" type="hidden" name="hiDetailType" runat="server" />
        <input id="hiStatID" type="hidden" name="hiStatID" runat="server" />
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
                        <input class="easyui-searchbox" id="CostName" style="width:180px;" data-options="editable:false" name="CostName" searcher="SelCost" runat="server" />
                        <input type="hidden" id="CostID" name="CostID" runat="server" />
                    </td>
                    <td class="TdTitle">统计方式
                    </td>
                    <td class="TdContent">
                        <select id="StatType" name="StatType" runat="server">
                            <option value="0" selected>按房屋</option>
                        </select>
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

        <div id="DlgDetail" class="easyui-dialog" title="明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 800px; height: 350px; padding: 10px;">
            <%--<div id='tb'>
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ToExcel();">Excel导出</a>
            </div>--%>
            <div style="width: 90%; background-color: #cccccc;" id="TableContainerDetail"></div>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function Clear() {
                $("#CostID").val("");
                $("#CostName").searchbox("setValue","");
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $("#TableContainerDetail").css("height", h-500 + "px");
            }
            InitFunction();

            var column;
            column = [
                [
                    { rowspan: 3, field: 'CommName', title: '项目名称', align: 'center', sortable: false, width: 100 },
                    { rowspan: 3, field: 'CostName', title: '费用项目', align: 'center', sortable: false, width: 150 },
                    {
                        rowspan: 3, field: 'ChargeEndDate', title: '收款日期', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? '合计' : str;
                        }
                    },
                    { colspan: 3, rowspan: 2, title: '户数',width: 300 },
                    { colspan: 3, rowspan: 2, title: '面积' },
                    { colspan: 12, title: '已收建渣清运费' },
                    { colspan: 2, rowspan: 2, title: '应收未交建渣清运费', width: 200 },
                    { colspan: 2, rowspan: 2, title: '不交建渣清运费', width: 200 },
                    { rowspan: 3, field: 'Remark', title: '备注', align: 'center', sortable: false, width: 100 }
                ],
                [
                    { colspan: 3, title: '入住' },
                    { colspan: 3, title: '装修中' },
                    { colspan: 3, title: '未装修' },
                    { colspan: 3, title: '小计' }
                ],
                [
                    {
                        field: 'DeliverNum', title: '已交房户数', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value : "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'DeliverNum');\">" + value + "</a>";
                        }
                    },
                    {
                        field: 'NotDeliverNum', title: '未交房户数', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value :  "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'NotDeliverNum');\">" + value + "</a>";
                        }
                    },
                    {
                        field: 'TotalNum', title: '总户数', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value :  "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'TotalNum');\">" + value + "</a>";
                        }
                    },

                    { field: 'DeliverArea', title: '已交房面积', align: 'center', sortable: false, width: 100 },
                    { field: 'NotDeliverArea', title: '未交房面积', align: 'center', sortable: false, width: 100 },
                    { field: 'TotalArea', title: '总面积', align: 'center', sortable: false, width: 100 },

                    {
                        field: 'CheckInNum', title: '入住户数', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value :  "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'CheckInNum');\">" + value + "</a>";
                        }
                    },
                    { field: 'CheckInArea', title: '入住面积', align: 'center', sortable: false, width: 100 },
                    { field: 'CheckInAmount', title: '入住金额', align: 'center', sortable: false, width: 100 },

                    {
                        field: 'DecoratedNum', title: '装修中户数', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value :  "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'DecoratedNum');\">" + value + "</a>";
                        }
                    },
                    { field: 'DecoratedArea', title: '装修中面积', align: 'center', sortable: false, width: 100 },
                    { field: 'DecoratedAmount', title: '装修中金额', align: 'center', sortable: false, width: 100 },

                    {
                        field: 'NotDecoratedNum', title: '未装修户数', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value : "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'NotDecoratedNum');\">" + value + "</a>";
                        }
                    },
                    { field: 'NotDecoratedArea', title: '未装修面积', align: 'center', sortable: false, width: 100 },
                    { field: 'NotDecoratedAmount', title: '未装修金额', align: 'center', sortable: false, width: 100 },

                    {
                        field: 'SubTotalNum', title: '户数小计', align: 'center', sortable: false, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value : "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'SubTotalNum');\">" + value + "</a>";
                        }
                    },
                    { field: 'SubTotalArea', title: '面积小计', align: 'center', sortable: false, width: 100 },
                    { field: 'SubTotalAmount', title: '金额小计', align: 'center', sortable: false, width: 100 },

                    {
                        field: 'DueAmountNum', title: '应收未交户数', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value : "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'DueAmountNum');\">" + value + "</a>";
                        }
                    },
                    { field: 'DueAmountArea', title: '应收未交面积', align: 'left', sortable: true, width: 100 },

                    {
                        field: 'DeptAmountNum', title: '不交户数', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                            return str == null ? value : "<a href=\"#\" id=\"" + row.ID + "\" onclick=\"ShowDetail(this.id,'DeptAmountNum');\">" + value + "</a>";
                        }
                    },
                    { field: 'DeptAmountArea', title: '不交面积', align: 'left', sortable: true, width: 100 }
                ]
            ];

            var columnDetail = [[
                { field: 'CommName', title: '项目名称', align: 'left', sortable: true, width: 150 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 150 },
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200 },
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 100 },
                { field: 'Amount', title: '金额', align: 'left', sortable: true, width: 100 }
            ]]

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
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').datagrid('getData');
                        if (rowData == '') {
                            HDialog.Info('请先生成报表');
                        }
                        else {
                            window.location.href = "../StatisReport/ConstructionWasteCleanRemoveReportToExcel.aspx";
                        }
                    }
                }
            ];
          

            var ProgressInterval;
            function Search() {
                LoadData();
            }
            function SearchData() {
                if ($("#StartDate").val() == "") {
                    HDialog.Info("收款开始时间不能为空");
                    return;
                }
                if ($("#EndDate").val() == "") {
                    HDialog.Info("收款结束时间不能为空");
                    return;
                }
                if ($("#CostID").val() == "")
                {
                    HDialog.Info("费用项目不能为空");
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
                $.tool.DataPostNoLoading('ConstructionWasteCleanRemoveReport', 'StartTask', $('#frmForm').serialize(),
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
                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
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
                        param = $.JQForm.GetParam("ConstructionWasteCleanRemoveReport", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            function ShowDetail(sStatID, DetailType) {
                
                document.getElementById('hiStatID').value = sStatID;
                document.getElementById('hiDetailType').value = DetailType;

                $("#TableContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
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
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("ConstructionWasteCleanRemoveReport", "LoadDataDetail", "TableContainerDetail", param);
                    },
                });

                $('#DlgDetail').parent().appendTo($("form:first"))
                $('#DlgDetail').dialog('open');
            }

            LoadData();

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('ConstructionWasteCleanRemoveReport', 'TakeProgress', $('#frmForm').serialize(),
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


            function SelCost() {
                var varReturn;

                HDialog.Open('700', '400', "../dialogNew/CorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var data = JSON.parse(_Data);
                        $('#CostID').val(data.CostID);
                        $('#CostName').searchbox('setValue', data.CostName);
                    }
                });

            }
        </script>
    </form>
</body>
</html>
