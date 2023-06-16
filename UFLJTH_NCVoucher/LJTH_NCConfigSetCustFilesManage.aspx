<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCConfigSetCustFilesManage.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCConfigSetCustFilesManage" %>

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
                <td class="TdTitle">管理项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CommName" searcher="SelComm"  data-options="editable:false,readonly:true"  name="CommName" runat="server">                        
                        <input id="CommID"  type="hidden" name="CommID" runat="server">
                        <input id="hiCommName"  type="hidden" name="hiCommName" runat="server">
                </td>                
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent" colspan="3"> <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" searcher="SelCust" data-options="required:true" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>
            </tr> 
             
            <tr> 
                <td class="TdTitle">客商名称</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CustFilesName" data-options="editable:false" 
                    searcher="SelCustFiles" type="text"  name="CustFilesName" runat="server" />
                         <input type="hidden" id="hiCustFilesName" name="hiCustFilesName" runat="server" />
                         <input type="hidden" id="CustFilesCode" name="CustFilesCode" runat="server" />
                    <input type="hidden" id="CustFilesID" name="CustFilesID" runat="server" />
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

                $.tool.DataPostChk('frmForm', 'LJTH_NCConfigCustFiles', "add", $('#frmForm').serialize(),
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


            function SelCust() {
                var vCommID = $('#CommID').val();

                if (vCommID == "")
                {
                    HDialog.Info('请选择管理项目！');
                    return
                }                

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
              
                var conent = "../DialogNew/CustDlg.aspx" + "?CommID=" + vCommID;
                var w = 800;
                var h = 600;

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }

            function SelCustFiles() {

                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCCustFilesDlg.aspx' + '?Ram=' + Math.random(), '选择客商', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#CustFilesID').val(Obj.CustFilesID);
                        $('#CustFilesCode').val(Obj.CustFilesCode);
                        $('#CustFilesName').searchbox("setValue", Obj.CustFilesName);
                        $('#hiCustFilesName').val(Obj.CustFilesName);                        

                        return true;
                    }
                });

                return false;
            }
        </script>
    </form>
</body>
</html>
