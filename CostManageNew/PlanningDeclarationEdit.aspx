<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanningDeclarationEdit.aspx.cs" Inherits="M_Main.CostManageNew.PlanningDeclarationEdit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>计划申报单</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
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
<body>
    <form id="frmForm" runat="server">
        <%--盘点IDeas--%>
        <input type="hidden" id="PlanId" name="PlanId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />


        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="StartPerson" name="StartPerson" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />
        <%--计划单号--%>
        <input type="hidden" value="" runat="server" id="PlanNo" name="PlanNo" />


        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <input type="hidden" id="CalResult" name="CalResult" runat="server" value="" />
        <input type="hidden" id="PlanWay" name="PlanWay" runat="server" value="" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="BudgetPayMoney" name="BudgetPayMoney" />
        <input type="hidden" id="selected" name="selected" />

        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">申报单号：
                </td>
                <td class="DialogTdContent">
                    <%--<input type="text" class="easyui-validatebox" data-options="required:true" id="InventoryNumName" readonly name="InventoryNumName" runat="server" />--%>
                    <label runat="server" id="PlanNoName"></label>
                </td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
                <td class="DialogTdTitle"></td>
                <td class="DialogTdContent"></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">所属项目：
                </td>
                <td class="DialogTdContent">
                    <input id="CommName" name="CommName" class="easyui-validatebox" onclick="SelItem();" runat="server" />
                </td>
                <td class="DialogTdTitle">机构部门：
                </td>
                <td class="DialogTdContent">
                    <input id="DepName" name="DepName" class="easyui-validatebox" runat="server" onclick="SelDep();" data-options="required:true" /></td>
                <td class="DialogTdTitle">计划年月：
                </td>
                <td class="DialogTdContent">
                    <input id="PlanMonth" name="PlanMonth" class="easyui-validatebox" data-options="required:true" onclick="WdatePicker({ onpicked: CheckDate, dateFmt: 'yyyy-MM', skin: 'default' })" runat="server" />
                </td>
                <td class="DialogTdContent" colspan="2"><span style="color: red;">说明：只允许提报下月或者本月</span></td>
            </tr>

            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto;">
            <div id="TableContainer" style="height: auto;"></div>
        </div>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls1:'icon-search',closed: true,modal:true" style="width: 700px; height: 320px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td style="color: red;">一、“新增无合同费用”应付金额管控方式：</td>
                </tr>
                <tr>
                    <td>1、当期控制：
                    </td>
                </tr>
                <tr>
                    <td>业务发生额≤本成本单位、管控科目本月最终预算值（已审核）-本月合同的应付金额（审批中+已审批）-本月无合同的计划申报金额（审批中+已审批）-本月无合同无计划、
                        计入成本的报账付款金额（审批中+已审批）-本月摊销金额（审批中+已审批）
                    </td>
                </tr>
                <tr style="height: 6px;"></tr>
                <tr>
                    <td>2、累计控制：
                    </td>
                </tr>
                <tr>
                    <td>业务发生额≤本成本单位、管控科目1月至本月最终预算值之和（已审核）-1月至本月合同应付金额（审批中+已审批）-1月至上月无合同、
                        计入成本的报账付款金额（审批中+已审批）-本月无合同的资金计划金额（审批中+已审批）-本月无合同无计划、计入成本的报账付款金额（审批中+已审批）
                        -1月至本月摊销金额（审批中+已审批）

                    </td>
                </tr>
                <tr style="height: 6px;"></tr>
                <tr>
                    <td>3、总量控制：
                    </td>
                </tr>
                <tr>
                    <td>业务发生额≤本成本单位、管控科目本年最终预算值之和（已审核）-本年合同应付金额（审批中+已审批）-1月至上月无合同、计入成本的的报账付款金额（审批中+已审批）
                        -本月无合同的资金计划金额（审批中+已审批）-本月无合同无计划、、计入成本的报账付款金额（审批中+已审批）-本年摊销金额（审批中+已审批）
                    </td>
                </tr>
                <tr style="height: 10px;"></tr>
                <tr style="height: 6px;">
                    <td style="color: red;">二、“新增合同费用”可申报金额管控方式：</td>
                </tr>
                <tr>
                    <td>可申报金额=合同应付金额—截止上月合同已付金额（含审批中付款）—本月申报金额（含审批中申报）；
                    </td>
                </tr>

            </table>
        </div>

        <script type="text/javascript">

            //计算小数位数
            var decimalPos = 2;
            //编辑的行号
            var editIndex = undefined;

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
                //设置计划年月默认时间
                var myDate = new Date();
                // $("#PlanMonth").val(myDate.getFullYear() + '-0' + parseInt(myDate.getMonth() + 1));
            }

            //$("#PlanMonth").off().on("blur", function () {
            //    var myDate = new Date();
            //    var ThisMonth = myDate.getFullYear() + '-0' + parseInt(myDate.getMonth() + 1);
            //    var NextMonth = myDate.getFullYear() + '-0' + parseInt(myDate.getMonth() + 2);

            //    if ($("#PlanMonth").val() != ThisMonth && $("#PlanMonth").val() != NextMonth) {
            //        HDialog.Info("只允许提报下月或者本月");
            //        $("#PlanMonth").val(ThisMonth);
            //    }
            //});

            function CheckDate() {
                var myDate = new Date();
                var ThisMonth = '';
                var NextMonth = '';
                debugger;
                if ((myDate.getMonth() + 1) >= 10 && (myDate.getMonth() + 1) < 12) {
                    ThisMonth = myDate.getFullYear() + '-' + parseInt(myDate.getMonth() + 1);
                    NextMonth = myDate.getFullYear() + '-' + parseInt(myDate.getMonth() + 2);
                } else if ((myDate.getMonth() + 1) >= 10 && (myDate.getMonth() + 1) == 12) {
                    ThisMonth = myDate.getFullYear() + '-0' + parseInt(myDate.getMonth() + 1);
                    NextMonth = (myDate.getFullYear() + 1) + '-01';
                } else if ((myDate.getMonth() + 2) >= 10) {
                    ThisMonth = myDate.getFullYear() + '-0' + parseInt(myDate.getMonth() + 1);
                    NextMonth = myDate.getFullYear() + '-' + parseInt(myDate.getMonth() + 2);
                } else {
                    ThisMonth = myDate.getFullYear() + '-0' + parseInt(myDate.getMonth() + 1);
                    NextMonth = myDate.getFullYear() + '-0' + parseInt(myDate.getMonth() + 2);
                }

                if ($("#PlanMonth").val() != ThisMonth && $("#PlanMonth").val() != NextMonth) {
                    HDialog.Info("只允许提报下月或者本月");
                    $("#PlanMonth").val(ThisMonth);
                }
            }

            InitPurchaseTableHeight();
            column = [[
                { field: 'PlanId', title: '计划ID', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CommId', title: 'CommId', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'DepCode', title: 'DepCode', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CId', title: '合同表Id', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'PlanDetailId', title: '工作计划Id', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'ChId', title: '合同费用表Id', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CostId', title: '成本单位ID', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CsId', title: '成本科目ID', width: 50, align: 'center', sortable: true, hidden: true },
                {
                    field: 'ContractNo1', title: '有无合同', width: 50, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "无";
                        if (row.ContractNo != '') {
                            str = "有";
                        }
                        if (row.CommId == 'No') {
                            str = "";
                        }
                        return str;
                    }, hidden: true
                },
                { field: 'ContractNo', title: '合同编号', width: 80, align: 'center', sortable: true },
                { field: 'ContractName', title: '合同名称', width: 250, align: 'center', sortable: true },
                { field: 'ContractMoney', title: '合同金额', width: 80, align: 'center', sortable: true, hidden: true },
                { field: 'ContractPayedMoney', title: '已付金额', width: 80, align: 'center', sortable: true, hidden: true },
                { field: 'PlanCoding', title: '计划编码', width: 80, align: 'center', sortable: true },
                { field: 'PlanName', title: '计划名称', width: 250, align: 'center', sortable: true },
                { field: 'PayType', title: '付款事项', width: 250, align: 'center', sortable: true },
                { field: 'Schedule', title: '完成工作', width: 250, align: 'center', sortable: true, hidden: true },
                { field: 'DeclareDepName', title: '申报部门', width: 100, align: 'center', sortable: true },
                { field: 'PayDepName', title: '主管部门', width: 100, align: 'center', sortable: true },
                { field: 'CastName', title: '成本单位', width: 100, align: 'center', sortable: true },
                { field: 'SubjectName', title: '成本科目', align: 'center', width: 100, sortable: true },
                { field: 'Rate', title: '税率(%)', align: 'center', width: 100, sortable: true },
                {
                    field: 'PayMonth', title: '应付年月', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != '' && value != undefined) {
                            var date = new Date(value);
                            var str = date.getFullYear() + "-" + (date.getMonth() + 1);
                            return str;
                        }
                    }
                },
                { field: 'PayMoney', title: '应付金额', align: 'center', width: 80, sortable: true },
                { field: 'PayedMoney', title: '已付金额', align: 'center', width: 80, sortable: true },
                { field: 'DeclareMoney', title: '申报金额', align: 'center', width: 80, sortable: true },
                { field: 'CumulativeGetCost', title: '计划累计完成费用(元)', align: 'center', width: 160, sortable: true },
                { field: 'PayDepCode', title: '费用主管部门', align: 'center', width: 50, sortable: true, hidden: true },
                { field: 'WorkPlanId', title: '关联工作计划', align: 'center', width: 50, sortable: true, hidden: true },
                { field: 'CapitalPlanFrom', title: '资金申报来源', align: 'center', width: 50, sortable: true, hidden: true }
            ]];
            var toolbar = [];
            var toolbar_Start = [
                {
                    text: '新增无合同费用',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddCharge();
                    },
                    id: 'NoContract'
                }, '-',
                {
                    text: '选择合同费用',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddContractCharge();
                    },
                    id: 'HaveContract'
                }, '-',
                {
                    text: '选择工作计划费用',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddWorkPlanCharge();
                    },
                    id: 'WorkPlan'
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        var index = $("#TableContainer").datagrid("getRowIndex", row);
                        $('#TableContainer').datagrid('deleteRow', index);
                        UpdateAmount(1);
                    }
                }
                , '-',
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        CheckMoneyAll();
                        return;
                        ClientClick();
                    }
                }, '-', {
                    text: '备注',
                    iconCls: 'icon-help',
                    handler: function () {
                        $('#DlgMemo').parent().appendTo($("form:first"))
                        $('#DlgMemo').dialog('open');
                    }
                }
            ];


            function AddCharge() {
                if ($("#DepCode").val() == "") {
                    HDialog.Info("请选择所属部门");
                    return;
                }
                HDialog.Open(650, 600, '../CostManageNew/PlanningDeclarationChargeAdd.aspx?OpType=insert&Flag=TB&CommId=' + $("#CommId").val()
                    + '&DepCode=' + $("#DepCode").val() + '&PlanMonth=' + $("#PlanMonth").val(), '新增无合同费用', true, function callback(_Data) {
                        var obj = JSON.parse(_Data);
                        if (obj != null) {
                            var RowsData = $('#TableContainer').datagrid("getRows");
                            //判断是否 成本单位 成本科目 请付年月 已存在数据了
                            var Node = RowsData.filter(function (e) {
                                return e.CostId == obj.CostId && e.CsId == obj.CsId && e.PayMonth == obj.PayMonth;
                            });
                            //如果存在相同项目的数据
                            if (Node != null && Node.length > 0) {
                                HDialog.Info("已存在相同成本单位、成本科目及请付年月的请付明细数据;")
                                return;
                            }
                            var _Data1 = $('#TableContainer').datagrid('getData');
                            var row_index = _Data1.rows.length;
                            $('#TableContainer').datagrid('insertRow', {
                                index: row_index,
                                row: {
                                    PlanId: $("#Id").val(),
                                    DepCode: $("#DepCode").val(),
                                    CommId: $("#CommId").val(),
                                    CId: obj.CId,
                                    PlanCoding: '',
                                    PlanDetailId: '',
                                    PlanName: '',
                                    ContractNo: '',
                                    ContractName: '',
                                    ContractMoney: 0,
                                    ContractPayedMoney: 0,
                                    PayType: obj.PayType,
                                    Schedule: obj.Schedule == undefined ? "" : obj.Schedule,
                                    ChId: obj.ChId,
                                    CostId: obj.CostId,
                                    CastName: obj.CastName,
                                    CsId: obj.CsId,
                                    SubjectName: obj.CsName,
                                    Rate: obj.Rate,
                                    PayMonth: obj.PayMonth,
                                    PayMoney: obj.PayMoney,
                                    PayedMoney: obj.PayedMoney,
                                    DeclareMoney: obj.DeclareMoney,
                                    BudgetPayMoney: obj.BudgetPayMoney,
                                    PayDepCode: obj.PayDepCode,
                                    WorkPlanId: obj.WorkPlanId,
                                    CapitalPlanFrom: "0",
                                    CumulativeGetCost: "0",
                                    IsPlan: "false"//是否从工作计划选择数据
                                }
                            });
                            UpdateAmount(1);
                        }
                    });
            }

            function AddContractCharge() {
                //if ($("#CommId").val() == "") {
                //    HDialog.Info("请选择所属项目");
                //    return;
                //}
                if ($("#DepCode").val() == "") {
                    HDialog.Info("请选择所属部门");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../CostManageNew/SelContractChargeList.aspx?CommId=' + $("#CommId").val() + '&DepCode=' + $("#DepCode").val() + '&ThisMonth=' + $("#PlanMonth").val() + "&Flag=TB", '选择合同费用', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        //var jsons = json.substr(1, json.length - 1); 
                        var arrjsons = JSON.parse(_Data);
                        //alert(arrjsons.length);
                        if (arrjsons.length > 0) {
                            for (var i = 0; i < arrjsons.length; i++) {
                                // alert(rows[i]["Id"]); 
                                AddRows(arrjsons[i]);
                            }
                            //按照规则计算每一行的值 
                            UpdateAmount(1);
                        }
                    }
                });
            }

            function AddWorkPlanCharge() {
                //if ($("#CommId").val() == "") {
                //    HDialog.Info("请选择所属项目");
                //    return;
                //}
                if ($("#DepCode").val() == "") {
                    HDialog.Info("请选择所属部门");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../CostManageNew/SelWorkPlanCharge.aspx?CommId=' + $("#CommId").val() + '&DepCode=' + $("#DepCode").val() + '&ThisMonth=' + $("#PlanMonth").val() + "&Flag=TB", '选择工作计划费用', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        var arrjsons = JSON.parse(_Data);
                        if (arrjsons.length > 0) {
                            for (var i = 0; i < arrjsons.length; i++) {
                                AddWorkPlanRows(arrjsons[i]);
                            }
                            //按照规则计算每一行的值 
                            UpdateAmount(1);
                        }
                    }
                });
            }

            //选择项目
            function SelItem() {
                //HDialog.Open('370', '360', '../DialogNew/SelItem.aspx', '选择项目', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split(',');
                //        $("#CommId").val(varObjects[2]);
                //        $("#CommName").val(varObjects[1]);
                //    }
                //});

                HDialog.Open('700', '400', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        //$("#CommId").val(varObjects.attributes.InPopedom);
                        //$("#CommName").val(varObjects.text);
                        var arrRet = JSON.parse(_Data);
                        $("#CommId").val(arrRet.id);
                        $("#CommName").val(arrRet.name);
                    }
                });
            }

            //选择部门
            function SelDep() {
                HDialog.Open(500, 500, '../DialogNew/SelDepartSingle_Cost.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
            }

            function AddRows(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var isIn = 0;
                for (var i = 0; i < _Data.rows.length; i++) {
                    if (_Data.rows[i].ChId == row["ChId"]) {
                        isIn = 1;
                    }
                }
                if (isIn == 0) {
                    $('#TableContainer').datagrid('insertRow', {
                        index: row_index,
                        row: {
                            PlanId: $("#Id").val(),
                            DepCode: $("#DepCode").val(),
                            CommId: $("#CommId").val(),
                            CId: row["CId"],
                            PlanCoding: '',
                            PlanDetailId: '',
                            PlanName: '',
                            ContractNo: row["ContractNo"],
                            ContractName: row["ContractName"],
                            ContractMoney: row["ContractMoney"],
                            ContractPayedMoney: row["ContractPayedMoney"],
                            PayType: row["PayType"],
                            Schedule: row["Schedule"] == undefined ? "" : row["Schedule"],
                            ChId: row["ChId"],
                            CostId: row["CostId"],
                            CastName: row["CastName"],
                            CsId: row["CsId"],
                            SubjectName: row["SubjectName"],
                            Rate: (row["Rate"] == null || row["Rate"] == "" ? "" : row["Rate"]),
                            PayMonth: row["PayMonth"],
                            PayMoney: row["PayMoney"],
                            PayedMoney: row["PayedMoney"],
                            //DeclareMoney: row["DeclareMoney"],
                            DeclareMoney: ToDecimal(parseFloat(row["PayMoney"]) - parseFloat(row["PayedMoney"] <= "" ? 0 : row["PayedMoney"]), 2),
                            BudgetPayMoney: row["BudgetPayMoney"],
                            PayDepCode: row["PayDepCode"],
                            WorkPlanId: row["WorkPlanId"],
                            CapitalPlanFrom: "1",
                            CumulativeGetCost: "0",
                            IsPlan: "false"//是否从工作计划选择数据
                        }
                    });
                }
            }
            //
            function AddWorkPlanRows(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var isIn = 0;
                for (var i = 0; i < _Data.rows.length; i++) {
                    if (_Data.rows[i].PlanDetailId == row["DetailId"]) {
                        isIn = 1;
                    }
                }

                if (isIn == 0) {
                    debugger;
                    $('#TableContainer').datagrid('insertRow', {
                        index: row_index,
                        row: {
                            PlanId: $("#Id").val(),
                            DepCode: $("#DepCode").val(),
                            CommId: $("#CommId").val(),
                            CId: '',
                            PlanCoding: row["PlanCoding"],
                            PlanDetailId: row["DetailId"],
                            PlanName: row["PlanName"],
                            ContractNo: row["ContractNo"],
                            ContractName: row["ContractName"],
                            ContractMoney: 0,
                            ContractPayedMoney: 0,
                            PayType: row["PlanContent"],
                            Schedule: '',
                            ChId: '',
                            CostId: row["CostId"],
                            CastName: row["CastName"],
                            CsId: row["CsId"],
                            SubjectName: row["SubjectName"],
                            Rate: (row["Rate"] == null || row["Rate"] == "" ? "" : row["Rate"]),
                            PayMonth: row["PlanYearMonth"],
                            PayMoney: row["PlanCost"],
                            PayedMoney: row["PlanPayedMoney"],
                            //DeclareMoney: 0,
                            DeclareMoney: ToDecimal(parseFloat(row["PlanCost"]) - parseFloat(row["PlanPayedMoney"] <= "" ? 0 : row["PlanPayedMoney"]), 2),
                            BudgetPayMoney: 0,
                            PayDepCode: row["PayDepCode"],
                            WorkPlanId: '',
                            CapitalPlanFrom: '2',
                            CumulativeGetCost: row["CumulativeGetCost"],
                            IsPlan: "true"//是否从工作计划选择数据
                        }
                    });
                }
            }

            function ComputeGridCol(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, decimalPos);
            }



            //计算合计金额及页脚合计金额
            function UpdateAmount(bools) {
                if (bools > 0) {
                    //计算页脚合计
                    $('#TableContainer').datagrid('reloadFooter', [
                        {
                            CommId: "No",
                            ContractName: "合计",
                            DeclareMoney: ComputeGridCol("DeclareMoney"),
                            ContractMoney: ComputeGridCol("ContractMoney"),
                            ContractPayedMoney: ComputeGridCol("ContractPayedMoney"),
                            PayedMoney: ComputeGridCol("PayedMoney"),
                            PayMoney: ComputeGridCol("PayMoney"),
                            CumulativeGetCost: ComputeGridCol("CumulativeGetCost")
                        }
                    ]);
                }
                else {
                    if (editIndex != undefined) {
                        $("#TableContainer").datagrid('acceptChanges', editIndex);
                        // row.Quantity
                        var index = editIndex;
                        var rowData = $('#TableContainer').datagrid('getData').rows[index];
                        //检查申购价格是否允许调低及调高价格,如果违反规则,则申购价置为参考价
                        var DeclareMoney = 0;
                        var sl = parseFloat(rowData.PayMoney - rowData.PayedMoney);
                        if (parseFloat(rowData.DeclareMoney) > sl) {
                            HDialog.Info("申报金额不能大于未付金额！");
                            //超过最大值时候触发
                            DeclareMoney = sl;
                        }
                        else {
                            DeclareMoney = rowData.DeclareMoney;
                        }
                        $('#TableContainer').datagrid('updateRow',
                            {
                                index: index,
                                row: {
                                    DeclareMoney: ToDecimal(DeclareMoney, 2)
                                }
                            });
                        //计算页脚合计
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                CommId: "No",
                                ContractName: "合计",
                                DeclareMoney: ComputeGridCol("DeclareMoney"),
                                ContractMoney: ComputeGridCol("ContractMoney"),
                                ContractPayedMoney: ComputeGridCol("ContractPayedMoney"),
                                PayedMoney: ComputeGridCol("PayedMoney"),
                                PayMoney: ComputeGridCol("PayMoney"),
                                CumulativeGetCost: ComputeGridCol("CumulativeGetCost")
                            }
                        ]);
                    }
                }

            };

            String.prototype.replaceAll = function (s1, s2) {
                return this.replace(new RegExp(s1, "gm"), s2);
            }
            //验证该成本科目下的应付金额不能大于预算金额
            function CheckMoneyAll() {
                //过滤页面数据 
                //var DataArr = [];
                var rows = $('#TableContainer').datagrid('getRows');
                if (rows.length > 0) {
                    //过滤页面数据,若从工作计划过来的数据，则不验证预算
                    var DataArr = rows.filter(function (e) {
                        return e.IsPlan == 'false';
                    });

                    var rowDataAll = JSON.stringify(DataArr);
                    var SelectedData = rowDataAll.replaceAll("SubjectName", "CsName");
                    $("#selected").val(SelectedData);
                    //取出预算科目的总金额(返回值_Data,A:预算金额已使用完，B:未设置预算，C:查询到多条预算（预算设置有误），D:未获取到前台传入参数，程序异常,等于空验证通过，E:输入金额超出预算金额)
                    $.tool.DataPostInfoAsync('CsCost', 'CheckBudgetSubjectMoney', 'selected=' + $("#selected").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "D") {
                                HDialog.Info("未获取到前台传入参数，程序异常");
                                $("#BudgetPayMoney").numberbox("setValue", "0");
                                return;
                            }
                            else if (_Data == "C") {
                                HDialog.Info("查询到多条预算，预算设置有误");
                                $("#BudgetPayMoney").numberbox("setValue", "0");
                                return;
                            }
                            else {
                                var obj = _Data.split('|');//obj[0]标识判断，obj[1]成本科目，obj[2]可用预算)
                                if (obj[0] == "B") {
                                    HDialog.Info("“" + obj[1] + "”" + "科目未设置预算金额");
                                }
                                else if (obj[0] == "A") {
                                    HDialog.Info("“" + obj[1] + "”" + "科目预算金额已使用完");
                                }
                                else if (obj[0] == "E") {
                                    //当前录入应付金额不得大于预算剩余金额-支付审批报账审核通过的金额）预算剩余可显示负数
                                    HDialog.Info("“" + obj[1] + "”" + "科目应付金额已超出预算剩余金额");
                                } else {
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, '正在计算,请稍侯', false);
                }
            }


            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });


            //初始化加载数据
            var Rows = JSON.parse($("#SearchResult").val());
            if ($("#State").val() == "未启动") {
                toolbar = toolbar_Start;
            }
            else {

                if ($("#State").val() == "审核中") {
                    toolbar = [];
                }
                if ($("#State").val() == "已审核") {
                    toolbar = [];
                }
            }
            function LoadList() {
                $("#TableContainer").datagrid({
                    idField: "Id",
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 150, 300],
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    striped: true,
                    view: myview,
                    toolbar: toolbar,
                    remoteSort: false,
                    rowStyler: function (index, row) {
                        //如果是页脚
                        if (row.ContractName == '合计') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    },
                    onLoadSuccess: function () {
                        if ($("#State").val() == "未启动") {//只有未提交审核时才能操作 
                            $('#TableContainer input:checkbox').each(function (index, el) {
                                el.disabled = false;
                            });
                            //加载页脚
                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    ContractName: "合计",
                                    DeclareMoney: ToDecimal("0.00", decimalPos),
                                    ContractMoney: ToDecimal("0.00", decimalPos),
                                    ContractPayedMoney: ToDecimal("0.00", decimalPos),
                                    ContractPayedMoney: ToDecimal("0.00", decimalPos)
                                }
                            ]);

                            UpdateAmount(1);
                        }
                    },
                    onClickRow: function (rowIndex, rowData) {
                        if ($("#State").val() == "已审核") return;

                        //发起时允许编辑,审核中不允许编辑
                        if ($("#State").val() == "未启动") {
                            $("#TableContainer").datagrid('acceptChanges', editIndex);
                            //更改当前行号
                            editIndex = rowIndex;
                            UpdateAmount(0);
                            //去除编辑器                    
                            $("#TableContainer").datagrid('removeEditor', 'DeclareMoney');
                            $("#TableContainer").datagrid('removeEditor', 'PayType');
                            $("#TableContainer").datagrid('removeEditor', 'Rate');
                            $("#TableContainer").datagrid('removeEditor', 'Schedule');

                            //实际数量可以编辑
                            $("#TableContainer").datagrid('addEditor', [ //添加DeclareMoney列editor
                                {
                                    field: 'DeclareMoney', editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: 2
                                        }, formatter: function (value, row, index) {
                                            return formatNumber(value, 2);
                                        }
                                    }, formatter: function (value, row, index) {
                                        if (value == undefined || value == null || value == "") {
                                            return '0.00';
                                        }
                                        return ToDecimal(value, decimalPos);
                                    }
                                }, {
                                    field: 'Rate', editor: {
                                        type: 'numberbox',
                                        options: {
                                            min: 0,
                                            max: 100,
                                            precision: 2
                                        }, formatter: function (value, row, index) {
                                            return formatNumber(value, 2);
                                        }
                                    }, formatter: function (value, row, index) {
                                        if (value == undefined || value == null || value == "") {
                                            return '0.00';
                                        }
                                        return ToDecimal(value, decimalPos);
                                    }
                                }, {
                                    field: 'PayType', editor: { type: 'text' }
                                }, {
                                    field: 'Schedule', editor: { type: 'text' }
                                }]);


                            //开始编辑
                            $("#TableContainer").datagrid('beginEdit', rowIndex);

                            //绑定JS事件
                            var ed = $('#TableContainer').datagrid('getEditors', rowIndex);

                            var selectRow = $('#TableContainer').datagrid('getSelected');

                            for (var i = 0; i < ed.length; i++) {
                                var e = ed[i];
                                if (e.field == "DeclareMoney") {
                                    $(e.target).bind("click", function () {
                                    }).bind("change", function () {
                                        //文本变化事件
                                        // alert(e.target[0].value);
                                        var val = e.target[0].value;
                                        var sl = rowData.PayMoney - rowData.PayedMoney;
                                        if (sl < val) {
                                            HDialog.Info("输入金额大于未付款金额！");
                                            e.target[0].value = sl;
                                            return;
                                        }
                                    });
                                }
                            }
                        }
                    }
                });
                //根据成本管控设置控制按钮
                if ($("#State").val() == "未启动") {
                    $('.datagrid-toolbar a').each(function () {
                        if ($(this).attr("id") == "HaveContract" && $("#PlanWay").val().indexOf("HaveContract") < 0) {
                            $(this).parent().hide();
                            $(this).parent().next().hide();
                        }
                        if ($(this).attr("id") == "NoContract" && $("#PlanWay").val().indexOf("NoContract") < 0) {
                            $(this).parent().hide();
                            $(this).parent().next().hide();
                        }
                        if ($(this).attr("id") == "WorkPlan" && $("#PlanWay").val().indexOf("WorkPlan") < 0) {
                            $(this).parent().hide();
                            $(this).parent().next().hide();
                        }
                    })
                }
            }

            function ClientClick() {
                UpdateAmount(0);
                var rows = $('#TableContainer').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i]["DeclareMoney"] == undefined) {
                        HDialog.Info("请输入申报金额！");
                        return;
                    }
                }

                $("#CalResult").val(JSON.stringify(rows));
                //判断列表申报金额是否大于预算金额（同项目，同科目，同年月）
                CheckMoneyAll();
            }

            /** 
            * 格式化数字，小数点后是0不表示 
            * @param value 
            * @param fixed 小数位数 
            */
            function formatNumber(value, fixed) {
                var number = Number(value);
                if (isNaN(number)) {
                    return '';
                } else {
                    if (fixed == 2) {
                        return number.toFixed(2) * 100 / 100;
                    } else if (fixed == 6) {
                        return number.toFixed(6) * 1000000 / 1000000;
                    }
                }
            }

            //加载数据
            LoadList();
            $('#TableContainer').datagrid('loadData', Rows);

            $("#DepCodeName").click(function (e) {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepCodeName").val(arrRet[1]);
                    }
                });
            });

            //盘点人、制单人、审核人
            function SelUserSer(str) {
                HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#" + str).val(varObjects.UserCode);
                        $("#" + str + "Name").val(varObjects.UserName);
                    }
                });
            }


            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }
                ClientClick();
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    var rows = $('#TableContainer').datagrid('getRows');
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i]["DeclareMoney"] == undefined || parseFloat(rows[i]["DeclareMoney"]) == 0) {
                            HDialog.Info("请输入申报金额！");
                            return false;
                        }
                    }

                    if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                        HDialog.Info("请选择审批流程");
                        return false;
                    }
                    return true;
                }
                else {
                    return false;
                }
            });


            //采购申请单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {

                if ($("#WareHouseId").val() == "") {
                    HDialog.Info("请选择入库仓库");
                    return;
                }
                if ($("#State").val() == "未启动") {
                    UpdateAmount(0);
                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0704&biaoshi=1&random=" + Math.random();
                    HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                        if (_Data != '') {
                            var obj = JSON.parse(_Data);
                            LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                            document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                            document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                        }
                    });
                }
            }

            //打印
            $("#BtnIsPrint").click(function (e) {
                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var InstanceTypeCode = "0015";
                var Attribute = "<Attribute><Id>" + $("#PlanId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId><InstanceTypeCode>" + InstanceTypeCode + "</InstanceTypeCode></Attribute>";
                $.tool.Print("PlanDeclaration", Attribute);
            });
        </script>

    </form>
</body>
</html>
