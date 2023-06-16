<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlan_CostBudgetSummaryReport.aspx.cs" Inherits="M_Main.BudgetNew.Reports.BudgetPlan_CostBudgetSummaryReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>成本费用汇总表</title>
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
                    <td class="TdTitle">科目层级</td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="BudgetLevel" name="BudgetLevel" class="easyui-combobox" style="width: 125px;" data-options="editable:false,panelHeight:'auto'">
                            <option value="0">1级</option>
                            <option value="1" selected>2级</option>
                            <option value="2">3级</option>
                            <option value="3">4级</option>
                            <option value="4">5级</option>
                        </select>
                        <label>
                            <input type="checkbox" class="checkboxClass" checked="checked" id="IsSelectTop" style="border: 1px solid #cccccc;" name="item">无此层级是否取上级</label>
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

            function ClearWhere() {
                $('#frmForm').form("clear");
                //科目层级默认三级
                $('#BudgetLevel').combobox("setValue", "1");
            }
            var frozenColumns = [[
                { field: 'text', title: '单位名称', width: 321, align: 'left' }
            ]];

            var column = [[]];

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
                            HDialog.Info('没有需要导出的成本费用汇总表数据');
                        }
                        else {
                            Export('成本费用汇总表', $('#TableContainer'));
                        }
                    }
                }
            ];

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
                        //$('.datagrid-sort-icon').remove();
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
                    "&IsSelectTop=" + $("#IsSelectTop").prop('checked') + "&AuditingState=" + $('#AuditingState').combobox("getValues") +
                    "&BudgetLevel=" + $('#BudgetLevel').combobox("getValues");
                $.tool.DataPost('Budget', 'Budget_BudgetPlan_CostBudgetSummaryReport', parameters,
                    function Init() {
                    },
                    function callback(_Data) {
                        frozenColumns = [[
                            { field: 'text', title: '单位名称', width: 321, align: 'left' }
                        ]];
                        column = [[
                        ]];
                        if (_Data != "") {
                            var StringList = _Data.split('~');
                            if (StringList.length > 1) {
                                InitColums(StringList[0], StringList[1]);
                                varObjects = eval("(" + StringList[3].replace(/\\/g, "/") + ")"); //转换为json对象
                                LoadList(varObjects);
                            } else {
                                LoadList([]);
                            }
                        } else {
                            LoadList([]);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function InitColums(MaxLevelCode, ColumnsStr) {
                if (ColumnsStr.length > 0) {
                    //冻结列
                    frozenColumns = [[
                        { field: 'text', title: '单位名称', width: 321, align: 'left', rowspan: MaxLevelCode }
                    ]];
                    var ColumnObj = eval("(" + ColumnsStr.replace(/\\/g, "/") + ")"); //转换为json对象（树结构的）
                    //构建几层column frozenColumns
                    for (var i = 1; i < parseInt(MaxLevelCode); i++) {
                        column.push([]);
                        frozenColumns.push([]);
                    }
                    //递归构建 column
                    for (var j = 0; j < ColumnObj.length; j++) {
                        var ItemJson = "";
                        if (ColumnObj[j].FiledName == "") {
                            ItemJson = '{\'title\':\'' + ColumnObj[j].text + '\',\'align\': \'center\',\'colspan\': ' + ColumnObj[j].ColSpan + ',\'rowspan\': ' + ColumnObj[j].RowSpan + '}';
                        } else {
                            ItemJson = '{\'field\':\'' + ColumnObj[j].text + '\',\'title\':\'' + ColumnObj[j].text + '\',\'width\': 121, \'align\': \'center\',\'colspan\': ' + ColumnObj[j].ColSpan + ',\'rowspan\': ' + ColumnObj[j].RowSpan + '}';
                        }
                        column[ColumnObj[j].LevelCode].push(eval("(" + ItemJson + ")"));
                        var childrens = ColumnObj[j].children;
                        GetColumn(childrens);
                    }
                }
            }
            function GetColumn(treeNode) {
                if (treeNode) {
                    for (var j = 0; j < treeNode.length; j++) {
                        var ItemJson = "";
                        if (treeNode[j].FiledName == "") {
                            ItemJson = '{\'title\':\'' + treeNode[j].text + '\',\'align\': \'center\',\'colspan\': ' + treeNode[j].ColSpan + ',\'rowspan\': ' + treeNode[j].RowSpan + '}';
                        } else {
                            ItemJson = '{\'field\':\'' + treeNode[j].text + '\',\'title\':\'' + treeNode[j].text + '\',\'width\': 121, \'align\': \'center\',\'colspan\': ' + treeNode[j].ColSpan + ',\'rowspan\': ' + treeNode[j].RowSpan + '}';
                        }
                        column[treeNode[j].LevelCode].push(eval("(" + ItemJson + ")"));
                        var childrens = treeNode[j].children;
                        GetColumn(childrens);
                    }
                }
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
                var TreeGridData = $('#TableContainer').treegrid("getData");
                var rows = treeDataToList(TreeGridData);
                var AllColumnsList = $('#TableContainer').treegrid('getColumnFields');
                for (var i = 0; i < rows.length; i++) {
                    tableString += '\n<tr>';
                    var Nbspstr = "";
                    for (var k = 1; k < parseInt(rows[i]["LevelCode"]); k++) {
                        Nbspstr += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    //预算项目
                    tableString += '\n<td>' + Nbspstr + rows[i]["text"] + '</td>';

                    for (var j = 0; j < AllColumnsList.length; j++) {
                        tableString += '\n<td';
                        tableString += ' style="text-align:center;"';
                        tableString += ' >';
                        var FiledName = AllColumnsList[j];
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
