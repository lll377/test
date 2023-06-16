<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetChange_AddDetails.aspx.cs" Inherits="M_Main.BudgetNew.BudgetChange_AddDetails" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算调整详情</title>
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
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="ChangeID" name="ChangeID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="PlanID" name="PlanID" runat="server" />
        <input type="hidden" id="BudgetChangeType" name="BudgetChangeType" runat="server" />

        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="StartPerson" name="StartPerson" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />

        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <%-- 计划列表数据内容（选中） --%>
        <input type="hidden" id="AduitResult" name="AduitResult" runat="server" value="" />

        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
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
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="return ClientClick();" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onclientclick="return ClientClick();" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">调整单编号：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChangeNO" readonly="readonly" style="width: 90%;" name="ChangeNO" runat="server" />
                </td>
                <td class="DialogTdTitle">预算单位：</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="BudgetCompany" style="width: 90%;" name="BudgetCompany" runat="server" onclick="SelCostCompany();" onchange="change();" />
                    <input type="hidden" id="BudgetCompanyId" name="BudgetCompanyId" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">预算年度：
                </td>
                <td class="DialogTdContent">
                    <select id="BudgetYear" style="width: 90%; border: 1px #cccccc solid;" class="easyui-validatebox " data-options="required:true" name="PlanCycleName" runat="server" onchange="change();">
                        <option></option>
                        <option value="2015">2015</option>
                        <option value="2016">2016</option>
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                    </select>
                </td>
                <td class="DialogTdTitle">调整类型：
                </td>
                <td class="DialogTdContent">
                    <select id="ChangeType" name="ChangeType" class="easyui-validatebox" data-options="required:true" style="width: 90%; border: 1px #cccccc solid;" runat="server">
                        <option value=""></option>
                        <option value="总量不变">总量不变</option>
                        <option value="总量增加">总量增加</option>
                        <option value="总量调减">总量调减</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">调整原因：
                </td>
                <td class="DialogTdMemoContent" colspan="3" style="text-align: left;">
                    <input type="text" class="easyui-validatebox" id="ChangeMemo" style="width: 96%;" name="ChangeMemo" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">调整人：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChangeUser" style="width: 90%;" name="ChangeUser" runat="server" />
                </td>
                <td class="DialogTdTitle">调整时间：
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ChangeDate" style="width: 90%;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" name="ChangeDate" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdMemoContent" colspan="3" style="text-align: left;">
                    <input type="text" class="easyui-validatebox" id="Memo" style="width: 96%;" name="Memo" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">附&nbsp;&nbsp;件：
                </td>
                <td class="DialogTdMemoContent" colspan="3" style="text-align: left;">
                    <iframe id="UploadFrame" frameborder="0" width="75%" style="margin-top: 0px; height: 25px; float: left;" scrolling="no"></iframe>
                    <input type="button" name="fileList1" style="width: 70px; height: 25px;" value="查看列表" id="fileList1" runat="server" onclick="OnFileList();" />
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
            //计算小数位数
            var decimalPos = 2;

            var editIndex = undefined;

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();

            var column = [[
                //{ field: 'ck', checkbox: true },
                { field: 'plandetailid', title: 'plandetailid', width: 80, align: 'left', sortable: true, hidden: true },
                { field: 'PlanNO', title: '编号', width: 80, align: 'left', sortable: true },
                { field: 'ChangeDetailID', title: '预算明细id', width: 80, align: 'left', sortable: true, hidden: true },
                //{ field: 'costid', title: '预算单位id', width: 80, align: 'left', sortable: true, hidden: true },
                { field: 'castname', title: '预算单位', width: 80, align: 'left', sortable: true },
                { field: 'subjectname', title: '预算科目', width: 80, align: 'left', sortable: true },
                { field: 'budgetprogram', title: '预算科目1', width: 80, align: 'left', sortable: true, hidden: true },
                { field: 'BudgetMonth', title: '预算月份', width: 80, align: 'center', sortable: true },
                { field: 'BudgetValueForYear', title: '初始预算值', width: 80, align: 'center', sortable: true },
                {
                    field: 'BudgetChaneValue', title: '当前预算值', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        var str = row.BudgetChaneValue;
                        var changevalue;
                        if (str == null || str == undefined || str.length == 0 || str > 0) {
                            changevalue = row.BudgetChaneValue;
                        } else
                            changevalue = row.BudgetValueForYear;
                        return changevalue;
                    }
                },
                {
                    field: 'ChangeBudgetValue', title: '本次调整值', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        var str = row.ChangeBudgetValue;
                        if (str == null || str == undefined || str.length == 0) {
                            str = 0.00;
                        }
                        return str;
                    }
                },
                {
                    field: 'FinalBudgetValue', title: '最终预算值', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        var str = parseFloat(row.BudgetChaneValue);
                        if (str > 0) {
                            str = parseFloat(row.BudgetChaneValue);
                        } else
                            str = parseFloat(row.BudgetValueForYear);

                        if (parseFloat(row.ChangeBudgetValue) > 0) {
                            if (row.BudgetChaneValue > 0) {
                                str = parseFloat(row.BudgetChaneValue) + parseFloat(row.ChangeBudgetValue);
                            } else
                                str = parseFloat(row.BudgetValueForYear) + parseFloat(row.ChangeBudgetValue);
                        }
                        else {
                            if (row.ChangeBudgetValue < 0) {
                                if (row.BudgetChaneValue > 0) {
                                    str = parseFloat(row.BudgetChaneValue) + parseFloat(row.ChangeBudgetValue);
                                } else
                                    str = parseFloat(row.BudgetValueForYear) + parseFloat(row.ChangeBudgetValue);
                            }
                        }
                        return str;
                    }
                },
                { field: 'Memo', title: '备注', align: 'center', width: 100, sortable: true }
            ]];

            var toolbar = [];
            var toolbar_Start = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddBudgetChane();
                    }
                }
                , '-',
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
                }, '-',
                {
                    text: '提交',
                    iconCls: 'icon-save',
                    handler: function () {
                        ClientClick();
                    }
                }
            ];


            function AddBudgetChane() {

                var BudgetCompanyId = $("#BudgetCompanyId").val();
                var BudgetYear = $("#BudgetYear").val();
                var plan = $("#PlanID").val();

                if (BudgetCompanyId == "" && BudgetYear == "") {
                    HDialog.Info("请先选择预算年度和预算单位。");
                    return false;
                }
                var ChangeType = $("#ChangeType").val();
                if (ChangeType == '') {
                    HDialog.Info("请选择调整类型!");
                    return false;
                }
                if (plan != "") {
                    HDialog.Open(550, 250, '../BudgetNew/BudgetChange_Details.aspx?BudgetCompanyId=' + BudgetCompanyId + '&BudgetYear=' + BudgetYear + '&PlanID=' + plan + '&BudgetChangeType=' + $("#BudgetChangeType").val(), '调整详情', true, function callback(_Data) {
                        if (_Data != null && _Data != undefined && _Data != "") {
                            var obj = JSON.parse(_Data);
                            if (obj != null) {
                                var _Data1 = $('#TableContainer').datagrid('getData');

                                var row_index = _Data1.rows.length;
                                if (row_index > 0) {
                                    var isIn = 0;
                                    for (var i = 0; i < obj.rows.length; i++) {
                                        for (var j = 0; j < _Data1.rows.length; j++) {
                                            if (obj.rows[i].plandetailid == _Data1.rows[j].plandetailid) {
                                                isIn = 1;
                                            }
                                        }
                                        if (isIn == 0) {
                                            $('#TableContainer').datagrid('insertRow', {
                                                index: row_index,
                                                row: {
                                                    plandetailid: obj.rows[i].plandetailid,
                                                    PlanNO: obj.rows[i].PlanNO,
                                                    costid: obj.rows[i].costid,
                                                    castname: obj.rows[i].castname,
                                                    subjectname: obj.rows[i].subjectname,
                                                    budgetprogram: obj.rows[i].budgetprogram,
                                                    BudgetMonth: obj.rows[i].BudgetMonth,
                                                    BudgetValueForYear: obj.rows[i].BudgetValueForYear,
                                                    BudgetChaneValue: obj.rows[i].BudgetChaneValue,
                                                    ChangeBudgetValue: '0',
                                                    //FinalBudgetValue: obj.rows[i].BudgetChaneValue,
                                                    Memo: obj.rows[i].Memo,

                                                }
                                            });
                                        }
                                    }
                                } else {
                                    $('#TableContainer').datagrid('loadData', JSON.parse(_Data));
                                }

                                UpdateAmount(0);
                            }
                        }
                    });
                } else {
                    HDialog.Info("您选择调整的预算计划不存在，请重新选择！");
                    return false;
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
                var ChangeType = $("#ChangeType").val();
                if (bools > 0) {
                    //计算页脚合计
                    if (ChangeType == "总量不变") {
                        var ChangeBudgetValue;
                        if (ComputeGridCol("ChangeBudgetValue") <= 0.00) {
                            ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                        }
                        else {
                            ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                            HDialog.Info("本次调整值与调整类型不匹配");
                            return false;
                        }

                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                BudgetMonth: "合计",
                                BudgetValueForYear: ComputeGridCol("BudgetValueForYear"),
                                BudgetChaneValue: ComputeGridCol("BudgetChaneValue"),
                                ChangeBudgetValue: ToDecimal(ChangeBudgetValue, decimalPos),
                                FinalBudgetValue: ComputeGridCol("BudgetChaneValue")
                            }
                        ]);
                    } else if (ChangeType == "总量增加") {
                        var ChangeBudgetValue;
                        if (ComputeGridCol("ChangeBudgetValue") > 0) {
                            ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                        }
                        else {
                            ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                            HDialog.Info("本次调整值与调整类型不匹配");
                            return false;
                        }
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                BudgetMonth: "合计",
                                BudgetValueForYear: ComputeGridCol("BudgetValueForYear"),
                                BudgetChaneValue: ComputeGridCol("BudgetChaneValue"),
                                ChangeBudgetValue: ComputeGridCol("ChangeBudgetValue"),
                                FinalBudgetValue: ComputeGridCol("BudgetChaneValue")
                            }
                        ]);
                    } else if (ChangeType == "总量调减") {

                        var ChangeBudgetValue;
                        if (ComputeGridCol("ChangeBudgetValue") < 0) {
                            ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                        }
                        else {
                            ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                            HDialog.Info("本次调整值与调整类型不匹配");
                            return false;
                        }

                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                BudgetMonth: "合计",
                                BudgetValueForYear: ComputeGridCol("BudgetValueForYear"),
                                BudgetChaneValue: ComputeGridCol("BudgetChaneValue"),
                                ChangeBudgetValue: ComputeGridCol("ChangeBudgetValue"),
                                FinalBudgetValue: ComputeGridCol("BudgetChaneValue")
                            }
                        ]);
                    }
                }
                else {
                    if (editIndex != undefined) {
                        $("#TableContainer").datagrid('acceptChanges', editIndex);
                        var index = editIndex;
                        var rowData = $('#TableContainer').datagrid('getData').rows[index];
                        $('#TableContainer').datagrid('updateRow',
                            {
                                index: index,
                                row: {
                                    ChangeBudgetValue: ToDecimal(ChangeBudgetValue, 2)
                                }
                            });

                        //计算页脚合计
                        if (ChangeType == "总量不变") {
                            var ChangeBudgetValue;
                            if (ComputeGridCol("ChangeBudgetValue") <= 0) {
                                ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                            }
                            else {
                                ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                                HDialog.Info("本次调整值与调整类型不匹配");
                                return false;
                            }
                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    BudgetMonth: "合计",
                                    BudgetValueForYear: ComputeGridCol("BudgetValueForYear"),
                                    BudgetChaneValue: ComputeGridCol("BudgetChaneValue"),
                                    ChangeBudgetValue: ToDecimal(ChangeBudgetValue, decimalPos),
                                    FinalBudgetValue: ComputeGridCol("BudgetChaneValue")
                                }
                            ]);
                        }
                        else if (ChangeType == "总量增加") {
                            var ChangeBudgetValue;
                            if (ComputeGridCol("ChangeBudgetValue") > 0) {
                                ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                            }
                            else {
                                ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                                HDialog.Info("本次调整值与调整类型不匹配");
                                return false;
                            }

                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    BudgetMonth: "合计",
                                    BudgetValueForYear: ComputeGridCol("BudgetValueForYear"),
                                    BudgetChaneValue: ComputeGridCol("BudgetChaneValue"),
                                    ChangeBudgetValue: ComputeGridCol("ChangeBudgetValue"),
                                    FinalBudgetValue: ComputeGridCol("BudgetChaneValue")
                                }
                            ]);
                        }
                        else if (ChangeType == "总量调减") {

                            var ChangeBudgetValue;
                            if (ComputeGridCol("ChangeBudgetValue") < 0) {
                                ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                            }
                            else {
                                ChangeBudgetValue = ComputeGridCol("ChangeBudgetValue");
                                HDialog.Info("本次调整值与调整类型不匹配");
                                return false;
                            }

                            $('#TableContainer').datagrid('reloadFooter', [
                                {
                                    BudgetMonth: "合计",
                                    BudgetValueForYear: ComputeGridCol("BudgetValueForYear"),
                                    BudgetChaneValue: ComputeGridCol("BudgetChaneValue"),
                                    ChangeBudgetValue: ComputeGridCol("ChangeBudgetValue"),
                                    FinalBudgetValue: ComputeGridCol("BudgetChaneValue")
                                }
                            ]);
                        }
                    }
                }
            };

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
                    idField: "plandetailid",
                    nowrap: true,
                    columns: column,
                    fitColumns: true,
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
                        if (row.BudgetMonth == '合计') {
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
                                    BudgetMonth: "合计",
                                    BudgetValueForYear: ToDecimal("0.00", decimalPos),
                                    BudgetChaneValue: ToDecimal("0.00", decimalPos),
                                    ChangeBudgetValue: ToDecimal("0.00", decimalPos),
                                    FinalBudgetValue: ToDecimal("0.00", decimalPos)
                                }
                            ]);
                        }
                    },
                    onClickRow: function (rowIndex, rowData) {
                        if ($("#State").val() == "已审核") return;
                        //发起时允许编辑,审核中不允许编辑
                        if ($("#State").val() == "未启动") {
                            $("#TableContainer").datagrid('acceptChanges', editIndex);
                            //更改当前行号
                            editIndex = rowIndex;

                            //去除编辑器                     
                            $("#TableContainer").datagrid('removeEditor', 'ChangeBudgetValue');
                            //实际数量可以编辑
                            $("#TableContainer").datagrid('addEditor', [ //添加DeclareMoney列editor
                                {
                                    field: 'ChangeBudgetValue', editor: { type: 'numberbox' }
                                }]);
                            //开始编辑
                            $("#TableContainer").datagrid('beginEdit', rowIndex);
                            //绑定JS事件
                            var ed = $('#TableContainer').datagrid('getEditors', rowIndex);
                            for (var i = 0; i < ed.length; i++) {
                                var e = ed[i];
                                if (e.field == "ChangeBudgetValue") {
                                    $(e.target).bind("click", function () {
                                    }).bind("change", function () {
                                        //文本变化事件
                                        var val = e.target[0].value;
                                        if (parseFloat(val) == "NaN") {
                                            HDialog.Info("请输入正确数字！");
                                            e.target[0].value = 0.00;
                                            return;
                                        }
                                    });
                                }
                                //计算未提交的行数据，计算金额
                                //UpdateAmount(1);
                            }
                        }
                    }
                });
            }

            //加载数据
            LoadList();
            $('#TableContainer').datagrid('loadData', Rows);

            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (IsSubmitFlag == false) {
                    HDialog.Info("30秒内不要重复点击");
                    return false;
                }
                //先判断是不是有选中 要提交审批的
                var IsClickServer = ClientClick();
                if (IsClickServer == false) { return false; }
                var IsValidateCost = CostAndBudgetValidate();
                if (IsValidateCost == "false") {
                    return false;
                }
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 30000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    var rows = $('#TableContainer').datagrid('getRows');
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i]["ChangeBudgetValue"] == undefined) {
                            HDialog.Info("请输入本次调整值！");
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

            //计划单审批流程   单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                var ChangeType = $("#ChangeType").val();
                if (ChangeType == '') {
                    HDialog.Info("请选择调整类型!");
                    return false;
                }

                if ($("#State").val() == "未启动") {
                    if (UpdateAmount(1) == false) {
                        return false;
                    }
                    //获取流程
                    var FlowId = '';
                    $.tool.DataPostAsync('Budget', 'GetCostWorkFlow_File', 'CostCategory=' + ChangeType + '&CostCompany=' + $("#BudgetCompanyId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.split('|')[0] == 'false') {
                                HDialog.Info(_Data.split('|')[1]);
                                return false;
                            }
                            var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=1002&biaoshi=&FlowId=" + _Data.split('|')[1] + "&random=" + Math.random();
                            HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                                if (_Data != '') {
                                    var obj = JSON.parse(_Data);
                                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                                    document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                                    document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                                }
                            });
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);

                }
            }

            //选择预算单位
            function SelCostCompany() {
                HDialog.Open('400', '350', '../DialogNew/SelBudgetCompany.aspx', '选择预算单位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#BudgetCompanyId").val(varObjects[0]);
                        $("#BudgetCompany").val(varObjects[1]);
                        change();
                    }
                });
            }

            //附件查看列表
            function OnFileList() {
                HDialog.Open(600, 450, '../BudgetNew/BudgetFiles.aspx?ChangeID=' + $("#ChangeID").val(), '查看计划附件', true, function callback(_Data) {
                });
            }

            function Load() {
                $('#UploadFrame').attr("src", "../BudgetNew/BudgetUploadFiles.aspx?ChangeID=" + $('#ChangeID').val());
                if ($("#SubmitType").val() == 'IsSubmit') {
                    $('#frmFrom input,textarea').attr("disabled", "true");
                    $('#UploadFrame').attr("src", "");
                    $('#fileList1,#BtnSave,#BtnClose').removeAttr("disabled");
                }
            }

            Load();

            function change() {
                var BudgetCompanyId = $("#BudgetCompanyId").val();
                var BudgetYear = $("#BudgetYear").val();

                if (BudgetCompanyId == "" || BudgetYear == "") {
                    return false;
                }
                //if (BudgetCompanyId == "") {
                //    HDialog.Info("请选择预算单位。");
                //    return false;
                //}

                //if (BudgetYear == "") {
                //    HDialog.Info("请选择预算年度。");
                //    return false;
                //}

                $.tool.DataPostAsync('Budget', 'GetBudgetChangeIsExist', 'BudgetCompanyid=' + BudgetCompanyId + '&BudgetYear=' + BudgetYear,
                    function Init() {
                    },
                    function callback(_Data) {
                        var str = _Data.split('|');
                        if (str[0] == "true") {
                            $("#PlanID").val(str[1]);
                            var _Data2 = $('#TableContainer').datagrid('getData');
                            if (_Data2.rows.length > 0) {
                                $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });
                            }
                        } else {
                            var _Data2 = $('#TableContainer').datagrid('getData');
                            if (_Data2.rows.length > 0) {
                                $('#TableContainer').datagrid('loadData', { total: 0, rows: [] });
                            }
                            $("#PlanID").val("");
                            HDialog.Info("您选择调整的预算计划不存在，请重新选择！");
                            return false;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);


                //
                $.tool.DataPostAsync('Budget', 'IsSubordinateUnit', 'BudgetCompany=' + BudgetCompanyId,
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "true") {
                            $("#BudgetChangeType").val("True");
                        }
                        else {
                            $("#BudgetChangeType").val("false");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);

            }

            //提交
            function ClientClick() {
                if (editIndex != undefined) {
                    $("#TableContainer").datagrid('acceptChanges', editIndex);
                    $('#TableContainer').datagrid('endEdit', editIndex);
                }
                var IsReturn = UpdateAmount(1);
                if (IsReturn == false) { return false; }
                var rows1 = $('#TableContainer').datagrid('getRows');
                $("#AduitResult").val(JSON.stringify(rows1));
                return true;
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
                        BudgetMonth: data.rows[i].BudgetMonth,//预算月份
                        ChangeBudgetValue: data.rows[i].ChangeBudgetValue,//调整金额
                        budgetprogram: data.rows[i].budgetprogram,//预算项目id
                        subjectname: data.rows[i].subjectname//预算项目名称
                    }
                    DataObj.push(itemObj);
                    BudgetProgramIDList += data.rows[i].budgetprogram + "#" + data.rows[i].BudgetMonth + ",";
                }
                if (BudgetProgramIDList.length > 0) {
                    BudgetProgramIDList = BudgetProgramIDList.substring(0, BudgetProgramIDList.length - 1);
                }
                $.tool.pageLoading();
                var ParameterStr = "DataObj=" + JSON.stringify(DataObj) + "&BudgetProgramIDList=" + BudgetProgramIDList
                    + "&BudgetYear=" + $('#BudgetYear').val() + "&BudgetCompany=" + $('#BudgetCompanyId').val();
                //同步调用
                $.tool.DataPostInfoAsync('Budget', 'CostAndBudgetValidate', ParameterStr,
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


        </script>
    </form>
</body>
</html>
