<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractImplementDetail.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractImplementDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="/HM/M_Main/UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="/HM/M_Main/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同执行详细页面</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link href="../../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
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
        input {
            height: 28px;
            line-height: 28px;
        }

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

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }
    </style>
</head>
<body>
    <form id="mainForm" runat="server">
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input id="OpType" type="hidden" name="OpType" runat="server">
        <input id="CommID" type="hidden" name="CommID" runat="server">
        <input id="ID" type="hidden" name="ID" runat="server">
        <input id="ContID" type="hidden" name="ContID" runat="server">
        <input id="ContractID" type="hidden" name="ContractID" runat="server">
        <input id="AuditStatus" type="hidden" name="AuditStatus" value="未启动" runat="server">
        <div style="padding: 20px 5px; overflow: auto;" id="Content">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>项目名称</span></td>
                    <td class="text">
                        <input type="text" id="CommName" name="CommName" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                    </td>
                    <td class="title"><span>合同编号</span></td>
                    <td class="text">
                        <input type="text" id="ContractSign" name="ContractSign" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                        <input id="ContractType" type="hidden" name="ContractType" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>计算方式</span></td>
                    <td class="text">
                        <input id="CalculationMethodName" name="CalculationMethodName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCalculationMethod();}"
                            runat="server" />
                        <input type="hidden" id="ChargeCalculation" name="ChargeCalculation" runat="server" />
                        <input type="hidden" id="CalculationMethod" name="CalculationMethod" runat="server" />
                        <input type="hidden" id="DelinType" name="DelinType" runat="server" />
                        <input type="hidden" id="DelinDay" name="DelinDay" runat="server" />
                        <input type="hidden" id="DelinRates" name="DelinRates" runat="server" />
                        <input type="hidden" id="DelinDelay" name="DelinDelay" runat="server" />
                    </td>
                    <td class="title"><span>计费周期(月)</span></td>
                    <td class="text">
                        <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>计费标准(元)</span></td>
                    <td class="text">
                        <input type="text" id="ContPrice" name="ContPrice" class="easyui-textbox ClassDisable" readonly="readonly" runat="server" />
                    </td>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input type="text" id="CustName" name="CustName" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                        <input type="hidden" id="CustID" name="CustID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input type="text" id="RoomSign" name="RoomSign" class="easyui-textbox ClassDisable" readonly="readonly" runat="server" />
                        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
                    </td>
                    <td class="title"><span>点位编号</span></td>
                    <td class="text">
                        <input type="text" id="PointNumber" name="PointNumber" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                        <input type="hidden" id="PointID" name="PointID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>费用项目</span></td>
                    <td class="text">
                        <input type="text" id="CostName" name="CostName" class="easyui-textbox ClassDisable" runat="server" readonly="readonly" />
                        <input type="hidden" id="CostID" name="CostID" runat="server" />
                    </td>
                    <td class="title"><span>开始时间</span></td>
                    <td class="text">
                        <input type="text" id="BeginDate" name="BeginDate" class="easyui-datebox" runat="server"
                            data-options="editable:false,required:true,onSelect:BeginDateSelect" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>结束时间</span></td>
                    <td class="text">
                        <input type="text" id="EndDate" name="EndDate" class="easyui-datebox" runat="server"
                            data-options="editable:false,required:true" />
                    </td>
                    <td class="title"><span>应收时间</span></td>
                    <td class="text">
                        <input type="text" id="DueDate" name="DueDate" class="easyui-datebox" runat="server"
                            data-options="editable:false,required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>计费数量</span></td>
                    <td class="text">
                        <input type="text" id="ChargeNumber" name="ChargeNumber" class="easyui-numberbox" data-options="min:0,precision:2,onChange:ChargeNumberChange" disabled="disabled" runat="server" />
                        <input type="hidden" name="HidChargeNumber" id="HidChargeNumber" runat="server" />
                    </td>
                    <td class="title"><span>本期应收金额</span></td>
                    <td class="text">
                        <input type="text" id="Amount" name="Amount" class="easyui-numberbox" data-options="min:0,precision:2,onChange:AmountChage" disabled="disabled" runat="server" />
                        <input type="hidden" name="HidAmount" id="HidAmount" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>执行说明</span></td>
                    <td class="text" colspan="3">
                        <input type="text" id="Remark" name="Remark" class="easyui-textbox" runat="server" data-options="width:'82%',height:'40px',multiline:true" />
                    </td>
                </tr>
            </table>
            <!-- 流程内容 -->
            <div id="OAFlow" style="height: auto; margin: 0px auto;">
                <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
            </div>
            <div style="text-align: center; width: 100%; padding: 5px 0;">
                <input class="button" type="button" id="BtnClose" value="关闭" />
                <input class="button" id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
                <input class="button" id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
                <input class="button" id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
                <input class="button" id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
                <input class="button" id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
                <input class="button" id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
            </div>
        </div>
    </form>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            $('#Content').css("height", $(window).height() + 'px');
            //注册点击事件
            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

            if ($('#CalculationMethod').val() == "5") {
                //按实际发生额
                $('#ChargeNumber').numberbox({
                    disabled: true,
                    required: false,
                    value: ''
                });
                $('#HidChargeNumber').val("");
                $('#Amount').numberbox({
                    disabled: false,
                    required: true
                });
            } else if ($('#CalculationMethod').val() == "4") {
                //按数量*单价
                $('#ChargeNumber').numberbox({
                    disabled: false,
                    required: true
                });
                $('#Amount').numberbox({
                    disabled: true,
                    required: false
                });
            }
            //设置背景色
            $('.ClassDisable').each(function () {
                $(this).textbox('textbox').css('opacity', '0.5');
                $(this).textbox('textbox').css('background', '#E3E3E3');
            })

            if ($('#AuditStatus').val() == "审核中" || $('#AuditStatus').val() == "已审核" || $('#AuditStatus').val() == "审核不通过") {
                $(".easyui-textbox").textbox({ disabled: true });
                $(".easyui-numberbox").numberbox({ disabled: true });
            }
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                $.tool.pageLoading();
                //保存和送审的时候才验证
                if ($(this).attr("id") != "BtnSaveStartWorkFlow" && $(this).attr("id") != "BtnSave") {
                    $.tool.pageUnLoading();
                    return true;
                }
                if (IsSubmitFlag == false) {
                    $.messager.alert('温馨提示', "5秒内不要重复点击");
                    $.tool.pageUnLoading();
                    return false;
                }
                IsSubmitFlag = false;
                setTimeout(function () {
                    IsSubmitFlag = true
                }, 5000);
                var isValid = $("#mainForm").form('validate');
                if (isValid == true) {
                    if (ClientClick()) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                            $.messager.alert('温馨提示', "请选择审批流程");
                            $.tool.pageUnLoading();
                            return false;
                        }
                        return true;
                    } else {
                        $.tool.pageUnLoading();
                        return false;
                    }
                }
                else {
                    $.tool.pageUnLoading();
                    return false;
                }
            });

            //datebox 添加清空
            var buttons = $.extend([], $.fn.datebox.defaults.buttons);
            buttons.splice(1, 0, {
                text: '清空',
                handler: function (target) {
                    $(target).datebox("setValue", "");
                }
            });
            $('.easyui-datebox').datebox({
                buttons: buttons
            });


        });

        //选择计算方式
        function SelCalculationMethod() {
            var param = { "ContractID": $("#ContractID").val(), "CommID": $('#CommID').val(), "ChargeCalculation": "2" };
            LayerDialog.OpenWin('800', '400', '../DiversifiedManage/Dialog/SelContractSetting.aspx?' + $.param(param), "选择合同标准", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#ChargeCalculation').val("2");
                    $('#CalculationMethod').val(data.CalculationMethod);
                    if (data.CalculationMethod == "5") {
                        $("#CalculationMethodName").textbox("setValue", "按实际发生额");
                        //本期应收金额直接输入金额   计费数量不填
                        $('#ChargeNumber').numberbox({
                            disabled: true,
                            required: false,
                            value: ''
                        });
                        $('#Amount').numberbox({
                            disabled: false,
                            required: true,
                            value: ''
                        });
                    } else if (data.CalculationMethod == "4") {
                        $("#CalculationMethodName").textbox("setValue", "按数量*单价");
                        // 计费数量必填  本期应收金额=计费数量*计费标准
                        $('#ChargeNumber').numberbox({
                            disabled: false,
                            required: true,
                            value: ''
                        });
                        $('#Amount').numberbox({
                            disabled: true,
                            required: false,
                            value: ''
                        });

                    }
                    $('#HidChargeNumber').val("");
                    $('#HidAmount').val("");
                    $('#ContPeriod').textbox("setValue", data.ContPeriod);
                    $('#ContPrice').textbox("setValue", data.ContPrice);
                    $('#CustName').textbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomSign').textbox("setValue", data.RoomSign);
                    $('#RoomID').val(data.RoomID);
                    $('#PointNumber').textbox("setValue", data.PointNumber);
                    $('#PointID').val(data.PointID);
                    $('#CostName').textbox("setValue", data.CostName);
                    $('#CostID').val(data.CostID);

                    //if (data.BeginDate != "") {
                    //    $("#BeginDate").datebox("setValue", $.dateFormat(data.BeginDate, 'yyyy-MM-dd'))
                    //}
                    //if (data.EndDate != "") {
                    //    $("#EndDate").datebox("setValue", $.dateFormat(data.EndDate, 'yyyy-MM-dd'))
                    //}
                    //if (data.DueDate != "") {
                    //    $("#DueDate").datebox("setValue", $.dateFormat(data.DueDate, 'yyyy-MM-dd'))
                    //}
                    $('#DelinType').val(data.DelinType);
                    $('#DelinDay').val(data.DelinDay);
                    $('#DelinRates').val(data.DelinRates);
                    $('#DelinDelay').val(data.DelinDelay);
                }
            });
        }

        //选择开始时间
        function BeginDateSelect(date) {
            //判断如果没有应收时间就默认应收时间为开始时间
            if ($("#DueDate").datebox("getValue") == "") {
                $("#DueDate").datebox("setValue", $.dateFormat(date, 'yyyy-MM-dd'));
            }
            //判断是否存在结束时间  如果没有结束时间  就默认  默认开始时间+计费标准上的计费周期
            if ($("#EndDate").datebox("getValue") == "") {
                //判断是否存在计费周期
                var ContPeriodVal = $('#ContPeriod').textbox("getValue");
                if (ContPeriodVal != "") {
                    $("#EndDate").datebox("setValue", $.dateFormat(new Date(date).setMonth(new Date(date).getMonth() + parseInt(ContPeriodVal)), 'yyyy-MM-dd'))
                }
            }
        }


        //计费数量 改变
        function ChargeNumberChange(newValue, oldValue) {
            try {
                if (isValueNull(newValue)) {
                    $('#HidChargeNumber').val(newValue);
                    var ContPriceValue = $('#ContPrice').textbox("getValue");
                    var AmountValue = parseFloat(newValue) * parseFloat(ContPriceValue);
                    //设置对应的 本期应收金额
                    $('#Amount').numberbox("setValue", AmountValue);
                } else {
                    $('#HidChargeNumber').val("");
                    $('#Amount').numberbox("setValue", "0.00");
                }
            } catch (e) {
                $('#HidChargeNumber').val("");
                $('#Amount').numberbox("setValue", "0.00");
            }
        }
        function AmountChage(newValue, oldValue) {
            try {
                $('#HidAmount').val(newValue);
            } catch (e) {

            }
        }

        function ClientClick() {
            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            //判断必须要有 合同类别
            if ($('#ContractType').val() == "") {
                $.messager.alert('温馨提示', "请选择合同类别");
                return;
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            $.tool.DataPostJsonAsync('DiversifiedManage', 'GetContractWorkFlow', "ContractType=" + $('#ContractType').val() + "&AuditType=3",
                function Init() {
                },
                function callback(_Data) {
                    if (_Data.result) {
                        FlowId = _Data.data;
                    } else {
                        ErrorMessage = _Data.msg;
                    }
                },
                function _completeCallBack() {
                },
                function errorCallback() {
                });

            if (ErrorMessage != "") {
                $.messager.alert('温馨提示', ErrorMessage);
                return;
            }
            if (FlowId == "") {
                $.messager.alert('温馨提示', "请设置对应合同执行的审核流程");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=1203&biaoshi=1&random=" + Math.random();
            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                if (_Data != '') {
                    var obj = JSON.parse(_Data);
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                }
            });
        }

    </script>
</body>
</html>

