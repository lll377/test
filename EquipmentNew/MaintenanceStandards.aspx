<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceStandards.aspx.cs" Inherits="M_Main.EquipmentNew.MaintenanceStandards" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备级别设置</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: auto;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-left: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .tabs-container .panel-body {
            border-color: #95B8E7;
            border-width: 1px;
            border-style: solid;
            padding: 0px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" name="room" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">设备空间</a>
                </li>
                <li class="" name="cust" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">设备级别</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div data-options="region:'north',border:false">
                        <div style="width: 100%; height: 100%;" id="DivContainerSpace">
                        </div>
                    </div>
                    <div data-options="region:'center',border:false">
                        <div style="width: 100%; height: 100%;" id="DivContainerDetailSpace">
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="easyui-layout" id="Layout" data-options="fit:true">
                        <div data-options="region:'west',border:true,width:300,title:'设备级别'">
                            <ul id="treeDemo" class="easyui-tree">
                            </ul>
                        </div>
                        <div data-options="region:'center',border:false">
                            <div class="easyui-layout" data-options="fit:true">
                                <div style="width: 100%; height: 100%;" id="DivContainer">
                                </div>
                                <div style="width: 100%; height: 100%;" id="DivContainerDetail">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();
            //页面初始化
            $(function () {
                InitTableHeight();
                $(".tabs-container li").click(function () {
                });
                $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    InitTableHeight();
                });
                LoadTree("");
                LoadBindSpace();
            });
            //初始化高度
            function InitTableHeight() {
                $('#Layout').height(h - 41);
                $('#Layout').width(w);
                $("#Layout").layout('resize', {
                    height: h,
                    width: w
                });
                $("#DivContainer").css("height", h / 2 - 15 + "px");
                $("#DivContainerDetail").css("height", h / 2 - 25 + "px");
                $("#DivContainerSpace").css("height", h / 2 - 15 + "px");
                $("#DivContainerDetailSpace").css("height", h / 2 - 25 + "px");
            }

            //加载树
            function LoadTree(id) {
                $("#treeDemo").tree({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    treeField: 'RankName',
                    idField: 'RankId',
                    lines: true,
                    animate: true,
                    border: false,
                    loadMsg: '加载中,请稍侯...',
                    onLoadError: function () {
                        LoadBind();
                    },
                    onLoadSuccess: function (node, data) {
                        //默认选中第一个节点
                        if (data.length > 0) {
                            if (id != "") {
                                var node = $('#treeDemo').tree('find', id);
                                $('#treeDemo').tree('select', node.target);
                                $('#treeDemo').tree('scrollTo', node.target);

                            } else {
                                var node = $('#treeDemo').tree('find', data[0].id);
                                $('#treeDemo').tree('select', node.target);
                            }
                        }
                    },
                    onBeforeLoad: function (row, param) {
                        param.Method = "DataPost";
                        param.Class = "CsEquipment";
                        param.Command = "GetRankEasyUiTree";

                    },
                    onSelect: function (row) {
                        LoadBind();
                    }
                });
            }
            //维保标准 列表
            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准代码', width: 15, align: 'left', sortable: true },
                { field: 'StandardName', title: '标准名称', width: 25, align: 'left', sortable: true },
                { field: 'RankName', title: '设备级别', width: 25, align: 'left', sortable: true },
                { field: 'MaintenanceTypeName', title: '维保类别', width: 25, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 25, align: 'left', sortable: true }
            ]];
            //维保标准空间 列表
            var columnspace = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准代码', width: 15, align: 'left', sortable: true },
                { field: 'StandardName', title: '标准名称', width: 25, align: 'left', sortable: true },
                { field: 'SysSpaceName', title: '通用设备空间', width: 25, align: 'left', sortable: true },
                { field: 'MaintenanceTypeName', title: '维保类别', width: 25, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 25, align: 'left', sortable: true }
            ]];
            //工艺路线 列表
            var columnDetail = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                { field: 'MaintenanceContent', title: '维保项目、内容、方法、标准', width: 100, align: 'left', sortable: true },
                {
                    field: 'InputType', title: '输入类型', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "文本";
                        if (value == '1')
                            str = "选项";
                        else if (value == '2')
                            str = "数字";
                        return str;
                    }
                },
                {
                    field: 'CheckType', title: '选择类型', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (value == '1')
                            str = "正常/不正常";
                        else if (value == '2')
                            str = "合格/不合格";
                        else if (value == '3')
                            str = "完成/未完成";
                        else if (value == '4')
                            str = "是/否";
                        return str;
                    }
                },
                {
                    field: 'NumType', title: '数字范围', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        var numArr = value.split(',');
                        if (numArr.length > 1) {
                            switch (numArr[0]) {
                                case "1":
                                    str = "＞" + numArr[1];
                                    break;
                                case "2":
                                    str = "＜" + numArr[1];
                                    break;
                                case "3":
                                    str = "≥" + numArr[1];
                                    break;
                                case "4":
                                    str = "≤" + numArr[1];
                                    break;
                                case "5":
                                    str = numArr[1] + "≤?≤" + numArr[2];
                                    break;
                                case "6":
                                    str = numArr[1] + "＜?＜" + numArr[2];
                                    break;
                                default:
                            }
                        }
                        return str;
                    }
                },
                {
                    field: 'IsMaintenanceRegistration', title: '维保登记是否必填', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == "")
                            str = "否";
                        return str;
                    }
                },
                {
                    field: 'IsControl', title: '异常是否强制报修', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == "")
                            str = "否";
                        return str;
                    }
                },
                { field: 'Remark', title: '备注', width: 25, align: 'left', sortable: true }
            ]];
            //工艺路线 列表
            var columnDetailSpace = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                { field: 'MaintenanceContent', title: '维保项目、内容、方法、标准', width: 100, align: 'left', sortable: true },
                {
                    field: 'InputType', title: '输入类型', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "文本";
                        if (value == '1')
                            str = "选项";
                        else if (value == '2')
                            str = "数字";
                        return str;
                    }
                },
                {
                    field: 'CheckType', title: '选择类型', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (value == '1')
                            str = "正常/不正常";
                        else if (value == '2')
                            str = "合格/不合格";
                        else if (value == '3')
                            str = "完成/未完成";
                        else if (value == '4')
                            str = "是/否";
                        return str;
                    }
                },
                {
                    field: 'NumType', title: '数字范围', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = value;
                        var numArr = value.split(',');
                        if (numArr.length > 1) {
                            switch (numArr[0]) {
                                case "1":
                                    str = "＞" + numArr[1];
                                    break;
                                case "2":
                                    str = "＜" + numArr[1];
                                    break;
                                case "3":
                                    str = "≥" + numArr[1];
                                    break;
                                case "4":
                                    str = "≤" + numArr[1];
                                    break;
                                case "5":
                                    str = numArr[1] + "≤?≤" + numArr[2];
                                    break;
                                case "6":
                                    str = numArr[1] + "＜?＜" + numArr[2];
                                    break;
                                default:
                            }
                        }
                        return str;
                    }
                },
                {
                    field: 'IsMaintenanceRegistration', title: '维保登记是否必填', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == "")
                            str = "否";
                        return str;
                    }
                },
                {
                    field: 'IsControl', title: '异常是否强制报修', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == "")
                            str = "否";
                        return str;
                    }
                },
                { field: 'Remark', title: '备注', width: 25, align: 'left', sortable: true },
                {
                    field: 'IsCommCheck', title: '项目是否必选', width: 30, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "是";
                        if (value == '0' || value == null || value == undefined || value == "")
                            str = "否";
                        return str;
                    }
                }
            ]];

            //维保标准 工具栏
            var toolbar =
                [
                    {
                        text: '新增',
                        iconCls: 'icon-add',
                        handler: function () {
                            var SelecteNode = $("#treeDemo").tree("getSelected");
                            if (SelecteNode == null) {
                                HDialog.Info("请选择设备级别");
                                return;
                            }
                            var RankID = SelecteNode.id;
                            var RankName = SelecteNode.text;
                            EditObj("新增维保标准", "", "insert", RankID, RankName);
                        }
                    }, '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#DivContainer").datagrid("getSelected");
                            if (row == null) {
                                HDialog.Info("请选择需要修改的维保标准数据");
                                return;
                            }
                            EditObj("修改维保标准", row.Id, "edit", row.RankID, row.RankName);
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#DivContainer").datagrid("getChecked");
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
                                HDialog.Info('请勾选需要删除的维保标准数据!');
                            }
                        }
                    }, '-',
                    {
                        text: '导出标准',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {
                            var SelecteNode = $("#treeDemo").tree("getSelected");
                            if (SelecteNode == null) {
                                HDialog.Info("请选择设备级别");
                                return;
                            }

                            var rowData = $('#DivContainer').datagrid('getRows');
                            if (rowData.length == 0) {
                                HDialog.Info("没有维保标准数据导出!");
                                return;
                            }
                            window.open("MaintenanceStandardsExport.aspx?RankID=" + SelecteNode.id);
                        }
                    }, '-',
                    {
                        text: '导出全部标准',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {
                            window.open("MaintenanceStandardsExport.aspx");
                        }
                    }
                ];

            //维保标准 工具栏
            var toolbarSpace =
                [
                    {
                        text: '新增',
                        iconCls: 'icon-add',
                        handler: function () {
                            EditObjSpace("新增维保标准", "", "insert");
                        }
                    }, '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#DivContainerSpace").datagrid("getSelected");
                            if (row == null) {
                                HDialog.Info("请选择需要修改的维保标准数据");
                                return;
                            }
                            EditObjSpace("修改维保标准", row.Id, "edit");
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#DivContainerSpace").datagrid("getChecked");
                            if (row.length > 0) {
                                var IdList = "";
                                for (var i = 0; i < row.length; i++) {
                                    IdList += '‘' + row[i].SpaceName + '’,';
                                }
                                if (IdList.length > 0) {
                                    IdList = IdList.substring(IdList, IdList.length - 1);
                                }
                                DelRecordSpace(IdList);
                            } else {
                                HDialog.Info('请勾选需要删除的维保标准数据!');
                            }
                        }
                    }, '-',
                    {
                        text: '导出标准',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {
                            var rowData = $('#DivContainerSpace').datagrid('getRows');
                            if (rowData.length == 0) {
                                HDialog.Info("没有维保标准数据导出!");
                                return;
                            }
                            window.open("MaintenanceStandardsExport.aspx?Type=Space");
                        }
                    }
                ];

            //编辑维保标准
            function EditObj(title, Id, OpType, RankID, RankName) {
                var parameterStr = '?RankId=' + RankID + "&Id=" + Id + "&OpType=" + OpType + "&RankName=" + RankName;
                HDialog.OpenWin('700', '350', '../EquipmentNew/MaintenanceStandardEdit.aspx' + parameterStr, title,
                    false, function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info("保存维保标准成功");
                            LoadBind();
                        }
                    });
            }
            //编辑维保标准空间
            function EditObjSpace(title, Id, OpType) {
                var parameterStr = "?Id=" + Id + "&OpType=" + OpType;
                HDialog.OpenWin('700', '350', '../EquipmentNew/MaintenanceStandardEditSpace.aspx' + parameterStr, title, false, function callback(_Data) {
                    if (_Data != "") {
                        HDialog.Info("保存维保标准成功");
                        LoadBindSpace();
                    }
                });
            }
            //删除维保标准  允许多选删除
            function DelRecord(Ids) {
                HDialog.Prompt('是否删除选中标准!', function () {
                    $.tool.DataGet('CsEquipment', 'DelMaintenanceStandard', 'IdList=' + Ids,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info("删除成功");
                                LoadBind();
                            } else {
                                HDialog.Info(_Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }
            //删除维保标准  允许多选删除
            function DelRecordSpace(Ids) {
                $.tool.DataGet('CsEquipment', 'CanDelMaintenanceStandardSpace', 'IdList=' + Ids,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Prompt('是否删除选中标准!', function () {
                                $.tool.DataGet('CsEquipment', 'DelMaintenanceStandardSpace', 'IdList=' + Ids,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "true") {
                                            HDialog.Info("删除成功");
                                            LoadBindSpace();
                                        } else {
                                            HDialog.Info(_Data);
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            });
                        } else {
                            HDialog.Info("选中通用设备空间被引用，无法删除");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //工艺路线 工具栏
            var toolbarDetail =
                [
                    {
                        text: '新增',
                        iconCls: 'icon-add',
                        handler: function () {
                            var rows = $("#DivContainer").datagrid("getSelected");
                            if (rows == null) {
                                HDialog.Info("请选择维保标准!");
                                return false;
                            }
                            EditDetailObj("新增工艺路线", rows.Id, rows.StandardName, 'insert', '');
                        }
                    }, '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#DivContainerDetail").datagrid("getSelected");
                            if (row == null) {
                                HDialog.Info("请选择需要修改的维保标准数据");
                                return;
                            }
                            EditDetailObj("修改工艺路线", row.MaintenanceStandardId, row.MaintenanceStandardName, "edit", row.DetailId);
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {

                            var row = $("#DivContainerDetail").datagrid("getChecked");
                            if (row.length > 0) {
                                var IdList = "";
                                for (var i = 0; i < row.length; i++) {
                                    IdList += '‘' + row[i].DetailId + '’,';
                                }
                                if (IdList.length > 0) {
                                    IdList = IdList.substring(IdList, IdList.length - 1);
                                }
                                DelRecordDetail(IdList);
                            } else {
                                HDialog.Info('请勾选需要删除的工艺路线数据!');
                            }
                        }
                    }
                ];
            //工艺路线 工具栏
            var toolbarDetailSpace =
                [
                    {
                        text: '新增',
                        iconCls: 'icon-add',
                        handler: function () {
                            var rows = $("#DivContainerSpace").datagrid("getSelected");
                            if (rows == null) {
                                HDialog.Info("请选择维保标准!");
                                return false;
                            }
                            EditDetailObjSpace("新增工艺路线", rows.Id, rows.StandardName, 'insert', '');
                        }
                    }, '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#DivContainerDetailSpace").datagrid("getSelected");
                            if (row == null) {
                                HDialog.Info("请选择需要修改的维保标准数据");
                                return;
                            }
                            EditDetailObjSpace("修改工艺路线", row.MaintenanceStandardId, row.MaintenanceStandardName, "edit", row.DetailId);
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {

                            var row = $("#DivContainerDetailSpace").datagrid("getChecked");
                            if (row.length > 0) {
                                var IdList = "";
                                for (var i = 0; i < row.length; i++) {
                                    IdList += '‘' + row[i].DetailId + '’,';
                                }
                                if (IdList.length > 0) {
                                    IdList = IdList.substring(IdList, IdList.length - 1);
                                }
                                DelRecordDetailSpace(IdList);
                            } else {
                                HDialog.Info('请勾选需要删除的工艺路线数据!');
                            }
                        }
                    }
                ];
            //编辑工艺路线
            function EditDetailObj(title, MaintenanceStandardId, MaintenanceStandardName, OpType, DetailId) {
                var parameterStr = '?OpType=' + OpType + '&MaintenanceStandardId=' + MaintenanceStandardId + "&MaintenanceStandardName=" + MaintenanceStandardName + "&DetailId=" + DetailId;
                HDialog.OpenWin('700', '440', '../EquipmentNew/MaintenanceStandardDetailEdit.aspx' + parameterStr, title,
                    false, function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info("保存工艺路线成功");
                            LoadBindDetail();
                        }
                    });
            }
            //编辑工艺路线
            function EditDetailObjSpace(title, MaintenanceStandardId, MaintenanceStandardName, OpType, DetailId) {
                var parameterStr = '?OpType=' + OpType + '&MaintenanceStandardId=' + MaintenanceStandardId + "&MaintenanceStandardName=" + MaintenanceStandardName + "&DetailId=" + DetailId;
                HDialog.OpenWin('700', '470', '../EquipmentNew/MaintenanceStandardDetailEditSpace.aspx' + parameterStr, title,
                    false, function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info("保存工艺路线成功");
                            LoadBindDetailSpace();
                        }
                    });
            }
            //删除工艺路线 允许多选删除
            function DelRecordDetail(Ids) {
                HDialog.Prompt('是否删除该工艺路线!', function () {
                    $.tool.DataGet('CsEquipment', 'DelMaintenanceStandardDetail', 'IdList=' + Ids,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info("删除成功");
                                LoadBindDetail();
                            } else {
                                HDialog.Info(_Data);
                            }

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }
            //删除工艺路线 允许多选删除
            function DelRecordDetailSpace(Ids) {
                HDialog.Prompt('是否删除该工艺路线!', function () {
                    $.tool.DataGet('CsEquipment', 'DelMaintenanceStandardDetailSpace', 'IdList=' + Ids,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info("删除成功");
                                LoadBindDetailSpace();
                            } else {
                                HDialog.Info(_Data);
                            }

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            //加载 维保标准 数据
            function LoadBind() {
                var RankID = "";
                var SelecteNode = $("#treeDemo").tree("getSelected");
                if (SelecteNode != null) {
                    RankID = SelecteNode.id;
                } else {
                    RankID = "--";// 没有选中就不查询数据出来
                }
                var ParameterStr = "&RankId=" + RankID;
                $("#DivContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetMaintenanceStandardList' + ParameterStr,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    title: "维保标准",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    border: false,
                    rownumbers: true,
                    columns: column,
                    fitColumns: true,
                    pagination: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onSelect: function (rowIndex, rowData) {
                        LoadBindDetail();
                    },
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            $("#DivContainer").datagrid("selectRow", 0);
                        } else {
                            LoadBindDetail();
                        }
                    },
                    onLoadError: function () {
                        LoadBindDetail();
                    }
                });
            }
            //加载工艺路线数据
            function LoadBindDetail() {
                var MaintenanceStandardIdStr = "";
                var SelecteRow = $("#DivContainer").datagrid("getSelected");
                if (SelecteRow != null) {
                    MaintenanceStandardIdStr = SelecteRow.Id;
                } else {
                    MaintenanceStandardIdStr = "--";// 没有选中就不查询数据出来
                }
                var ParameterStr = "&MaintenanceStandardId=" + MaintenanceStandardIdStr;

                url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetMaintenanceStandardDetailList' + ParameterStr;
                $("#DivContainerDetail").datagrid({
                    url: url,
                    method: "get",
                    title: '工艺路线',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    columns: columnDetail,
                    fitColumns: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbarDetail,
                    sortOrder: "asc"
                });
            }

            //加载 维保标准 数据 空间
            function LoadBindSpace() {
                $("#DivContainerSpace").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetMaintenanceStandardSpaceList',
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    title: "维保标准",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    border: false,
                    rownumbers: true,
                    columns: columnspace,
                    fitColumns: true,
                    pagination: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbarSpace,
                    sortOrder: "asc",
                    onSelect: function (rowIndex, rowData) {
                        LoadBindDetailSpace();
                    },
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            $("#DivContainerSpace").datagrid("selectRow", 0);
                        } else {
                            LoadBindDetailSpace();
                        }
                    },
                    onLoadError: function () {
                        LoadBindDetailSpace();
                    }
                });
            }
            //加载工艺路线数据 空间
            function LoadBindDetailSpace() {
                var MaintenanceStandardIdStr = "";
                var SelecteRow = $("#DivContainerSpace").datagrid("getSelected");
                if (SelecteRow != null) {
                    MaintenanceStandardIdStr = SelecteRow.Id;
                } else {
                    MaintenanceStandardIdStr = "--";// 没有选中就不查询数据出来
                }
                var ParameterStr = "&MaintenanceStandardId=" + MaintenanceStandardIdStr;

                url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetMaintenanceStandardDetailSpaceList' + ParameterStr;
                $("#DivContainerDetailSpace").datagrid({
                    url: url,
                    method: "get",
                    title: '工艺路线',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    columns: columnDetailSpace,
                    fitColumns: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbarDetailSpace,
                    sortOrder: "asc"
                });
            }
        </script>
    </form>
</body>
</html>
