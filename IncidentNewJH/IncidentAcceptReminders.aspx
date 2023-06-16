<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAcceptReminders.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentAcceptReminders" %>

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
    <%--<link href="../css/framesearch.css" type="text/css" rel="stylesheet" />--%>

</head>
<body>
    <form id="frmForm" runat="server" >
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="IncidentID" type="hidden" name="IncidentID" runat="server" /> 
        <input id="InfoID" type="hidden" name="IID" runat="server" value="0">
        <table class="DialogTable">       
            <tr >
                <td class="TdTitle">催办时间</td>
                <td class="TdContent" >
                    <input class="easyui-datetimebox" id="RemindersDate" name="RemindersDate" readonly="readonly" style="width:270px" runat="server" />
                </td>
                <td class="TdTitle">催办人</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="UserName" name="UserName" readonly="readonly" runat="server"  />
                </td>
            </tr>
            
            
            <tr>
                <td colspan="4" align="center" style="padding-top:20px">
                    <input class="button" type="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp
                    <input class="button" type="button" value="放弃返回" id="BtnReturn" />

                </td>
            </tr>
        </table>
        

        <script type="text/javascript">

            $("#BtnSave").click(function () {
                var cmd = $("#hiOPType").val();

                $.tool.DataPostAsync('IncidentAssignedNew', cmd, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            parent.layer.alert('催办成功');
                            HDialog.Close(1);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    }, false);
            });
            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                HDialog.Close(0);
            }


        </script>
    </form>
</body>
</html>
