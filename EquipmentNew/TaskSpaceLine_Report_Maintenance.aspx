<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskSpaceLine_Report_Maintenance.aspx.cs" Inherits="M_Main.EquipmentNew.TaskSpaceLine_Report_Maintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备维保表单</title>
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

        .TdContentSearch {
            width: auto;
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
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 850px; height: 210px; padding: 10px;">
            <table class="SearchTable" style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="easyui-validatebox" id="CommName" name="CommName" readonly="readonly" onclick="SelComm();" style="border: 1px #cccccc solid; width: 550px; height: 21px;" />
                        <input type="hidden" id="CommId" name="CommId" value="" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">设备空间</td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="SpaceName" name="SpaceName" type="text" class="easyui-validatebox" onclick="SelSpace();" style="width: 550px; height: 21px;" />
                        <input type="hidden" name="SpaceId" id="SpaceId" value="" />
                        <input type="hidden" name="SpaceNo" id="SpaceNo" value="" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">统计时间:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BeginTime" name="BeginTime" runat="server" style="border: 1px solid #cccccc; width: 120px; height: 18px;" class="easyui-validatebox Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" />
                    </td>
                    <td class="TdTitle">至:</td>
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
        <input type="hidden" id="Title" name="Title" />
        <input type="hidden" id="TaskName" name="TaskName" value="设备维保表单" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            function btnClear() {
                $("#CommID").val("");
                $("#CommName").val("");
                $("#SpaceId").val("");
                $("#SpaceName").val("");
                $("#BeginTime").val("");
                $("#EndTime").val("");
            }

            //选择项目
            function SelComm() {
                HDialog.Open('700', '500', '../EquipmentNew/SelComm.aspx?IsCheck=0', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            //设备空间
            function SelSpace() {
                var CommID = $("#CommId").val();
                if (CommID == null || CommID == "" || CommID == undefined) {
                    HDialog.Info("请先选择项目");
                    return;
                }
                HDialog.Open('600', '450', '../EquipmentNew/SelSpace.aspx?CommId=' + CommID, '选择设备空间', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#SpaceId").val(varObjects.SpaceId);
                        $("#SpaceName").val(varObjects.SpaceName);
                        $("#SpaceNo").val(varObjects.SpaceNo);
                    }
                });
            }

            var column = [[
                { field: 'TaskNO', title: '任务编码', width: 150, align: 'left', sortable: true },
                { field: 'TaskBeginTime', title: '开始时间', width: 150, align: 'left', sortable: true },
                { field: 'TaskEndTime', title: '结束时间', width: 150, align: 'left', sortable: true },
                { field: 'UserName', title: '维保人', width: 120, align: 'left', sortable: true }
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
                        Export();
                        //window.open("EqReportExcel.aspx?CommId=" + $('#CommId').val() + '&SpaceId=' + $("#SpaceId").val() + '&SpaceName=' + $("#SpaceName").val() + '&BeginTime=' + $('#BeginTime').val() + '&EndTime=' + $('#EndTime').val() + '&TaskName=' + $('#TaskName').val());
                    }
                }
            ];

            function LoadList(str) {
                if (str != "") {
                    if ($("#CommId").val() == "" || $("#CommId").val() == null) {
                        HDialog.Info("请选择查询项目");
                        return;
                    }
                    if ($("#SpaceId").val() == "" || $("#SpaceId").val() == null) {
                        HDialog.Info("请选择查询机房");
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
                        HDialog.Info("开始时间应大于结束时间");
                        return;
                    }
                    if (getDays($("#BeginTime").val(), $("#EndTime").val()) > 366) {
                        HDialog.Info("只能查询一年内的报表数据");
                        return;
                    }
                }
                GetColumn();
            }

            function GetColumn() {
                $.tool.DataGet('CsEquipment', 'GetTaskSpaceLine_Report_TitleList_Maintenance', 'CommId=' + $('#CommId').val() + '&SpaceId=' + $("#SpaceId").val() + '&BeginTime=' + $('#BeginTime').val() + '&EndTime=' + $('#EndTime').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#Title").val(_Data);
                        column = [[
                            { field: 'TaskNO', title: '任务编码', width: 150, align: 'left', sortable: true },
                            { field: 'TaskBeginTime', title: '开始时间', width: 150, align: 'left', sortable: true },
                            { field: 'TaskEndTime', title: '结束时间', width: 150, align: 'left', sortable: true },
                            { field: 'UserName', title: '维保人', width: 120, align: 'left', sortable: true }
                        ]];
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var re = new RegExp("/n", ""); //定义正则表达式
                        var re1 = new RegExp("/t", ""); //定义正则表达式
                        var re2 = new RegExp("/r", ""); //定义正则表达式
                        for (var i = 0; i < varObjects.length; i++) {
                            column[0].push({ field: varObjects[i].MaintenanceStandardDetailId, title: varObjects[i].MaintenanceContent.replace(re, '').replace(re1, '').replace(re2, ''), width: 200, align: 'left', sortable: true });
                        }
                        GetList('1');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function GetList(str) {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    remoteSort: false,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        if (str != "") {
                            param = $.JQForm.GetParam("CsEquipment", "GetTaskSpaceLine_ReportList_Maintenance", "TableContainer", param);
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            GetList("");

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
                $.tool.DataGet('CsEquipment', 'GetTaskSpaceLine_ReportList_Maintenance', 'CommId=' + $('#CommId').val() + '&SpaceId=' + $("#SpaceId").val() + '&BeginTime=' + $('#BeginTime').val() + '&EndTime=' + $('#EndTime').val() + '&page=1&rows=999999999',
                    function Init() {
                    },
                    function callback(_Data) {
                        var tableString = '<table cellspacing="0" class="pb">';
                        var columns = column;     // 得到columns对象
                        var nameList = $("#Title").val();
                        var varObjects = eval("(" + nameList.replace(/\\/g, "/") + ")"); //转换为json对象

                        //插入表头
                        tableString += '\n<tr style="height:40;font-weight:bold">';
                        tableString += '\n<td colspan="' + (4 + varObjects.length) + '" style="text-align:center">';
                        tableString += $('#CommName').val() + '-' + $('#SpaceName').val() + '设备维保单';
                        tableString += '</td>';


                        // 载入title
                        if (typeof columns != 'undefined' && columns != '') {
                            $(columns).each(function (index) {
                                tableString += '\n<tr>';
                                for (var i = 0; i < columns[index].length; ++i) {
                                    tableString += '\n<th style="background-color:#c0c0c0;width:150px" width="' + columns[index][i].width + '"';
                                    tableString += '>' + columns[index][i].title + '</th>';
                                }
                                tableString += '\n</tr>';
                            });
                        }
                        // 载入内容
                        var table = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        var rows = table.rows;
                        for (var i = 0; i < rows.length; i++) {
                            tableString += '\n<tr>';
                            tableString += '\n<td>' + rows[i]["TaskNO"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskBeginTime"] + '</td>';
                            tableString += '\n<td>' + rows[i]["TaskEndTime"] + '</td>';
                            tableString += '\n<td>' + rows[i]["UserName"] + '</td>';
                            for (var j = 0; j < varObjects.length; j++) {
                                tableString += '\n<td>';
                                var FiledName = varObjects[j].MaintenanceStandardDetailId;
                                tableString += rows[i][FiledName];
                                tableString += '</td>';
                            }
                            tableString += '\n</tr>';
                        }
                        //插入签名栏
                        tableString += '\n<tr style="height:40;font-weight:bold">';
                        tableString += '\n<td colspan="' + (4 + varObjects.length) + '" style="text-align:right">';
                        tableString += '工程主管签字审核：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目经理签字审核：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                        tableString += '</td>';
                        tableString += '\n</tr>';
                        tableString += '\n</table>';

                        //导出
                        var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                        var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                        var l = $('<input type="hidden" id="txtName" name="txtName" />');
                        i.val(tableString);
                        i.appendTo(f);
                        var date = new Date();
                        l.val($("#SpaceName").val() + '机房维保计划输出表单-' + dateFormat("YYYY-mm-dd", date));
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

            //****将treegrid数据转化成列表数据
            function treeDataToList(dataArr) {
                var arr = [];
                function childrenToList(node) {
                    var childrens = node.children || [];
                    for (var i = 0; i < childrens.length; i++) {
                        var d = childrens[i];
                        var temp = {};
                        for (var key in d) {
                            if (key !== "children") {
                                temp[key] = d[key];
                            }
                        }
                        arr.push(temp);
                        childrenToList(d);
                    }
                }

                for (var i = 0; i < dataArr.length; i++) {
                    var d = dataArr[i];
                    var temp = {};
                    for (var key in d) {
                        if (key !== "children") {
                            temp[key] = d[key];
                        }
                    }
                    arr.push(temp);

                    childrenToList(d);
                }
                return arr;
            }
        </script>
    </form>
</body>
</html>
