<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DictionaryManage.aspx.cs" Inherits="M_Main.SysNew.DictionaryManage" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
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
    <table class="DialogTable">
        <tr id="Organ">
            <td class="DialogTdTitle">
                字典名称
            </td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox" data-options="required:true"
                    id="DictionaryName" name="DictionaryName" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                字典编码
            </td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox"
                    id="DictionarySign" name="DictionarySign" runat="server" />
            </td>
        </tr>
      <%--   <tr><td class="DialogTdTitle">
                
            </td><td colspan="7" style="height:2px;">说明：设置增值税率时，请将税率以小数形式输入到字典编码上</td></tr>--%>
        <tr id="CommRole">
            <td class="DialogTdTitle">
                排序号</td>
            <td class="DialogTdContent" colspan="7">
                <input type="text" class="easyui-validatebox" data-options="required:true,validType:'digital'"
                    id="DictionaryOrderId" name="DictionaryOrderId" runat="server" />
            </td>
        </tr>
        <tr id="trJSgs">
            <td class="DialogTdTitle">
                备注</td>
            <td class="DialogTdContent" colspan="7">
                <textarea class="easyui-validatebox"  style="height:130px;" id="DictionaryMemo" name="DictionaryMemo" runat="server"></textarea>
            </td>
        </tr>
        <tr><td colspan="2" style="height:2px;"></td></tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="button" class="button" value="保存" id="BtnSave" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>
        <input type="hidden" id="OpType"  name="OpType" runat="server">
        <input type="hidden" id="DictionarySort" name="DictionarySort" runat="server" />
        <input type="hidden" id="DictionaryCode" name="DictionaryCode" runat="server" />
        <script type="text/javascript">
           
            $("#BtnSave").click(function () {

                $.tool.DataPostChk('frmForm', 'Dictionary', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Close('1');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
        </script>
    </form>
</body>
</html>
