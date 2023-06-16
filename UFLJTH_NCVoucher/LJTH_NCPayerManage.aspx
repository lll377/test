<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCPayerManage.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCPayerManage" %>

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
                <td class="TdTitle">付款单位类型</td>
                <td class="TdContent"><SELECT id="PayerType" name="PayerType" runat="server">
                        <option value="0">内部单位</option>
                        <option value="1">供方</option>
                        <OPTION value="2">员工</OPTION>
                        <OPTION value="3">客户</OPTION>
                        <OPTION value="4">租户</OPTION>
					</SELECT>                    
                </td>
                <td class="TdTitle">付款单位ID</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="PayerMID" name="PayerMID" runat="server">
                </td>
             </tr>
             <tr>
                
                <td class="TdTitle">付款单位名称</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="PayerName" name="PayerName" runat="server">
                </td>
                  <td class="TdTitle">付款单位开户行</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="PayerBank" name="PayerBank" runat="server">
                </td>
             </tr>
             <tr>
                 
                <td class="TdTitle">付款单位账号</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="PayerCard" name="PayerCard" runat="server">
                </td>
                  <td class="TdTitle"></td>
                <td class="TdContent">
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

                $.tool.DataPostChk('frmForm', 'LJTH_NCPayer', "add", $('#frmForm').serialize(),
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
