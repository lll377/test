<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDConfigSet_JinWei_AccountManage.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDConfigSet_JinWei_AccountManage" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="ConfigID" type="hidden" name="ConfigID" runat="server" />
        <table class="DialogTable" border="0" style="line-height:23px;height:23px;">
            <tr>
                <td class="TdTitle">区域</td>
                <td class="TdContent"> <asp:DropDownList id="OrganCode" runat="server" AutoPostBack="True"></asp:DropDownList>
                </td>
             </tr>
            <tr>
                <td class="TdTitle">管理项目</td>
                <td class="TdContent"><input class="easyui-searchbox" id="CommName" searcher="SelComm"  data-options="editable:false,readonly:true"  name="CommName" runat="server">                        
                        <input id="hiCommID"  type="hidden" name="hiCommID" runat="server">
                        <input id="hiCommName"  type="hidden" name="hiCommName" runat="server">
                    <INPUT id="btnClearComm" onclick="javascript:btnClearComm_OnClick();"
						type="button" value="清空" name="btnClearComm" runat="server" visible="false">
                </td>                
            </tr>
            <tr>
                <td class="TdTitle">账套名称</td>
                <td class="TdContent"><input class="easyui-searchbox" id="AccountName" data-options="editable:false" 
                    searcher="SelAccount" type="text"  name="AccountName" runat="server" />
                         <input type="hidden" id="hiAccountName" name="hiAccountName" runat="server" />
                         <input type="hidden" id="AccountCode" name="AccountCode" runat="server" />
                    <INPUT id="btnClearAccount" onclick="javascript:btnClearAccount_OnClick();"
						type="button" value="清空" name="btnClearAccount" runat="server">
                </td>              
            </tr>
             <tr>
                <td class="TdTitle">账簿编码</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="AccountBookCode" name="AccountBookCode" runat="server">
                </td>
                
            </tr> 
            <tr>
                <td colspan="4" style="text-align: center; padding-top: 15px;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关闭" id="BtnReturn" />

                </td>
            </tr>
        </table>
        <script type="text/javascript">
            $("#BtnSave").click(function () {
                var cmd = $("#hiOPType").val();

                $.tool.DataPostChk('frmForm', 'UFJDConfigAccount', "add", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        parent.layer.alert('保存成功');
                        HDialog.Close("true");
                        
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
            });
            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                HDialog.Close('');
            }


            function SelComm() {

                $('#CommName').searchbox("setValue", '');
                $('#hiCommID').val('');
                $('#hiCommName').val('');

                var conent = "../DialogNew/CommDlg.aspx";

                HDialog.Open(650, 430, conent, '项目选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CommName').searchbox("setValue", data.text);

                    $('#hiCommID').val(data.attributes.InPopedom);
                    $('#hiCommName').val(data.text);
                });
            }

            function SelAccount() {
                HDialog.Open('800', '600', '../DialogNew/UFJDAccountDlg.aspx' + '?Ram=' + Math.random(), '选择账套', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        //$('#AccountID').val(Obj.AccountID);
                        $('#AccountCode').val(Obj.CompanyCode);
                        $('#AccountName').searchbox("setValue", Obj.CompanyName);
                        $('#hiAccountName').val(Obj.CompanyName);

                        return true;
                    }
                });

                return false;
            }

            function btnClearComm_OnClick()
            {
                $('#hiCommID').val("");
                $('#CommName').searchbox("setValue", "");
                $('#hiCommName').val("");
            }

            function btnClearAccount_OnClick()
            {
                $('#AccountCode').val("");
                $('#AccountName').searchbox("setValue", "");
                $('#hiAccountName').val("");
			}

        </script>
    </form>
</body>
</html>
