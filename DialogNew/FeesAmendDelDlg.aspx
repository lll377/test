<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesAmendDelDlg.aspx.cs" Inherits="M_Main.DialogNew.FeesAmendDelDlg" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>费用删除</title>
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
    <script src="../jscript/Cache.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body>
    <form id="FeesAmendDelDlg" method="post" runat="server">
        <input id="Recovery" type="hidden" size="1" name="Recovery" runat="server" />
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td class="TdTitle">
                    <input id="FeesID" type="hidden" size="1" name="FeesID"
                        runat="server" />
                    <input id="CommIDs" type="hidden" size="1" name="CommIDs"
                        runat="server" />
                    <input id="FeesIDs" type="hidden" size="1" name="FeesIDs"
                        runat="server" /><input id="IsPast" type="hidden" size="1" name="IsPast"
                            runat="server" />删除原因</td>
                <td class="TdContent">
                    <textarea id="ChangeMemo" class="easyui-validatebox" style="width: 90%; height: 112px" name="ChangeMemo" rows="7" wrap="soft"
                        cols="61" data-options="required:true" runat="server"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <input class="button" id="btnSave" type="button" value="保存" name="btnSave"
                        runat="server" />&nbsp;&nbsp;&nbsp; 
                    <input class="button" type="button" id="btnHidSave" style="display: none;" name="btnHidSave" onserverclick="btnSave_ServerClick" runat="server" />
                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" runat="server" /></td>
            </tr>
        </table>
        <script type="text/javascript">
            var FeesIDs = Cache.GetData("FeesIDs", FeesIDs);
            if (FeesIDs != '') {
                $('#FeesIDs').val(FeesIDs);
            }
            $('#btnReturn').click(function () {
                HDialog.Close();
            });
            //保存
            $('#btnSave').click(function () {
                if ($('#ChangeMemo').val() == "") {
                    return false;
                } else {
                    $('#btnHidSave').click();
                }
            });
        </script>
    </form>
</body>
</html>
