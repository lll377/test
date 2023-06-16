<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanProcessFlowList.aspx.cs" Inherits="M_Main.Plan.PlanProcessFlowList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <%--  <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css">--%>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../jscript/Dialog.js"></script>
    <style type="text/css">
        .Td {
            height: 16px;
            width: 20%;
            text-align: right;
        }

        .TContent {
            height: 16px;
            width: 25%;
            margin-left: 15px;
            padding-left: 15px;
            text-align: left;
        }

        a {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="FrmFrom" runat="server">
        <input type="hidden" id="TypeCode" name="TypeCode" runat="server" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg1" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 530px; height: 110px; overflow: hidden; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="Td">计划值调整类型</td>
                    <td class="TContent">
                        <select id="BudgetAdjustType" name="BudgetAdjustType" runat="server" isdctype="true" dctype="预算额调整类型"
                            style="width: 75%; border: 1px #cccccc solid;" class="easyui-validatebox ">
                            <option value=""></option>
                            <option value="总量不变" style="color: #000000;">总量不变</option>
                            <option value="总量增加" style="color: #000000;">总量增加</option>
                        </select>
                    </td>
                    <td class="Td">流程名称</td>
                    <td class="TContent">
                        <input id="WorkFlowIdName1" name="WorkFlowIdName1" onclick="WorkFlowChoise('1');" class="easyui-validatebox" style="width: 130px;" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center"></td>
                </tr>
                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>

                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
                            onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="WorkFlowId" name="WorkFlowId" />
        <script language="javascript" type="text/javascript">
            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };
            function InitSelect() {
                $.tool.DataPostAsync('CsCost', 'BindDictionary', 'DcTypeName=报账/付款类型',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        $("#PaymentType").append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                            $("#PaymentType").append(option);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);

                $.tool.DataPostAsync('CsCost', 'BindDictionary', 'DcTypeName=借款类型',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        $("#LoanType").append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                            $("#LoanType").append(option);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
                $.tool.DataPostAsync('CsCost', 'BindDictionary', 'DcTypeName=合同类型',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        $("#ContractId").append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                            $("#ContractId").append(option);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }
            InitSelect();
            function WorkFlowChoise(str) {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&biaoshi=1&Filter=" + $("#TypeCode").val() + "&random=" + Math.random();
                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        document.getElementById("WorkFlowId").value = obj[0].toString();
                        document.getElementById("WorkFlowIdName" + str).value = obj[1].toString();
                    }
                });
            }
            function btnClear() {
                $("#ContractMoneyStart").numberbox('setValue', "");
                $("#ContractMoneyEnd").numberbox('setValue', "");
                $("#PlanMoneyStart").numberbox('setValue', "");
                $("#PlanMoneyEnd").numberbox('setValue', "");
                $("#PaymentMoneyStart").numberbox('setValue', "");
                $("#PaymentMoneyEnd").numberbox('setValue', "");
                $("#LoanMoneyStart").numberbox('setValue', "");
                $("#LoanMoneyEnd").numberbox('setValue', "");
                $("#WorkFlowId").val("");
                $("#WorkFlowIdName1").val("");
                $("#WorkFlowIdName2").val("");
                $("#WorkFlowIdName3").val("");
                $("#WorkFlowIdName4").val("");
                $("#WorkFlowIdName5").val("");
                $("#SupplierType").val("");
                $("#ContractId").val("");
                $("#PaymentType").val("");
                $("#LoanType").val("");
            }
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            function pageEdit(Id) {
                HDialog.Open('550', '220', '../CostManageNew/CostProcessFlowSet.aspx?OpType=Edit&ID=' + Id + '&TypeCode=' + $("#TypeCode").val(), '修改', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        LoadList();
                    }
                });
            }
            InitTableHeight();
            var frozenColumns = [[
                { field: 'Id', title: 'ID', width: 25, align: 'left', sortable: true, hidden: true },
                {
                    field: 'TypeCode', title: '审批类型', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" onclick=\"pageEdit('" + row.Id + "')\">";
                        switch (row.TypeCode) {
                            case "0802":
                                str += "计划调整";
                                break;
                        }
                        str += "</a>";
                        return str;
                    }
                }
                //,
                //
            ]];
            function colomsShow() {
                switch ($("#TypeCode").val()) {
                    case "0802":
                        frozenColumns[0].push(eval('({ field: \'BudgetAdjustType\', title: \'计划单调整类型\', width: 120, align: \'left\', sortable: true })'));
                        break;

                }
                LoadList();
            }
            var column = [[
                { field: 'CostCategory', title: '计划值调整类型', width: 45, align: 'left', sortable: true }
                ,
                { field: 'WorkFlowIdName', title: '流程名称', width: 45, align: 'left', sortable: true }
                ,
                { field: 'Remark', title: '备注', width: 45, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('550', '220', '../CostManageNew/CostProcessFlowSet.aspx?OpType=insert&TypeCode=' + $("#TypeCode").val(), '新增', true, function callback(_Data) {
                            if (_Data != "") {//**获得返回的参数信息
                                LoadList();
                            }
                        });
                    }
                }
                , '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            $.messager.alert("提示", "请选择需要修改的数据!");
                            return;
                        }
                        pageEdit(row["Id"].toString());

                    }
                }
                , '-',

                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            $.messager.alert("提示", "请选择删除数据");
                            return;
                        }
                        DelRecord(row["Id"].toString());
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        var TypeCode = $("#TypeCode").val();
                        switch (TypeCode) {
                            case "0802":
                                $('#SearchDlg1').parent().appendTo($("form:first"))
                                $('#SearchDlg1').dialog('open');
                                break;
                        }

                    }
                }
            ];

            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('CsCost', 'DelCostWorkFlow', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadList();

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }
            function LoadList() {
                $("#TypeCode").val("0802");
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsCost&Command=GetCostWorkFlow&' + $('#FrmFrom').serialize(),
                    method: "get",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc"

                });
                $("#SearchDlg1").dialog("close");
                $("#SearchDlg2").dialog("close");
                $("#SearchDlg3").dialog("close");
                $("#SearchDlg4").dialog("close");
                $("#SearchDlg5").dialog("close");
            }
            $(function () {
                InitTableHeight();
                colomsShow();
            });
        </script>
    </form>
</body>
</html>

