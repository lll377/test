<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaySendManage.aspx.cs" Inherits="M_Main.SMSNew.MaySendManage" %>

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
                <td class="TdTitle">管理项目</td>
                <td class="TdContent" colspan="3"><asp:Label ID="lbCommName" runat="server" ></asp:Label>
                </td>                
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent" colspan="3"><asp:Label ID="lbCustName" runat="server" ></asp:Label>
                </td>
            </tr>              
            <tr> 
                <td class="TdTitle">房屋编码</td>
                <td class="TdContent" colspan="3"><asp:Label ID="lbRoomSign" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr> 
                <td class="TdTitle">手机号码</td>
                <td class="TdContent" colspan="3"><asp:Label ID="lbMobile" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr> 
                <td class="TdTitle">定时发送时间</td>
                <td class="TdContent" colspan="3"><asp:Label ID="lbSendAtTime" runat="server" ></asp:Label>
                    <input type="hidden" name="SendAtTime" id="SendAtTime" runat="server" />
                </td>
            </tr>
            <tr> 
                <td class="TdTitle">信息内容</td>
                <td class="TdContent" colspan="3"><textarea id="Message" name="Message" rows="5" cols="70" runat="server"></textarea>
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
                
                if ($("#Message").val() == "") {
                    HDialog.Info("请输入信息内容,此项不能为空!");
                    $("#Message").focus();
                    return false;
                }

                $.tool.DataPostChk('frmForm', 'SMS', "MaySendEdit", $('#frmForm').serialize(),
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
