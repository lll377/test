<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskDeductionList.aspx.cs" Inherits="M_Main.Supervision.TaskDeductionList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>加扣分项列表</title>
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
<body>
    <form id="frmForm" runat="server">
        <div style="background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 510px; height: 180px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">检查地点:</td>
                    <td class="text">
                        <input type="text" id="CheckPlace" name="CheckPlace" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title">内容描述:</td>
                    <td class="text">
                        <input type="text" id="Content" name="Content" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">问题类型:</td>
                    <td class="text">
                        <input type="text" id="ProblemId" name="ProblemId" class="easyui-combobox" />
                    </td>
                    <td class="title">是否需要整改:</td>
                    <td class="text">
                        <input id="IsNeedRectification" name="IsNeedRectification" class="easyui-combobox" data-options="
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
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="Clear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="TaskId" name="TaskId" />
        <input type="hidden" id="NeedEdit" name="NeedEdit" />
        <input type="hidden" id="TaskStandardId" name="TaskStandardId" />
        <input type="hidden" id="StandardScore" name="StandardScore" />
        <input type="hidden" id="IsAllowFloat" name="IsAllowFloat" />
        <input type="hidden" id="MaximumFloatingScore" name="MaximumFloatingScore" />
        <input type="hidden" id="DeductionNature" name="DeductionNature" />
        <script type="text/javascript">
            function Clear() {
                var CommId = $("#CommId").val();
                var NeedEdit = $("#NeedEdit").val();
                var TaskStandardId = $("#TaskStandardId").val();
                var StandardScore = $("#StandardScore").val();
                var IsAllowFloat = $("#IsAllowFloat").val();
                var MaximumFloatingScore = $("#MaximumFloatingScore").val();
                $('#frmForm').form('clear');
                $("#CommId").val(CommId);
                $("#NeedEdit").val(NeedEdit);
                $("#TaskStandardId").val(TaskStandardId);
                $("#StandardScore").val(StandardScore);
                $("#IsAllowFloat").val(IsAllowFloat);
                $("#MaximumFloatingScore").val(MaximumFloatingScore);
            }

            function LoadProblem() {
                $('#ProblemId').combobox({
                    required: false,
                    panelHeight: '200',
                    validType: ['comboBoxValid[\'#ProblemId\']'],
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
                        param.DType = '问题类型';
                    }
                });
            }

            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TableContainer").css("width", w + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'Sort', title: '序号', width: 200, align: 'left', sortable: true },
                { field: 'CheckPlace', title: '检查地点', width: 100, align: 'left', sortable: true },
                { field: 'Content', title: '内容描述', width: 300, align: 'left', sortable: true },
                {
                    field: 'Files', title: '检查附件', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"FilesList('" + row.TaskDeductionItemId + "')\">查看</a>";
                        return str;
                    }
                },
                { field: 'DeductionScore', title: '加/扣分数', width: 300, align: 'left', sortable: true },
                { field: 'ProblemName', title: '问题类型', width: 300, align: 'left', sortable: true },
                { field: 'IsNeedRectificationName', title: '是否需要整改', width: 300, align: 'left', sortable: true },
                { field: 'RectificationExplain', title: '整改要求', width: 80, align: 'left', sortable: true },
                { field: 'RectificationTimeLimit', title: '整改时限', width: 80, align: 'left', sortable: true },
                { field: 'AddUserName', title: '登记人', width: 100, align: 'left', sortable: true },
                { field: 'AddDate', title: '登记时间', width: 100, align: 'left', sortable: true }
            ]];

            function FilesList(TaskDeductionItemId) {
                HDialog.Open('600', '340', '../Supervision/TaskFilesList.aspx?Type=' + encodeURI(encodeURI('加扣分项')) +'&KeyId=' + TaskDeductionItemId + '&CommId=' + $('#CommId').val() + "&NeedEdit=" + $("#NeedEdit").val(), '查看附件', false, function callback(_Data) {

                });
            }

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('800', '600', '../Supervision/TaskDeductionEdit.aspx?OpType=insert&CommId=' + $("#CommId").val() + '&TaskStandardId=' + $("#TaskStandardId").val() + '&StandardScore=' + $("#StandardScore").val() + '&IsAllowFloat=' + $("#IsAllowFloat").val() + '&MaximumFloatingScore=' + $("#MaximumFloatingScore").val() + '&DeductionNature=' + $("#DeductionNature").val(), '新增加扣分项', true, function callback(_Data) {
                            LoadList();
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
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        Edit(row.TaskDeductionItemId);
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        DelRecord(row.TaskDeductionItemId);
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
            ];

            function Edit(TaskDeductionItemId) {
                HDialog.Open('800', '600', '../Supervision/TaskDeductionEdit.aspx?OpType=edit&CommId=' + $("#CommId").val() + '&TaskId=' + $("#TaskId").val() + '&TaskStandardId=' + $("#TaskStandardId").val() + '&TaskDeductionItemId=' + TaskDeductionItemId + '&StandardScore=' + $("#StandardScore").val() + '&IsAllowFloat=' + $("#IsAllowFloat").val() + '&MaximumFloatingScore=' + $("#MaximumFloatingScore").val() + '&DeductionNature=' + $("#DeductionNature").val(), '编辑加扣分项', true, function callback(_Data) {
                    LoadList();
                });
            }

            function DelRecord(TaskDeductionItemId) {
                HDialog.Prompt('是否删除选中的数据!', function () {
                    $.tool.DataGet('CSSupervision', 'DelTaskDeduction', 'CommId=' + $("#CommId").val() + '&TaskDeductionItemId=' + TaskDeductionItemId,
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

            function LoadList() {
                var tool = null;
                if ($("#NeedEdit").val() == "1")
                    tool = toolbar;
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskDeductionItemList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: tool,
                    sortOrder: "asc",
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            $(function () {
                $("#TaskStandardId").val(GetQueryString('TaskStandardId'));
                $("#CommId").val(GetQueryString('CommId')); 
                $("#TaskId").val(GetQueryString('TaskId'));
                $("#NeedEdit").val(GetQueryString('NeedEdit'));
                $("#StandardScore").val(GetQueryString('StandardScore'));
                $("#IsAllowFloat").val(GetQueryString('IsAllowFloat'));
                $("#MaximumFloatingScore").val(GetQueryString('MaximumFloatingScore'));
                $("#DeductionNature").val(GetQueryString('DeductionNature'));
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                InitTableHeight();
                LoadProblem();
                LoadList();
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
