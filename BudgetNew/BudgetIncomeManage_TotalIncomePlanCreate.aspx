<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_TotalIncomePlanCreate.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_TotalIncomePlanCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算计划-收入计划-生成汇总收入计划</title>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 600px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 10%;
            }

        .TdContentSearch input, select {
            border: 1px #cccccc solid;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">项目名称</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" id="CommName" readonly onclick="SelCommInfo()" runat="server" name="CommName" />
                    <input type="hidden" id="CommID" name="CommID" runat="server" />
                </td>
                <td class="TdTitle">预算年度</td>
                <td class="TdContentSearch">
                    <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy' })" style="border: 1px solid #cccccc;"
                        id="TotalBudgetPlanYear" runat="server" name="TotalBudgetPlanYear" /></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <input id="btnCreate" class="button" value="生成" type="button" name="btnCreate" runat="server">&nbsp; 
                            <input id="btnReturn" class="button" value="放弃返回" type="button" name="btnReturn" runat="server"></td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">

        //返回
        $("#btnReturn").click(function () {
            HDialog.Close("");
        })

        //生成
        $("#btnCreate").click(function () {
            if ($('#CommID').val() == "0" || $('#CommID').val() == "") {
                HDialog.Info("请选择项目！");
                return;
            }
            if ($("#TotalBudgetPlanYear").val() == "") {
                HDialog.Info("预算年度必须选择!");
                return;
            }
            $.tool.DataPost('Budget', "IncomeManage_CreateTotalIncomePlan", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("生成汇总收入计划成功");
                        HDialog.Close("true");
                    } else {
                        HDialog.Info(_Data);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        })

        //选择项目
        function SelCommInfo() {
            HDialog.Open(1000, 500, '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    //$("#CommID").val(varObjects.attributes.InPopedom);
                    //$("#CommName").val(varObjects.text);
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);

                }
            });
        }
    </script>
</body>
</html>
