<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketingServiceInfoManage.aspx.cs" Inherits="M_Main.InformationManage.MarketingServiceInfoManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
        body {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
    <form id="Marketforms" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">物业区域</td>
                <td class="TdContentSearch">
                    <input type="text" id="PropertyArea" class="easyui-validatebox" data-options="required:true" name="PropertyArea" runat="server" readonly="readonly" />
                    <input type="hidden" id="MID" name="MID" runat="server" />
                </td>
                <td class="TdTitle">项目名称</td>
                <td class="TdContentSearch">
                    <input type="text" id="ProjectName" class="easyui-validatebox" data-options="required:true" name="ProjectName" runat="server" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">项目开发主体</td>
                <td class="TdContentSearch">
                    <select name="DevelopmentSubject" id="DevelopmentSubject" runat="server">
                        <option value="集团开发">集团开发</option>
                        <option value="合作开发">合作开发</option>
                        <option value="外拓">外拓</option>
                    </select>
                </td>
                <td class="TdTitle">项目状态</td>
                <td class="TdContentSearch">
                    <select name="ProjectStatus" id="ProjectStatus" runat="server">
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">NC编码</td>
                <td class="TdContentSearch">
                    <input runat="server" id="NCSystemNumber" name="NCSystemNumber" />
                </td>
                <td class="TdTitle">NC账套全称</td>
                <td class="TdContentSearch">
                    <input runat="server" id="NCSystemAccount" name="NCSystemAccount" />
                </td>
                
            </tr>
            <tr>
                <td class="TdTitle">合同类型</td>
                <td class="TdContentSearch">
                    <select runat="server" id="ContractType" name="ContractType">
                        <option value="案场管理服务合同">案场管理服务合同</option>
                        <option value="开荒清洁服务合同">开荒清洁服务合同</option>
                        <option value="绿化养护服务合同">绿化养护服务合同</option>
                        <option value="其他特约服务合同">其他特约服务合同</option>
                    </select>
                </td>
                <td class="TdTitle">合同主要内容</td>
                <td class="TdContentSearch">
                    <select runat="server" id="ContractDetails" name="ContractDetails">
                        <option value="销售案场顾问服务">销售案场顾问服务</option>
                        <option value="开荒清洁服务">开荒清洁服务</option>
                        <option value="绿化养护服务">绿化养护服务</option>
                        <option value="物业管理顾问服务">物业管理顾问服务</option>
                        <option value="其他">其他</option>
                    </select>
                    <input type="text" name="Details" id="Details" disabled="disabled" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">甲方</td>
                <td class="TdContentSearch">
                    <input runat="server" id="PartyA" class="easyui-validatebox" data-options="required:true" name="PartyA" />
                </td>
                <td class="TdTitle">乙方</td>
                <td class="TdContentSearch">
                    <input runat="server" id="PartyB" class="easyui-validatebox" data-options="required:true" name="PartyB" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">收费模式</td>
                <td class="TdContentSearch">
                    <select name="ChargeMode" id="ChargeMode" runat="server">
                    </select>
                </td>
                <td class="TdTitle">顾问服务费收费标准</td>
                <td class="TdContentSearch">
                    <input runat="server" id="ConsultancyFee" disabled="disabled" class="easyui-numberbox" precision="2" name="ConsultancyFee" />
                    元/人/月
                </td>
            </tr>
            <tr>
                <td class="TdTitle">驻场管理人员人数</td>
                <td class="TdContentSearch">
                    <input runat="server" id="ResidentPeple" disabled="disabled" class="easyui-numberbox" name="ResidentPeple" />
                    人
                </td>
                <td class="TdTitle">驻场管理人员费用</td>
                <td class="TdContentSearch">
                    <input runat="server" id="ResidentPepleFee" disabled="disabled" name="ResidentPepleFee" />
                    元/人/月
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同总金额</td>
                <td class="TdContentSearch">
                    <input runat="server" id="ContractTotalAmount" class="easyui-numberbox" precision="2" name="ContractTotalAmount" />
                    元
                </td>
                <td class="TdTitle">案场建筑面积</td>
                <td class="TdContentSearch">
                    <input runat="server" id="CaseBuildArea" class="easyui-numberbox" precision="2" name="CaseBuildArea" />
                    ㎡
                </td>
            </tr>
            <tr>
                <td class="TdTitle">开荒清洁面积</td>
                <td class="TdContentSearch">
                    <input runat="server" id="WastelandCleanArea" class="easyui-numberbox" precision="2" name="WastelandCleanArea" />
                    ㎡
                </td>
                <td class="TdTitle">绿化养护面积</td>
                <td class="TdContentSearch">
                    <input runat="server" id="GreenConservationArea" class="easyui-numberbox" precision="2" name="GreenConservationArea" />
                    ㎡
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同起始日期</td>
                <td class="TdContentSearch">
                    <input runat="server" id="ContractStartDate" class="easyui-validatebox" data-options="required:true" onclick="WdatePicker()" name="ContractStartDate" />
                </td>
                <td class="TdTitle">合同终止日期</td>
                <td class="TdContentSearch">
                    <input runat="server" id="ContractTerminateDate" class="easyui-validatebox" data-options="required:true" onclick="WdatePicker()" name="ContractTerminateDate" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">合同签订日期</td>
                <td class="TdContentSearch">
                    <input runat="server" id="ContractDateSign" class="easyui-validatebox" data-options="required:true" onclick="WdatePicker()" name="ContractDateSign" />
                </td>
                <td class="TdTitle">合同履行状态</td>
                <td class="TdContentSearch">
                    <select id="ContractStatus" runat="server" name="ContractStatus">
                        <option value="已结束">已结束</option>
                        <option value="正在履行">正在履行</option>
                        <option value="新签订未履行">新签订未履行</option>
                        <option value="未签订">未签订</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td colspan="3" class="TdContentSearch">
                    <textarea runat="server" style="width: 75%" rows="5" name="Remarks" id="Remarks"></textarea>
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
                        <input class="button" id="btnSave" type="button" value="保存" onclick="javascript: if (CheckAllData() == false) return false;" name="btnSave" runat="server" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
<script>
    $(function () {

        if ($("#Details").val() != "") {
            $("#Details").attr("disabled", false);
        }
        if ($("#ChargeMode option:selected").val() == "酬金制") {
            $("#ConsultancyFee").numberbox("enable");
            $("#ResidentPeple").numberbox("enable");
            $("#ResidentPepleFee").attr("disabled", false);
        }

        $("#btnReturn").click(function () {
            close("1");
        })

        //保存
        $("#btnSave").click(function () {
            $.tool.DataPostChk('Marketforms', 'MarketingService', 'Insert', $('#Marketforms').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    var data = _Data.split("|");
                    if (data[0] == "true") {
                        HDialog.Info(data[1]);
                        close("1");
                    }
                    else {
                        HDialog.Info(data[1]);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                })
        });

        $("#ChargeMode").change(function () {
            if ($("#ChargeMode option:selected").val() == "酬金制") {
                $("#ConsultancyFee").numberbox("enable");
                $("#ResidentPeple").numberbox("enable");
                $("#ResidentPepleFee").attr("disabled", false);
            }
            else {
                $("#ConsultancyFee").numberbox("disable");
                $("#ResidentPeple").numberbox("disable");
                $("#ResidentPepleFee").attr("disabled", true);
            }
        });
        $("#ContractDetails").change(function () {
            if ($("#ContractDetails option:selected").val() == "其他") {
                $("#Details").attr("disabled", false);
            }
            else {
                $("#Details").attr("disabled", true);
            }
        });
    })

    function CheckAllData() {
        return $("#Marketforms").form('validate');
    }

    function close(callparm) {
        HDialog.Close(callparm);
    }
</script>
