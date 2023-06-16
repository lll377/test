<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentRegionalManage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentRegionalManage" %>

<!DOCTYPE html>

<html >
<head >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

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
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body style="padding: 0; margin: 0;">
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="RegionalID" type="hidden" name="RegionalID" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">序号</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'digital'" id="RegionalNum"
                        type="text" name="RegionalNum" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">公区区域</td>
                <td class="TdContent">
                    <input class="easyui-validatebox"  data-options="required:true" id="RegionalPlace" type="text" name="RegionalPlace"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="RegionalMemo" type="text" name="RegionalMemo"
                        runat="server" />
                </td>
            </tr>
        </table>

          <table class="DialogTable">
            <tr>
                <td colspan="4" class="DialogTdSubmit" style="text-align: center">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>


        <script type="text/javascript">

            $("#BtnSave").click(function () {
                var cmd = $("#hiOPType").val();
                $.tool.DataPostChk('frmForm', 'IncidentSet', cmd, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('保存成功');
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
