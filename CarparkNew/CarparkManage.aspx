<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarparkManage.aspx.cs" Inherits="M_Main.CarparkNew.CarparkManage" %>

<!DOCTYPE html>

<html>
<head>
    <title>CarparkManage</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="CarparkID" type="hidden" name="CarparkID" runat="server" />
        <input id="HidIID" type="hidden" name="HidIID" runat="server"/>
        <table class="DialogTable">

            <tr>
                <td class="TdTitle">车位区域</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="CarparkName" type="text" maxlength="50" name="CarparkName"
                        runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">区域位置</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="CarparkPosition" type="text" maxlength="50" name="CarparkPosition"
                        runat="server"></td>
            </tr>
            <tr id="ccmc" runat="server">
                <td class="TdTitle">车场名称</td>
                <td class="TdContent">
                    <select id="Parking" name="Parking" runat="server">
                        
                    </select></td>
            </tr>
            <tr style="text-align: center;" >
                <td colspan="2">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    $("#BtnSave").click(function () {
        var cmd = $("#hiOPType").val();

        $.tool.DataPostChk('frmForm', 'Carpark', cmd, $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "true") {
                    parent.layer.alert('保存成功');
                    close("true");
                }
            },
            function completeCallback() {
            },
            function errorCallback() {

            });
    });
    $("#BtnReturn").click(function () {
        close("false");
    });

    function close(callparm) {
        HDialog.Close(callparm);
    }
</script>
