<%@ Page Language="c#" CodeBehind="MeterBatchManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.MeterBatchManage" %>

<%@ Register TagPrefix="dslbc" Namespace="DualSelectListBoxControl" Assembly="DualSelectListBoxControl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>MeterBatchManage</title>
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
    <script language="javascript">

        function CheckData() {
            if (MeterBatchManage.MeterName.value == "") {
                alert("������������,�����Ϊ��!");
                MeterBatchManage.MeterName.focus();
                return false;
            }
            if (MeterBatchManage.InitAmount.value == "") {
                alert("�������ʼ����,�����Ϊ��!");
                MeterBatchManage.InitAmount.focus();
                return false;
            }
            if (MeterBatchManage.Ratio.value == "") {
                alert("��������,�����Ϊ��!");
                MeterBatchManage.Ratio.focus();
                return false;
            }
            if ($("#MeterTabClass option:selected").val() == "") {
                alert("��ѡ��������,�����Ϊ��!");
                return false;
            }

            return true;
        }
        function SearMeterBox() {

            HDialog.Open('700', '400', "../dialogNew/MeterBoxDlg.aspx", '����ѡ��', false, function callback(_Data) {

                if (_Data != "") {
                    //**��÷��� 
                    var varObjects = JSON.parse(_Data);
                    $('#MeterBoxID').val(varObjects.MeterBoxID);
                    $('#MeterBoxName').searchbox('setValue', varObjects.MeterBoxName);

                }
            });
        }

        function SearCorrespTotalMeter() {
            HDialog.Open('700', '400', "../dialogNew/CorrespTotalMeterDlg.aspx", '��Ӧ�������ܱ�ѡ��', false, function callback(_Data) {
                if (_Data != "") {
                    //**��÷��� 
                    var varObjects = JSON.parse(_Data);
                    console.log(varObjects);
                    $('#CorrespTotalMeterId').val(varObjects.MeterID);
                    $('#CorrespTotalMeterName').searchbox('setValue', varObjects.MeterName);
                }
            });
        }
    </script>
</head>
<body style="overflow-y: auto">
    <form id="MeterBatchManage" method="post" runat="server">
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td align="center" colspan="4" style="height: 22px"><span id="lbl_WorkflowName">�����������</span></td>
            </tr>
            <tr>
                <td class="TdTitle">��ѡ�����÷�Χ</td>
                <td colspan="3" align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>

                            <td align="center">
                                <asp:DropDownList ID="DListRange" runat="server" AutoPostBack="True">
                                    <asp:ListItem Value="4">������</asp:ListItem>
                                    <asp:ListItem Value="1">��¥��</asp:ListItem>
                                    <asp:ListItem Value="2">����Ԫ</asp:ListItem>
                                    <asp:ListItem Value="3">��¥��</asp:ListItem>

                                </asp:DropDownList></td>
                            <td width="30%"></td>
                        </tr>
                    </table>
                    <dslbc:DualSelectListBox runat="server" ID="DualListField">
                        <LeftListStyle Width="200px" Height="250px"></LeftListStyle>
                        <RightListStyle Width="200px" Height="250px"></RightListStyle>
                    </dslbc:DualSelectListBox>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�������</td>
                <td class="TdContent">
                    <asp:DropDownList ID="MeterType" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList></td>
                <td class="TdTitle">������</td>
                <td class="TdContent">
                    <asp:DropDownList ID="SNum" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList><input id="StanID" style="width: 24px; height: 22px" type="hidden" size="1" name="StanID"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">�������</td>
                <td class="TdContent">
                    <input id="MeterName" class="easyui-validatebox" data-options="required:true" name="MeterName" runat="server" type="text" />
                </td>
                <td class="TdTitle">��ʼ����</td>
                <td class="TdContent">
                    <input onkeypress="CheckNumeric();" id="InitAmount" type="text" class="easyui-validatebox" data-options="prompt:'����������',required:true,validType:'digital'"
                        maxlength="20" size="10" name="InitAmount" runat="server" />

                </td>
            </tr>
            <tr>
                <td class="TdTitle">���</td>
                <td class="TdContent">
                    <input onkeypress="CheckInterger();" id="Ratio" type="text" class="easyui-validatebox" data-options="prompt:'����������',required:true,validType:'positiveint'"
                        maxlength="10" size="10" name="Ratio" runat="server" /></td>
                <td class="TdTitle">�Ƿ���</td>
                <td class="TdContent">
                    <select id="IsReverse" style="width: 100px" name="IsReverse" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">������</td>
                <td class="TdContent">
                    <select id="MeterTabClass" name="MeterTabClass" style="width: 100px" runat="server">
                        <option selected></option>
                        <option value="��ҵ">��ҵ</option>
                        <option value="��Э">��Э</option>
                        <option value="סլ">סլ</option>
                        <option value="����">����</option>
                    </select>
                </td>
                <td class="TdTitle">����</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="MeterBoxName" searcher="SearMeterBox" data-options="editable:false" name="MeterBoxName" runat="server" />
                    <input type="hidden" id="MeterBoxID" runat="server" value="" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��Ӧ�ܱ�</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="CorrespTotalMeterName" searcher="SearCorrespTotalMeter" data-options="editable:false" name="CorrespTotalMeterName" runat="server" />
                    <input type="hidden" id="CorrespTotalMeterId" name="CorrespTotalMeterId" runat="server" value="" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnOK" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="ȷ��" name="btnOK" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" align="left">��ע��һ�����������������ܹ�36����ƣ�����ˮ����ů�����������ƿ������µķ��Ž������á�</td>
            </tr>
        </table>
    </form>
</body>
</html>
