<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanSubmit.aspx.cs" Inherits="M_Main.Plan.PlanSubmit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划执行审批</title>
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
        <input type="hidden" id="PlanId" name="PlanId" runat="server" />
        <input type="hidden" id="EvaId" name="EvaId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />

        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <%--计划单开始时间--%>
        <input type="hidden" id="PlanStartTime" name="PlanStartTime" runat="server" />
        <%--计划单结束时间--%>
        <input type="hidden" id="PlanEndTime" name="PlanEndTime" runat="server" />

        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="StartPerson" name="StartPerson" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />

        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <%-- 计划列表数据内容（选中） --%>
        <input type="hidden" id="AduitResult" name="AduitResult" runat="server" value="" />

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
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" visible="false" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">计划单号：
                </td>
                <td class="DialogTdContent">
                    <label runat="server" id="PlanNO" name="PlanNO"></label>
                    <a class="HrefStyle" href="#" onclick="PlanView();" runat="server">查看计划</a>
                </td>
                <td class="DialogTdTitle">计划周期：</td>
                <td class="DialogTdContent">
                    <label runat="server" id="PlanCycle" name="PlanCycle"></label>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">责任人：
                </td>
                <td class="DialogTdContent">
                    <label runat="server" id="BlamePName" name="BlamePName"></label>
                    <input type="hidden" value="" runat="server" id="BlamePID" name="BlamePID" />
                </td>
                <td class="DialogTdTitle">责任部门：
                </td>
                <td class="DialogTdContent">
                    <label runat="server" id="BlameDepName" name="BlameDepName"></label>
                    <input type="hidden" value="" runat="server" id="BlameDepCode" name="BlameDepCode" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdMemoContent" style="text-align: left;">
                    <label runat="server" id="Memo" name="Memo"></label>
                </td>
                  <td class="DialogTdTitle">计划主题：
                </td>
                <td class="DialogTdContent">
                    <input type="text" runat="server" class="easyui-validatebox" data-options="required:true" id="PlanTheme" name="PlanTheme" />
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
                    <input type="text" runat="server" class="easyui-validatebox" readonly id="WanChengLv" name="WanChengLv" />
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
            var varObjects = [];
            function LoadDictionary() {
                $.tool.DataPostAsync('CsPlan', 'BindDictionaryEx', 'DcTypeName=考评类型',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = _Data; //转换为json对象
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }
            LoadDictionary();

            $("#BtnIsPrint").click(function () {
                HDialog.Info("暂未开发！");
            });
            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
                //初始化加载进度条信息
                $("#DivCompletionProgress").css({ "width": $("#HidDivCompletionProgress").val() + "%" });
                $("#SpanCompletionProgress").html($("#HidSpanCompletionProgress").val() + "%");
            }
            InitPurchaseTableHeight();
            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'PlanNO', title: '计划单号', width: 90, align: 'center', sortable: true },
                { field: 'Name', title: '计划周期', width: 65, align: 'center', sortable: true },
                { field: 'TypeName', title: '计划类型', width: 80, align: 'center', sortable: true },
                {
                    field: 'PlanName', title: '计划名称', align: 'left', width: 150, sortable: true, formatter: function (value, row, index) {
                        //判断 如果是记录提交 就显示执行记录详情页面
                        var str
                        if (row.EvaId == "" && (row.AuditingState == "未启动" || row.AuditingState == "")) {
                            str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"PlanDetailEdit(0,'" + row.ImpId + "','" + row.DetailId + "');\">" + row.PlanName + "</a>";
                        } else if (row.AuditingState == "审核中") {
                            str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"PlanDetailEdit(1,'" + row.ImpId + "','" + row.EvaId + "');\">" + row.PlanName + "</a>";
                        } else if (row.AuditingState == "已审核") {
                            str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"PlanDetailEdit(2,'" + row.ImpId + "','');\">" + row.PlanName + "</a>";
                        }
                        return str;
                    }
                },
            ]];
            var column = [[
                {
                    field: 'ActualStartTime', title: '本期实施开始时间', width: 120, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.ActualStartTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ActualEndTime', title: '本期实施结束时间', width: 120, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.ActualEndTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'Target', title: '本期完成目标', width: 100, align: 'left', sortable: true },
                { field: 'ActualTarget', title: '累计完成目标', width: 100, align: 'center', sortable: true },
                { field: 'Cost', title: '本期完成费用（元）', width: 120, align: 'center', sortable: true },
                { field: 'ActualCost', title: '累计完成费用（元）', align: 'center', width: 120, sortable: true },

                {
                    field: 'CheckFunctionType', title: '本期考评性质', align: 'center', width: 100, sortable: true, editor: {
                        type: 'combobox',
                        options: {
                            data: [{ value: "", text: "" }, { value: "过程考评", text: "过程考评" }, { value: "最终考评", text: "最终考评" }],
                            valueField: "value",
                            textField: "text",
                            editable: false,
                            required: true,
                            panelHeight: "auto"
                        }
                    }
                },
                {
                    field: 'CheckType', title: '本期考评类型', align: 'center', width: 100, sortable: true,
                    formatter: function (value, row, index) {
                        return row.CheckTypeName;
                    },
                    editor: {
                        type: 'combobox',
                        options: {
                            data: eval("(" + varObjects + ")"),
                            valueField: "Id",
                            textField: "Name",
                            editable: false,
                            required: true,
                            panelHeight: "auto"
                        }
                    }
                },
                { field: 'CheckBasis', title: '本期考评依据', align: 'center', width: 140, sortable: true, editor: 'text' },
                { field: 'CheckMethods', title: '本期考评方法', align: 'center', width: 140, sortable: true, editor: 'text' },
                { field: 'CheckDesc', title: '本期考评情况', align: 'center', width: 140, sortable: true, editor: 'text' },
                { field: 'CheckExplain', title: '本期考评说明', align: 'center', width: 140, sortable: true, editor: 'text' },
                {
                    field: 'Point', title: '本期所得分值', align: 'center', width: 100, sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            precision: 2
                        }
                    }, formatter: function (value, row, index) {
                        return formatNumber(value, 2);
                    }
                },
                {
                    field: 'CumulativePoint', title: '累计所得分值', align: 'center', width: 100, sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            precision: 2
                        }
                    }, formatter: function (value, row, index) {
                        return formatNumber(value, 2);
                    }
                },
                {
                    field: 'GetCost', title: '本期所得金额（元）', align: 'center', width: 120, sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            precision: 2
                        }
                    }, formatter: function (value, row, index) {
                        return formatNumber(value, 2);
                    }
                },
                {
                    field: 'CumulativeGetCost', title: '累计所得金额（元）', align: 'center', width: 120, sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            precision: 2
                        }
                    }, formatter: function (value, row, index) {
                        return formatNumber(value, 2);
                    }
                },
                { field: 'AuditingState', title: '审核状态', align: 'center', width: 80, sortable: true }
            ]];

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


            //跳转记录页面
            function PlanDetailEdit(flag, id, detailId) {
                if (flag == 0) {
                    //计划执行
                    HDialog.Open('650', '460', '../Plan/PlanImplement_Add.aspx?OpType=edit&DetailId=' + detailId + "&ImpId=" + id + "&SubmitType=IsSubmit", '执行记录', true, function callback(_Data) {
                    });
                } else if (flag == 1) {
                    //计划考评 审核
                    //通过 缓存传入计划考评填写内容
                    endEditionForDetail();
                    var Rows = $('#TableContainer').datagrid("getRows");
                    var Node = Rows.filter(function (e) {
                        return e.ImpId == id;
                    });

                    Cache.SetData("EvaluationDataDetail", JSON.stringify(Node));
                    HDialog.Open('800', '550', '../Plan/PlanEvaluation_Detail.aspx?OpType=edit&ImpId=' + id, '执行记录', true, function callback(_Data) {
                        if (_Data != "") {
                            $.tool.DataGet('CsPlan', 'GetImplementListByAudit', "EvaId=" + detailId,
                                function Init() {
                                },
                                function callback(_Data) {
                                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")");
                                    $('#TableContainer').datagrid('loadData', varObjects);

                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    });
                } else if (flag == 2) {
                    //计划考评查看
                    HDialog.Open('800', '550', '../Plan/PlanEvaluation_Detail.aspx?OpType=view&ImpId=' + id, '执行记录', true, function callback(_Data) {
                    });
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

            function LoadList() {
                $("#TableContainer").datagrid({
                    nowrap: true,
                    columns: column,
                    fitColumns: false,
                    frozenColumns: frozenColumns,
                    singleSelect: false,
                    pagination: false,
                    rownumbers: true,
                    border: false,
                    onClickCell: onClickCellForDetail,
                    onAfterEdit: onAfterEditForDetail,
                    onLoadSuccess: function () {

                    }
                });
            }
            $(document).ready(function () {
                //$("#CompletionRate").hide();
                if ($("#State").val() == "未启动" || $("#State").val() == "已驳回" || $("#State").val() == "") {
                }
                else {

                    if ($("#State").val() == "审核中") {
                        //$("#CompletionRate").hide();
                    }
                    if ($("#State").val() == "已审核") {
                         //$("#CompletionRate").show();
                    }
                }
            });
            //编辑的行号
            var editIndexForDetail = undefined;
            //*****编辑
            function endEditionForDetail() {
                if (editIndexForDetail == undefined) {
                    return true
                }
                if ($('#TableContainer').datagrid('validateRow', editIndexForDetail)) {
                    var ed = $('#TableContainer').datagrid('getEditors', editIndexForDetail);  //editIndex编辑时记录下的行号
                    for (var i = 0; i < ed.length; i++) {
                        var e = ed[i];
                        if (e.field == "CheckType") {
                            var CheckTypeName = $(e.target).combobox('getText');
                            $('#TableContainer').datagrid('getRows')[editIndexForDetail]['CheckTypeName'] = CheckTypeName;
                        }
                    }
                    $('#TableContainer').datagrid('endEdit', editIndexForDetail);
                    editIndexForDetail = undefined;
                    return true;
                } else {
                    return false;
                }
            }
            //编辑前点击事件
            function onClickCellForDetail(Rowindex, field, value) {
                $('#TableContainer').datagrid('selectRow', Rowindex);
                var SelecteRow = $('#TableContainer').datagrid("getSelected");
                if (document.all.WorkFlowManage_WorkStateTxtLable.innerText != "未启动" && document.all.WorkFlowManage_WorkStateTxtLable.innerText != "已驳回"
                    && document.all.WorkFlowManage_WorkStateTxtLable.innerText != "办理中") {
                    endEditionForDetail();
                    return false;
                }
                if ($('#EvaId').val() == "") {
                    endEditionForDetail();
                    return false;
                }
                if (endEditionForDetail()) {
                    //判断点击的是不是编辑行
                    if (field == "CheckFunctionType" || field == "CheckType" || field == "CheckBasis" || field == "CheckMethods"
                        || field == "CheckDesc" || field == "CheckExplain" || field == "Point" || field == "CumulativePoint" || field == "GetCost" || field == "CumulativeGetCost") {
                        $('#TableContainer').datagrid('beginEdit', Rowindex);
                    }
                    editIndexForDetail = Rowindex;
                }
            }
            //编辑后事件
            function onAfterEditForDetail(rowIndex, row, changes) {
                var updated = $('#TableContainer').datagrid('getChanges', 'updated');
                if (updated.length < 1) {
                    //editRow = undefined;
                    $('#TableContainer').datagrid('unselectAll');
                    return;
                } else {
                    if (editIndexForDetail != undefined) {
                        $("#TableContainer").datagrid('acceptChanges', editIndexForDetail);
                        $('#TableContainer').datagrid('endEdit', editIndexForDetail);
                    }
                }
            }

            //将 列表内容存入隐藏控件中
            function ClientClick(BtnIdText) {
                if (BtnIdText == "BtnSaveStartWorkFlow") {
                    //送审
                    //获取选中 提交审批的数据
                    var rows = $('#TableContainer').datagrid('getSelections');
                    if (rows == undefined || rows == null || rows.length == 0) {
                        HDialog.Info("没有需要提交考评审批的执行记录，请勾选");
                        return false;
                    }
                    $("#AduitResult").val(JSON.stringify(rows));
                } else if (BtnIdText == "BtnCheckPass") {
               
                    //审批通过
                    var rows = $('#TableContainer').datagrid('getRows');
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].CheckFunctionType == "") {
                            HDialog.Info("请选择本期考评性质");
                            return false;
                        }
                        if (rows[i].CheckType == "") {
                            HDialog.Info("请选择本期考评类型");
                            return false;
                        }
                    }
                  $("#AduitResult").val(JSON.stringify(rows));
                }
                return true;
            }
            //加载数据
            LoadList();
            $('#TableContainer').datagrid('loadData', Rows);


            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                endEditionForDetail();
                if (IsSubmitFlag == false) {
                    HDialog.Info("30秒内不要重复点击");
                    return false;
                }
                //先判断是不是有选中 要提交审批的
                if (ClientClick(this.id)) {
                    IsSubmitFlag = false;
                    setTimeout('IsSubmitFlag=true', 30000);
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
                    return false;
                }
            });


            //计划单审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                var Rows = $('#TableContainer').datagrid('getSelections');
                if (Rows == undefined || Rows == null || Rows.length == 0) {
                    HDialog.Info("没有需要提交审批的执行记录，勾选");
                    return false;
                }
                if ($("#State").val() == "未启动") {
                    //UpdateAmount(0);
                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0803&biaoshi=1&random=" + Math.random();
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

            //****查看计划 还是可以编辑
            function PlanView() {
                //var w = $(window).width();
                //var h = $(window).height();
                HDialog.Open('1100', '650', '../Plan/PlanImplement_List.aspx?PlanID=' + $('#PlanId').val(), '查看计划', true, function callback(_Data) { });
            }
        </script>
    </form>
</body>
</html>
