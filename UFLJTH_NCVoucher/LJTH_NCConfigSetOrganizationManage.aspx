<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCConfigSetOrganizationManage.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCConfigSetOrganizationManage" %>

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
                <td class="TdTitle">财务组织</td>
                <td class="TdContent"><input class="easyui-searchbox" id="OrganizationName" data-options="editable:false" 
                    searcher="SelOrganization" type="text"  name="OrganizationName" runat="server" />
                         <input type="hidden" id="hiOrganizationName" name="hiOrganizationName" runat="server" />
                         <input type="hidden" id="OrganizationCode" name="OrganizationCode" runat="server" />
                        <input type="hidden" id="OrganizationID" name="OrganizationID" runat="server" />                   
                </td>              
            </tr>
             <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent"><input class="easyui-searchbox" id="CustFilesName" data-options="editable:false" 
                    searcher="SelCustFiles" type="text"  name="CustFilesName" runat="server" />
                         <input type="hidden" id="hiCustFilesName" name="hiCustFilesName" runat="server" />
                         <input type="hidden" id="CustFilesCode" name="CustFilesCode" runat="server" />
                        <input type="hidden" id="CustFilesID" name="CustFilesID" runat="server" />                   
                </td>
            </tr>
             <tr>
                <td class="TdTitle">房地产项目名称</td>
                <td class="TdContent"><input class="easyui-searchbox" id="ProjectName" data-options="editable:false" 
                    searcher="SelProject" type="text"  name="ProjectName" runat="server" />
                         <input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" />
                         <input type="hidden" id="ProjectCode" name="ProjectCode" runat="server" />
                        <input type="hidden" id="ProjectID" name="ProjectID" runat="server" />                   
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

                $.tool.DataPostChk('frmForm', 'LJTH_NCConfigOrganization', "add", $('#frmForm').serialize(),
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

            function SelOrganization() {
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCOrganizationDlg.aspx' + '?Ram=' + Math.random(), '选择财务组织', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#OrganizationID').val(Obj.OrganizationID);
                        $('#OrganizationCode').val(Obj.OrganizationCode);
                        $('#OrganizationName').searchbox("setValue", Obj.OrganizationName);
                        $('#hiOrganizationName').val(Obj.OrganizationName);

                        return true;
                    }
                });

                return false;
            }

             function SelCustFiles() {
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCCustFilesDlg.aspx' + '?Ram=' + Math.random(), '选择客户', true, function callback(_Data) {

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

             function SelProject() {
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCProjectDlg.aspx' + '?Ram=' + Math.random(), '选择房地产项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#ProjectID').val(Obj.ProjectID);
                        $('#ProjectCode').val(Obj.ProjectCode);
                        $('#ProjectName').searchbox("setValue", Obj.ProjectName);
                        $('#hiProjectName').val(Obj.ProjectName);

                        return true;
                    }
                });

                return false;
            }

        </script>
    </form>
</body>
</html>
