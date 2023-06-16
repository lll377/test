<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiversFeeIsUseOffset.aspx.cs" Inherits="M_Main.ChargesNew.WaiversFeeIsUseOffset" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style>
        .TdTitle {
            height: 30px;
            width: 20%;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
                <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="WaivID" type="hidden" name="WaivID" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">是否参与冲抵</td>
                <td class="TdContentSearch">
                    <select id="IsUseOffset" name="IsUseOffset" runat="server" class="easyui-combobox" paneimaxheight="100px"
                        data-options="editable:false,panelHeight:'auto',required:true" style="width: 150px">
                        <option value="0">是</option>
                        <option value="1">否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">更改原因</td>
                <td class="TdContentSearch">
                    <input id="SetIsUseOffReason" class="easyui-textbox" data-options="required:true" name="SetUseOffReason" runat="server" style="width: 150px" />
                </td>
            </tr>
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="保存" id="BtnSave" />
            <input type="button" class="button" value="关闭" id="BtnClose" />
        </div>
    </form>

    <script type="text/javascript">
        $("#BtnSave").click(function () {
            if ($("#frmForm").form('validate')) {
                $.tool.DataPostChk('frmForm', 'WaiversFees', 'SetUseOff', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Close(_Data);
                        }
                        else {
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    }
                )
            }
        });

        $("#BtnClose").click(function () {
            HDialog.Close('false');
        });
    </script>
</body>
</html>

