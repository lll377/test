<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Renting.Contract.Royalty.Edit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="/HM/M_Main/UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="/HM/M_Main/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-租赁合同-合同提成详细页面</title>
    <link href="/HM/M_Main/css/base.css" rel="stylesheet" />
    <link href="/HM/M_Main/css/button.css" rel="stylesheet" />
    <link href="/HM/M_Main/css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />

    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/format.js"></script>
    <style type="text/css">
        fieldset input {
            width: 75%;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;" runat="server">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">合同提成信息</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">客户名称</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="CustName" name="CustName" class="easyui-textbox" runat="server" data-options="disabled:true" />
                    <input type="hidden" id="CustID" name="CustID" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">合同编号</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContractSign" name="ContractSign" class="easyui-textbox" runat="server" data-options="disabled:true" />
                    <input type="hidden" id="ContractType" name="ContractType" runat="server" />
                    <input type="hidden" name="ContractID" id="ContractID" runat="server" />
                    <input type="hidden" name="ContID" id="ContID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计算方式</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="CalculationMethodName" name="CalculationMethodName" class="easyui-textbox" data-options="prompt:'请单击右侧\'放大镜\'按钮进行操作!',editable:false,tipPosition:'bottom',required:true,multiline:false,
                                buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelSetting();}" runat="server" />
                    <input type="hidden" id="ChargeCalculation" name="ChargeCalculation" runat="server" />
                    <input type="hidden" id="CalculationMethod" name="CalculationMethod" runat="server" />
                    <input type="hidden" id="DelinType" name="DelinType" runat="server" />
                    <input type="hidden" id="DelinDay" name="DelinDay" runat="server" />
                    <input type="hidden" id="DelinRates" name="DelinRates" runat="server" />
                    <input type="hidden" id="DelinDelay" name="DelinDelay" runat="server" />
                    <input type="hidden" name="CommID" id="CommID" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">计费周期(月)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ContPeriod" name="ContPeriod" class="easyui-textbox" runat="server" data-options="disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">保底金额(元/计费周期)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="GuaranteeAmount" name="GuaranteeAmount" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">提成比例(%)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BusinessRoyaltyRatio" name="BusinessRoyaltyRatio" class="easyui-textbox" data-options="disabled:true" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">房屋编号</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="disabled:true" runat="server" />
                    <input type="hidden" id="RoomID" name="RoomID" runat="server" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">费用项目</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="CostName" name="CostName" class="easyui-textbox" data-options="disabled:true" runat="server" />
                    <input type="hidden" id="CostID" name="CostID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">开始时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BeginDate" name="BeginDate" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true,onChange:CalcReceivableGuaranteeAmount" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">结束时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="EndDate" name="EndDate" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true,onChange:CalcReceivableGuaranteeAmount" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">应收时间</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="DueDate" name="DueDate" class="easyui-datebox" runat="server"
                        data-options="editable:false,required:true" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">实际营业收入(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="BusinessIncome" name="BusinessIncome" class="easyui-numberbox"
                        data-options="min:0,precision:2,required:true,onChange:BusinessIncomeChange" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">计提营业收入(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="EstimatedIncome" name="EstimatedIncome" class="easyui-numberbox" runat="server"
                        data-options="required:true,min:0,precision:2,onChange:EstimatedIncomeChange" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">应收保底金额(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ReceivableGuaranteeAmount" name="ReceivableGuaranteeAmount" class="easyui-numberbox" runat="server"
                        data-options="min:0,precision:2,required:false,disabled:true,onChange:ReceivableGuaranteeAmountChange" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">应收提成金额(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="ReceivableRoyaltyAmount" name="ReceivableRoyaltyAmount" class="easyui-textbox" runat="server"
                        data-options="required:false,disabled:true,onChange:ReceivableGuaranteeAmountChange" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">本期应收金额(元)</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="Amount" name="Amount" class="easyui-textbox" runat="server"
                        data-options="required:false,disabled:true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">提成说明</label>
                <div class="col-sm-10 col-xs-10">
                    <input id="Remark" name="Remark" class="easyui-textbox"
                        data-options="required:false,tipPosition:'bottom',width:'92%',height:'50px',multiline:true" runat="server" />
                </div>
            </div>
        </fieldset>
        <!-- 流程内容 -->
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input class="button" type="button" id="BtnClose" value="关闭" />
            <input class="button" id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input class="button" id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input class="button" id="btnJump" type="submit" value="跳过" onserverclick="btnJump_ServerClick" runat="server" />
            <input class="button" id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input class="button" id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input class="button" id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input class="button" id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" name="ID" id="ID" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input id="AuditStatus" type="hidden" name="AuditStatus" value="未启动" runat="server">
        <input id="GuaranteeAmountCollectionWay" type="hidden" name="GuaranteeAmountCollectionWay" runat="server">
        <input id="BusinessRoyaltyRaiseAmount" type="hidden" name="BusinessRoyaltyRaiseAmount" runat="server">
    </form>
    <script type="text/javascript">


        //选择合同设置的标准
        function SelSetting() {
            var param = { "ContractID": $("#ContractID").val(), "CommID": $('#CommID').val(), "ChargeCalculation": "2" };
            LayerDialog.OpenWin('800', '400', '/HM/M_Main/Renting/Dialog/ContractSettingSelect.aspx?' + $.param(param), "选择租赁合同标准", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $('#ChargeCalculation').val("2");//计费方式
                    $('#CalculationMethod').val(data.CalculationMethod); //计算方式
                    if (data.CalculationMethod == "6") {
                        $("#CalculationMethodName").textbox("setValue", "按保底+提成");
                    } else if (data.CalculationMethod == "5") {
                        $("#CalculationMethodName").textbox("setValue", "按提成");
                    }
                    $('#ContPeriod').textbox("setValue", data.ContPeriod); //计费周期(月)
                    $('#GuaranteeAmount').textbox("setValue", data.GuaranteeAmount);//保底金额
                    $('#BusinessRoyaltyRatio').textbox("setValue", data.BusinessRoyaltyRatio);//提成比例
                    //客户
                    $('#CustName').textbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    //房屋
                    $('#RoomSign').textbox("setValue", data.RoomSign);
                    $('#RoomID').val(data.RoomID);
                    //费项
                    $('#CostName').textbox("setValue", data.CostName);
                    $('#CostID').val(data.CostID);
                    //项目
                    $('#CommID').val(data.CommID);
                    //if (data.BeginDate != "") {
                    //    $("#BeginDate").datebox("setValue", $.dateFormat(data.BeginDate, 'yyyy-MM-dd'))
                    //}
                    //if (data.EndDate != "") {
                    //    $("#EndDate").datebox("setValue", $.dateFormat(data.EndDate, 'yyyy-MM-dd'))
                    //}
                    //if (data.DueDate != "") {
                    //    $("#DueDate").datebox("setValue", $.dateFormat(data.DueDate, 'yyyy-MM-dd'))
                    //}
                    //违约金信息
                    $('#DelinType').val(data.DelinType);
                    $('#DelinDay').val(data.DelinDay);
                    $('#DelinRates').val(data.DelinRates);
                    $('#DelinDelay').val(data.DelinDelay);

                    //将 营业收入(元) 计提收入(元)置空
                    $('#BusinessIncome').numberbox("setValue", "");
                    $('#EstimatedIncome').numberbox("setValue", "");
                }
            });
        }

        //计算应收保底金额
        function CalcReceivableGuaranteeAmount(date) {
            if ($(this).attr("id") == "BeginDate") {
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

            //判断计费周期、保底金额、开始时间、结束时间 是否都有值
            if (isValueNull($('#ContPeriod').textbox("getValue")) &&
                isValueNull($('#GuaranteeAmount').textbox("getValue")) &&
                isValueNull($('#BeginDate').datebox("getValue")) &&
                isValueNull($('#EndDate').datebox("getValue")) &&
                $('#CalculationMethod').val() == "6" &&
                $('#GuaranteeAmountCollectionWay').val() == "按计费周期收取") {
                var param = {
                    "ContPeriod": $('#ContPeriod').textbox("getValue"),
                    "GuaranteeAmount": $('#GuaranteeAmount').textbox("getValue"),
                    "BeginDate": $('#BeginDate').datebox("getValue"),
                    "EndDate": $('#EndDate').datebox("getValue")
                };
                $.dataPostJson('Renting_ContractRoyalty', 'CalcReceivableGuaranteeAmount', param, true, false,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#ReceivableGuaranteeAmount').numberbox("setValue", data.data);
                        } else { $.messager.alert("温馨提示", data.msg); }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }
        //应收保底金额、应收提成金额 变更
        function ReceivableGuaranteeAmountChange() {
            try {
                var ReceivableGuaranteeAmountVal = $('#ReceivableGuaranteeAmount').numberbox("getValue");
                var ReceivableRoyaltyAmountVal = $('#ReceivableRoyaltyAmount').textbox("getValue");
                if (isValueNull(ReceivableGuaranteeAmountVal) && isValueNull(ReceivableRoyaltyAmountVal)) {
                    $('#Amount').textbox("setValue", (parseFloat(ReceivableGuaranteeAmountVal) + parseFloat(ReceivableRoyaltyAmountVal)).toFixed(2));
                } else {
                    if (isValueNull(ReceivableGuaranteeAmountVal)) {
                        $('#Amount').textbox("setValue", parseFloat(ReceivableGuaranteeAmountVal).toFixed(2));
                    } else {
                        $('#Amount').textbox("setValue", parseFloat(ReceivableRoyaltyAmountVal).toFixed(2));
                    }
                }
            } catch (e) {
                $('#Amount').textbox("setValue", 0.00)
            }
        }


        //营业收入改变
        function BusinessIncomeChange(newValue, oldValue) {
            try {
                var EstimatedIncomeVal = $('#EstimatedIncome').numberbox("getValue");
                if (EstimatedIncomeVal == "") {
                    $('#EstimatedIncome').numberbox("setValue", newValue);
                }
            } catch (e) {

            }
        }
        //计提收入 改变
        function EstimatedIncomeChange(newValue, oldValue) {
            try {
                if (isValueNull(newValue)) {
                    //判断是否有 提成比例
                    var BusinessRoyaltyRatioVal = $('#BusinessRoyaltyRatio').textbox("getValue");
                    if (BusinessRoyaltyRatioVal != "") {
                        //计算 应收提成金额
                        var param = {
                            "EstimatedIncome": newValue,
                            "BusinessRoyaltyRatio": BusinessRoyaltyRatioVal,
                            "ContractID": $('#ContractID').val(),
                            "ID": $('#ID').val()
                        };
                        $.dataPostJson('Renting_ContractRoyalty', 'CalcReceivableRoyaltyAmount', param, true, false,
                            function Init() {
                            },
                            function callback(data) {
                                if (data.result) {
                                    $('#ReceivableRoyaltyAmount').textbox("setValue", data.data);
                                } else {
                                    $.messager.alert('温馨提示', data.msg);
                                    $('#ReceivableRoyaltyAmount').textbox("setValue", "0.00");
                                }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });

                    } else {
                        $('#ReceivableRoyaltyAmount').textbox("setValue", "0.00");
                    }
                } else {
                    $('#ReceivableRoyaltyAmount').textbox("setValue", "0.00");
                }
            } catch (e) {
                $('#ReceivableRoyaltyAmount').textbox("setValue", "0.00");
            }
        }

        function ClientClick() {
            $('#mainForm input').attr("disabled", false);
            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            //判断必须要有合同类别
            if ($('#ContractType').val() == "") {
                $.messager.alert('温馨提示', "请选择合同类别");
                return;
            }
            var FlowId = "";
            var ErrorMessage = "";
            //同步调用 获取当前页面能选择那些流程
            var parameter = {
                ContractType: $('#ContractType').val(),
                AuditType: "租赁合同提成"
            }
            $.dataPostJson('RentingPublicClass', 'GetRentingWorkFlow', parameter, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        FlowId = data.data;
                    } else {
                        ErrorMessage = data.msg;
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
            if (ErrorMessage != "") {
                $.messager.alert('温馨提示', ErrorMessage);
                return;
            }
            if (FlowId == "") {
                $.messager.alert('温馨提示', "请设置对应租赁合同提成的审核流程");
                return;
            }
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=1264&biaoshi=1&random=" + Math.random();
            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                if (_Data != '') {
                    var obj = JSON.parse(_Data);
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                }
            });
        }

        //页面初始化
        $(function () {
            var h = $(window).height();
            $('#mainForm').css("height", h + 'px');

            //判断 保底金额收取方式 =按合同期间收取 允许手动输入
            if ($('#GuaranteeAmountCollectionWay').val() == "按合同期间收取") {
                $('#ReceivableGuaranteeAmount').numberbox({ disabled: false });
            }

            //注册点击事件
            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

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

    </script>
</body>
</html>

