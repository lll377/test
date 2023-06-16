<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAuditingBCreBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewAuditingBCreBrowse" %>


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
    <script type="text/javascript">
        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }
		//-->
    </script>
</head>
<body onload="Win_OnLoad()">
    <form id="frmForm" runat="server">
        <input id="HiCommID" name="HiCommID" type="hidden" runat="server" /> 
        <input id="HiConnStrComm" name="HiConnStrComm" type="hidden" runat="server" /> 
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="AuditType" size="1" type="hidden" name="AuditType" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server">
        <input id="print" name="print" type="button" runat="server" onserverclick="print_ServerClick" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">入账时间从</td>
                    <td class="TdContent">
                        <input class="Wdate" id="StartBCreDate"
                            onclick="WdatePicker()" name="StartBCreDate" runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EndBCreDate"
                            onclick="WdatePicker()" name="EndBCreDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">入账类别</td>
                    <td class="TdContent">
                        <select name="AuditTypeName" runat="server" id="AuditTypeName">
                            <option selected></option>
                            <option value="批量入账">批量入账</option>
                            <option value="单户入账">单户入账</option>
                            <option value="零星入账">零星入账</option>
                            <option value="合同入账">合同入账</option>
                        </select></td>
                    <td class="TdTitle">入账范围</td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" id="BCreRange" name="BCreRange" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用名称</td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" id="CostName" name="CostName" runat="server"></td>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContent">
                        <select id="IsAuditing" name="IsAuditing" runat="server">
                            <option selected></option>
                            <option value="0">未审核</option>
                            <option value="1">已通过</option>
                            <option value="2">未通过</option>
                        </select></td>
                </tr>


                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
       
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#print').hide();
            }
            InitFunction();

            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }


            function InitFrom() {
                var com = getQueryVariable("FromIndex");
                if (com != "") {
                    $("#FromIndex").val(com);
                }
            }
            InitFrom();


            var column = [[

                { field: 'AuditTypeName', title: '入账类别', width: 100, align: 'left', sortable: true },
                { field: 'BCreUserName', title: '入账人', width: 100, align: 'left', sortable: true },
                {
                    field: 'BCreDate', title: '入账时间', width: 180, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"viewDetail('费用审核'," + row.AuditID + ");\">" + row.BCreDate + "</a>";
                        return str;
                    }
                },
                { field: 'BCreRange', title: '入账范围', width: 100, align: 'left', sortable: true },
                { field: 'CreYearMonth1', title: '入账开始年月', width: 100, align: 'left', sortable: true },
                { field: 'CreYearMonth2', title: '入账结束年月', width: 100, align: 'left', sortable: true },

                { field: 'NOAmount', title: '应收总金额', width: 100, align: 'left', sortable: true },
                { field: 'YESAmount', title: '入账总金额', width: 100, align: 'left', sortable: true },

                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },

                { field: 'FeesRoleNamesMemo', title: '审核流程', width: 260, align: 'left', sortable: true },
                {
                    field: 'IsAuditing', title: '审核状态', width: 130, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var values = "";
                        var IsAudit = row.IsAuditing;


                        if (IsAudit == 1) {
                            values = "<font color='Green'>已通过</font>";
                        }
                        else if (IsAudit == 2) {
                            values = "<font color='red'>未通过</font>";
                        }
                        else {
                            values = "<font color='Blue'>未审核</font>";
                        }


                        return values;
                    }
                }


            ]];

            function viewDetail(title, auditid) {
                var conent = '../ChargesNew/NewAuditingBCreDetailBrowse.aspx?FromIndex=' + $("#FromIndex").val() + '&AuditID=' + auditid + "&StartBCreDate=" + $('#StartBCreDate').val() + "&EndBCreDate=" + $('#EndBCreDate').val();
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, title, true, function callback(_Data) {
                    LoadList();
                });
            }
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }
                , '-',
                {
                    text: '打印',
                    iconCls: 'icon-print',
                    handler: function () {

                        $('#print').click();
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
                        param = $.JQForm.GetParam("AuditManage", "AuditingFeeList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {


                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
