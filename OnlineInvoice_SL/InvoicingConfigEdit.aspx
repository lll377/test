<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoicingConfigEdit.aspx.cs" Inherits="M_Main.OnlineInvoice_SL.InvoicingConfigEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开具发票</title>
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
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">
        <input id="InvoicingConfigId" type="hidden" name="InvoicingConfigId" runat="server" />
        <input id="InvoicingConfigInfo" type="hidden" name="InvoicingConfigInfo" runat="server" />
        
        <table class="DialogTable" id="DialogTable">
            <tr class="seller-info">
                <td class="TdTitle">收款人</td>
                <td class="TdContent">
                    <input id="Payee" type="text" class="easyui-validatebox" name="TaxControlTypeName" />
                </td>
            </tr>
            <tr class="seller-info">
                <td class="TdTitle">开票人</td>
                <td class="TdContent">
                    <input id="Invoicer" type="text" class="easyui-validatebox" name="TaxControlTypeName" />
                </td>
            </tr>
            <tr class="seller-info">
                <td class="TdTitle">复核人</td>
                <td class="TdContent">
                    <input id="Reviewer" type="text" class="easyui-validatebox" name="TaxControlTypeName" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-top: 10px; text-align: center;">
                    <input class="button" id="btnSave" type="button" value="保存" name="btnSave" onclick="Save()" runat="server">
                </td>
            </tr>
        </table>
    </form>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            LoadData();
        });

        //加载数据
        function LoadData() {
            $.tool.DataPost('InvoicingConfig', 'GetModel', "InvoicingConfigId=" + $("#InvoicingConfigId").val(),
                function Init() { },
                function callback(_Data) {
                    $("#InvoicingConfigInfo").val(_Data);

                    var obj = JSON.parse(_Data);
                    $("#InvoicingConfigId").val(obj.Id);
                    $("#Payee").val(obj.Payee);
                    $("#Invoicer").val(obj.Invoicer);
                    $("#Reviewer").val(obj.Reviewer);
                },
                function completeCallback() { },
                function errorCallback() { }
            );
        }

        //保存数据
        function Save() {
            var param = JSON.parse($("#InvoicingConfigInfo").val());
            param.Id = $("#InvoicingConfigId").val();
            param.Payee = $("#Payee").val();
            param.Invoicer = $("#Invoicer").val();
            param.Reviewer = $("#Reviewer").val();
            $("#InvoicingConfigInfo").val(JSON.stringify(param));

            $.tool.DataPost('InvoicingConfig', 'Save', "InvoicingConfigInfo=" + $("#InvoicingConfigInfo").val(),
                function Init() { },
                function callback(_Data) {
                    var obj = _Data.split('|');
                    HDialog.Info(obj[1]);

                    if (obj[0] == "true") {
                        HDialog.Close(_Data);
                    }
                },
                function completeCallback() { },
                function errorCallback() { }
            );
        }
    </script>
</body>
</html>
