<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_ArrearsCreate.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_ArrearsCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算管理-收入预算编制-欠费回收计划-生成欠费</title>
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
            width: 800px;
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
    <input type="hidden" id="ParentWidth" name="ParentWidth" runat="server" />
    <input type="hidden" id="ParentHeight" name="ParentHeight" runat="server" />
    <form id="frmForm" runat="server">
        <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />

        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
        <input id="hiRegionNames" type="hidden" name="hiRegionNames" runat="server" />

        <input id="RoomStates" type="hidden" name="RoomStates" runat="server" />
        <input id="hiRoomStateNames" type="hidden" name="hiRoomStateNames" runat="server" />
        <input id="RoomStateNum" type="hidden" name="RoomStateNum" runat="server" />

        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
        <input id="hiCostNames" type="hidden" name="hiCostNames" runat="server" />

        <table class="SearchTable">
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">欠费明细生成</td>
            </tr>
            <tr>
                <td class="TdTitle">项目名称</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" id="CommName" readonly onclick="SelCommInfo()" runat="server" name="CommName" />
                    <input type="hidden" id="CommID" name="CommID" runat="server" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>

            <tr>
                <td class="TdTitle">收款截止时间</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-datebox" id="ChargeCutDate" runat="server" name="ChargeCutDate" data-options="editable:false" /></td>
                <td class="TdTitle">时间类型</td>
                <td class="TdContentSearch">
                    <select id="FeesDateType" name="FeesDateType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="2" selected>应收日期</option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">费用时间从</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-datebox" id="FeesStartDate" runat="server" name="FeesStartDate" data-options="editable:false" /></td>
                <td class="TdTitle">到</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-datebox" id="FeesEndDate" runat="server" name="FeesEndDate" data-options="editable:false" /></td>
            </tr>
            <tr>
                <td class="TdTitle">是否关联预算</td>
                <td class="TdContentSearch">
                    <select id="IsRelationBudget" name="IsRelationBudget" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                        <option value="是" selected>是</option>
                    </select>
                </td>
                <td class="TdTitle">关联预算年度</td>
                <td class="TdContentSearch">
                    <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy' })" style="border: 1px solid #cccccc;"
                        id="BudgetPlanYear" runat="server" name="BudgetPlanYear" /></td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch">
                    <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                        name="CostNames" runat="server"></td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <%--<tr>
                <td class="TdTitle">楼宇</td>
                <td class="TdContentSearch">
                    <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                        name="BuildNames" runat="server" /></td>
                <td class="TdTitle">组团区域</td>
                <td class="TdContentSearch">
                    <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                        name="RegionNames" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">交房状态</td>
                <td class="TdContentSearch">
                    <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState" data-options="editable:false"
                        name="RoomStateNames" runat="server" />
                </td>
                <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch">
                    <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                        name="CostNames" runat="server"></td>
            </tr>--%>

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
            if ($("#BudgetPlanYear").val() == "") {
                HDialog.Info("预算年度必须选择!");
                return;
            }
            $.tool.DataPost('Budget', "IncomeManage_CreateArrears", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != "") {
                        var ItemList = _Data.split('|');
                        if (ItemList[0] == "true") {
                            var ArrearsRecoveryPlanIDStr = ItemList[1];
                            HDialog.Open($('#ParentWidth').val(), $('#ParentHeight').val(), '../BudgetNew/BudgetIncomeManage_ArrearsDetail.aspx?ArrearsRecoveryPlanID=' + ArrearsRecoveryPlanIDStr + "&CommID=" + $('#CommID').val(), "编制欠费明细", false, function callback(_Data) {
                            });
                        } else {
                            HDialog.Info(ItemList[1]);
                        }
                    } else {
                        HDialog.Info("生成失败，请联系管理员");
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
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);

                    //选择项目过后需要删除 楼宇 组团 房屋状态 费用项目
                    $('#BuildSNums').val("");
                    $('#BuildNames').searchbox("setValue", "");

                    $('#RegionSNums').val("");
                    $('#RegionNames').searchbox('setValue', "");
                    $('#hiRegionNames').val("");


                    $('#RoomStates').val("");
                    $('#RoomStateNames').searchbox('setValue', "");
                    $('#hiRoomStateNames').val("");
                    $('#RoomStateNum').val("");

                    $('#CostIDs').val("");
                    $('#CostNames').searchbox('setValue', "");
                }
            });
        }

        //楼宇选择
        function SelBuild() {
            if ($('#CommID').val() == "0" || $('#CommID').val() == "") {
                HDialog.Info("请先选择项目！");
                return;
            }
            HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx?CommID=" + $("#CommID").val(), '楼宇选择', false, function callback(_Data) {
                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("|");
                    var BuildSNums = "";
                    var BuildNames = "";
                    $('#BuildSNums').val(BuildSNums);
                    $('#BuildNames').searchbox('setValue', BuildNames);
                    for (var i = 0; i < varObjects.length; i++) {
                        if (varObjects[i].indexOf(",") > 0) {
                            var d1 = varObjects[i].split(",")[0];
                            var d2 = varObjects[i].split(",")[1];
                            BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                            BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                        }
                    }
                    $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                    $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                }
            });
        }

        //组团选择
        function SelRegion() {
            if ($('#CommID').val() == "0" || $('#CommID').val() == "") {
                HDialog.Info("请先选择项目！");
                return;
            }
            HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx?CommID=" + $("#CommID").val(), '组团选择', false, function callback(_Data) {
                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("|");
                    var RegionSNums = "";
                    var RegionNames = "";
                    $('#RegionSNums').val(RegionSNums);
                    $('#RegionNames').searchbox('setValue', RegionNames);
                    $('#hiRegionNames').val(RegionNames);

                    for (var i = 0; i < varObjects.length; i++) {
                        if (varObjects[i].indexOf(",") > 0) {

                            RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                            RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                        }
                    }
                    $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                    $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));
                    $('#hiRegionNames').val(RegionNames);
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
                    $('#hiRoomStateNames').val(varObjects[0]);
                    var arrRoomStateSNums = varObjects[0].split(',');
                    $('#RoomStateNum').val(arrRoomStateSNums.length);
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
    </script>
</body>
</html>
