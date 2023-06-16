<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeChatCorpCostItemInfo.aspx.cs" Inherits="M_Main.ChargesNew.WeChatCorpCostItemInfo" %>

<!DOCTYPE html>
<html>
<head>
    <title>微信费用项目详情</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="TypeIds" name="TypeIds" runat="server" />
        <input type="hidden" id="CostItemCodes" name="CostItemCodes" runat="server" />
        <input type="hidden" id="CostItemCommIDs" name="CostItemCommIDs" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">费用项目
                </td>
                <td class="DialogTdContent" colspan="7">
                    <input name="CostItemNames" type="text" id="CostItemNames" onclick="SelCostItemInfo()" style="width: 90%; height: 100px;"
                        runat="server" /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">缴费周期</td>
                <td class="DialogTdContent" colspan="7">
                    <select id="PaymentCycle" name="PaymentCycle" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option value="0">月</option>
                        <option value="1">季度</option>
                        <option value="2">半年</option>
                        <option value="3">年度</option>
                    </select>
                </td>

            </tr>
            <tr>
                <td class="DialogTdTitle">是否支持预存</td>
                <td class="DialogTdContent">
                    <select id="PreStorage" name="PreStorage" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option value="0">否</option>
                        <option value="1">是</option>
                       
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 2px;"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    <input id="Submit1" type="submit" onserverclick="btnSave_ServerClick" value="保存" runat="server" style="display: none;" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            function SelCostItemInfo() {
                HDialog.Open(700, 400, '../ChargesNew/CorpCostWeChat.aspx?IsCheck=1&CostItemCommIDs=' + $("CostItemCommIDs").val(), "选择费用项目", false, function callback(_Data) {
                    var arrRet = _Data.split('|');
                    $("#CostItemNames").val(arrRet[1]);
                    $("#CostItemCodes").val(arrRet[0]);
                });
            }
            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
            $("#BtnSave").click(function () {
                if ($("#CostItemCodes").val() == "") {
                    HDialog.Info("请选择费用项目!");
                    return;
                }
                $("#Submit1").click();
            });
        </script>
    </form>
</body>
</html>

