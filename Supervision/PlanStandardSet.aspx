<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanStandardSet.aspx.cs" Inherits="M_Main.Supervision.PlanStandardSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划模板-检查标准设置</title>
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
        <div style="width: 100%">
            <div style="float: left; width: 30%; border-right: 1px solid #cccccc;" class="menuDiv">
                <div style="background-color: #cccccc;" id="TreeGrid"></div>
            </div>
            <div style="float: left; width: 70%">
                <div style="background-color: #cccccc;" id="TableContainer"></div>
            </div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 510px; height: 265px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">标准编号:</td>
                    <td class="text">
                        <input type="text" id="StandardCode" name="StandardCode" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title">标准内容:</td>
                    <td class="text">
                        <input type="text" id="Content" name="Content" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查场景:</td>
                    <td class="text">
                        <input type="text" id="CheckScenario" name="CheckScenario" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title">检查方法:</td>
                    <td class="text">
                        <input type="text" id="CheckMethod" name="CheckMethod" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">抽样标准:</td>
                    <td class="text">
                        <input type="text" id="SamplingStandard" name="SamplingStandard" class="easyui-textbox" data-options="required:false" />
                    </td>
                    <td class="title">评分标准:</td>
                    <td class="text">
                        <input type="text" id="MarkStandard" name="MarkStandard" class="easyui-textbox" data-options="required:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">标准分值:</td>
                    <td class="text">
                        <input type="text" id="StandardScoreBg" name="StandardScoreBg" class="easyui-numberbox" data-options="required: false, precision: 2, min: 0" />
                    </td>
                    <td class="title">-</td>
                    <td class="text">
                        <input type="text" id="StandardScoreEnd" name="StandardScoreEnd" class="easyui-numberbox" data-options="required: false, precision: 2, min: 0" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="CanEdit" name="CanEdit" />
        <input type="hidden" id="CheckItemId" name="CheckItemId" value="" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TreeGrid").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'ck', checkbox: true },
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

            var toolbar = [
                {
                    text: '加载全部标准',
                    iconCls: 'icon-add',
                    handler: function () {
                        $.tool.DataPostChk('frmForm', 'CSSupervision', 'Plan_ReloadStandard', 'Id=' + $('#Id').val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row.length > 0) {
                            var IdList = "";
                            for (var i = 0; i < row.length; i++) {
                                IdList += '‘' + row[i].Id + '’,';
                            }
                            if (IdList.length > 0) {
                                IdList = IdList.substring(IdList, IdList.length - 1);
                            }
                            DelRecord(IdList);
                        } else {
                            HDialog.Info('请勾选需要删除的巡检标准数据!');
                        }
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function DelRecord(Id) {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'Plan_DelStandard', 'Id=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList() {
                var tool = [
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }
                ];
                debugger;
                if ($("#OpType").val() == 'edit' && $("#CanEdit").val() == "1") {
                    tool = toolbar;
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=Plan_GetCheckStandardList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: false,
                    singleSelect: false,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: tool,
                    sortOrder: "asc",
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            function LoadTree() {
                $("#TreeGrid").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=Plan_GetCheckItemTree&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    columns: [[{ title: '检查项目', field: 'text', width: 100 }]],
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: null,
                    border: false,
                    sortOrder: "asc",
                    onClickRow: function (rowData) {
                        $("#CheckItemId").val(rowData.id);
                        LoadList();
                    }
                });
            }

            $(function () {
                $("#OpType").val(GetQueryString('OpType'));
                $("#Id").val(GetQueryString('Id'));
                InitTableHeight();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                $.tool.DataGet('CSSupervision', 'CheckPlanCanEdit', 'Id=' + $("#Id").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#CanEdit").val(_Data);
                        LoadTree();
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
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
