<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpCostItemManage.aspx.cs" Inherits="M_Main.ChargesNew.CorpCostItemManage" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">费用名称
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"
                        id="CostName" name="CostName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">费用性质
                </td>
                <td class="DialogTdContent">
                    <select id="CostType" name="CostType" runat="server" class="easyui-validatebox" data-options="required:true">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">合同违约金</td>
                <td class="DialogTdContent">
                    <input id="DelinType1" name="DelinType" value="0" checked type="radio" runat="server">
                    按
                    <input id="DelinDelay" name="DelinDelay" style="width: 25px;" runat="server" />
                    天之后
                <input id="DelinType2" name="DelinType" value="1" type="radio" runat="server">
                    推迟
                    <input id="DelinMonth" class="Control_ItemInput" style="width: 40px;" name="DelinMonth" runat="server">
                    月按
                    <input style="width: 40px;" id="DelinDay" class="Control_ItemInput"
                        name="DelinDay" runat="server">
                    号开始(日期超过的,从次月计算)
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">合同违约金比率(天)</td>
                <td class="DialogTdContent">
                    <input type="text" id="DelinRates" name="DelinRates" style="width: 50px;"  runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;合同违约金最大值&nbsp;&nbsp;
                    <input type="text" id="MaxDelinRate" name="MaxDelinRate" style="width: 100px;"  runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计费周期</td>
                <td class="DialogTdContent">
                    <select id="ChargeCycle" name="ChargeCycle" runat="server" class="easyui-validatebox" data-options="required:true">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">取舍位数</td>
                <td class="DialogTdContent">
                    <select id="RoundingNum" name="RoundingNum" runat="server" class="easyui-validatebox" data-options="required:true">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">费用类型</td>
                <td class="DialogTdContent">
                    <select id="SysCostSign" name="SysCostSign" runat="server">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">是否包含费项</td>
                <td class="DialogTdContent">
                    <select id="CostBigType" name="CostBigType" runat="server">
                        <option selected></option>
                    </select>
                    (桌面物管费收费率统计是否包含该费项)
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">是否允许输入费用</td>
                <td class="DialogTdContent">
                    <select id="CostGeneType" name="CostGeneType" runat="server">
                        <option selected></option>
                    </select>
                    (是否允许前台收费员直接输入该项费用)
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">是否已封存</td>
                <td class="DialogTdContent">
                    <select id="IsSealed" name="IsSealed" runat="server">
                        <option selected="selected" value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">费用序号</td>
                <td class="DialogTdContent">
                    <input type="text" id="CostSNum" name="CostSNum" runat="server" class="easyui-validatebox" data-options="required:true,validType:'digital'" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">开票类别
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" 
                        id="BillType" name="BillType" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">开票代码
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" 
                        id="BillCode" name="BillCode" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 2px;"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <input id="OpType" type="hidden" name="OpType" runat="server">
        <input id="CorpCostID" type="hidden" name="CorpCostID" runat="server">
        <input id="CostCode" type="hidden" name="CostCode" runat="server">
        <input type="hidden" id="ChkRoot" name="ChkRoot" value="0" runat="server" />
        <input type="hidden" id="DuePlotDate" name="DuePlotDate" runat="server" />
        <script type="text/javascript">
            //$("#RoundingNum").val(2);
            //$("#RoundingNum").attr("disabled", "disabled");
            $("#BtnSave").click(function () {
                if (parseFloat($('#DelinRates').val()) < 0) {
                    HDialog.Info('合同违约金比率应大于0');
                }
                else {
                    $("#RoundingNum").removeAttr("disabled");
                    $.tool.DataPostChk('frmForm', 'CostItem', 'Save', $('#frmForm').serialize(),
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
                }
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
        </script>
    </form>
</body>
</html>
