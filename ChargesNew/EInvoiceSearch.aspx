<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EInvoiceSearch.aspx.cs" Inherits="M_Main.ChargesNew.EInvoiceSearch" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/ajax.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        /*#SearchDlg {
            padding: 10px;
            width: 700px;
            height: 250px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }*/

        /*.SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }*/


        .button {
            line-height: 28px;
            height: 28px;
            width: 60px;
            color: #ffffff;
            background-color: #3e73ca;
            font-size: 12px;
            font-weight: normal;
            font-family: 微软雅黑;
            border: 0px solid #dcdcdc;
            -webkit-border-top-left-radius: 3px;
            -moz-border-radius-topleft: 3px;
            border-top-left-radius: 3px;
            -webkit-border-top-right-radius: 3px;
            -moz-border-radius-topright: 3px;
            border-top-right-radius: 3px;
            -webkit-border-bottom-left-radius: 3px;
            -moz-border-radius-bottomleft: 3px;
            border-bottom-left-radius: 3px;
            -webkit-border-bottom-right-radius: 3px;
            -moz-border-radius-bottomright: 3px;
            border-bottom-right-radius: 3px;
            -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
            -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
            box-shadow: inset 0px 0px 0px 0px #ffffff;
            text-align: center;
            display: inline-block;
            text-decoration: none;
        }

            .button:hover {
                background-color: #2b58a0;
            }
    </style>
