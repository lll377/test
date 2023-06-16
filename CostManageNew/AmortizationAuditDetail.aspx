<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmortizationAuditDetail.aspx.cs" Inherits="M_Main.CostManageNew.AmortizationAuditDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>摊销审批详细页面</title>
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

        .TdContentSearch textarea {
            width: 98.2%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
            margin-bottom: 1px;
            overflow: hidden;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                border-bottom: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input id="OpType" type="hidden" name="OpType" runat="server">
        <input type="hidden" id="selected" name="selected" />
        <input id="AmortizationID" type="hidden" name="AmortizationID" runat="server">
        <input id="DetailResult" type="hidden" name="DetailResult" runat="server">
        <input type="hidden" id="AuditStatus" name="AuditStatus" value="未启动" runat="server" />
        <!-- 按钮工具栏 -->
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div class="Content" style="overflow: auto;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">摊销单号:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AmortizationNO" value="保存后自动生成" name="AmortizationNO" readonly class="easyui-validatebox"  runat="server"/>
                    </td>
                    <td class="TdTitle">机构部门:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="DepName" name="DepName" runat="server" onclick="SelDep();" class="easyui-validatebox" readonly data-options="required:true" />
                        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
                    </td>
                    <td class="TdTitle">经办人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="HandleUserName" name="HandleUserName" onclick="SelUser();" runat="server" class="easyui-validatebox" readonly data-options="required:true" />
                        <input type="hidden" id="HandleUserCode" name="HandleUserCode" runat="server" />
                    </td>
                    <td class="TdTitle">摊销类型:</td>
                    <td class="TdContentSearch">
                        <select id="AmortizationType" name="AmortizationType" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true" runat="server">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">摊销主题:</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" id="AmortizationTheme" name="AmortizationTheme" runat="server" class="easyui-validatebox" style="width: 96%;" data-options="required:true" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">业务来源:</td>
                    <td class="TdContentSearch">
                        <select id="BusinessSource" name="BusinessSource" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,onSelect:BusinessSourceSelect" runat="server">
                            <option value=""></option>
                            <option value="待摊请付单">待摊请付单</option>
                            <option value="待摊调拨单">待摊调拨单</option>
                            <option value="其它业务单">其它业务单</option>
                        </select>
                    </td>
                    <td class="TdTitle">业务单号:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BusinessNO" onclick="BusinessNO_Click()" runat="server" readonly name="BusinessNO" class="easyui-validatebox" />
                        <input type="hidden" id="BusinessId" name="BusinessId" runat="server" />
                        <input type="hidden" id="BusinessMoney" name="BusinessMoney" runat="server" />
                    </td>
                    <td class="TdTitle">摊销金额(元):</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AmortizationMoney" name="AmortizationMoney" runat="server" class="easyui-numberbox" readonly data-options="precision:2" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">备注:</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea type="text" id="Remark" name="Remark" maxlength="1000" runat="server" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
            </table>
            <div id="TableContainer" style="height: 260px; margin: 0px; padding: 0px;"></div>
            <!-- 流程内容 -->
            <div id="OAFlow" style="height: auto; margin: 0px auto;">
                <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height() - $('.TopHead').height();
            var w = $(window).width();
            $(".Content").css({ "height": h + "px" });
        }
        //选择机构部门
        function SelDep() {
            HDialog.Open('500', '500', '../DialogNew/SelDepartSingle_Cost.aspx', '选择部门', false, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = _Data.split(',');
                    $("#DepCode").val(arrRet[0]);
                    $("#DepName").val(arrRet[1]);
                }
            });
        }
        //选择经办人
        function SelUser() {
            HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择经办人', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    var varObjects = JSON.parse(_Data);
                    $("#HandleUserCode").val(varObjects.UserCode);
                    $("#HandleUserName").val(varObjects.UserName);
                }
            });
        }
        //选择 业务来源
        function BusinessSourceSelect(record) {
            if (record.value == "其它业务单") {
                $('#BusinessNO').removeAttr("readonly");
            } else {
                $('#BusinessNO').attr("readonly", "readonly");
            }
            //删除业务单号、业务id、摊销金额、摊销费用明细
            $('#BusinessNO').val("");
            $('#BusinessId').val("");
            $('#AmortizationMoney').numberbox("setValue", "");
            $('#TableContainer').datagrid('loadData', []);
        }
        //点击选择业务单号
        function BusinessNO_Click() {
            var SwitchValue = $('#BusinessSource').combobox("getValue");
            if (SwitchValue == "") {
                HDialog.Info("请先选择业务来源");
                return;
            }
            switch (SwitchValue) {
                case "待摊请付单":
                    //选择待摊请付单
                    HDialog.Open('1000', '500', "../CostManageNew/AmortizationSelectPaymentApproval.aspx", '选择待摊请付单', false, function callback(_Data) {
                        if (_Data != '') {
                            //返回数据 更新 BusinessNO 业务单号  BusinessId 业务id   BusinessMoney 待摊金额
                            var Dataobj = JSON.parse(_Data);
                            $('#BusinessNO').val(Dataobj.PayNO);
                            $('#BusinessId').val(Dataobj.PayId);
                            $('#BusinessMoney').val(Dataobj.DTJE);
                            $('#AmortizationMoney').numberbox("setValue", Dataobj.DTJE);
                        }
                    });
                    break;
                case "待摊调拨单":
                    //选择待摊调拨单
                    HDialog.Open('1000', '500', "../CostManageNew/AmortizationSelectAllocation.aspx", '选择待摊调拨单', false, function callback(_Data) {
                        if (_Data != '') {
                            //返回数据 更新 BusinessNO 业务单号  BusinessId 业务id   BusinessMoney 待摊金额
                            var Dataobj = JSON.parse(_Data);
                            $('#BusinessNO').val(Dataobj.ReceiptSign);
                            $('#BusinessId').val(Dataobj.Id);
                            $('#BusinessMoney').val(Dataobj.DTJE);
                            $('#AmortizationMoney').numberbox("setValue", Dataobj.DTJE);
                        }
                    });
                    break;
                default:
                    break;
            }
        }

        var Columns = [[
            { field: 'CostName', title: '成本单位', width: 160, align: 'center', sortable: true },
            { field: 'CsName', title: '成本科目', width: 160, align: 'center', sortable: true },
            { field: 'Rate', title: '税率（%）', width: 100, align: 'center', sortable: true },
            { field: 'AmortizationMonth', title: '摊销年月', width: 100, align: 'center', sortable: true },
            { field: 'AmortizationMoney', title: '摊销金额（元）', width: 160, align: 'center', sortable: true },
            { field: 'BudgetPayMoney', title: '预算剩余金额（元）', width: 160, align: 'center', sortable: true }
        ]];

        var ToolBar = [
            {
                text: '新增摊销费用',
                iconCls: 'icon-add',
                handler: function () {
                    //判断是否 有业务来源 
                    var BusinessSource = $('#BusinessSource').combobox("getValue");
                    var OpType = "Validate"
                    switch (BusinessSource) {
                        case "待摊请付单":
                            if ($('#BusinessId').val() == "") {
                                HDialog.Info("请选择业务单");
                                return;
                            }
                            break;
                        case "待摊调拨单":
                            if ($('#BusinessId').val() == "") {
                                HDialog.Info("请选择业务单");
                                return;
                            }
                            OpType = "NotValidate";
                            break;
                        case "其它业务单":
                            OpType = "NotValidate";
                            break;
                        default:
                            HDialog.Info("请先选择业务来源");
                            return;
                            break;
                    }
                    HDialog.Open('440', '350', '../CostManageNew/AmortizationAuditAddFees.aspx?OpType=' + OpType, '摊销费用', false, function callback(_Data) {
                        if (_Data != '') {
                            var varobj = eval("(" + _Data + ")");
                            if (varobj != null) {
                                var RowsData = $('#TableContainer').datagrid("getRows");
                                //判断是否 成本单位 成本科目 摊销年月 已存在数据了
                                var Node = RowsData.filter(function (e) {
                                    return e.CostId == varobj[0].CostId && e.CsId == varobj[0].CsId && e.AmortizationMonth == varobj[0].AmortizationMonth;
                                });
                                //如果存在相同项目的数据
                                if (Node != null && Node.length > 0) {
                                    HDialog.Info("已存在相同成本单位、成本科目及摊销年月的摊销明细数据;")
                                    return;
                                }
                                $('#TableContainer').datagrid('appendRow', {
                                    DetailedID: varobj[0].DetailedID,
                                    CostName: varobj[0].CostName,
                                    CostId: varobj[0].CostId,
                                    CsName: varobj[0].CsName,
                                    CsId: varobj[0].CsId,
                                    Rate: varobj[0].Rate,
                                    AmortizationMonth: varobj[0].AmortizationMonth,
                                    AmortizationMoney: varobj[0].AmortizationMoney,
                                    BudgetPayMoney: varobj[0].BudgetPayMoney,
                                    ChId: ''
                                });
                                //计算摊销金额
                                SumAmortizationValue();
                            }
                        }
                    });
                }
            }, '-', {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var SelectedRow = $('#TableContainer').datagrid("getSelected");
                    if (SelectedRow == null) {
                        HDialog.Info("请选择需要修改的摊销费用！");
                        return;
                    }
                    var BusinessSource = $('#BusinessSource').combobox("getValue");
                    var OpType = "Validate"
                    switch (BusinessSource) {
                        case "待摊请付单":
                            if ($('#BusinessId').val() == "") {
                                HDialog.Info("请选择业务单");
                                return;
                            }
                            break;
                        case "待摊调拨单":
                            if ($('#BusinessId').val() == "") {
                                HDialog.Info("请选择业务单");
                                return;
                            }
                            OpType = "NotValidate"
                            break;
                        case "其它业务单":
                            OpType = "NotValidate"
                            break;
                        default:
                            break;
                    }
                    var Parameters = "&DetailedID=" + SelectedRow.DetailedID + "&CostName=" + SelectedRow.CostName + "&CostId=" + SelectedRow.CostId + "&CsName=" + SelectedRow.CsName + "&CsId=" + SelectedRow.CsId + "&AmortizationMonth=" + SelectedRow.AmortizationMonth + "&AmortizationMoney=" + SelectedRow.AmortizationMoney + "&BudgetPayMoney=" + SelectedRow.BudgetPayMoney + "&Rate=" + SelectedRow.Rate;
                    HDialog.Open('440', '350', '../CostManageNew/AmortizationAuditAddFees.aspx?OpType=' + OpType + Parameters, '摊销费用', false, function callback(_Data) {
                        if (_Data != '') {
                            var varobj = eval("(" + _Data + ")");
                            if (varobj != null) {
                                var UpdateRowIndex = $('#TableContainer').datagrid('getRowIndex', SelectedRow);
                                $('#TableContainer').datagrid('updateRow', {
                                    index: UpdateRowIndex,
                                    row: {
                                        CostName: varobj[0].CostName,
                                        CostId: varobj[0].CostId,
                                        CsName: varobj[0].CsName,
                                        CsId: varobj[0].CsId,
                                        Rate: varobj[0].Rate,
                                        AmortizationMonth: varobj[0].AmortizationMonth,
                                        AmortizationMoney: varobj[0].AmortizationMoney,
                                        BudgetPayMoney: varobj[0].BudgetPayMoney,
                                        ChId: ''
                                    }
                                });
                                //计算摊销金额
                                SumAmortizationValue();
                            }
                        }
                    });
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var SelectedRow = $('#TableContainer').datagrid("getSelected");
                    if (SelectedRow == null) {
                        HDialog.Info("请选择需要删除的摊销费用！");
                        return;
                    }
                    var RowIndex = $('#TableContainer').datagrid("getRowIndex", SelectedRow);
                    $('#TableContainer').datagrid("deleteRow", RowIndex);
                    //计算摊销金额
                    SumAmortizationValue();
                }
            }, '-',
            {
                text: '备注',
                iconCls: 'icon-help',
                handler: function () {

                }
            }
        ];

        //加载摊销费用
        function LoadList() {
            var dataList = [];
            if ($('#DetailResult').val() != "") {
                dataList = eval('(' + $('#DetailResult').val() + ')')
            }
            if ($('#AuditStatus').val() != "未启动" && $('#AuditStatus').val() != "已驳回") {
                ToolBar = [];
            }
            $("#TableContainer").datagrid({
                data: dataList,
                nowrap: true,
                columns: Columns,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                border: true,
                toolbar: ToolBar,
                rownumbers: "true",
                onLoadSuccess: function (data) {
                    $.tool.pageUnLoading();
                },
                onLoadError: function () {
                    $.tool.pageUnLoading();
                }
            });
        }

        //计算摊销金额
        function SumAmortizationValue() {
            var Rows = $('#TableContainer').datagrid("getRows");
            var AmorValue = 0.00;
            //循环计算所有的摊销金额 摊销明细之和
            for (var i = 0; i < Rows.length; i++) {
                AmorValue = AmorValue + parseFloat(Rows[i].AmortizationMoney);
            }
            $('#AmortizationMoney').numberbox("setValue", AmorValue);
        }
        
        //页面数据验证
        function ClientClick() {
            //判断是否有摊销明细 如果没有就返回
            var RowsData = $('#TableContainer').datagrid("getRows");
            if (RowsData.length == 0) {
                HDialog.Info("请录入摊销明细数据！");
                return false;
            }
            //计算一次摊销金额
            SumAmortizationValue();
            var BusinessSource = $('#BusinessSource').combobox("getValue");
            switch (BusinessSource) {
                case "待摊请付单":
                case "待摊调拨单":
                    //验证 选择请付单  摊销金额明细之和≤请付金额-在审摊销金额-已审摊销金额
                    //验证 选择调拨单  摊销金额明细中正数之和≤出库金额-在审摊销金额-已审摊销金额
                    if ($('#BusinessMoney').val() != "") {
                        var BusinessMoney = parseFloat($('#BusinessMoney').val());
                        var ItemDetailMoney = 0.00;
                        for (var i = 0; i < RowsData.length; i++) {
                            if (parseFloat(RowsData[i].AmortizationMoney) > 0.00) {
                                ItemDetailMoney = ItemDetailMoney + parseFloat(RowsData[i].AmortizationMoney);
                            }
                        }
                        if (ItemDetailMoney > BusinessMoney) {
                            HDialog.Info("【" + BusinessSource + "】摊销明细之和不能大于待摊金额");
                            return false;
                        }
                        if (BusinessSource == "待摊调拨单" && ItemDetailMoney != BusinessMoney) {
                            HDialog.Info("【待摊调拨单】只允许一次性完全摊销，摊销明细之和必须等于待摊金额");
                            return false;
                        }
                    }
                    break;
                case "其它业务单":
                    break;
                default:
                    break;
            }
            //判断摊销明细中的数据 摊销金额之和是否大于每一项的剩余预算金额
            //动态 同步验证
            var rows = $('#TableContainer').datagrid('getRows');
            if (rows.length > 0) {
                var DetailResult = JSON.stringify(rows);
                var SelectedData = DetailResult.replaceAll("AmortizationMonth", "PayMonth");
                SelectedData = SelectedData.replaceAll("AmortizationMoney", "PayMoney");
                var IsValidateSuccess = false;
                $("#selected").val(SelectedData);
                //取出预算科目的总金额(返回值_Data,A:预算金额已使用完，B:未设置预算，C:查询到多条预算（预算设置有误），D:未获取到前台传入参数，程序异常,等于空验证通过，E:输入金额超出预算金额)
                $.tool.DataPostInfoAsync('CsCost', 'CheckBudgetSubjectMoney', 'selected=' + $("#selected").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "D") {
                            HDialog.Info("未获取到前台传入参数，程序异常");
                            $("#BudgetPayMoney").numberbox("setValue", "0");
                            IsValidateSuccess = false;
                        }
                        else if (_Data == "C") {
                            HDialog.Info("查询到多条预算，预算设置有误");
                            $("#BudgetPayMoney").numberbox("setValue", "0");
                            IsValidateSuccess = false;
                        }
                        else {
                            var obj = _Data.split('|');//obj[0]标识判断，obj[1]成本科目，obj[2]可用预算)
                            if (obj[0] == "B") {
                                HDialog.Info("“" + obj[1] + "”" + "科目未设置预算金额");
                                IsValidateSuccess = false;
                            }
                            else if (obj[0] == "A") {
                                HDialog.Info("“" + obj[1] + "”" + "科目预算金额已使用完");
                                IsValidateSuccess = false;
                            }
                            else if (obj[0] == "E") {
                                //当前录入应付金额不得大于预算剩余金额-支付审批报账审核通过的金额）预算剩余可显示负数
                                HDialog.Info("“" + obj[1] + "”" + "科目应付金额已超出预算剩余金额");
                                IsValidateSuccess = false;
                            } else {
                                IsValidateSuccess = true;
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, '正在计算,请稍侯', false);
                if (!IsValidateSuccess) {
                    return false;
                }
                $('#DetailResult').val(DetailResult);
                return true;
            } else {
                return false;
            }
        }


        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        //预算计划审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0710&biaoshi=1&random=" + Math.random();
            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                if (_Data != '') {
                    var obj = JSON.parse(_Data);
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                }
            });
        }


        $(function () {
            $.tool.pageLoading();
            //初始化页面高度
            InitTableHeight();
            //注册点击事件
            $("#BtnClose").click(function (e) {
                HDialog.Close('');
            });

            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                $.tool.pageLoading();
                //保存和送审的时候才验证
                if ($(this).attr("id") != "BtnSaveStartWorkFlow" && $(this).attr("id") != "BtnSave") {
                    $.tool.pageUnLoading();
                    return true;
                }

                //关闭编辑状态
                //endEditing();
                if (IsSubmitFlag == false) {
                    HDialog.Info("5秒内不要重复点击");
                    $.tool.pageUnLoading();
                    return false;
                }
                IsSubmitFlag = false;
                setTimeout(function () {
                    IsSubmitFlag = true
                }, 5000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (ClientClick()) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "" && $(this).attr("id") == "BtnSaveStartWorkFlow") {
                            HDialog.Info("请选择审批流程");
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
            LoadList();
        })
    </script>
</body>
</html>
