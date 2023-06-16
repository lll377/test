<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreTypeSet.aspx.cs" Inherits="M_Main.Supervision.ScoreTypeSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检查类型</title>
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
        <div style="width: 100%; background-color: #cccccc;" id="TableContainerType"></div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainerItem"></div>
        <input type="hidden" id="CheckTypeId" name="CheckTypeId" />
        <input type="hidden" id="ScoreTypeId" name="ScoreTypeId" />
        <input type="hidden" id="IsScore" name="IsScore" />
        <input type="hidden" id="FullMarks" name="FullMarks" />
        <input type="hidden" id="CalculationRule" name="CalculationRule" />
        <input type="hidden" id="CanEdit" name="CanEdit" />
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainerType").css("height", h * 0.5 + "px");
                $("#TableContainerItem").css("height", h * 0.5 + "px");
            }

            var columnType = [[
                { field: 'Id', title: 'ID', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'ScoreTypeName', title: '评分类型', width: 15, align: 'left', sortable: true },
                { field: 'FullMarks', title: '综合满分', width: 10, align: 'left', sortable: true },
                { field: 'CalculationRuleName', title: '计算规则', width: 10, align: 'left', sortable: true }
            ]];

            var toolbarType = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('600', '235', '../Supervision/ScoreTypeEdit.aspx?OpType=insert&CheckTypeId=' + $("#CheckTypeId").val() + '&IsScore=' + $("#IsScore").val(), '新增评分类型', true, function callback(_Data) {
                            LoadListType();
                        });
                    }
                }, '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainerType").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        HDialog.Open('600', '235', '../Supervision/ScoreTypeEdit.aspx?OpType=edit&CheckTypeId=' + $("#CheckTypeId").val() + '&Id=' + row.Id + '&IsScore=' + $("#IsScore").val(), '修改评分类型', true, function callback(_Data) {
                            LoadListType();
                        });
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainerType").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        var rows = $("#TableContainerItem").datagrid("getRows");
                        if (rows.length != 0) {
                            HDialog.Info("需先删除对应评分项目");
                            return;
                        }
                        HDialog.Prompt('是否删除选中的数据!', function () {
                            $.tool.DataGet('CSSupervision', 'Del', 'TableName=Tb_Supervision_CheckStandard_ScoreType&Id=' + row.Id,
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data != "") {
                                        HDialog.Info(_Data);
                                        return;
                                    }
                                    LoadListType();
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        });
                    }
                }
            ];

            function LoadListType() {
                var toolbar = toolbarType;
                if ($("#CanEdit").val() == "0")
                    toolbar = [
                        {
                            text: '查看',
                            iconCls: 'icon-search',
                            handler: function () {
                                var row = $("#TableContainerType").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需查看的数据");
                                    return;
                                }
                                HDialog.Open('600', '235', '../Supervision/ScoreTypeEdit.aspx?OpType=see&CheckTypeId=' + $("#CheckTypeId").val() + '&Id=' + row.Id + '&IsScore=' + $("#IsScore").val(), '查看评分类型', true, function callback(_Data) {
                                    LoadListType();
                                });
                            }
                        }
                    ];
                $("#TableContainerType").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetScoreTypeList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnType,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0,
                    onSelect: function (rowIndex, rowData) {
                        $('#ScoreTypeId').val(rowData.Id);
                        $('#FullMarks').val(rowData.FullMarks);
                        $('#CalculationRule').val(rowData.CalculationRule);
                        LoadListItem();
                    },
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            $("#TableContainerType").datagrid("selectRow", 0);
                        }
                        LoadListItem();
                    }
                });
            }

            var columnItem = [[
                { field: 'Id', title: 'ID', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'ScoreItem', title: '评分项目', width: 15, align: 'left', sortable: true },
                { field: 'ItemScore', title: '单项满分', width: 10, align: 'left', sortable: true },
                { field: 'Weighting', title: '所占权重（%）', width: 10, align: 'left', sortable: true }
            ]];

            var toolbarItem = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('650', '260', '../Supervision/ScoreItemEdit.aspx?OpType=insert&CheckTypeId=' + $("#CheckTypeId").val() + '&ScoreTypeId=' + $("#ScoreTypeId").val() + '&IsScore=' + $("#IsScore").val() + '&FullMarks=' + $("#FullMarks").val() + '&CalculationRule=' + $("#CalculationRule").val(), '新增评分项目', true, function callback(_Data) {
                            LoadListItem();
                        });
                    }
                }, '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainerItem").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        HDialog.Open('650', '260', '../Supervision/ScoreItemEdit.aspx?OpType=edit&CheckTypeId=' + $("#CheckTypeId").val() + '&ScoreTypeId=' + $("#ScoreTypeId").val() + '&Id=' + row.Id + '&IsScore=' + $("#IsScore").val() + '&FullMarks=' + $("#FullMarks").val() + '&CalculationRule=' + $("#CalculationRule").val(), '修改评分项目', true, function callback(_Data) {
                            LoadListItem();
                        });
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainerItem").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        $.tool.DataGet('CSSupervision', 'CanDelScoreItem', 'Id=' + row.Id,
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "0") {
                                    HDialog.Info("选中评分项目被引用，无法删除");
                                    return;
                                }
                                HDialog.Prompt('是否删除选中的数据!', function () {
                                    $.tool.DataGet('CSSupervision', 'Del', 'TableName=Tb_Supervision_CheckStandard_ScoreItem&Id=' + row.Id,
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            if (_Data != "") {
                                                HDialog.Info(_Data);
                                                return;
                                            }
                                            LoadListItem();
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                });
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }
            ];

            function LoadListItem() {
                var toolbar = toolbarItem;
                if ($("#CanEdit").val() == "0")
                    toolbar = [
                        {
                            text: '查看',
                            iconCls: 'icon-search',
                            handler: function () {
                                var row = $("#TableContainerItem").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info("请选择需查看的数据");
                                    return;
                                }
                                HDialog.Open('650', '260', '../Supervision/ScoreItemEdit.aspx?OpType=see&CheckTypeId=' + $("#CheckTypeId").val() + '&ScoreTypeId=' + $("#ScoreTypeId").val() + '&Id=' + row.Id + '&IsScore=' + $("#IsScore").val() + '&FullMarks=' + $("#FullMarks").val() + '&CalculationRule=' + $("#CalculationRule").val(), '查看评分项目', true, function callback(_Data) {
                                    LoadListItem();
                                });
                            }
                        }
                    ];
                $("#TableContainerItem").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetScoreItemList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnItem,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0
                });
            }

            $(function () {
                $("#CheckTypeId").val(GetQueryString('CheckTypeId'));
                $("#IsScore").val(GetQueryString('IsScore'));
                $.tool.DataGet('CSSupervision', 'CheckStandardCanEdit', 'Id=' + $("#CheckTypeId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#CanEdit").val(_Data);
                        InitTableHeight();
                        LoadListType();
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
