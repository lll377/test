<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCConfigSetOrganRefundManage.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCConfigSetOrganRefundManage" %>

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
                        <input id="CommID"  type="hidden" name="CommID" runat="server">
                        <input id="hiCommName"  type="hidden" name="hiCommName" runat="server">
                </td>                
            </tr>
            <tr>
                <td class="TdTitle">核算主体</td>
                <td class="TdContent"><input class="easyui-searchbox" id="AccountBodyName" data-options="editable:false" 
                    searcher="SelAccountBody" type="text"  name="AccountBodyName" runat="server" />
                         <input type="hidden" id="hiAccountBodyName" name="hiAccountBodyName" runat="server" />                        
                        <input type="hidden" id="AccountBodyMID" name="AccountBodyMID" runat="server" />                   
                </td>              
            </tr>
             <tr>
                <td class="TdTitle">实际承担主体</td>
                <td class="TdContent"><input class="easyui-searchbox" id="ActuallyBodyName" data-options="editable:false" 
                    searcher="SelActuallyBody" type="text"  name="ActuallyBodyName" runat="server" />
                         <input type="hidden" id="hiActuallyBodyName" name="hiActuallyBodyName" runat="server" />
                        <input type="hidden" id="ActuallyBodyMID" name="ActuallyBodyMID" runat="server" />                   
                </td>
            </tr>
             <tr>
                <td class="TdTitle">付款单位</td>
                <td class="TdContent"><input class="easyui-searchbox" id="PayerName" data-options="editable:false" 
                    searcher="SelPayer" type="text"  name="PayerName" runat="server" />
                         <input type="hidden" id="hiPayerName" name="hiPayerName" runat="server" />
                        <input type="hidden" id="PayerMID" name="PayerMID" runat="server" />
                        <input type="hidden" id="PayerType" name="PayerType" runat="server" />
                        <input type="hidden" id="PayerBank" name="PayerBank" runat="server" />
                        <input type="hidden" id="PayerCard" name="PayerCard" runat="server" />
                </td>              
            </tr>
             <tr>
                <td class="TdTitle">房地产项目</td>
                <td class="TdContent"><input class="easyui-searchbox" id="ProjectItemName" data-options="editable:false" 
                    searcher="SelProjectItem" type="text"  name="ProjectItemName" runat="server" />
                         <input type="hidden" id="hiProjectItemName" name="hiProjectItemName" runat="server" />
                         <input type="hidden" id="ProjectItemCode" name="ProjectItemCode" runat="server" />
                        <input type="hidden" id="ProjectItemID" name="ProjectItemID" runat="server" />                   
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

                $.tool.DataPostChk('frmForm', 'LJTH_NCConfigOrganRefund', "add", $('#frmForm').serialize(),
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
                $('#CommID').val('');
                $('#hiCommName').val('');

                var conent = "../DialogNew/CommDlg.aspx";

                HDialog.Open(650, 430, conent, '项目选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CommName').searchbox("setValue", data.text);

                    $('#CommID').val(data.attributes.InPopedom);
                    $('#hiCommName').val(data.text);
                });
            }

            function SelAccountBody() {
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCAccountBodyDlg.aspx' + '?Ram=' + Math.random(), '选择核算主体', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#AccountBodyMID').val(Obj.AccountBodyMID);
                        $('#AccountBodyName').searchbox("setValue", Obj.AccountBodyName);
                        $('#hiAccountBodyName').val(Obj.AccountBodyName);

                        return true;
                    }
                });

                return false;
            }

            function SelActuallyBody() {
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCActuallyBodyDlg.aspx' + '?Ram=' + Math.random(), '选择实际承担主体', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#ActuallyBodyMID').val(Obj.ActuallyBodyMID);                        
                        $('#ActuallyBodyName').searchbox("setValue", Obj.ActuallyBodyName);
                        $('#hiActuallyBodyName').val(Obj.ActuallyBodyName);                      

                        return true;
                    }
                });

                return false;
            }


             function SelPayer() {
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCPayerDlg.aspx' + '?Ram=' + Math.random(), '选择付款单位', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#PayerMID').val(Obj.PayerMID);
                        $('#PayerName').searchbox("setValue", Obj.PayerName);
                        $('#hiPayerName').val(Obj.PayerName);
                        
                        $('#PayerType').val(Obj.PayerType);
                        $('#PayerBank').val(Obj.PayerBank);
                        $('#PayerCard').val(Obj.PayerCard);


                        return true;
                    }
                });

                return false;
            }

             function SelProjectItem() {
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCProjectItemDlg.aspx' + '?Ram=' + Math.random(), '选择房地产项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#ProjectItemID').val(Obj.ProjectItemID);
                        $('#ProjectItemCode').val(Obj.ProjectItemCode);
                        $('#ProjectItemName').searchbox("setValue", Obj.ProjectItemName);
                        $('#hiProjectItemName').val(Obj.ProjectItemName);

                        return true;
                    }
                });

                return false;
            }

        </script>
    </form>
</body>
</html>
