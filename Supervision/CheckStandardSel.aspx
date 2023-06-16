<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckStandardSel.aspx.cs" Inherits="M_Main.Supervision.CheckStandardSel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查标准查询</title>
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
                        <a href="javascript:void(0)" onclick="Export(); " class="l-btn l-btn-small l-btn-plain">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">导出</span><span class="l-btn-icon icon-page_white_excel">&nbsp;</span></span></a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="CheckTypeId" name="CheckTypeId" />
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
                        param.Command = 'BindScoreType_ByCheckType';
                        param.CheckTypeId = $("#CheckTypeId").val();
                    }
                });
            }

            var column = [[
                { field: 'ScoreItem', title: '评分项目', width: 150, align: 'left', sortable: true },
                { field: 'Score', title: '单项分值', width: 80, align: 'left', sortable: true },
                { field: 'ItemNameAll', title: '检查项目', width: 200, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准编号', width: 100, align: 'left', sortable: true },
                { field: 'Content', title: '标准内容', width: 300, align: 'left', sortable: true },
                { field: 'CheckScenario', title: '检查场景', width: 300, align: 'left', sortable: true },
                { field: 'CheckMethod', title: '检查方法', width: 300, align: 'left', sortable: true },
                { field: 'SamplingStandard', title: '抽样标准', width: 300, align: 'left', sortable: true },
                { field: 'MarkStandard', title: '评分标准', width: 300, align: 'left', sortable: true },
                { field: 'StandardScore', title: '标准分值', width: 80, align: 'left', sortable: true },
                { field: 'DeductionNatureName', title: '加扣性质', width: 80, align: 'left', sortable: true }
            ]];

            function LoadList() {
                var url = '';
                if ($("#ScoreType").combobox("getValue") > '')
                    url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=CheckStandard_CheckStandardSel&CheckStandard_ScoreType=' + $("#ScoreType").combobox("getValue") + '&CheckTypeId=' + $("#CheckTypeId").val();
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
                    border: 0,
                    onLoadSuccess: function () {
                        $("#TableContainer").datagrid("autoMergeCells", ['ScoreItem', 'Score', 'ItemNameAll']);
                    }
                });
                if ($("#ScoreType").combobox("getValue") > '') {
                    $.tool.DataPostChk('frmForm', 'CSSupervision', 'CheckStandard_CheckStandardSel_SumScore', 'CheckStandard_ScoreType=' + $("#ScoreType").combobox("getValue") + '&CheckTypeId=' + $("#CheckTypeId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            //添加“合计”列
                            $('#TableContainer').datagrid('reloadFooter', [{
                                ScoreItem: '合计',
                                Score: _Data
                            }]);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
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
                var rows = $('#TableContainer').datagrid("getRows");
                if (rows.length == 0) {
                    HDialog.Info("无数据需要导出");
                    return;
                }
                var SumScore = 0;
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'CheckStandard_CheckStandardSel_SumScore', 'CheckStandard_ScoreType=' + $("#ScoreType").combobox("getValue") + '&CheckTypeId=' + $("#CheckTypeId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        SumScore = _Data;
                        ExportList(SumScore);
                        
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                
            }

            function ExportList(SumScore) {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'CheckStandard_CheckStandardSel', 'CheckStandard_ScoreType=' + $("#ScoreType").combobox("getValue") + '&CheckTypeId=' + $("#CheckTypeId").val() + '&page=1&rows=999999999',
                    function Init() {
                    },
                    function callback(_Data) {
                        var tableString = '<table cellspacing="0" class="pb">';

                        // 载入title
                        tableString += '\n<tr>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">评分项目</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">单项分值</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查项目</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">标准编号</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">标准内容</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查场景</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">检查方法</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">抽样标准</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">评分标准</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">标准分值</th>';
                        tableString += '\n<th style="background-color:#c0c0c0;width:150px">加扣性质</th>';
                        tableString += '\n</tr>';
                        // 载入内容
                        var rows = eval("(" + _Data.replace(/\\/g, "/") + ")").rows; //转换为json对象
                        for (var i = 0; i < rows.length; i++) {
                            tableString += '\n<tr>';
                            tableString += '\n<td>' + rows[i]["ScoreItem"] + '</td>';
                            tableString += '\n<td>' + rows[i]["Score"] + '</td>';
                            tableString += '\n<td>' + rows[i]["ItemNameAll"] + '</td>';
                            tableString += '\n<td>\'' + rows[i]["StandardCode"] + '</td>';
                            tableString += '\n<td>' + rows[i]["Content"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CheckScenario"] + '</td>';
                            tableString += '\n<td>' + rows[i]["CheckMethod"] + '</td>';
                            tableString += '\n<td>' + rows[i]["SamplingStandard"] + '</td>';
                            tableString += '\n<td>' + rows[i]["MarkStandard"] + '</td>';
                            tableString += '\n<td>' + rows[i]["StandardScore"] + '</td>';
                            tableString += '\n<td>' + rows[i]["DeductionNatureName"] + '</td>';
                            tableString += '\n</tr>';
                        }

                        //加入合计
                        tableString += '\n<tr>';
                        tableString += '\n<td>合计</td>';
                        tableString += '\n<td>' + SumScore + '</td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n<td></td>';
                        tableString += '\n</tr>';

                        //导出
                        var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                        var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                        var l = $('<input type="hidden" id="txtName" name="txtName" />');
                        i.val(tableString);
                        i.appendTo(f);
                        var date = new Date();
                        l.val('检查标准查询-' + dateFormat("YYYY-mm-dd", date));
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

            $(function () {
                $("#CheckTypeId").val(GetQueryString('CheckTypeId'));
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
