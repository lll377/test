<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanQuery.aspx.cs" Inherits="M_Main.Plan.PlanQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>计划查询</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <input type="hidden" id="InitDType" name="InitDType" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="toolbar">
            <span style="vertical-align: middle;">
                <label style="cursor: pointer;">
                    <input type="radio" style="vertical-align: middle; cursor: pointer; margin-top: -2px; margin-bottom: 1px;" name="orderType" id="All1" value="0" checked="checked">全部   
                </label>
                <label style="cursor: pointer;">
                    <input type="radio" style="vertical-align: middle; cursor: pointer; margin-top: -2px; margin-bottom: 1px;" name="orderType" id="All2" value="1">月度计划   
                </label>
                <label style="cursor: pointer;">
                    <input type="radio" style="vertical-align: middle; cursor: pointer; margin-top: -2px; margin-bottom: 1px;" name="orderType" id="All3" value="2">季度计划   
                </label>
                <label style="cursor: pointer;">
                    <input type="radio" style="vertical-align: middle; cursor: pointer; margin-top: -2px; margin-bottom: 1px;" name="orderType" id="All4" value="3">年度计划   
                </label>
            </span>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="OpenSearch();">筛选</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" onclick="ExcelList();">导出Excel</a>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1200px; height: 260px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">计划单号</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 100%; height: 20px;" id="PlanNo" name="PlanNo" /></td>
                    <td class="TdTitle">计划周期</td>
                    <td class="TdContent">
                        <select id="PlanCycle" name="PlanCycle" runat="server" isdctype="true"
                            dctype="计划周期" style="width: 100%; border: 1px #cccccc solid;"
                            class="easyui-combobox " clientidmode="Static" data-options="multiple: true">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">责任部门</td>
                    <td class="TdContent">
                        <input id="BlameDepCode" name="BlameDepCode" class="easyui-validatebox" runat="server" onclick="SelDepart();" style="border: 1px solid #cccccc; width: 100%" />
                        <input type="hidden" id="BlameDepCodeList" name="BlameDepCodeList" runat="server" />
                    </td>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContent">
                        <input id="UserName" name="UserName" runat="server" style="border: 1px solid #cccccc; width: 100%" />
                        <input type="hidden" id="UserCode" name="UserCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 100%; height: 20px;" id="PlanName" name="PlanName" /></td>
                    <td class="TdTitle">计划类型</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" style="width: 100%;" type="text" id="PlanType" name="PlanType" runat="server" />
                        <input type="hidden" id="PlanTypeID" name="PlanTypeID" runat="server" />
                    </td>

                    <td class="TdTitle">协助人</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 100%; height: 20px;" id="AssistMan" name="AssistMan" /></td>
                    <td class="TdTitle">计划来源</td>
                    <td class="TdContent">
                        <select id="PlanSource" name="PlanSource" runat="server" isdctype="true"
                            dctype="计划来源" style="width: 100%; border: 1px #cccccc solid;"
                            class="easyui-combobox" clientidmode="Static" data-options="multiple: true">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划开始时间从</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="PlanStartTime" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="PlanStartTime" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="PlanStartTime1" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="PlanStartTime1" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>

                    <td class="TdTitle">计划结束时间从</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="PlanEndTime" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="PlanEndTime" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="PlanEndTime2" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="PlanEndTime2" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">实施时间从</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="ActualStartTime" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ActualStartTime" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="ActualStartTime1" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ActualStartTime1" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>

                    <td class="TdTitle">实施结束时间从</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="ActualEndTime" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ActualEndTime" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="ActualEndTime2" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ActualEndTime2" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否关闭</td>
                    <td class="TdContent">
                        <select style="width: 100%; border: 1px #cccccc solid;" id="IsClose">
                            <option></option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                    <td class="TdTitle">计划主题</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 100%; height: 20px;" id="PlanTheme" name="PlanTheme" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清除条件</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="RadioValue" name="RadioValue" value="0" runat="server" />
    </form>

    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">
        //加载字典设置
        function LoadDictionary() {
            $("select[isdctype='true']").each(function (i) {
                var nId = $(this).attr("id");
                $.tool.DataPostAsync('CsPlan', 'BindDictionary', 'DcTypeName=' + $(this).attr("dctype"),
                    function Init() {
                    },
                    function callback(_Data) {

                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var option = "<option value=''></option>";
                        $("#" + nId).append(option);
                        for (var i = 0; i < varObjects.length; i++) {
                            var option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                            $("#" + nId).append(option);
                        }
                        //$("#CheckTypeName").val($("#CheckType").val());
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            });
        }
        LoadDictionary();

        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h - 2 + "px");
            $('input[type=radio][name=orderType]').click(function () {
                $('#RadioValue').val($(this).val());
                LoadList();
            });
        }
        InitTableHeight();

        var frozenColumns = [[
            { field: 'PlanId', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
            {
                field: 'PlanNO', title: '计划单号', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<span style=\"color:darkblue;\"><a class=\"HrefStyle\" href=\"\" onclick=\"Edit('" + row.PlanId + "')\">" + row.PlanNO + "</a></span>";
                    return str;
                }
            }
        ]];

        var column = [[
            { field: 'PlanTheme', title: '计划主题', width: 120, align: 'left', sortable: true },
            { field: 'Name', title: '计划周期', width: 80, align: 'left', sortable: true },
            { field: 'SourceName', title: '计划来源', width: 80, align: 'left', sortable: true },
            { field: 'TypeName', title: '计划类型', width: 80, align: 'left', sortable: true },
            { field: 'PlanName', title: '计划名称', width: 200, align: 'left', sortable: true },
            {
                field: 'PlanStartTime', title: '计划开始时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'PlanEndTime', title: '计划结束时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanEndTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ActualStartTime', title: '实施开始时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ActualStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ActualEndTime', title: '实施结束时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ActualEndTime, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'Target', title: '计划目标', width: 200, align: 'left', sortable: true },
            { field: 'ActualTarget', title: '累计完成目标', width: 200, align: 'left', sortable: true },
            { field: 'PlanCost', title: '计划费用（元）', width: 80, align: 'left', sortable: true },
            { field: 'ActualCost', title: '累计完成费用（元）', width: 80, align: 'left', sortable: true },
            { field: 'Point', title: '所占分值', width: 80, align: 'left', sortable: true },
            { field: 'ActualPoint', title: '累计所得分值', width: 80, align: 'left', sortable: true },
            { field: 'GetCost', title: '所占金额（元）', width: 80, align: 'left', sortable: true },
            { field: 'ActualGetCost', title: '累计所得金额（元）', width: 80, align: 'left', sortable: true },
            { field: 'username', title: '责任人', width: 60, align: 'left', sortable: true },
            { field: 'BlameDepCode', title: '责任部门', width: 80, align: 'left', sortable: true },
            { field: 'AssistMan', title: '协助人', width: 60, align: 'left', sortable: true },
            { field: 'IsClose', title: '是否关闭', width: 80, align: 'left', sortable: true },
        ]];

        function Edit(PlanId) {
            HDialog.Open('1100', '650', '../Plan/PlanImplement_List.aspx?OpType=edit&PlanId=' + PlanId, '计划列表', true, function callback(_Data) {
                LoadList();
            });
            LoadList();
        }
        function OpenSearch() {
            $('#SearchDlg').parent().appendTo($("form:first"))
            $('#SearchDlg').dialog('open');
            Clear();
        }
        function ExcelList() {
            var rowData = $('#TableContainer').datagrid('getData');
            if (rowData == '') {
                HDialog.Info('请先生成报表');
            }
            else {
                Export('计划查询Excel', $('#TableContainer'));
            }
        }
        var toolbar = [
            //{
            //    text: '筛选',
            //    iconCls: 'icon-filter',
            //    handler: function () {
            //        $('#SearchDlg').parent().appendTo($("form:first"))
            //        $('#SearchDlg').dialog('open');
            //    }
            //},
            //'-',
            //{
            //    text: '导出标准',
            //    iconCls: 'icon-page_white_excel',
            //    handler: function () {
            //        var rowData = $('#TableContainer').datagrid('getData');
            //        if (rowData == '') {
            //            HDialog.Info('请先生成报表');
            //        }
            //        else {
            //            Export('计划查询Excel', $('#TableContainer'));
            //        }
            //    }
            //}
        ];

        var Headcolumn = [[
            {
                field: 'PlanNO', title: '计划单号', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<span style=\"color:darkblue;\"><a class=\"HrefStyle\" href=\"\" onclick=\"Edit('" + row.PlanId + "')\">" + row.PlanNO + "</a></span>";
                    return str;
                }
            },
            { field: 'Name', title: '计划周期', width: 60, align: 'left', sortable: true },
            { field: 'SourceName', title: '计划来源', width: 60, align: 'left', sortable: true },
            { field: 'TypeName', title: '计划类型', width: 60, align: 'left', sortable: true },
            { field: 'PlanName', title: '计划名称', width: 200, align: 'left', sortable: true },
            { field: 'PlanTheme', title: '计划主题', width: 100, align: 'left', sortable: true },
            {
                field: 'PlanStartTime', title: '计划开始时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'PlanEndTime', title: '计划结束时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ActualStartTime', title: '实施开始时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ActualEndTime', title: '实施结束时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'Target', title: '计划目标', width: 200, align: 'left', sortable: true },
            { field: 'ActualTarget', title: '累计完成目标', width: 200, align: 'left', sortable: true },
            { field: 'PlanCost', title: '计划费用（元）', width: 80, align: 'left', sortable: true },
            { field: 'ActualCost', title: '累计完成费用（元）', width: 80, align: 'left', sortable: true },
            { field: 'Point', title: '所占分值', width: 80, align: 'left', sortable: true },
            { field: 'ActualPoint', title: '累计所得分值', width: 80, align: 'left', sortable: true },
            { field: 'GetCost', title: '所占金额（元）', width: 80, align: 'left', sortable: true },
            { field: 'ActualGetCost', title: '累计所得金额（元）', width: 80, align: 'left', sortable: true },
            { field: 'username', title: '责任人', width: 60, align: 'left', sortable: true },
            { field: 'BlameDepCode', title: '责任部门', width: 80, align: 'left', sortable: true },
            { field: 'AssistMan', title: '协助人', width: 60, align: 'left', sortable: true },
            { field: 'IsClose', title: '是否关闭', width: 30, align: 'left', sortable: true }
        ]
        ];
        var ExcelCol = [
            {
                field: 'PlanNO', title: '计划单号', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<span style=\"color:darkblue;\"><a class=\"HrefStyle\" href=\"\" onclick=\"Edit('" + row.PlanId + "')\">" + row.PlanNO + "</a></span>";
                    return str;
                }
            },
            { field: 'Name', title: '计划周期', width: 60, align: 'left', sortable: true },
            { field: 'SourceName', title: '计划来源', width: 60, align: 'left', sortable: true },
            { field: 'TypeName', title: '计划类型', width: 60, align: 'left', sortable: true },
            { field: 'PlanName', title: '计划名称', width: 200, align: 'left', sortable: true },
            { field: 'PlanTheme', title: '计划主题', width: 100, align: 'left', sortable: true },
            {
                field: 'PlanStartTime', title: '计划开始时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'PlanEndTime', title: '计划结束时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ActualStartTime', title: '实施开始时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ActualEndTime', title: '实施结束时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'Target', title: '计划目标', width: 200, align: 'left', sortable: true },
            { field: 'ActualTarget', title: '累计完成目标', width: 200, align: 'left', sortable: true },
            { field: 'PlanCost', title: '计划费用（元）', width: 80, align: 'left', sortable: true },
            { field: 'ActualCost', title: '累计完成费用（元）', width: 80, align: 'left', sortable: true },
            { field: 'Point', title: '所占分值', width: 80, align: 'left', sortable: true },
            { field: 'ActualPoint', title: '累计所得分值', width: 80, align: 'left', sortable: true },
            { field: 'GetCost', title: '所占金额（元）', width: 80, align: 'left', sortable: true },
            { field: 'ActualGetCost', title: '累计所得金额（元）', width: 80, align: 'left', sortable: true },
            { field: 'username', title: '责任人', width: 60, align: 'left', sortable: true },
            { field: 'BlameDepCode', title: '责任部门', width: 80, align: 'left', sortable: true },
            { field: 'AssistMan', title: '协助人', width: 60, align: 'left', sortable: true },
            { field: 'IsClose', title: '是否关闭', width: 30, align: 'left', sortable: true }
        ];

        function Export(strXlsName, exportGrid) {
            var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
            var l = $('<input type="hidden" id="txtName" name="txtName" />');
            i.val(ChangeToTable3(exportGrid, Headcolumn, ExcelCol));
            i.appendTo(f);
            l.val(strXlsName);
            l.appendTo(f);
            f.appendTo(document.body).submit();
            document.body.removeChild(f);
        }

        function GetParam() {
            var str = 'r=1';

            var PlanCycleArr = $("input:hidden[name='PlanCycle']");
            var PlanCycle = '';
            $.each(PlanCycleArr, function (index, item) {
                PlanCycle += ',' + item.value;
            });
            if (PlanCycle.length > 0);
            {
                str += '&PlanCycle=' + PlanCycle.substr(1, PlanCycle.length - 1)
            }

            var PlanSourceArr = $("input:hidden[name='PlanSource']");
            var PlanSource = '';
            $.each(PlanSourceArr, function (index, item) {
                PlanSource += ',' + item.value;
            });
            if (PlanSource.length > 0);
            {
                str += '&PlanSource=' + PlanSource.substr(1, PlanSource.length - 1)
            }

            return encodeURI(str);
        }

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx?' + GetParam() + $("#frmForm").serialize(),
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                selectOnCheck: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                rownumbers: true,
                frozenColumns: frozenColumns,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                width: "100%",
                border: false,
                toolbar: "#toolbar",
                sortOrder: "desc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CsPlan", "GetQueryList", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                }
            });
        }

        $('#SearchDlg').parent().appendTo($("form:first"));

        if ($("#InitDType").val() != "") {
            $("#PlanType").val($("#InitDType").val());
        }
        LoadList();

        function ClearWhere() {
            $("#PlanNo").val("");
            $("#PlanCycle").val("");
            $("#RoleCodeName").val("");
            $("#UserName").val("");
            $("#PlanName").val("");
            $("#PlanType").val("");
            $("#AssistMan").val("");
            $("#PlanSource").val("");
            $("#PlanStartTime").val("");
            $("#PlanStartTime1").val("");
            $("#PlanEndTime").val("");
            $("#PlanEndTime2").val("");
            $("#ActualStartTime").val("");
            $("#ActualStartTime1").val("");
            $("#ActualEndTime").val("");
            $("#ActualEndTime2").val("");
            $("#IsClose").val("");
            $("#BlameDepCode").val("");
            $("#BlameDepCodeList").val("");
            $("#UserCode").val("");
            $("#PlanTheme").val("");
            $("#PlanTypeID").val("");
        }

        //选择部门
        function SelDepart() {
            HDialog.Open('400', '403', "../dialog/DepartmentDlgNew_hr.aspx?Ram=" + Math.random(), '选择责任部门', false, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    var varObjects = _Data.split("~");
                    var varDepObj = "";
                    var depName = "";
                    var depCode = "";
                    var depCode = "";
                    for (var i = 0; i < varObjects.length; i++) {
                        varDepObj = varObjects[i].split('\t');
                        depName += varDepObj[2] + ",";
                        depCode += "'" + varDepObj[0] + "',";
                    }
                    depName = depName.substr(0, depName.length - 1);
                    depCode = depCode.substr(0, depCode.length - 1);
                    $("#BlameDepCode").val(depName);
                    $("#BlameDepCodeList").val(depCode);
                }
            });
        }

        //责任人
        function SelUserSer() {
            HDialog.Open('740', '450', '../Plan/MultiselectPersons.aspx', '选择人员', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    var ManObject = "";
                    var username = "";
                    var usercode = "";
                    var objects = _Data.split("|");
                    for (var i = 0; i < objects.length; i++) {
                        ManObject = objects[i].split(",");
                        usercode += "'" + ManObject[0] + "',";
                        username += ManObject[1] + ",";
                    }
                    username = username.substring(10, username.length - 1);
                    usercode = usercode.substring(3, usercode.length - 1);

                    $("#UserCode").val(usercode);
                    $("#UserName").val(username);
                }
            });
        }

        //选择计划类型
        $('#PlanType').click(function () {
            HDialog.Open('500', '500', '../Plan/SelPlanType.aspx', '选择计划类型', true, function callback(_Data) {
                if (_Data != '') {
                    var arrRet = _Data.split(',');
                    $("#PlanTypeID").val(arrRet[0]);
                    $("#PlanType").val(arrRet[1]);
                }
            });
        });

    </script>
</body>
</html>
