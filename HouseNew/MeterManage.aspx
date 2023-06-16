<%@ Page Language="c#" CodeBehind="MeterManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.MeterManage" %>

<!DOCTYPE html>
<html>
<head>
    <title>MeterManage</title>
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

            if (MeterManage.MeterName.value == "") {
                alert("������������,�����Ϊ��!");
                MeterManage.MeterName.focus();
                return false;
            }
            if (MeterManage.InitAmount.value == "") {
                alert("�������ʼ����,�����Ϊ��!");
                MeterManage.InitAmount.focus();
                return false;
            }
            if (MeterManage.Ratio.value == "") {
                alert("��������,�����Ϊ��!");
                MeterManage.Ratio.focus();
                return false;
            }

            if ($("#MeterTabClass option:selected").val() == "") {
                alert("��ѡ�����������,�����Ϊ��!");
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
                    $('#CorrespTotalMeterId').val(varObjects.MeterID);
                    $('#CorrespTotalMeterName').searchbox('setValue', varObjects.MeterName);

                }
            });
        }
        
        //-->
    </script>
</head>
<body>
    <form id="MeterManage" method="post" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server"
            size="1" />
        <input id="MeterID" type="hidden" name="MeterID" runat="server"
            size="1" />
        <input id="RoomID" type="hidden" size="1" name="RoomID"
            runat="server" />
        <input id="MeterSign" type="hidden" size="1" name="MeterSign"
            runat="server" />
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td class="TdTitle">���ݱ��</td>
                <td class="TdContent">
                    <input class="Control_ItemInput" id="RoomSign" readonly name="RoomSign"
                        runat="server" />
                </td>
                <td class="TdTitle">
                    <input id="StanID" type="hidden" size="1" name="StanID"
                        runat="server" /></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">�������</td>
                <td class="TdContent">
                    <asp:DropDownList ID="MeterType" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList></td>
                <td class="TdTitle">������</td>
                <td class="TdContent">
                    <div class="font_red" id="results">
                        <asp:DropDownList ID="SNum" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�������</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="MeterName" name="MeterName" runat="server" /></td>
                <td class="TdTitle">��ʼ����</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="prompt:'����������',required:true,validType:'digital'" id="InitAmount"
                        name="InitAmount" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">���</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="prompt:'����������',required:true,validType:'positiveint'" id="Ratio"
                        name="Ratio" runat="server" /></td>
                <td class="TdTitle">�Ƿ���</td>
                <td class="TdContent">
                    <select id="IsReverse" name="IsReverse" style="width: 100px" runat="server">
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
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="����" name="btnFilter" runat="server" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                                            <input id="btnReturn" type="button" value="�ر�" name="btnFilter"
                                                runat="server" class="button"></td>
            </tr>
            <tr>
                <td class="TdTitle" colspan="4" style="text-align: left">��ע��һ�����������������ܹ�36����ƣ�����ˮ����ů�����������ƿ������µķ��Ž������á�</td>
            </tr>
        </table>
    </form>
</body>
</html>
