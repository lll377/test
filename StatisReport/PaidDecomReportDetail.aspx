<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaidDecomReportDetail.aspx.cs" Inherits="M_Main.StatisReport.PaidDecomReportDetail" %>

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
        <input id="CostIds" type="hidden" name="CostIds" value="" runat="server" />
        <input id="StatYear" type="hidden" name="StatYear" value="" runat="server" />
        <input id="StatMonth" type="hidden" name="StatMonth" value="" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>

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

            var toolbar = [
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getRows');
                        if (rows == null || rows.length == 0) {
                            HDialog.Info('没有可导出的数据');
                        }
                        else {
                            var param = "CostIds=" + $("#CostIds").val() + "&StatYear=" + $("#StatYear").val() + "&StatMonth=" + $("#StatMonth").val();
                            window.open('../StatisReport/PaidDecomReportDetailToExcel.aspx?' + param);
                        }
                    }
                }
            ];

            var columns = [
                [
                    { field: 'CommName', title: '项目名称', align: 'left', halign: 'center', sortable: true, width: 180 },
                    { field: 'CustName', title: '客户名称', align: 'left', halign: 'center', sortable: true, width: 140 },
                    { field: 'RoomSign', title: '房屋名称', align: 'left', halign: 'center', sortable: true, width: 140 },
                    {
                        field: 'BuildArea', title: '收费面积', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    { field: 'CostName', title: '收费科目', align: 'left', halign: 'center', sortable: true, width: 150 },
                    { field: 'BillsSign', title: '票据号', align: 'left', halign: 'center', sortable: true, width: 120 },
                    {
                        field: 'ChargeAmount', title: '金额', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            return number_format(value, 2, ".", ",");
                        }
                    },
                    { field: 'ChargeDate', title: '收款时间', align: 'left', halign: 'center', sortable: true, width: 150 },
                    { field: 'UserName', title: '收款人', align: 'left', halign: 'center', sortable: true, width: 120 }
                ]
            ];

            function LoadList() {
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
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("PaidDecomReport", "LoadDetailData", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) { }
                });
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
        </script>
    </form>
</body>
</html>
