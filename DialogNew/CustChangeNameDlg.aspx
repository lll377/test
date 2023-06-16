<%@ Page Language="c#" CodeBehind="CustChangeNameDlg.aspx.cs" AutoEventWireup="false" Inherits="M_Main.dialogNew.CustChangeNameDlg" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>CustChangeNameDlg</title>
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
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

</head>
<body>
    <form id="frmForm" method="post" runat="server">
        <input type="hidden" id="CustID" value="" name="CustID" runat="server" />
        <input type="hidden" id="CustName" value="" name="CustName" runat="server" />
        <input class="button" id="bSave" type="button" value="����" style="display: none;" name="bSave" runat="server">
        <table class="DialogTable" id="Table1" style="line-height: 25px;">
            <tr>
                <td class="TdTitle" align="right">�ͻ�����</td>
                <td class="TdContent">
                    <input type="text" id="lbCustName" value="" disabled name="lbCustName" runat="server" style="width: 270px;" /></td>
            </tr>
            <tr>
                <td class="TdTitle" align="right">�µĿͻ�����</td>
                <td class="TdContent">
                    <input id="NewCustName" type="text" class="easyui-validatebox" data-options="required:true" style="width: 270px;" name="NewCustName" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle" align="right">����˵��</td>
                <td class="TdContentSearch">
                    <textarea id="ChangeMemo" class="easyui-validatebox" data-options="required:true" name="ChangeMemo" rows="4" cols="38" runat="server"></textarea></td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="2">
                    <input type="button" class="button" value="����" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="�ر�" id="BtnReturn" />
                </td>
            </tr>
            <tr>
                <td colspan="2"><font color="Red">��ʾ��������������ҵ������д������������ͬһ��ͥ��Ա�ڱ�������ɿ����̱��Ϊҵ��������Aҵ�����ΪBҵ������ͨ�������۹�������ת�ð���ģ�������</font></td>
            </tr>
        </table>
    </form>
</body>
</html>



<script type="text/javascript">
    $("#BtnSave").click(function () {
        if ($("#NewCustName").val() == "") {
            HDialog.Info("����д�µĿͻ�����");
            return;
        }
        if ($("#ChangeMemo").val() == "") {
            HDialog.Info("����д����˵��");
            return;
        } else {
            document.getElementById('bSave').click();
            //var NewCustName = $("#NewCustName").val();
            //close(NewCustName);
        }
       
    });

    $("#BtnReturn").click(function () {
        close("");
    });

    function close(callparm) {
        HDialog.Close(callparm);
    }
</script>

