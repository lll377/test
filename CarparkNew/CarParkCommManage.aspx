<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarParkCommManage.aspx.cs" Inherits="M_Main.CarparkNew.CarParkCommManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CarParkCommManage</title>
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
            <input id="ID" type="hidden" name="ID" runat="server" />
        <table class="DialogTable">

          
            <tr>
                <td class="TdTitle">是否关闭</td>
                <td class="TdContentSearch">

                       <select id="IsDelete" name="IsDelete" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>

                </td>
            </tr>
         
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr style="text-align: center;">
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

        $.tool.DataPostChk('frmForm', 'Carpark', "carparkcmmconfig"+cmd, $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "true") {
                    //close("true");
                    parent.layer.alert('保存成功');
                    HDialog.Close("")
                }
            },
            function completeCallback() {
            },
            function errorCallback() {

            });
    });
    $("#BtnReturn").click(function () {
        HDialog.Close("false");
    });

</script>
