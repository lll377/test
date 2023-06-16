<%@ Page Language="c#" CodeBehind="AdvertisingRegionalManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.AdvertisingNew.AdvertisingRegionalManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>AdvertisingRegionalManage</title>
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
    <script language="javascript">
		<!--
    function CheckData() {
        if (AdvertisingRegionalManage.RegionalName.value == "") {
            alert("请输入区域名称,此项不能为空!");
            AdvertisingRegionalManage.RegionalName.focus();
            return false;
        }


        return true;
    }
    //-->
    </script>
</head>
<body>
    <form id="AdvertisingRegionalManage" method="post" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" size="1">
        <input id="RegionalID" type="hidden" name="RegionalID" runat="server" size="1">

        <table class="DialogTable" style="margin-top:20px;">
            <tr>
                <td class="TdTitle">广告位区域</td>
                <td class="TdContent">
                    <input id="RegionalName" type="text" class="easyui-validatebox" data-options="required:true" name="RegionalName" runat="server">
                </td>
                <td class="TdTitle">广告位位置</td>
                <td class="TdContent">
                    <input id="RegionalPosition" type="text" class="easyui-validatebox" data-options="required:true" name="RegionalPosition" runat="server"></td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input id="btnSave" type="button" value="保存" name="btnSave" runat="server" class="button"  onclick="javascript: if (CheckData() == false) return false;">
                    <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>


<script type="text/javascript">


    function CheckData() {
        if ($("#RegionalName").val() == "" || $("#RegionalName").val() == null) {
            HDialog.Info("广告位区域不能为空");
            return false;
        }
        if ($("#RegionalPosition").val() == "" || $("#RegionalPosition").val() == null) {
            HDialog.Info("广告位位置不能为空");
            return false;
        }
    }
    $("#BtnReturn").click(function () {
        close("false");
    });

    function close(callparm) {
        HDialog.Close(callparm);
    }
</script>