</head>
<body>
    <form id="frmForm">
        <input id="Attribute" name="Attribute" value="" type="hidden" />
        <input name="hCommID" type="hidden" id="hCommID" />
        <input name="CommIDs" type="hidden" id="CommIDs" />

        <input id="RoomID" type="hidden" size="1" name="RoomID" runat="server" />
        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="CustID" type="hidden" name="CustID" runat="server" />

        <input name="hiIsSQLData" type="hidden" id="hiIsSQLData" style="width: 8px" size="1" />

        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="width: 800px; height: 200px;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable" style="margin: 10px auto">
                <tr>
                    <td class="DialogTdTitle">已红冲</td>
                    <td class="DialogTdContent">
                        <select id="IsFlush" name="IsFlush">
                            <option value="0" selected="selected">否</option>
                            <option value="">全部</option>
                            <option value="1">是</option>
                        </select></td>
                    <td class="DialogTdTitle">开票(发起)时间从</td>
                    <td class="DialogTdContent">
                        <input id="BillStartDate" class="Wdate" onclick="WdatePicker()" name="BillStartDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="BillEndDate" class="Wdate" onclick="WdatePicker()" name="BillEndDate" runat="server" /></td>

                </tr>
                <tr>
                    <td class="DialogTdTitle">开票人</td>
                    <td class="DialogTdContent">
                        <input id="BillUser" name="BillUser" />
                    </td>
                    <td class="DialogTdTitle">发票号码</td>
                    <td class="DialogTdContent">
                        <input id="InvoiceNo" name="InvoiceNo" /></td>
                    <td class="DialogTdTitle">发票代码</td>
                    <td class="DialogTdContent">
                        <input id="InvoiceCode" name="InvoiceCode" /></td>

                </tr>
                <tr>
                    <td class="DialogTdTitle">红冲(发起)时间从</td>
                    <td class="DialogTdContent">
                        <input id="FlushStartDate" class="Wdate" onclick="WdatePicker()" name="FlushStartDate" runat="server" /></td>
                    <td class="DialogTdTitle">到</td>
                    <td class="DialogTdContent">
                        <input id="FlushEndDate" class="Wdate" onclick="WdatePicker()" name="FlushEndDate" runat="server" /></td>
                    <td class="DialogTdTitle">红冲操作人</td>
                    <td class="DialogTdContent">
                        <input id="FlushUser" name="FlushUser" />
                    </td>
                </tr>
                <tr>
                    <td class="DialogTdTitle">客户名称</td>
                    <td class="DialogTdContent">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">查询</a>

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

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }
            var Headcolumn = [
                [
                    { field: 'CustName', title: '客户名称', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'InvoiceNo', title: '发票号码', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var urlarr = row.PdfUrl.split(",");
                            var noarr = value.split(",");
                            var strarr = new Array();
                            for (var i = 0; i < noarr.length; i++) {
                                var str = "<a class=\"HrefStyle\"  href='" + urlarr[i] + "'>" + noarr[i] + "</a>";
                                strarr.push(str);
                            }

                            return strarr.join(",");
                        }
                    },
                    { field: 'InvoiceCode', title: '发票代码', align: 'center', sortable: true, width: 100 },
                    { field: 'BillAmount', title: '发票金额', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'BillingTime', title: '开票发起时间', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'BillUser', title: '开票人', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'CompleteTime', title: '开票完成时间', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd");
                            return str;
                        }
                    },
                    {
                        field: 'FlushState', title: '红冲状态', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = "";
                            switch (row.FlushState) {
                                case "0":
                                    str = "未红冲";
                                    break;
                                case "1":
                                    str = "已发送";
                                    break;
                                case "2":
                                    str = "已红冲";
                                    break;
                                case "3":
                                    str = "红冲失败";
                                    break;
                                default:
                            }
                            return str;
                        }
                    },
                    {
                        field: 'FlushAmount', title: '红冲金额', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = "";
                            if (row.FlushState == "2") {
                                return "-" + row.BillAmount;
                            }
                            return str;
                        }
                    },

                    {
                        field: 'FlushTime', title: '红冲发起时间', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'FlushUser', title: '红冲操作人', align: 'center', sortable: true, width: 100 },
                    {
                        field: 'FlushCompleteTime', title: '红冲完成时间', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var str = formatDate(value, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    {
                        field: 'FlushNo', title: '红冲发票号码', align: 'center', sortable: true, width: 100, formatter: function (value, row, index) {
                            var urlarr = row.FlushPdfUrl.split(",");
                            var noarr = value.split(",");
                            var strarr = new Array();
                            for (var i = 0; i < noarr.length; i++) {
                                var str = "<a class=\"HrefStyle\"  href='" + urlarr[i] + "'>" + noarr[i] + "</a>";
                                strarr.push(str);
                            }

                            return strarr.join(",");
                        }
                    },
                    { field: 'FlushCode', title: '红冲发票代码', align: 'center', sortable: true, width: 100 },
                    { field: 'PosNo', title: '票易通交易号', align: 'center', sortable: true, width: 100 },
                    { field: 'FlushErrMsg', title: '备注', align: 'center', sortable: true, width: 100 }

                ]
            ];

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
                    text: '红冲发票',
                    iconCls: 'icon-remove',
                    handler: function () {
                        var ob = $("#TableContainer").datagrid('getSelected');
                        if (ob != null) {
                            if (ob.InvoiceNo == "") {
                                HDialog.Info("票据开具未成功,无法红冲");
                                return;
                            }
                            if (ob.FlushState == "1") {
                                HDialog.Info("票据已发起红冲");
                                return;
                            }
                            if (ob.FlushState == "2") {
                                HDialog.Info("票据已红冲");
                                return;
                            }
                            $.messager.confirm('提示', '是否确认红冲?', function (r) {
                                if (r) {
                                    $.tool.DataPost("EInvoiceManage", "EinvoiceFlush", "InvoiceID=" + ob.InvoiceID, function Init() {
                                    },
                                        function callback(_Data) {
                                            var data = JSON.parse(_Data);
                                            if (data.state == "true") {
                                                HDialog.Info(data.msg);
                                                LoadData();
                                            }
                                            else {
                                                HDialog.Info(data.msg);
                                            }
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            });

                        }
                        else {
                            HDialog.Info("请选择发票");
                        }
                    }
                }, '-',
                {
                    text: '查询发票',
                    iconCls: 'icon-print',
                    handler: function () {
                        var ob = $("#TableContainer").datagrid('getSelected');
                        console.log(ob);
                        if (ob != null) {
                            if (ob.InvoiceNo == "") {
                                HDialog.Info("票据开具未成功");
                                return;
                            }
                            var urlarr = ob.PdfUrl.split(",")
                            window.open(urlarr[0]);
                        }
                        else {
                            HDialog.Info("请选择发票");
                        }

                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {

                        window.location.href = "../ChargesNew/EInvoiceSearchExcel.aspx";

                    }
                }
            ];





            //加载数据
            function LoadData() {
                //加载已经统计了的数据
                $("#TableContainer").datagrid({
                    //url: null,
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: 30,
                    pageList: [30, 50, 80],
                    columns: Headcolumn,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        console.log(data);
                        $("#SearchDlg").dialog("close");

                    },
                    onClickRow: function (rowindex, rowdata) {
                        //ViewDetail("明细", rowdata.Id);
                    },
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("EInvoiceManage", "EinvoiceList", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }
            //展示进度
            LoadData();

        </script>
    </form>
</body>
</html>
