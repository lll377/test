<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanImplement.aspx.cs" Inherits="M_Main.Plan.PlanImplement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>计划执行</title>
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
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <input type="hidden" id="InitDType" name="InitDType" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 650px; height: 200px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">计划周期</td>
                    <td class="TdContent">
                        <select id="PlanCycle" name="PlanCycle" runat="server" isdctype="true"
                            dctype="计划周期" style="width: 100%; border: 1px #cccccc solid;"
                            class="easyui-validatebox " >
                        </select>
                    </td>
                    <td class="TdTitle">计划单号</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 100%; height: 20px;" id="PlanNo" name="PlanNo" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="ActualStartTime"  onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ActualStartTime" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                    <td class="TdTitle">结束时间</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox Wdate" id="ActualEndTime"  onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ActualEndTime" runat="server" type="text" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContent">
                        <input id="SerBlameP" name="SerBlameP" value="" runat="server" style="border: 1px solid #cccccc; width: 100%" />
                    </td>
                    <td class="TdTitle">责任部门</td>
                    <td class="TdContent">
                        <input id="BlameDepName" name="BlameDepName" class="easyui-validatebox" runat="server" onclick="SelDepart();"  style="border: 1px solid #cccccc; width: 100%" />
                        <input type="hidden" id="BlameDepCodeId" name="BlameDepCodeId" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">执行记录</td>
                    <td class="TdContent">
                        <select style="width: 100%; border: 1px #cccccc solid;" id="NotEvaluationNum">
                            <option></option>
                            <option value="0">是否有未考评</option>
                        </select>
                    </td>
                   <td class="TdTitle">计划主题</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" style="width: 100%; height: 20px;" id="PlanTheme" name="PlanTheme" /></td>
                </tr>
                <tr>
                    <td colspan="6" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清除条件</a>
                    </td>
                </tr>
            </table>
        </div>
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
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                { field: 'PlanId', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
                {
                    field: 'PlanNO', title: '计划单号', width: 45, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"\" onclick=\"Edit('" + row.PlanId + "')\">" + row.PlanNO + "</a>";
                        return str;
                    }
                },
                { field: 'Name', title: '计划周期', width: 35, align: 'left', sortable: true },
                { field: 'PlanTheme', title: '计划主题', width: 50, align: 'left', sortable: true },
                { field: 'PlanNum', title: '计划数量', width: 35, align: 'left', sortable: true },
                { field: 'PlanCloseNum', title: '关闭数量', width: 35, align: 'left', sortable: true },
                { field: 'WanChengLv', title: '完成进度', width: 35, align: 'left', sortable: true },
                
                {
                    field: 'PlanStartTime', title: '开始时间', width: 35, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'PlanEndTime', title: '结束时间', width: 35, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PlanEndTime, 'yyyy-MM-dd');
                        return str;
                    }
                },
                { field: 'BlameDepCode', title: '责任部门', width: 50, align: 'left', sortable: true },
                { field: 'username', title: '责任人', width: 35, align: 'left', sortable: true },
                { field: 'EvaluationNum', title: '执行记录（已考评）', width: 35, align: 'left', sortable: true },
                { field: 'NotEvaluationNum', title: '执行记录（未考评）', width: 35, align: 'left', sortable: true },
            ]];

            function Edit(PlanId) {
                HDialog.Open('1100', '550', '../Plan/PlanImplement_List.aspx?OpType=edit&PlanId=' + PlanId, '计划列表', true, function callback(_Data) {
                    LoadList();
                });
                LoadList();
            }

            var toolbar = [
                {
                    text: '送审',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择计划", "请选择计划");
                            return;
                        }
                        var w = top.$(window).width();
                        var h = parent.$(window).height();
                        HDialog.Open(w, h, '../Plan/PlanSubmit.aspx?Id=' + row["PlanId"].toString(), '考评审批', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsPlan", "GetImplementList", "TableContainer", param);
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
                $("#PlanCycle").val("");
                $("#PlanNo").val("");
                $("#ActualStartTime").val("");
                $("#ActualEndTime").val("");
                $("#SerBlameP").val("");
                $("#BlameDepCodeName").val("");
                $("#BlameDepName").val("");
                $("#BlameDepCodeId").val("");
                $("#PlanTheme").val("");
                $("#NotEvaluationNum").val("");
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
                            depCode += "\"" + varDepObj[4] + "\",";
                        }
                        depName = depName.substr(0, depName.length - 1);
                        depCode = depCode.substr(0, depCode.length - 1);
                        $("#BlameDepName").val(depName);
                        $("#BlameDepCodeId").val(depCode);
                    }
                });
            }
        </script>
    </form>
</body>
</html>
