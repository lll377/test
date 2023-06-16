<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseDetailExcel.aspx.cs" Inherits="M_Main.ImportExcel.ExcelDownload.PurchaseDetailExcel" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>GenerateWaivFeesExcel</title>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/Dialog.js"></script>
    <script type="text/javascript" src="../../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../../jscript/format.js"></script>
    <script type="text/javascript" src="../../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>

    <link type="text/css" rel="stylesheet" href="../../css/framesearch.css" />
    <link type="text/css" rel="stylesheet" href="../../css/button.css" />
    <link type="text/css" rel="stylesheet" href="../../css/framesearch.css" />
    <link type="text/css" rel="stylesheet" href="../../css/framesearch_old.css" />
    <link type="text/css" rel="stylesheet" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link type="text/css" rel="stylesheet" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
</head>
<body>
    <form id="GeneratePurchaseDetailExcel" method="post" runat="server">
        <table class="DialogTable" id="Table1">
            <tr>
                <td class="TdTitle" colspan="2"></td>
            </tr>

            <tr>
                <td class="TdTitle">物资名称</td>
                <td class="TdContentSearch">
                    <input name="Name" type="text" id="Name" runat="server" />
                </td>
                <td class="TdTitle">物资编号</td>
                <td class="TdContentSearch">
                    <input name="Num" type="text" id="Num" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">物资属性:</td>
                <td class="TdContent">
                    <select runat="server" id="SelProperty" name="SelProperty">
                        <option value="1" selected="selected">--请选择--</option>
                        <option value="材料">材料</option>
                        <option value="低值易耗品">低值易耗品</option>
                        <option value="固定资产">固定资产</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle" colspan="2"></td>
            </tr>
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnPurchaseDetail" type="button" value="生成模板文件" name="btnCreExcel" runat="server">
                        &nbsp;
                        <input class="button" id="btnReturn" type="button" value="返回" name="btnReturn" runat="server">
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
<script type="text/javascript">

    $("#btnPurchaseDetail").click(function ()
    {
        if ($("#GeneratePurchaseDetailExcel").form('validate'))
        {
            window.location.href = '../ExcelDownload/DownloadPurchaseDetailExcel.aspx?Name=' + $("#Name").val() + '&Num=' + $("#Num").val() + '&Property=' + $("#SelProperty").val();
        }
    });
    $('#btnReturn').click(function () {
        HDialog.Close();
    });

</script>
