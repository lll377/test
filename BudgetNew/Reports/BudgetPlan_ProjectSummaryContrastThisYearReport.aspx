<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlan_ProjectSummaryContrastThisYearReport.aspx.cs" Inherits="M_Main.BudgetNew.Reports.BudgetPlan_ProjectSummaryContrastThisYearReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目预算与本年实际发生汇总对比表</title>
    <script type="text/javascript" src="../../Jscript/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <link href="../../css/editcss.css" type="text/css" rel="stylesheet">
    <script src="../../jscript/jquery.tool.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../../jscript/PersonDictionary.js" type="text/javascript"></script>
    <script src="../../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>

    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 600px;
            height: auto;
        }

        .SearchTable {
            width: 600px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 9%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">预算单位</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="BudgetCompany" name="BudgetCompany" style="width: 87%; border: 1px solid #cccccc; resize: none;" class="easyui-validatebox" onclick="SelUnit();"
                            readonly="readonly"></textarea>
                        <input type="hidden" id="BudgetCompanyCode" name="BudgetCompanyCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预算年度</td>
                    <td class="TdContentSearch">
                        <input id="BudgetYear" name="BudgetYear" type="text"
                            onclick="WdatePicker({ dateFmt: 'yyyy', skin: 'default' })" format="date" data-options="required:true" />
                    </td>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContentSearch">
                        <select id="AuditingState" name="AuditingState" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',multiple: true">
                            <option value=""></option>
                            <option value="未启动">未启动</option>
                            <option value="审核中">审核中</option>
                            <option value="已审核">已审核</option>
                            <option value="审核不通过">审核不通过</option>
                            <option value="已驳回">已驳回</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">预算科目</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="BudgetProgramName" name="BudgetProgrameName" style="width: 87%; border: 1px solid #cccccc; resize: none;" class="easyui-validatebox" onclick="SelBudgetProgram();"
                            readonly="readonly"></textarea>
                        <input type="hidden" id="BudgetProgram" name="BudgetProgram" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="Btn_SearchClick();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="TableContainer">
        </div>
        <script type="text/javascript">
            var decimalPos = 2;
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            //选择预算单位
            function SelUnit() {
                HDialog.Open('400', '350', '../BudgetNew/BudgetCompanySelect.aspx', '选择预算单位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split('%');
                        $('#BudgetCompany').val(varObjects[1]);
                        $('#BudgetCompanyCode').val(varObjects[0]);
                    }
                });
            }

            //选择预算科目
            function SelBudgetProgram() {
                HDialog.Open('480', '400', '../BudgetNew/BudgetProgramSelectWithOutParent.aspx?Ram=' + Math.random(), '选择预算科目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")");
                        var IdList = "";
                        var NameList = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            if (!varObjects[i].children) {
                                IdList = IdList + varObjects[i].id + ',';
                                NameList = NameList + varObjects[i].text + ',';
                            }
                        }
                        $("#BudgetProgram").val(IdList.substring(0, IdList.length - 1));
                        $("#BudgetProgramName").val(NameList.substring(0, NameList.length - 1));
                    }
                });
            }

            function ClearWhere() {
                $('#frmForm').form("clear");
            }
            var frozenColumns = [[
                { field: 'text', title: '单位名称', width: 321, align: 'left', rowspan: 2 }
            ], []];
            var column = [[
                { title: '年预算额', align: 'center', colspan: 4 },
                { title: '本月实际发生额', align: 'center', colspan: 4 },
                { title: '年累计发生数', align: 'center', colspan: 4 },
                { title: '对比年累计发生', align: 'center', colspan: 4 }
            ], [
                { field: 'ThisYearIncome', title: '收入', width: 120, align: 'center' },
                { field: 'ThisYearCost', title: '支出', width: 120, align: 'center' },
                { field: 'ThisYearManagementCommission', title: '管理佣金', width: 120, align: 'center' },
                { field: 'ThisYearPreTaxProfit', title: '税前利润', width: 120, align: 'center' },

                { field: 'ThisMonthIncome', title: '收入', width: 120, align: 'center' },
                { field: 'ThisMonthCost', title: '支出', width: 120, align: 'center' },
                { field: 'ThisMonthManagementCommission', title: '管理佣金', width: 120, align: 'center' },
                { field: 'ThisMonthPreTaxProfit', title: '税前利润', width: 120, align: 'center' },

                { field: 'TotalIncome', title: '收入', width: 120, align: 'center' },
                {
                    field: 'TotalCost', title: '支出', width: 120, align: 'center', formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"TotalCostDataMining('" + row.id + "');\">" + value + "</a>";
                        return str;
                    }
                },
                { field: 'TotalManagementCommission', title: '管理佣金', width: 120, align: 'center' },
                { field: 'TotalPreTaxProfit', title: '税前利润', width: 120, align: 'center' },

                { field: 'IncomeCompleteRate', title: '收入完成率', width: 120, align: 'center' },
                { field: 'CostCompleteRate', title: '成本完成率', width: 120, align: 'center' },
                { field: 'ManagementCommissionCompleteRate', title: '佣金完成率', width: 120, align: 'center' },
                { field: 'PreTaxProfitCompleteRate', title: '利润完成率', width: 120, align: 'center' }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rowData = $('#TableContainer').treegrid('getData');
                        if (rowData.length == 0) {
                            HDialog.Info('没有需要导出的数据');
                        }
                        else {
                            Export('项目预算与本年实际发生汇总对比表', $('#TableContainer'));
                        }
                    }
                }
            ];
            //累计支出数据挖掘
            function TotalCostDataMining(CostID) {
                if (CostID != "") {
                    var w = "1000";
                    var h = "400";
                    HDialog.Open(w, h, '../BudgetNew/Reports/BudgetPlan_ProjectSummaryContrastThisYearReport_TotalCostDataMining.aspx?CostID=' + CostID + "&BudgetYear=" + $('#BudgetYear').val(), '项目预算与本年实际发生汇总对比表-成本累计发生数数据挖掘', false, function callback(_Data) {
                    });
                }
            }

            function LoadList(dataValue) {
                $("#TableContainer").treegrid({
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: true,
                    data: dataValue,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    border: false,
                    toolbar: toolbar,
                    width: '100%',
                    onLoadSuccess: function () {
                    }
                });
                $('#SearchDlg').dialog('close');
            }


            //***确定筛选
            function Btn_SearchClick() {
                if ($("#BudgetYear").val() == "") {
                    HDialog.Info("请选择预算年度");
                    return;
                }
                $('#SearchDlg').dialog('close');
                var parameters = "BudgetCompany=" + $('#BudgetCompanyCode').val() + "&BudgetYear=" + $('#BudgetYear').val() +
                    "&BudgetProgram=" + $('#BudgetProgram').val() + "&AuditingState=" + $('#AuditingState').combobox("getValues");
                $.tool.DataPost('Budget', 'Budget_BudgetPlan_ProjectSummaryContrastThisYearReport', parameters,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            //构建表头
                            var NewColumn = [
                                { title: $('#BudgetYear').val() + '年预算额', align: 'center', colspan: 4 },
                                { title: '本月实际发生额', align: 'center', colspan: 4 },
                                { title: $('#BudgetYear').val() + '年累计发生数', align: 'center', colspan: 4 },
                                { title: '对比' + $('#BudgetYear').val() + '年累计发生', align: 'center', colspan: 4 }
                            ];
                            column[0] = NewColumn;
                            var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            LoadList(varObjects);
                        } else {
                            LoadList([]);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //****将treegrid数据转化成列表数据
            function treeDataToList(dataArr) {
                var arr = [];
                function childrenToList(node) {
                    var childrens = node.children || [];
                    for (var i = 0; i < childrens.length; i++) {
                        var d = childrens[i];
                        var temp = {};
                        for (var key in d) {
                            if (key !== "children") {
                                temp[key] = d[key];
                            }
                        }
                        arr.push(temp);
                        childrenToList(d);
                    }
                }

                for (var i = 0; i < dataArr.length; i++) {
                    var d = dataArr[i];
                    var temp = {};
                    for (var key in d) {
                        if (key !== "children") {
                            temp[key] = d[key];
                        }
                    }
                    arr.push(temp);

                    childrenToList(d);
                }
                return arr;
            }

            //导出的方法
            function Export(strXlsName, exportGrid) {
                var Headcolumn = column;
                var ExcelCol = column;
                var f = $('<form action="../../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTable4(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }

            //导出树形结构Excel
            function ChangeToTable4(printDatagrid, HeadcolumnsList, columnsList) {
                var tableString = '<table cellspacing="0" class="pb">';
                var frozenColumn = frozenColumns;  // 得到frozenColumns对象
                var columns = HeadcolumnsList; //printDatagrid.datagrid("options").columns;    // 得到columns对象
                var nameList = columnsList;

                // 载入title
                if (typeof columns != 'undefined' && columns != '') {
                    $(columns).each(function (index) {
                        tableString += '\n<tr>';
                        if (typeof frozenColumn != 'undefined' && typeof frozenColumn[index] != 'undefined') {
                            for (var i = 0; i < frozenColumn[index].length; ++i) {
                                if (!frozenColumn[index][i].hidden) {
                                    tableString += '\n<th style="background-color:#c0c0c0;" width="' + frozenColumn[index][i].width + '"';
                                    if (typeof frozenColumn[index][i].rowspan != 'undefined' && frozenColumn[index][i].rowspan > 1) {
                                        tableString += ' rowspan="' + frozenColumn[index][i].rowspan + '"';
                                    }
                                    if (typeof frozenColumn[index][i].colspan != 'undefined' && frozenColumn[index][i].colspan > 1) {
                                        tableString += ' colspan="' + frozenColumn[index][i].colspan + '"';
                                    }
                                    tableString += '>' + frozenColumn[0][i].title + '</th>';
                                }
                            }
                        }
                        for (var i = 0; i < columns[index].length; ++i) {
                            if (!columns[index][i].hidden) {
                                tableString += '\n<th style="background-color:#c0c0c0;" width="' + columns[index][i].width + '"';
                                if (typeof columns[index][i].rowspan != 'undefined' && columns[index][i].rowspan > 1) {
                                    tableString += ' rowspan="' + columns[index][i].rowspan + '"';
                                }
                                if (typeof columns[index][i].colspan != 'undefined' && columns[index][i].colspan > 1) {
                                    tableString += ' colspan="' + columns[index][i].colspan + '"';
                                }
                                tableString += '>' + columns[index][i].title + '</th>';
                            }
                        }
                        tableString += '\n</tr>';
                    });
                }
                // 载入内容
                //var rows = printDatagrid.datagrid("getData"); // 这段代码是获取当前页的所有行

                var TreeGridData = $('#TableContainer').treegrid("getData");
                var rows = treeDataToList(TreeGridData);
                for (var i = 0; i < rows.length; i++) {
                    tableString += '\n<tr>';
                    var Nbspstr = "";
                    for (var k = 1; k < parseInt(rows[i]["LevelCode"]); k++) {
                        Nbspstr += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    //预算单位
                    tableString += '\n<td>' + Nbspstr + rows[i]["text"] + '</td>';

                    for (var j = 0; j < nameList[1].length; j++) {
                        tableString += '\n<td';
                        if (nameList[1][j].SubjectName != 'undefined' && nameList[1][j].SubjectName != '') {
                            tableString += ' style="text-align:' + nameList[1][j].SubjectName + ';"';
                        }
                        tableString += ' >';
                        var FiledName = nameList[1][j].field;
                        tableString += rows[i][FiledName];
                        tableString += '</td>';
                    }
                    tableString += '\n</tr>';
                }

                tableString += '\n</table>';
                return tableString;
            }
            //页面初始化
            $(function () {
                InitTableHeight();
                LoadList([]); //不默认加载
            })

        </script>
    </form>
</body>
</html>
