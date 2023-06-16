<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesPaymentAudit.aspx.cs" Inherits="M_Main.NoticesNew.FeesPaymentAudit" %>


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
        <input id="AuditType" name="AuditType" type="hidden" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">管理项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CommName" maxlength="50" name="CommName" searcher="SelComm" data-options="editable:false" runat="server" /><input id="CommID" style="width: 16px; height: 22px" type="hidden" size="1" name="CommID"
                            runat="server"><input id="hiCommName" style="width: 16px; height: 22px" type="hidden" size="1" name="hiCommName"
                                runat="server"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContentSearch">
                        <input id="EditBeginDate" class="Wdate"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" type="text" name="EditBeginDate"
                            runat="server"></td>
                    <td class="TdTitle">截止时间</td>
                    <td class="TdContentSearch">
                        <input id="EditEndDate" class="Wdate"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" type="text" name="EditEndDate"
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


            function SelComm() {

                $('#CommName').searchbox("setValue", '');
                $('#CommID').val('');


                var conent = "../DialogNew/CommDlg.aspx";
                var w = 800;
                var h = 600;

                HDialog.Open(w, h, conent, '项目选择', false, function callback(_Data) {


                    var data = JSON.parse(_Data);

                    $('#CommName').searchbox("setValue", data.text);
                    $('#CommID').val(data.attributes.InPopedom);

                });

            }


            var column = [[
                { field: 'CommName', title: '管理项目', width: 90, align: 'left', sortable: true },
                {
                    field: 'PayDate', title: '申请时间', width: 170, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.PayID + "'," + row.CommID + ");\">" + formatDate(row.PayDate, "yyyy-MM-dd HH:mm:ss") + "</a>";
                        return str;
                    }
                },
                { field: 'PayUserName', title: '交款人', width: 80, align: 'left', sortable: true },
                {
                    field: 'BeginDate', title: '开始时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.BeginDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                {
                    field: 'EndDate', title: '结束时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.EndDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'PayAmount', title: '总金额', width: 100, align: 'left', sortable: true },
                { field: 'IsGatherName', title: '是否收款', width: 80, align: 'left', sortable: true },
                {
                    field: 'GatherDate', title: '收款时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.GatherDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'GatherUserName', title: '财务收款人', width: 80, align: 'left', sortable: true },

                { field: 'IsAccountName', title: '是否记账', width: 80, align: 'left', sortable: true },
                {
                    field: 'AccountDate', title: '记账时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'AccountUserName', title: '财务记账人', width: 80, align: 'left', sortable: true },

                { field: 'PayMemo', title: '备注', width: 200, align: 'left', sortable: true }


            ]];


            var toolbar = [
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {



                        var row = $('#TableContainer').datagrid('getSelected');
                        if (row == "") { HDialog.Info('请选择要删除的数据!'); }
                        else {
                            HDialog.Prompt('确认删除交款申请', function () {

                          

                                var iIsAccount = row.IsAccount;
                                var iIsGather = row.IsGather;

                                var SelData = JSON.stringify(row);
                                $('#AllData').val(SelData);

                                var isDelete = true;

                                if (iIsAccount == "1" || iIsGather == "1") {
                                    isDelete = false;

                                }
                                else {
                                    isDelete = true;
                                }

                                if (isDelete) {
                                    $('#CommID').val(row.CommID);
                                    $.tool.DataPostChk('frmForm', 'FeesPayment', 'FeesPaymentDelete', $('#frmForm').serialize() + "&PayID=" + row.PayID + "&iCommID=" + row.CommID,
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data.split('|');

                                            if (r[0] == "true") {

                                            }
                                            HDialog.Info(r[1]);
                                            LoadList();
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                                else {
                                    HDialog.Info('交款已审核，禁止删除!');

                                }




                            });
                        }
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = "../NoticesNew/FeesPaymentAuditToExcel.aspx";
                    }
                }
            ];




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

                        param = $.JQForm.GetParam("FeesPayment", "FeesPaymentList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();


            function ViewDetail(PayID,CommID) {

                var w = $(window).width();
                var h = $(window).height() + 100;

                var title = '收款审核';
                if ($('#AuditType').val() == "1") {
                    title = '记账审核';
                }

                HDialog.Open(w, h, '../NoticesNew/FeesPaymentAuditManage.aspx?AuditType=' + $('#AuditType').val() + '&PayID=' + PayID + '&CommID=' + CommID, title, false, function callback(_Data) {
                    LoadList();
                });
            }

        </script>
    </form>
</body>
</html>

