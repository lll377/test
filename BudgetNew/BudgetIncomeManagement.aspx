<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManagement.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算计划-收入管理</title>
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
    <script src="../jscript/Dialog.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 600px;
            height: auto;
        }

        .TdContent input, select {
            border: 1px #cccccc solid;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div class="easyui-tabs" style="width: 100%; height: 800px;">
            <input type="hidden" id="Status" name="Status" />
            <!--欠费回收计划-->
            <div title="欠费回收计划">
                <div id="TableContainer1"></div>
                <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
                    style="width: 630px; height: 160px; padding: 10px;">
                    <table class="SearchTable">
                        <tr>
                            <td class="TdTitle">项目名称</td>
                            <td class="TdContentSearch">
                                <input type="text" onclick="SelItem()" id="CommName" readonly style="border: 1px solid #cccccc; width: 150px;" runat="server" />
                                <input type="hidden" id="ItemCode" name="ItemCode" runat="server" />
                            </td>
                            <td class="TdTitle">预算年度</td>
                            <td class="TdContentSearch">
                                <input id="BudgetPlanYear" name="BudgetPlanYear" type="text"
                                    onclick="WdatePicker({ dateFmt: 'yyyy', skin: 'default' })" format="date" style="border: 1px solid #cccccc; width: 150px;" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                            </td>
                        </tr>
                    </table>
                </div>

                <script type="text/javascript">
                    function SelItem() {
                        HDialog.Open(1000, 500, '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                            if (_Data != "") {//**获得返回的参数信息
                                //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                //$("#ItemCode").val(varObjects.attributes.InPopedom);
                                //$("#CommName").val(varObjects.text);
                                var arrRet = JSON.parse(_Data);
                                $("#ItemCode").val(arrRet.id);
                                $("#CommName").val(arrRet.name);
                            }
                        });
                    }
                    function InitArrearsTableHeight() {
                        var h = $(window).height();
                        $("#TableContainer1").css("height", h - 30 + "px");
                    }
                    InitArrearsTableHeight();

                    var column = [[
                        { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                        { field: 'FeesStartYearMonth', title: '费用开始期间', width: 100, align: 'left', sortable: true },
                        { field: 'FeesEndYearMonth', title: '费用结束期间', width: 100, align: 'left', sortable: true },
                        { field: 'ChargeCutDate', title: '收费截止期间', width: 160, align: 'left', sortable: true },
                        { field: 'AddUserName', title: '创建人', width: 100, align: 'left', sortable: true },
                        { field: 'AddTime', title: '创建时间', width: 100, align: 'left', sortable: true },
                        { field: 'IsRelationBudget', title: '是否关联预算', width: 80, align: 'left', sortable: true },
                        { field: 'BudgetPlanYear', title: '关联预算年度', width: 80, align: 'left', sortable: true }
                    ]];

                    var toolbar = [
                        {
                            text: '生成欠费',
                            iconCls: 'icon-add',
                            handler: function () {
                                CreateArrears();
                            }
                        }, '-',
                        {
                            text: '编制计划',
                            iconCls: 'icon-edit',
                            handler: function () {
                                var row = $("#TableContainer1").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要编制的欠费回收计划!");
                                    return false;
                                } else {
                                    var h = $(window).height();
                                    var w = $(window).width();
                                    HDialog.Open(w, h, '../BudgetNew/BudgetIncomeManage_ArrearsDetail.aspx?ArrearsRecoveryPlanID=' + row.IID + "&CommID=" + row.CommID, "编制欠费明细", false, function callback(_Data) {
                                    });
                                }
                            }
                        }, '-',
                        {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var row = $("#TableContainer1").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要删除的欠费回收计划!");
                                    return false;
                                } else {
                                    HDialog.Prompt("确认删除选中的欠费回收计划?", function a() {
                                        $.tool.DataGet('Budget', 'IncomeManage_DelArrears', 'idList=' + row.IID,
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                if (_Data == "true") {
                                                    HDialog.Info("删除成功");
                                                    LoadList();
                                                } else {
                                                    HDialog.Info(_Data);
                                                }
                                            },
                                            function completeCallback() {
                                            },
                                            function errorCallback() {
                                            });
                                    })
                                }
                            }
                        }, '-',
                        {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"))
                                $('#SearchDlg').dialog('open');
                            }
                        }
                    ];

                    //生成欠费
                    function CreateArrears() {
                        var h = $(window).height();
                        var w = $(window).width();
                        HDialog.Open(800, 360, '../BudgetNew/BudgetIncomeManage_ArrearsCreate.aspx?ParentHeight=' + h + "&ParentWidth=" + w, "生成欠费", false, function callback(_Data) {
                            LoadList();
                        });
                    }

                    function LoadList() {
                        $("#TableContainer1").datagrid({
                            url: '/HM/M_Main/HC/DataPostControl.aspx',
                            method: "post",
                            nowrap: false,
                            pageSize: top.ListPageSize,
                            pageList: top.ListPageList,
                            columns: column,
                            fitColumns: true,
                            rownumbers: true,
                            singleSelect: true,
                            selectOnCheck: false,
                            checkOnSelect: false,
                            pagination: true,
                            border: false,
                            width: "100%",
                            toolbar: toolbar,
                            onBeforeLoad: function (param) {
                                param.Method = "DataPost";
                                param.Class = "Budget";
                                param.Command = "IncomeManage_GetArrearsList";
                                param.CommID = $("#ItemCode").val();
                                param.BudgetPlanYear = $("#BudgetPlanYear").val();
                            },
                            onLoadSuccess: function (data) {
                                $("#SearchDlg").dialog("close");
                            }
                        });

                    }
                    LoadList();

                </script>

            </div>
            <!--基础收入计划-->
            <div title="基础收入计划">
                <div id="SearchBasicPanel" class="easyui-dialog" title="筛选" data-options="iconCls:'icon-search',closed: true,modal:true"
                    style="width: 630px; height: 160px; padding: 10px;">
                    <table class="SearchTable">
                        <tr>
                            <td class="TdTitle">项目名称</td>
                            <td class="TdContentSearch">
                                <input type="text" id="BasicCommName" name="BasicCommName" onclick="SelBasicCommInfo();" readonly style="border: 1px solid #cccccc; width: 150px;" runat="server" />
                                <input id="BasicCommID" name="BasicCommID" type="hidden" runat="server" />
                            </td>
                            <td class="TdTitle">预算年度</td>
                            <td class="TdContentSearch">
                                <input id="BasicBudgetPlanYear" name="BasicBudgetPlanYear" type="text"
                                    onclick="WdatePicker({ dateFmt: 'yyyy', skin: 'default' })" format="date" style="border: 1px solid #cccccc; width: 150px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="SearchCloseqewq"
                                    onclick="BasicLoadList()">确定筛选</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="TableContainer2">
                </div>
                <script type="text/javascript">
                    function SelBasicCommInfo() {
                        HDialog.Open(1000, 500, '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                            if (_Data != "") {//**获得返回的参数信息
                                //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                //$("#BasicCommID").val(varObjects.attributes.InPopedom);
                                //$("#BasicCommName").val(varObjects.text);
                                var arrRet = JSON.parse(_Data);
                                $("#BasicCommID").val(arrRet.id);
                                $("#BasicCommName").val(arrRet.name);
                            }
                        });
                    }




                    function InitBasicTableHeight() {
                        var h = $(window).height();
                        $("#TableContainer2").css("height", h - 30 + "px");
                    }
                    InitBasicTableHeight();

                    var columnBasic = [[
                        { field: 'CommName', title: '项目名称', width: 250, align: 'left', sortable: true },
                        { field: 'BasicBudgetPlanYear', title: '预算年度', width: 140, align: 'left', sortable: true },
                        { field: 'ChargeRateType', title: '收费率类型', width: 140, align: 'left', sortable: true },
                        { field: 'AddUserName', title: '创建人', width: 140, align: 'left', sortable: true },
                        { field: 'AddTime', title: '创建时间', width: 140, align: 'left', sortable: true }
                    ]]

                    //基础收入计划
                    var toolbarBasic = [
                        {
                            text: '生成计划',
                            iconCls: 'icon-add',
                            handler: function () {
                                CreateBasicincomePlan();
                            }
                        }, '-', {
                            text: '编制计划',
                            iconCls: 'icon-edit',
                            handler: function () {
                                var row = $("#TableContainer2").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要编制的基础收入计划!");
                                    return false;
                                } else {
                                    var h = $(window).height();
                                    var w = $(window).width();
                                    HDialog.Open(w, h, '../BudgetNew/BudgetIncomeManage_BasicIncomeDetail.aspx?BasicIncomeID=' + row.ID + "&CommID=" + row.CommID, "编制基础收入计划明细", false, function callback(_Data) {
                                    });
                                }
                            }
                        }, '-', {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var row = $("#TableContainer2").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要删除的基础收入计划!");
                                    return false;
                                } else {
                                    HDialog.Prompt("确认删除选中的基础收入计划?", function a() {
                                        $.tool.DataGet('Budget', 'IncomeManage_DelBasicPlan', 'idList=' + row.ID,
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                if (_Data == "true") {
                                                    HDialog.Info("删除成功");
                                                    BasicLoadList();
                                                } else {
                                                    HDialog.Info(_Data);
                                                }
                                            },
                                            function completeCallback() {
                                            },
                                            function errorCallback() {
                                            });
                                    })
                                }
                            }
                        }, '-', {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchBasicPanel').parent().appendTo($("form:first"));
                                $('#SearchBasicPanel').dialog('open');
                            }
                        }];

                    //生成基础收入计划
                    function CreateBasicincomePlan() {
                        HDialog.Open(600, 200, '../BudgetNew/BudgetIncomeManage_BasicIncomePlanCreate.aspx', "生成基础收入计划", false, function callback(_Data) {
                            if (_Data != "") {
                                BasicLoadList();
                            }
                        });
                    }

                    //加载基础收入计划
                    function BasicLoadList() {
                        $("#TableContainer2").datagrid({
                            url: '/HM/M_Main/HC/DataPostControl.aspx',
                            method: "post",
                            nowrap: false,
                            pageSize: top.ListPageSize,
                            pageList: top.ListPageList,
                            columns: columnBasic,
                            fitColumns: true,
                            rownumbers: true,
                            singleSelect: true,
                            pagination: true,
                            border: false,
                            width: "100%",
                            toolbar: toolbarBasic,
                            onBeforeLoad: function (param) {
                                param.Method = "DataPost";
                                param.Class = "Budget";
                                param.Command = "IncomeManage_GetBasicList";
                                param.CommID = $("#BasicCommID").val();
                                param.BasicBudgetPlanYear = $("#BasicBudgetPlanYear").val();
                            },
                            onLoadSuccess: function (data) {
                                $("#SearchBasicPanel").dialog("close");
                            }
                        });
                    }
                    BasicLoadList();
                </script>
            </div>
            <!--交房收入计划-->
            <div title="交房收入计划">
                <table id="dgRoomIncome"></table>
                <div id="dialogRoomIncome" class="easyui-dialog" title="筛选" data-options="iconCls:'icon-search',closed: true,modal:true"
                    style="width: 630px; height: 160px; padding: 10px;">
                    <table class="SearchTable">
                        <tr>
                            <td class="TdTitle">项目名称</td>
                            <td class="TdContentSearch">
                                <input type="text" id="CommID_RoomIncomeName" name="CommID_RoomIncomeName" onclick="SelRoomIncomeCommID();" readonly style="border: 1px solid #cccccc; width: 150px;" runat="server" />
                                <input id="CommID_RoomIncome" name="CommID_RoomIncome" type="hidden" />
                            </td>
                            <td class="TdTitle">预算年度</td>
                            <td class="TdContentSearch">
                                <input id="Year_RoomIncome" name="Year_RoomIncome" type="text"
                                    onclick="WdatePicker({ dateFmt: 'yyyy', skin: 'default' })" format="date" style="border: 1px solid #cccccc; width: 150px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="DataGridRoomIncome()">确定筛选</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <script type="text/javascript">
                    function SelRoomIncomeCommID() {
                        HDialog.Open(1000, 500, '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                            if (_Data != "") {//**获得返回的参数信息
                                //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                //$("#CommID_RoomIncome").val(varObjects.attributes.InPopedom);
                                //$("#CommID_RoomIncomeName").val(varObjects.text);
                                var arrRet = JSON.parse(_Data);
                                $("#CommID_RoomIncome").val(arrRet.id);
                                $("#CommID_RoomIncomeName").val(arrRet.name);
                            }
                        });
                    }
                    var columnRoomIncome = [[
                        { field: 'CommName', title: '项目名称', width: 250, align: 'left', sortable: true },
                        { field: 'Year', title: '预算年度', width: 140, align: 'left', sortable: true },
                        { field: 'AddUserName', title: '创建人', width: 140, align: 'left', sortable: true },
                        { field: 'AddTime', title: '创建时间', width: 140, align: 'left', sortable: true }
                    ]]

                    //交房收入计划
                    var toolbarRoomIncome = [
                        {
                            text: '创建交房规则',
                            iconCls: 'icon-add',
                            handler: function () {
                                EditRoomIncome("Add", "");
                            }
                        }, '-', {
                            text: '编制交房规则',
                            iconCls: 'icon-edit',
                            handler: function () {
                                var row = $("#dgRoomIncome").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要编制的交房收入计划!");
                                    return false;
                                } else {
                                    EditRoomIncome("Edit", row.ID);
                                }
                            }
                        }, '-', {
                            text: '删除交房规则',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var row = $("#dgRoomIncome").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要删除的基础收入计划!");
                                    return false;
                                } else {
                                    HDialog.Prompt("确认删除选中的基础收入计划?", function a() {
                                        $.tool.DataGet('Budget', 'DelRoomIncome', 'idList=' + row.ID,
                                            function Init() {
                                            },
                                            function callback(data) {
                                                data = $.parseJSON(data);
                                                if (data.result) {
                                                    HDialog.Info("删除成功");
                                                    DataGridRoomIncome();
                                                } else {
                                                    HDialog.Info(data.msg);
                                                }
                                            },
                                            function completeCallback() {
                                            },
                                            function errorCallback() {
                                            });
                                    })
                                }
                            }
                        }, '-', {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#dialogRoomIncome').dialog('open');
                            }
                        }, '-', {
                            text: '查看交房明细',
                            iconCls: 'icon-inventory',
                            handler: function () {
                                var row = $("#dgRoomIncome").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要编制交房明细!");
                                } else {
                                    EditRoomIncomeDetailed(row.ID);
                                }
                            }
                        }];

                    function EditRoomIncome(OptType, ID) {
                        HDialog.OpenWin(1000, 600, '../BudgetNew/BudgetRoomIncomeEdit.aspx?OptType=' + OptType + '&ID=' + ID, "编制交房收入规则", false, function callback(_Data) {
                            DataGridRoomIncome();
                        });
                    }
                    function EditRoomIncomeDetailed(ID) {
                        HDialog.Open(1200, 600, '../BudgetNew/BudgetRoomIncomeDetailed.aspx?&ID=' + ID, "交房收入计划明细", false, function callback(_Data) {
                            DataGridRoomIncome();
                        });
                    }


                    function DataGridRoomIncome() {
                        $("#dgRoomIncome").datagrid({
                            url: '/HM/M_Main/HC/DataPostControl.aspx',
                            method: "post",
                            nowrap: false,
                            fit: true,
                            pageSize: top.ListPageSize,
                            pageList: top.ListPageList,
                            columns: columnRoomIncome,
                            fitColumns: true,
                            rownumbers: true,
                            singleSelect: true,
                            pagination: true,
                            border: false,
                            width: "100%",
                            toolbar: toolbarRoomIncome,
                            onBeforeLoad: function (param) {
                                param.Method = "DataPost";
                                param.Class = "Budget";
                                param.Command = "GetListRoomIncome";
                                param.CommID_RoomIncome = $("#CommID_RoomIncome").val();
                                param.Year_RoomIncome = $("#Year_RoomIncome").val();
                            },
                            onLoadSuccess: function (data) {
                                $("#dialogRoomIncome").dialog("close");
                            }
                        });
                    }
                    $(function () { DataGridRoomIncome() });
                </script>
            </div>
            <!--其它收入计划-->
            <div title="其它收入计划">
                <!--筛选-->
                <div id="SearchOtherPane" class="easyui-dialog" title="筛选" data-options="iconCls:'icon-search',closed: true,modal:true"
                    style="width: 600px; height: 160px; overflow: hidden;">
                    <table class="SearchTable">
                        <tr>
                            <td class="TdTitle">项目名称</td>
                            <td class="TdContentSearch">
                                <input type="text" id="OtherCommName" name="OtherCommName" onclick="SelOtherCommInfo();" readonly style="border: 1px solid #cccccc; width: 150px;" runat="server" />
                                <input id="OtherCommID" name="OtherCommID" type="hidden" runat="server" />
                            </td>
                            <td class="TdTitle">预算年度</td>
                            <td class="TdContentSearch">
                                <input id="OtherBudgetPlanYear" name="OtherBudgetPlanYear" type="text"
                                    onclick="WdatePicker({ dateFmt: 'yyyy', skin: 'default' })" format="date" style="border: 1px solid #cccccc; width: 150px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="SearchOther" onclick="OtherLoadList()">确定筛选</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--table表格-->
                <div id="TableContainer3"></div>
                <script type="text/javascript">
                    function SelOtherCommInfo() {
                        HDialog.Open(1000, 500, '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                            if (_Data != "") {//**获得返回的参数信息
                                //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                //$("#OtherCommID").val(varObjects.attributes.InPopedom);
                                //$("#OtherCommName").val(varObjects.text);
                                var arrRet = JSON.parse(_Data);
                                $("#OtherCommID").val(arrRet.id);
                                $("#OtherCommName").val(arrRet.name);
                            }
                        });
                    }

                    function InitOtherTableHeight() {
                        var h = $(window).height();
                        $("#TableContainer3").css("height", h - 30 + "px");
                    }
                    InitOtherTableHeight();

                    var columnOther = [[
                        { field: 'CommName', title: '项目名称', width: 250, align: 'left', sortable: true },
                        { field: 'OtherBudgetPlanYear', title: '预算年度', width: 140, align: 'left', sortable: true },
                        { field: 'AddUserName', title: '创建人', width: 140, align: 'left', sortable: true },
                        { field: 'AddTime', title: '创建时间', width: 140, align: 'left', sortable: true }
                    ]];
                    //基础收入计划
                    var toolbarOther = [
                        {
                            text: '生成计划',
                            iconCls: 'icon-add',
                            handler: function () {
                                HDialog.Open(600, 200, '../BudgetNew/BudgetIncomeManage_OtherIncomePlanCreate.aspx', "生成其他收入计划", false, function callback(_Data) {
                                    if (_Data != "") {
                                        OtherLoadList();
                                    }
                                });
                            }
                        }, '-', {
                            text: '编制计划',
                            iconCls: 'icon-edit',
                            handler: function () {
                                var row = $("#TableContainer3").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要编制的其他收入计划!");
                                    return false;
                                } else {
                                    var h = $(window).height();
                                    var w = $(window).width();
                                    HDialog.Open(w, h, '../BudgetNew/BudgetIncomeManage_OtherIncomeDetail.aspx?OtherIncomeID=' + row.ID + "&CommID=" + row.CommID, "编制其他收入计划明细", false, function callback(_data) {
                                    });
                                }
                            }
                        }, '-', {
                            text: '删除',
                            iconCls: 'icon-cancel',
                            handler: function () {
                                var row = $("#TableContainer3").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需要删除的基础收入计划!");
                                    return false;
                                } else {
                                    HDialog.Prompt("确认删除选中的基础收入计划?", function a() {
                                        $.tool.DataGet('Budget', 'IncomeManage_DelOtherPlan', 'idList=' + row.ID,
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                if (_Data == "true") {
                                                    HDialog.Info("删除成功");
                                                    OtherLoadList();
                                                } else {
                                                    HDialog.Info(_Data);
                                                }
                                            },
                                            function completeCallback() {
                                            },
                                            function errorCallback() {
                                            });
                                    })
                                }
                            }
                        }, '-', {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchOtherPane').parent().appendTo($("form:first"));
                                $('#SearchOtherPane').dialog('open');
                            }
                        }];


                    function OtherLoadList() {
                        $("#TableContainer3").datagrid({
                            url: '/HM/M_Main/HC/DataPostControl.aspx',
                            method: "post",
                            nowrap: false,
                            pageSize: top.ListPageSize,
                            pageList: top.ListPageList,
                            columns: columnOther,
                            fitColumns: true,
                            rownumbers: true,
                            singleSelect: true,
                            pagination: true,
                            border: false,
                            width: "100%",
                            toolbar: toolbarOther,
                            onBeforeLoad: function (param) {
                                param.Method = "DataPost";
                                param.Class = "Budget";
                                param.Command = "IncomeManage_GetOtherPlanList";
                                param.CommID = $("#OtherCommID").val();
                                param.OtherBudgetPlanYear = $("#OtherBudgetPlanYear").val();
                            },
                            onLoadSuccess: function (data) {
                                $("#SearchOtherPane").dialog("close");
                            }
                        });
                    }
                    OtherLoadList();
                </script>
            </div>
            <!--汇总收入计划-->
            <div title="汇总收入计划">
                <div id="SearchTotalPane" class="easyui-dialog" title="筛选" data-options="iconCls:'icon-search',closed: true,modal:true"
                    style="width: 600px; height: 160px; overflow: hidden;">
                    <table class="SearchTable">
                        <tr>
                            <td class="TdTitle">项目名称</td>
                            <td class="TdContentSearch">
                                <input type="text" id="TotalCommName" name="TotalCommName" onclick="SelTotalCommInfo();" readonly style="border: 1px solid #cccccc; width: 150px;" runat="server" />
                                <input id="TotalCommID" name="TotalCommID" type="hidden" runat="server" />
                            </td>
                            <td class="TdTitle">预算年度</td>
                            <td class="TdContentSearch">
                                <input id="TotalBudgetPlanYear" name="TotalBudgetPlanYear" type="text"
                                    onclick="WdatePicker({ dateFmt: 'yyyy', skin: 'default' })" format="date" style="border: 1px solid #cccccc; width: 150px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="SearchTotal" onclick="TotalLoadList()">确定筛选</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--table表格-->
                <div id="TableContainer4">
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">

        function InitTotalTableHeight() {
            var h = $(window).height();
            $("#TableContainer4").css("height", h - 30 + "px");
        }
        InitTotalTableHeight();

        function SelTotalCommInfo() {
            HDialog.Open(1000, 500, '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    //$("#TotalCommID").val(varObjects.attributes.InPopedom);
                    //$("#TotalCommName").val(varObjects.text);
                    var arrRet = JSON.parse(_Data);
                    $("#TotalCommID").val(arrRet.id);
                    $("#TotalCommName").val(arrRet.name);
                }
            });
        }
        var totalColumn = [[
            { field: 'CommName', title: '项目名称', width: 250, align: 'left', sortable: true },
            { field: 'TotalBudgetPlanYear', title: '预算年度', width: 140, align: 'left', sortable: true },
            { field: 'AddUserName', title: '创建人', width: 140, align: 'left', sortable: true },
            { field: 'AddTime', title: '创建时间', width: 140, align: 'left', sortable: true }
        ]]

        //汇总收入计划
        var TotalToolbar = [
            {
                text: '生成计划',
                iconCls: 'icon-add',
                handler: function () {
                    HDialog.Open(600, 200, '../BudgetNew/BudgetIncomeManage_TotalIncomePlanCreate.aspx', "生成汇总收入计划", false, function callback(_Data) {
                        if (_Data != "") {
                            TotalLoadList();
                        }
                    });
                }
            }, '-', {
                text: '编制计划',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer4").datagrid("getSelected");
                    if (row == null) {
                        hdialog.info("请选择需要编制的汇总收入计划!");
                        return false;
                    } else {
                        var h = $(window).height();
                        var w = $(window).width();
                        HDialog.Open(w, h, '../BudgetNew/BudgetIncomeManage_TotalIncomeDetail.aspx?TotalIncomeID=' + row.ID + "&CommID=" + row.CommID, "编制汇总收入计划明细", false, function callback(_data) {
                        });
                    }
                }
            }, '-', {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer4").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info("请选择需要删除的汇总收入计划!");
                        return false;
                    } else {
                        HDialog.Prompt("确认删除选中的汇总收入计划?", function a() {
                            $.tool.DataGet('Budget', 'IncomeManage_DelTotalPlan', 'idList=' + row.ID,
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info("删除成功");
                                        TotalLoadList();
                                    } else {
                                        HDialog.Info(_Data);
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        })
                    }
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchTotalPane').parent().appendTo($("form:first"));
                    $('#SearchTotalPane').dialog('open');
                }
            }];


        function TotalLoadList() {
            $("#TableContainer4").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: totalColumn,
                fitColumns: true,
                rownumbers: true,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                pagination: true,
                border: false,
                width: "100%",
                toolbar: TotalToolbar,
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "Budget";
                    param.Command = "IncomeManage_GetTotalPlanList";
                    param.CommID = $("#TotalCommID").val();
                    param.TotalBudgetPlanYear = $("#TotalBudgetPlanYear").val();
                },
                onLoadSuccess: function (data) {
                    $("#SearchTotalPane").dialog("close");
                }
            });
        }
        TotalLoadList();
    </script>
</body>
</html>
