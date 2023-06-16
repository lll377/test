<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_BasicIncomePlanCreate.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_BasicIncomePlanCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算计划-收入计划-生成基础收入计划</title>
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
                <td class="TdTitle">收费率类型</td>
                <td class="TdContentSearch">
                    <select id="ChargeRateType" name="ChargeRateType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="本月收费率" selected>本月收费率</option>
                        <option value="本年累计收费率">本年累计收费率</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">预算年度</td>
                <td class="TdContentSearch">
                    <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy' })" style="border: 1px solid #cccccc;"
                        id="BasicBudgetPlanYear" runat="server" name="BasicBudgetPlanYear" /></td>
                <td class="TdTitle">交房状态</td>
                <td class="TdContentSearch">
                    <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState" data-options="editable:false"
                        name="RoomStateNames" runat="server" />
                    <input id="RoomStates" type="hidden" name="RoomStates" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                        name="CostNames" runat="server" style="width: 446px;">
                    <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
                </td>
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
            if ($("#BasicBudgetPlanYear").val() == "") {
                HDialog.Info("预算年度必须选择!");
                return;
            }
            //if ($('#CostIDs').val() == "") {
            //    HDialog.Info("请选择费用项目!");
            //    return;
            //}
            $.tool.DataPost('Budget', "IncomeManage_CreateBasicIncomePlan", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("生成基础收入计划成功");
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

                    $('#CostIDs').val("");
                    $('#CostNames').searchbox('setValue', "");

                    $('#RoomStates').val("");
                    $('#RoomStateNames').searchbox('setValue', "");
                }
            });
        }


        //费用项目选择
        function SelCost() {
            if ($('#CommID').val() == "0" || $('#CommID').val() == "") {
                HDialog.Info("请先选择项目！");
                return;
            }
            HDialog.Open('700', '450', "../dialogNew/MultiCorpCommCostDlg.aspx?CommID=" + $('#CommID').val(), '费用项目选择', false, function callback(_Data) {
                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("\t");
                    $('#CostIDs').val(varObjects[0]);
                    $('#CostNames').searchbox('setValue', varObjects[1]);
                }
            });
        }

        //交房状态
        function SelRoomState() {
            if ($('#CommID').val() == "0" || $('#CommID').val() == "") {
                HDialog.Info("请先选择项目！");
                return;
            }
            var strRoomStates = "";
            HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random() + "&CommID=" + $("#CommID").val(), '房屋状态选择', false, function (_data) {
                var varReturn = _data;
                if (varReturn != "") {//**获得返回 刷新
                    var varObjects = varReturn.split("\t");
                    $('#RoomStates').val(varObjects[0]);
                    $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                }
            });
        }
    </script>
</body>
</html>
