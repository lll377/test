<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitAuditList.aspx.cs" Inherits="M_Main.Visit.VisitAuditList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>拜访审核</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>

    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 800px;
            height: 240px;
        }

        #SearchDlgClose {
            padding: 10px;
            width: 400px;
            height: 80px;
        }

        .SearchTable {
            width: auto;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 13%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        #CommName {
            width: 91%;
            height: 40px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }

        #CloseReasong {
            width: 91%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="frmFrom" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea id="CommName" name="CommName" class="easyui-validatebox" onclick="SelComm()" readonly runat="server"></textarea>
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                        <input type="hidden" id="hCommID" name="hCommID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">拜访类别</td>
                    <td class="TdContentSearch">
                        <input type="text" id="VisitCategoryName" name="VisitCategoryName" runat="server" onclick="SelVisitVategory()" class="easyui-validatebox" readonly />
                        <input type="hidden" id="VisitCategoryID" name="VisitCategoryID" runat="server" />
                    </td>
                    <td class="TdTitle">问卷类别</td>
                    <td class="TdContentSearch">
                        <input type="text" id="QuestionnaireCategoryName" name="QuestionnaireCategoryName" runat="server" onclick="SelQuestCategory()"
                            class="easyui-validatebox" readonly />
                        <input type="hidden" id="QuestionnaireCategoryID" name="QuestionnaireCategoryID" runat="server" />
                    </td>
                    <td class="TdTitle">是否评分</td>
                    <td class="TdContentSearch">
                        <select id="IsScore" name="IsScore" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">计划开始时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanBeginTimeStart" name="PlanBeginTimeStart" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanBeginTimeEnd" name="PlanBeginTimeEnd" class="easyui-datebox" data-options="editable:false" />
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">计划结束时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanEndTimeStart" name="PlanEndTimeStart" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanEndTimeEnd" name="PlanEndTimeEnd" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">计划状态</td>
                    <td class="TdContentSearch">
                        <select id="PlanState" name="PlanState" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="0">未开始</option>
                            <option value="1">执行中</option>
                            <option value="2">已完成</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否过期</td>
                    <td class="TdContentSearch">
                        <select id="IsOverDue" name="IsOverDue" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="否">否</option>
                            <option value="是">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否关闭</td>
                    <td class="TdContentSearch">
                        <select id="IsClose" name="IsClose" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="Clear()">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="SearchDlgClose" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">关闭原因</td>
                    <td class="TdContentSearch">
                        <select id="CloseReasong" name="CloseReasong" class="easyui-combobox" runat="server">
                            <option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="BtnClose_Click();">确定关闭</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="CloseDialog()">放弃返回</a>
                    </td>
                </tr>
            </table>
        </div>
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h - 2 + "px");
            }

            function Clear() {
                if ($('#hCommID').val() != "") {
                    var commnamestr = $('#CommName').val();
                    var commidstr = $('#CommID').val();
                }
                $('#frmFrom').form('clear');
                $('#CommName').val(commnamestr);
                $('#CommID').val(commidstr);
                $('#hCommID').val(commidstr);
                $('#IsScore').combobox("setValue", "全部");
                $('#PlanState').combobox("setValue", "全部");
                $('#IsOverDue').combobox("setValue", "全部");
                $('#IsClose').combobox("setValue", "全部");
            }

            //选择项目
            function SelComm() {
                if ($('#hCommID').val() == "") {
                    var w = $(window).width() * 0.7;
                    HDialog.Open(w, 500, '../Visit/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#CommID").val(arrRet.id);
                        $("#CommName").val(arrRet.name);
                    });
                }
            }
            //选择拜访类别
            function SelVisitVategory() {
                HDialog.Open('650', '400', '../Visit/Dialog/VisitCategory.aspx', '选择拜访类别', false, function callback(_Data) {
                    if (_Data) {
                        var Obj = eval("(" + _Data + ")");
                        $("#VisitCategoryName").val(Obj.VisitCategory);
                        $("#VisitCategoryID").val(Obj.ID);
                    };
                })
            }

            //选择问卷类别
            function SelQuestCategory() {
                HDialog.Open('850', '600', '../Visit/Dialog/QuestionnaireCategory.aspx', '选择问卷类别', false, function callback(_Data) {
                    if (_Data) {
                        var Obj = eval("(" + _Data + ")");
                        $("#QuestionnaireCategoryID").val(Obj.ID);
                        $("#QuestionnaireCategoryName").val(Obj.QuestionnaireCategory);
                    };
                })
            }
            var column = [[
                { field: 'CommName', title: '项目名称', width: 120, align: 'left', sortable: true },
                { field: 'VisitCategoryName', title: '拜访类别', width: 100, align: 'left', sortable: true },
                { field: 'QuestionnaireCategoryName', title: '问卷类别', width: 100, align: 'left', sortable: true },
                { field: 'IsScoreName', title: '是否评分', width: 80, align: 'left', sortable: false },
                { field: 'QuestionnaireStandardScore', title: '问卷标准分', width: 100, align: 'left', sortable: false },
                {
                    field: 'PlanName', title: '计划名称', width: 400, align: 'left', sortable: false, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"Detail('" + row.ID + "')\" href=\"javascript:void(0);\">" + row.PlanName + "</a>";
                        return str;
                    }
                },
                {
                    field: 'PlanBeginTime', title: '计划开始时间', width: 120, align: 'left', sortable: false, formatter: function (value, row, index) {
                        if (row.PlanBeginTime != "") {
                            var str = formatDate(row.PlanBeginTime, "yyyy-MM-dd");
                            return str;
                        }
                        return row.PlanBeginTime;
                    }
                },
                {
                    field: 'PlanEndTime', title: '计划结束时间', width: 120, align: 'left', sortable: false, formatter: function (value, row, index) {
                        if (row.PlanEndTime != "") {
                            var str = formatDate(row.PlanEndTime, "yyyy-MM-dd");
                            return str;
                        }
                        return row.PlanEndTime;
                    }
                },
                { field: 'PlanCoverageRate', title: '计划覆盖率', width: 80, align: 'left', sortable: false },
                { field: 'VisitHouseholds', title: '拜访户数', width: 80, align: 'left', sortable: false },
                { field: 'InfactCoverageRate', title: '实际覆盖率', width: 80, align: 'left', sortable: false },
                { field: 'ExamineHouseholds', title: '审核户数', width: 80, align: 'left', sortable: false },
                { field: 'QuestionnaireRealScore', title: '问卷实得分', width: 80, align: 'left', sortable: false },
                { field: 'PlanStatuName', title: '计划状态', width: 80, align: 'left', sortable: false },
                { field: 'IsOverDue', title: '是否过期', width: 80, align: 'left', sortable: false },
                { field: 'IsCloseName', title: '是否关闭', width: 80, align: 'left', sortable: false }
            ]];

            var toolbar = [
                {
                    text: '关闭',
                    iconCls: 'icon-remove',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选择需要关闭的计划数据!');
                            return;
                        }
                        if (row.PlanState == "2") {
                            HDialog.Info('只能对未开始、执行中的任务进行关闭!');
                            return;
                        }

                        if (row.IsClose == "1") {
                            HDialog.Info('当前计划已关闭!');
                            return;
                        }
                        ClosePlan();
                    }
                }, '-', {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选择需要修改的计划数据!');
                            return;
                        }
                        var h = $(window).height();
                        var w = $(window).width();
                        w = w * 5 / 7;
                        HDialog.OpenWin(750, 300, '../Visit/VisitAuditEdit.aspx?ID=' + row.ID + '&OpType=Edit&CommID='+ row.CommID, "修改", false, function callback(_Data) {
                            if (_Data != "") {
                                LoadList();
                            }
                        });
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            //查看拜访计划详情
            function Detail(ID) {
                var h = $(window).height();
                var w = $(window).width();
                HDialog.OpenWin(w, h, '../Visit/VisitAuditDetailSearchFrame.aspx?PlanID=' + ID, "拜访审核详情", false, function callback(_Data) {
                    if (_Data != "") {
                        LoadList();
                    }
                });
            }

            //关闭拜访计划
            function ClosePlan() {
                $("#SearchDlgClose").dialog("open");
            }

            //确定关闭
            function BtnClose_Click() {
                var row = $("#TableContainer").datagrid("getSelected");
                if ($('#CloseReasong').combobox("getValue") == "") {
                    HDialog.Info("请输入关闭原因");
                    return;
                }
                $.tool.DataGet('Visit', 'ClosePlan', "ID=" + row.ID + "&CloseReasong=" + $('#CloseReasong').combobox("getValue"),
                    function Init() {
                    },
                    function callback(data) {
                        if (data == "true") {
                            HDialog.Info("删除成功！");
                            CloseDialog();
                            LoadList();
                        } else {
                            HDialog.Info(data);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }

            //关闭当前 确定关闭页面
            function CloseDialog() {
                $('#CloseReasong').combobox("setValue", "");
                $("#SearchDlgClose").dialog("close");
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    singleSelect: true,
                    remoteSort: false,
                    columns: column,
                    fitColumns: false,
                    rownumbers: true,
                    pagination: true,
                    toolbar: toolbar,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Visit", "GetVisitAuditList", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            //页面初始化
            $(function () {
                InitTableHeight();
                LoadList();

                $('#CloseReasong').combobox({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: 'post',
                    queryParams: {
                        "Method": "DataPost",
                        "Class": "Visit",
                        "Command": "GetListDataTableDictionary",
                        "DType": "关闭原因",
                    },
                    valueField: 'ID',
                    textField: 'Name',
                    required: true,
                    editable: false,
                    tipPosition: 'bottom',
                    width: '140px',
                    panelHeight: 'auto',
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }]
                });

            });
        </script>
    </form>
</body>
</html>
