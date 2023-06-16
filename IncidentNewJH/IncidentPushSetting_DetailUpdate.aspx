<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentPushSetting_DetailUpdate.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentPushSetting_DetailUpdate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>装修流程设置详细页面</title>
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
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdTitle {
            width: 20%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="UpdateTable" name="UpdateTable" runat="server" />
        <input type="hidden" id="IID" name="IID" runat="server" />
        <input type="hidden" id="HiPushContent" name="HiPushContent" runat="server" />
        <input type="hidden" id="hiCheckPushObject" name="hiCheckPushObject" runat="server" />
        <input type="hidden" id="hiAPP" name="hiAPP" runat="server" />
        <input type="hidden" id="hiPhone" name="hiPhone" runat="server" />
        <div style="padding: 5px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">
                        <label id="PushObject" name="PushObject" runat="server"></label>
                    </td>
                    <td class="TdContent">
                        <input type="checkbox" id="CheckPushObject" name="CheckPushObject" runat="server" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle">推送标题</td>
                    <td class="TdContent" colspan="3">
                        <input id="PushTilte" name="PushTilte" readonly type="text" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">推送内容</td>
                    <td class="TdContent" colspan="3">
                        <label id="showPushContent" name="showPushContent" runat="server"></label>
                        <input style="width: 37%;" id="PushContent" name="PushContent" type="text" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">APP</td>
                    <td class="TdContent">
                        <input type="checkbox" id="APP" name="APP" runat="server" />
                    </td>
                    <td class="TdTitle">手机短信</td>
                    <td class="TdContent">
                        <input type="checkbox" id="Phone" name="Phone" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td style="text-align: center; padding-top: 10px;" colspan="4">
                        <input class="button" type="button" value="保存" id="btnSave" name="btnSave" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    function Int() {
    }
    Int();

    $("#btnReturn").click(function () {
        HDialog.Close();
    });

    $("#btnSave").click(function () {
        var CheckPushObject = $('#CheckPushObject').is(':checked');
        if (CheckPushObject) {
            $('#hiCheckPushObject').val(1);
        } else {
            $('#hiCheckPushObject').val(0);
        }

        var APP = $('#APP').is(':checked');
        if (APP) {
            $('#hiAPP').val(1);
        } else {
            $('#hiAPP').val(0);
        }

        var Phone = $('#Phone').is(':checked');
        if (Phone) {
            $('#hiPhone').val(1);
        } else {
            $('#hiPhone').val(0);
        }

        if ($('#UpdateTable').val() == '') {
            return;
        }
        if ($('#IID').val() == '') {
            return;
        }

        $.tool.DataPost('IncidentPushSetting', "UpdateIncidentPushSetting", $('#frmForm').serialize(),
            function Init() {
            },
            function callback(_Data) {
                HDialog.Close();
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
    });
</script>

