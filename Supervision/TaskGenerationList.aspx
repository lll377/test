<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskGenerationList.aspx.cs" Inherits="M_Main.Supervision.TaskGenerationList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>任务生成列表</title>
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
            style="width: 510px; height: 265px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">添加人:</td>
                    <td class="text">
                        <input type="text" id="AddPName" name="AddPName" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title"></td>
                    <td class="text"></td>
                </tr>
                <tr>
                    <td class="title">添加时间:</td>
                    <td class="text">
                        <input type="text" id="AddTimeBeginBg" name="AddTimeBeginBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="AddTimeBeginEnd" name="AddTimeBeginEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">开始时间:</td>
                    <td class="text">
                        <input type="text" id="BeginTimeBg" name="BeginTimeBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="BeginTimeEnd" name="BeginTimeEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">结束时间:</td>
                    <td class="text">
                        <input type="text" id="EndTimeBg" name="EndTimeBg" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="EndTimeEnd" name="EndTimeEnd" class="easyui-datebox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="UserCode" name="UserCode" runat="server" />
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TableContainer").css("width", w + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'UserName', title: '添加人', width: 200, align: 'left', sortable: true },
                { field: 'AddTimeBegin', title: '添加时间', width: 200, align: 'left', sortable: true },
                { field: 'BeginTime', title: '开始时间', width: 300, align: 'left', sortable: true },
                { field: 'EndTime', title: '结束时间', width: 300, align: 'left', sortable: true },
                {
                    field: 'TaskNum', title: '任务数量', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"ProduceInfo('" + row.TaskProduceId + "','" + row.AddPId + "')\">" + row.TaskNum + "</a>";
                        return str;
                    }
                }
            ]];

            function ProduceInfo(TaskProduceId, AddPId) {
                var CanDel = 'false';
                if (AddPId == $("#UserCode").val())
                    CanDel = 'true';
                HDialog.Open(w - 200, '600', '../Supervision/TaskProduceCommList.aspx?TaskProduceId=' + TaskProduceId + '&CanDel=' + CanDel, '任务批次项目列表', true, function callback(_Data) {
                    LoadList();
                });
            }

            var toolbar = [
                {
                    text: '生成计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.OpenWinNoClose('800', '600', '../Supervision/TaskGenerationAdd.aspx', '任务生成', true, function callback(_Data) {
                            LoadList();
                            if (_Data == "2") {//生成有错误  展示错误信息
                                HDialog.Open('800', '600', '../Supervision/TaskTempProblemList.aspx', '生成信息', true, function callback(_Data) {
                                });
                            }
                        });
                    }
                }
                , '-',
                {
                    text: '删除计划',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        if (row.AddPId != $("#UserCode").val()) {
                            HDialog.Info("只能删除自己添加的任务数据");
                            return;
                        }
                        DelRecord(row.TaskProduceId);
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
                    text: '查看生成信息',
                    iconCls: 'icon-tip',
                    handler: function () {
                        HDialog.Open(w - 200, '600', '../Supervision/TaskTempProblemList.aspx', '生成信息', true, function callback(_Data) {
                        });
                    }
                }
            ];

            function DelRecord(Id) {
                HDialog.Prompt('是否删除选中的数据!', function () {
                    $.tool.DataGet('CSSupervision', 'TaskProduce_CanDel', 'TaskProduceId=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "0") {
                                HDialog.Info("该批次存在执行中或已执行的任务，无法删除！");
                                return;
                            }
                            $.tool.DataGet('CSSupervision', 'TaskProduce_Del', 'TaskProduceId=' + Id,
                                function Init() {
                                },
                                function callback(_Data) {
                                    LoadList();
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
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=TaskProduceList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
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
                InitTableHeight();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
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
