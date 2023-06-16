<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymenApprovalEdit.aspx.cs" Inherits="M_Main.CostManageNew.PaymenApprovalEdit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>报账支付单</title>
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
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
    <script src="../jscript/GetWorkFlowId.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
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
        <input type="hidden" id="PayId" name="PayId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />


        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <%--发起人--%>
        <input type="hidden" value="" runat="server" id="AddPerson" name="AddPerson" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />
        <%--计划单号--%>
        <input type="hidden" value="" runat="server" id="PayNo" name="PayNo" />
        <%--选择的计划单ID--%>
        <input type="hidden" value="" runat="server" id="ParentPlanIds" name="ParentPlanIds" />


        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <input type="hidden" id="CalResult" name="CalResult" runat="server" value="" />
        <input type="hidden" id="PayWay" name="PayWay" runat="server" value="" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="Statue" name="Statue" value="未启动" runat="server" />
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="selected" name="selected" />
        <input type="hidden" id="ActualPayment" name="ActualPayment" />
        <input type="hidden" id="CheckActualPayment" name="CheckActualPayment" />
        <input type="hidden" id="Empty" name="Empty" />
        <input type="hidden" id="IsFinal" name="IsFinal" value="1" />
        <input type="hidden" id="showPayMoney" name="showPayMoney" runat="server" />

        <input type="hidden" id="PrepaidMoney" name="PrepaidMoney" runat="server" />
        <input type="hidden" id="HasSpreadMoney" name="HasSpreadMoney" runat="server" />
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
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">请付单号：
                </td>
                <td class="DialogTdContent">
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
                    <input id="DepName" name="DepName" class="easyui-validatebox" onclick="SelDep();" runat="server" data-options="required:true" /></td>
                <td class="DialogTdTitle">请付人：
                </td>
                <td class="DialogTdContent">
                    <input type="hidden" id="PayPerson" name="PayPerson" runat="server" />
                    <input id="PayPersonName" name="PayPersonName" class="easyui-validatebox" onclick="SelUserPayPerson();" data-options="required:true" runat="server" />
                </td>
                <td class="DialogTdTitle">请付类型：</td>
                <td class="DialogTdContent">
                    <select id="PayType" name="PayType" runat="server">
                        <option value="成本">成本</option>
                        <option value="费用">费用</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">请付类别：
                </td>
                <td class="DialogTdContent">
                    <select id="PayTypeDictionary" runat="server" name="PayTypeDictionary" class="easyui-validatebox" data-options="required:true">
                        <option value=""></option>
                    </select>
                </td>
                <td class="DialogTdTitle">请付主题：
                </td>
                <td class="DialogTdContent">
                    <input id="PayTitle" name="PayTitle" class="easyui-validatebox" runat="server" data-options="required:true" /></td>

                <td class="DialogTdTitle">付款方式：</td>
                <td class="DialogTdContent">
                    <select id="PayMode" runat="server" name="PayMode" class="easyui-validatebox" onchange="PayModeChange()" data-options="required:true">
                        <option value="现金">现金</option>
                        <option value="转账">转账</option>
                        <option value="冲账">冲账</option>
                    </select>
                </td>
                <td class="DialogTdTitle">请付说明：
                </td>
                <td class="DialogTdContent">
                    <input id="PayNote" name="PayNote" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">请付金额（元）：</td>
                <td class="DialogTdContent">
                    <input id="Amount" name="Amount" runat="server" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">金额大写：
                </td>
                <td class="DialogTdContent">
                    <input id="BigNum" name="BigNum" runat="server" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">发起时间：</td>
                <td class="DialogTdContent">
                    <input type="text" class="Wdate" style="height: 22px;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:ss:mm',readOnly:true})" runat="server" id="AddTime" value="" name="AddTime" />
                    <%--<input id="AddTime" name="AddTime" type="text" style="width: 148px;" runat="server" class="easyui-datebox" data-options="required:true" />--%>
                </td>
                <td class="DialogTdTitle">付款单位：</td>
                <td class="DialogTdContent">
                    <input id="PayDepName" name="PayDepName" type="text" class="easyui-validatebox" onclick="SelPayDep();" readonly="readonly" style="border: 1px solid #cccccc;" runat="server" />
                    <input type="hidden" name="PayDepCode" id="PayDepCode" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdMemoContent" colspan="7">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">附件：
                </td>
                <td class="DialogTdContent" colspan="7">
                    <iframe src="../UploadFileName.aspx" frameborder="0" width="100%" height="25px" scrolling="no"></iframe>
                    <input type="hidden" id="FilesName" name="FilesName" runat="server" />
                    <input type="hidden" id="FilesPath" name="FilesPath" runat="server" />
                    <input type="hidden" id="FilesHtml" name="FilesHtml" runat="server" />

                </td>

            </tr>
            <tr>
                <td class="DialogTdTitle">附件列表：
                </td>
                <td class="DialogTdContent" colspan="5">
                    <span id="List" runat="server"></span>
                    <input type="button" name="fileList1" style="width: 120px; height: 25px;" value="查看附件列表" id="fileList1" runat="server" onclick="OnFileList();" />
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
        <div id="DlgMemo" class="easyui-dialog" title="备注" data-options="iconCls1:'icon-search',closed: true,modal:true" style="width: 800px; height: 250px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td style="color: red;">“无计划无合同费用”应付金额管控方式：</td>
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
            </table>
        </div>

        <script type="text/javascript">
            //选择请付人
            function SelUserPayPerson() {
                HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择请付人', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#PayPerson").val(varObjects.UserCode);
                        $("#PayPersonName").val(varObjects.UserName);
                    }
                });
            }

            //选择付款单位
            function SelPayDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择付款单位', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#PayDepCode").val(arrRet[0]);
                        $("#PayDepName").val(arrRet[1]);
                    }
                });
            }
            function getNowFormatDate() {
                var date = new Date();
                var seperator1 = "-";
                var seperator2 = ":";
                var month = date.getMonth() + 1;
                var strDate = date.getDate();
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (strDate >= 0 && strDate <= 9) {
                    strDate = "0" + strDate;
                }
                var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                    + " " + date.getHours() + seperator2 + date.getMinutes()
                    + seperator2 + date.getSeconds();
                return currentdate;
            }
            $("#AddTime").val(getNowFormatDate());
            function InitSelect() {
                $.tool.DataPostAsync('CsCost', 'BindDictionary', 'DcTypeName=请付类型',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        //$("#PayTypeDictionary").append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                            $("#PayTypeDictionary").append(option);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }
            //InitSelect();


            //计算小数位数
            var decimalPos = 2;
            //编辑的行号
            var editIndex = undefined;

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();
            //{
            //    field: 'MaterialId', title: '有无合同', width: 50, align: 'center', sortable: true, hidden: true, formatter: function (value, row, index) {
            //        return row.MaterialId == 0 ? '是' : '否'
            //    }
            //},

            function LoadBudgetPayMoney(CsId, CostId, PayMonth) {
                var ReturnData = '0.00';
                var selected = {
                    CsId: CsId,
                    CostId: CostId,
                    PayMonth: PayMonth
                }
                //取出预算科目的总金额(返回值_Data,0:预算金额已使用完，1:未设置预算，2:查询到多条预算（预算设置有误），3:未获取到前台传入参数，程序异常)
                $.tool.DataPostInfoAsync('CsCost', 'LoadBudgetPayMoney', 'selected=' + JSON.stringify(selected),
                    function Init() {
                    },
                    function callback(_Data) {
                        ReturnData = _Data;
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);

                return ReturnData;
            }


            var column = [[
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
                        if (row.ContractNo != '' && row.ContractNo != null) {
                            str = "有";
                        }
                        if (row.CommId == "NO") {
                            str = "";
                        }
                        if (row.ContractNo1 == "") {
                            str = "";
                        }
                        return str;
                    }, hidden: true
                },

                { field: 'ContractNo', title: '合同编号', width: 50, align: 'center', sortable: true },
                { field: 'ContractName', title: '合同名称', width: 200, align: 'center', sortable: true },
                { field: 'ContractMoney', title: '合同金额', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'ContractPayedMoney', title: '已付金额', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'PlanCoding', title: '计划编码', width: 80, align: 'center', sortable: true },
                { field: 'PlanName', title: '计划名称', width: 200, align: 'center', sortable: true },
                { field: 'PayType', title: '付款事项', width: 70, align: 'center', sortable: true },
                { field: 'Schedule', title: '完成工作', width: 50, align: 'center', sortable: true, hidden: true },
                { field: 'CostTreatment', title: '成本处理方式', width: 80, align: 'center', sortable: true },
                { field: 'CastName', title: '成本单位', width: 80, align: 'center', sortable: true },
                { field: 'SubjectName', title: '成本科目', align: 'center', width: 80, sortable: true },
                { field: 'Rate', title: '税率（%）', align: 'center', width: 60, sortable: true },
                { field: 'BudgetSubjectName', title: '报账科目', align: 'center', width: 80, sortable: true },
                { field: 'BudgetCsId', title: '报账科目ID', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'Payee', title: '收款单位/收款人', align: 'center', width: 100, sortable: true },
                { field: 'BankName', title: '开户行', align: 'center', width: 80, sortable: true },
                { field: 'BankAccount', title: '账号', align: 'center', width: 80, sortable: true },
                { field: 'DeliveryOrderNo', title: '送货单号', align: 'center', width: 80, sortable: true },
                { field: 'PutStorageOrderNo', title: '入库单号', align: 'center', width: 80, sortable: true },
                { field: 'VoucherNo', title: '发票号', align: 'center', width: 80, sortable: true },
                { field: 'VoucherCode', title: '发票代码', align: 'center', width: 80, sortable: true },
                {
                    field: 'PayMonth', title: '应付年月', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                        if (value != '' && value != undefined) {
                            var date = new Date(value);
                            var str = date.getFullYear() + "-" + (date.getMonth() + 1);
                            return str;
                        }
                    }
                },
                { field: 'PayMoney', title: '应付金额', align: 'center', width: 60, sortable: true },
                { field: 'PayedMoney', title: '已付金额', align: 'center', width: 60, sortable: true },
                { field: 'DeclareMoney', title: '申报金额', align: 'center', width: 60, sortable: true },
                { field: 'AgreeMoney', title: '审批金额', align: 'center', width: 60, sortable: true },
                { field: 'ActualPayment', title: '请付金额', align: 'center', width: 60, sortable: true },
                {
                    field: 'BudgetPayMoney', title: '预算剩余金额（元）', width: 70, align: 'left', sortable: true, hidden: true, formatter: function (value, row, index) {
                        if (row.PayMonth != '' && row.PayMonth != undefined) {
                            var date = new Date(row.PayMonth);
                            var MonthStr = String(date.getMonth() + 1);
                            if (MonthStr.length == 1) {
                                MonthStr = '0' + MonthStr;
                            }
                            var PayMonth = date.getFullYear() + "-" + MonthStr;
                            //var _ResultData = LoadBudgetPayMoney(row.CsId, row.CostId, str);
                            var selected = {
                                CsId: row.CsId,
                                CostId: row.CostId,
                                PayMonth: PayMonth
                            }
                            var BudgetPayMoney = 0;
                            //取出预算科目的总金额(返回值_Data,0:预算金额已使用完，1:未设置预算，2:查询到多条预算（预算设置有误），3:未获取到前台传入参数，程序异常)
                            //$.tool.DataGet('CsCost', 'LoadBudgetPayMoney', 'selected=' + JSON.stringify(selected),
                            //    function Init() {
                            //    },
                            //    function callback(_Data) {
                            //        BudgetPayMoney = _Data;
                            //    },
                            //    function completeCallback() {
                            //    },
                            //    function errorCallback() {
                            //    });
                            //alert(BudgetPayMoney);
                            return BudgetPayMoney;
                        }
                        return '0';
                    }
                },
                { field: 'ContractType', title: '合同类别', align: 'center', width: 50, sortable: true, hidden: true }
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
                {//公用
                    text: '选择合同费用',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddContractCharge();
                    },
                    id: 'HaveContract'
                }, '-',
                {
                    //单独
                    text: '选择资金计划费用',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#DepCode").val() != "")
                            AddPlanCharge();
                        else
                            HDialog.Info("请选择所属部门!");
                    },
                    id: 'BudgetPlan'
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
                        //删除后需要判断分供方是否可编辑
                        var getData = $("#TableContainer").datagrid("getData").rows;
                        if (getData.length > 0) {
                            var isBool = false;
                            for (var i = 0; i < getData.length; i++) {
                                if (getData[i]["CId"] != "") {
                                    isBool = true;
                                    break;
                                }
                            }
                            if (isBool == false) {
                                //$("#Payee").removeAttr("readonly");
                                //$("#BankAccount").removeAttr("readonly");
                                //$("#BankName").removeAttr("readonly");
                            }
                        } else {
                            //$("#Payee").removeAttr("readonly");
                            //$("#BankAccount").removeAttr("readonly");
                            //$("#BankName").removeAttr("readonly");

                            //$("#Payee").val("");
                            //$("#BankAccount").val("");
                            //$("#BankName").val("");
                        }
                    }
                }
                , '-',
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        ClientClick();
                    }
                }
                , '-', {
                    text: '备注',
                    iconCls: 'icon-help',
                    handler: function () {
                        $('#DlgMemo').parent().appendTo($("form:first"))
                        $('#DlgMemo').dialog('open');
                    }
                }
            ];
            if ($("#Statue").val() == "未启动") {
                toolbar = toolbar_Start;
            }
            else {
                if ($("#Statue").val() == "审核中") {
                    toolbar = [];
                }
                if ($("#Statue").val() == "已审核") {
                    toolbar = [];
                }
            }

            function UpFileAdjunct() {
                var IsInit = "0";
                if (document.all.WorkFlowManage_InfoId.value == "-1") {
                    IsInit = 1;
                }
                else {
                    IsInit = 0;
                }
                var strPage = "../OAPublicWork/OAPublicWorkUpFileAdjunct.aspx?IsInit=" + IsInit + "&Type=0015&KeyId=" + document.all.KeyId.value + "&AddFile=" + document.all.AddFile.value + "&random=" + Math.random();
                var obj = window.showModalDialog(strPage, obj, 'dialogWidth=600px;dialogHeight=300px');

                if (obj != null) {
                    document.getElementById("FileList").innerHTML = obj;
                }
            }

            function AddRows(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var isIn = 0;
                //判断是否有合同
                var isCId = false;
                for (var i = 0; i < _Data.rows.length; i++) {
                    if (_Data.rows[i].CId != "" && _Data.rows[i].ChId == row["ChId"]) {
                        isIn = 1;
                    }
                    if (_Data.rows[i].CId != "" && _Data.rows[i].CId != null && _Data.rows[i].CId != undefined) {
                        isCId = true;
                    }
                }
                if (isIn == 0) {
                    //判断，只要有一笔合同费用，默认为合同的“分供方名称”、开户行、账号，不允许修改

                    if (row["SupplierName"] == "" || row["SupplierName"] == null || row["SupplierName"] == undefined) {
                        //$("#Payee").removeAttr("readonly");
                        //$("#BankAccount").removeAttr("readonly");
                        //$("#BankName").removeAttr("readonly");
                    } else {
                        //$("#Payee").attr("readonly", "readonly");
                        //$("#BankAccount").attr("readonly", "readonly");
                        //$("#BankName").attr("readonly", "readonly");
                        //自动填充
                        //$("#Payee").val(row["SupplierName"]);
                        //$("#BankAccount").val("");
                        //$("#BankName").val("");
                    }
                    $('#TableContainer').datagrid('insertRow', {
                        index: row_index,
                        row: {
                            PcId: row["PcId"],
                            PlanId: row["PlanId"],
                            CId: row["CId"],
                            ContractNo: row["ContractNo"],
                            ContractName: row["ContractName"],
                            ChId: row["ChId"],
                            CostId: row["CostId"],
                            CastName: row["CastName"],
                            Schedule: row["Schedule"],
                            PayType: row["PayType"],
                            DepCode: row["DepCode"],
                            CommId: row["CommId"],
                            CsId: row["CsId"],
                            SubjectName: row["SubjectName"],
                            BudgetCsId: row["CsId"],
                            BudgetSubjectName: row["SubjectName"],
                            ContractMoney: row["ContractMoney"],
                            ContractPayedMoney: row["ContractPayedMoney"],
                            PayMonth: row["PayMonth"],
                            PayMoney: ToDecimal(row["PayMoney"], 2),
                            PayedMoney: ToDecimal(row["PayedMoney"], 2),
                            DeclareMoney: ToDecimal(row["DeclareMoney"], 2),
                            AgreeMoney: ToDecimal(row["AgreeMoney"], 2),
                            //ActualPayment: ToDecimal(row["ActualPayment"], 2),
                            ActualPayment: ToDecimal(row["AgreeMoney"], 2),
                            BudgetPayMoney: ToDecimal(row["BudgetPayMoney"], 2),
                            Rate: (row["Rate"] == null ? '' : row["Rate"]),
                            PlanCoding: row["PlanCoding"],
                            PlanDetailId: row["PlanDetailId"],
                            PlanName: row["PlanName"],
                            ContractType: row["ContractType"],
                            Payee: row["SupplierName"],
                            BankName: row["BankName"],
                            BankAccount: row["BankAccount"],
                            VoucherNo: '',
                            VoucherCode: '',
                            DeliveryOrderNo: '',  // 送货单号
                            PutStorageOrderNo: '',   //入库单号
                            CostTreatment: ''   // 成本处理方式
                        }
                    });
                }
            }
            var IsAddNoContractFees = false;
            //添加无合同费用
            function AddCharge() {
                if ($("#DepCode").val() != "" && IsAddNoContractFees == false) {
                    var Rows = $('#TableContainer').datagrid("getRows");
                    if (Rows.length == 0) {
                        //同步调用
                        $.tool.DataPostInfoAsync('CsCost', 'ValidatePayDepartmentIsContractFees', "DepCode=" + $("#DepCode").val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "true") {
                                    alert("该机构部门下存在合同费用");
                                }
                            },
                            function _completeCallBack() {
                            },
                            function errorCallback() {
                            }, '正在验证，请稍候', false);
                    }
                }

                HDialog.Open(650, 480, '../CostManageNew/PlanningDeclarationChargeAdd.aspx?Flag=ZF&CommId=' + $("#CommId").val()
                    + '&DepCode=' + $("#DepCode").val(), '新增无合同费用', true, function callback(_Data) {
                        var obj = JSON.parse(_Data);
                        if (obj != null) {
                            var _Data1 = $('#TableContainer').datagrid('getData');
                            var row_index = _Data1.rows.length;
                            if (obj.BudgetPayMoney == "") {
                                obj.BudgetPayMoney = 0;
                            }
                            $('#TableContainer').datagrid('insertRow',
                                {
                                    index: row_index,
                                    row: {
                                        PcId: '',
                                        PlanId: '1000',
                                        CId: obj.CId,
                                        ContractNo: '',
                                        ContractName: '',
                                        ChId: '',
                                        CostId: obj.CostId,
                                        CastName: obj.CastName,
                                        Schedule: obj.Schedule,
                                        PayType: obj.PayType,
                                        DepCode: $("#DepCode").val(),
                                        CommId: $("#CommId").val(),
                                        CsId: obj.CsId,
                                        SubjectName: obj.CsName,
                                        BudgetCsId: obj.CsId,
                                        BudgetSubjectName: obj.CsName,
                                        ContractMoney: ToDecimal(obj.ContractMoney, 2),
                                        ContractPayedMoney: '',
                                        PayMonth: obj.PayMonth,
                                        PayMoney: ToDecimal(obj.PayMoney, 2),
                                        PayedMoney: ToDecimal(obj.PayedMoney, 2),
                                        DeclareMoney: ToDecimal(obj.DeclareMoney, 2),
                                        AgreeMoney: 0.00,
                                        ActualPayment: 0.00,
                                        BudgetPayMoney: ToDecimal(obj.BudgetPayMoney, 2),
                                        Rate: obj.Rate,
                                        PlanCoding: '',
                                        PlanDetailId: '',
                                        PlanName: '',
                                        ContractType: "",
                                        Payee: '',
                                        BankName: '',
                                        BankAccount: '',
                                        VoucherNo: '',
                                        VoucherCode: '',
                                        DeliveryOrderNo: '',  // 送货单号
                                        PutStorageOrderNo: '',   //入库单号
                                        CostTreatment: ''  // 成本处理方式
                                    }
                                });
                            UpdateAmount(1);
                        }
                    });
            }
            function AddChargeRows(row) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                var isIn = 0;
                for (var i = 0; i < _Data.rows.length; i++) {
                    if (_Data.rows[i].ChId == row["ChId"]) {
                        isIn = 1;
                    }
                }
                //alert(row["PlanId"]);
                if (isIn == 0) {
                    //判断，只要有一笔合同费用，默认为合同的“分供方名称”、开户行、账号，不允许修改
                    //$("#BankAccount").attr("readonly", "readonly");
                    //$("#BankName").attr("readonly", "readonly");
                    //$("#Payee").attr("readonly", "readonly");
                    //自动填充
                    //$("#Payee").val(row["SupplierName"]);
                    //$("#BankAccount").val("");
                    //$("#BankName").val("");
                    //console.log(row);

                    $('#TableContainer').datagrid('insertRow', {
                        index: row_index,
                        row: {
                            PcId: '100',
                            PlanId: '100',
                            CId: row["CId"],
                            ContractNo: row["ContractNo"],
                            ContractName: row["ContractName"],
                            ChId: row["ChId"],
                            CostId: row["CostId"],
                            CastName: row["CastName"],
                            Schedule: '',
                            PayType: row["PayType"],
                            DepCode: row["DepCode"],
                            CommId: row["CommId"],
                            CsId: row["CsId"],
                            SubjectName: row["SubjectName"],
                            BudgetCsId: row["CsId"],
                            BudgetSubjectName: row["SubjectName"],
                            ContractMoney: ToDecimal(row["PayMoney"], 2),
                            ContractPayedMoney: ToDecimal(row["PayedMoney"], 2),
                            PayMonth: row["PayMonth"],
                            PayMoney: ToDecimal(row["PayMoney"], 2),
                            PayedMoney: ToDecimal(row["PayedMoney"], 2),
                            DeclareMoney: 0.00,
                            AgreeMoney: 0.00,
                            ActualPayment: 0.00,
                            BudgetPayMoney: ToDecimal(row["BudgetPayMoney"], 2),
                            Rate: (row["Rate"] == null ? '' : row["Rate"]),
                            PlanCoding: '',
                            PlanDetailId: '',
                            PlanName: '',
                            ContractType: row["ContractType"],
                            Payee: row["SupplierName"],
                            BankName: row["BankName"],
                            BankAccount: row["BankAccount"],
                            VoucherNo: '',
                            VoucherCode: '',
                            DeliveryOrderNo: '',  // 送货单号
                            PutStorageOrderNo: '',   //入库单号
                            CostTreatment: ''  // 成本处理方式
                        }
                    });
                }

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
                HDialog.Open(w, h, '../CostManageNew/SelContractChargeList.aspx?CommId=' + $("#CommId").val() + '&DepCode=' + $("#DepCode").val() + "&Flag=ZF", '选择合同费用', true, function callback(_Data1) {
                    if (_Data1 != null && _Data1 != undefined) {
                        var arrjsons = JSON.parse(_Data1);
                        var isBool = false;
                        if (arrjsons.length > 0) {
                            //判断支付费用表是否存在数据
                            //if ($("#TableContainer").datagrid("getRows").length > 0) {
                            //    for (var i = 0; i < arrjsons.length; i++) {
                            //        if (arrjsons[i]["SupplierName"] != null && arrjsons[i]["SupplierName"] != "" && arrjsons[i]["SupplierName"] != undefined) {
                            //            if ($("#Payee").val() != "" && arrjsons[i]["SupplierName"] != $("#Payee").val()) {
                            //                isBool = true;
                            //                break;
                            //            }
                            //        }
                            //    }
                            //}
                            var _Data = $('#TableContainer').datagrid('getData');
                            var isDifference = false;
                            //有合同类别的数据  合同类别一定要相同
                            for (var i = 0; i < _Data.rows.length; i++) {
                                for (var j = 0; j < arrjsons.length; j++) {
                                    if (arrjsons[j]["ContractType"] != null && _Data.rows[i].ContractType != "" && arrjsons[j]["ContractType"] != undefined && _Data.rows[i].ContractType != undefined && arrjsons[j]["ContractType"] != _Data.rows[i].ContractType) {
                                        isDifference = true;
                                        break;
                                    }
                                }
                            }
                            //if (isBool == true) {
                            //    HDialog.Info("不同分供方的合同费用不允许选择在一张付款单上");
                            //}
                            if (isDifference == true) {
                                HDialog.Info("不同合同类别的费用不允许选择在一张付款单上");
                            } else {
                                for (var i = 0; i < arrjsons.length; i++) {
                                    //alert(_Data1);
                                    AddChargeRows(arrjsons[i]);
                                }
                                //按照规则计算每一行的值 
                                UpdateAmount(1);
                            }
                        }
                    }
                });
            }

            function AddPlanCharge() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../CostManageNew/PlanningChargeSel.aspx?Flag=ZF&CommId=' + $("#CommId").val() + '&DepCode=' + $("#DepCode").val(), '选择资金计划费用', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        //var jsons = json.substr(1, json.length - 1); 
                        var arrjsons = JSON.parse(_Data);
                        //if (arrjsons.length > 0) {
                        //    for (var i = 0; i < arrjsons.length; i++) {
                        //        AddRows(arrjsons[i]);
                        //    }
                        //    //按照规则计算每一行的值 
                        //    UpdateAmount(1);
                        //}
                        var isBool = false;
                        if (arrjsons.length > 0) {
                            //判断支付费用表是否存在数据
                            //if ($("#TableContainer").datagrid("getRows").length > 0) {
                            //    for (var i = 0; i < arrjsons.length; i++) {
                            //        if (arrjsons[i]["SupplierName"] != null && arrjsons[i]["SupplierName"] != "" && arrjsons[i]["SupplierName"] != undefined) {
                            //            if ($("#Payee").val() != "" && arrjsons[i]["SupplierName"] != $("#Payee").val()) {
                            //                isBool = true;
                            //                break;
                            //            }
                            //        }
                            //    }
                            //}
                            var _Data = $('#TableContainer').datagrid('getData');
                            var isDifference = false;
                            //有合同类别的数据  合同类别一定要相同
                            for (var i = 0; i < _Data.rows.length; i++) {
                                for (var j = 0; j < arrjsons.length; j++) {
                                    if (arrjsons[j]["ContractType"] != null && _Data.rows[i].ContractType != "" && arrjsons[j]["ContractType"] != undefined && _Data.rows[i].ContractType != undefined && arrjsons[j]["ContractType"] != _Data.rows[i].ContractType) {
                                        isDifference = true;
                                        break;
                                    }
                                }
                            }
                            //if (isBool == true) {
                            //    HDialog.Info("不同分供方的合同费用不允许选择在一张付款单上");
                            //}
                            if (isDifference == true) {
                                HDialog.Info("不同合同类别的费用不允许选择在一张付款单上");
                            } else {
                                for (var i = 0; i < arrjsons.length; i++) {
                                    AddRows(arrjsons[i]);
                                }
                                //按照规则计算每一行的值 
                                UpdateAmount(1);
                            }
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
                //HDialog.Open('370', '360', '../dialog/DepartmentDlg_hr.aspx', '选择部门', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split('\t');
                //        $("#DepCode").val(varObjects[0]);
                //        $("#DepName").val(varObjects[1]);
                //    }
                //});
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle_Cost.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
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
                            ContractNo1: "",
                            ContractName: "合计",
                            ContractMoney: ComputeGridCol("ContractMoney"),
                            ContractPayedMoney: ComputeGridCol("ContractPayedMoney"),
                            DeclareMoney: ComputeGridCol("DeclareMoney"),
                            PayedMoney: ComputeGridCol("PayedMoney"),
                            PayMoney: ComputeGridCol("PayMoney"),
                            AgreeMoney: ComputeGridCol("AgreeMoney"),
                            ActualPayment: ComputeGridCol("ActualPayment")

                        }
                    ]);
                    //alert(ComputeGridCol("PayedMoney"))
                    $("#showPayMoney").val(ComputeGridCol("PayedMoney"));
                }
                else {
                    if (editIndex != undefined) {
                        $("#TableContainer").datagrid('acceptChanges', editIndex);
                        // row.Quantity
                        var index = editIndex;
                        var rowData = $('#TableContainer').datagrid('getData').rows[index];
                        //成本处理方式 不能为空
                        if (rowData.CostTreatment == "" || rowData.CostTreatment == undefined) {
                            HDialog.Info("请选择成本处理方式！");
                            return false;
                        }

                        //检查申购价格是否允许调低及调高价格,如果违反规则,则申购价置为参考价
                        var ActualPayment = 0;

                        var sl = parseFloat(rowData.PayMoney - rowData.PayedMoney);

                        if (rowData.PlanId != undefined && rowData.PlanId.length > 30) {
                            sl = parseFloat(rowData.AgreeMoney);
                        }

                        if (parseFloat(rowData.ActualPayment) > sl) {
                            if (rowData.PlanId != undefined && rowData.PlanId.length > 30) {
                                HDialog.Info("输入金额大于计划审批金额！");
                            }
                            else
                                HDialog.Info("输入金额大于未付款金额！");
                            //超过最大值时候触发
                            ActualPayment = sl;
                        }
                        else {
                            ActualPayment = rowData.ActualPayment;
                        }

                        $('#TableContainer').datagrid('updateRow',
                            {
                                index: index,
                                row: {
                                    ActualPayment: ToDecimal(ActualPayment, 2)
                                }
                            });

                        //计算页脚合计
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                ContractName: "合计",
                                ContractMoney: ComputeGridCol("ContractMoney"),
                                ContractPayedMoney: ComputeGridCol("ContractPayedMoney"),
                                DeclareMoney: ComputeGridCol("DeclareMoney"),
                                PayedMoney: ComputeGridCol("PayedMoney"),
                                PayMoney: ComputeGridCol("PayMoney"),
                                AgreeMoney: ComputeGridCol("AgreeMoney"),
                                ActualPayment: ComputeGridCol("ActualPayment")

                            }
                        ]);
                        //alert(ComputeGridCol("PayedMoney"))
                        $("#showPayMoney").val(ComputeGridCol("PayedMoney"));
                        //alert(ComputeGridCol("ActualPayment"));
                        //$("#Amount").val(ComputeGridCol("ActualPayment"));
                    }
                }
                var ShowAmount = ComputeGridCol("ActualPayment");
                var showPayMoney = ComputeGridCol("PayMoney");
                $("#showPayMoney").val(showPayMoney);
                $("#Amount").val(ShowAmount)
                $.tool.DataPostAsync('CsCost', 'CmycurD', 'num=' + ShowAmount,
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#BigNum").val(_Data);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            };

            //验证该成本科目下的请付金额不能大于预算金额
            function CheckMoneyAll() {
                var boolMoney = true;
                //取出预算科目的总金额(返回值_Data,A:预算金额已使用完，B:未设置预算，C:查询到多条预算（预算设置有误），D:未获取到前台传入参数，程序异常,等于空验证通过，E:输入金额超出预算金额)
                $.tool.DataPostInfoAsync('CsCost', 'CheckBudgetSubjectMoney', 'selected=' + $("#selected").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "D") {
                            HDialog.Info("未获取到前台传入参数，程序异常");
                            $("#BudgetPayMoney").numberbox("setValue", "0");
                            boolMoney = false;
                        }
                        else if (_Data == "C") {
                            HDialog.Info("查询到多条预算，预算设置有误");
                            $("#BudgetPayMoney").numberbox("setValue", "0");
                            boolMoney = false;
                        }
                        else {
                            var obj = _Data.split('|');//obj[0]标识判断，obj[1]成本科目，obj[2]可用预算)
                            if (obj[0] == "B") {
                                HDialog.Info("“" + obj[1] + "”" + "科目未设置预算金额");
                                boolMoney = false;
                            } else if (obj[0] == "A") {
                                HDialog.Info("“" + obj[1] + "”" + "科目预算金额已使用完");
                            }
                            else if (obj[0] == "E") {
                                //当前录入应付金额不得大于预算剩余金额-支付审批报账审核通过的金额）预算剩余可显示负数
                                HDialog.Info("“" + obj[1] + "”" + "科目应付金额已超出预算剩余金额");
                                boolMoney = false;
                            } else {
                                boolMoney = true;
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, '正在计算,请稍侯', false);
                return boolMoney;
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
            var parCostTreatmentList = {
                rows: [
                    { id: "计入成本", name: "计入成本" },
                    { id: "不计成本", name: "不计成本" },
                    { id: "待摊成本", name: "待摊成本" }
                ]
            };
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
                        if ($("#Statue").val() == "未启动") {//只有未提交审核时才能操作 
                            $('#TableContainer input:checkbox').each(function (index, el) {
                                el.disabled = false;
                            });
                            //加载页脚  ActualPayment
                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    ContractName: "合计",
                                    DeclareMoney: ToDecimal("0.00", decimalPos),
                                    ContractMoney: ToDecimal("0.00", decimalPos),
                                    ContractPayedMoney: ToDecimal("0.00", decimalPos),
                                    PayedMoney: ToDecimal("0.00", decimalPos),
                                    PayMoney: ToDecimal("0.00", decimalPos),
                                    AgreeMoney: ToDecimal("0.00", decimalPos),
                                    ActualPayment: ToDecimal("0.00", decimalPos)
                                }
                            ]);
                            UpdateAmount(1);
                        }
                        else {
                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    CommId: "NO",
                                    ContractName: "合计",
                                    DeclareMoney: ToDecimal(ComputeGridCol("DeclareMoney"), decimalPos),
                                    ContractMoney: ToDecimal(ComputeGridCol("ContractMoney"), decimalPos),
                                    ContractPayedMoney: ToDecimal(ComputeGridCol("ContractPayedMoney"), decimalPos),
                                    PayedMoney: ToDecimal(ComputeGridCol("PayedMoney"), decimalPos),
                                    PayMoney: ToDecimal(ComputeGridCol("PayMoney"), decimalPos),
                                    AgreeMoney: ToDecimal(ComputeGridCol("AgreeMoney"), decimalPos),
                                    ActualPayment: ToDecimal(ComputeGridCol("ActualPayment"), decimalPos)
                                }
                            ]);
                        }
                    },
                    onClickRow: function (rowIndex, rowData) {
                        if ($("#Statue").val() == "已审核") return;
                        if (editIndex != undefined) {
                            //发起时允许编辑,审核中不允许编辑
                            $("#TableContainer").datagrid('acceptChanges', editIndex);
                        }

                        //发起时允许编辑,审核中不允许编辑
                        if ($("#Statue").val() == "未启动") {
                            //UpdateAmount(0);
                            editIndex = rowIndex;

                            //去除编辑器
                            $("#TableContainer").datagrid('removeEditor', 'ActualPayment');
                            $("#TableContainer").datagrid('removeEditor', 'Rate');
                            $("#TableContainer").datagrid('removeEditor', 'BudgetSubjectName');
                            $("#TableContainer").datagrid('removeEditor', 'Payee');
                            $("#TableContainer").datagrid('removeEditor', 'BankName');
                            $("#TableContainer").datagrid('removeEditor', 'BankAccount');
                            $("#TableContainer").datagrid('removeEditor', 'VoucherNo');
                            $("#TableContainer").datagrid('removeEditor', 'VoucherCode');

                            $("#TableContainer").datagrid('removeEditor', 'DeliveryOrderNo');//送货单号
                            $("#TableContainer").datagrid('removeEditor', 'PutStorageOrderNo');//入库单号
                            $("#TableContainer").datagrid('removeEditor', 'CostTreatment');//成本处理方式  必填
                            //发起时允许编辑,审核中不允许编辑
                            $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                                {
                                    field: 'ActualPayment',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: 2
                                        }
                                    }
                                }, {
                                    field: 'Rate',
                                    editor: {
                                        type: 'numberbox',
                                        options: {
                                            precision: 4
                                        }
                                    }
                                }, {
                                    field: 'BudgetSubjectName', editor: { type: 'text' }
                                }, {
                                    field: 'Payee', editor: { type: 'text' }
                                }, {
                                    field: 'BankName', editor: { type: 'text' }
                                }, {
                                    field: 'BankAccount', editor: { type: 'text' }
                                }, {
                                    field: 'VoucherNo', editor: { type: 'text' }
                                }, {
                                    field: 'VoucherCode', editor: { type: 'text' }
                                }, {
                                    field: 'DeliveryOrderNo', editor: { type: 'text' }
                                }, {
                                    field: 'PutStorageOrderNo', editor: { type: 'text' }
                                }, {
                                    field: 'CostTreatment', editor: {
                                        type: 'combobox',
                                        options: {
                                            editable: false,
                                            panelHeight: 'auto',
                                            valueField: 'id',
                                            textField: 'name',
                                            data: parCostTreatmentList.rows
                                        }
                                    }
                                }
                            ]);
                            //开始编辑
                            $("#TableContainer").datagrid('beginEdit', rowIndex);
                            //选择成本科目
                            var ed = $('#TableContainer').datagrid('getEditors', rowIndex);
                            $(ed[1].target).bind("click", function () {
                                SelCostSubject(rowIndex);
                            });

                        }
                    }
                });
                //根据成本管控设置控制按钮
                if ($("#Statue").val() == "未启动") {
                    $('.datagrid-toolbar a').each(function () {
                        if ($(this).attr("id") == "HaveContract" && $("#PayWay").val().indexOf("HaveContract") < 0) {
                            $(this).parent().hide();
                            $(this).parent().next().hide();
                        }
                        if ($(this).attr("id") == "NoContract" && $("#PayWay").val().indexOf("NoContract") < 0) {
                            $(this).parent().hide();
                            $(this).parent().next().hide();
                        }
                        if ($(this).attr("id") == "BudgetPlan" && $("#PayWay").val().indexOf("BudgetPlan") < 0) {
                            $(this).parent().hide();
                            $(this).parent().next().hide();
                        }
                    })
                }
            }


            LoadList();

            //选择成本科目
            function SelCostSubject(rowIndex) {
                HDialog.Open('400', '350', '../DialogNew/SelCostSubject.aspx?IsCM=1&OnlyChildren=true', '选择成本科目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $('#TableContainer').datagrid('updateRow',
                            {
                                index: rowIndex,
                                row: {
                                    Rate: varObjects[2],
                                    BudgetSubjectName: varObjects[1],
                                    BudgetCsId: varObjects[0]
                                }
                            });
                        endEdit();
                    }
                });
            }


            function CheckActualPayment() {
                //判断请付金额不超过应付金额
                $.ajax({
                    url: '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CsCost&Command=CheckActualPayment',
                    type: 'POST',
                    dataType: 'text',
                    data: { "selected": $("#selected").val() },
                    cache: false,
                    async: false,
                    success: function (_Data) {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                            $("#CheckActualPayment").val(_Data);
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        HDialog.Info("数据读取错误");
                    }
                });
            }

            //初始化加载数据
            var btnRows = JSON.parse($("#SearchResult").val());
            //加载数据
            $('#TableContainer').datagrid('loadData', btnRows);

            //和盟要求付款方式为现金的时候不显示这两个列
            function PayModeChange() {
                if ($("#PayMode").find("option:selected").text() == "现金") {
                    $("#TableContainer").datagrid("hideColumn", "BankAccount");
                    $("#TableContainer").datagrid("hideColumn", "BankName");
                } else {
                    $("#TableContainer").datagrid("showColumn", "BankAccount");
                    $("#TableContainer").datagrid("showColumn", "BankName");
                }
            }

            String.prototype.replaceAll = function (s1, s2) {
                return this.replace(new RegExp(s1, "gm"), s2);
            }

            PayModeChange();
            function ClientClick() {
                if (UpdateAmount(0) == false) return;
                var Empty = "";
                var PayeeEmpty = "";
                var BankNameEmpty = "";
                var BankAccountEmpty = "";
                var CostTreatmentEmpty = "";
                var VoucherCodeErrorMsg = "";
                var VoucherCodeList = "";
                var rows = $('#TableContainer').datagrid('getRows');
                if (rows.length == 0) {
                    HDialog.Info("请录入请付明细数据！");
                    return;
                }
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i].Payee == "") {
                        PayeeEmpty += ",第" + (i + 1) + "行";
                    }
                    if (rows[i].BankName == "") {
                        BankNameEmpty += ",第" + (i + 1) + "行";
                    }
                    if (rows[i].BankAccount == "") {
                        BankAccountEmpty += ",第" + (i + 1) + "行";
                    }
                    if (rows[i].CostTreatment == "") {
                        CostTreatmentEmpty += ",第" + (i + 1) + "行";
                    }
                    if (rows[i].VoucherCode != "") {
                        //验证 发票代码是否在页面重复
                        var Node = rows.filter(function (e) {
                            return e.VoucherCode == rows[i].VoucherCode;
                        });
                        if (Node.length > 1) {
                            VoucherCodeErrorMsg = "发票代码【" + rows[i].VoucherCode + "】存在重复，请确认！";
                            break;
                        }
                        VoucherCodeList += rows[i].VoucherCode + ",";
                    }
                }
                if (VoucherCodeErrorMsg.length > 0) {
                    HDialog.Info(VoucherCodeErrorMsg);
                    return false;
                }
                if (VoucherCodeList.length > 0) {
                    VoucherCodeList = VoucherCodeList.substring(0, VoucherCodeList.length - 1);
                }
                if (CostTreatmentEmpty.length > 0) {
                    Empty += CostTreatmentEmpty.substr(1, CostTreatmentEmpty.length) + "成本处理方式为空<br />";
                }
                if (Empty > "") {
                    HDialog.Info(Empty);
                    return false;
                }
                $("#Empty").val(Empty);
                $("#SearchResult").val(JSON.stringify(rows));
                //判断列表请付金额是否大于预算金额（同项目，同科目，同年月）
                var rowDataAll = JSON.stringify(rows);
                var SelectedData = rowDataAll.replaceAll("SubjectName", "CsName");
                $("#selected").val(SelectedData);
                //验证发票代码不重复
                if (VoucherCodeList.length > 0 && ValidateVoucherCode(VoucherCodeList) == false) return false;
                //发起请付审批时，对于成本“不计成本”、“待摊成本”的请付明细，不进行预算管控检测
                if (CheckMoneyAll() == false) return false;
                CheckActualPayment();
            }

            //验证发票代码不重复
            function ValidateVoucherCode(VoucherCodeList) {
                var boolMoney = true;
                $.tool.DataPostInfoAsync('CsCost', 'ValidateVoucherCode', 'VoucherCodeList=' + VoucherCodeList + "&PayId=" + $("#PayId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            boolMoney = true;
                        } else {
                            HDialog.Info("发票代码【" + _Data + "】存在重复，请确认");
                            boolMoney = false;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, '正在计算,请稍侯', false);
                return boolMoney;
            }

            $("input[type='submit']").click(function (e) {
                var IsSubmitFlag = true;

                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }
                if (ClientClick() == false) return false;
                if (checkSubmit() == false) return false;
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);
                //   UpdateAmount(0);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                        HDialog.Info("请选择审批流程");
                        return false;
                    }
                    var rows = $("#TableContainer").datagrid("getRows");
                    if (rows.length < 1) {
                        HDialog.Info("请选择计划列表!");
                        return false;
                    }
                    var trlength = $("#WorkFlowNodeList tr").length;
                    if (trlength < 2) {
                        HDialog.Info("请给该流程设置处理人");
                        return false;
                    }
                    //将列表数据保存到文本框中,提交
                    $("#SearchResult").val(JSON.stringify(rows));
                    return true;
                }
                else {
                    return false;
                }
            });

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
            //var IsSubmitFlag = true;
            //$("input[type='submit']").click(function (e) {
            //    if (ClientClick() == false) return false;
            //    if (IsSubmitFlag == false) {
            //        HDialog.Info("30秒内不要重复点击");
            //        return false;
            //    }
            //    IsSubmitFlag = false;
            //    setTimeout('IsSubmitFlag=true', 30000);
            //    var isValid = $("#frmForm").form('validate');
            //    if (isValid == true) {
            //        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
            //            HDialog.Info("请选择审批流程");
            //            return false;
            //        }
            //        return true;
            //    }
            //    else {
            //        return false;
            //    }
            //});


            //双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if (ClientClick() == false) return;

                if ($("#Empty").val() != "") {
                    return;
                }
                //判断请付金额是否超出预算金额，若超出不允许提交
                if ($("#ActualPayment").val() != "") {
                    HDialog.Info("请付金额超出预算金额，不允许提交");
                    return;
                }
                if ($("#CheckActualPayment").val() != "") {
                    HDialog.Info("请付金额超出未付金额，不允许提交");
                    return;
                }
                if ($("#Statue").val() == "未启动" || $("#Statue").val() == "已驳回") {
                    //获取列表上所有合同类别
                    var data = $("#TableContainer").datagrid("getData");
                    var ContractType = '';
                    var HaveChargePlan = '1';
                    for (var i = 0; i < data.rows.length; i++) {
                        ContractType += "," + data.rows[i].ContractType;
                        if (data.rows[i].PlanId == undefined && data.rows[i].PlanId.length < 30) {
                            HaveChargePlan = '0';
                        }
                    }
                    if (ContractType.length > 0) {
                        ContractType = ContractType.substr(1, ContractType.length - 1);
                        //$.tool.DataPostAsync('CsCost', 'GetWorkFlowContractType', 'ContractType=' + ContractType,
                        // function Init() {
                        // },
                        // function callback(_Data) {
                        //     if (_Data != "")
                        //         FlowId = _Data;
                        // },
                        // function completeCallback() {
                        // },
                        // function errorCallback() {
                        // }, false);
                    }

                    var FlowId = GetWorkFlow.CostWorkFlowId('0706', ContractType, $("#Amount").val(), HaveChargePlan);
                    if (FlowId == undefined || FlowId == "undefined") {
                        FlowId = "";
                    }
                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0706&FlowId=" + FlowId + "&biaoshi=1&random=" + Math.random();
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
            function Delete(obj) {
                $(obj).prev().remove();
                $(obj).remove();
                $("#FilesName").val("");
                $("#FilesPath").val("");
                GetAttach();
            }

            //文件上传
            //上传文件相关js
            function UploadCallBack(addr, Name) {
                var v = "<a target=\"_blank\" href=\"" + addr + "\" class=List url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"Delete(this);\">&nbsp;删除&nbsp;</span>"
                $("#List").append(v);
                $("#FilesName").val(Name);
                $("#FilesPath").val(addr);
                GetAttach();
            }
            function GetAttach() {
                var v = $("#List").html();
                re = /\"/g;
                var mi = v.replace(re, "'");
                $("#FilesHtml").val(mi);
            }

            //打印
            $("#BtnIsPrint").click(function (e) {
                //剩余金额
                var rows = $('#TableContainer').datagrid('getRows');
                var BudgetPayMoney = "";
                if (rows != "" && rows != null && rows != undefined) {
                    for (var i = 0; i < rows.length; i++) {
                        BudgetPayMoney += "," + rows[i]["BudgetPayMoney"] + "|" + rows[i]["PlanId"];
                    }
                }
                if (BudgetPayMoney.length != "") {
                    BudgetPayMoney = BudgetPayMoney.substring(1, BudgetPayMoney.length)
                }

                var InstanceId = document.all.WorkFlowManage_InfoId.value;
                var InstanceTypeCode = "0015";
                var Attribute = "<Attribute><IsSubReport>1</IsSubReport><Id>" + $("#PayId").val() + "</Id><BudgetPayMoney>" + BudgetPayMoney + "</BudgetPayMoney><InstanceId>" + InstanceId + "</InstanceId><InstanceTypeCode>" + InstanceTypeCode + "</InstanceTypeCode></Attribute>";

                //var Attribute = "<Attribute><Id>" + $("#PayId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
                ope("PayReimbursement", Attribute, 1);
            });
            function ope(ReportName, Attribute, SubReportEvent) {
                var w = window.screen.width;
                var h = window.screen.height;
                window.open('/HM/M_Main/ReportData/ReportDataCommon.aspx?ReportName=' + ReportName + '&Attribute=' + Attribute + '&SubReportEvent=' + SubReportEvent);
            };
            //$("#BtnIsPrint").click(function (e) {
            //    if ($("#OpType").val() == "add") return;
            //    var InstanceId = document.all.WorkFlowManage_InfoId.value;
            //    var Attribute = "<Attribute><Id>" + $("#AllocationId").val() + "</Id><InstanceId>" + InstanceId + "</InstanceId></Attribute>";
            //    $.tool.Print("Allocation", Attribute);
            //});
            function OnFileList() {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = "";
                for (var i = 0; i < rows.length; i++) {
                    total += "," + rows[i]["PlanId"];
                }
                HDialog.Open(600, 450, '../Plan/PlanDetailFiles.aspx?DetailId=' + total.slice(1), '查看计划附件', true, function callback(_Data) {
                });
            }
        </script>

    </form>
</body>
</html>
