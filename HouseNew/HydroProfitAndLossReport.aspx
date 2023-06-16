<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HydroProfitAndLossReport.aspx.cs" Inherits="M_Main.HouseNew.HydroProfitAndLossReport" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>抄表支出</title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hidCommId" type="hidden" name="hidCommId" value="" runat="server" />
        <input id="CommIds" type="hidden" name="CommIds" value="" runat="server" />

        <div class="SearchContainer" id="TableContainer"></div>

        <%--工具栏--%>
        <div id="dev_deviceInfo_toolbar" class="datagrid-toolbar">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td>统计项目:
                        <input name="CommNames" type="text" id="CommNames" class="easyui-searchbox" searcher="SelComm" runat="server" />
                        &nbsp;&nbsp;
                        统计年度:<input name="Year" type="text" id="Year" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy', autoPickDate: true })" style="width:80px" runat="server" />
                        &nbsp;&nbsp;
                        统计月份:
                        <select id="Month" runat="server" name="Month" style="width:80px">
                            <option value="">全部</option>
                            <option value="1">1月</option>
                            <option value="2">2月</option>
                            <option value="3">3月</option>
                            <option value="4">4月</option>
                            <option value="5">5月</option>
                            <option value="6">6月</option>
                            <option value="7">7月</option>
                            <option value="8">8月</option>
                            <option value="9">9月</option>
                            <option value="10">10月</option>
                            <option value="11">11月</option>
                            <option value="12">12月</option>
                        </select>
                        &nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ExcuteOnServer();">统计</a>
                        &nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" onclick="ToExcel();">导出</a>
                    </td>
                </tr>
            </table>
        </div>

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
            }
            InitFunction();

            function ToExcel() {
                var rows = $("#TableContainer").datagrid("getRows");
                if (rows == null || rows.length == 0) {
                    HDialog.Info('请先统计数据!');
                    return;
                }
                window.open("../HouseNew/HydroProfitAndLossReportToExcel.aspx");
            }

            function SelComm() {
                if ($("#hidCommId").val() == '') {
                    HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1&isCommID=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommIds").val(arrRet.id);
                        $("#CommNames").val(arrRet.name);
                    });
                }
            }

            var column = [[
                { field: 'MeterType', title: '表计类型', width: 100, align: 'center', sortable: true },
                { field: 'MeterArea', title: '表计区域', width: 100, align: 'center', sortable: true },
                {
                    field: 'LastMontDosage', title: '上月用量', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: 'ThisMonthDosage', title: '本月用量', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: 'DosageDiff', title: '用量差异', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: 'LastMontIncome', title: '上月收入(元)', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: 'ThisMonthIncome', title: '本月收入(元)', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: 'IncomeDiff', title: '收入差异(元)', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: '本月支出', title: '本月支出(元)', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: '本月财务盈亏', title: '本月财务盈亏(元)', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                },
                {
                    field: '本月实际盈亏', title: '本月实际盈亏(元)', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var number = 0;
                        try {
                            number = parseFloat(value);
                        } catch (e) {
                            number = 0;
                        }
                        return number.toFixed(2).toString();
                    }
                }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: "#dev_deviceInfo_toolbar",
                    sortOrder: "asc",
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("HydroProfitAndLoss", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) { }
                });
            }
            LoadList();

            var ProgressInterval;
            function ExcuteOnServer() {
                if ($("#CommIds").val() == '') {
                    HDialog.Info('请选择统计项目!');
                    return;
                }
                if ($("#Year").val() == '') {
                    HDialog.Info('请选择统计年度!');
                    return;
                }
                if ($("#Month").val() == '') {
                    HDialog.Info('请选择统计月份!');
                    return;
                }
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('HydroProfitAndLoss', 'StartTask', $('#frmForm').serialize(),
                    function Init() { },
                    function callback(_Data) {
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('HydroProfitAndLoss', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            LoadList();
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {
                                LoadList(1, 500);
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

