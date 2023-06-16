<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommSummaryArrearsBrowse.aspx.cs" Inherits="M_Main.StatisReport.CommSummaryArrearsBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title>欠费汇总统计报表</title>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 550px;
            height: 200px;
        }

        .SearchTable {
            width: 550px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }

        td {
            padding: 3px 0;
        }
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="CorpCostIds" name="CorpCostIds" value="" type="hidden" />
        <input id="CommIds" name="CommIds" value="" type="hidden" runat="server" />
        <input id="RoomStates" name="RoomStates" value="" type="hidden" />
        <input id="CustTypeNames" name="CustTypeNames" value="" type="hidden" />
        <input id="hCommId" name="hCommId" value="" type="hidden" runat="server" />
        <input id="hCommName" name="hCommName" value="" type="hidden" runat="server" />
        <input id="IsLoad" name="IsLoad" value="0" type="hidden" />

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
                    <td class="TdContentSearch" colspan="3">
                        <input id="CommNames" class="easyui-searchbox" style="width: 90%" searcher="SelComm" data-options="editable:false" name="CommNames" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从
                    </td>
                    <td class="TdContentSearch">
                        <input id="HidFeesStartDate" name="HidFeesStartDate" runat="server" type="hidden" />
                        <input id="FeesStartDate" name="FeesStartDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" style="width: 95%;" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input id="HidFeesEndDate" name="HidFeesEndDate" type="hidden" runat="server" />
                        <input id="FeesEndDate" name="FeesEndDate" class="Wdate" onclick=" WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" style="width: 95%;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">收款时间从
                    </td>
                    <td class="TdContentSearch">
                        <input id="HidChargeStartDate" name="HidChargeStartDate" runat="server" type="hidden" />
                        <input id="ChargeStartDate" name="ChargeStartDate" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" style="width: 95%;" />
                    </td>
                    <td class="TdTitle">到
                    </td>
                    <td class="TdContentSearch">
                        <input id="HidChargeEndDate" name="HidChargeEndDate" type="hidden" runat="server" />
                        <input id="ChargeEndDate" name="ChargeEndDate" class="Wdate" onclick=" WdatePicker({ dateFmt: 'yyyy-MM-dd' })" runat="server" style="width: 95%;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用科目</td>
                    <td class="TdContentSearch">
                        <input id="CorpCostNames" class="easyui-searchbox" searcher="SelCost" data-options="editable:false" name="CorpCostNames" runat="server" style="width: 95%;" />
                    </td>
                    <td class="TdTitle onlyComm">交房状态</td>
                    <td class="TdContentSearch onlyComm">
                        <select id="RoomState" class="easyui-combobox" name="RoomState" runat="server" data-options="multiple:true,panelHeight:'auto'" style="width: 95%;"></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle onlyComm">客户类别</td>
                    <td class="TdContentSearch onlyComm">
                        <select id="CustType" class="easyui-combobox" name="CustType" runat="server" data-options="multiple:true,panelHeight:'auto'" style="width: 95%;"></select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">统计</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(function () {
                Clear()
            });

            //选择项目
            function SelComm() {
                if ($("#hCommId").val() == '') {
                    var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIds").val(arrRet.id);
                        $('#CommNames').searchbox('setValue', arrRet.name);
                    });
                }
            }

            //选择费用项目
            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;
                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $('#CorpCostIds').val(varObjects[0]);
                        $('#CorpCostNames').searchbox('setValue', varObjects[1]);
                    }
                });
            }

            //清除条件
            function Clear() {
                $("#CorpCostIds").val("");
                $('#CorpCostNames').searchbox('setValue', '');
                $("#CommIds").val($("#hCommId").val());
                $('#CommNames').searchbox('setValue', $("#hCommName").val());
                $("#FeesStartDate").val($("#HidFeesStartDate").val());
                $("#FeesEndDate").val($("#HidFeesEndDate").val());
                $("#ChargeStartDate").val($("#HidChargeStartDate").val());
                $("#ChargeEndDate").val($("#HidChargeEndDate").val());
                $('#CustType').combobox('setValue', '');
                $("#CustTypeNames").val("");
                $('#RoomState').combobox('setValue', '');
                $("#RoomStates").val("");
                //if ($("#hCommId").val()) {
                //    $(".onlyComm").html("");
                //}
            }

            //网格初始化
            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width();

                $("#TableContainer").css("height", h + "px");
                $("#TableContainer").css("width", w + "px");
            }
            InitFunction();

            var column = [
                [

                    { field: 'CommName', title: '项目名称', align: 'center', sortable: true, width: 150 },
                    { field: 'CorpCostName', title: '费用项目', align: 'center', sortable: true, width: 140 },
                    { field: 'RoomStateName', title: '交房状态', align: 'center', sortable: true, width: 120 },
                    { field: 'CustTypeName', title: '客户类别', align: 'center', sortable: true, width: 100 },
                    {
                        field: '欠费总额', title: '欠费总额', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") return formatNumberRgx(value);
                        }
                    },
                    {
                        field: '优惠金额', title: '优惠金额', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") return formatNumberRgx(value);
                        }
                    },
                    {
                        field: '欠费应收', title: '欠费应收', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") return formatNumberRgx(value);
                        }
                    },
                    {
                        field: '欠费实收', title: '欠费实收', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") return formatNumberRgx(value);
                        }
                    },
                    {
                        field: '剩余欠费', title: '剩余欠费', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") return formatNumberRgx(value);
                        }
                    },
                    {
                        field: '收费率', title: '收费率', align: 'center', sortable: true, width: 120, formatter: function (value) {
                            if (value != "") return value + "%";
                        }
                    },
                    { field: '欠费户数', title: '欠费户数', align: 'center', sortable: true, width: 120 }
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
                            window.location.href = "CommSummaryArrearsBrowseToExcel.aspx";
                        }
                    }


                }
            ];

            var ProgressInterval;

            function SearchData() {
                if ($("#CommIds").val() == "") {
                    HDialog.Info("请选择需要统计的小区");
                    return;
                }

                if ($("#CorpCostIds").val() == "") {
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
                if ($("#ChargeStartDate").val() == "") {
                    HDialog.Info("请选择收款开始时间");
                    return;
                }
                if ($("#ChargeEndDate").val() == "") {
                    HDialog.Info("请选择收款结束时间");
                    return;
                }

                var feesBegintime = new Date($("#FeesStartDate").val());
                var feesEndtime = new Date($("#FeesEndDate").val());
                var chargeBegintime = new Date($("#ChargeStartDate").val());
                var chargeEndtime = new Date($("#ChargeEndDate").val());

                if (feesBegintime > feesEndtime) {
                    HDialog.Info('费用结束时间不能小于费用开始时间！');
                    return;
                }
                if (chargeBegintime > chargeEndtime) {
                    HDialog.Info('收款结束时间不能小于费用开始时间！');
                    return;
                }
                $("#SearchDlg").dialog("close");
                $("#IsLoad").val(1);
                $("#CustTypeNames").val($('#CustType').combobox('getValues'));
                $("#RoomStates").val($('#RoomState').combobox('getValues'));
                
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('CommSummaryArrears', 'StartTask', $('#frmForm').serialize(),
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
                    fitColumns: true,
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
                        param = $.JQForm.GetParam("CommSummaryArrears", "LoadData", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                        return 'height:20px;';
                    }

                });


            }
            LoadData();
            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('CommSummaryArrears', 'TakeProgress', $('#frmForm').serialize(),
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

                var feesBegintime = $("#FeesStartDate").val();
                var feesEndtime = $("#FeesEndDate").val();
                var chargeBegintime = $("#ChargeStartDate").val();
                var chargeEndtime = $("#ChargeEndDate").val();
                if (feesBegintime != '' && feesEndtime != '' && chargeBegintime != '' && chargeEndtime != '') {
                    var promptText = "数据取值时间范围：费用时间从 " + feesBegintime + " 00:00:00 至 " + feesEndtime + " 23:59:59&nbsp;&nbsp;&nbsp;&nbsp;收款时间从  " + chargeBegintime + " 00:00:00 至 " + chargeEndtime + " 23:59:59";
                    $(".datagrid-toolbar table tbody tr").append("<td style='color: red;padding-left: 10px;'>" + promptText + "</td>");
                }
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

