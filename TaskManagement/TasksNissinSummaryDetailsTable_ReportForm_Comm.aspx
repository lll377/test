<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TasksNissinSummaryDetailsTable_ReportForm_Comm.aspx.cs" Inherits="M_Main.TaskManagement.TasksNissinSummaryDetailsTable_ReportForm_Comm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>任务日清明细表</title>
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
    <input type="hidden" name="IsSumOrDetail" id="IsSumOrDetail" value="0" />
    <input type="hidden" name="PointID" id="PointID" value="-1" />
    <input type="hidden" name="SysPointId" id="SysPointId" value="-1" />

    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div id="layout_center" data-options="region:'center',border:true,title:'  ',">
            <div class="datagrid-toolbar" id="divtt">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <a href="javascript:void(0)" onclick=" JavaScript: SearchData();" class="l-btn l-btn-small l-btn-plain" group="" id="">
                                <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">刷新数据</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                        </td>
                        <td>
                            <div class="datagrid-btn-separator"></div>
                        </td>
                        <td>
                            <span class="l-btn-text">任务类型</span>
                        </td>
                        <td>
                            <select id="TaskType" class="easyui-combobox" name="TaskType" data-options="multiple:true,panelHeight:'auto',editable:false" style="width: 150px;">
                                <option selected="selected" style='color: #8a8a8a' value=""></option>
                                <option value="1" style="color: #000000">报事工单</option>
                                <%--<option value="2" style="color: #000000">客户拜访</option>
                                <option value="3" style="color: #000000">公区巡查</option>
                                <option value="4" style="color: #000000">装修巡查</option>
                                <option value="5" style="color: #000000">空房巡查</option>--%>
                                <option value="6" style="color: #000000">设备巡检</option>
                                <option value="7" style="color: #000000">设备维保</option>
                                <%--<option value="8" style="color: #000000">分户查验</option>--%>
                                <option value="9" style="color: #000000">安全巡更</option>
                                <option value="10" style="color: #000000">消防巡检</option>
                                <option value="11" style="color: #000000">环境保洁</option>
                                <option value="12" style="color: #000000">绿化防护</option>
                                <option value="13" style="color: #000000">四害消杀</option>
                                <option value="14" style="color: #000000">垃圾清运</option>
                                <option value="15" style="color: #000000">品质核查</option>
                                <option value="16" style="color: #000000">品质整改</option>
                                <option value="17" style="color: #000000">物管费往年清欠</option>
                                <option value="18" style="color: #000000">物管费本年收款</option>
                            </select>&nbsp;
                        </td>
                        <td>
                            <div class="datagrid-btn-separator"></div>
                        </td>

                        <td>
                            <a href="javascript:void(0)" onclick=" JavaScript: LoadListSpace('1')" class="l-btn l-btn-small l-btn-plain" group="" id="">
                                <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">显示明细</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                        </td>
                        <td>
                            <div class="datagrid-btn-separator"></div>
                        </td>
                        <td>
                            <a href="javascript:void(0)" onclick=" JavaScript: LoadListSpace('2')" class="l-btn l-btn-small l-btn-plain" group="" id="">
                                <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">显示汇总</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                        </td>
                        <td>
                            <div class="datagrid-btn-separator"></div>
                        </td>
                        <td>
                            <a href="javascript:void(0)" onclick=" JavaScript: ListSpace_Excel()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                                <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导出excel</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a>
                        </td>
                    </tr>
                </table>
            </div>
            <table id="tgSpace" border="0" cellspacing="0" cellpadding="0"></table>
            <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
            <div class="datagrid-mask-msg" style='font-size: 12px; height: 75px; border: 1px solid #cccccc; z-index: 999999;'>
                <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
                <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
            </div>
        </div>
    </div>
    <div id="dlg_search_space" class="easyui-dialog" title="筛选" style="width: 800px; height: 200px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmPoint">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="TdTitle">截止时间</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" id="YearMonth" name="YearMonth" style="width: 150px;" runat="server" class="Wdate"
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
            LoadListSpace("2");
            $('#TaskType').combobox('clear');
            var btnLoadSchedule = '<a href="javascript:void(0)" onclick="JavaScript: SearchData()" class="l-btn l-btn-small l-btn-plain" group="" id=""> '
                + '   <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">统计数据</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>';
            $('#layout_center').panel('setTitle', '统计截止时间：' + GetDate());
        });
        function TaskTypeChange() {
            if ($("#TaskType").val() == "") {
                $("#TaskType").css('color', '#8a8a8a');
            } else {
                $("#TaskType").css('color', '#000000');
            }
            // alert($("#TaskType").val());
            //$("#TaskType").val($("#TaskType").val());
        }
        function GetDate() {
            var dateTime = new Date();
            dateTime = dateTime.setDate(dateTime.getDate() - 1);
            dateTime = new Date(dateTime);
            var Month = parseInt(dateTime.getMonth()) + parseInt(1)
            var date = dateTime.getFullYear() + '-' + Month + '-' + dateTime.getDate() + ' 23:59:59';
            return date;
        }

        function ListSpace_Excel() {
            window.open("TaskManagement_ReportForm_Export.aspx?ReportFormName=TasksNissinSummaryDetailsTable&TaskManagement_Type=1&OrganCode=" + $("#OrganCode").val() +
                "&CommID=" + $("#CommID").val() +
                "&TaskType=" + $("#TaskType").val() +
                "&IsSumOrDetail=" + $("#IsSumOrDetail").val());
        }

        function InitTableHeight() {
            var h = $(window).height();
            var w = $(window).width();
            $("#tgSpace").css("height", h - 60 + "px");
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
        //项目名称	机构	岗位	姓名	任务类型	昨日完成任务数	昨日完成工时数	昨日逾期任务数	昨日任务报事数	今日待办任务数	今日到期任务数
        var columnSpace = [[
            //{
            //    field: 'CommName', title: '项目名称', width: 200, align: 'left', formatter: function (value, row, index) {
            //        return value == "" ? "—" : value;
            //    }
            //},
            //{
            //    field: 'DepName', title: '机构', width: 140, align: 'left', formatter: function (value, row, index) {
            //        var valueShow = value == "" ? "—" : value;
            //        //if (valueShow != "-") {
            //        //    valueShow = value.split('--')[value.split('--').length - 2] + '—' + value.split('--')[value.split('--').length - 1];
            //        //}
            //        return valueShow;
            //    }
            //},
            {
                field: 'RoleName', title: '岗位', width: 140, align: 'left', formatter: function (value, row, index) {
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'UserName', title: '姓名', width: 80, align: 'left', formatter: function (value, row, index) {
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'TaskType', title: '任务类型', width: 100, align: 'left', formatter: function (value, row, index) {
                    return value == "" ? "—" : value;
                }
            },
            {
                field: 'LastDayCompleteNum', title: '昨日完成任务数', width: 140, resizable: true, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskType != '物管费往年清欠' && row.TaskType != '物管费本年收款' && value >= 0 && value != '') {
                        value = value == '0.00' || value == '0' ? '0' : parseInt(value);
                    }
                    return value.toString() == "" ? "—" : value;
                }
            },
            {
                field: 'LastDayCompleteHours', title: '昨日完成工时数', width: 100, resizable: true, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskType != '物管费往年清欠' && row.TaskType != '物管费本年收款' && value >= 0 && value != '' && value != null) {
                        value = value == '0.00' || value == '0' ? '0' : parseInt(value);
                    }
                    return value == "" ? "—" : value;
                }
            }, {
                field: 'LastDayOverDueNum', title: '昨日逾期任务数', width: 100, resizable: true, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskType != '物管费往年清欠' && row.TaskType != '物管费本年收款' && value >= 0 && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "<span style='color:#FE2E2E;'>—</span>" : "<span style='color:#FE2E2E;'>" + value + "</span>";
                }
            }, {
                field: 'LastDayIncidentNum', title: '昨日任务报事数', width: 100, resizable: true, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskType != '物管费往年清欠' && row.TaskType != '物管费本年收款' && value >= 0 && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "—" : value;
                }
            }, {
                field: 'ThisDayWaitNum', title: '今日待办任务数', width: 140, resizable: true, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskType != '物管费往年清欠' && row.TaskType != '物管费本年收款' && value >= 0 && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "—" : value;
                }
            }, {
                field: 'ThisDayExpireNum', title: '今日到期任务数', width: 100, resizable: true, align: 'left', formatter: function (value, row, index) {
                    if (row.TaskType != '物管费往年清欠' && row.TaskType != '物管费本年收款' && value >= 0 && value != '') {
                        value = value == '0.00' ? '0' : parseInt(value);
                    }
                    return value == "" ? "<span style='color:#FE2E2E;'>—</span>" : "<span style='color:#FE2E2E;'>" + value + "</span>";
                }
            }
        ]];

        function GetLastDayCompleteNum(row) {
            var valueShow = "-";
            if (row.LastDayCompleteNum1 != "") {
                switch (row.TaskType) {
                    case "报事工单":
                        valueShow = "全部：" + row.LastDayCompleteNum1;
                        break;
                    case "公区巡查":
                        valueShow = "点位：" + row.LastDayCompleteNum1;
                        break;
                    case "装修巡查":
                    case "空房巡查":
                    case "客户拜访":
                    case "分户查验":
                        valueShow = "户数：" + row.LastDayCompleteNum1;
                        break;
                    case "设备巡检":
                    case "设备维保":
                        valueShow = "设备：" + row.LastDayCompleteNum1;
                        break;
                    case "安全巡更":
                    case "消防巡检":
                    case "环境保洁":
                    case "绿化防护":
                    case "四害消杀":
                    case "垃圾清运":
                    case "品质核查":
                        valueShow = "点位：" + row.LastDayCompleteNum1;
                        break;
                    case "品质整改":
                        valueShow = "项目：" + row.LastDayCompleteNum1;
                        break;
                    case "物管费往年清欠":
                    case "物管费本年收款":
                        valueShow = "户数：" + row.LastDayCompleteNum1;
                        break;
                }
            }
            if (row.LastDayCompleteNum2 != "") {
                if (valueShow != "") { valueShow += "<br/> <hr style='height:1px;border:none;border-top:1px dashed #ccc;' /> " }
                switch (row.TaskType) {
                    case "报事工单":
                        valueShow += "投诉：" + row.LastDayCompleteNum2;
                        break;
                    case "客户拜访":
                    case "公区巡查":
                    case "装修巡查":
                    case "空房巡查":
                    case "设备巡检":
                    case "设备维保":
                    case "分户查验":
                    case "安全巡更":
                    case "消防巡检":
                    case "环境保洁":
                    case "绿化防护":
                    case "四害消杀":
                    case "垃圾清运":
                    case "品质核查":
                    case "品质整改":
                        valueShow += "任务：" + row.LastDayCompleteNum2;
                        break;
                    case "物管费往年清欠":
                    case "物管费本年收款":
                        valueShow += "金额：" + row.LastDayCompleteNum2;
                        break;
                }

            }
            return valueShow;
        }

        var ProgressInterval;
        //显示进度
        function ShowProgress() {
            var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
            var ht = parseInt($(window).scrollTop());
            $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
            $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
        }
        //关闭进度
        function CloseProgress() {
            clearInterval(ProgressInterval);
            $(".datagrid-mask").hide();
            $(".datagrid-mask-msg").hide();
        }
        //设置进度
        function SetProgress(Curr, MessageInfo) {
            $('#DivProgressBar').progressbar('setValue', Curr);
            $('#DivMsg').html(MessageInfo);
        }
        function SearchData() {
            $.tool.DataPostNoLoading('TaskManagement', 'GetTaskManagement_ScheduleCount', 'ScheduleCount=50',
                function Init() {
                },
                function callback(Data) {
                    var retData = Data.split('|');
                    if (retData[0] == 'true') {
                        if (retData[1] == "1") {
                            LoadListSpace('0');
                            //展示进度
                            ShowProgress();
                            //获取执行情况进度  
                            ProgressInterval = setInterval("LoadSchedule()", 2000);
                        }
                        else {
                            $.messager.alert('温馨提示', '当前查询数据源过多，【' + retData[2] + '】项目，请稍后!');
                            return;
                        }

                    } else {
                        $.messager.alert('温馨提示', '获取数据异常【' + retData[1] + '】!');
                        CloseProgress();
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });


        }

        function LoadSchedule() {
            var ScheduleType = "Proc_TaskManagement_DailyDetailTable";
            $.tool.DataPostNoLoading('TaskManagement', 'GetTaskManagement_Schedule', 'ScheduleType=' + ScheduleType + '&Isload=',
                function Init() {
                },
                function callback(Data) {
                    var retData = Data.split('|');
                    if (retData[0] == 'true') {
                        if (retData[1] != "6") {
                            switch (retData[1]) {
                                case '1':
                                    SetProgress(20, '数据初始化完成，品质巡查各数据查询中，请稍后...');
                                    break;
                                case '2':
                                    SetProgress(40, '品质巡查各数据查询完成，拜访数据查询中，请稍后...');
                                    break;
                                case '3':
                                    SetProgress(60, '拜访数据查询完成，报事数据查询中，请稍后...');
                                    break;
                                case '4':
                                    SetProgress(80, '报事数据查询完成，收费数据查询中，请稍后...');
                                    break;
                                case '5':
                                    SetProgress(90, '收费数据查询完成，请稍后...');
                                    break;
                                case '-99':
                                    SetProgress(10, '数据初始化中，请稍后...');
                                    break;
                            }
                        } else {
                            SetProgress(100, '统计完成');
                            CloseProgress();
                            LoadListSpace("2");
                        }

                    } else {
                        $.messager.alert('温馨提示', '获取数据异常【' + retData[1] + '】!');
                        CloseProgress();
                    }

                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        }
        //默认加载
        function LoadtgSpacePage() {
            var initData =
            {
                "code": 100,
                "msg": "",
                "data": { "total": 0, "rows": [{ "ID": "", "CommName": "", "DepName": "", "RoleName": "", "UserName": "", "UserCode": "", "TaskType": "", "TaskTypeCode": "", "LastDayCompleteNum": "", "LastDayCompleteNum1": "", "LastDayCompleteNum2": "", "LastDayCompleteHours": "", "LastDayOverDueNum": "", "LastDayIncidentNum": "", "ThisDayWaitNum": "", "ThisDayExpireNum": "" }] }
            };
            $("#tgSpace").datagrid({
                loadData: initData,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: columnSpace,
                pageNumber: 0,
                pageSize: 0,
                pageList: [50, 100],
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                remoteSort: false,
                onLoadSuccess: function (data) {
                    $("#tgSpace").datagrid("autoMergeCells", ['DepName', 'RoleName', 'UserName']);
                }
            });
            //   $("#tgSpace").datagrid("loadMsg","");

            $('#tgSpace').datagrid('clearSelections');
            $("#dlg_search_space").dialog("close");

        }

        function LoadListSpace(IsSumOrDetail) {
            if (IsSumOrDetail == "3") {
                LoadtgSpacePage();
                return;
            }
            if (IsSumOrDetail != "") {
                $("#IsSumOrDetail").val(IsSumOrDetail);
            }
            $("#tgSpace").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                loadMsg: "",
                columns: columnSpace,
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("TaskManagement", "GetTasksNissinSummaryDetailsTableList", "tgSpace", param);
                },
                onLoadSuccess: function (data) {
                    $("#tgSpace").datagrid("autoMergeCells", ['DepName', 'RoleName', 'UserName']);
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
