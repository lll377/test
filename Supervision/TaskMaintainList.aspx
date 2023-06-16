<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskMaintainList.aspx.cs" Inherits="M_Main.Supervision.TaskMaintainList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>任务维护</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <form id="frmForm" runat="server">
        <div style="width: 100%">
            <div style="float: left; width: 20%; border-right: 1px solid #cccccc;" class="menuDiv">
                <div style="background-color: #cccccc;" id="TreeGrid"></div>
            </div>
            <div style="float: left; width: 80%">
                <div style="background-color: #cccccc;" id="TableContainer"></div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 1000px; height: 385px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">检查类型:</td>
                    <td class="text">
                        <input id="CheckTypeId" name="CheckTypeId" class="easyui-combobox" />
                    </td>
                    <td class="title">计划名称:</td>
                    <td class="text">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title">检查频次:</td>
                    <td class="text">
                        <input id="Frequency" name="Frequency" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'200',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1次/半小时',text: '1次/半小时'},
                                {id: '1次/1小时',text: '1次/1小时'},
                                {id: '1次/2小时',text: '1次/2小时'},
                                {id: '1次/3小时',text: '1次/3小时'},
                                {id: '1次/4小时',text: '1次/4小时'},
                                {id: '1次/6小时',text: '1次/6小时'},
                                {id: '1次/8小时',text: '1次/8小时'},
                                {id: '1次/12小时',text: '1次/12小时'},
                                {id: '1次/天',text: '1次/天'},
                                {id: '1次/周',text: '1次/周'},
                                {id: '2次/周',text: '2次/周'},
                                {id: '3次/周',text: '3次/周'},
                                {id: '1次/10天',text: '1次/10天'},
                                {id: '1次/15天',text: '1次/15天'},
                                {id: '1次/月',text: '1次/月'},
                                {id: '1次/2月',text: '1次/2月'},
                                {id: '1次/季',text: '1次/季'},
                                {id: '1次/半年',text: '1次/半年'},
                                {id: '1次/年',text: '1次/年'}
                            ]" />
                    </td>
                    <td class="title">任务编码:</td>
                    <td class="text">
                        <input type="text" id="TaskNo" name="TaskNo" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务开始时间:</td>
                    <td class="text">
                        <input type="text" id="TaskBeginTimeBg" name="TaskBeginTimeBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="TaskBeginTimeEnd" name="TaskBeginTimeEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">任务结束时间:</td>
                    <td class="text">
                        <input type="text" id="TaskEndTimeBg" name="TaskEndTimeBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="TaskEndTimeEnd" name="TaskEndTimeEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">实际开始时间:</td>
                    <td class="text">
                        <input type="text" id="DidBeginTimeBg" name="DidBeginTimeBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="DidBeginTimeEnd" name="DidBeginTimeEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">实际结束时间:</td>
                    <td class="text">
                        <input type="text" id="DidEndTimeBg" name="DidEndTimeBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="DidEndTimeEnd" name="DidEndTimeEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务来源:</td>
                    <td class="text">
                        <input id="TaskSource" name="TaskSource" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '自动生成',text: '自动生成'},
                                {id: '手动生成',text: '手动生成'},
                                {id: '维护生成',text: '维护生成'}
                            ]" />
                    </td>
                    <td class="title">是否评分</td>
                    <td class="text">
                        <input id="IsScore" name="IsScore" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ]" />
                    </td>
                    <td class="title">综合评分:</td>
                    <td class="text">
                        <input type="text" id="CompositeScoreBg" name="CompositeScoreBg" class="easyui-numberbox" data-options="required: false, precision: 2" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="CompositeScoreEnd" name="CompositeScoreEnd" class="easyui-numberbox" data-options="required: false, precision: 2" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务状态:</td>
                    <td class="text">
                        <input id="TaskState" name="TaskState" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '0',text: '未开始'},
                                {id: '1',text: '执行中'},
                                {id: '2',text: '已完成'}
                            ]" />
                    </td>
                    <td class="title">是否过期</td>
                    <td class="text">
                        <input id="IsOverDue" name="IsOverDue" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ]" />
                    </td>
                    <td class="title">是否关闭:</td>
                    <td class="text">
                        <input id="IsClose" name="IsClose" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ]" />
                    </td>
                    <td class="title">关闭人</td>
                    <td class="text">
                        <input type="text" id="CloseUserName" name="CloseUserName" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">关闭时间:</td>
                    <td class="text">
                        <input type="text" id="CloseDateBg" name="CloseDateBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="CloseDateEnd" name="CloseDateEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">关闭原因:</td>
                    <td class="text">
                        <input id="CloseReason" name="CloseReason" class="easyui-combobox" />
                    </td>
                    <td class="title">关闭说明:</td>
                    <td class="text">
                        <input type="text" id="CloseRemark" name="CloseRemark" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">是否提交审核:</td>
                    <td class="text">
                        <input id="IsSubmitExamine" name="IsSubmitExamine" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ]" />
                    </td>
                    <td class="title">审核状态</td>
                    <td class="text">
                        <input id="ExamineState" name="ExamineState" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '0',text: '未送审'},
                                {id: '1',text: '审核中'},
                                {id: '2',text: '已审核'}
                            ]" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="TaskProduceId" name="TaskProduceId" value="" />
        <input type="hidden" id="TPCId" name="TPCId" value="" />
        <input type="hidden" id="CommId" name="CommId" value="" />
        <input type="hidden" id="IsAccepted" name="IsAccepted" value="" />
        <script type="text/javascript">
            function Clear() {
                var CommId = $("#CommId").val();
                $('#frmForm').form('clear');
                $("#CommId").val(CommId);
            }

            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TreeGrid").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }

            //加载检查类型
            function LoadCheckTypeId() {
                $('#CheckTypeId').combobox({
                    required: false,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CheckTypeId\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'TypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindCheckType';
                    }
                });
            }

            //加载关闭原因
            function LoadCloseReason() {
                $('#CloseReason').combobox({
                    required: false,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CloseReason\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'Name',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'GetDictionaryByDType';
                        param.DType = '关闭原因';
                    }
                });
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'OrganName', title: '所属单位', width: 200, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true },
                { field: 'CheckTypeName', title: '检查类型', width: 200, align: 'left', sortable: true },
                { field: 'PlanName', title: '计划名称', width: 200, align: 'left', sortable: true },
                { field: 'Frequency', title: '检查频次', width: 100, align: 'left', sortable: true },
                { field: 'TaskNo', title: '任务编号', width: 130, align: 'left', sortable: true },
                { field: 'TaskSource', title: '任务来源', width: 80, align: 'left', sortable: true },
                { field: 'TaskBeginTime', title: '计划开始时间', width: 150, align: 'left', sortable: true },
                { field: 'TaskEndTime', title: '计划结束时间', width: 150, align: 'left', sortable: true },
                { field: 'DidBeginTime', title: '实际开始时间', width: 150, align: 'left', sortable: true },
                { field: 'DidEndTime', title: '实际结束时间', width: 150, align: 'left', sortable: true },
                { field: 'IsScoreName', title: '是否评分', width: 80, align: 'left', sortable: true },
                { field: 'CompositeScore', title: '综合得分', width: 80, align: 'left', sortable: true },
                { field: 'TaskStateName', title: '任务状态', width: 80, align: 'left', sortable: true },
                { field: 'IsOverDue', title: '是否过期', width: 80, align: 'left', sortable: true },
                { field: 'IsCloseName', title: '是否关闭', width: 80, align: 'left', sortable: true },
                { field: 'CloseUserName', title: '关闭人', width: 120, align: 'left', sortable: true },
                { field: 'CloseDate', title: '关闭时间', width: 150, align: 'left', sortable: true },
                { field: 'CloseReasonName', title: '关闭原因', width: 200, align: 'left', sortable: true },
                { field: 'CloseRemark', title: '关闭说明', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.OpenWinNoClose('800', '600', '../Supervision/TempTaskGenerationAdd.aspx', '维保任务生成', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
                , '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row.length == 0) {
                            HDialog.Info("请勾选修改数据");
                            return;
                        }
                        var TaskId = "";
                        var CheckTypeId = "";
                        for (var i = 0; i < row.length; i++) {
                            if (row[i].TaskState == '2') {
                                HDialog.Info("勾选数据存在已完成数据，无法修改！");
                                return;
                            }
                            TaskId += "," + row[i].TaskId;
                            CheckTypeId += "," + row[i].CheckTypeId;
                        }
                        TaskId = TaskId.substr(1, TaskId.length - 1);
                        CheckTypeId = CheckTypeId.substr(1, CheckTypeId.length - 1);

                        $.tool.DataPost('CSSupervision', 'CheckTaskCanEdit', 'CheckTypeId=' + CheckTypeId,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info('选中数据中包含没有任务生成、编辑权限的数据，无法修改');
                                    return;
                                }
                                EditRecord(TaskId);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row.length == 0) {
                            HDialog.Info("请勾选删除数据");
                            return;
                        }
                        var TaskProduceId = "";
                        var TPCId = "";
                        var TaskId = "";
                        var CheckTypeId = "";
                        for (var i = 0; i < row.length; i++) {
                            if (row[i].DidBeginTime > '') {
                                HDialog.Info("勾选数据存在执行中或已完成数据，无法删除！");
                                return;
                            }
                            TaskProduceId += "," + row[i].TaskProduceId;
                            TPCId += "," + row[i].TPCId;
                            TaskId += "," + row[i].TaskId;
                            CheckTypeId += "," + row[i].CheckTypeId;
                        }
                        TaskProduceId = TaskProduceId.substr(1, TaskProduceId.length - 1);
                        TPCId = TPCId.substr(1, TPCId.length - 1);
                        TaskId = TaskId.substr(1, TaskId.length - 1);
                        CheckTypeId = CheckTypeId.substr(1, CheckTypeId.length - 1);

                        $.tool.DataPost('CSSupervision', 'CheckTaskCanDelOrClose', 'CheckTypeId=' + CheckTypeId,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info('选中数据中包含没有任务删除、关闭权限的数据，无法删除');
                                    return;
                                }
                                DelRecord(TaskId, TaskProduceId, TPCId);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '关闭',
                    iconCls: 'icon-no',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row.length == 0) {
                            HDialog.Info("请勾选关闭数据");
                            return;
                        }
                        var TaskId = "";
                        var CheckTypeId = "";
                        for (var i = 0; i < row.length; i++) {
                            if (row[i].TaskState == '2') {
                                HDialog.Info("勾选数据存在已完成数据，无法关闭！");
                                return;
                            }
                            TaskId += "," + row[i].TaskId;
                            CheckTypeId += "," + row[i].CheckTypeId;
                        }
                        TaskId = TaskId.substr(1, TaskId.length - 1);
                        CheckTypeId = CheckTypeId.substr(1, CheckTypeId.length - 1);

                        $.tool.DataPost('CSSupervision', 'CheckTaskCanDelOrClose', 'CheckTypeId=' + CheckTypeId,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info('选中数据中包含没有任务删除、关闭权限的数据，无法关闭');
                                    return;
                                }
                                CloseRecord(TaskId);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
                , '-',
                {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        Export();
                    }
                }
            ];

            function EditRecord(TaskId) {
                localStorage.setItem("TaskIds", TaskId);
                HDialog.Open('800', '500', '../Supervision/TaskMaintainUpdate.aspx?CommId=' + $("#CommId").val(), '修改任务', true, function callback(_Data) {
                    localStorage.removeItem('TaskIds');
                    LoadList();
                });
            }

            function DelRecord(TaskId, TaskProduceId, TPCId) {
                HDialog.Prompt('是否删除选中的数据!', function () {
                    $.tool.DataPost('CSSupervision', 'DelTask', 'TaskIds=' + TaskId + '&TaskProduceId=' + TaskProduceId + '&TPCId=' + TPCId + '&CommId=' + $("#CommId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function CloseRecord(TaskId) {
                localStorage.setItem("TaskIds", TaskId);
                HDialog.Open('800', '370', '../Supervision/TaskMaintainClose.aspx?CommId=' + $("#CommId").val(), '关闭任务', true, function callback(_Data) {
                    localStorage.removeItem('TaskIds');
                    LoadList();
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    columns: column,
                    fitColumns: false,
                    singleSelect: false,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
                $("#SearchDlg").dialog("close");
            }

            function LoadTree() {
                $("#TreeGrid").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=DepMenuList&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    columns: [[{ title: '项目名称', field: 'text', width: 400 }]],
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: null,
                    border: false,
                    sortOrder: "asc",
                    onClickRow: function (rowData) {
                        if (rowData.children == undefined) {
                            $("#CommId").val(rowData.attributes.CommID);
                        } else {
                            $("#CommId").val('999999');
                        }
                        LoadList();
                    }
                });
            }

            $(function () {
                InitTableHeight();
                LoadCheckTypeId();
                LoadCloseReason();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                LoadTree();
                LoadList();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            //导出Excel
            function Export() {
                var rows = $('#TableContainer').datagrid("getRows");
                if (rows.length == 0) {
                    HDialog.Info("无数据需要导出");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'TaskList', $('#frmForm').serialize() + '&page=1&rows=999999999',
                    function Init() {
                    },
                    function callback(_Data) {
                        var tableString = '<table cellspacing="0" class="pb">';

                        // 载入title
                        tableString += '\n<tr>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">所属单位</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">项目名称</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查类型</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">计划名称</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查频次</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">任务编号</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">任务来源</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">计划开始时间</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">计划结束时间</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">实际开始时间</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">实际结束时间</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">是否评分</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">综合得分</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">任务状态</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">是否过期</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">是否关闭</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">关闭人</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">关闭时间</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">关闭原因</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">关闭说明</th>';
                        tableString += '\n</tr>';
                        // 载入内容
                        var rows = eval("(" + _Data.replace(/\\/g, "/") + ")").rows; //转换为json对象
                        for (var i = 0; i < rows.length; i++) {
                            tableString += '\n<tr>';
                            tableString += '\n<td>' + rows[i]["OrganName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CommName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CheckTypeName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["PlanName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["Frequency"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskNo"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskSource"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskBeginTime"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskEndTime"] + '</td>';
                            tableString += '\n<td>' + rows[i]["DidBeginTime"] + '</td>';
                            tableString += '\n<td>' + rows[i]["DidEndTime"] + '</td>';
                            tableString += '\n<td>' + rows[i]["IsScoreName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CompositeScore"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskStateName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["IsOverDue"] + '</td>';
                            tableString += '\n<td>' + rows[i]["IsCloseName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CloseUserName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CloseDate"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CloseReasonName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CloseRemark"] + '</td>';
                            tableString += '\n</tr>';
                        }

                        //导出
                        var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                        var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                        var l = $('<input type="hidden" id="txtName" name="txtName" />');
                        i.val(tableString);
                        i.appendTo(f);
                        var date = new Date();
                        l.val('检查任务维护-' + dateFormat("YYYY-mm-dd", date));
                        l.appendTo(f);
                        f.appendTo(document.body).submit();
                        $('#SearchDlg').dialog('close');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function dateFormat(fmt, date) {
                let ret;
                let opt = {
                    "Y+": date.getFullYear().toString(),        // 年
                    "m+": (date.getMonth() + 1).toString(),     // 月
                    "d+": date.getDate().toString(),            // 日
                    "H+": date.getHours().toString(),           // 时
                    "M+": date.getMinutes().toString(),         // 分
                    "S+": date.getSeconds().toString()          // 秒
                    // 有其他格式化字符需求可以继续添加，必须转化成字符串
                };
                for (let k in opt) {
                    ret = new RegExp("(" + k + ")").exec(fmt);
                    if (ret) {
                        fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
                    };
                };
                return fmt;
            }
        </script>
    </form>
</body>
</html>
