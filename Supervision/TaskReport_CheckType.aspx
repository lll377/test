<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskReport_CheckType.aspx.cs" Inherits="M_Main.Supervision.TaskReport_CheckType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>品质督查任务统计-按检查类型</title>
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
            style="width: 700px; height: 185px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">项目名称:</td>
                    <td class="text" colspan="5">
                        <input id="CommId" name="CommId" class="easyui-textbox" data-options="
                            prompt: '请单击\'放大镜\'按钮进行操作!',
                            editable: false,
                            width:'575px',
                            tipPosition: 'bottom',
                            required: false,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelComm(); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).textbox('clear');
                                }
                            }]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查类型:</td>
                    <td class="text">
                        <input id="CheckTypeId" name="CheckTypeId" class="easyui-combobox" />
                    </td>
                    <td class="title">统计时间:</td>
                    <td class="text">
                        <input type="text" id="BeginTime" name="BeginTime" class="easyui-datebox" data-options="required:false" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="EndTime" name="EndTime" class="easyui-datebox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Load();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear');">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TableContainer").css("width", w + "px");
                $("#TableContainer").css("height", h + "px");
            }

            //选择项目
            function SelComm() {
                HDialog.Open('800', '600', '../Supervision/SelComm.aspx?IsCheck=1', "选择项目", false, function callback(_Data) {
                    if (_Data > '') {
                        $("#CommId").textbox('setValue', JSON.parse(_Data).id);
                        $("#CommId").textbox('setText', JSON.parse(_Data).name);
                    }
                });
            }

            //加载检查类型
            function LoadCheckTypeId() {
                $('#CheckTypeId').combobox({
                    required: false,
                    panelHeight: '150',
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    multiple: true,
                    valueField: 'Id',
                    textField: 'TypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindCheckType';
                    }
                });
            }

            var column = [[
                { field: 'OrganCompName', title: '区域', width: 200, align: 'left', sortable: true },
                { field: 'OrganName', title: '分公司', width: 200, align: 'left', sortable: true },
                { field: 'CommName', title: '项目名称', width: 200, align: 'left', sortable: true },
                { field: 'CommNum', title: '项目数量', width: 200, align: 'left', sortable: true },
                { field: 'CheckTypeName', title: '检查类型', width: 200, align: 'left', sortable: true },
                { field: 'TaskNum', title: '计划任务数', width: 200, align: 'left', sortable: true },
                { field: 'CloseNum', title: '关闭任务数', width: 200, align: 'left', sortable: true },
                { field: 'NeedDoNum', title: '应查任务数', width: 200, align: 'left', sortable: true },
                { field: 'CompleteNum', title: '完成任务数', width: 200, align: 'left', sortable: true },
                { field: 'CompleteRate', title: '任务完成率（%）', width: 200, align: 'left', sortable: true },
                { field: 'RectificationNum', title: '整改报告提交数', width: 200, align: 'left', sortable: true },
                { field: 'DidRectificationNum', title: '整改报告完成数', width: 200, align: 'left', sortable: true },
                { field: 'DidRectificationRate', title: '整改报告完成率（%）', width: 200, align: 'left', sortable: true },
                { field: 'AcceptedNum', title: '整改报告验收数', width: 200, align: 'left', sortable: true },
                { field: 'AcceptedRate', title: '整改报告验收率（%）', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
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
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        Export();
                    }
                }
            ];

            function Load() {
                if ($("#CommId").textbox('getValue') == "" || $("#CommId").textbox('getValue') == null) {
                    HDialog.Info("请选择查询项目");
                    return;
                }
                if ($("#BeginTime").datebox('getValue') == "" || $("#BeginTime").datebox('getValue') == null) {
                    HDialog.Info("开始时间必选");
                    return;
                }
                if ($("#EndTime").datebox('getValue') == "" || $("#EndTime").datebox('getValue') == null) {
                    HDialog.Info("结束时间必选");
                    return;
                }
                if ($("#BeginTime").datebox('getValue') > $("#EndTime").datebox('getValue')) {
                    HDialog.Info("开始时间应大于结束时间");
                    return;
                }
                if (getDays($("#BeginTime").datebox('getValue'), $("#EndTime").datebox('getValue')) > 366) {
                    HDialog.Info("只能查询一年内的报表数据");
                    return;
                }
                LoadList('1');
            }

            function LoadList(str) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
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
                    border: 0,
                    onBeforeLoad: function (param) {
                        if (str != "") {
                            param = $.JQForm.GetParam("CSSupervision", "GetTaskReport_CheckType", "TableContainer", param);
                            if (param.page == 0)
                                param.page = 1;
                        }
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            $(function () {
                InitTableHeight();
                LoadCheckTypeId();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                LoadList("");
                $("#SearchDlg").dialog("close");
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

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

            //导出Excel
            function Export() {
                var rows = $('#TableContainer').datagrid("getRows");
                if (rows.length == 0) {
                    HDialog.Info("无数据需要导出");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'GetTaskReport_CheckType', 'CheckTypeId=&'+$('#frmForm').serialize() + '&page=1&rows=999999999',
                    function Init() {
                    },
                    function callback(_Data) {
                        var tableString = '<table cellspacing="0" class="pb">';

                        // 载入title
                        tableString += '\n<tr>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">区域</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">分公司</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">项目名称</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">项目数量</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查类型</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">计划任务数</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">关闭任务数</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">应查任务数</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">完成任务数</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">任务完成率（%）</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">整改报告提交数</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">整改报告完成数</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">整改报告完成率（%）</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">整改报告验收数</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">整改报告验收率（%）</th>';
                        tableString += '\n</tr>';
                        // 载入内容
                        var rows = eval("(" + _Data.replace(/\\/g, "/") + ")").rows; //转换为json对象
                        for (var i = 0; i < rows.length; i++) {
                            tableString += '\n<tr>';
                            tableString += '\n<td>' + rows[i]["OrganCompName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["OrganName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CommName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CommNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CheckTypeName"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CloseNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["NeedDoNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CompleteNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CompleteRate"] + '</td>';
                            tableString += '\n<td>' + rows[i]["RectificationNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["DidRectificationNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["DidRectificationRate"] + '</td>';
                            tableString += '\n<td>' + rows[i]["AcceptedNum"] + '</td>';
                            tableString += '\n<td>' + rows[i]["AcceptedRate"] + '</td>';
                            tableString += '\n</tr>';
                        }

                        //导出
                        var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                        var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                        var l = $('<input type="hidden" id="txtName" name="txtName" />');
                        i.val(tableString);
                        i.appendTo(f);
                        var date = new Date();
                        l.val('品质督查任务统计-按检查类型-' + dateFormat("YYYY-mm-dd", date));
                        l.appendTo(f);
                        f.appendTo(document.body).submit();
                        $('#SearchDlg').dialog('close');
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
    </form>
</body>
</html>
