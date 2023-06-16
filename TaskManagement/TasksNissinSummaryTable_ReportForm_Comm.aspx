<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TasksNissinSummaryTable_ReportForm_Comm.aspx.cs" Inherits="M_Main.TaskManagement.TasksNissinSummaryTable_ReportForm_Comm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务日清汇总表</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        select {
            min-width: 50px;
        }
    </style>
</head>
<body>
    <input type="hidden" name="LoginRoleCode" id="LoginRoleCode" runat="server" />
    <input type="hidden" name="CommID" id="CommID" value="-1" runat="server" />
    <input type="hidden" name="CommName" id="CommName" runat="server" />
    <input type="hidden" name="OrganCode" id="OrganCode" runat="server" />
    <input type="hidden" name="DeadlineTime" id="DeadlineTime" />
    <input type="hidden" name="IsLoad" id="IsLoad" value="1" />

    <input type="hidden" name="PointID" id="PointID" value="-1" />
    <input type="hidden" name="SysPointId" id="SysPointId" value="-1" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div id="layout_center" data-options="region:'center',border:true,title:'  ',">
            <table id="tgSpace" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="dlg_search_space" class="easyui-dialog" title="筛选" style="width: 800px; height: 200px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmPoint">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="TdTitle">截止时间</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" id="DeadlineTimes" name="DeadlineTimes" style="width: 150px;" runat="server" class="Wdate"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd 23:59:59', skin: 'default' })"
                            format="date" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadListSpace()">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="$('#frmPoint').form('clear')">重置</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitTableHeight();
            LoadListSpace();
            $('#DeadlineTime').val(GetDate());
            $('#layout_center').panel('setTitle', '统计截止时间：' + GetDate());
        });

        function GetDate() {
            var dateTime = new Date();
            dateTime = dateTime.setDate(dateTime.getDate() - 1);
            dateTime = new Date(dateTime);
            var Month = parseInt(dateTime.getMonth()) + parseInt(1)
            var date = dateTime.getFullYear() + '-' + Month + '-' + dateTime.getDate() + ' 23:59:59';
            return date;
        }

        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $("#tgSpace").css("height", h - 29 + "px");
        }

        //———————————————--- 通用点位————————————---
        var toolbarSpace = [
            {
                text: '导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    window.open("EqSpaceListoutput.aspx?random=" + Math.random() + '&CommId=' + $("#CommID").val());
                }
            }
        ];
        //任务单位	昨日完成任务数	昨日逾期任务数	昨日任务报事数	今日待办任务数	今日到期任务数
        var columnSpace = [[
            {
                field: 'TaskType', title: '任务类型', width: 140, align: 'left', formatter: function (value, row, index) {
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'TaskUnit', title: '任务单位', width: 140, align: 'left', formatter: function (value, row, index) {
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'YesterdayComletedNum', title: '昨日完成任务数', width: 100, align: 'left', formatter: function (value, row, index) {
                    var valueShow = value;
                    if (row.TaskType == '物管费本年收款' || row.TaskType == '物管费往年清欠') {
                        valueShow = format(value);
                        if (row.TaskUnit == '户数')
                            valueShow = valueShow.substr(0, valueShow.length - 3)
                    } else
                    if (row.TaskUnit != '金额' && value != '') {
                        valueShow = valueShow == '0.00' ? '0' : parseInt(valueShow);
                    }
                    return valueShow == "" ? "—" : valueShow;
                }
            },
            {
                field: 'YesterdayOverdueNum', title: '昨日逾期任务数', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskUnit != '金额' && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "<span style='color:#FE2E2E;'>—</span>": "<span style='color:#FE2E2E;'>" + value + "</span>";
                }
            },
            {
                field: 'YesterdayIncidentNum', title: '昨日任务报事数', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskUnit != '金额' && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'TodayAgentNum', title: '今日待办任务数', width: 100, align: 'left', formatter: function (value, row, index) {
                    var valueShow = value;
                    if (row.TaskType == '物管费本年收款' || row.TaskType == '物管费往年清欠') {
                        valueShow = format(value);
                        if (row.TaskUnit == '户数')
                            valueShow = valueShow.substr(0, valueShow.length - 3)
                    } else
                    if (row.TaskUnit != '金额' && value != '') {
                        valueShow = valueShow == '0.00' ? '0' : parseInt(valueShow);
                    }
                    return valueShow == "" ? "—" : valueShow;
                }
            },
            {
                field: 'TodayOverdueNum', title: '今日到期任务数', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskUnit != '金额' && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "<span style='color:#FE2E2E;'>—</span>": "<span style='color:#FE2E2E;'>" + value+"</span>";
                }
            }
        ]];
        function format(num) {
            return num.replace(/(\d{1,3})(?=(\d{3})+(?:$|\.))/g, '$1,');
        }

        function LoadListSpace() {
            $("#tgSpace").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: columnSpace,
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("TaskManagement", "GetTasksNissinSummaryTableList", "tgSpace", param);
                },
                onLoadSuccess: function (data) {
                    $("#tgSpace").datagrid("autoMergeCells", ['TaskType']);
                }
            });
            $('#tgSpace').datagrid('clearSelections');
            $("#dlg_search_space").dialog("close");
        }

        $.extend($.fn.datagrid.methods, {
            autoMergeCells: function (jq, fields) {
                return jq.each(function () {
                    var target = $(this);
                    if (!fields) {
                        fields = target.datagrid("getColumnFields");
                    }
                    var rows = target.datagrid("getRows");
                    var i = 0,
                        j = 0,
                        temp = {};
                    for (i; i < rows.length; i++) {
                        var row = rows[i];
                        j = 0;
                        for (j; j < fields.length; j++) {
                            var field = fields[j];
                            var tf = temp[field];
                            if (!tf) {
                                tf = temp[field] = {};
                                tf[row[field]] = [i];
                            } else {
                                var tfv = tf[row[field]];
                                if (tfv) {
                                    tfv.push(i);
                                } else {
                                    tfv = tf[row[field]] = [i];
                                }
                            }
                        }
                    }
                    $.each(temp, function (field, colunm) {
                        $.each(colunm, function () {
                            var group = this;
                            if (group.length > 1) {
                                var before,
                                    after,
                                    megerIndex = group[0];
                                for (var i = 0; i < group.length; i++) {
                                    before = group[i];
                                    after = group[i + 1];
                                    if (after && (after - before) == 1) {
                                        continue;
                                    }
                                    var rowspan = before - megerIndex + 1;
                                    if (rowspan > 1) {
                                        target.datagrid('mergeCells', {
                                            index: megerIndex,
                                            field: field,
                                            rowspan: rowspan
                                        });
                                    }
                                    if (after && (after - before) != 1) {
                                        megerIndex = after;
                                    }
                                }
                            }
                        });
                    });
                });
            }
        });
    </script>
</body>
</html>
