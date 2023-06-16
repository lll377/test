<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesPaymentManage.aspx.cs" Inherits="M_Main.NoticesNew.NewFeesPaymentManage" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate" class="Wdate"
                            onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditBeginDate"
                            runat="server"></td>
                    <td class="TdTitle">截止时间</td>
                    <td class="TdContentSearch">
                        <input id="EditEndDate" class="Wdate"
                            onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditEndDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">记
							账</td>
                    <td class="TdContentSearch">
                        <select id="IsAccount" name="IsAccount" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收
							款</td>
                    <td class="TdContentSearch">
                        <select id="IsGather" name="IsGather" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column = [[
                     {
                         field: 'PayDate', title: '申请时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                             var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('交款明细','" + row.PayID + "');\">" + formatDate(row.PayDate, "yyyy-MM-dd HH:mm:ss") + "</a>";
                            return str;
                        }
                    },
                    { field: 'PayUserName', title: '交款人', width: 100, align: 'left', sortable: true },
                    {
                        field: 'BeginDate', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.BeginDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    {
                        field: 'EndDate', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.EndDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'PayAmount', title: '总金额', width: 100, align: 'left', sortable: true },
                    { field: 'IsGatherName', title: '是否收款', width: 100, align: 'left', sortable: true },
                    {
                        field: 'GatherDate', title: '收款时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.GatherDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'IsAccountName', title: '是否记账', width: 100, align: 'left', sortable: true },
                    {
                        field: 'AccountDate', title: '记账时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                            var str = formatDate(row.AccountDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                    { field: 'PayMemo', title: '备注', width: 100, align: 'left', sortable: true }
            ]];


            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-'
                , {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ToExcel();
                    }
                }
            ];

            function ToExcel() {
                window.location.href = "../NoticesNew/NewFeesPaymentManageCre.aspx";
            }

            function ViewDetail(title, ReceID, type) {
                var w = $(window).width();
                var h = $(window).height();
            }

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
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesPayment", "FeesPaymentSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();

            function ViewDetail(title, PayID) {
                var w = $(window).width();
                var h = $(window).height()+100;
                HDialog.Open(w, h, '../NoticesNew/FeesPaymentDetail.aspx?PayID=' + PayID, '交款明细', false, function callback(_Data) {
                    LoadList();
                });
            }

        </script>
    </form>
</body>
</html>


