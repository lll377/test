<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskRectificationItemProblem.aspx.cs" Inherits="M_Main.Supervision.TaskRectificationItemProblem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>分项检查及问题描述</title>
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
      
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td>评分类型
                        <input id="ScoreType" name="ScoreType" class="easyui-combobox" />
                        <a href="javascript:void(0)" onclick="LoadList(); " class="l-btn l-btn-small l-btn-plain">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 400px; height: 140px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">问题描述:</td>
                    <td class="text">
                        <input type="text" id="Problem" name="Problem" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="btnSave" style="display:none" onclick="Save();">保存</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="Back();">返回</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="TaskId" name="TaskId" />
        <input type="hidden" id="PlanId" name="PlanId" />
        <input type="hidden" id="CommId" name="CommId" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            function BindScoreType() {
                $('#ScoreType').combobox({
                    required: true,
                    panelHeight: '100',
                    validType: ['comboBoxValid[\'#ScoreType\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'ScoreType',
                    textField: 'ScoreTypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindScoreType_ByPlanId';
                        param.Id = $("#PlanId").val();
                    }
                });
            }

            var column = [[
                { field: 'ScoreItemName', title: '评分项目', width: 150, align: 'left', sortable: true },
                { field: 'ItemScore', title: '单项分值', width: 80, align: 'left', sortable: true },
                { field: 'StandardNum', title: '标准数量', width: 100, align: 'left', sortable: true },
                { field: 'DidNum', title: '已查数量', width: 100, align: 'left', sortable: true },
                { field: 'DiscardNum', title: '甩项数量', width: 100, align: 'left', sortable: true },
                { field: 'DeducitionItemNum', title: '加扣分项', width: 100, align: 'left', sortable: true },
                { field: 'DeducitionItemScore', title: '加扣分数', width: 100, align: 'left', sortable: true },
                { field: 'GetScore', title: '单项得分', width: 100, align: 'left', sortable: true },
                {
                    field: 'Problem', title: '问题描述', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Problem('" + row.Id + "','" + row.Problem + "')\">编辑</a>";
                        return str;
                    }
                }
            ]];

            function Problem(Id, Problem) {
                $("#Id").val(Id);
                $("#Problem").textbox('setValue', Problem);
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }

            function Save() {
                $.tool.DataGet('CSSupervision', 'TaskRectification_UpdateTaskScoreProblem', 'Id=' + $("#Id").val() + '&Problem=' + $("#Problem").textbox('getValue') + '&CommId=' + $("#CommId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#SearchDlg").dialog("close");
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Back() {
                $("#SearchDlg").dialog("close");
            }

            function LoadList() {
                var url = '';
                if ($("#ScoreType").combobox("getValue") > '')
                    url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskRectification_TaskScoreList&ScoreType=' + $("#ScoreType").combobox("getValue") + '&TaskId=' + $("#TaskId").val() + '&CommId=' + $("#CommId").val();
                $("#TableContainer").datagrid({
                    url: url,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: '#divtt',
                    sortOrder: "asc",
                    showFooter: true,
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            $(function () {
                $("#OpType").val(localStorage.getItem('OpType'));
                $("#TaskId").val(localStorage.getItem('TaskId'));
                $("#PlanId").val(localStorage.getItem('PlanId'));
                $("#CommId").val(localStorage.getItem('CommId'));
                if ($("#OpType").val() != "see") {
                    $("#btnSave").show();
                }
                InitTableHeight();
                BindScoreType();
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
