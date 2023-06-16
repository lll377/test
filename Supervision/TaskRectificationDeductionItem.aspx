<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskRectificationDeductionItem.aspx.cs" Inherits="M_Main.Supervision.TaskRectificationDeductionItem" %>

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
            style="width: 510px; height: 220px; padding: 10px; overflow: hidden;">
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
                    <td class="title">是否整改:</td>
                    <td class="text">
                        <input id="IsRectification" name="IsRectification" class="easyui-combobox" data-options="
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
                    <td class="title">是否验收合格:</td>
                    <td class="text">
                        <input id="IsAcceptedDeductionItem" name="IsAcceptedDeductionItem" class="easyui-combobox" data-options="
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
        <input type="hidden" id="TaskStandardId" name="TaskStandardId" />
        <input type="hidden" id="NeedEdit" name="NeedEdit" />
        <input type="hidden" id="StandardScore" name="StandardScore" />
        <input type="hidden" id="IsAllowFloat" name="IsAllowFloat" />
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
                { field: 'CheckPlace', title: '检查地点', width: 150, align: 'left', sortable: true },
                { field: 'Content', title: '内容描述', width: 300, align: 'left', sortable: true },
                {
                    field: 'Files', title: '检查附件', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"FilesList('" + row.TaskDeductionItemId + "')\">查看</a>";
                        return str;
                    }
                },
                { field: 'DeductionScore', title: '加/扣分数', width: 120, align: 'left', sortable: true },
                { field: 'ProblemName', title: '问题类型', width: 200, align: 'left', sortable: true },
                { field: 'IsNeedRectificationName', title: '是否需要整改', width: 120, align: 'left', sortable: true },
                { field: 'RectificationExplain', title: '整改要求', width: 200, align: 'left', sortable: true },
                { field: 'RectificationTimeLimit', title: '整改时限', width: 160, align: 'left', sortable: true },
                { field: 'AddUserName', title: '登记人', width: 100, align: 'left', sortable: true },
                { field: 'AddDate', title: '登记时间', width: 160, align: 'left', sortable: true },
                { field: 'IsRectificationName', title: '是否整改', width: 120, align: 'left', sortable: true },
                { field: 'IsAcceptedName', title: '是否验收合格', width: 150, align: 'left', sortable: true }
            ]];

            function FilesList(TaskDeductionItemId) {
                HDialog.Open('600', '340', '../Supervision/TaskFilesList.aspx?Type=' + encodeURI(encodeURI('加扣分项')) +'&KeyId=' + TaskDeductionItemId + '&CommId=' + $('#CommId').val() + "&NeedEdit=" + $("#NeedEdit").val(), '查看附件', false, function callback(_Data) {

                });
            }

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskRectificationDeductionItemList&' + $('#frmForm').serialize(),
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
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            $(function () {
                $("#TaskId").val(localStorage.getItem('TaskId'));
                $("#CommId").val(localStorage.getItem('CommId'));
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
