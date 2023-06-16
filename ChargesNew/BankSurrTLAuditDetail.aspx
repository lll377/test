<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankSurrTLAuditDetail.aspx.cs" Inherits="M_Main.ChargesNew.BankSurrTLAuditDetail" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="frmForm" runat="server">
                 <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server">
        <input id="SurrID" type="hidden" name="SurrID" runat="server">
        <input id="SurrState" type="hidden" name="SurrState" runat="server">
        <input id="BackFileName" type="hidden" name="BackFileName" runat="server">
        <input id="BankID" type="hidden" name="BankID" runat="server">
        <input id="WriteDir" type="hidden" name="WriteDir" runat="server">
        <input id="BackPerRowFormat" type="hidden" name="BackPerRowFormat" runat="server">
        <input id="hiFileType" type="hidden" name="hiFileType" runat="server">
        <input id="hiFirstName" type="hidden" name="hiFirstName" runat="server">
        <input id="TrxID" type="hidden" name="TrxID" runat="server">
        <input id="OrderNo" name="OrderNo" type="hidden" runat="server">
        <input id="CorpID" type="hidden" name="CorpID" runat="server">
        <input id="CommID" type="hidden" name="CommID" runat="server">
        <input id="BankName" name="BankName" type="hidden" runat="server">
        <table class="DialogTable">
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">托收审核</td>
            </tr>
            <tr>
                <td class="TdTitle">开始时间</td>
                <td class="TdContent">
                    <asp:Label ID="BeginDate" runat="server"></asp:Label></td>
                <td class="TdTitle">完成时间</td>
                <td class="TdContent">
                    <asp:Label ID="ChargeDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">应处理数量</td>
                <td class="TdContent">
                    <asp:Label ID="AllCounts1" runat="server"></asp:Label></td>
                <td class="TdTitle">应处理金额</td>
                <td class="TdContent">
                    <asp:Label ID="AllAmount1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">已处理数量</td>
                <td class="TdContent">
                    <asp:Label ID="AllCounts2" runat="server"></asp:Label></td>
                <td class="TdTitle">已处理金额</td>
                <td class="TdContent">
                    <asp:Label ID="AllAmount2" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">代收银行名称</td>
                <td class="TdContent">
                    <asp:Label ID="lbBankName" runat="server"></asp:Label></td>
                <td class="TdTitle">手 续 费</td>
                <td class="TdContent">
                    <asp:Label ID="HandlingCharge" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">收款方式</td>
                <td class="TdContentSearch">
                    <select id="ChargeMode" name="ChargeMode" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">收据样式</td>
                <td class="TdContentSearch">
                    <select id="UseRepID" name="UseRepID" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">状态</td>
                <td class="TdContent">
                    <asp:Label ID="SurrStateName" runat="server"></asp:Label></td>
                <td class="TdTitle">操作员</td>
                <td class="TdContent">
                    <asp:Label ID="UserName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">托收状态</td>
                <td class="TdContent">
                    <asp:Label ID="TrxStateName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input class="button" id="btnSave" type="button" value="确定托收" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnCancel" type="button" value="取消托收" name="btnCancel" runat="server">&nbsp;
                    <input class="button" id="btnReturn" type="button" value="返回" name="btnReturn" runat="server"></td>
            </tr>
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">应代收费用(按客户)</td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="TableContainer"></div>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 280;
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            $("#btnReturn").click(function () {
                HDialog.Close();
            })

            $("#btnSave").click(function () {
                if ($("#lbBankName").text() == "银联在线代扣") {
                    $.tool.DataPostChk('frmForm', 'UnionPay', "UnionPayAudit", $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info('审核成功');
                                HDialog.Close(1);
                            }
                            else {
                                HDialog.Info('审核失败');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {

                        });
                }
                else {
                    $.tool.DataPostChk('frmForm', 'BankSurrTLAudit', "SaveAuditDetail", $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info('保存托收成功');
                                HDialog.Close(1);
                            }
                            else {
                                HDialog.Info('保存托收失败');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {

                        });
                }

            })

            $("#btnCancel").click(function () {
                $.tool.DataPostChk('frmForm', 'BankSurrTLAudit', "CancelAuditDetail", $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('取消托收成功');
                            HDialog.Close(1);
                        }
                        else {
                            HDialog.Info('取消托收失败');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            })

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
                    text: '详情',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != undefined) {
                            var w = $(window).width();
                            var h = $(window).height();
                            HDialog.Open(w, h, '../ChargesNew/BankRecordDetailBrowse.aspx?IID=' + row.IID + "&SurrID=" + row.SurrID + "&CustID=" + row.CustID, "银行代收", false, function callback(_Data) {
                                if (_Data == 1) {
                                    LoadList();
                                }
                            });
                        }
                    }
                }
            ];

            var column = [[
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'BankAccountOmit', title: '银行账号(略)', width: 200, align: 'left', sortable: true },
                { field: 'ActAllDueAmount', title: '代收金额小计', width: 200, align: 'left', sortable: true },
                { field: 'ActPaidAmount', title: '已代收金额', width: 200, align: 'left', sortable: true },
                { field: 'IsSuccName', title: '是否成功', width: 200, align: 'left', sortable: true },
                { field: 'ErrMsg', title: '银行返回信息', width: 200, align: 'left', sortable: true }
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
                    rownumbers: true,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("BankSurrTLAudit", "DetailSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });

            }
            $.parser.parse("#SearchDlg");
            LoadList();
        </script>
    </form>
</body>
</html>
