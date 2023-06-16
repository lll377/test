<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankAccountInfoSetManage.aspx.cs" Inherits="M_Main.ChargesNew.BankAccountInfoSetManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>银行入账资料修改</title>
    <script src="../jscript/ajax.js"></script>
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
        input {
            width: 80%;
        }
    </style>
</head>
<body>
    <form id="WaiversPolicyform" runat="server">
        <input type="hidden" id="BID" runat="server" />
        <input type="hidden" id="defaultsel" runat="server" />
        <input type="hidden" id="PayType" runat="server"/>
        <table class="DialogTable" id="Table1">
            <tr>
                <td class="TdTitle">企业名称：</td>
                <td class="TdContentSearch">
                    <input type="text" id="CommpanyName" class="easyui-validatebox" data-options="editable:true,required:true" name="CommpanyName" runat="server" />
                </td>
                <td class="TdTitle">银行名称：</td>
                <td class="TdContentSearch">
                    <input type="text" id="BankName" class="easyui-validatebox" data-options="editable:true,required:true" runat="server" name="BankName" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">银行网点：</td>
                <td class="TdContentSearch">
                    <input id="BankBranches" name="BankBranches" runat="server" />
                </td>
                <td class="TdTitle">银行账号：</td>
                <td class="TdContentSearch">
                    <input id="BankAccount" type="text" name="BankAccount" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">单位代码：</td>
                <td class="TdContentSearch">
                    <input type="text" id="UnitCode" name="UnitCode" runat="server" />
                </td>
                <td class="TdTitle" style="text-align: center;">是否默认：</td>
                <td class="TdContentSearch">
                    <select id="IsDefault" runat="server">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">收款方式</td>
                <td class="TdContentSearch">
                    <select id="ChargeMode" style="border: 1px solid #cccccc;width:320px;"  name="ChargeMode" 
                        runat="server"  class="easyui-combobox" multiple="true" data-options="panelHeight:80,required:true" >
                            <option selected></option>
                        </select>
                </td>
            </tr>

            <tr>
                <td style="height: 60px;"></td>
            </tr>
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnSave" type="button" value="保存" name="btnSave" onclick="javascript: if (CheckAllData() == false) return false;" runat="server" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script>
        //验证必填
        function CheckAllData() {
            $("#PayType").val($('#ChargeMode').combotree('getText'))
            return $("#WaiversPolicyform").form('validate');
        };

        $("#btnReturn").click(function () {
            HDialog.Close("");
        });

        $(function () {
            if ($("#defaultsel").val() == 1) {
                $("#IsDefault").val(1);
            }
            else {
                $("#IsDefault").val(0);
            }
        })
       
    </script>
</body>
</html>
