<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostControlSettings.aspx.cs" Inherits="M_Main.CostManageNew.CostControlSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管控模型设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" />
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/PersonDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <link href="../css/button.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .Td {
            height: 16px;
            width: 23%;
            text-align: right;
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .TContent {
            height: 16px;
            width: 22%;
            margin-left: 15px;
            padding-left: 15px;
            text-align: left;
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .spanTitle {
        }

        .fontSizes {
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .divHe {
            height: 10px;
        }

        .ProjectStatePadding {
            padding-right: 35px;
        }
    </style>
</head>
<body style="padding-left: 2px; padding-right: 2px; margin: 0px; overflow-x: hidden;">
    <form id="FrmForm" runat="server">
        <div style="height: 10px;"></div>
        <div class="panel panel-primary" style="width: 90%; margin: 0px auto; text-align: center;">
            <div style="height: 10px;"></div>

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">成本系统是否检测预算</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="ProjectStatePadding">
                                <input name="IsCheckBudget" type="radio" value="1" />&nbsp;是
                            </label>
                            <label class="ProjectStatePadding">
                                <input name="IsCheckBudget" type="radio" value="0" />&nbsp;否
                            </label>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">资金计划申报可选方式</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px; text-align: center;"></td>
                    </tr>
                    <tr>
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="ProjectStatePadding">
                                <input id="ChkPlan2" name="PlanWay" type="checkbox" value="NoContract" />&nbsp;新增无合同费用
                            </label>
                            <label class="ProjectStatePadding">
                                <input id="ChkPlan1" name="PlanWay" type="checkbox" value="HaveContract" />&nbsp;选择合同费用
                            </label>
                            <label class="ProjectStatePadding">
                                <input id="ChkPlan3" name="PlanWay" type="checkbox" value="WorkPlan" />&nbsp;选择工作计划费用
                            </label>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">报账付款请付可选方式</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px; text-align: center;"></td>
                    </tr>
                    <tr>
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="ProjectStatePadding">
                                <input id="ChkPay2" name="PayWay" type="checkbox" value="NoContract" />&nbsp;新增无合同费用
                            </label>
                            <label class="ProjectStatePadding">
                                <input id="ChkPay1" name="PayWay" type="checkbox" value="HaveContract" />&nbsp;选择合同费用
                            </label>
                            <label class="ProjectStatePadding">
                                <input id="ChkPay3" name="PayWay" type="checkbox" value="BudgetPlan" />&nbsp;选择资金计划费用
                            </label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">合同编号自动生成方式</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="ProjectStatePadding">
                                <input name="IsCheckContract" type="radio" value="1" />&nbsp;是
                            </label>
                            <label class="ProjectStatePadding">
                                <input name="IsCheckContract" type="radio" value="0" />&nbsp;否&nbsp;&nbsp;&nbsp;&nbsp;
                                自动生成合同编号(生成方式:前缀 
                                <input style="width: 50px;" id="ContractPrefix" name="ContractPrefix" type="text" value="" />-年月-流水号(六位))
                            </label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">到期预警天数</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label>合同到期预警天数：</label><input type="text" id="ContractWarningDays" name="ContractWarningDays" class="easyui-numberbox" data-options="min:0,precision:0" style="width: 140px;" />
                            <label>合同付款预警天数：</label><input type="text" id="PayWarningDays" name="PayWarningDays" class="easyui-numberbox" data-options="min:0,precision:0" style="width: 140px;" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 45px; line-height: 45px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input name="BtnSave" type="button" id="BtnSave" class="button" value="保存" onclick="Save();" />
        </div>
    </form>
    <script type="text/javascript">
        function getRadioButtonCheckedValue(tagNameAttr) {
            var radio_tag = document.getElementsByName(tagNameAttr);
            for (var i = 0; i < radio_tag.length; i++) {
                if (radio_tag[i].checked) {
                    var checkvalue = radio_tag[i].value;
                    return checkvalue;
                }
            }
        }
        function Save() {
            if (getRadioButtonCheckedValue("IsCheckContract") == '1' && $("#ContractPrefix").val() == '') {
                HDialog.Info("请填写合同编号生成前缀!");
                return;
            } else if (getRadioButtonCheckedValue("IsCheckContract") != '1') {
                document.getElementById("ContractPrefix").value = "";
            }
            $.tool.DataGet('CsCost', 'SaveCostControlSettings', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("保存成功");
                    } else {
                        HDialog.Info("保存失败");
                    }
                    Bind();
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        function Bind() {
            $.tool.DataGet('CsCost', 'GetCostControlSettings', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        if (varObjects[0].IsCheckBudget)
                            $("input[name='IsCheckBudget']").eq(0).click();
                        else
                            $("input[name='IsCheckBudget']").eq(1).click();

                        if (varObjects[0].IsCheckContract)
                            $("input[name='IsCheckContract']").eq(0).click();
                        else
                            $("input[name='IsCheckContract']").eq(1).click();

                        document.getElementById("ContractPrefix").value = varObjects[0].ContractPrefix;

                        var plan = varObjects[0].PlanWay;
                        plan = '-' + plan;
                        document.getElementById("ChkPlan1").checked = (plan.indexOf('HaveContract') > 0);
                        document.getElementById("ChkPlan2").checked = (plan.indexOf('NoContract') > 0);
                        document.getElementById("ChkPlan3").checked = (plan.indexOf('WorkPlan') > 0);
                        var pay = varObjects[0].PayWay;
                        pay = '-' + pay;
                        document.getElementById("ChkPay1").checked = (pay.indexOf('HaveContract') > 0);
                        document.getElementById("ChkPay2").checked = (pay.indexOf('NoContract') > 0);
                        document.getElementById("ChkPay3").checked = (pay.indexOf('BudgetPlan') > 0);
                        //合同预警天数
                        if (varObjects[0].ContractWarningDays != "") {
                            $('#ContractWarningDays').numberbox("setValue", varObjects[0].ContractWarningDays);
                        }
                        //合同付款预警天数
                        if (varObjects[0].PayWarningDays != "") {
                            $('#PayWarningDays').numberbox("setValue", varObjects[0].PayWarningDays);
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        $("input[name='IsCheckContract']").eq(1).click();
        Bind();
    </script>
</body>
</html>
