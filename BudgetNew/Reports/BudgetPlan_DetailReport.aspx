<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlan_DetailReport.aspx.cs" Inherits="M_Main.BudgetNew.Reports.BudgetPlan_DetailReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算报表-预算计划-预算明细表</title>
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
                        </select>
                    </td>

                </tr>
                <tr>
                    
                    <td class="TdTitle">预算模板</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="BudgetTemplate" name="BudgetTemplate" style="width: 87%; border: 1px solid #cccccc; resize: none;" class="easyui-validatebox" onclick="SelTemplate();"
                            readonly="readonly"></textarea>
                        <input type="hidden" id="BudgetTemplateCode" name="BudgetTemplateCode" runat="server" />
                        <%--<select id="BudgetLevel" name="BudgetLevel" class="easyui-combobox" style="width: 125px;" data-options="editable:false,panelHeight:'auto'">
                            <option value="0">1级</option>
                            <option value="1">2级</option>
                            <option value="2" selected>3级</option>
                            <option value="3">4级</option>
                            <option value="4">5级</option>
                        </select>--%>
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
                HDialog.Open('400', '350', '../BudgetNew/BudgetCompanySelectWithOutParent.aspx', '选择预算单位', true, function callback(_Data) {
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

                //HDialog.Open('400', '350', '../BudgetNew/BudgetCompanySelect.aspx', '选择预算单位', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split('%');
                //        $('#BudgetCompany').val(varObjects[1]);
                //        $('#BudgetCompanyCode').val(varObjects[0]);
                //    }
                //});
            }

            //***选择预算模板
            function SelTemplate() {
                HDialog.Open('400', '350', '../BudgetNew/BudgetTemplateDialog_Multiple.aspx', '选择预算模板', true, function callback(_Data) {
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
                        $("#BudgetTemplateCode").val(IdList.substring(0, IdList.length - 1));
                        $("#BudgetTemplate").val(NameList.substring(0, NameList.length - 1));
                    }
                });
            }

            function ClearWhere() {
                $('#frmForm').form("clear");
                //科目层级默认两级
                $('#BudgetLevel').combobox("setValue", "2");
            }

            //***冻结列
            var frozenColumns = [[
                { field: 'text', title: '预算科目', width: 220, align: 'left', rowspan: 2 },
                { field: 'BudgetValueForYear', title: '年度预算初始值', width: 100, align: 'left', rowspan: 2 },
                { field: 'BudgetValueForChange', title: '年度预算调整值', width: 100, align: 'left', rowspan: 2 },
                { field: 'BudgetValueForFinal', title: '年度预算最终值', width: 100, align: 'left', rowspan: 2 },
            ], [
            ]];

            var column = [[
                { title: '1月', align: 'center', colspan: 3 },
                { title: '2月', align: 'center', colspan: 3 },
                { title: '3月', align: 'center', colspan: 3 },
                { title: '4月', align: 'center', colspan: 3 },
                { title: '5月', align: 'center', colspan: 3 },
                { title: '6月', align: 'center', colspan: 3 },
                { title: '7月', align: 'center', colspan: 3 },
                { title: '8月', align: 'center', colspan: 3 },
                { title: '9月', align: 'center', colspan: 3 },
                { title: '10月', align: 'center', colspan: 3 },
                { title: '11月', align: 'center', colspan: 3 },
                { title: '12月', align: 'center', colspan: 3 }
            ], [
                { field: 'BudgetValue1Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange1Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal1Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue2Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange2Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal2Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue3Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange3Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal3Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue4Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange4Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal4Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue5Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange5Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal5Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue6Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange6Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal6Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue7Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange7Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal7Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue8Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange8Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal8Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue9Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange9Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal9Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue10Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange10Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal10Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue11Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange11Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal11Y', title: '最终值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetValue12Y', title: '初始值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetChange12Y', title: '调整值', align: 'center', width: 90, sortable: true },
                { field: 'BudgetFinal12Y', title: '最终值', align: 'center', width: 90, sortable: true }
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
                            HDialog.Info('没有需要导出的预算明细数据');
                        }
                        else {
                            Export('预算明细表', $('#TableContainer'));
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
                    showFooter: true,
                    onLoadSuccess: function () {
                        if (dataValue.length == 0) {
                            //加载页脚
                            $('#TableContainer').treegrid('reloadFooter', [
                                {
                                    text: "收入合计",
                                    id: "SRHJ"
                                },
                                {
                                    text: "支出合计",
                                    id: "ZCHJ"
                                },
                                {
                                    text: "结余合计",
                                    id: "JYHJ"
                                }
                            ]);
                        } else {
                            UpdateAmount();
                        }

                    }
                });
                $('#SearchDlg').dialog('close');
            }

            function UpdateAmount() {
                //加载页脚
                $('#TableContainer').treegrid('reloadFooter', [
                    {
                        text: "收入合计",
                        id: "SRHJ",
                        BudgetValueForYear: ComputeGridCol("BudgetValueForYear", "0"),
                        BudgetValueForChange: ComputeGridCol("BudgetValueForChange", "0"),
                        BudgetValueForFinal: ComputeGridCol("BudgetValueForFinal", "0"),
                        BudgetValue1Y: ComputeGridCol("BudgetValue1Y", "0"),
                        BudgetChange1Y: ComputeGridCol("BudgetChange1Y", "0"),
                        BudgetFinal1Y: ComputeGridCol("BudgetFinal1Y", "0"),
                        BudgetValue2Y: ComputeGridCol("BudgetValue2Y", "0"),
                        BudgetChange2Y: ComputeGridCol("BudgetChange2Y", "0"),
                        BudgetFinal2Y: ComputeGridCol("BudgetFinal2Y", "0"),
                        BudgetValue3Y: ComputeGridCol("BudgetValue3Y", "0"),
                        BudgetChange3Y: ComputeGridCol("BudgetChange3Y", "0"),
                        BudgetFinal3Y: ComputeGridCol("BudgetFinal3Y", "0"),
                        BudgetValue4Y: ComputeGridCol("BudgetValue4Y", "0"),
                        BudgetChange4Y: ComputeGridCol("BudgetChange4Y", "0"),
                        BudgetFinal4Y: ComputeGridCol("BudgetFinal4Y", "0"),
                        BudgetValue5Y: ComputeGridCol("BudgetValue5Y", "0"),
                        BudgetChange5Y: ComputeGridCol("BudgetChange5Y", "0"),
                        BudgetFinal5Y: ComputeGridCol("BudgetFinal5Y", "0"),
                        BudgetValue6Y: ComputeGridCol("BudgetValue6Y", "0"),
                        BudgetChange6Y: ComputeGridCol("BudgetChange6Y", "0"),
                        BudgetFinal6Y: ComputeGridCol("BudgetFinal6Y", "0"),
                        BudgetValue7Y: ComputeGridCol("BudgetValue7Y", "0"),
                        BudgetChange7Y: ComputeGridCol("BudgetChange7Y", "0"),
                        BudgetFinal7Y: ComputeGridCol("BudgetFinal7Y", "0"),
                        BudgetValue8Y: ComputeGridCol("BudgetValue8Y", "0"),
                        BudgetChange8Y: ComputeGridCol("BudgetChange8Y", "0"),
                        BudgetFinal8Y: ComputeGridCol("BudgetFinal8Y", "0"),
                        BudgetValue9Y: ComputeGridCol("BudgetValue9Y", "0"),
                        BudgetChange9Y: ComputeGridCol("BudgetChange9Y", "0"),
                        BudgetFinal9Y: ComputeGridCol("BudgetFinal9Y", "0"),
                        BudgetValue10Y: ComputeGridCol("BudgetValue10Y", "0"),
                        BudgetChange10Y: ComputeGridCol("BudgetChange10Y", "0"),
                        BudgetFinal10Y: ComputeGridCol("BudgetFinal10Y", "0"),
                        BudgetValue11Y: ComputeGridCol("BudgetValue11Y", "0"),
                        BudgetChange11Y: ComputeGridCol("BudgetChange11Y", "0"),
                        BudgetFinal11Y: ComputeGridCol("BudgetFinal11Y", "0"),
                        BudgetValue12Y: ComputeGridCol("BudgetValue12Y", "0"),
                        BudgetChange12Y: ComputeGridCol("BudgetChange12Y", "0"),
                        BudgetFinal12Y: ComputeGridCol("BudgetFinal12Y", "0")
                    },
                    {
                        text: "支出合计",
                        id: "ZCHJ",
                        BudgetValueForYear: ComputeGridCol("BudgetValueForYear", "1"),
                        BudgetValueForChange: ComputeGridCol("BudgetValueForChange", "1"),
                        BudgetValueForFinal: ComputeGridCol("BudgetValueForFinal", "1"),
                        BudgetValue1Y: ComputeGridCol("BudgetValue1Y", "1"),
                        BudgetChange1Y: ComputeGridCol("BudgetChange1Y", "1"),
                        BudgetFinal1Y: ComputeGridCol("BudgetFinal1Y", "1"),
                        BudgetValue2Y: ComputeGridCol("BudgetValue2Y", "1"),
                        BudgetChange2Y: ComputeGridCol("BudgetChange2Y", "1"),
                        BudgetFinal2Y: ComputeGridCol("BudgetFinal2Y", "1"),
                        BudgetValue3Y: ComputeGridCol("BudgetValue3Y", "1"),
                        BudgetChange3Y: ComputeGridCol("BudgetChange3Y", "1"),
                        BudgetFinal3Y: ComputeGridCol("BudgetFinal3Y", "1"),
                        BudgetValue4Y: ComputeGridCol("BudgetValue4Y", "1"),
                        BudgetChange4Y: ComputeGridCol("BudgetChange4Y", "1"),
                        BudgetFinal4Y: ComputeGridCol("BudgetFinal4Y", "1"),
                        BudgetValue5Y: ComputeGridCol("BudgetValue5Y", "1"),
                        BudgetChange5Y: ComputeGridCol("BudgetChange5Y", "1"),
                        BudgetFinal5Y: ComputeGridCol("BudgetFinal5Y", "1"),
                        BudgetValue6Y: ComputeGridCol("BudgetValue6Y", "1"),
                        BudgetChange6Y: ComputeGridCol("BudgetChange6Y", "1"),
                        BudgetFinal6Y: ComputeGridCol("BudgetFinal6Y", "1"),
                        BudgetValue7Y: ComputeGridCol("BudgetValue7Y", "1"),
                        BudgetChange7Y: ComputeGridCol("BudgetChange7Y", "1"),
                        BudgetFinal7Y: ComputeGridCol("BudgetFinal7Y", "1"),
                        BudgetValue8Y: ComputeGridCol("BudgetValue8Y", "1"),
                        BudgetChange8Y: ComputeGridCol("BudgetChange8Y", "1"),
                        BudgetFinal8Y: ComputeGridCol("BudgetFinal8Y", "1"),
                        BudgetValue9Y: ComputeGridCol("BudgetValue9Y", "1"),
                        BudgetChange9Y: ComputeGridCol("BudgetChange9Y", "1"),
                        BudgetFinal9Y: ComputeGridCol("BudgetFinal9Y", "1"),
                        BudgetValue10Y: ComputeGridCol("BudgetValue10Y", "1"),
                        BudgetChange10Y: ComputeGridCol("BudgetChange10Y", "1"),
                        BudgetFinal10Y: ComputeGridCol("BudgetFinal10Y", "1"),
                        BudgetValue11Y: ComputeGridCol("BudgetValue11Y", "1"),
                        BudgetChange11Y: ComputeGridCol("BudgetChange11Y", "1"),
                        BudgetFinal11Y: ComputeGridCol("BudgetFinal11Y", "1"),
                        BudgetValue12Y: ComputeGridCol("BudgetValue12Y", "1"),
                        BudgetChange12Y: ComputeGridCol("BudgetChange12Y", "1"),
                        BudgetFinal12Y: ComputeGridCol("BudgetFinal12Y", "1")
                    },
                    {
                        text: "结余合计",
                        id: "JYHJ",
                        BudgetValueForYear: ComputeGridCol("BudgetValueForYear", "2"),
                        BudgetValueForChange: ComputeGridCol("BudgetValueForChange", "2"),
                        BudgetValueForFinal: ComputeGridCol("BudgetValueForFinal", "2"),
                        BudgetValue1Y: ComputeGridCol("BudgetValue1Y", "2"),
                        BudgetChange1Y: ComputeGridCol("BudgetChange1Y", "2"),
                        BudgetFinal1Y: ComputeGridCol("BudgetFinal1Y", "2"),
                        BudgetValue2Y: ComputeGridCol("BudgetValue2Y", "2"),
                        BudgetChange2Y: ComputeGridCol("BudgetChange2Y", "2"),
                        BudgetFinal2Y: ComputeGridCol("BudgetFinal2Y", "2"),
                        BudgetValue3Y: ComputeGridCol("BudgetValue3Y", "2"),
                        BudgetChange3Y: ComputeGridCol("BudgetChange3Y", "2"),
                        BudgetFinal3Y: ComputeGridCol("BudgetFinal3Y", "2"),
                        BudgetValue4Y: ComputeGridCol("BudgetValue4Y", "2"),
                        BudgetChange4Y: ComputeGridCol("BudgetChange4Y", "2"),
                        BudgetFinal4Y: ComputeGridCol("BudgetFinal4Y", "2"),
                        BudgetValue5Y: ComputeGridCol("BudgetValue5Y", "2"),
                        BudgetChange5Y: ComputeGridCol("BudgetChange5Y", "2"),
                        BudgetFinal5Y: ComputeGridCol("BudgetFinal5Y", "2"),
                        BudgetValue6Y: ComputeGridCol("BudgetValue6Y", "2"),
                        BudgetChange6Y: ComputeGridCol("BudgetChange6Y", "2"),
                        BudgetFinal6Y: ComputeGridCol("BudgetFinal6Y", "2"),
                        BudgetValue7Y: ComputeGridCol("BudgetValue7Y", "2"),
                        BudgetChange7Y: ComputeGridCol("BudgetChange7Y", "2"),
                        BudgetFinal7Y: ComputeGridCol("BudgetFinal7Y", "2"),
                        BudgetValue8Y: ComputeGridCol("BudgetValue8Y", "2"),
                        BudgetChange8Y: ComputeGridCol("BudgetChange8Y", "2"),
                        BudgetFinal8Y: ComputeGridCol("BudgetFinal8Y", "2"),
                        BudgetValue9Y: ComputeGridCol("BudgetValue9Y", "2"),
                        BudgetChange9Y: ComputeGridCol("BudgetChange9Y", "2"),
                        BudgetFinal9Y: ComputeGridCol("BudgetFinal9Y", "2"),
                        BudgetValue10Y: ComputeGridCol("BudgetValue10Y", "2"),
                        BudgetChange10Y: ComputeGridCol("BudgetChange10Y", "2"),
                        BudgetFinal10Y: ComputeGridCol("BudgetFinal10Y", "2"),
                        BudgetValue11Y: ComputeGridCol("BudgetValue11Y", "2"),
                        BudgetChange11Y: ComputeGridCol("BudgetChange11Y", "2"),
                        BudgetFinal11Y: ComputeGridCol("BudgetFinal11Y", "2"),
                        BudgetValue12Y: ComputeGridCol("BudgetValue12Y", "2"),
                        BudgetChange12Y: ComputeGridCol("BudgetChange12Y", "2"),
                        BudgetFinal12Y: ComputeGridCol("BudgetFinal12Y", "2")
                    }
                ]);
            }
            function ComputeGridCol(colName, type) {
                var SRHJ = 0;
                var ZCHJ = 0;
                var total = 0;
                var TreeGridData = $('#TableContainer').treegrid("getData");
                var rows = treeDataToList(TreeGridData);
                if (rows.length > 0) {
                    if (type == "0") {
                        for (var i = 0; i < rows.length; i++) {

                            if (rows[i].SubjectType == "0" && rows[i].IsBottom == "1") {
                                total += parseFloat(rows[i][colName]);
                            }
                        }
                        return ToDecimal(total, decimalPos);
                    }
                    if (type == "1") {
                        for (var i = 0; i < rows.length; i++) {
                            if (rows[i].SubjectType == "1" && rows[i].IsBottom == "1") {
                                total += parseFloat(rows[i][colName]);
                            }
                        }
                        return ToDecimal(total, decimalPos);
                    }
                    if (type == "2") {
                        for (var i = 0; i < rows.length; i++) {
                            if (rows[i].SubjectType == "0" && rows[i].IsBottom == "1") {
                                SRHJ += parseFloat(rows[i][colName]);
                            }
                            if (rows[i].SubjectType == "1" && rows[i].IsBottom == "1") {
                                ZCHJ += parseFloat(rows[i][colName]);
                            }
                        }
                        total = SRHJ - ZCHJ;
                        return ToDecimal(total, decimalPos);
                    }
                } else {
                    return ToDecimal(total, decimalPos);
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

            //***确定筛选
            function Btn_SearchClick() {
                //if ($("#BudgetCompany").val() == "" || $("#BudgetCompanyCode").val() == "") {
                //    HDialog.Info("请选择预算单位");
                //    return;
                //}
                //alert($("#AuditingState").combobox("getValues"));
                if ($("#BudgetYear").val() == "") {
                    HDialog.Info("请选择预算年度");
                    return;
                }
                $('#SearchDlg').dialog('close');
                var parameters = "BudgetCompany=" + $('#BudgetCompanyCode').val() + "&BudgetYear=" + $('#BudgetYear').val() + "&BudgetLevel=10" + //+ $('#BudgetLevel').combobox("getValue") +
                    "&BudgetProgram=" + $('#BudgetProgram').val() + "&AuditingState=" + $('#AuditingState').combobox("getValues") + "&BudgetTemplateCode=" + $('#BudgetTemplateCode').val();

                $.tool.DataGet('Budget', 'Budget_BudgetPlan_DetailReport', parameters,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
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

                //插入查询条件
                tableString += '\n<tr style="height:20;font-weight:bold">';
                tableString += '\n<td colspan="20">';
                tableString += '预算单位:' + $('#BudgetCompany').val() +
                    '预算年度:' + $('#BudgetYear').val() +
                    "预算科目:" + $('#BudgetProgramName').val();
                tableString += '</td>';
                tableString += '\n</tr>';

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
                var FootGridData = $('#TableContainer').treegrid("getFooterRows");
                var rows = treeDataToList(TreeGridData);
                for (var i = 0; i < FootGridData.length; i++) {
                    rows.push(FootGridData[i]);
                }
                for (var i = 0; i < rows.length; i++) {
                    tableString += '\n<tr>';
                    var Nbspstr = "";
                    for (var k = 0; k < parseInt(rows[i]["LevelCode"]); k++) {
                        Nbspstr += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    //预算项目
                    tableString += '\n<td>' + Nbspstr + rows[i]["text"] + '</td>';
                    //年度预算初始值
                    tableString += '\n<td>' + rows[i]["BudgetValueForYear"] + '</td>';
                    //年度预算调整值
                    tableString += '\n<td>' + rows[i]["BudgetValueForChange"] + '</td>';
                    //年度预算最终值
                    tableString += '\n<td>' + rows[i]["BudgetValueForFinal"] + '</td>';

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
