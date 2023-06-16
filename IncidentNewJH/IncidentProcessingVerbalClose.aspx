<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentProcessingVerbalClose.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentProcessingVerbalClose" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>口派关闭</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="IncidentID" name="IncidentID" type="hidden" runat="server" value="" />
        <input id="ReserveDate" name="ReserveDate" type="hidden" runat="server" />
        <input type="hidden" id="Isdelete" name="Isdelete" runat="server" />
        <input id="hiOPType" size="1" type="hidden" name="hiOPType" runat="server" />
        <table class="DialogTable" style="line-height: 25px;">
            <tr>
                <td class="TdTitle">处理情况</td>
                <td class="TdContent" style="height: 99px" width="35%" colspan="3">
                    <textarea id="DealSituation" class="easyui-validatebox" style="height: 100px; width: 95%" rows="8" cols="53" data-options="required:true" runat="server"
                        name="DealSituation"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">完成时间</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="MainEndDate" name="MainEndDate" readonly runat="server" />
                </td>
                <td class="TdTitle">责任人</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="DealMan" name="DealMan" readonly runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 15px;" colspan="4">
                    <input class="button" type="button" value="保存" id="btnSave" name="btnSave" runat="server" onclick="Save();" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" runat="server" onclick="Close();" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    function Close() {
        HDialog.Close();
    }
    function Save() {
        var dealSituation = $('#DealSituation').val();
        if (!dealSituation) {
            HDialog.Info('请输入处理情况');
            return;
        }
        if (dealSituation.length > 500) {
            HDialog.Info('处理情况最多只能输入500个字');
            return;
        }
        var isdelete = $("#Isdelete").val();
        if (Isdelete == "1") {
            HDialog.Info("已删除的报事不能完成!");
        }

        $.tool.DataPost('IncidentCheckPost', "CheckIncidentTypeProcessPost", $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                var data = _Data;
                if (data == "true") {
                    $.tool.DataPost('IncidentProcessingNew', "verbaldeal", $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var data = _Data;
                            if (data == "true") {
                                HDialog.Info('完成成功');
                                HDialog.Close('1');
                            }
                            else if (data.substr(0, 6) == 'false1') {
                                HDialog.Info(data.substr(7));
                                HDialog.Close('1');
                            } else {
                                HDialog.Info('完成失败');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {

                        });
                } else {
                    HDialog.Info('你没有操作权限');
                }
            },
            function completeCallback() {
            },
            function errorCallback() {

            });
    }
    $(function () {
        var IncidentIDs = Cache.GetData("IncidentIDs");

        $('#IncidentID').val(IncidentIDs);
    });
</script>
