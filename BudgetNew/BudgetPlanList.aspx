<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlanList.aspx.cs" Inherits="M_Main.BudgetNew.BudgetPlanList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算计划列表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 750px;
            height: 160px;
        }

        .SearchTable {
            width: 750px;
            height: auto;
        }


        .TdContent input, select {
            border: 1px #cccccc solid;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">预算表编号
                    </td>
                    <td class="TdContent">
                        <input id="PlanNO" name="PlanNO" value="" runat="server" />
                    </td>
                    <td class="TdTitle">预算表名称
                    </td>
                    <td class="TdContent">
                        <input id="BudgetTableName" name="BudgetTableName" value="" runat="server" />
                    </td>
                    <td class="TdTitle">预算单位
                    </td>
                    <td class="TdContent">
                        <input id="BudgetCompany" name="BudgetCompany" class="easyui-validatebox" runat="server" onclick="SelUnit();" />
                        <input type="hidden" id="BudgetCompanyCode" name="BudgetCompanyCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起人</td>
                    <td class="TdContent">
                        <input id="CreateUser" name="CreateUser" value="" runat="server" />
                    </td>
                    <td class="TdTitle">发起时间从</td>
                    <td class="TdContent ">
                        <input id="CreateDate_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="CreateDate_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent ">
                        <input id="CreateDate_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="CreateDate_End" runat="server" />
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">预算年度
                    </td>
                    <td class="TdContent ">
                        <select id="BudgetYear" name="BudgetYear" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'">
                            <option value=""></option>
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
                    <td class="TdTitle">审核状态
                    </td>
                    <td class="TdContent ">
                        <select id="AuditingState" name="AuditingState" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="未启动">未启动</option>
                            <option value="未审核">未审核</option>
                            <option value="审核中">审核中</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ClaerWhere();">清  除 </a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" value="" runat="server" id="CommId" name="CommId" />
        <input type="hidden" value="" runat="server" id="DepCode" name="DepCode" />

        <script type="text/javascript">

            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                //设置筛选的默认值
                //var date = new Date();
                //var year = date.getFullYear();
                //$('#BudgetYear').val(year);
            }

            InitFunction();

            //清空筛选条件
            function ClaerWhere() {
                $("#PlanNO").val("");
                $("#BudgetTableName").val("");

                $("#BudgetCompany").val("");
                $("#BudgetCompanyCode").val("");

                $("#CreateUser").val("");

                $("#CreateDate_Begin").datebox("setValue", "");
                $("#CreateDate_End").datebox("setValue", "");

                $('#AuditingState').combobox("select", "全部");
                $('#BudgetYear').combobox("setValue", "");
                //var date = new Date();
                //var year = date.getFullYear();
                //$('#BudgetYear').combobox("setValue", year);
            }

            var column = [[
                {
                    field: 'PlanNo', title: '预算表编号', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.PlanID + "','edit');\">" + row.PlanNO + "</a>";
                        return str;
                    }
                },
                { field: 'BudgetTableName', title: '预算表名称', align: 'center', width: 180, sortable: true },
                { field: 'BudgetCompanyName', title: '预算单位', align: 'center', width: 100, sortable: true },
                { field: 'BudgetYear', title: '预算年度', align: 'center', width: 60, sortable: true },
                { field: 'CreateUserName', title: '发起人', width: 100, align: 'center', sortable: true },
                {
                    field: 'CreateDate', title: '发起时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.CreateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'AuditingState', title: '审核状态', width: 80, align: 'center', sortable: true }
            ]];
            //工具栏
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        Detail('', 'insert');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function SelUnit() {
                HDialog.Open('400', '350', '../DialogNew/SelBudgetCompany.aspx', '选择预算单位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $('#BudgetCompany').val(varObjects[1]);
                        $('#BudgetCompanyCode').val(varObjects[0]);
                    }
                });
            }

            //删除预算计划
            function DelRecord(row) {
                var selectedRow = $('#TableContainer').datagrid("getSelected");
                if (selectedRow == null) {
                    HDialog.Info("请选择需要删除的预算计划");
                    return;
                }
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        if (row.AuditingState != "" && (row.AuditingState == "已驳回" || row.AuditingState == "未启动")) {
                            $.tool.DataGet('Budget', 'DelBudgetPlan', 'PlanID=' + row.PlanID,
                                function Init() {
                                },
                                function callback(_Data) {
                                    $('#SearchDlg').parent().appendTo($("form:first"));
                                    if (_Data == "false") {
                                        HDialog.Info("删除失败");
                                    }
                                    else {
                                        HDialog.Info("删除成功");
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                        else {
                            HDialog.Info("无法删除");
                        }
                    }
                });
            }
            //加载列表
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Budget&Command=GetBudgetPlanList&' + $("#frmForm").serialize(),
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
            $('#SearchDlg').parent().appendTo($("form:first"));

            //新增 修改
            function Detail(Id, OpType) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../BudgetNew/BudgetPlanList_Detail.aspx?Id=' + Id + '&OpType=' + OpType, '预算计划编制', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
