<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArrearageAgingReport.aspx.cs" Inherits="M_Main.StatisReport.ArrearageAgingReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>欠费分析报表</title>
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

        <input id="IsDetail" name="IsDetail" value="0" type="hidden" />

        <input style="width: 8px" id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />

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
                    <td class="TdContent" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelComm();"></textarea>
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
                    <td class="TdTitle">费用开始时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesStartDate" name="FeesStartDate" onclick="SelStart();" runat="server" />
                    </td>
                    <td class="TdTitle">费用结束时间</td>
                    <td class="TdContent">
                        <input id="FeesEndDate" name="FeesEndDate" onclick="SelStart();" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">截止收款时间
                    </td>
                    <td class="TdContent">
                        <input id="FeesCutDate" name="FeesCutDate" onclick="SelStart();" runat="server" />
                    </td>
                    <td class="TdTitle">显示方式</td>
                    <td class="TdContent">
                        <select id="Displaymode" name="Displaymode" runat="server">
                            <option value="0">按账龄</option>
                            <option value="1">按年度</option>
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
                var Sd = $("#StartDate").val();
                var Left_Sd = Sd.substr(0, 4);
                WdatePicker({ dateFmt: Left_Sd + '-MM-dd' })
            }
            function SelStart() {
                WdatePicker();
            }

            function Clear() {
                $("#CostIDs").val("");
                $("#CostNames").val("");
                $("#FeesStartDate").val("");
                $("#FeesEndDate").val("");
                $("#FeesCutDate").val("");
            }

            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;
                    if (varReturn != "") {
                        //**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').val(varObjects[1]);
                    }
                });

            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

            }
            InitFunction();

            var column =
                [[
                    { field: '单位', title: '单位', align: 'left', width: 300, sortable: false },
                    { field: '费用项目', title: '费用项目', align: 'center', width: 150, sortable: false },

                    {
                        field: '欠费总额', title: '欠费总额', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '往年欠费', title: '前期欠费', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '本年欠费', title: '本期欠费', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '欠费1至3月', title: '欠费1至3月', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '欠费4至6月', title: '欠费4至6月', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '欠费7至12月', title: '欠费7至12月', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '欠费1至2年', title: '欠费1至2年', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },
                    {
                        field: '欠费2至3年', title: '欠费2至3年', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    },

                    {
                        field: '欠费3年以上', title: '欠费3年以上', align: 'center', width: 150, sortable: false, formatter: function (value) {
                            if (value != "") {

                                return formatNumberRgx(value);
                            }
                        }
                    }
                ]];

            var toolbar = [
                {
                    text: '统计',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '显示明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#IsDetail").val("1");
                        LoadData();
                    }
                }, '-',
                {
                    text: '显示汇总',
                    iconCls: 'icon-search',
                    handler: function () {
                        $("#IsDetail").val("0");
                        LoadData();
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
                            if ($('#Displaymode').val() == '1') {
                                window.location.href = "ArrearageAgeReportToExcel2.aspx?CommIDs=" + $("#CommIDs").val() + "&CostIDs=" + $("#CostIDs").val() + "&FeesCutDate=" + $("#FeesCutDate").val() + "&FeesStartDate=" + $("#FeesStartDate").val() + "&FeesEndDate=" + $("#FeesEndDate").val();
                            } else {
                                var IsDetail = $("#IsDetail").val();
                                window.location.href = "ArrearageAgeReportToExcel.aspx?IsDetail=" + IsDetail;
                            }
                        }
                    }
                }
            ];

            var ProgressInterval;
            function Search() {
                LoadData();
            }

            function SearchData() {
                if ($("#CommIDs").val() == "") {
                    HDialog.Info("请选择需要统计的小区");
                    return;
                }
                if ($("#CostIDs").val() == "") {
                    HDialog.Info("统计费项不能为空");
                    return;
                }
                if ($("#FeesCutDate").val() == "") {
                    HDialog.Info("请选择收款截止时间");
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
                $.tool.DataPostNoLoading('ArrearageAgeReport', 'StartTask', $('#frmForm').serialize(),
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
                        param = $.JQForm.GetParam("ArrearageAgeReport", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('ArrearageAgeReport', 'TakeProgress', $('#frmForm').serialize(),
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

                                CloseProgress();
                                if ($('#Displaymode').val() == '1') {
                                    $.tool.DataPost('ArrearageAgeReport', 'GetEasyUiColumn', $('#frmForm').serialize(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var colarray = JSON.parse(_Data);
                                            //console.log(colarray);
                                            var col = "{ field: \'单位\', title: \'单位\', align: \'left\', width: 300, sortable: false },{ field: \'费用项目\', title: \'费用项目\', align: \'center\', width: 150, sortable: false },{ field: \'欠费总额\', title: \'欠费总额\', align: \'center\', width: 150, sortable: false, formatter: function (value) { if (value != \'\') { return formatNumberRgx2(value);}}},{ field: \'前期欠费\', title: \'前期欠费\', align: \'center\', width: 150, sortable: false, formatter: function (value) { if (value != \'\') { return formatNumberRgx2(value);} }}, {field: \'本期欠费\', title: \'本期欠费\', align: \'center\', width: 150, sortable: false, formatter: function (value) { if (value != \'\') { return formatNumberRgx2(value); } } }";
                                            for (var i = 0; i < colarray.rows.length; i++) {
                                                col = col + "," + "{ field: \'" + colarray.rows[i].nowYear + "\', title: \'" + colarray.rows[i].nowYear + "\', align: \'center\', sortable: true,width:100,formatter: function (value){if (value != \'\'){return formatNumberRgx2(value);}}}";
                                            }
                                            //col = col.substr(1, col.length);
                                            col = "[[" + col + "]]";
                                            column = eval(col);

                                            LoadData();
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                } else {
                                    LoadData();
                                }
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
                console.log(num);
                var parts = num.toString().split(".");
                parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                return parts.join(".");
            };

            function formatNumberRgx2(num) {
                //console.log(num);
                return num;
            };


        </script>
    </form>
</body>
</html>
