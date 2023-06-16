<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractUpdateSignAndRegister.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractUpdateSignAndRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>

    <style type="text/css">
        .bootstrap_table tr td.title {
            width: 20%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 30%;
            text-align: left;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="overflow: hidden; padding: 0px; margin: 0px;">
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" runat="server">
        <div style="padding: 20px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>签约时间</span>
                    </td>
                    <td class="text">
                        <input type="text" id="ContractSignTime" name="ContractSignTime" class="easyui-datebox" runat="server"
                            data-options="editable:false,required:true,panelHeight:'240px'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>登记时间</span></td>
                    <td class="text">
                        <input type="text" id="ContractRegisterTime" name="ContractRegisterTime" class="easyui-datebox" runat="server"
                            data-options="editable:false,required:true,panelHeight:'240px'" />
                    </td>
                </tr>
                <tr>
                    <td class="title">变更人</td>
                    <td class="text">
                        <input type="text" id="UpdateUserName" name="UpdateUserName" class="easyui-textbox" disabled="disabled" runat="server" />
                        <input type="hidden" id="UpdateUserId" name="UpdateUserId" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title">变更时间</td>
                    <td class="text">
                        <input type="text" id="UpdateTime" name="UpdateTime" class="easyui-textbox " disabled="disabled" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            InitPage();
        });
        function InitPage() {
            var ID = $.getUrlParam("ID");
            $("#ID").val(ID);
        }
        //保存
        function Save() {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('DiversifiedManage', 'UpdateContractSignAndRegister', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }
        //关闭
        function Close() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>

