<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskNotComplete_Safe.aspx.cs" Inherits="M_Main.ComprehensivePatrols.TaskNotComplete_Safe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>未完成任务</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/help.js"></script>
    <style type="text/css">
         .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            width: 120px;
            height: 18px;
            border-radius: 5px 5px 5px 5px;
        }
        .TdContentSearch select {
            width: 123px;
            height: 22px;
            border: 1px #cccccc solid;
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


        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 110px;
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
        <div style="width: 100%; background-color: #cccccc;" id="DivContainer">
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetail">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="overflow: hidden; padding: 5px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;" class="SearchTable">
                <tr>
                    <td class="TdTitle">任务来源</td>
                    <td class="TdContentSearch">
                        <select id="TaskSource" name="TaskSource"  class="easyui-validatebox" runat="server">
                            <option value=""></option>
                            <option value="自动生成">自动生成</option>
                            <option value="手动生成">手动生成</option>
                            <option value="维护生成">维护生成</option>
                            <option value="临时任务">临时任务</option>
                        </select>
                    </td>
                    <td class="TdTitle">任务级别</td>
                    <td class="TdContentSearch">
                        <select id="TaskLevelId" name="TaskLevelId" runat="server" class="easyui-validatebox">
                        </select>
                    </td>
                    <td class="TdTitle">任务编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskNO" name="TaskNO" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">责任岗位</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskRoleName" name="TaskRoleName" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskUserName" name="TaskUserName" class="easyui-validatebox" runat="server"  />
                    </td>
                    <td class="TdTitle">任务状态</td>
                    <td class="TdContentSearch">
                        <select id="PlanState" name="PlanState"  class="easyui-validatebox" runat="server">
                            <option value=""></option>
                            <option value="0">未开始</option>
                            <option value="1">执行中</option>
                            <option value="2">已完成</option>
                        </select>
                    </td>
                    <td class="TdTitle">计划开始时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="StartBeginTime" name="StartBeginTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EndBeginTime" name="EndBeginTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划结束时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="StartEndTime" name="StartEndTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EndEndTime" name="EndEndTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">实际开始时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="StartDidBeginTime" name="StartDidBeginTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EndDidBeginTime" name="EndDidBeginTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">实际结束时间从</td>
                    <td class="TdContentSearch">
                        <input type="text" id="StartDidEndTime" name="StartDidEndTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EndDidEndTime" name="EndDidEndTime" runat="server"  class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">计划周期</td>
                    <td class="TdContentSearch">
                        <select id="FrequencyTitle" name="FrequencyTitle" class="easyui-validatebox" >
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
                </tr>
                <tr>
                    <td class="TdTitle">是否关闭</td>
                    <td class="TdContentSearch">
                        <select id="IsClose" name="IsClose"  class="easyui-validatebox" runat="server">
                            <option value=""></option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">关闭原因</td>
                    <td class="TdContentSearch">
                        <select id="CloseReason" name="CloseReason" runat="server" isdctype="true"
                            dctype="关闭原因" dyname=""  class="easyui-validatebox">
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
        <input type="hidden" id="TaskId" name="TaskId" />
        <input type="hidden" id="TaskRoleCode" name="TaskRoleCode" />
        <input type="hidden" id="TaskEqIdsShow" name="TaskEqIdsShow" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="isDesk" name="isDesk" />
        <input id="CommId" name="CommId" type="hidden" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#DivContainer").css("height", h / 2 + "px");
                $("#DivContainerDetail").css("height", h / 2 + "px");
            }

            //加载巡查级别
            function LoadTaskLevel() {
                $.tool.DataPostAsync('CpComPatrols', 'BindTaskLevel', null,
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        $("#TaskLevelId").append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            var option = "<option value='" + varObjects[i].LevelId + "'>" + varObjects[i].TaskLevelName + "</option>";
                            $("#TaskLevelId").append(option);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }

            function btnClear() {
                $("#TaskSource").val("");
                $("#TaskLevelId").val("");
                $("#TaskNO").val("");
                $("#TaskRoleName").val("");
                $("#TaskRoleCode").val("");
                $("#TaskUserName").val("");
                $("#StartBeginTime").val("");
                $("#EndBeginTime").val("");
                $("#StartEndTime").val("");
                $("#EndEndTime").val("");
                $("#StartDidBeginTime").val("");
                $("#EndDidBeginTime").val("");
                $("#StartDidEndTime").val("");
                $("#EndDidEndTime").val("");
                $("#PlanState").val("");
                $("#PlanName").val("");
                $("#FrequencyTitle").val("");
                $("#IsClose").val("");
                $("#CloseReason").val("");
            }

            //导出
            function Export() {
                var param = $.getParam();
                console.log(param)
                param.PageSize = 5000;
                param.IsPagination = "否";
                param.IsZip = "否";
                param.TableName = "安全管理任务执行跟进（未完成）";
                param.Class = "CpComPatrols";
                param.Method = "ExportCpPlanTaskList_Safe";
                window.open("/HM/M_Main/HC/Export.aspx?" + $.param(param) + "&Flag=未完成");
            }

            var toolbar =
                [{
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                    {
                        text: '导出Excel',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {
                            Export();
                        }
                    }
                ];

            var toolbarDetail =
                [{
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        //window.open("CpReportExcel.aspx?CommId=" + $('#CommId').val() + '&TaskId=' + $('#TaskId').val() + '&TaskName=品质任务点位');
                        var formData = new FormData();
                        formData.append("CommId", $('#CommId').val());
                        formData.append("TaskId", $('#TaskId').val());
                        formData.append("TaskName", '安全任务点位');
                        $.ajax({
                            type: "POST",
                            url: "/HM/M_Main/ComprehensivePatrols/CpReportExcel.aspx",
                            data: formData,
                            async: false,
                            cache: false,
                            dataType: 'text',
                            contentType: false,
                            processData: false,
                            error: function (request) {
                            },
                            success: function (data) {
                            }
                        }).done(function (data) {
                            window.open("CpReportExcelOutput.aspx");
                        });
                    }
                }];

            var frozenColumns = [[
                { field: 'TaskId', title: 'TaskId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true }
            ]];

            var column = [[
                { field: 'TaskNO', title: '任务编号', width: 150, align: 'left', sortable: true },
                { field: 'TaskSource', title: '任务来源', width: 120, align: 'left', sortable: true },
                { field: 'TaskTypeName', title: '任务类型', width: 120, align: 'left', sortable: true },
                { field: 'TaskLevelName', title: '任务级别', width: 80, align: 'left', sortable: true },
                { field: 'TaskRoleName', title: '责任岗位<span style="color:red">(具体岗位)</span>', width: 150, align: 'left', sortable: true },
                { field: 'TaskUserName', title: '责任人', width: 200, align: 'left', sortable: true },
                { field: 'PlanName', title: '计划名称', width: 260, align: 'left', sortable: true },
                { field: 'FrequencyTitle', title: '计划周期', width: 80, align: 'left', sortable: true },
                { field: 'BeginTime', title: '计划开始时间', width: 150, align: 'left', sortable: true },
                { field: 'EndTime', title: '计划结束时间', width: 150, align: 'left', sortable: true },
                { field: 'PointNum', title: '任务点位数(计划)', width: 100, align: 'left', sortable: true },
                { field: 'MustCheckPointNum', title: '必查点位数(计划)', width: 100, align: 'left', sortable: true },
                {
                    field: 'OtherPointPercentage', title: '抽查点位覆盖率(计划)', width: 150, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str;
                        if (row.OtherPointPercentage > 0) {
                            str = row.OtherPointPercentage + "%";
                        } else
                            str = "0%";
                        return str;
                    }
                },
                { field: 'DidBeginTime', title: '实际开始时间', width: 150, align: 'left', sortable: true },
                { field: 'DidEndTime', title: '实际结束时间', width: 150, align: 'left', sortable: true },
                { field: 'DidAllPointNum', title: '任务点位数(实际)', width: 100, align: 'left', sortable: true },
                { field: 'DidMustCheckPointNum', title: '必查点位数(实际)', width: 100, align: 'left', sortable: true },
                {
                    field: 'DidOtherPointPercentage', title: '抽查点位覆盖率(实际)', width: 150, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str;
                        if (row.DidOtherPointPercentage > 0) {
                            str = row.DidOtherPointPercentage + "%";
                        } else
                            str = "0%";
                        return str;
                    }
                },
                { field: 'UnqualifiedDeduction', title: '不合格扣分', width: 80, align: 'left', sortable: true },
                { field: 'RiskDeduction', title: '风险性扣分', width: 80, align: 'left', sortable: true },
                { field: 'CompositeScore', title: '综合得分', width: 80, align: 'left', sortable: true },
                {
                    field: 'PlanState', title: '计划状态', width: 80, align: 'left', sortable: true, formatter: function (value, rows) {
                        var str = "";
                        if (rows.PlanState == 0) {
                            str = "未开始"
                        } else if (rows.PlanState == 1) {
                            str = "执行中"
                        } else if (rows.PlanState == 2) {
                            str = "已完成";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsOverDue', title: '是否过期', width: 80, align: 'left', sortable: true, formatter: function (value, rows) {
                        var str = "否";
                        //判断任务结束时间若大于当前时间，任务则过期
                        var endtime = new Date(Date.parse(rows.EndTime));
                        var currentTime = new Date(Date.parse(rows.CurrentTime));
                        if (endtime < currentTime) {
                            str = "是";
                        }
                        return str;
                    }
                },
                {
                    field: 'IsClose', title: '是否关闭', width: 80, align: 'left', sortable: true, formatter: function (value, rows) {
                        var str = "";
                        if (rows.IsClose == 1) {
                            str = "是"
                        } else
                            str = "否";
                        return str;
                    }
                },
                { field: 'UserName', title: '关闭人', width: 80, align: 'left', sortable: true },
                { field: 'CloseTime', title: '关闭时间', width: 150, align: 'left', sortable: true },
                { field: 'Name', title: '关闭原因', width: 100, align: 'left', sortable: true },
                { field: 'CloseRemark', title: '关闭说明', width: 250, align: 'left', sortable: true },
                {
                    field: '查看', title: '查看轨迹图', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"checkPlanTrajectory('" + row.TaskId + "','" + row.PlanId + "','" + row.CommId + "');\" href=\"#\">查看</a>";
                        return str;
                    }
                }
            ]];
            var columnDetail = [[
                { field: 'PointCode', title: '点位编号', width: 120, align: 'left', sortable: true },
                { field: 'PointName', title: '点位名称', width: 120, align: 'left', sortable: true },
                { field: 'Addr', title: '点位地址', width: 200, align: 'left', sortable: true },
                {
                    field: 'Map', title: '地图', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                        if (isValueNull(value)) { value = "<a  onclick=\"ShowMap('" + row.Map + "');\"  href=\"javascript:void(0);\">地图</a>"; }
                        return value;
                    }
                }, {
                    field: 'QRCodesPath', title: '二维码', width: 60, align: 'left', sortable: false, formatter: function (value, row, index) {
                        value = "<a  onclick=\"ShowQRCode('" + row.PointId + "','" + row.PointCode + "','" + row.PointName + "','" + row.Addr + "');\" href=\"javascript:void(0);\">二维码</a>";
                        return value;
                    }
                },
                {
                    field: 'IsMustCheck', title: '是否必查', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.IsMustCheck == '1') {
                            str = "是";
                        } else {
                            str = "否";
                        }
                        return str;
                    }
                },
                {
                    field: 'sm', title: '是否扫码', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.DidTime != '') {
                            str = "是";
                        } else {
                            str = "否";
                        }
                        return str;
                    }
                },
                { field: 'DidUserName', title: '扫码人', width: 80, align: 'left', sortable: true },
                { field: 'DidTime', title: '扫码时间', width: 180, align: 'left', sortable: true },
                {
                    field: 'xq', title: '任务对象/任务标准', width: 120, align: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" onclick=\"checkPatrolMsg('" + row.TaskId + "','" + row.TaskPointId + "');\">查看</a>";
                        return str;
                    }
                },
                {
                    field: 'fj', title: '任务附件', width: 80, align: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" onclick=\"OnFileList('" + row.TaskId + "','" + row.TaskPointId + "');\">查看附件</a>";
                        return str;
                    }
                },
                {
                    field: 'IncidentCount', title: '整改工单', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" onclick=\"TaskPointIncident('" + row.TaskPointId + "','" + row.TaskId + "');\">" + value + "</a>";
                        return str;
                    }
                },
                {
                    field: 'PointState', title: '点位状态', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.PointState == '1') {
                            str = "已完成";
                        } else {
                            str = "未完成";
                        }
                        return str;
                    }
                }]];

            //查看附件
            function OnFileList(TaskId, TaskPointId) {
                HDialog.Open(600, 450, '../ComprehensivePatrols/ComprehensivePatrolsFiles_Safe.aspx?TaskId=' + TaskId + "&TaskPointId=" + TaskPointId, '查看附件', true, function callback(_Data) {
                });
            }
            //查看对象/标准
            function checkPatrolMsg(TaskId, TaskPointId) {
                HDialog.Open('900', '600', '../ComprehensivePatrols/CpPlanTaskStandard_Safe.aspx?TaskPointId=' + TaskPointId + "&TaskId=" + TaskId + "&CommId=" + $("#CommId").val(),
                    '对象/标准', true, function callback(_Data) {
                    });
            }
            //查看二维码
            function ShowQRCode(pointId, pointCode, pointName, addr) {
                HDialog.Open('360', '400', '../ComprehensivePatrols/PointShowQrCode_Safe.aspx?PointId=' + pointId + "&PointCode=" + escape(pointCode) + "&PointName=" + escape(pointName) + "&Addr=" + escape(addr), '查看二维码', true, function callback(_Data) {
                });
            }

            //查看计划轨迹
            function checkPlanTrajectory(TaskId, PlanId, CommId) {
                HDialog.Open('1100', '600', '../ComprehensivePatrols/TaskRouteFrame_Safe.aspx?TaskId=' + TaskId + '&PlanId=' + PlanId + '&CommId=' + CommId,
                    '查看计划路线/巡查轨迹', true, function callback(_Data) {
                    });
            }

            //查看地图
            function ShowMap(longitude) {
                HDialog.Open('700', '540', '../ComprehensivePatrols/PointShowMap_Safe.aspx?longitude=' + longitude, '查看地图', true, function callback(_Data) {
                });
            }
            //查看报事
            function TaskPointIncident(TaskPointId, TaskId) {
                HDialog.Open(800, 600, '../ComprehensivePatrols/TaskPointIncident_Safe.aspx?TaskPointId=' + TaskPointId + "&TaskId=" + TaskId + "&CommId=" + $("#CommId").val(), '查看报事', true, function callback(_Data) {
                });
            }

            function LoadList() {
                $("#CommId").val(localStorage.getItem('CpCommId'));
                $("#DivContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=GetCpPlanTaskList_Safe&Flag=未完成&' + $("#frmFrom").serialize(),
                    method: "get",
                    loadMsg: '',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    rownumbers: true,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: false,
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            $('#DivContainer').datagrid('selectRow', 0);
                        } else {
                            LoadListDetail("1");
                        }
                    }
                    , onSelect: function (rowIndex, rowData) {
                        $("#TaskId").val(rowData.TaskId);
                        $("#TaskRoleCode").val(rowData.TaskRoleCode);
                        LoadListDetail(rowData.TaskId);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function LoadListDetail(Id) {
                $("#DivContainerDetail").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '任务点位列表',
                    loadMsg: '',
                    nowrap: false,
                    singleSelect: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnDetail,
                    fitColumns: false,
                    pagination: true,
                    rownumbers: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    toolbar: toolbarDetail,
                    width: "100%",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param.Method = "DataPost";
                        param.Class = "CpComPatrols";
                        param.Command = "GetCpPlanTaskPointList_Safe";
                        param.TaskId = Id;
                        param.CommId = $("#CommId").val();
                    }
                });
            }
            function Load() {
                $("#isDesk").val(GetQueryString('isDesk'));
                InitTableHeight();
                LoadList();
                LoadTaskLevel();
            }
            $(document).ready(function () { Load(); });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
