<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommissionStanManage.aspx.cs" Inherits="M_Main.ChargesNew.CommissionStanManage" %>

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
    <script src="../jscript/DatePicker/WdatePicker.js"></script>

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
                <td colspan="4"><span style="color: blue;">费用信息</span><hr style="border: none; border-top: 1px solid #cccccc;" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">管理项目
                </td>
                <td class="DialogTdSearchContent" colspan="3">
                    <input type="text" class="easyui-searchbox" searcher="SelComm" data-options="required:true"
                        id="CommName" name="CommName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">费用项目
                </td>
                <td class="DialogTdSearchContent">
                    <input type="text" data-options="required:true" id="CostNameStan" name="CostNameStan" class="easyui-searchbox" searcher="SelCostName" runat="server" />
                </td>
                <td class="DialogTdTitle">收费标准
                </td>
                <td class="DialogTdSearchContent">
                    <input type="text" class="easyui-searchbox" searcher="SelStan" id="StanName" name="StanName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计算方式
                </td>
                <td class="DialogTdCommonContent">
                    <input type="text" class="easyui-validatebox" id="StanFormulaName" name="StanFormulaName" runat="server" style="border: 1px solid #cccccc; width: 170px;" readonly="true" />
                    按
                    <input style="border: 1px solid #cccccc; width: 25px;" type="text" class="easyui-validatebox" id="ChargeCycle" name="ChargeCycle" runat="server" readonly="true" />
                    月
                </td>
                <td class="DialogTdTitle">计算标准
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="StanAmount" name="StanAmount" runat="server" readonly="true" />
                </td>
            </tr>
            <tr>
                <td colspan="4"><span style="color: blue;">提取设置</span><hr style="border: none; border-top: 1px solid #cccccc;" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">提取费项
                </td>
                <td class="DialogTdSearchContent">
                    <input type="text" class="easyui-searchbox" searcher="SelCommissionCostName" data-options="required:true" id="CostName" name="CostName" runat="server" />
                </td>
                <td class="DialogTdTitle">提取方式
                </td>
                <td class="DialogTdContent">
                    <select id="ExtractWay" name="ExtractWay" runat="server">
                        <option value="0">在费项内提取</option>
                        <option value="1">在费项外新增</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">提取标准
                </td>
                <td class="DialogTdContent">
                    <asp:DropDownList ID="ExtractStan" runat="server"></asp:DropDownList>
                </td>
                <td class="DialogTdTitle">提取值
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ExtractAmount" name="ExtractAmount" runat="server" /><span id="tip" style="color: red"> 元</span>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">开始时间
                </td>
                <td class="DialogTdContent">
                    <input id="ExtractBeginDate" class="easyui-validatebox Wdate" data-options="required:true"
                        onclick="WdatePicker()" type="text" maxlength="50" name="ExtractBeginDate"
                        runat="server" />
                </td>
                <td class="DialogTdTitle">结束时间
                </td>
                <td class="DialogTdContent">
                    <input id="ExtractEndDate" class="Wdate"
                        onclick="WdatePicker()" type="text" maxlength="50" name="ExtractEndDate"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">提取依据
                </td>
                <td colspan="3" class="DialogTdContent_2Col">
                    <select id="ExtractReason" name="ExtractReason" runat="server"></select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">提取说明
                </td>
                <td colspan="3" class="DialogTdContent_2Col">
                    <input type="text" class="easyui-validatebox" id="ExtractStanExplain" name="ExtractStanExplain" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; padding-top: 10px;">
                    <input type="button" class="button" value="保存" id="BtnSave" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>

        <input id="OpType" type="hidden" name="OpType" runat="server" />
        <input id="CommID" type="hidden" name="CommID" runat="server" />
        <input id="CSID" type="hidden" name="CSID" runat="server" />
        <input id="CorpCostID" type="hidden" name="CorpCostID" runat="server" />
        <input id="OldCorpCostID" type="hidden" name="OldCorpCostID" runat="server" />
        <input id="CorpCostIDTemp" type="hidden" name="CorpCostIDTemp" runat="server" />
        <input id="CorpStanID" type="hidden" name="CorpStanID" runat="server" />
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $("#ExtractStan").change(function () {
                    var val = $(this).val();
                    if (val == 1) {
                        $("#tip").html("%");
                    } else {
                        $("#tip").html("元");
                    }
                });
                if ($("#ExtractStan").val()=="1") {
                     $("#tip").html("%");
                }
            });


            function SelComm() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelComm.aspx', '管理项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = JSON.parse(_Data);
                        $("#CommID").val(arrRet.id);
                        $("#CommName").searchbox("setValue", arrRet.name);
                    }
                });
            }

            function SelCommissionCostName() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelCorpCostItem.aspx', '提取费项选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#CostName").searchbox("setValue", Obj.text);
                        $("#CorpCostID").val(Obj.attributes.CorpCostID);
                    }
                });
            }

            function SelCostName() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelCorpCostItem.aspx', '费用项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#CostNameStan").searchbox("setValue", Obj.text);
                        $("#CorpCostIDTemp").val(Obj.attributes.CorpCostID);
                        $("#OldCorpCostID").val(Obj.attributes.CorpCostID);

                        $("#StanAmount").val("");
                        $("#StanFormulaName").val("");
                        $("#ChargeCycle").val("");
                        $("#CorpStanID").val("");
                        $("#StanName").searchbox("setValue", "");
                    }
                });
            }

            function SelStan() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelCorpStan.aspx?CorpCostID=' + $("#CorpCostIDTemp").val(), '费用标准选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        $("#StanAmount").val(Obj.StanAmount);
                        $("#StanFormulaName").val(Obj.StanFormulaName);
                        $("#ChargeCycle").val(Obj.ChargeCycle);
                        $("#CorpStanID").val(Obj.CorpStanID);
                        $("#StanName").searchbox("setValue", Obj.StanName);
                    }
                });
            }

            $("#BtnSave").click(function () {

                if ($("#ExtractBeginDate").val() == "") {
                    HDialog.Info("开始时间不能为空");
                    return;
                }

                $.tool.DataPostChk('frmForm', 'CostItemExtractSet', 'CheckIsSet', "CorpCostID=" + $("#OldCorpCostID").val() + "&ExtractCorpCostID=" + $("#CorpCostID").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "True") {
                            $.tool.DataPostChk('frmForm', 'CommissionStan', 'Save', $('#frmForm').serialize(),
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
                        } else {
                            HDialog.Info("提取费项与费用项目不匹配!!!");
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

            $(document).ready(
                function () {
                    if ($("#OpType").val() == "edit") {
                        $("#CommName").searchbox("readonly", true);
                        $("#CostNameStan").searchbox("readonly", true);
                        $("#StanName").searchbox("readonly", true);

                    }
                }

            )

        </script>

    </form>
</body>
</html>
