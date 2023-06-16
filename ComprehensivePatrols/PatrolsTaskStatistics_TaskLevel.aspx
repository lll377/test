<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatrolsTaskStatistics_TaskLevel.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PatrolsTaskStatistics_TaskLevel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>巡查任务统计表</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
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

        .TdContentSearch select {
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
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
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 230px; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="easyui-validatebox" id="CommName" name="CommName" readonly="readonly" onclick="SelComm();" style="border: 1px #cccccc solid; width: 580px; height: 50px;" />
                        <input type="hidden" id="CommId" name="CommId" value="" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">任务类型</td>
                    <td class="TdContentSearch">
                        <select id="TypeId" name="TypeId" isdctype='true' dctype="任务类型" dcname="公区巡查,空房巡查,装修巡查" class="easyui-validatebox" style="width: 98%;" onchange="bindLevel();">
                        </select>
                    </td>
                    <td class="TdTitle">任务级别</td>
                    <td class="TdContentSearch">
                        <select id="LevelId" name="LevelId" runat="server" class="easyui-combobox" data-options="editable:false,multiple: true,panelHeight:'auto',valueField:'id',textField:'text'" style="width: 98%;">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">统计时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BeginTime" name="BeginTime" runat="server" style="border: 1px solid #cccccc; width: 120px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">-</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EndTime" name="EndTime" runat="server" style="border: 1px solid #cccccc; width: 120px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" />
                    </td>
                </tr>
                <tr>
                    <td class="TdContentSearch" colspan="4" style="text-align: center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList('1');">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',width:80" onclick="btnClear();">重置</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="TaskName" name="TaskName" value="巡查任务统计表" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            $(function () {
                bindLevel();
            });

            function bindLevel() {
                $.tool.DataPostNoLoading('CpComPatrols', 'GetPatrolLevelList', 'page=1&rows=10000&TaskTypeName=公区巡查,空房巡查,装修巡查&TypeId=' + $("#TypeId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Objects = eval("(" + _Data.replace(/\\/g, "/") + ")").rows; //转换为json对象s
                        var datajosn = [];
                        for (var i = 0; i < Objects.length; i++) {
                            datajosn.push({ id: Objects[i].LevelId, text: Objects[i].TaskLevelName });
                        }
                        $("#LevelId").combobox('clear');
                        $("#LevelId").combobox('loadData', datajosn);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }

            function btnClear() {
                $("#CommId").val("");
                $("#CommName").val("");
                $("#TypeId").val("");
                $("#LevelId").combobox('clear');
                $('#StartTime').val("");
                $('#EndTime').val("");
            }

            function SelComm() {
                HDialog.Open('700', '500', '../ComprehensivePatrols/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            //列冻结
            var frozenColumns = [[
                { field: 'OrganCompName', title: '片区', width: 150, align: 'left', sortable: true },
                { field: 'OrganName', title: '区域', width: 150, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'left', sortable: true }

            ]];

            var column = [[
                { field: 'CommNum', title: '项目数量', width: 120, align: 'left', sortable: true },
                { field: 'LevelName', title: '核查级别', width: 150, align: 'left', sortable: true },
                { field: 'TaskNum', title: '计划任务数', width: 120, align: 'left', sortable: true },
                { field: 'CloseTaskNum', title: '关闭任务数', width: 120, align: 'left', sortable: true },
                { field: 'PlanTaskNum', title: '应查任务数', width: 120, align: 'left', sortable: true },
                { field: 'CompleteTaskNum', title: '完成任务数', width: 120, align: 'left', sortable: true },
                { field: 'CompleteRate', title: '任务完成率（%）', width: 120, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-', {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid("getRows");
                        if (rows.length == 0) {
                            HDialog.Info("请先生成报表");
                            return;
                        }
                        //window.open("CpReportExcel.aspx?CommId=" + $('#CommId').val() + '&TypeId=' + $("#TypeId").val() + '&LevelId=' + $("#LevelId").combobox('getValues') + '&BeginTime=' + $('#BeginTime').val() + '&EndTime=' + $('#EndTime').val() + '&TaskName=' + $('#TaskName').val());
                        var formData = new FormData();
                        formData.append("CommId", $('#CommId').val());
                        formData.append("TypeId", $('#TypeId').val());
                        formData.append("LevelId", $("#LevelId").combobox('getValues'));
                        formData.append("BeginTime", $('#BeginTime').val());
                        formData.append("EndTime", $('#EndTime').val());
                        formData.append("TaskName", $('#TaskName').val());
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
                }
            ];

            function LoadList(str) {
                var urls = null;
                if (str != "") {
                    urls = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CpComPatrols&Command=PatrolsTaskStatistics_TaskLevel&' + $("#frmForm").serialize();
                    if ($("#TypeId").val() == "" || $("#TypeId").val() == null) {
                        HDialog.Info("请选择任务类型");
                        return;
                    }
                    if ($("#CommId").val() == "" || $("#CommId").val() == null) {
                        HDialog.Info("请选择查询项目");
                        return;
                    }
                    if ($("#BeginTime").val() == "" || $("#BeginTime").val() == null) {
                        HDialog.Info("开始时间必选");
                        return;
                    }
                    if ($("#EndTime").val() == "" || $("#EndTime").val() == null) {
                        HDialog.Info("结束时间必选");
                        return;
                    }
                    if ($("#BeginTime").val() > $("#EndTime").val()) {
                        HDialog.Info("开始时间应小于结束时间");
                        return;
                    }
                    if (getDays($("#BeginTime").val(), $("#EndTime").val()) > 366) {
                        HDialog.Info("只能查询一年内的报表数据");
                        return;
                    }
                }
                $("#TableContainer").datagrid({
                    //url: urls,
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    //method: "get",
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    remoteSort: false,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function () {
                        $("#TableContainer").datagrid("autoMergeCells", ['OrganCompName', 'OrganName', 'CommName']);
                    },
                    onBeforeLoad: function (param) {
                        if (str != "") {
                            param = $.JQForm.GetParam("CpComPatrols", "PatrolsTaskStatistics_TaskLevel", "TableContainer", param);
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
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
            LoadList("");

            function getDays(strDateStart, strDateEnd) {
                var strSeparator = "-"; //日期分隔符
                var oDate1;
                var oDate2;
                var iDays;
                oDate1 = strDateStart.split(strSeparator);
                oDate2 = strDateEnd.split(strSeparator);
                var strDateS = new Date(oDate1[0], oDate1[1] - 1, oDate1[2]);
                var strDateE = new Date(oDate2[0], oDate2[1] - 1, oDate2[2]);
                iDays = parseInt(Math.abs(strDateS - strDateE) / 1000 / 60 / 60 / 24)//把相差的毫秒数转换为天数
                return iDays;
            }
        </script>
    </form>
</body>
</html>
