<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlanListSearch_Detail.aspx.cs" Inherits="M_Main.BudgetNew.BudgetPlanListSearch_Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算计划查询-按预算明细查询</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <link href="../css/editcss.css" type="text/css" rel="stylesheet">
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/PersonDictionary.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 180px; overflow: hidden;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑; margin-top: 15px;">
                <tr>
                    <td class="TdTitle">预算单位
                    </td>
                    <td class="TdContent">
                        <input id="BudgetCompany" name="BudgetCompany" class="easyui-validatebox" runat="server" style="width: 120px;" onclick="SelUnit();" readonly="readonly" />
                        <input type="hidden" id="BudgetCompanyCode" name="BudgetCompanyCode" runat="server" />
                    </td>
                    <td class="TdTitle">预算项目
                    </td>
                    <td class="TdContent">
                        <input type="text" runat="server" id="BudgetProgram" class="easyui-validatebox" name="BudgetProgram" onclick="SelProgram();" />
                        <input id="BudgetProgramCode" name="BudgetProgramCode" type="hidden" />
                    </td>
                    <td class="TdTitle">预算年度
                    </td>
                    <td class="TdContent">
                        <select id="BudgetYear" name="BudgetYear" class="easyui-combobox" data-options="editable:false,panelHeight:120" style="width: 100px;">
                            <option value="2014">2014</option>
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
                        </select>
                    </td>
                </tr>
                <tr style="height: 50px;">
                    <td class="TdTitle">预算月份
                    </td>
                    <td class="TdContent">
                        <select id="BudgetMonth_Begin" name="BudgetMonth_Begin" class="easyui-combobox" data-options="editable:false,panelHeight:120"
                            runat="server" style="width: 100px;">
                            <option value=""></option>
                            <option value="1">01</option>
                            <option value="2">02</option>
                            <option value="3">03</option>
                            <option value="4">04</option>
                            <option value="5">05</option>
                            <option value="6">06</option>
                            <option value="7">07</option>
                            <option value="8">08</option>
                            <option value="9">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <select id="BudgetMonth_End" name="BudgetMonth_End" class="easyui-combobox" data-options="editable:false,panelHeight:120"
                            runat="server" style="width: 100px;">
                            <option value=""></option>
                            <option value="1">01</option>
                            <option value="2">02</option>
                            <option value="3">03</option>
                            <option value="4">04</option>
                            <option value="5">05</option>
                            <option value="6">06</option>
                            <option value="7">07</option>
                            <option value="8">08</option>
                            <option value="9">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </td>
                    <td class="TdTitle">审核状态
                    </td>
                    <td class="TdContent">
                        <select id="AuditingState" name="AuditingState" class="easyui-combobox" style="width: 100px;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="未启动">未启动</option>
                            <option value="未审核">未审核</option>
                            <option value="审核中">审核中</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="SearchClose"
                            onclick="LoadList()">确定筛选</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'"
                                id="A1" onclick="Clear()">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer" runat="server">
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h - 2 + "px");
                //设置筛选的默认值
                var date = new Date();
                var year = date.getFullYear();
                $('#BudgetYear').val(year);
            }
            InitTableHeight();

            function SelUnit() {
                HDialog.Open('400', '350', '../DialogNew/SelBudgetCompany.aspx', '选择预算单位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $('#BudgetCompany').val(varObjects[1]);
                        $('#BudgetCompanyCode').val(varObjects[0]);
                    }
                });
            }

            //选择项目
            function SelProgram() {
                HDialog.Open('370', '360', '../BudgetNew/BudgetProjectSelect_DownSelect.aspx', '选择预算项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var arry = _Data.split('&');
                        $("#BudgetProgramCode").val(arry[0]);
                        $("#BudgetProgram").val(arry[1]);
                    }
                });
            }

            function Clear() {
                $('#BudgetProgram').val("");
                $('#BudgetProgramCode').val("");

                $("#BudgetMonth_Begin").combobox('setValue', "");
                $("#BudgetMonth_End").combobox('setValue', "");
                $('#AuditingState').combobox("setValue", "全部");

                var date = new Date();
                var year = date.getFullYear();
                $('#BudgetYear').combobox("setValue", year);
            }

            var column = [[
                { field: 'BudgetCompanyName', title: '预算单位', width: 80, align: 'center' },
                { field: 'BudgetYear', title: '预算年度', width: 50, align: 'center' },
                { field: 'BudgetMonth', title: '预算月份', width: 50, align: 'center' },
                { field: 'BudgetProgramName', title: '预算科目', width: 50, align: 'center' },
                { field: 'BudgetValueForYear', title: '初始预算值', width: 50, align: 'center' },
                { field: 'BudgetChaneValue', title: '调整预算值', width: 50, align: 'center' },
                { field: 'BudgetFinalValue', title: '最终预算值', width: 50, align: 'center' },
                { field: 'AuditingState', title: '审批状态', width: 40, align: 'center' }
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
                        window.open("BudgetPlanListSearch_DetailExport.aspx?" + $("#frmForm").serialize());
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Budget&Command=GetBudgetPlanDetailList&' + $("#frmForm").serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "dasc"
                });

                $('#SearchDlg').dialog('close');
            }
            LoadList();
        </script>
    </form>
</body>
</html>
