<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentContentAdd.aspx.cs" Inherits="M_Main.DialogNew.IncidentContentAdd" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body>

    <form id="frmForm" method="post" runat="server">
        <input id="PhType" type="hidden" name="PhType" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">报事内容</td>
                <td class="DialogTdContent">
                    <textarea id="PhrasesCom" class="easyui-validatebox" style="height: 208px; width: 98%" name="PhrasesCom" rows="13"
                        cols="83"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="DialogTdSubmit">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            $("#BtnSave").click(function () {

                $.tool.DataPostChk('frmForm', 'IncidentUnit', "IncidentContentAdd", $('#frmForm').serialize(),
                    function Init() {
                    },
                function callback(_Data) {
                    if (_Data == "true") {
                        parent.layer.alert('新增成功');
                        HDialog.Close(1);
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
                HDialog.Close();
            }
        </script>
    </form>
</body>
</html>
