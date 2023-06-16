<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TasksMonthlySummaryTable_ReportForm.aspx.cs" Inherits="M_Main.TaskManagement.TasksMonthlySummaryTable_ReportForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务月结汇总表</title>
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
    <input type="hidden" name="LoginOrgan" id="LoginOrgan" runat="server" />
    <input type="hidden" name="CommID" id="CommID" value="-1" />
    <input type="hidden" name="CommName" id="CommName" />
    <input type="hidden" name="OrganCode" id="OrganCode" />
    <input type="hidden" name="DeadlineTime" id="DeadlineTime" />
    <input type="hidden" name="IsLoad" id="IsLoad" value="0" />
    <input type="hidden" name="PointID" id="PointID" value="-1" />
    <input type="hidden" name="SysPointId" id="SysPointId" value="-1" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300,title:'项目列表'">
            <ul id="treeOrgan" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',border:true,title:'  ',">
            <table id="tgSpace" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            PageInit();
            LoadOrganTree();
            LoadListSpace();
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

        function PageInit() {
            $('#IncidentArea').combobox({
                required: false,
                validType: ['comboBoxValid[\'#IncidentArea\']'],
                width: '98%',
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }],
                url: '/HM/M_Main/HC/DataGetControl.aspx',
                method: 'get',
                valueField: 'RegionalID',
                textField: 'RegionalPlace',
                onBeforeLoad: function (param) {
                    param.Method = 'DataGet';
                    param.Class = 'TaskManagement';
                    param.Command = 'GetIncidentArea';
                    param.CommID = $("#CommID").val();;
                }
            });
        }

        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $("#tgSpace").datagrid('resize', {
                height: h - 29,
            });
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
                    InitTableHeight();
                    //默认选中登录公司或总部
                    if (data.length > 0) {
                        var node = $('#treeOrgan').tree('find', $("#LoginOrgan").val());
                        if (node) {
                            $('#treeOrgan').tree('select', node.target);
                        }
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Method = "DataPost";
                    param.Class = "CpComPatrols";
                    param.Command = "DepMenuList";
                    //控制用户权限
                    param.SelRoleCode = $("#LoginRoleCode").val();
                },
                onSelect: function (row) {
                    var isLeaf = $("#treeOrgan").tree('isLeaf', row.target);
                    if (isLeaf) {
                        // $('#layout_center').panel('setTitle', '' + row.text);
                        $('#layout_center').panel('setTitle', '统计截止时间：' + GetDate());
                        $("#CommID").val(row.attributes.CommID);
                        $("#CommName").val(row.text);
                        $("#OrganCode").val(row.attributes.ParentCode);
                    } else {
                        //区域
                        // $('#layout_center').panel('setTitle', '请选择项目!');
                        $('#layout_center').panel('setTitle', '统计截止时间：' + GetDate());
                        $("#CommID").val('');
                        $("#OrganCode").val(row.attributes.OrganCode);

                    }
                    $("#IsLoad").val("1");
                    LoadListSpace();
                }
            });
        }
        //———————————————--- 通用点位————————————---
        var toolbarSpace = [
            {
                text: '导出excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    Export();
                }
            }
            ,'-',
            {
                text: '任务汇总导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    ExportSum();
                }
            }
        ];
        //项目名称	NO	任务类型	任务单位	//任务完成情况				                        //任务报事情况			
        //本月应完成任务数	本月实完成任务数	本月逾期任务数	本月任务完成率	  //本月总报事数	本月应完成报事数	本月实完成报事数	本月报事完成率
        var columnSpace = [[
            //{
            //    field: 'CommName', rowspan: 2, title: '项目名称', width: 200, align: 'left', formatter: function (value, row, index) {
            //        return value;
            //    }
            //},
            {
                field: 'TaskType', rowspan: 2, title: '任务类型', width: 140, align: 'left', formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'TaskUnit', rowspan: 2, title: '任务单位', width: 140, align: 'left', formatter: function (value, row, index) {
                    return value;
                }
            },
            { colspan: 4, title: '任务完成情况' },
            { colspan: 4, title: '任务报事情况' }
        ],
        [
            //任务完成情况 //本月应完成任务数	本月实完成任务数	本月逾期任务数	本月任务完成率
            //  TaskNum	ComletedNum	OverdueNum	ComletedRate	
            {
                field: 'TaskNum', title: '本月应完成任务数', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskUnit != '金额' && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'ComletedNum', title: '本月实完成任务数', width: 100, align: 'left', formatter: function (value, row, index) {
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
                field: 'OverdueNum', title: '本月逾期任务数', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskUnit != '金额' && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "<span style='color:#FE2E2E;'>—</span>" : "<span style='color:#FE2E2E;'>" + value + "</span>";
                }
            },
            {
                field: 'ComletedRate', title: '本月任务完成率', width: 100, align: 'left', formatter: function (value, row, index) {

                    return value == "" ? "—" : value + "%";
                }
            },

            //任务报事情况  //本月总报事数	本月应完成报事数	本月实完成报事数	本月报事完成率
            //IncidentNum	ShouldDoIncidentNum	ComletedIncidentNum	ComletedIncidentRate
            {
                field: 'IncidentNum', title: '本月总报事数', width: 100, align: 'left', formatter: function (value, row, index) {
                    var valueShow = value;
                    if (row.TaskType == '物管费本年收款' || row.TaskType == '物管费往年清欠') {
                        valueShow = format(value);
                    } else  if (row.TaskUnit != '金额' && value != '') {
                        valueShow = valueShow == '0.00' ? '0' : parseInt(valueShow);
                    }
                    return valueShow == "" ? "—" : valueShow;
                }
            },
            {
                field: 'ShouldDoIncidentNum', title: '本月应完成报事数', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskUnit != '金额' && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'ComletedIncidentNum', title: '本月实完成报事数', width: 100, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskUnit != '金额' && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'ComletedIncidentRate', title: '本月报事完成率', width: 100, align: 'left', formatter: function (value, row, index) {
                    return value == "" ? "—" : value+"%";
                }
            }
        ]
        ];
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
                toolbar: toolbarSpace,
                rownumbers: true,
                fitColumns: false,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {
                },
                onClickRow: function (index, row) {
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("TaskManagement", "GetTasksMonthlySummaryTableList", "tgSpace", param);
                },
                onLoadSuccess: function (data) {
                      $("#tgSpace").datagrid("autoMergeCells", ['TaskType']);
                },
                onLoadError: function (data) {
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

        //导出Excel
        function Export() {
            $.tool.DataGet('TaskManagement', 'TaskManagement_MonthlyTotalTable_Output', '',
                function Init() {
                },
                function callback(_Data) {
                    var tableString = '<table cellspacing="0" class="pb">';

                    // 载入title
                    tableString += '\n<tr>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:400px" rowspan="2">项目名称</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;" colspan="19">本月任务完成率</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;" colspan="2">本年任务完成率</th>';
                    tableString += '\n</tr>';
                    tableString += '\n<tr>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:130px">报事工单(全部)</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:130px">报事工单(投诉)</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">工单评价</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">客户拜访</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">公区巡查</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">装修巡查</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">空房巡查</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">设备巡检</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">设备维保</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">设备故障</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">分户查验</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">安全巡更</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">消防巡检</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">环境保洁</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">绿化养护</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">四害消杀</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">垃圾清运</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">品质核查</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">品质整改</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:130px">物管费往年清欠</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:130px">物管费本年收款</th>';
                    tableString += '\n</tr>';
                    // 载入内容
                    var rows = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    for (var i = 0; i < rows.length; i++) {
                        tableString += '\n<tr>';
                        tableString += '\n<td>' + rows[i]["项目名称"] + '</td>';
                        tableString += '\n<td>' + rows[i]["报事工单(全部)"] + '</td>';
                        tableString += '\n<td>' + rows[i]["报事工单(投诉)"] + '</td>';
                        tableString += '\n<td>' + rows[i]["工单评价"] + '</td>';
                        tableString += '\n<td>' + rows[i]["客户拜访"] + '</td>';
                        tableString += '\n<td>' + rows[i]["公区巡查"] + '</td>';
                        tableString += '\n<td>' + rows[i]["装修巡查"] + '</td>';
                        tableString += '\n<td>' + rows[i]["空房巡查"] + '</td>';
                        tableString += '\n<td>' + rows[i]["设备巡检"] + '</td>';
                        tableString += '\n<td>' + rows[i]["设备维保"] + '</td>';
                        tableString += '\n<td>' + rows[i]["设备故障"] + '</td>';
                        tableString += '\n<td>' + rows[i]["分户查验"] + '</td>';
                        tableString += '\n<td>' + rows[i]["安全巡更"] + '</td>';
                        tableString += '\n<td>' + rows[i]["消防巡检"] + '</td>';
                        tableString += '\n<td>' + rows[i]["环境保洁"] + '</td>';
                        tableString += '\n<td>' + rows[i]["绿化养护"] + '</td>';
                        tableString += '\n<td>' + rows[i]["四害消杀"] + '</td>';
                        tableString += '\n<td>' + rows[i]["垃圾清运"] + '</td>';
                        tableString += '\n<td>' + rows[i]["品质核查"] + '</td>';
                        tableString += '\n<td>' + rows[i]["品质整改"] + '</td>';
                        tableString += '\n<td>' + rows[i]["物管费往年清欠"] + '</td>';
                        tableString += '\n<td>' + rows[i]["物管费本年收款"] + '</td>';
                        tableString += '\n</tr>';
                    }

                    //导出
                    var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                    var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                    var l = $('<input type="hidden" id="txtName" name="txtName" />');
                    i.val(tableString);
                    i.appendTo(f);
                    var date = new Date();
                    l.val('任务月结汇总表导出-' + dateFormat("YYYY-mm-dd", date));
                    l.appendTo(f);
                    f.appendTo(document.body).submit();
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

        //导出Excel
        function ExportSum() {
            $.tool.DataGet('TaskManagement', 'TaskManagement_MonthlyTotalTable_OutputSum', '',
                function Init() {
                },
                function callback(_Data) {
                    var tableString = '<table cellspacing="0" class="pb">';

                    // 载入title
                    tableString += '\n<tr>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">序号</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">项目名称</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">任务类型</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">应查任务数</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">完成任务数</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">任务完成率（%）</th>';
                    tableString += '\n<th style="background-color:#c0c0c0;width:100px">备注</th>';
                    tableString += '\n</tr>';
                    // 载入内容
                    var rows = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    for (var i = 0; i < rows.length; i++) {
                        tableString += '\n<tr>';
                        tableString += '\n<td>' + rows[i]["RowNum"] + '</td>';
                        tableString += '\n<td>' + rows[i]["CommName"] + '</td>';
                        tableString += '\n<td>' + rows[i]["TaskUnit"] + '</td>';
                        tableString += '\n<td>' + rows[i]["TaskNum"] + '</td>';
                        tableString += '\n<td>' + rows[i]["ComletedNum"] + '</td>';
                        tableString += '\n<td>' + rows[i]["ComletedRate"] + '</td>';
                        tableString += '\n<td></td>';
                        tableString += '\n</tr>';
                    }

                    //导出
                    var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                    var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                    var l = $('<input type="hidden" id="txtName" name="txtName" />');
                    i.val(tableString);
                    i.appendTo(f);
                    var date = new Date();
                    l.val('任务月结汇总表（任务汇总）导出-' + dateFormat("YYYY-mm-dd", date));
                    l.appendTo(f);
                    f.appendTo(document.body).submit();
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
</body>
</html>
