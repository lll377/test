<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIssueList.aspx.cs" Inherits="M_Main.Plan.PlanIssueList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划下发列表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 1000px;
            height: 120px;
        }

        .SearchTable {
            width: 1000px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">计划周期
                    </td>
                    <td class="DialogTdDateContent">
                        <select id="PlanCycle" name="PlanCycle" isdctype="true" dctype="计划周期" style="width: 83%; border: 1px #cccccc solid;">
                        </select>
                    </td>
                    <td class="TdTitle">计划主题
                    </td>
                    <td class="TdContent">
                        <input id="PlanTheme" name="PlanTheme" value="" runat="server" />
                    </td>
                    <td class="TdTitle">开始时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanStartTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanStartTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanStartTime_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanStartTime_End" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">结束时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanEndTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanEndTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanEndTime_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanEndTime_End" runat="server" />
                    </td>
                    <td class="TdTitle">发起时间
                    </td>
                    <td class="DialogTdDateContent">
                        <input id="AddTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="AddTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="AddTime_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="AddTime_End" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ClaerWhere();">清  除 </a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
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
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            }, false);
                    });
                }
                LoadDictionary();
            });

            //清空筛选条件
            function ClaerWhere() {
                $("#PlanCycle").val('');

                $("#PlanStartTime_Begin").datebox("setValue","");
                $("#PlanStartTime_End").datebox("setValue", "");
                $("#PlanEndTime_Begin").datebox("setValue", "");
                $("#PlanEndTime_End").datebox("setValue", "");

                $("#AddTime_Begin").datebox("setValue", "");
                $("#AddTime_End").datebox("setValue", "");
            }

            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column = [[
                {
                    field: 'PlanCycleName', title: '计划周期', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.IssueId + "','edit');\">" + row.PlanCycleName + "</a>";
                        return str;
                    }
                },
                { field: 'PlanNum', title: '计划数量', align: 'center', width: 60, sortable: true },
                { field: 'PlanTheme', title: '计划主题', align: 'center', width: 100, sortable: true },
                {
                    field: 'PlanStartTime', title: '开始时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, "yyyy-MM-dd");
                        }
                        return value;
                    }
                },
                {
                    field: 'PlanEndTime', title: '结束时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, "yyyy-MM-dd");
                        }
                        return value;
                    }
                },
                { field: 'UserNum', title: '责任部门/责任人', width: 150, align: 'left', sortable: true },
                { field: 'AddPName', title: '发起人', width: 100, align: 'center', sortable: true },
                {
                    field: 'AddTime', title: '发起时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, "yyyy-MM-dd");
                        }
                        return value;
                    }
                }
            ]];

            //工具栏
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        Detail('', 'insert');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        DelRecord(row)
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            //删除计划单
            function DelRecord(row) {
                var selectedRow = $('#TableContainer').datagrid("getSelected");
                if (selectedRow == null) {
                    HDialog.Info("请选择需要删除的计划单");
                    return;
                }
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        if (row.AuditingState == "未启动" || row.AuditingState != "" || row.AuditingState == "已驳回") {
                            $.tool.DataGet('CsPlan', 'PlaningDel', 'Id=' + row.PlanId,
                                function Init() {
                                },
                                function callback(_Data) {
                                    $('#SearchDlg').parent().appendTo($("form:first"));
                                    if (_Data == "true") {
                                        HDialog.Info("计划单中包含计划详细信息无法删除。");
                                    }
                                    else {
                                        HDialog.Info("删除成功！");
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                        else {
                            HDialog.Info("无法删除");
                        }
                    }
                });
            }

            //加载列表
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
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
                        param = $.JQForm.GetParam("CsPlan", "GetIssueList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();
            $('#SearchDlg').parent().appendTo($("form:first"));

            //新增 修改
            function Detail(Id, OpType) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanIssueDetail.aspx?Id=' + Id + '&OpType=' + OpType, '计划下发单', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>
