<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobilePayAccountLogDetail.aspx.cs" Inherits="M_Main.ChargesNew.MobilePayAccountLogDetail" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>对账查询</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">对账时间</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="AccountDateBg" name="AccountDateBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 90%" />
                    </td>
                    <td class="TdTitle">-</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="AccountDateEnd" name="AccountDateEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 90%" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">缴费时间</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="PaySuccessDateBg" name="PaySuccessDateBg" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 90%" />
                    </td>
                    <td class="TdTitle">-</td>
                    <td class="TdContent">
                        <input class="Control_IteminputNoStyle" id="PaySuccessDateEnd" name="PaySuccessDateEnd" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" readonly="readonly" style="border: 1px #cccccc solid; width: 90%" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%;" id="TableContainer">
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <input type="hidden" id="LogId" name="LogId" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h);
            }
            InitTableHeight();

            //导出
            function ExcelPrint() {
                var url = '../ChargesNew/MobilePayAccountExcel.aspx?ExcelName=对账日志导出' + '&random=' + Math.random() + GetParamet();
                window.open(url);
            }

            function GetParamet() {
                var str = "&PaySuccessDateBg=" + $("#PaySuccessDateBg").val();
                str += "&PaySuccessDateEnd=" + $("#PaySuccessDateEnd").val();
                str += "&AccountDateBg=" + $("#AccountDateBg").val();
                str += "&AccountDateEnd=" + $("#AccountDateEnd").val();
                str += "&LogId=" + $("#LogId").val();
                return encodeURI(str);
            }

            var column = [[
                { field: 'CustName', title: '客户名称', width: 70, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 230, align: 'left', sortable: true },
                { field: 'BusinessTradeNo', title: '业务订单号', width: 180, align: 'left', sortable: true },
                { field: 'BillsAmount', title: '缴费金额', width: 70, align: 'left', sortable: true },
                { field: 'AccountStatusName', title: '对账结果', width: 50, align: 'left', sortable: true },
                { field: 'PaySuccessDate', title: '订单生成时间', width: 150, align: 'left', sortable: true },
                { field: 'PayTime', title: '支付完成时间', width: 150, align: 'left', sortable: true },
                //{ field: 'BillsSign', title: '票据号码', width: 120, align: 'left', sortable: true },
                { field: 'SuccessName', title: '下账状态', width: 50, align: 'left', sortable: true },
                //{ field: 'outTradeNo', title: '商户订单号', width: 150, align: 'left', sortable: true },
                { field: 'bankbusinessTradeNo', title: '业务订单号', width: 150, align: 'left', sortable: true },
                { field: 'totalFee', title: '金额', width: 150, align: 'left', sortable: true },
                //{ field: 'timeStart', title: '订单生成时间', width: 200, align: 'left', sortable: true },
                { field: 'timeEnd', title: '支付完成时间', width: 200, align: 'left', sortable: true },
                { field: 'payTypeName', title: '交易类型', width: 200, align: 'left', sortable: true },
                //{ field: 'orderStatusName', title: '支付订单状态', width: 200, align: 'left', sortable: true },
                { field: 'UserName', title: '操作人', width: 200, align: 'left', sortable: true },
                { field: 'AccountDate', title: '对账时间', width: 200, align: 'left', sortable: true }//,
                //{ field: 'errorMsg', title: '错误信息', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: 'EXCEL导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ExcelPrint();
                    }
                }
            ];
            
            function LoadList() {
                $("#LogId").val(GetQueryString('LogId'));
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    rownumbers: true,
                    sortOrder: "asc",
                    border: false,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("PayAccount", "GetAccountLogDetail", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>