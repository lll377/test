<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_ArrearsPlanClearUpRateSetting.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_ArrearsPlanClearUpRateSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算管理-欠费回收计划-清欠率设置</title>
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

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 14%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="form1" runat="server">
        <input type="hidden" id="ArrearsRecoveryPlanID" name="ArrearsRecoveryPlanID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="IID" name="IID" runat="server" />
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">清欠率类型:</td>
                <td class="TdContentSearch">
                    <select id="ClearUpRateType" name="ClearUpRateType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true" runat="server">
                        <option value="本月清欠率">本月清欠率</option>
                        <option value="本年累计清欠率">本年累计清欠率</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目:</td>
                <td class="TdContentSearch">
                    <select id="FeesCost" name="FeesCost" class="easyui-combobox" runat="server">
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">1月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate1Y" name="ClearUpRate1Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">2月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate2Y" name="ClearUpRate2Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">3月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate3Y" name="ClearUpRate3Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">4月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate4Y" name="ClearUpRate4Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">5月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate5Y" name="ClearUpRate5Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">6月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate6Y" name="ClearUpRate6Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">7月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate7Y" name="ClearUpRate7Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">8月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate8Y" name="ClearUpRate8Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">9月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate9Y" name="ClearUpRate9Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">10月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate10Y" name="ClearUpRate10Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">11月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate11Y" name="ClearUpRate11Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">12月清欠率计划(%):</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClearUpRate12Y" name="ClearUpRate12Y" runat="server" class="easyui-numberbox" data-options="min:0,precision:2,required:true" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; width: 100%; padding: 5px 0; height: 40px;">
            <input type="button" class="button" value="保存" id="BtnSave" runat="server" />
            <input type="button" class="button" value="放弃返回" id="BtnCancle" onclick="btnClose();" runat="server" />
        </div>
        <script type="text/javascript">
            //页面关闭
            function btnClose() {
                HDialog.Close("");
            }

            //保存
            $('#BtnSave').bind("click", function () {
                if ($('#frmForm').form("validate")) {
                    //验证数据是否满足条件
                    if ($('#ClearUpRateType').combobox("getValue") == "本月清欠率") {
                        var SumValue = 0.00;
                        $.each($(".easyui-numberbox"), function (e, item) {
                            SumValue = SumValue + parseFloat($(item).numberbox("getValue"));
                        });
                        if (parseFloat(SumValue) > 100.00) {
                            HDialog.Info("1至12月清欠率之和不得大于100%");
                            return;
                        }
                    } else {
                        var SumValue = 0.00;
                        var Flag = false;
                        $.each($(".easyui-numberbox"), function (e, item) {
                            var CurrentValue = parseFloat($(item).numberbox("getValue"));
                            //判断每月数据是否有大于100的情况
                            if (parseFloat(CurrentValue) > 100.00) {
                                Flag = true;
                                HDialog.Info((e + 1) + "月清欠率不得大于100%");
                                return false;
                            }
                            if (e != 0) {
                                var BeforeValue = $(".easyui-numberbox").eq(e - 1).numberbox("getValue");
                                if (parseFloat(CurrentValue) < parseFloat(BeforeValue)) {
                                    Flag = true;
                                    HDialog.Info((e + 1) + "月清欠率不得小于" + e + "月清欠率");
                                    return false;
                                }
                            }
                        });
                        if (Flag) {
                            return;
                        }
                    }
                    $.tool.DataPost('Budget', 'IncomeManage_SaveArrearsPlanClearUpSetting', $('#form1').serialize(),
                        function Init() {
                        },
                        function callback(data) {
                            if (data == "true") {
                                HDialog.Close("true");
                            } else {
                                HDialog.Info(data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            });

            //加载页面数据
            function LoadData() {
                //修改的情况才加载数据
                $.tool.DataGet('Budget', 'IncomeManage_GetArrearsPlanClearUpSetting', "ArrearsRecoveryPlanID=" + $('#ArrearsRecoveryPlanID').val() + "&CommID=" + $('#CommID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                //加载easyui控件加载不出来的值
                                $('#IID').val(varObjects[0].IID)
                                $('#ClearUpRateType').combobox("setValue", varObjects[0].ClearUpRateType);
                                $('#ClearUpRate1Y').numberbox("setValue", varObjects[0].ClearUpRate1Y);
                                $('#ClearUpRate2Y').numberbox("setValue", varObjects[0].ClearUpRate2Y);
                                $('#ClearUpRate3Y').numberbox("setValue", varObjects[0].ClearUpRate3Y);
                                $('#ClearUpRate4Y').numberbox("setValue", varObjects[0].ClearUpRate4Y);
                                $('#ClearUpRate5Y').numberbox("setValue", varObjects[0].ClearUpRate5Y);
                                $('#ClearUpRate6Y').numberbox("setValue", varObjects[0].ClearUpRate6Y);
                                $('#ClearUpRate7Y').numberbox("setValue", varObjects[0].ClearUpRate7Y);
                                $('#ClearUpRate8Y').numberbox("setValue", varObjects[0].ClearUpRate8Y);
                                $('#ClearUpRate9Y').numberbox("setValue", varObjects[0].ClearUpRate9Y);
                                $('#ClearUpRate10Y').numberbox("setValue", varObjects[0].ClearUpRate10Y);
                                $('#ClearUpRate11Y').numberbox("setValue", varObjects[0].ClearUpRate11Y);
                                $('#ClearUpRate12Y').numberbox("setValue", varObjects[0].ClearUpRate12Y);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //页面初始化
            $(function () {
                //加载费用项目
                var FeesCostDataStr = localStorage.getItem("FeesCostData");
                //设置值为空
                localStorage.setItem("FeesCostData", "");
                var FeesCostData = JSON.parse(FeesCostDataStr);
                //加载费用项目下拉
                $('#FeesCost').combobox({
                    data: FeesCostData.CostData,
                    valueField: 'CostID',
                    textField: 'CostName',
                    editable: false,
                    panelHeight: '140px',
                    width: '142px',
                    multiple: true,
                    onLoadSuccess: function () {
                    }
                });
                LoadData();
            })

        </script>
    </form>
</body>
</html>
