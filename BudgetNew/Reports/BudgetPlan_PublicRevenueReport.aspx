<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlan_PublicRevenueReport.aspx.cs" Inherits="M_Main.BudgetNew.Reports.BudgetPlan_PublicRevenueReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算报表-预算计划-公共收益预算表</title>
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
                    <td class="TdTitle">科目层级</td>
                    <td class="TdContentSearch">
                        <select id="BudgetLevel" name="BudgetLevel" class="easyui-combobox" style="width: 125px;" data-options="editable:false,panelHeight:'auto'">
                            <option value="0">1级</option>
                            <option value="1">2级</option>
                            <option value="2" selected>3级</option>
                            <option value="3">4级</option>
                            <option value="4">5级</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">取值方式</td>
                    <td class="TdContentSearch">
                        <select id="WayOfValueSelect" name="WayOfValueSelect" class="easyui-combobox" style="width: 125px;" data-options="editable:false,panelHeight:'auto'">
                            <option value="预算初始值" selected>预算初始值</option>
                            <option value="预算最终值">预算最终值</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="Btn_SearchClick();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h - 2 + "px");
            }

            //选择预算单位
            function SelUnit() {
                HDialog.Open('400', '350', '../BudgetNew/BudgetCompanySelectWithOutParent.aspx', '选择预算单位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split('%');
                        $('#BudgetCompany').val(varObjects[1]);
                        $('#BudgetCompanyCode').val(varObjects[0]);
                    }
                });
            }
            function ClearWhere() {
                $('#frmForm').form("clear");
                //科目层级默认两级
                $('#BudgetLevel').combobox("setValue", "2");
                $('#WayOfValueSelect').combobox("setValue", "预算初始值");
            }

            /* datagrid列名 */

            //***冻结列
            var frozenColumns = [[
                { field: 'RowNo', title: '序号', width: 50, align: 'center', rowspan: 2 },
                { title: '预算科目', align: 'center', colspan: 3 }
            ], [
                { field: '1级科目', title: '1级', width: 120, align: 'center' },
                { field: '2级科目', title: '2级', width: 120, align: 'center' },
                { field: '3级科目', title: '3级', width: 120, align: 'center' }
            ]];

            var column = [[
                { field: 'AuxiliaryAccounting', title: '辅助核算', width: 120, align: 'center', rowspan: 2 },
                { field: 'BudgetValueForYear', title: '本年预算', width: 120, align: 'center', rowspan: 2 },
                { field: 'LastYearCompleteValue', title: '上年实际', width: 120, align: 'center', rowspan: 2 },
                { title: '增长情况', align: 'center', colspan: 2 },
                { field: 'Proportion', title: '占比', width: 80, align: 'center', rowspan: 2 },
                { field: 'BudgetExplain', title: '预算说明', width: 100, align: 'center', rowspan: 2 },
                { title: '月度预算数', align: 'center', colspan: 12 },
                { field: 'Remark', title: '备注', width: 80, align: 'center', rowspan: 2 }
            ], [
                { field: 'GrowthAmount', title: '增长额', align: 'center', width: 100 },
                { field: 'GrowthRate', title: '增长率', align: 'center', width: 100 },
                { field: 'January', title: '1月', align: 'center', width: 100 },
                { field: 'February', title: '2月', align: 'center', width: 100 },
                { field: 'March', title: '3月', align: 'center', width: 100 },
                { field: 'April', title: '4月', align: 'center', width: 100 },
                { field: 'May', title: '5月', align: 'center', width: 100 },
                { field: 'June', title: '6月', align: 'center', width: 100 },
                { field: 'July', title: '7月', align: 'center', width: 100 },
                { field: 'August', title: '8月', align: 'center', width: 100 },
                { field: 'September', title: '9月', align: 'center', width: 100 },
                { field: 'October', title: '10月', align: 'center', width: 100 },
                { field: 'November', title: '11月', align: 'center', width: 100 },
                { field: 'December', title: '12月', align: 'center', width: 100 }
            ]]

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
                        //var rowData = $('#TableContainer').datagrid('getData');
                        //if (rowData.length == 0) {
                        //    HDialog.Info('没有需要导出的预算执行汇总数据');
                        //}
                        //else {
                        //    Export('预算执行汇总表', $('#TableContainer'));
                        //}
                    }
                }
            ];

            function LoadList(dataValue) {
                $("#TableContainer").datagrid({
                    data: dataValue,
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    rownumbers: false,
                    singleSelect: true,
                    pagination: false,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    rowStyler: function (index, row) {
                        if (row.BudgetProgram == "" && row.ParentId == "") {
                            return 'background-color:#f0f0f0;';
                        }
                    },
                    onLoadSuccess: function (data) {
                        $("#TableContainer").datagrid("autoMergeCells", ['1级科目', '2级科目', '3级科目', '4级科目', '5级科目', '6级科目', '7级科目']);
                        var rows = $("#TableContainer").datagrid("getRows");
                        var CurrentLevel = $('#BudgetLevel').combobox("getValue");
                        CurrentLevel = parseInt(CurrentLevel) + 1;
                        for (var i = 0; i < rows.length; i++) {
                            //判断当前行是否是 固定行
                            if (rows[i].BudgetProgram == "" && rows[i].ParentId == "") {
                                $("#TableContainer").datagrid('mergeCells', {
                                    index: i,
                                    field: '1级科目',
                                    colspan: CurrentLevel
                                });
                            }
                        }

                    },
                    onLoadError: function () {
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            //***确定筛选
            function Btn_SearchClick() {
                if ($("#BudgetCompany").val() == "" || $("#BudgetCompanyCode").val() == "") {
                    HDialog.Info("请选择预算单位");
                    return;
                }
                if ($("#BudgetYear").val() == "") {
                    HDialog.Info("请选择预算年度");
                    return;
                }
                $('#SearchDlg').dialog('close');
                var parameters = "BudgetCompany=" + $('#BudgetCompanyCode').val() + "&BudgetYear=" + $('#BudgetYear').val() + "&BudgetLevel=" + $('#BudgetLevel').combobox("getValue")
                    + "&WayOfValueSelect=" + $('#WayOfValueSelect').combobox("getValue");

                $.tool.DataGet('Budget', 'Budget_BudgetPlan_PublicRevenueReport', parameters,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            InitColums();
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
            function InitColums() {
                var CurrentLevel = $('#BudgetLevel').combobox("getValue");
                CurrentLevel = parseInt(CurrentLevel) + 1;
                var CurrentfrozenColumns = [];
                //第一行项目头
                var FirstRow = [];
                var RowNoJson = '{\'field\':\'' + 'RowNo' + '\',\'title\':\'' + "序号" + '\',\'width\': \'50\',\'align\': \'' + 'center' + '\', \'rowspan\': \'2\' }';
                FirstRow.push(eval("(" + RowNoJson + ")"));
                var TitleJson = '{\'title\':\'' + "预算科目" + '\',\'colspan\': ' + CurrentLevel + '}';
                FirstRow.push(eval("(" + TitleJson + ")"));
                CurrentfrozenColumns.push(FirstRow);
                var SecondRow = [];

                for (var i = 1; i <= CurrentLevel; i++) {
                    var Filedjson = '{\'field\':\'' + i + '级科目' + '\',\'title\':\'' + i + '级' + '\',\'width\': \'120\', \'align\': \'center\'}';
                    SecondRow.push(eval("(" + Filedjson + ")"));
                }
                CurrentfrozenColumns.push(SecondRow);
                frozenColumns = CurrentfrozenColumns;
            }

            $.extend($.fn.datagrid.methods, {
                autoMergeCells: function (jq, fields) {
                    return jq.each(function () {
                        var target = $(this);
                        if (!fields) {
                            fields = target.datagrid("getColumnFields");
                        }
                        var rows = target.datagrid("getRows");
                        var i = 0,
                            j = 0,
                            temp = {};
                        for (i; i < rows.length; i++) {
                            var row = rows[i];
                            j = 0;
                            for (j; j < fields.length; j++) {
                                if (rows[i][fields[j]]) {
                                    var field = fields[j];
                                    var tf = temp[field];
                                    if (!tf) {
                                        tf = temp[field] = {};
                                        tf[row[field]] = [i];
                                    } else {
                                        var tfv = tf[row[field]];
                                        if (tfv) {
                                            tfv.push(i);
                                        } else {
                                            tfv = tf[row[field]] = [i];
                                        }
                                    }
                                }
                            }
                        }
                        $.each(temp, function (field, colunm) {
                            $.each(colunm, function () {
                                var group = this;
                                if (group.length > 1) {
                                    var before,
                                        after,
                                        megerIndex = group[0];
                                    for (var i = 0; i < group.length; i++) {
                                        before = group[i];
                                        after = group[i + 1];
                                        if (after && (after - before) == 1) {
                                            continue;
                                        }
                                        var rowspan = before - megerIndex + 1;
                                        if (rowspan > 1) {
                                            target.datagrid('mergeCells', {
                                                index: megerIndex,
                                                field: field,
                                                rowspan: rowspan
                                            });
                                        }
                                        if (after && (after - before) != 1) {
                                            megerIndex = after;
                                        }
                                    }
                                }
                            });
                        });
                    });
                }
            });

            //页面初始化
            $(function () {
                InitTableHeight();
                LoadList([]); //不默认加载
            })

        </script>
    </form>
</body>
</html>
