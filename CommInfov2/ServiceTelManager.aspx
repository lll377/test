<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceTelManager.aspx.cs" Inherits="M_Main.CommInfov2.ServiceTelManager" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <style type="text/css">
        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">服务电话名称
                </td>
                <td class="DialogTdCommonContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Heading" name="Heading" runat="server" />
                </td>
                <td class="DialogTdTitle">服务电话类型
                </td>
                <td class="DialogTdCommonContent">
                    <select id="selTypeName" runat="server"></select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">电话号码
                </td>
                <td class="DialogTdCommonContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="InfoContent" name="InfoContent" runat="server" />
                </td>
            </tr>
            
            <tr>
                <td colspan="4" style="text-align: center; padding-top: 10px;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
            <script>
                $("#selTypeName").change(function () {
                    $("#InfoSource").val($("#selTypeName option:checked").val())
                });
            </script>
        </table>
        <input id="OpType" type="hidden" name="OpType" runat="server" />
        <input id="CommID" type="hidden" name="CommID" runat="server" />
        <input id="InfoID" type="hidden" name="InfoID" runat="server" />
        <input id="InfoType" type="hidden" name="InfoType" value="fwdh" runat="server" />
        <input id="InfoSource" type="hidden" name="InfoSource" runat="server" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $("#BtnSave").click(function () {
                $.tool.DataPostChk('frmForm', 'ServiceTel', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            HDialog.Close('1');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

        </script>
    </form>
</body>
</html>
