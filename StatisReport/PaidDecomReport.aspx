<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaidDecomReport.aspx.cs" Inherits="M_Main.StatisReport.PaidDecomReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="overflow: hidden">
    <form id="frmForm" runat="server">
        <input id="CostIds" type="hidden" name="CostIds" value="" />
        <input id="IsFirstLoad" type="hidden" name="IsFirstLoad" value="1" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>

        <div class="datagrid-toolbar">
            <table cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td>
                            <input type="text" class="Wdate" style="width: 100px;" id="ChargeYear" onclick="WdatePicker({ dateFmt: 'yyyy' })" runat="server" name="ChargeYear" />
                        </td>
                        <td>&nbsp;&nbsp;<input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost" name="CostNames" runat="server" />
                        </td>
                        <td>&nbsp;&nbsp;<a href="javascript:ExcuteStatistics();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">统计</a>
                        </td>
                        <td>&nbsp;&nbsp;<a href="javascript:ExportExcel();" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'">导出</a>
                        </td>
                        <td>&nbsp;&nbsp;
                            <span style="color: red">*统计规则:1月从1号到24号,2-11月为上月25号到当月24号，12月为11月25号到12月31号</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                InitTableHeight();
                LoadList();
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            function SelCost() {
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");
                        $('#CostIds').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }
                });
            }

            function ExportExcel() {
                var rows = $('#TableContainer').datagrid('getRows');
                if (rows == null || rows.length == 0) {
                    HDialog.Info('请先生成报表');
                }
                else {
                    //window.open('../StatisReport/PaidDecomReportToExcel.aspx');
                    var date = new Date;
                    var exportName = rows[0].CommName + '项目' + date.getFullYear() + '年' + (date.getMonth() + 1) + '月实收' + rows[0].CostName;
                    Export(exportName, $('#TableContainer'));
                }
            }

            var columns = [
                [
                    { field: 'CommName', title: '项目名称', align: 'left', halign: 'center', sortable: true, width: 180, rowspan: 2 },
                    { field: 'CostName', title: '费用科目', align: 'left', halign: 'center', sortable: true, width: 180, rowspan: 2 },
                    {
                        field: '收费户数', title: '收费户数', align: 'center', sortable: true, width: 100, rowspan: 2, formatter: function (value, row, index) {
                            if (parseInt(value) > 0) {
                                return "<a href=\"javascript:void(0)\" id=\"" + row.StatId + "\" onclick=\"ShowDetail('" + row.StatCostIds + "', '" + row.StatYear + "', '" + row.StatMonth + "');\">" + value + "</a>";
                            }
                            else {
                                return value;
                            }
                        }
                    },
                    {
                        field: '收费面积', title: '收费面积', align: 'center', sortable: true, width: 100, rowspan: 2, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    { field: '统计年分', title: '统计年分', align: 'center', colspan: 12 },
                    {
                        field: 'TotalAmount', title: '合计', align: 'center', sortable: true, width: 100, rowspan: 2, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    }
                ], [
                    {
                        field: '1月', title: '1月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '2月', title: '2月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '3月', title: '3月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '4月', title: '4月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '5月', title: '5月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '6月', title: '6月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '7月', title: '7月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '8月', title: '8月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '9月', title: '9月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '10月', title: '10月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '11月', title: '11月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    {
                        field: '12月', title: '12月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    }
                ]
            ];

            function LoadList() {
                columns[0][4].field = $("#ChargeYear").val() + '年';
                columns[0][4].title = $("#ChargeYear").val() + '年';
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 100, 150],
                    columns: columns,
                    fitColumns: true,
                    remoteSort: false,
                    pagination: true,
                    width: "100%",
                    toolbar: '.datagrid-toolbar',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("PaidDecomReport", "LoadData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) { }
                });
            }

            var ProgressInterval;

            function ExcuteStatistics() {
                if ($("#ChargeYear").val() == '') {
                    HDialog.Info("请选择收款时间,此项不能为空!");
                    return;
                }
                if ($("#CostIds").val() == '') {
                    HDialog.Info("请选择费用项目,此项不能为空!");
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
                $.tool.DataPostNoLoading('PaidDecomReport', 'StartTask', $('#frmForm').serialize(),
                    function Init() { },
                    function callback(_Data) { },
                    function completeCallback() { },
                    function errorCallback() { }
                );
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('PaidDecomReport', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() { },
                    function callback(_Data) {
                        var obj = JSON.parse(_Data);
                        if (obj.code == 200) {
                            if (obj.data == null || obj.data.length == 0) {
                                LoadList();
                                CloseProgress();
                            } else {
                                SetProgress(obj.data);
                                if (obj.data[0].Curr == 100) {
                                    $("#IsFirstLoad").val(0);
                                    LoadList();
                                    CloseProgress();
                                }
                            }
                        } else {
                            LoadList();
                            CloseProgress();
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
                var i = parseInt(Obj[0].Curr);
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }

            function ShowDetail(costIds, statYear, statMonth) {
                var param = "CostIds=" + costIds + "&StatYear=" + statYear + "&StatMonth=" + statMonth;
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, "../StatisReport/PaidDecomReportDetail.aspx?" + param, '实收分解报表明细', false, function callback(_Data) { });
            }

            function number_format(number, decimals, dec_point, thousands_sep) {
                /*
                * 参数说明：
                * number：要格式化的数字
                * decimals：保留几位小数
                * dec_point：小数点符号
                * thousands_sep：千分位符号
                * */
                number = (number + '').replace(/[^0-9+-Ee.]/g, '');
                var n = !isFinite(+number) ? 0 : +number,
                    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                    s = '',
                    toFixedFix = function (n, prec) {
                        var k = Math.pow(10, prec);
                        return '' + Math.ceil(n * k) / k;
                    };

                s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
                var re = /(-?\d+)(\d{3})/;
                while (re.test(s[0])) {
                    s[0] = s[0].replace(re, "$1" + sep + "$2");
                }

                if ((s[1] || '').length < prec) {
                    s[1] = s[1] || '';
                    s[1] += new Array(prec - s[1].length + 1).join('0');
                }
                return s.join(dec);
            }

            var Headcolumn = [
                [
                    { field: '统计信息', title: '统计信息', align: 'center', colspan: 17 }
                ],
                [
                    { field: 'CommName', title: '项目名称', align: 'left', halign: 'center', sortable: true, width: 180, rowspan: 2 },
                    { field: 'CostName', title: '费用科目', align: 'left', halign: 'center', sortable: true, width: 180, rowspan: 2 },
                    { field: '收费户数', title: '收费户数', align: 'center', sortable: true, width: 100, rowspan: 2 },
                    { field: '收费面积', title: '收费面积', align: 'center', sortable: true, width: 100, rowspan: 2 },
                    { field: '统计年分', title: '统计年分', align: 'center', colspan: 12 },
                    { field: 'TotalAmount', title: '合计', align: 'center', sortable: true, width: 100, rowspan: 2 }
                ], [
                    { field: '1月', title: '1月', align: 'center', sortable: true, width: 100 },
                    { field: '2月', title: '2月', align: 'center', sortable: true, width: 100 },
                    { field: '3月', title: '3月', align: 'center', sortable: true, width: 100 },
                    { field: '4月', title: '4月', align: 'center', sortable: true, width: 100 },
                    { field: '5月', title: '5月', align: 'center', sortable: true, width: 100 },
                    { field: '6月', title: '6月', align: 'center', sortable: true, width: 100 },
                    { field: '7月', title: '7月', align: 'center', sortable: true, width: 100 },
                    { field: '8月', title: '8月', align: 'center', sortable: true, width: 100 },
                    { field: '9月', title: '9月', align: 'center', sortable: true, width: 100 },
                    { field: '10月', title: '10月', align: 'center', sortable: true, width: 100 },
                    { field: '11月', title: '11月', align: 'center', sortable: true, width: 100 },
                    { field: '12月', title: '12月', align: 'center', sortable: true, width: 100 }
                ]
            ];

            var ExcelCol = [
                { field: 'CommName', title: '项目名称', align: 'left', halign: 'center', sortable: true, width: 180, rowspan: 2 },
                { field: 'CostName', title: '费用科目', align: 'left', halign: 'center', sortable: true, width: 180, rowspan: 2 },
                { field: '收费户数', title: '收费户数', align: 'center', sortable: true, width: 100, rowspan: 2 },
                {
                    field: '收费面积', title: '收费面积', align: 'center', sortable: true, width: 100, rowspan: 2, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '1月', title: '1月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '2月', title: '2月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '3月', title: '3月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '4月', title: '4月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '5月', title: '5月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '6月', title: '6月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '7月', title: '7月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '8月', title: '8月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '9月', title: '9月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '10月', title: '10月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '11月', title: '11月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: '12月', title: '12月', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                },
                {
                    field: 'TotalAmount', title: '合计', align: 'center', sortable: true, width: 100, rowspan: 2, formatter: function (value, row, index) {
                        return number_format(value, 2, ".", ",");
                    }
                }
            ];

            function Export(strXlsName, exportGrid) {
                Headcolumn[0][0].field = strXlsName;
                Headcolumn[0][0].title = strXlsName;
                Headcolumn[1][4].field = $("#ChargeYear").val() + '年';
                Headcolumn[1][4].title = $("#ChargeYear").val() + '年';

                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val('实收分解表');
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }
        </script>
    </form>
</body>
</html>
