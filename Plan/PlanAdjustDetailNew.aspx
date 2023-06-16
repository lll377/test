<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanAdjustDetailNew.aspx.cs" Inherits="M_Main.Plan.PlanAdjustDetailNew" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划单调整页面</title>
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
    <script type="text/javascript" src="../jscript/Cache.js"></script>

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


        .Bar {
            position: relative;
            width: 75%;
            /* 宽度 */ border: 1px solid #B1D632;
            padding: 1px;
        }

            .Bar div {
                display: block;
                position: relative;
                background: peachpuff; /* 进度条背景颜色 */
                color: #333333;
                height: 20px; /* 高度 */
                line-height: 20px;
                /* 必须和高度一致，文本才能垂直居中 */
            }

                .Bar div span {
                    position: absolute;
                    width: 100%;
                    /* 宽度 */ text-align: center;
                    font-weight: bold;
                }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="PlanIds" name="PlanIds" runat="server" />
        <input type="hidden" id="AdjustmentID" name="AdjustmentID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />

        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <%--计划单开始时间--%>
        <input type="hidden" id="ActualStartTime" name="ActualStartTime" runat="server" />
        <%--计划单结束时间--%>
        <input type="hidden" id="ActualEndTime" name="ActualEndTime" runat="server" />
        <%--计划周期名称--%>
        <input type="hidden" id="PlanCycleName" name="PlanCycleName" runat="server" />

        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="StartPerson" name="StartPerson" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />

        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <%-- 计划列表数据内容（新增 修改 删除） --%>
        <input type="hidden" id="AddResult" name="AddResult" runat="server" value="" />
        <input type="hidden" id="UpdateResult" name="UpdateResult" runat="server" value="" />
        <input type="hidden" id="DelResult" name="DelResult" runat="server" value="" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />

        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="return  ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">计划单号：
                </td>
                <td class="DialogTdContent"><%--PlanChoice();--%>
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="PlanNOs" onclick="PlanChoice();" name="PlanNO" runat="server" />

                </td>
                <td class="DialogTdTitle">计划周期：</td>
                <td class="DialogTdContent">
                    <select id="PlanCycle" name="PlanCycle" runat="server" onchange="SelPlanCycle();" isdctype="true" dctype="计划周期" style="width: 75%; height: 25px; border: 1px #cccccc solid;" readonly="readonly" class="easyui-validatebox " data-options="required:true"></select>
                    <input type="hidden" id="PlanCycleID" name="PlanCycleID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划年度：
                </td>
                <td class="DialogTdContent">
                    <input id="PlanYears" name="PlanYears" type="text" readonly="readonly"
                        onclick="WdatePickerx({ dateFmt: 'yyyy', skin: 'default' })" runat="server" data-options="required:true" />
                </td>
                <td class="DialogTdTitle">计划月度：</td>
                <td class="DialogTdContent">
                    <select id="PlanMonths" readonly="readonly" name="PlanMonths" disabled="disabled" runat="server" style="width: 75%; height: 25px" data-options="required:true">
                        <option value="" selected style="color: #000000;"></option>
                        <option value="01" style="color: #000000;">一月</option>
                        <option value="02" style="color: #000000;">二月</option>
                        <option value="03" style="color: #000000;">三月</option>
                        <option value="04" style="color: #000000;">四月</option>
                        <option value="05" style="color: #000000;">五月</option>
                        <option value="06" style="color: #000000;">六月</option>
                        <option value="07" style="color: #000000;">七月</option>
                        <option value="08" style="color: #000000;">八月</option>
                        <option value="09" style="color: #000000;">九月</option>
                        <option value="10" style="color: #000000;">十月</option>
                        <option value="11" style="color: #000000;">十一月</option>
                        <option value="12" style="color: #000000;">十二月</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">责任人：
                </td>
                <td class="DialogTdContent">
                    <input id="BlamePName" name="BlamePName" class="easyui-validatebox" onclick="SelPersonx();" runat="server" />
                    <input type="hidden" id="BlamePId" name="BlamePId" data-options="required:true" runat="server" />
                </td>
                <td class="DialogTdTitle">责任部门：
                </td>
                <td class="DialogTdContent">
                    <input id="BlameDepName" name="BlameDepName" class="easyui-validatebox" runat="server" readonly="readonly" onclick="SelDepx();" data-options="required:true" />
                    <input type="hidden" id="BlameDepCode" name="BlameDepCode" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
                <td class="DialogTdTitle">计划主题：
                </td>
                <td class="DialogTdContent">
                    <input type="text" runat="server" class="easyui-validatebox" readonly="readonly" id="PlanTheme" name="PlanTheme" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">计划费用初始值：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="PlanCostInitial" readonly="readonly" name="PlanCostInitial" onchange="BudgetAdjustTypeChange()" runat="server" />
                </td>
                <td class="DialogTdTitle">前期费用调整值：
                </td>
                <td class="DialogTdContent">
                    <input type="text" runat="server" class="easyui-validatebox" id="EarlyStageCostAdjust" readonly="readonly" name="EarlyStageCostAdjust" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">本次费用调整值：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="ThisCostAdjust" readonly="readonly" name="ThisCostAdjust" runat="server" />
                </td>
                <td class="DialogTdTitle">预算额调整类型：
                </td>
                <td class="DialogTdContent">
                    <%--<input type="text" runat="server" class="easyui-validatebox"  id="BudgetAdjustType" name="BudgetAdjustType" />--%>
                    <select id="BudgetAdjustType" name="BudgetAdjustType" runat="server" isdctype="true" disabled="disabled" dctype="计划值调整类型" style="width: 75%; height: 25px; border: 1px #cccccc solid;" class="easyui-validatebox " data-options="required:true">
                        <option value="总量不变" selected style="color: #000000;">总量不变</option>
                        <option value="总量增加" style="color: #000000;">总量增加</option>
                    </select>
                    <input type="hidden" runat="server" id="BudgetAdjustTypeHid" name="BudgetAdjustTypeHid" />
                </td>
            </tr>
            <tr id="CompletionRate">
                <td class="DialogTdTitle">完成进度：
                </td>
                <td class="DialogTdContent">
                    <div class="Bar">
                        <div style="width: 0%;" id="DivCompletionProgress">
                            <span id="SpanCompletionProgress">0%</span>
                        </div>
                    </div>
                    <input type="hidden" id="HidDivCompletionProgress" runat="server" value="" />
                    <input type="hidden" id="HidSpanCompletionProgress" runat="server" value="" />
                </td>
                <td class="DialogTdTitle">完成比例：
                </td>
                <td class="DialogTdContent">
                    <input type="text" runat="server" class="easyui-validatebox" id="WanChengLv" name="WanChengLv" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto; margin-top: 5px;">
            <div id="TableContainer" style="max-height: 220px;"></div>
        </div>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <script type="text/javascript">

            function BudgetAdjustTypeChange() {
                //(本次费用调整值 +前期费用调整值)  > 0  =总量增加 
                //(本次费用调整值 +前期费用调整值)  <= 0  =总量不变
                var ThisCostAdjustVal = 0.00;//本次费用调整值
                if ($("#ThisCostAdjust").val() != '') {
                    ThisCostAdjustVal = $("#ThisCostAdjust").val();
                }
                var EarlyStageCostAdjustVal = 0.00;//前期费用调整值
                if ($("#EarlyStageCostAdjust").val() != '') {
                    EarlyStageCostAdjustVal = $("#EarlyStageCostAdjust").val();
                }
                if ((parseInt(EarlyStageCostAdjustVal) + parseInt(ThisCostAdjustVal)) > 0) {
                    //$("#BudgetAdjustType").val("总量增加");
                    document.getElementById('BudgetAdjustType').options[1].selected = true;
                    $('#BudgetAdjustTypeHid').val("总量增加");

                } else {
                    //$("#BudgetAdjustType").val("总量不变");
                    document.getElementById('BudgetAdjustType').options[0].selected = true;
                    $('#BudgetAdjustTypeHid').val("总量不变");
                }
            }

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();

            //加载字典设置
            function LoadDictionary() {
                $("select[isdctype='true']").each(function (i) {
                    var nId = $(this).attr("id");

                    $.tool.DataPostAsync('CsPlan', 'BindDictionary', 'DcTypeName=' + $(this).attr("dctype"),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            var option = "<option value=''></option>";
                            $("#" + nId).append(option);
                            for (var i = 0; i < varObjects.length; i++) {
                                var option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                                $("#" + nId).append(option);
                            }
                            $('#PlanCycle').val($('#PlanCycleID').val());
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                });
            }


            $("#BtnIsPrint").click(function () {
                HDialog.Info("暂未开发！");
            });

            //选择部门
            function SelDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择责任部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#BlameDepCode").val(arrRet[0]);
                        $("#BlameDepName").val(arrRet[1]);
                    }
                });
            }
            //选择责任人
            function SelPerson() {
                HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?Cmd=3&MultiLine=0&WorkInfoId=-1&random=' + Math.random(), '选择责任人', false, function callback(_Data) {
                    if (_Data != '') {
                        var Ret = Cache.GetData("SelOrp.aspx_Return");
                        var obj = JSON.parse(Ret);
                        if (obj != null) {
                            var arrUserList = obj[0].split(',');
                            //for (var i = 0; i < arrUserList.length; i++) {
                            //    arrUser = arrUserList[i].split(',');
                            //    TempUserList = TempUserList + arrUser[1] + ",";
                            //}
                            $("#BlamePId").val(arrUserList[1]);
                            $("#BlamePName").val(arrUserList[0].split(']')[1]);
                        }
                    }
                });
            }

            //计划周期
            function SelPlanCycle() {
                $('#PlanCycleID').val($('#PlanCycle option:selected').val());
                $('#PlanCycleName').val($('#PlanCycle option:selected').text());//计划周期名称

            }

            var editIndexForDetail = undefined;
            function endEditionForDetail() {
                if (editIndexForDetail == undefined) {
                    return true
                }
                if ($('#TableContainer').datagrid('validateRow', editIndexForDetail)) {
                    $('#TableContainer').datagrid('endEdit', editIndexForDetail);
                    editIndexForDetail = undefined;
                    return true;
                } else {
                    return false;
                }
            }
            function onClickCellForDetail(Rowindex, field, value) {
                $('#TableContainer').datagrid('selectRow', Rowindex);
                var SelecteRow = $('#TableContainer').datagrid("getSelected");

                if (endEditionForDetail()) {
                    if (field == "ThisPlanStartTime" || field == "ThisPlanEndTime" || field == "PlanAdjustValue" || field == "ThisPlanCost"
                        || field == "ThisTarget") {
                        $('#TableContainer').datagrid('beginEdit', Rowindex);

                        //绑定JS事件
                        var ed = $('#TableContainer').datagrid('getEditors', Rowindex);

                        for (var i = 0; i < ed.length; i++) {
                            var e = ed[i];

                            //选择开始时间
                            if (e.field == "ThisPlanStartTime" || e.field == "ThisPlanEndTime") {
                                $(e.target).bind("click", function () {
                                    var dateObj = WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' });
                                    var field = e.field;
                                    $('#TableContainer').datagrid('updateRow',
                                        {
                                            index: Rowindex,
                                            row: {
                                                field: date
                                            }
                                        });
                                })
                            }

                        }
                    }
                    editIndexForDetail = Rowindex;
                }
            }
            function onAfterEditForDetail(rowIndex, row, changes) {
                var updated = $('#TableContainer').datagrid('getChanges', 'updated');
                if (updated.length < 1) {
                    $('#TableContainer').datagrid('unselectAll');
                    return;
                } else {
                    if (editIndexForDetail != undefined) {
                        $("#TableContainer").datagrid('acceptChanges', editIndexForDetail);
                        $('#TableContainer').datagrid('endEdit', editIndexForDetail);
                    }
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


            //将 列表内容存入隐藏控件中
            function ClientClick(isAudit) {
                var data = $('#TableContainer').datagrid("getRows");
                if (data.length == 0) {
                    return false;
                }
                for (var i = 0; i < data.length; i++) {
                    var PlanNme = data[i].PlanName;
                    var PlanNO = data[i].PlanNO;
                    if (PlanNO == null || PlanNO == undefined || PlanNO == "") {
                        PlanNO = "";
                    } else {
                        PlanNO = "(" + PlanNO + ")";
                    }
                    if (data[i].ChangeType == null || data[i].ChangeType == undefined || data[i].ChangeType == "") {
                        HDialog.Info("计划[" + PlanNme + PlanNO + ")],请选择计划调整类型!");
                        return false;
                    }
                    if (data[i].ChangeReson == null || data[i].ChangeReson == undefined || data[i].ChangeReson == "") {
                        HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整原因!");
                        return false;
                    }
                    if (data[i].ThisPlanStartTime == null || data[i].ThisPlanStartTime == undefined || data[i].ThisPlanStartTime == "") {
                        HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整计划开始时间!");
                        return false;
                    }
                    if (data[i].ThisPlanEndTime == null || data[i].ThisPlanEndTime == undefined || data[i].ThisPlanEndTime == "") {
                        HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整计划结束时间!");
                        return false;
                    }
                    if (data[i].ThisChangePlanContent == null || data[i].ThisChangePlanContent == undefined || data[i].ThisChangePlanContent == "") {
                        HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整计划内容!");
                        return false;
                    }
                    if (data[i].ThisChangePlanExplain == null || data[i].ThisChangePlanExplain == undefined || data[i].ThisChangePlanExplain == "") {
                        //HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整计划说明!"); 计划调整时计划说明改为非必填（必填项保持与计划编制时一样）。
                        //return false;
                    }
                    //if (data[i].ThisIsConnectBudget == null || data[i].ThisIsConnectBudget == undefined || data[i].ThisIsConnectBudget == "") {
                    //    data[i].ThisIsConnectBudget == data[i].IsConnectBudget;
                    //}
                    //if (data[i].ThisConnectBudgetWay == null || data[i].ThisConnectBudgetWay == null || data[i].ThisConnectBudgetWay == undefined || data[i].ThisConnectBudgetWay == "") {
                    //    data[i].ThisConnectBudgetWay == data[i].ConnectBudgetWay;
                    //}
                    //if (data[i].ThisConnectBudgetProject == null || data[i].ThisConnectBudgetProject == undefined || data[i].ThisConnectBudgetProject == "") {
                    //    data[i].ThisConnectBudgetProject == data[i].ConnectBudgetProject;
                    //}
                    if (data[i].ThisChangeTarget == null || data[i].ThisChangeTarget == undefined || data[i].ThisChangeTarget == "") {
                        HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整计划目标!");
                        return false;
                    }
                    if ((data[i].ThisChangePlanCost == null || data[i].ThisChangePlanCost == undefined || data[i].ThisChangePlanCost == "") && data[i].ThisChangePlanCost != '0') {
                        HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整计划费用（元）!");
                        return false;
                    }
                    if (data[i].ThisChangePlanNode == null || data[i].ThisChangePlanNode == undefined || data[i].ThisChangePlanNode == "") {
                        // HDialog.Info("计划[" + PlanNme + PlanNO + ")],请填写调整节点分解!");  //计划调整时计划说明改为非必填（必填项保持与计划编制时一样）。
                        //  return false;
                    }
                }
                var valideteReturn = Validate();
                if (valideteReturn == "false") {
                    return false;
                }
                if (isAudit == "送审") {
                    var PlanIsAuditRtr = PlanIsAudit();
                    if (PlanIsAuditRtr == "false") {
                        return false;
                    }
                }

                var CostAndBudgetValidateReturn = CostAndBudgetValidate();
                if (CostAndBudgetValidateReturn == "false") {
                    return false;
                }
                $("#AddResult").val(JSON.stringify(data));

                //var AddGridData = $('#TableContainer').datagrid('getChanges', 'inserted');
                ////验证是否是批量添加后编辑了的
                //for (var i = 0; i < AddGridData.length; i++) {
                //    if (AddGridData[i].PlanType == undefined || AddGridData[i].PlanType == "") {
                //        return false;
                //    }
                //    if (AddGridData[i].PlanStartTime == undefined || AddGridData[i].PlanStartTime == "") {
                //        return false;
                //    }
                //    if (AddGridData[i].PlanEndTime == undefined || AddGridData[i].PlanEndTime == "") {
                //        return false;
                //    }
                //}

                ////获取新增的数据
                //$("#AddResult").val(JSON.stringify(AddGridData));
                ////获取修改的数据
                //var DataGridData = $('#TableContainer').datagrid("getRows");
                //$("#UpdateResult").val(JSON.stringify(DataGridData));
                ////获取删除的数据
                //$("#DelResult").val(JSON.stringify($('#TableContainer').datagrid('getChanges', 'deleted')));
                return true;
            }

            $("#DepCodeName").click(function (e) {
                return;
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepCodeName").val(arrRet[1]);
                    }
                });
            });
            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (IsSubmitFlag == false) {
                    HDialog.Info("3秒内不要重复点击");
                    return false;
                }
                var valideteReturn = Validate();
                if (valideteReturn == "false") {
                    return false;
                }
                if (ClientClick($(this).val())) {
                    IsSubmitFlag = false;
                    setTimeout('IsSubmitFlag=true', 3000);
                    var isValid = $("#frmForm").form('validate');
                    if (isValid == true) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                            HDialog.Info("请选择审批流程");
                            return false;
                        }
                        return true;
                    }
                    else {
                        return false;
                    }
                } else {
                    //HDialog.Info("请修改批量添加计划内容");
                    return false;
                }
            });


            //计划单审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if ($('#BlamePId').val() == "" || $('#BlamePName').val() == "") {
                    HDialog.Info("请选择责任人");
                    return;
                }
                if ($('#BlameDepCode').val() == "" || $('#BlameDepName').val() == "") {
                    HDialog.Info("请选择责任部门");
                    return;
                }
                if ($('#PlanCycle option:selected').text() == "" || $('#PlanCycle').val() == "") {
                    HDialog.Info("请选择计划周期");
                    return;
                }
                var gridData = $('#TableContainer').datagrid("getRows");
                if (gridData == undefined || gridData.length == 0) {
                    HDialog.Info("请添加计划明细");
                    return;
                }
                if ($("#BudgetAdjustType").val().length <= 0) {
                    HDialog.Info("请选择计划调整类型!");
                    return;
                }
                //获取审批流程
                $.tool.DataPostAsync('CsPlan', 'GetPlanBudgetAdjustType', 'BudgetAdjustType=' + $("#BudgetAdjustType").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var FlowId = _Data;
                        if (FlowId.length <= 0) {
                            HDialog.Info("请设置计划调整审批类型后再进行操作!");
                            return;

                        }
                        //var valideteReturn = Validate();
                        //if (valideteReturn == "false") {
                        //    return false;
                        //}
                        if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                            //UpdateAmount(0);
                            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0802&biaoshi=1&FlowId=" + FlowId + "&InfoId=" + FlowId + "&random=" + Math.random();
                            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                                if (_Data != '') {
                                    var obj = JSON.parse(_Data);
                                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                                }
                            });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;

            }

            function RelationPlanSee(DetailId, ImportantPlanTitlenId, OpType, RelationPlan) {
                if (ImportantPlan == "1")
                    DetailId = ImportantPlanTitlenId;
                HDialog.Open(1200, 500, '../Plan/PlanImplementPlan.aspx?DetailId=' + DetailId + '&OpType=' + OpType + '&RelationPlan=' + RelationPlan, '重点计划', true, function callback(_Data) {

                });
            }
            ///选择计划单号
            function PlanChoice() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../Plan/PlanListLordDialog.aspx?SelectType=计划调整', '选择计划单', true, function callback(_Data) {
                    var rows = JSON.parse(_Data);
                    $("#DetailId").val(rows.DetailId);
                    $("#PlanIds").val(rows.PlanId);
                    $("#PlanNOs").val(rows.PlanNO);
                    $("#PlanCycle").val(rows.PlanCycle);
                    $("#PlanCycleID").val(rows.PlanCycle);
                    $("#PlanCycleName").val(rows.PlanCycleName);
                    $("#BlamePId").val(rows.BlamePId);
                    $("#PlanYears").val(rows.PlanYear);
                    $("#PlanMonths").val(rows.PlanMonth);
                    $("#BlameDepCode").val(rows.BlameDepCode);
                    $("#PlanTheme").val(rows.PlanTheme);
                    $("#TableContainer").datagrid('loadData', { total: 0, rows: [] });
                    LoadCostInitial();
                });


            }

            function LoadCostInitial() {

                if ($("#OpType").val() != 'edit') {
                    //获取计划费用初始值和前期费用调整值
                    $.tool.DataPostAsync('CsPlan', 'GetChargeCost', 'PlanID=' + $("#PlanIds").val() + "&AdjustmentID=" + $("#AdjustmentID").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $("#PlanCostInitial").val(_Data.split('|')[0]);
                            $("#EarlyStageCostAdjust").val(_Data.split('|')[1]);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
                BudgetAdjustTypeChange();
            }

            //选择计划
            function BatchReference() {
                if ($("#PlanNOs").val() == null || $("#PlanNOs").val() == '') {
                    HDialog.Info("请选择计划单后再进行计划选择!");
                    return;
                }
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanBatchReference.aspx?PlanId=' + $("#PlanIds").val() + '&IsCloseOrAuditing=2', '选择计划', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                AddRows(varObjects[i]);
                            }
                            Calculation();
                        }
                    }
                });

            }

            function AddRows(obj) {

                var _Data1 = $('#TableContainer').datagrid('getData');
                var row_index = _Data1.rows.length;
                //PlanSumCost
                var PlanSumCost = obj.PlanSumCost; //计划累计完成费用
                var PlanAdjustValueSum = 0.00; //费用调整值
                var ThisChangePlanCostSum = 0.00;//现计划费用
                var ChangeReson = "";
                var UpdateStateVar = '0';
                if (obj.IsClose == '是')  //已关闭的根据累计完成费用自动算出调整值
                {
                    ChangeReson = '该条计划已关闭，计划费用调整值根据计划累计完成费用自动算出!';
                    PlanAdjustValueSum = PlanSumCost - obj.PlanCost;
                    ThisChangePlanCostSum = PlanSumCost;
                    UpdateStateVar = '99';
                    obj.ChangeType = "变更";
                    obj.ChangeType
                } else {
                    ChangeReson = obj.ChangeReson;
                    PlanAdjustValueSum = obj.PlanAdjustValue;
                    ThisChangePlanCostSum = obj.ThisChangePlanCost;
                }



                var RowIndex = $('#TableContainer').datagrid("getRowIndex", obj.DetailId);
                if (RowIndex != -1) { return; }
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Sort: (row_index + 1),
                        PlanId: $("#PlanIds").val(),
                        PlanYearMonth: obj.PlanYearMonth,//计划年月
                        PlanName: obj.PlanName,//
                        PlanCoding: obj.PlanCoding,//计划编码
                        IsComplete: obj.IsComplete,//是否完成
                        IsClose: obj.IsClose,  //是否关闭
                        PlanStartTime: obj.PlanStartTime,    //原计划开始时间
                        ThisPlanStartTime: obj.ThisPlanStartTime,  //现计划开始时间
                        PlanEndTime: obj.PlanEndTime, //原计划结束时间
                        ThisPlanEndTime: obj.ThisPlanEndTime,// 现计划结束时间
                        Target: obj.Target, //原计划目标
                        ThisChangeTarget: obj.ThisChangeTarget,//现计划目标
                        PlanCost: obj.PlanCost,  //原计划费用
                        ThisChangePlanCost: ThisChangePlanCostSum,//现计划费用
                        PlanAdjustValue: PlanAdjustValueSum,  //费用调整值
                        ChangeType: obj.ChangeType,//调整类型
                        ChangeReson: ChangeReson,//调整原因
                        ThisChangePlanContent: obj.ThisChangePlanContent,//调整内容
                        ThisChangePlanExplain: obj.ThisChangePlanExplain,//计划说明
                        ThisIsConnectBudget: obj.ThisIsConnectBudget,//是否关联预算
                        ThisConnectBudgetWay: obj.ThisConnectBudgetWay,//关联预算方式
                        ThisConnectBudgetProject: obj.ThisConnectBudgetProject,//关联预算科目
                        ThisConnectBudgetProjectName: obj.ThisConnectBudgetProjectName,//关联预算科目
                        ThisChangePlanNode: obj.ThisChangePlanNode,//节点分解
                        IsAdd: obj.IsAdd,//默认修改
                        DetailId: obj.DetailId,//计划id
                        PlanType: obj.PlanType,//计划类型
                        PlanTypeName: obj.PlanTypeName,//计划类型
                        PlanId: obj.PlanId,//计划单id
                        PlanYear: obj.PlanYear,//计划年
                        PlanMonth: obj.PlanMonth,//计划月
                        PlanNO: obj.PlanNO,//计划单号
                        PlanCycleAdd: obj.PlanCycleAdd,//计划周期
                        BlamePNameAdd: obj.BlamePNameAdd,//责任人
                        BlamePId: obj.BlamePId,//责任人id
                        BlameDepNameAdd: obj.BlameDepNameAdd,//责任人单位
                        Point: obj.Point,//所占分值
                        GetCost: obj.GetCost,//所占金额
                        PlanAssigned: obj.PlanAssigned,//计划交办
                        ImportantPlan: obj.ImportantPlan,//是否重点计划
                        RelationPlan: obj.RelationPlan,//关联计划
                        PlanExplain: obj.PlanExplain, //原计划说明
                        PlanContent: obj.PlanContent, //原计划内容
                        PlanRemark: obj.PlanRemark, //原计划备注
                        AssistMan: obj.AssistMan, //原计划协助人
                        AssistManName: obj.AssistManName, //原计划协助人
                        PlanSource: obj.PlanSource, //计划来源
                        ImportantPlanTitlen: obj.ImportantPlanTitlen, //重点计划名称
                        ImportantPlanTitlenId: obj.ImportantPlanTitlenId, //重点计划id
                        Rate: obj.Rate,
                        DutyUser: obj.DutyUser,
                        EvaluationUser: obj.EvaluationUser,
                        DutyUserName: obj.DutyUserName,
                        EvaluationUserName: obj.EvaluationUserName,
                        PayDepCode: obj.PayDepCode,
                        PayDepName: obj.PayDepName,
                        IsDelete: '0',
                        UpdateState: UpdateStateVar, //修改状态,为100的时候就是修改过的数据


                    }
                });
            }


            //编辑计划
            function PlanDetailEdit(id, OpType, IsAdd, UpdateState) {
                if ($("#PlanNOs").val() == null || $("#PlanNOs").val() == '') {
                    HDialog.Info("请选择计划单后再进行操作!");
                    return;
                }
                //flag 0:计划编制的时候 可以编辑所有数据 1：计划编制审批的时候 只能填写部分东西
                var Flag = '1';
                var State = $("#State").val();

                if ($("#State").val() == "未启动" || $("#State").val() == "已驳回" || $("#State").val() == "") {
                    Flag = '0';
                } else if ($("#State").val() == "已审核") {
                    Flag = '2';
                } else if ($("#State").val() == "审核中") {
                    Flag = '0';
                }
                var w = top.$(window).width();
                var h = parent.$(window).height() + 20;
                if (id != "") {
                    var RowIndex = $('#TableContainer').datagrid("getRowIndex", id);
                    var data = $('#TableContainer').datagrid('getData').rows[RowIndex];
                    var ChangePlanCostVal = 0;
                    if (data.PlanCost != '') {
                        ChangePlanCostVal = data.PlanCost;
                    }

                    Cache.SetData("PlaningJsonDetailListRowData", JSON.stringify(data));//当前修改数据 增加到缓存中 以便后期使用

                    HDialog.Open(w, h, '../Plan/PlanAdjustDetailPlaning.aspx?ChangeId=&DetailId=' + id + '&OpType=' + OpType + "&State=" + State + "&IsAdd=" + IsAdd + "&UpdateState=" + UpdateState, '计划调整', true, function callback(_Data) {
                        if (_Data != '') {
                            var ReturnJson = Cache.GetData("ReturnPlaningJsonObjectAll");
                            ReturnJson = eval("(" + ReturnJson.replace(/\\/g, "/") + ")")

                            if (_Data != null || ReturnJson != null) {
                                for (var i = 0; i < ReturnJson.length; i++) {
                                    var RowIndex = $('#TableContainer').datagrid("getRowIndex", ReturnJson[i].DetailId);
                                    var obj = ReturnJson[i];
                                    if (RowIndex != -1) {
                                        //修改
                                        $('#TableContainer').datagrid('updateRow', {
                                            index: RowIndex,
                                            row: {
                                                ChangeType: obj.ChangeType,
                                                ChangeReson: obj.ChangeReson,
                                                ThisPlanStartTime: obj.ThisPlanStartTime,
                                                ThisPlanEndTime: obj.ThisPlanEndTime,//现时间 添加是默认为原来的
                                                ThisChangePlanContent: obj.ThisChangePlanContent,
                                                ThisChangePlanExplain: obj.ThisChangePlanExplain,
                                                ThisIsConnectBudget: obj.ThisIsConnectBudget,
                                                ThisConnectBudgetWay: obj.ThisConnectBudgetWay == "" ? "" : obj.ThisConnectBudgetWay,
                                                ThisConnectBudgetProject: obj.ThisConnectBudgetProject == "" ? "" : obj.ThisConnectBudgetProject,//关联预算科目
                                                ThisConnectBudgetProjectName: obj.ThisConnectBudgetProjectName == "" ? "" : obj.ThisConnectBudgetProjectName,//关联预算科目
                                                ThisChangeTarget: obj.ThisChangeTarget,
                                                ThisChangePlanCost: obj.ThisChangePlanCost,
                                                PlanAdjustValue: obj.ThisChangePlanCost - ChangePlanCostVal,  //费用调整值
                                                ThisChangePlanNode: obj.ThisChangePlanNode,
                                                DutyUser: obj.DutyUser,
                                                EvaluationUser: obj.EvaluationUser,
                                                ThisDutyUser: obj.ThisDutyUser,
                                                ThisEvaluationUser: obj.ThisEvaluationUser,
                                                DutyUserName: obj.DutyUserName,
                                                EvaluationUserName: obj.EvaluationUserName,
                                                ThisDutyUserName: obj.ThisDutyUserName,
                                                ThisEvaluationUserName: obj.ThisEvaluationUserName,
                                                UpdateState: '100' //修改状态,为100的时候就是修改过的数据
                                            }
                                        });
                                        Calculation();
                                    }
                                }
                            }
                        }
                    });
                } else {
                    HDialog.Open(800, 670, '../Plan/PlanPlaningList_Edit.aspx?OpType=' + OpType + '&DetailId=' + id + "&Flag=" + Flag + "&PlanCycle=" + $("#PlanCycleName").val() + "&PlanYear=" + $("#PlanYears").val() + "&IsAdjust=1", '计划详情', true, function callback(_Data) {
                        var ReturnJson = Cache.GetData("ReturnJsonObjectAll");
                        ReturnJson = eval("(" + ReturnJson.replace(/\\/g, "/") + ")")
                        if (_Data != null || ReturnJson != null) {
                            for (var i = 0; i < ReturnJson.length; i++) {
                                var RowIndex = $('#TableContainer').datagrid("getRowIndex", ReturnJson[i].DetailId);
                                var obj = ReturnJson[i];
                                if (RowIndex == -1) {
                                    var _Data1 = $('#TableContainer').datagrid('getData');
                                    var row_index = _Data1.rows.length;
                                    //新增
                                    $('#TableContainer').datagrid('insertRow', {
                                        index: row_index,
                                        row: {
                                            Sort: obj.Sort,
                                            PlanYearMonth: obj.PlanYear + '-' + obj.PlanMonth,//计划年月
                                            PlanName: obj.PlanName,//
                                            PlanCoding: obj.PlanCoding,//计划编码
                                            IsComplete: '否',//是否完成
                                            IsClose: '否',  //是否关闭
                                            PlanStartTime: obj.PlanStartTime,    //原计划开始时间
                                            ThisPlanStartTime: obj.PlanStartTime,  //现计划开始时间
                                            PlanEndTime: obj.PlanEndTime, //原计划结束时间
                                            ThisPlanEndTime: obj.PlanEndTime,// 现计划结束时间
                                            Target: obj.Target, //原计划目标
                                            ThisChangeTarget: obj.Target,//现计划目标
                                            PlanCost: 0,// obj.PlanCost,  //原计划费用
                                            ThisChangePlanCost: obj.PlanCost,//现计划费用
                                            PlanAdjustValue: '0',  //费用调整值
                                            ChangeType: '新增',//调整类型
                                            ChangeReson: '',//调整原因
                                            ThisChangePlanContent: obj.PlanContent,//调整内容
                                            ThisChangePlanExplain: obj.PlanExplain,//计划说明
                                            ThisIsConnectBudget: obj.IsConnectBudget == "" ? "" : obj.IsConnectBudget,//是否关联预算
                                            ThisConnectBudgetWay: obj.ConnectBudgetWay == "" ? "" : obj.ConnectBudgetWay,//关联预算方式
                                            ThisConnectBudgetProject: obj.ConnectBudgetProject == "" ? "" : obj.ConnectBudgetProject,//关联预算科目
                                            ThisConnectBudgetProjectName: obj.ConnectBudgetProjectName == "" ? "" : obj.ConnectBudgetProjectName,//关联预算科目
                                            ThisChangePlanNode: obj.PlanNode,//节点分解
                                            IsAdd: '1',//默认修改
                                            DetailId: obj.DetailId,//计划id
                                            PlanType: obj.PlanType,//计划类型
                                            PlanTypeName: obj.PlanTypeName,//计划类型
                                            PlanId: $("#PlanIds").val(),//计划单id
                                            PlanYear: obj.PlanYear,//计划年
                                            PlanMonth: obj.PlanMonth,//计划月
                                            PlanNO: $("#PlanNOs").val(),//计划单号
                                            PlanCycleAdd: $("#PlanCycleName").text(),//计划周期
                                            BlamePNameAdd: $("#BlamePName").val(),//责任人
                                            BlamePId: $("#BlamePId").val(),//责任人id
                                            BlameDepNameAdd: $("#BlameDepName").val(),//责任人单位
                                            Point: obj.Point,//所占分值
                                            GetCost: obj.GetCost,//所占金额
                                            PlanAssigned: '',//计划交办
                                            ImportantPlan: obj.ImportantPlan,//是否重点计划
                                            RelationPlan: '',//关联计划
                                            PlanExplain: obj.PlanExplain, //原计划说明
                                            PlanContent: obj.PlanContent, //原计划内容
                                            PlanRemark: obj.PlanRemark, //原计划备注
                                            AssistMan: obj.AssistMan, //原计划协助人
                                            PlanSource: obj.PlanSource, //计划来源
                                            ImportantPlanTitlen: obj.ImportantPlanTitlen, //重点计划名称
                                            ImportantPlanTitlenId: obj.ImportantPlanTitlenId, //重点计划id
                                            PayDepName: obj.PayDepName, //费用部门
                                            Rate: obj.Rate,
                                            PayDepCode: obj.PayDepCode,
                                            IsDelete: '0',
                                            PlanAdjustValue: '0',
                                            UpdateState: '0' //修改状态,为100的时候就是修改过的数据

                                        }
                                    });
                                    Calculation();
                                }
                            }
                        }
                    });
                }
            }

            //工具栏
            var toolbar = [];
            var toolbar_Start = [
                {
                    text: '选择计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        BatchReference();
                    }
                }, '-',
                {
                    text: '取消选择',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row == null) {
                            HDialog.Info("请选择需要取消的数据");
                            return;
                        }

                        for (var i = 0; i < row.length; i++) {

                            var index = $("#TableContainer").datagrid("getRowIndex", row[i]);
                            $('#TableContainer').datagrid('deleteRow', index);

                        }

                    }
                }, '-', {
                    text: '新增计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        PlanDetailEdit("", "insert", 1, '0');
                    }
                }
            ];

            var toolbar_Start1 = [
                //{
                //    text: '新增计划',
                //    iconCls: 'icon-add',
                //    handler: function () {
                //        PlanDetailEdit("", "insert", 1,'0');
                //    }
                //}, '-',
                //{
                //    text: '排除计划',
                //    iconCls: 'icon-cancel',
                //    handler: function () {
                //        var row = $("#TableContainer").datagrid("getChecked");
                //        if (row == null) {
                //            HDialog.Info("请选择删除数据");
                //            return;
                //        }
                //        for (var i = 0; i < row.length; i++) {

                //            var index = $("#TableContainer").datagrid("getRowIndex", row[i]);
                //            $('#TableContainer').datagrid('deleteRow', index);

                //        }
                //    }
                //}
            ];

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 40, align: 'center', sortable: true },
                { field: 'PlanYearMonth', title: '计划年月', width: 60, align: 'center', sortable: true },
                { field: 'PlanTypeName', title: '计划类型', width: 60, align: 'center', sortable: true },
                {
                    field: 'ImportantPlan', title: '是否重点计划', align: 'center', width: 60, sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (row.ImportantPlan == 0) {
                            str = "是";
                        } else {
                            str = "否";
                        } return str;
                    }
                },
                {
                    field: 'PlanName', title: '计划名称', align: 'left', width: 150, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"PlanDetailEdit('" + row.DetailId + "','edit','" + row.IsAdd + "','" + row.UpdateState + "');\">" + row.PlanName + "</a>";
                        return str;
                    }
                },
                { field: 'PlanCoding', title: '计划编码', width: 60, align: 'center', sortable: true },
                { field: 'IsComplete', title: '是否完成', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'IsClose', title: '是否关闭', width: 60, align: 'center', sortable: true },
                {
                    field: 'PlanStartTime', title: '原计划开始时间', width: 120, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ThisPlanStartTime', title: '现计划开始时间', width: 120, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (row.ThisPlanStartTime == "") {
                            str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                        } else {
                            str = formatDate(row.ThisPlanStartTime, "yyyy-MM-dd");
                        }
                        return str;
                    }
                },
                {
                    field: 'PlanEndTime', title: '原计划结束时间', width: 120, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PlanEndTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ThisPlanEndTime', title: '现计划结束时间', width: 120, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "";
                        if (row.ThisPlanEndTime == "") {
                            str = formatDate(row.PlanEndTime, "yyyy-MM-dd");
                        } else {
                            str = formatDate(row.ThisPlanEndTime, "yyyy-MM-dd");
                        }
                        return str;
                    }
                },
                { field: 'Target', title: '原计划目标', width: 120, align: 'left', sortable: true },
                { field: 'ThisChangeTarget', title: '现计划目标', width: 120, align: 'left', sortable: true },
                { field: 'PlanCost', title: '原计划费用', width: 120, align: 'center', sortable: true },
                { field: 'ThisChangePlanCost', title: '现计划费用', width: 120, align: 'center', sortable: true },
                { field: 'PlanAdjustValue', title: '费用调整值', align: 'center', width: 120, sortable: true },
                { field: 'DutyUserName', title: '原责任人', align: 'center', width: 120, sortable: true },
                { field: 'EvaluationUserName', title: '原考评人', align: 'center', width: 120, sortable: true },
                { field: 'ThisDutyUserName', title: '现责任人', align: 'center', width: 120, sortable: true },
                { field: 'ThisEvaluationUserName', title: '现考评人', align: 'center', width: 120, sortable: true },

                //调整后的数据
                { field: 'ChangeType', title: '调整类型', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ChangeReson', title: '调整原因', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ThisChangePlanContent', title: '调整内容', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ThisChangePlanExplain', title: '计划说明', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ThisIsConnectBudget', title: '是否关联预算', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ThisConnectBudgetWay', title: '关联预算方式', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ThisConnectBudgetProject', title: '关联预算科目', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ThisConnectBudgetProjectName', title: '关联预算科目', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                { field: 'ThisChangePlanNode', title: '节点分解', align: 'center', width: 60, sortable: true, hidden: true },//调整后存在
                //判断是新增还是旧数据
                { field: 'IsAdd', title: '判断是新增还是修改(后台使用)', align: 'center', width: 60, sortable: true, hidden: true },
                //计划信息
                { field: 'DetailId', title: 'DetailId', align: 'center', width: 100, sortable: true, hidden: true },
                { field: 'PlanType', title: '计划类型', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'PlanId', title: '计划单id', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'PlanYear', title: '计划年', align: 'center', width: 100, sortable: true, hidden: true },
                { field: 'PlanMonth', title: '计划月', align: 'center', width: 100, sortable: true, hidden: true },
                { field: 'PlanNO', title: '计划单号', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'PlanCycleAdd', title: '周期', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'BlamePNameAdd', title: '责任人', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'BlameDepNameAdd', title: '责任单位', width: 60, align: 'center', sortable: true, hidden: true },
                { field: 'Point', title: '所占分值', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'GetCost', title: '所占金额', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PlanAssigned', title: '计划交办', align: 'center', width: 60, sortable: true, hidden: true },
                {
                    field: 'RelationPlan', title: '关联计划', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"RelationPlanSee('" + row.DetailId + "','" + row.ImportantPlanTitlenId + "','See','" + row.RelationPlan + "');\">" + row.RelationPlan + "</a>";
                        return str;
                    }, hidden: true
                },
                { field: 'PlanExplain', title: '原计划说明', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PlanContent', title: '原计划内容', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PlanRemark', title: '原计划备注', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'Rate', title: '税率', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PayDepCode', title: '费用部门', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PayDepName', title: '--', align: 'center', width: 60, sortable: true, hidden: true },

                { field: 'AssistMan', title: '原计划协助人', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PlanSource', title: '计划来源', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'ImportantPlanTitlen', title: '重点计划名称', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'ImportantPlanTitlenId', title: '重点计划id', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'IsDelete', title: 'ss', align: 'center', width: 60, sortable: true, hidden: true },

            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    idField: "DetailId",
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsPlan&Command=GetAdjustmentDetailList&AdjustmentID=' + $("#AdjustmentID").val(),
                    view: myview,
                    toolbar: toolbar,
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    columns: column,
                    rownumbers: true,
                    fitColumns: false,
                    singleSelect: false,
                    pagination: true,
                    border: false,
                    showFooter: false,
                    striped: true,
                    onLoadSuccess: function () {
                        if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {//只有未提交审核时才能操作 
                            $('#TableContainer input:checkbox').each(function (index, el) {
                                el.readonly = false;
                            });
                        }
                    }
                });
                LoadCostInitial();
            }

            //算取费用
            function Calculation() {
                //将页面数据传入后台进行管控（验证：总量不变/总量增加）
                //var rows = $('#TableContainer').datagrid('getRows');
                //if (rows.length > 0) {
                //    var rowDataAll = JSON.stringify(rows);
                //    $("#selected").val(rowDataAll);
                //    $.tool.DataPostInfoAsync('CsPlan', 'CheckAdjustmentType ', 'selected=' + $("#selected").val(),
                //        function Init() {
                //        },
                //        function callback(_Data) {
                //            if (_Data == "总量增加") {
                //                document.getElementById('BudgetAdjustType').options[1].selected = true;
                //                $('#BudgetAdjustTypeHid').val("总量增加");
                //            } if (_Data == "总量不变") {
                //                document.getElementById('BudgetAdjustType').options[0].selected = true;
                //                $('#BudgetAdjustTypeHid').val("总量不变");
                //            } 
                //        },
                //        function completeCallback() {
                //        },
                //        function errorCallback() {
                //        }, '正在计算,请稍侯', false);
                //}


                //var PlanCostInitial = 0;
                //var EarlyStageCostAdjust = 0;
                var ThisCostAdjust = 0;
                var rowsList = $('#TableContainer').datagrid("getRows");
                if (rowsList != null && rowsList.length > 0) {
                    for (var i = 0; i < rowsList.length; i++) {
                        var rows = rowsList[i];
                        //①计划费用初始值：计划单中所有初始计划费用之和（成本类的支付费用）；
                        //if (rows.PlanCost != '' && rows.PlanCost != null && rows.PlanTypeName == '成本类')
                        //{
                        //    PlanCostInitial += parseInt(rows.PlanCost);
                        //}
                        //②前期费用调整值：计划单中所有计划调整费用之和，可能是正数或负数；只包含已经审核通过的调整值；
                        //if (rows.PlanCost != '' && rows.PlanCost != null && rows.AuditingState == '已审核')
                        //{
                        //    EarlyStageCostAdjust += parseInt(rows.PlanCost);
                        //}
                        //③本次费用调整值：自动获取本次计划调整费用之和
                        if ((rows.ThisChangePlanCost != '' && rows.ThisChangePlanCost != undefined && rows.ThisChangePlanCost != null) || rows.ThisChangePlanCost == 0) {
                            ThisCostAdjust += parseFloat(rows.PlanAdjustValue);
                        }
                        //④预算额调整类型：总量不变/总量增加，自动检测，不得修改，计划调整单中所涉科目“计划费用当前值（本次调整后）≤预算费用初始值+预算费用调整值”时，为“总量不变”；
                        //计划调整单中一个或多个科目“计划费用当前值（本次调整后）＞预算费用初始值+预算费用调整值”时，为“总量增加”；
                    }
                    $("#ThisCostAdjust").val(ThisCostAdjust);
                    //比较 前期费用调整值和本次费用调整值
                    BudgetAdjustTypeChange();
                }
            }


            $(document).ready(function () {
                $("#CompletionRate").hide();
                if ($("#State").val() == "未启动" || $("#State").val() == "已驳回" || $("#State").val() == "") {
                    toolbar = toolbar_Start;
                }
                else {

                    if ($("#State").val() == "审核中") {
                        toolbar = toolbar_Start1;
                    }
                    if ($("#State").val() == "已审核") {
                        toolbar = []; $("#CompletionRate").show();
                    }
                }
                //初始化加载进度条信息
                $("#DivCompletionProgress").css({ "width": $("#HidDivCompletionProgress").val() + "%" });
                $("#SpanCompletionProgress").html($("#HidSpanCompletionProgress").val() + "%");
                //加载字典设置 
                if (GetQueryString('OpType') == 'insert') {

                    $('#PlanCycle').validatebox({
                        required: true
                    });
                    $('#PlanNOs').removeAttr("readonly");
                } else { $('#PlanNOs').attr("readonly", "readonly"); }

                $('#PlanCycle').attr("readonly", "readonly");
                $('#PlanYears').attr("readonly", "readonly");
                $('#PlanMonths').attr("readonly", "readonly");
                $('#BlamePName').attr("readonly", "readonly");
                $('#BlameDepName').attr("readonly", "readonly");
                //$('#Memo').attr("readonly", "readonly");
                $('#PlanCostInitial').attr("readonly", "readonly");
                $('#EarlyStageCostAdjust').attr("readonly", "readonly");
                $('#ThisCostAdjust').attr("readonly", "readonly");
                $('#BudgetAdjustType').attr("readonly", "readonly");
                $('#PlanTheme').attr("readonly", "readonly");

                if ($("#PlanYears").val() == "") {
                    var date = new Date;
                    var year = date.getFullYear();
                    $("#PlanYears").val(year);
                    $("#PlanMonths").val((date.getMonth() + 1));
                }

                LoadDictionary();

                LoadList();
            });

            function Validate() {
                var data = $('#TableContainer').datagrid("getData");
                if (data.rows.length == 0) {
                    return false;
                }
                var DetailidList = '';
                for (var i = 0; i < data.rows.length; i++) {
                    if (data.rows[i].ImportantPlanTitlenId.length > 0) {
                        if (DetailidList.indexOf(data.rows[i].ImportantPlanTitlenId) < 0) {
                            DetailidList += ',|' + data.rows[i].ImportantPlanTitlenId + '|';
                        }
                    }
                }
                var flag = "true";
                if (DetailidList.length > 0) {
                    //同步调用
                    $.tool.DataPostInfoAsync('CsPlan', 'PlanTitlenVerification', "DetailidList=" + DetailidList,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                var dataarr = [];
                                var resultData = eval("(" + _Data + ")");
                                var SearchResult = $('#TableContainer').datagrid("getRows");
                                for (var i = 0; i < resultData.length; i++) {
                                    dataarr = data.rows.filter(function (e) {
                                        return e.ImportantPlanTitlenId == resultData[i]["DetailId"];
                                    });
                                    if (dataarr.length > 0) {
                                        var PlanCost = parseFloat(resultData[i].PlanCost);
                                        var SumPlanCost = parseFloat(resultData[i].TitlenPlanCost);
                                        for (var j = 0; j < dataarr.length; j++) {
                                            //判断修改
                                            if (dataarr[j].IsAdd != '1' && SearchResult.length > 0) {
                                                var updatedataarr = SearchResult.filter(function (e) {
                                                    return dataarr[j].DetailId = e.DetailId;
                                                });
                                                if (updatedataarr.length > 0) {
                                                    SumPlanCost = parseFloat(SumPlanCost) - parseFloat(updatedataarr.ThisChangePlanCost);
                                                }
                                            }
                                            SumPlanCost = parseFloat(SumPlanCost) + parseFloat(dataarr[j].ThisChangePlanCost);
                                        }
                                        //对比
                                        if (PlanCost < SumPlanCost) {
                                            HDialog.Info("重点计划(" + resultData[i].PlanName + ")计划费用超额");
                                            flag = "false";
                                        }

                                    }
                                }
                            }
                            $.tool.pageUnLoading();
                        },
                        function _completeCallBack() {
                        },
                        function errorCallback() {
                        }, '正在验证,请稍侯', false);
                }
                return flag;
            }
            //验证预算和成本发生的是否符合调整
            function CostAndBudgetValidate() {
                var flag = "true";
                var data = $('#TableContainer').datagrid("getData");
                if (data.rows.length == 0) {
                    return false;
                }

                var DataObj = [];
                var BudgetProgramIDList = "";
                for (var i = 0; i < data.rows.length; i++) {
                    var itemObj = {
                        PlanYearMonth: data.rows[i].PlanYearMonth,//预算年月
                        PlanAdjustValue: data.rows[i].PlanAdjustValue,//调整金额
                        ThisConnectBudgetProject: data.rows[i].ThisConnectBudgetProject,//预算项目
                        PlanName: data.rows[i].PlanName//计划名称
                    }
                    DataObj.push(itemObj);
                    BudgetProgramIDList += data.rows[i].ThisConnectBudgetProject + "#" + data.rows[i].PlanYearMonth + ",";
                }
                if (BudgetProgramIDList.length > 0) {
                    BudgetProgramIDList = BudgetProgramIDList.substring(0, BudgetProgramIDList.length - 1);
                }
                $.tool.pageLoading();
                var ParameterStr = "DataObj=" + JSON.stringify(DataObj) + "&BlameDepCode=" + $('#BlameDepCode').val() +
                    "&BudgetProgramIDList=" + BudgetProgramIDList + "&PlanId=" + $('#PlanIds').val();
                //同步调用
                $.tool.DataPostInfoAsync('CsPlan', 'CostAndBudgetValidate', ParameterStr,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            flag = "true";
                        } else {
                            HDialog.Info(_Data);
                            flag = "false";
                        }

                        $.tool.pageUnLoading();
                    },
                    function _completeCallBack() {
                        $.tool.pageUnLoading();
                    },
                    function errorCallback() {
                        $.tool.pageUnLoading();
                    }, '正在验证,请稍侯', false);

                return flag;
            }

            //送审验证
            function PlanIsAudit() {
                // //针对某一计划单新增调整记录；如果该计划单有审核中的调整记录（不含已登记未提交和审核未通过的记录），不允许同时提交；
                var flag = "true";
                var ParameterStr = "PlanId=" + $('#PlanIds').val();
                //同步调用
                $.tool.DataPostInfoAsync('CsPlan', 'PlanIsAudit', ParameterStr,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            flag = "true";
                        } else {
                            HDialog.Info("送审失败,该计划单当前已有审核中记录，请审核后再行送审!(可先保存)");
                            flag = "false";
                        }
                        $.tool.pageUnLoading();
                    },
                    function _completeCallBack() {
                        $.tool.pageUnLoading();
                    },
                    function errorCallback() {
                        $.tool.pageUnLoading();
                    }, '正在验证,请稍侯', false);

                return flag;
            }
        </script>
    </form>
</body>
</html>
