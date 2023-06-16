<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckStandardSet.aspx.cs" Inherits="M_Main.Supervision.CheckStandardSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查标准</title>
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
            <div style="float: left; width: 20%; border-right: 1px solid #cccccc;" class="menuDiv">
                <div style="background-color: #cccccc;" id="TreeGrid"></div>
            </div>
            <div style="float: left; width: 80%">
                <div style="background-color: #cccccc;" id="TableContainer"></div>
            </div>
        </div>
        <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width: 120px;">
            <div data-options="name:'addbj',iconCls:'icon-add'">新增本级</div>
            <div data-options="name:'addxj',iconCls:'icon-add'">新增下级</div>
            <div class="menu-sep"></div>
            <div data-options="name:'del',iconCls:'icon-cancel'">删除</div>
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
        <input type="hidden" id="CheckTypeId" name="CheckTypeId" />
        <input type="hidden" id="IsScore" name="IsScore" />
        <input type="hidden" id="ScoreType" name="ScoreType" />
        <input type="hidden" id="CheckItemId" name="CheckItemId" value="" />
        <input type="hidden" id="CanEdit" name="CanEdit" />
        <script type="text/javascript">
            function menuHandler(item) {
                var row = $("#TreeGrid").treegrid("getSelected");
                switch (item.name) {
                    case "addbj":
                        var ParentId = '';
                        if (row != null) {
                            if (row._parentId > '')
                                ParentId = row._parentId;
                        }
                        HDialog.Open('800', '400', '../Supervision/CheckItemEdit.aspx?OpType=insert&CanEdit=1&ParentId=' + ParentId + '&CheckTypeId=' + $("#CheckTypeId").val() + '&IsScore=' + $("#IsScore").val() + '&ScoreType=' + $("#ScoreType").val(), '新增检查项目', true, function callback(_Data) {
                            LoadTree();
                        });
                        break;
                    case "addxj":
                        if (row == null) {
                            HDialog.Info("请选择父级数据");
                            return;
                        }
                        AddCheckItem();
                        break;
                    case "del":
                        DelTree();
                        break;
                }
            }

            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $("#TreeGrid").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'ItemNameAll', title: '检查项目', width: 200, align: 'left', sortable: true },
                {
                    field: 'StandardCode', title: '标准编号', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"EditCheckStandard('" + row.Id + "')\">" + row.StandardCode + "</a>";
                        return str;
                    }
                },
                { field: 'Content', title: '标准内容', width: 400, align: 'left', sortable: true },
                { field: 'CheckScenario', title: '检查场景', width: 200, align: 'left', sortable: true },
                { field: 'CheckMethod', title: '检查方法', width: 300, align: 'left', sortable: true },
                { field: 'SamplingStandard', title: '抽样标准', width: 300, align: 'left', sortable: true },
                { field: 'MarkStandard', title: '评分标准', width: 300, align: 'left', sortable: true },
                { field: 'StandardScore', title: '标准分值', width: 80, align: 'left', sortable: true },
                { field: 'DeductionNatureName', title: '加扣性质', width: 80, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TreeGrid").treegrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择检查项目");
                            return;
                        }
                        if (row.children > '') {
                            HDialog.Info("检查标准只能添加到最底层项目上");
                            return;
                        }
                        HDialog.Open('800', '520', '../Supervision/CheckStandardEdit.aspx?OpType=insert&CanEdit=1&CheckItemId=' + row.id + '&CheckTypeId=' + $("#CheckTypeId").val() + '&IsScore=' + $("#IsScore").val() + '&ScoreType=' + $("#ScoreType").val() + '&ItemNameAll=' + encodeURI(encodeURI(row.attributes.ItemNameAll)) + '&DeductionNature=' + row.attributes.DeductionNature, '新增检查标准', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
                , '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        EditCheckStandard(row.Id);
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        DelRecord(row.Id);
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

            function EditCheckStandard(Id) {
                HDialog.Open('800', '520', '../Supervision/CheckStandardEdit.aspx?OpType=edit&Id=' + Id + '&CheckTypeId=' + $("#CheckTypeId").val() + '&IsScore=' + $("#IsScore").val() + '&ScoreType=' + $("#ScoreType").val() + '&CanEdit=' + $("#CanEdit").val(), '检查标准详情', true, function callback(_Data) {
                    LoadList();
                });
            }

            function DelRecord(Id) {
                HDialog.Prompt('是否删除选中的数据!', function () {
                    $.tool.DataGet('CSSupervision', 'Del', 'TableName=Tb_Supervision_CheckStandard_CheckStandard&Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                HDialog.Info(_Data);
                                return;
                            }
                            if ($("#IsScore").val() == '1') {//检查是否评分”为“是”//按标准得失分  需要刷新分值
                                if ($("#ScoreType").val() == '1') {
                                    $.tool.DataGet('CSSupervision', 'ReloadScore_Bz', 'CheckTypeId=' + $("#CheckTypeId").val(),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                            }
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function LoadList() {
                var tool = toolbar;
                if ($("#CanEdit").val() == "0")
                    tool = [
                        {
                            text: '查看',
                            iconCls: 'icon-search',
                            handler: function () {
                                var row = $("#TableContainer").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需查看的数据");
                                    return;
                                }
                                EditCheckStandard(row.Id);
                            }
                        }
                    ];
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=CheckStandard_GetCheckStandardList&' + $('#frmForm').serialize(),
                    method: "get",
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
                    toolbar: tool,
                    sortOrder: "asc",
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            //新增检查项目 有选中节点时新增选中节点的下级  没有选中节点新增根结点
            function AddCheckItem() {
                var ParentId = '';
                var row = $("#TreeGrid").treegrid("getSelected");
                if (row != null) {
                    ParentId = row.id;
                }
                var rows = $("#TableContainer").datagrid("getRows");
                if (ParentId>'' && rows.length > 0) {
                    HDialog.Info("检查项目包含检查标准，无法新增下级节点");
                    return;
                }
                HDialog.Open('800', '400', '../Supervision/CheckItemEdit.aspx?OpType=insert&CanEdit=1&ParentId=' + ParentId + '&CheckTypeId=' + $("#CheckTypeId").val() + '&IsScore=' + $("#IsScore").val() + '&ScoreType=' + $("#ScoreType").val(), '新增检查项目', true, function callback(_Data) {
                    LoadTree();
                });
            }

            function CheckItemEdit(Id, ParentId) {
                HDialog.Open('800', '400', '../Supervision/CheckItemEdit.aspx?OpType=edit&ParentId=' + ParentId + '&Id=' + Id + '&CheckTypeId=' + $("#CheckTypeId").val() + '&IsScore=' + $("#IsScore").val() + '&ScoreType=' + $("#ScoreType").val() + '&CanEdit=' + $("#CanEdit").val(), '检查项目详情', true, function callback(_Data) {
                    LoadTree();
                });
            }

            //删除检查项目
            function DelTree() {
                var row = $("#TreeGrid").treegrid("getSelected");
                if (row == null) {
                    HDialog.Info("请选择删除数据");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'DelCheckItemTree', 'Id=' + row.id,
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#CheckItemId").val('');
                        $("#TreeGrid").treegrid('loadData', []);
                        $('#TreeGrid').treegrid('clearSelections');
                        LoadTree();
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            var Treetoolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddCheckItem();
                    }
                }
                , '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TreeGrid").treegrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        CheckItemEdit(row.id, row._parentId);
                    }
                }
                , '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        DelTree();
                    }
                }
            ];

            function LoadTree() {
                var tool = Treetoolbar;
                if ($("#CanEdit").val() == "0")
                    tool = [
                        {
                            text: '查看',
                            iconCls: 'icon-search',
                            handler: function () {
                                var row = $("#TreeGrid").treegrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需查看的数据");
                                    return;
                                }
                                CheckItemEdit(row.id, row._parentId);
                            }
                        }
                    ];
                $("#TreeGrid").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetCheckItemTree&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    columns: [[{
                        title: '检查项目', field: 'text', width: 100, formatter: function (value, row, index) {
                            var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"CheckItemEdit('" + row.id + "','" + row._parentId + "');\">" + row.text + "</a>";
                            return str;
                        }
                    }]],
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: tool,
                    border: false,
                    sortOrder: "asc",
                    onClickRow: function (rowData) {
                        $("#CheckItemId").val(rowData.id);
                        LoadList();
                    }
                });
            }

            $(function () {
                $("#CheckTypeId").val(GetQueryString('CheckTypeId'));
                $("#IsScore").val(GetQueryString('IsScore'));
                $("#ScoreType").val(GetQueryString('ScoreType'));
                $.tool.DataGet('CSSupervision', 'CheckStandardCanEdit', 'Id=' + $("#CheckTypeId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#CanEdit").val(_Data);
                        if (_Data == "1") {
                            $(".menuDiv").unbind("mousedown").bind("contextmenu", function (e) {
                                e.preventDefault();
                                $('#mm').menu('show', {
                                    left: e.pageX,
                                    top: e.pageY
                                });

                            });
                        }
                        InitTableHeight();
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
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
