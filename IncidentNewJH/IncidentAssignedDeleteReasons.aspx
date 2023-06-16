<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAssignedDeleteReasons.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentAssignedDeleteReasons" %>

<!DOCTYPE html>

<html>
<head>
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
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="IncidentID" type="hidden" name="IncidentID" runat="server" />
        <table class="DialogTable" style="line-height: 25px;">

            <tr>
                <td class="TdTitle">废弃时间</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="DeleteDate" name="DeleteDate" disabled runat="server" />
                </td>
                <td class="TdTitle">操作人</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="DeleteMan" name="DeleteMan" disabled runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">废弃原因</td>
                <td class="TdContent" colspan="3">
                    <textarea id="DeleteReasons" rows="5" cols="70" runat="server" class="easyui-validatebox" data-options="required:true"></textarea>
                </td>

            </tr>

            <tr>
                <td colspan="4" style="text-align: center; padding-top: 10px;" colspan="4">
                    <input class="button" type="button" value="确认废弃" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp
                    <input class="button" type="button" value="放弃返回" id="BtnReturn" />

                </td>
            </tr>
        </table>


        <script type="text/javascript">

            $("#BtnSave").click(function () {
                var m = $("#DeleteReasons").val();
                if (m == "") {
                    HDialog.Info("废弃原因不能为空！");
                    $('#DeleteReasons').focus();
                    return false;
                }
                var cmd = $("#hiOPType").val();
                $.tool.DataGet('IncidentAssignedNew', cmd, "IncidentID=" + $("#IncidentID").val() + "&DeleteDate=" + $("#DeleteDate").val() +
                    "&DeleteMan=" + $("#DeleteMan").val() + "&DeleteReasons=" + $("#DeleteReasons").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.split('|')[0] == "true") {
                            //HDialog.Info('废弃成功!');
                            HDialog.Close(1);
                        } else {
                            HDialog.Info(_Data.split('|')[1]);
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
