<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanImplement_List.aspx.cs" Inherits="M_Main.Plan.PlanImplement_Detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>计划执行页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/QualityDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
            padding: 0px;
        }

        .active {
            background-color: #cccccc;
        }

        .combobox-item {
            height: 25px;
        }

        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div class="tabs-container" id="DivB">
            <ul class="nav nav-tabs">
                <li class="active" name="room" refpage="PlanImplement_Details" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">计划详情</a>
                </li>
                <li class="" name="cust" refpage="PlanImplement_Adjust" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">计划调整</a>
                </li>
                <li class="" name="cust" refpage="PlanImplement_jhzx" refsel="0"><a data-toggle="tab" href="#tab-3" id="dds" aria-expanded="false">计划执行</a>
                </li>
            </ul>
            <div class="tab-content ">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" id="div1" style="padding: 0px; min-height: 300px; overflow-y: auto;">
                        <iframe id="PlanImplement_Details" style="width: 100%; border: none; min-height: 300px; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" id="div2" style="padding: 0px;">
                        <iframe id="PlanImplement_Adjust" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" id="div3" style="padding: 0px;">
                        <iframe id="PlanImplement_jhzx" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="PlanId" runat="server" name="PlanId" />
        <input type="hidden" id="SubmitType" runat="server" name="SubmitType" />
        <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() / 2;
                $("#DivB").css({ "height": h + "px" });
                $("#TableContainer").css({ "height": h + "px" });
                document.getElementById("div2").style.height = h + "px";
                document.getElementById("div3").style.height = h + "px";
                document.getElementById("PlanImplement_Adjust").style.height = (h - 4) + "px";
                document.getElementById("PlanImplement_jhzx").style.height = (h - 4) + "px";
            }
            InitTableHeight();

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                //获得任务id
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != "" && row != null && row != undefined) {
                    if (refpage == 'PlanImplement_jhzx') {
                        $("#" + refpage).attr("src", refpage + ".aspx?DetailId=" + row.DetailId + "&SubmitType=" + $("#SubmitType").val()+"&PlanId="+$("#PlanId").val());
                        $(this).attr("refsel", "1");
                    } else if (refpage == 'PlanImplement_Adjust') {
                        $("#" + refpage).attr("src", refpage + ".aspx?DetailId=" + row.DetailId + "");
                        $(this).attr("refsel", "1");
                    }
                    else {
                        $("#" + refpage).attr("src", refpage + ".aspx?DetailId=" + row.DetailId + "");
                        $(this).attr("refsel", "1");
                    }
                } else {
                    HDialog.Info("请选择任务！");
                }

            });

            var frozenColumns = [[
                {
                    field: 'Sort', title: '序号', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<span style=\"color:darkblue;\">" + row.Sort + "</span>";
                        return str;
                    }
                }
            ]];

            var column = [[
                { field: 'DetailId', title: 'Id', width: 15, align: 'left', sortable: true, hidden: true },
                { field: 'Name', title: '计划周期', width: 50, align: 'left', sortable: true },
                { field: 'TypeName', title: '计划类型', width: 80, align: 'left', sortable: true },
                { field: 'PlanName', title: '计划名称', width: 180, align: 'left', sortable: true },
                {
                    field: 'PlanStartTime', title: '计划开始时间', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'PlanEndTime', title: '计划结束时间', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PlanEndTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'Target', title: '计划目标', width: 180, align: 'left', sortable: true },
                { field: 'PlanCost', title: '计划费用（元）', width: 80, align: 'left', sortable: true },
                { field: 'Point', title: '所占分值', width: 60, align: 'left', sortable: true },
                { field: 'GetCost', title: '所占金额（元）', width: 80, align: 'left', sortable: true },
                {
                    field: 'ActualStartTime', title: '实施开始时间', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.ActualStartTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ActualEndTime', title: '实施结束时间', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.ActualEndTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'ActualTarget', title: '累计完成目标', width: 100, align: 'left', sortable: true },
                { field: 'ActualCost', title: '累计完成费用（元）', width: 100, align: 'left', sortable: true },
                { field: 'ActualPoint', title: '累计所得分值', width: 80, align: 'left', sortable: true },
                { field: 'ActualGetCost', title: '累计所得金额（元）', width: 100, align: 'left', sortable: true },
                { field: 'DutyUserName', title: '责任人', width: 100, align: 'left', sortable: true },
                { field: 'AssistManName', title: '协助人', width: 100, align: 'left', sortable: true },
                { field: 'EvaluationUserName', title: '考评人', width: 100, align: 'left', sortable: true },
                { field: 'PlanSourceName', title: '计划来源', width: 100, align: 'left', sortable: true },
                { field: 'IsClose', title: '是否关闭', width: 50, align: 'left', sortable: true },
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsPlan", "GetImplementListDetail", "TableContainer", param);
                    },
                    onSelect: function (rowIndex, rowData) {
                        $("#PlanImplement_Details").attr("src", "PlanImplement_Details.aspx?DetailId=" + rowData.DetailId);
                        $("#PlanImplement_Adjust").attr("src", "PlanImplement_Adjust.aspx?DetailId=" + rowData.DetailId + "&SubmitType=" + $("#SubmitType").val());
                        $("#PlanImplement_jhzx").attr("src", "PlanImplement_jhzx.aspx?DetailId=" + rowData.DetailId + "&IsClose=" + rowData.IsClose + "&SubmitType=" + $("#SubmitType").val());
                    }, onLoadSuccess: function () {
                        $('#TableContainer').datagrid("selectRow", 0);
                    }
                });
            }
            LoadList();

        </script>
    </form>
</body>
</html>

