<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDAuxAccountManage.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDAuxAccountManage" %>

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
        <input id="IID" type="hidden" name="IID" runat="server" />
        <table class="DialogTable" border="0" style="line-height:23px;height:23px;">            
             <tr>
                <td class="TdTitle">辅助核算项编码</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="AuxCode" name="AuxCode" runat="server">
                </td>
                <td class="TdTitle">辅助核算项名称</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="AuxName" name="AuxName" runat="server">
                </td>
             </tr>
            <tr>
                <td class="TdTitle">数据对象</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="AuxObject" name="AuxObject" runat="server">
                </td>
                <td class="TdTitle">参照名称</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="AuxRefer" name="AuxRefer" runat="server">
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

                $.tool.DataPostChk('frmForm', 'UFJDAuxAccount', "add", $('#frmForm').serialize(),
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


        </script>
    </form>
</body>
</html>
