<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckTypeEdit.aspx.cs" Inherits="M_Main.Supervision.CheckTypeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查类型编辑</title>
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
    <script src="../jscript/uuid.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .dlg_table {
            margin-bottom: 53px;
        }

        .datagrid-toolbar tr td {
            padding: 0px;
        }

        .easyui-textbox {
            width: 30%;
        }

        .easyui-combobox {
            width: 30%;
        }

        .colspan {
            width: 78.5%;
        }

        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="dlg_table">
                <tr>
                    <td class="title">所属单位:</td>
                    <td class="text">
                        <input id="OrganCode" name="OrganCode" class="easyui-textbox" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelOrgan(); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                    <td class="title">检查级别:</td>
                    <td class="text">
                        <input id="LevelId" name="LevelId" class="easyui-combobox" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查性质:</td>
                    <td class="text">
                        <input id="Nature" name="Nature" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
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
                                {id: '1',text: '综合检查'},
                                {id: '2',text: '专项检查'},
                                {id: '3',text: '临时检查'}
                            ],
                            onChange: function() { SetTypeName(); }" />
                    </td>
                    <td class="title">是否自检:</td>
                    <td class="text">
                        <input id="IsSelfChecking" name="IsSelfChecking" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
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
                </tr>
                <tr>
                    <td class="title">检查类型:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="TypeName" name="TypeName" class="easyui-textbox colspan" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">标准设置岗位:</td>
                    <td class="text" colspan="3">
                        <input id="SetRoleCode" name="SetRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('SetRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">计划编制岗位:</td>
                    <td class="text" colspan="3">
                        <input id="PlanCompilationRoleCode" name="PlanCompilationRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('PlanCompilationRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">计划审核岗位:</td>
                    <td colspan="3">
                        <div style="width: 100%; height: 200px; background-color: #cccccc;" id="PlanExamineTableContainer"></div>
                    </td>
                </tr>
                <tr>
                    <td class="title">任务生成、编辑岗位:</td>
                    <td class="text" colspan="3">
                        <input id="GenerateRoleCode" name="GenerateRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('GenerateRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务删除、关闭岗位:</td>
                    <td class="text" colspan="3">
                        <input id="DeleteRoleCode" name="DeleteRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('DeleteRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务执行岗位:</td>
                    <td class="text" colspan="3">
                        <input id="ExecuteRoleCode" name="ExecuteRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('ExecuteRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务跟进岗位:</td>
                    <td class="text" colspan="3">
                        <input id="FollowUpRoleCode" name="FollowUpRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('FollowUpRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">报告编写岗位:</td>
                    <td class="text" colspan="3">
                        <input id="ReportWritingRoleCode" name="ReportWritingRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('ReportWritingRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">报告审核岗位:</td>
                    <td colspan="3">
                        <div style="width: 79.5%; height: 200px; background-color: #cccccc;" id="PresentationExamineTableContainer"></div>
                    </td>
                </tr>
                <tr>
                    <td class="title">问题整改岗位:</td>
                    <td class="text" colspan="3">
                        <input id="RectificationOfProblemsRoleCode" name="RectificationOfProblemsRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('RectificationOfProblemsRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">问题验收岗位:</td>
                    <td class="text" colspan="3">
                        <input id="ProblemAcceptanceRoleCode" name="ProblemAcceptanceRoleCode" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelSysRole('ProblemAcceptanceRoleCode'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">最低检查频次:</td>
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
                    <td class="title">检查是否评分:</td>
                    <td class="text">
                        <input id="IsScore" name="IsScore" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
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
                            ],
                            onChange: function() { IsScoreChange(); }" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查评分方式:</td>
                    <td class="text">
                        <input id="ScoreType" name="ScoreType" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
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
                                {id: '1',text: '按标准得失分'},
                                {id: '2',text: '按样本加扣分'}
                            ],
                            onChange: function() { ScoreTypeChange(); }" />
                    </td>
                    <td class="title">是否允许甩项:</td>
                    <td class="text">
                        <input id="IsDiscard" name="IsDiscard" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
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
                </tr>
                <tr>
                    <td class="title">备注:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="Remark" name="Remark" class="easyui-textbox colspan" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();" style="display:none" id="btnSave">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="OpType" name="OpType" />
        <script type="text/javascript">
            //选择所属单位
            function SelOrgan() {
                HDialog.Open('400', '350', '../Supervision/SelOrgan.aspx?IsCheck=0', "选择所属单位", false, function callback(_Data) {
                    if (_Data > '') {
                        var varObjects = _Data.split('◆');
                        $("#OrganCode").textbox('setValue', varObjects[0]);
                        $("#OrganCode").textbox('setText', varObjects[1]);
                    }
                });
            }

            //选择通用岗位
            //RoleName 控件Name
            function SelSysRole(RoleName) {
                localStorage.setItem("SelRoleCode", $("#" + RoleName).textbox('getValue'));
                localStorage.setItem("SelRoleName", $("#" + RoleName).textbox('getText'));
                HDialog.Open('500', '350', '../Supervision/SelSysRole.aspx?IsCheck=1', "选择通用岗位", false, function callback(_Data) {
                    localStorage.removeItem('SelRoleCode');
                    localStorage.removeItem('SelRoleName');
                    if (_Data > '') {
                        $("#" + RoleName).textbox('setValue', _Data.split('|')[0]);
                        $("#" + RoleName).textbox('setText', _Data.split('|')[1]);
                    }
                });
            }

            //“检查是否评分”为“是”时检查评分方式必填；
            function IsScoreChange() {
                var ScoreType = $("#ScoreType").combobox('getValue');
                if ($("#IsScore").combobox('getValue') == "1") {
                    $("#ScoreType").combobox({
                        required: true
                    });
                } else {
                    $("#ScoreType").combobox({
                        required: false
                    });
                }
                $("#ScoreType").combobox('setValue', ScoreType);
            }

            //“检查评分方式”为“按标准得失分”时"是否允许甩项"可修改为“是”；
            function ScoreTypeChange() {
                if ($("#ScoreType").combobox('getValue') == "1") {
                    $("#IsDiscard").combobox({
                        data: [
                            { id: '1', text: '是' },
                            { id: '0', text: '否' }
                        ]
                    });
                } else {
                    $("#IsDiscard").combobox({
                        data: [
                            { id: '0', text: '否' }
                        ]
                    });
                }
                $("#IsDiscard").combobox('setValue', 0);
            }

            function LoadLevelId() {
                $('#LevelId').combobox({
                    required: true,
                    panelHeight: '200',
                    validType: ['comboBoxValid[\'#LevelId\']'],
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
                        param.DType = '检查级别';
                    },
                    onLoadSuccess: function () {
                        Load();
                    },
                    onChange: function () {
                        SetTypeName();
                    }
                });
            }

            //"检查类型":自动生成；生成方式：所属单位+检查级别+检查性质；可修改；
            function SetTypeName() {
                if ($("#OrganCode").textbox('getText') > '' && $("#LevelId").combobox('getText') > '' && $("#Nature").combobox('getText') > '') {
                    var TypenName = $("#OrganCode").textbox('getText') + '-' + $("#LevelId").combobox('getText') + '-' + $("#Nature").combobox('getText');
                    $("#TypeName").textbox('setValue', TypenName);
                    $("#TypeName").textbox('setText', TypenName);
                }
            }

            var PlanExamineeditIndex = undefined;

            var PlanExaminecolumn = [[
                {
                    field: 'Sort', title: '审核序号', width: 10, align: 'left', sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            precision: 0, min: 1
                        }
                    }
                },
                {
                    field: 'RoleName', title: '审核岗位', width: 50, align: 'left', sortable: true, editor: {
                        type: 'textbox'
                    }
                },
                { field: 'RoleCode', title: '审核岗位', width: 50, align: 'left', sortable: true, hidden: true }
            ]];

            var PlanExaminetoolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        $("#PlanExamineTableContainer").datagrid('acceptChanges', PlanExamineeditIndex);
                        var rows = $("#PlanExamineTableContainer").datagrid("getRows");
                        var index = rows.length;
                        //更改当前行号
                        PlanExamineeditIndex = index;
                        $('#PlanExamineTableContainer').datagrid('appendRow', {
                            Sort: null,
                            RoleName: null,
                            RoleCode: null
                        });
                        //开始编辑
                        $("#PlanExamineTableContainer").datagrid('beginEdit', index);

                        PlanExaminebindJs(index);
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#PlanExamineTableContainer").datagrid("deleteRow", PlanExamineeditIndex);
                    }
                }
            ];

            var PresentationExamineeditIndex = undefined;

            var PresentationExaminecolumn = [[
                {
                    field: 'Sort', title: '审核序号', width: 10, align: 'left', sortable: true, editor: {
                        type: 'numberbox',
                        options: {
                            precision: 0, min: 1
                        }
                    }
                },
                {
                    field: 'RoleName', title: '审核岗位', width: 50, align: 'left', sortable: true, editor: {
                        type: 'textbox'
                    }
                },
                { field: 'RoleCode', title: '审核岗位', width: 50, align: 'left', sortable: true, hidden: true }
            ]];

            var PresentationExaminetoolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        $("#PresentationExamineTableContainer").datagrid('acceptChanges', PresentationExamineeditIndex);
                        var rows = $("#PresentationExamineTableContainer").datagrid("getRows");
                        var index = rows.length;
                        //更改当前行号
                        PresentationExamineeditIndex = index;
                        $('#PresentationExamineTableContainer').datagrid('appendRow', {
                            Sort: null,
                            RoleName: null,
                            RoleCode: null
                        });
                        //开始编辑
                        $("#PresentationExamineTableContainer").datagrid('beginEdit', index);

                        PresentationExaminebindJs(index);
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#PresentationExamineTableContainer").datagrid("deleteRow", PresentationExamineeditIndex);
                    }
                }
            ];

            function LoadList(CanEdit) {
                var PlanExaminetool = null;
                var PresentationExaminetool = null;
                if (CanEdit == '1') {
                    PlanExaminetool = PlanExaminetoolbar;
                    PresentationExaminetool = PresentationExaminetoolbar;
                }
                $("#PlanExamineTableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetPlanExamineList&CheckTypeId=' + $('#Id').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: PlanExaminecolumn,
                    fitColumns: true,
                    singleSelect: false,
                    border: false,
                    pagination: false,
                    width: "98%",
                    toolbar: PlanExaminetool,
                    sortOrder: "asc",
                    rownumbers: true,
                    remoteSort: false,
                    onClickRow: function (rowIndex, rowData) {
                        if (CanEdit == '1') {
                            $("#PlanExamineTableContainer").datagrid('acceptChanges', PlanExamineeditIndex);
                            //更改当前行号
                            PlanExamineeditIndex = rowIndex;
                            //开始编辑
                            $("#PlanExamineTableContainer").datagrid('beginEdit', rowIndex);

                            PlanExaminebindJs(rowIndex);
                        }
                    }
                });

                $("#PresentationExamineTableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetPresentationExamineList&CheckTypeId=' + $('#Id').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    columns: PresentationExaminecolumn,
                    fitColumns: true,
                    singleSelect: false,
                    border: false,
                    pagination: false,
                    width: "98%",
                    toolbar: PresentationExaminetool,
                    sortOrder: "asc",
                    rownumbers: true,
                    remoteSort: false,
                    onClickRow: function (rowIndex, rowData) {
                        if (CanEdit == '1') {
                            $("#PresentationExamineTableContainer").datagrid('acceptChanges', PresentationExamineeditIndex);
                            //更改当前行号
                            PresentationExamineeditIndex = rowIndex;
                            //开始编辑
                            $("#PresentationExamineTableContainer").datagrid('beginEdit', rowIndex);

                            PresentationExaminebindJs(rowIndex);
                        }
                    }
                });
            }

            function PlanExaminebindJs(rowIndex) {
                //绑定JS事件
                var ed = $('#PlanExamineTableContainer').datagrid('getEditors', rowIndex);
                $(ed[1].target).textbox('textbox').bind("click", function () {
                    HDialog.Open('500', '350', '../Supervision/SelSysRole.aspx?IsCheck=0', "选择通用岗位", false, function callback(_Data) {
                        if (_Data > '') {
                            $('#PlanExamineTableContainer').datagrid('updateRow',
                                {
                                    index: rowIndex,
                                    row: {
                                        Sort: ed[0].target.prevObject[0].value,
                                        RoleCode: _Data.split('|')[0],
                                        RoleName: _Data.split('|')[1]
                                    }
                                }
                            );
                        }
                    });
                });
            }

            function PresentationExaminebindJs(rowIndex) {
                //绑定JS事件
                var ed = $('#PresentationExamineTableContainer').datagrid('getEditors', rowIndex);
                $(ed[1].target).textbox('textbox').bind("click", function () {
                    HDialog.Open('500', '350', '../Supervision/SelSysRole.aspx?IsCheck=0', "选择通用岗位", false, function callback(_Data) {
                        if (_Data > '') {
                            $('#PresentationExamineTableContainer').datagrid('updateRow',
                                {
                                    index: rowIndex,
                                    row: {
                                        Sort: ed[0].target.prevObject[0].value,
                                        RoleCode: _Data.split('|')[0],
                                        RoleName: _Data.split('|')[1]
                                    }
                                }
                            );
                        }
                    });
                });
            }

            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });

            function Load() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CSSupervision', 'GetCheckTypeInfo', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $('#frmForm').form('load', obj[0]);
                            $("#OrganCode").textbox('setText', obj[0].OrganName);
                            $("#SetRoleCode").textbox('setText', obj[0].SetRoleName);
                            $("#PlanCompilationRoleCode").textbox('setText', obj[0].PlanCompilationRoleName);
                            $("#GenerateRoleCode").textbox('setText', obj[0].GenerateRoleName);
                            $("#DeleteRoleCode").textbox('setText', obj[0].DeleteRoleName);
                            $("#ExecuteRoleCode").textbox('setText', obj[0].ExecuteRoleName);
                            $("#FollowUpRoleCode").textbox('setText', obj[0].FollowUpRoleName);
                            $("#ReportWritingRoleCode").textbox('setText', obj[0].ReportWritingRoleName);
                            $("#RectificationOfProblemsRoleCode").textbox('setText', obj[0].RectificationOfProblemsRoleName);
                            $("#ProblemAcceptanceRoleCode").textbox('setText', obj[0].ProblemAcceptanceRoleName);
                            $.tool.DataGet('CSSupervision', 'CheckTypeCanEdit', 'Id=' + $("#Id").val(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == '1')
                                        $("#btnSave").show();
                                    LoadList(_Data);
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $("#btnSave").show();
                    LoadList('1');
                }
            }

            function Close() {
                HDialog.Close();
            }

            function Save() {
                $("#PlanExamineTableContainer").datagrid('acceptChanges', PlanExamineeditIndex);
                var rows = $("#PlanExamineTableContainer").datagrid("getRows");
                
                var PlanExamineJson = '';
                var havePlanExamine = '1';//是否存在计划审核岗位如果列表没值json返回假数据数据库不记录
                if (rows.length > 0) {
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].Sort == null || rows[i].Sort == undefined || rows[i].Sort == "" || rows[i].RoleCode == null || rows[i].RoleCode == undefined || rows[i].RoleCode == "") {
                            HDialog.Info("序号或审核岗位存在空值，无法保存！");
                            return;
                        }
                        PlanExamineJson += "{\"Sort\":\"" + rows[i].Sort + "\",\"RoleCode\":\"" + rows[i].RoleCode + "\"},";
                    }
                    PlanExamineJson = PlanExamineJson.substring(0, PlanExamineJson.length - 1);
                    PlanExamineJson = '[' + PlanExamineJson + ']';
                } else {
                    PlanExamineJson = '[{\"Sort\":\"1\",\"RoleCode\":\"1\"}]';
                    havePlanExamine = '0';
                }

                $("#PresentationExamineTableContainer").datagrid('acceptChanges', PresentationExamineeditIndex);
                var rows = $("#PresentationExamineTableContainer").datagrid("getRows");

                var PresentationExamineJson = '';
                var havePresentationExamine = '1';//是否存在报告审核岗位如果列表没值json返回假数据数据库不记录
                if (rows.length > 0) {
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].Sort == null || rows[i].Sort == undefined || rows[i].Sort == "" || rows[i].RoleCode == null || rows[i].RoleCode == undefined || rows[i].RoleCode == "") {
                            HDialog.Info("序号或审核岗位存在空值，无法保存！");
                            return;
                        }
                        PresentationExamineJson += "{\"Sort\":\"" + rows[i].Sort + "\",\"RoleCode\":\"" + rows[i].RoleCode + "\"},";
                    }
                    PresentationExamineJson = PresentationExamineJson.substring(0, PresentationExamineJson.length - 1);
                    PresentationExamineJson = '[' + PresentationExamineJson + ']';
                } else {
                    PresentationExamineJson = '[{\"Sort\":\"1\",\"RoleCode\":\"1\"}]';
                    var havePresentationExamine = '0';
                }

                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SaveCheckType', $('#frmForm').serialize() + '&Json1=' + PlanExamineJson + '&Json2=' + PresentationExamineJson + '&havePlanExamine=' + havePlanExamine + '&havePresentationExamine=' + havePresentationExamine,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                        }
                        else {
                            HDialog.Close();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#OpType").val(GetQueryString('OpType'));
                $("#Id").val(GetQueryString('Id'));
                LoadLevelId();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
