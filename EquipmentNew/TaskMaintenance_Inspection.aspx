<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskMaintenance_Inspection.aspx.cs" Inherits="M_Main.EquipmentNew.TaskMaintenance_Inspection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>巡检计划维护</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/EquimentDictionaryCanNull.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 100px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div id="layout" class="easyui-layout" data-options="fit:true">
            <div id="divTree" data-options="region:'west',border:true,width:300,title:'项目列表'">
                <ul id="treeOrgan" class="easyui-tree"></ul>
            </div>
            <div id="layout_center" data-options="region:'center',border:true,">
                <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                </div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1000px; height: 270px; overflow: hidden; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;" class="SearchTable">
                <tr>
                    <td class="TdTitle">任务来源</td>
                    <td class="TdContentSearch">
                        <select id="TaskSource" name="TaskSource" style="width: 128px; border: 1px #cccccc solid; height: 22px;" class="easyui-validatebox" runat="server">
                            <option value=""></option>
                            <option value="自动生成">自动生成</option>
                            <option value="手动生成">手动生成</option>
                            <option value="维护生成">维护生成</option>
                            <option value="临时任务">临时任务</option>
                        </select>
                    </td>
                    <td class="TdTitle">任务编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskNO" name="TaskNO" class="easyui-validatebox" runat="server" style="width: 125px;" />
                    </td>
                    <td class="TdTitle">责任岗位</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskRoleName" name="TaskRoleName" class="easyui-validatebox" runat="server" style="width: 125px;" />
                    </td>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskUserName" name="TaskUserName" class="easyui-validatebox" runat="server" style="width: 125px;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">任务开始时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskBeginTimeStart" name="TaskBeginTimeStart" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskBeginTimeEnd" name="TaskBeginTimeEnd" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">任务结束时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskEndTimeStart" name="TaskEndTimeStart" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskEndTimeEnd" name="TaskEndTimeEnd" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">执行开始时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ExecuteBeginTimeStart" name="ExecuteBeginTimeStart" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ExecuteBeginTimeEnd" name="ExecuteBeginTimeEnd" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">执行结束时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ExecuteEndTimeStart" name="ExecuteEndTimeStart" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ExecuteEndTimeEnd" name="ExecuteEndTimeEnd" runat="server" style="border: 1px solid #cccccc; width: 125px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">任务状态</td>
                    <td class="TdContentSearch">
                        <select id="TaskStatue" name="TaskStatue" style="width: 128px; border: 1px #cccccc solid; height: 22px;" class="easyui-validatebox" runat="server">
                            <option value=""></option>
                            <option value="0">未开始</option>
                            <option value="1">执行中</option>
                            <option value="2">已完成</option>
                        </select>
                    </td>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-validatebox" runat="server" style="width: 125px; height: 18px;" />
                    </td>
                    <td class="TdTitle">计划周期</td>
                    <td class="TdContentSearch">
                        <select id="FrequencyTitle" name="FrequencyTitle" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; width: 128px;">
                            <option value=""></option>
                            <option value="1次/1小时">1次/1小时</option>
                            <option value="1次/2小时">1次/2小时</option>
                            <option value="1次/3小时">1次/3小时</option>
                            <option value="1次/4小时">1次/4小时</option>
                            <option value="1次/6小时">1次/6小时</option>
                            <option value="1次/8小时">1次/8小时</option>
                            <option value="1次/12小时">1次/12小时</option>
                            <option value="1次/天">1次/天</option>
                            <option value="1次/周">1次/周</option>
                            <option value="2次/周">2次/周</option>
                            <option value="3次/周">3次/周</option>
                            <option value="1次/10天">1次/10天</option>
                            <option value="1次/15天">1次/15天</option>
                            <option value="1次/月">1次/月</option>
                            <option value="1次/2月">1次/2月</option>
                            <option value="1次/季">1次/季</option>
                            <option value="1次/半年">1次/半年</option>
                            <option value="1次/年">1次/年</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否过期</td>
                    <td class="TdContentSearch">
                        <select id="IsOverDue" name="IsOverDue" style="width: 128px; border: 1px #cccccc solid; height: 22px;" class="easyui-validatebox" runat="server">
                            <option value=""></option>
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否关闭</td>
                    <td class="TdContentSearch">
                        <select id="IsClose" name="IsClose" style="width: 128px; border: 1px #cccccc solid; height: 22px;" class="easyui-validatebox" runat="server">
                            <option value=""></option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">关闭原因</td>
                    <td class="TdContentSearch">
                        <select id="CloseReason" name="CloseReason" runat="server" isdctype="true"
                            dctype="关闭原因" style="width: 128px; border: 1px #cccccc solid; height: 22px;" class="easyui-validatebox">
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="8" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input id="CommId" type="hidden" name="CommId" runat="server" />
        <input id="CommName" type="hidden" name="CommName" runat="server" />
        <input id="LoginRoleCode" type="hidden" name="LoginRoleCode" runat="server" />
        <input id="LoginUserCode" type="hidden" name="LoginUserCode" runat="server" />
        <input type="hidden" id="IsFireControl" name="IsFireControl" />
        <script type="text/javascript">
            $(function () {
                $("#IsFireControl").val(GetQueryString('IsFireControl'));
                InitTableHeight();
                LoadOrganTree();
                LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function btnClear() {
                $("#TaskSource").val("");
                $("#TaskNO").val("");
                $("#TaskRoleName").val("");
                $("#TaskUserName").val("");
                $("#StartTaskBeginTime").val("");
                $("#EndTaskBeginTime").val("");
                $("#StartTaskEndTime").val("");
                $("#EndTaskEndTime").val("");
                $("#TaskBeginTimeStart").val("");
                $("#TaskBeginTimeEnd").val("");
                $("#TaskEndTimeStart").val("");
                $("#TaskEndTimeEnd").val("");
                $("#ExecuteBeginTimeStart").val("");
                $("#ExecuteBeginTimeEnd").val("");
                $("#ExecuteEndTimeStart").val("");
                $("#ExecuteEndTimeEnd").val("");
                $("#TaskStatue").val("");
                $("#PlanName").val("");
                $("#FrequencyTitle").val("");
                $("#IsClose").val("");
                $("#CloseReason").val("");
                $("#IsOverDue").val("");
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#layout").css("height", h + "px");
                $("#divTree").css("height", h + "px");
                $("#treeOrgan").css("height", h + "px");
                $("#layout_center").css("height", h + "px");
                $("#TableContainer").css("height", h - 2 + "px");
            }

            //机构
            function LoadOrganTree() {
                $("#treeOrgan").tree({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    treeField: 'text',
                    idField: 'id',
                    lines: true,
                    animate: true,
                    border: false,
                    loadMsg: '加载中,请稍侯...',
                    onLoadSuccess: function (node, data) {
                    },
                    onBeforeLoad: function (row, param) {
                        param.Method = "DataPost";
                        param.Class = "CsEquipment";
                        param.Command = "DepMenuList";
                        //控制用户权限
                        param.SelRoleCode = $("#LoginRoleCode").val();

                    },
                    onSelect: function (row) {
                        var isLeaf = $("#treeOrgan").tree('isLeaf', row.target);
                        if (isLeaf) {
                            $("#CommId").val(row.attributes.CommID);
                            $("#CommName").val(row.text);
                        } else {
                            $("#CommId").val('');
                            $("#CommName").val('');
                        }
                        LoadList();
                    }
                });
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'TaskNO', title: '任务编号', width: 150, align: 'left', sortable: true },
                { field: 'TaskSource', title: '任务来源', width: 120, align: 'left', sortable: true },
                { field: 'TaskRoleName', title: '责任岗位', width: 150, align: 'left', sortable: true },
                { field: 'TaskUserName', title: '责任人', width: 150, align: 'left', sortable: true },
                { field: 'PlanName', title: '计划名称', width: 200, align: 'left', sortable: true },
                { field: 'FrequencyTitle', title: '计划周期', width: 80, align: 'left', sortable: true },
                {
                    field: 'TaskBeginTime', title: '计划开始时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.TaskBeginTime, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                {
                    field: 'TaskEndTime', title: '计划结束时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.TaskEndTime, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                {
                    field: 'ExecuteBeginTime', title: '执行开始时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ExecuteBeginTime, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                {
                    field: 'ExecuteEndTime', title: '执行结束时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ExecuteEndTime, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'TaskStatueName', title: '计划状态', width: 80, align: 'left', sortable: true },
                { field: 'IsOverDueName', title: '是否过期', width: 80, align: 'left', sortable: true },
                { field: 'IsCloseName', title: '是否关闭', width: 80, align: 'left', sortable: true },
                { field: 'CloseUserName', title: '关闭人', width: 80, align: 'left', sortable: true },
                {
                    field: 'CloseTime', title: '关闭时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.CloseTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'CloseReasonName', title: '关闭原因', width: 100, align: 'left', sortable: true },
                { field: 'CloseRemark', title: '关闭说明', width: 250, align: 'left', sortable: true }
            ]];

            var toolbar = [{
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#CommId").val().length < 3) {
                        HDialog.Info("请选择需要生成的小区!");
                    }
                    else {
                        localStorage.setItem("EqCommId", $("#CommId").val());
                        localStorage.setItem("EqCommName", $("#CommName").val());
                        HDialog.Open('1100', '510', '../EquipmentNew/TemporaryPlanGeneration_Inspection.aspx?IsFireControl=' + $("#IsFireControl").val(), '任务维护', true, function callback(_Data) {
                            localStorage.removeItem('EqCommId');
                            localStorage.removeItem('EqCommName');
                            LoadList();
                        });
                    }
                }
            }, '-',
            {
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row != null && row != "" && row != undefined) {
                        if (row.TaskStatue == "2") {
                            HDialog.Info("计划已完成不能修改。");
                            return;
                        }
                        if (row.IsClose == "1") {
                            HDialog.Info("计划已关闭不能修改。");
                            return;
                        }
                        Edit(row.TaskId);
                    } else {
                        HDialog.Info("请选择修改的数据。");
                        return;
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getChecked");
                    var TaskId = "";
                    if (row != null && row != "" && row != undefined) {
                        if (row.length > 0) {
                            for (var i = 0; i < row.length; i++) {
                                if (row[i].AddUserId != $("#LoginUserCode").val()) {
                                    HDialog.Info("只能删除自己生成的任务！");
                                    return;
                                }
                                if (row[i].TaskSource != "维护生成") {
                                    HDialog.Info("只能删除维护生成的任务！");
                                    return;
                                }
                                if (row[i].TaskStatue == "2") {
                                    HDialog.Info("勾选计划中有已完成计划，不能删除。");
                                    return;
                                }
                                TaskId += "," + row[i].TaskId;
                            }
                            if (TaskId.length > 0)
                                TaskId = TaskId.substr(1, TaskId.length - 1);
                            DelRecord(TaskId);
                        }
                    } else {
                        HDialog.Info("请勾选删除数据。");
                        return;
                    }
                }
            }, '-',
            {
                text: '关闭',
                iconCls: 'icon-no',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getChecked");
                    var TaskId = "";
                    if (row != null && row != "" && row != undefined) {
                        if (row.length > 0) {
                            for (var i = 0; i < row.length; i++) {
                                if (row[i].TaskStatue == "2") {
                                    HDialog.Info("勾选计划中有已完成计划，不能关闭。");
                                    return;
                                }
                                if (row[i].IsClose == "1") {
                                    HDialog.Info("勾选计划中有已关闭计划，不能重复关闭。");
                                    return;
                                }
                                TaskId += "," + row[i].TaskId;
                            }
                            if (TaskId.length > 0)
                                TaskId = TaskId.substr(1, TaskId.length - 1);

                            Close(TaskId);
                        }
                    } else {
                        HDialog.Info("请勾选关闭数据。");
                        return;
                    }
                }
            }, '-',
            {
                text: '导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var rows = $('#TableContainer').datagrid("getRows");
                    if (rows.length == 0) {
                        HDialog.Info("没有需要导出的数据");
                        return;
                    }
                    window.open("TaskMaintenanceExcel_Inspection.aspx?random=" + Math.random() + $('#frmFrom').serialize());
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

            //修改
            function Edit(id) {
                HDialog.Open('720', '250', '../EquipmentNew/TaskMaintenanceEdit_Inspection.aspx?OpType=Edit&TaskId=' + id + '&CommId=' + $("#CommId").val(), '修改', true, function callback(_Data) {
                    LoadList();
                });
            }

            //删除
            function DelRecord(TaskId) {
                $.messager.confirm('确定', '是否确定删除！', function (r) {
                    if (r) {
                        $.tool.DataGet('CsEquipment', 'DelTaskMaintenance_Inspection', 'TaskId=' + TaskId + '&CommId=' + $("#CommId").val(),
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

            //关闭
            function Close(Id) {
                if (Id != null) {
                    localStorage.setItem("TaskId", Id);
                    HDialog.Open('720', '250', '../EquipmentNew/TaskMaintenanceClose_Inspection.aspx?CommId=' + $("#CommId").val(), '关闭', true, function callback(_Data) {
                        localStorage.removeItem('TaskId');
                        LoadList();
                    });
                }
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetPlanGenerationDetailsList_Inspection&' + $('#frmFrom').serialize(),
                    method: "get",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    columns: column,
                    fitColumns: false,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: false
                });
                $("#SearchDlg").dialog("close");
            }
        </script>
    </form>
</body>
</html>
