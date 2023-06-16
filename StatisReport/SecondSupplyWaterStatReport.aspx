<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecondSupplyWaterStatReport.aspx.cs" Inherits="M_Main.StatisReport.SecondSupplyWaterStatReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>二次供水统计报表</title>
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
                        <input class="easyui-searchbox" id="CostName" style="width: 180px;" data-options="editable:false" name="CostName" searcher="SelCost" runat="server" />
                        <input type="hidden" id="CostID" name="CostID" runat="server" />
                    </td>
                    <td class="TdTitle">统计方式
                    </td>
                    <td class="TdContent">
                        <select id="StatType" name="StatType" runat="server">
                            <option value="0" selected>全部</option>
                            <option value="1">按客户</option>
                            <option value="2">按房号</option>
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
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function Clear() {
                $("#CostID").val("");
                $("#CostName").searchbox("setValue", "");
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var Columns = [[
                { rowspan: 2, field: 'CommName', title: '项目名称', align: 'center', sortable: true, width: 200 },
                { rowspan: 2, field: 'CostName', title: '费用项目', align: 'center', sortable: true, width: 200 },
                { colspan: 2, title: '期初余额', align: 'center' },
                { colspan: 2, title: '本期预存', align: 'center' },
                { colspan: 2, title: '本期冲抵', align: 'center' },
                { colspan: 2, title: '期末余额', align: 'center' },
                {
                    rowspan: 2, field: 'ChargeEndDate', title: '收款日期', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.ChargeEndDate, "yyyy-MM");
                        return str;
                    }
                }

            ],
            [{ field: '期初余额_户数', title: '户数', align: 'left', sortable: true, width: 100 },
            { field: '期初余额', title: '金额', align: 'left', sortable: true, width: 100 },
            { field: '本期预存_户数', title: '户数', align: 'left', sortable: true, width: 100 },
            { field: '本期预存', title: '金额', align: 'left', sortable: true, width: 100 },
            { field: '本期冲抵_户数', title: '户数', align: 'left', sortable: true, width: 100 },
            { field: '本期冲抵', title: '金额', align: 'left', sortable: true, width: 100 },
            { field: '期末余额_户数', title: '户数', align: 'left', sortable: true, width: 100 },
            { field: '期末余额', title: '金额', align: 'left', sortable: true, width: 100 }]]

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
                            window.location.href = "../StatisReport/SecondSupplyWaterStatReportToExcel.aspx";
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
                if ($("#CostID").val() == "") {
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
                $.tool.DataPostNoLoading('SecondSupplyWaterStatReport', 'StartTask', $('#frmForm').serialize(),
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
                    columns: Columns,
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
                        param = $.JQForm.GetParam("SecondSupplyWaterStatReport", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }


            LoadData();

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('SecondSupplyWaterStatReport', 'TakeProgress', $('#frmForm').serialize(),
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

