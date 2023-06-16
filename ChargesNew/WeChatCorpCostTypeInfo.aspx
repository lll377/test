<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeChatCorpCostTypeInfo.aspx.cs" Inherits="M_Main.ChargesNew.WeChatCorpCostTypeInfo" %>
<!DOCTYPE html>
<html>
<head>
    <title>微信费用类型详情</title>
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
        <input type="hidden" id="OpType" name="OpType" runat="server"/>
        <input type="hidden" id="Id" name="Id" runat="server" />
        <input type="hidden" id="CommIDs" name="CommIDs" runat="server" />
    <table class="DialogTable">
        <tr>
            <td class="DialogTdTitle">类型名称
            </td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox" data-options="required:true"
                    id="Name" name="Name" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">项目
            </td>
            <td class="DialogTdContent" colspan="7">
                <input name="CommNames" type="text" id="CommNames" onclick="SelCommInfo()" style="width: 90%;height:100px;" required="required" readonly="readonly"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 2px;"></td></tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="button" class="button" value="保存" id="BtnSave" />
                 <input id="Submit1" type="submit" onserverclick="btnSave_ServerClick" value="保存" runat="server" style="display: none;" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>
        <script type="text/javascript">
            function SelCommInfo() {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }
            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
            $("#BtnSave").click(function () {
                if ($("#Name").val() == "") {
                    HDialog.Info("请填写名称!");
                    return;
                }
                 $("#Submit1").click();
            });
        </script>
    </form>
</body>
</html>

