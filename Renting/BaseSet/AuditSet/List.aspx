<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.BaseSet.AuditSet.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同流程设置-列表页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: auto;">
    <div id="tab" class="easyui-tabs" data-options="fit:true,tabWidth:'100'">
        <div id="tab0" data-issel="true" title="认租签约" style="overflow: hidden;">
            <table id="TableContainerSubscription" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab1" data-issel="false" title="租赁合同新签" style="overflow: hidden;">
            <table id="TableContainerAdd" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab2" data-issel="false" title="租赁合同续签" style="overflow: hidden;">
            <table id="TableContainerRenewal" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab3" data-issel="false" title="租赁合同变更" style="overflow: hidden;">
            <table id="TableContainerChange" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
        <div id="tab4" data-issel="false" title="租赁合同提成" style="overflow: hidden;">
            <table id="TableContainerRoyalty" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <!-- 认租签约 -->
    <div id="dlg_Subscription" class="easyui-dialog" title="筛选" style="width: 600px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formSubscription" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同类别名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ContractTypeName1" name="ContractTypeName1" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">流程名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="WorkFlowName1" name="WorkFlowName1" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitSubscriptionDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formSubscription').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 租赁合同新签 -->
    <div id="dlg_Add" class="easyui-dialog" title="筛选" style="width: 600px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formAdd" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同类别名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ContractTypeName2" name="ContractTypeName2" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">流程名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="WorkFlowName2" name="WorkFlowName2" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitAddDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formAdd').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 租赁合同续签 -->
    <div id="dlg_Renewal" class="easyui-dialog" title="筛选" style="width: 600px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formRenewal" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同类别名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ContractTypeName3" name="ContractTypeName3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">流程名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="WorkFlowName3" name="WorkFlowName3" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitRenewalDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formRenewal').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 租赁合同变更 -->
    <div id="dlg_Change" class="easyui-dialog" title="筛选" style="width: 600px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formChange" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">变更类型</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ChangeType4" name="ChangeType4" class="easyui-combobox" data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',
                         valueField:'id',textField:'text',value:'',
                            data: [{id: '',text: ''},{id: '变更',text: '变更'},{id: '退租',text: '退租'}]" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">流程名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="WorkFlowName4" name="WorkFlowName4" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitChangeDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formChange').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <!-- 租赁合同提成 -->
    <div id="dlg_Royalty" class="easyui-dialog" title="筛选" style="width: 600px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formRoyalty" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-2 col-xs-2 control-label">合同类别名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="ContractTypeName5" name="ContractTypeName5" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                    <label class="col-sm-2 col-xs-2 control-label">流程名称</label>
                    <div class="col-sm-4 col-xs-4">
                        <input id="WorkFlowName5" name="WorkFlowName5" class="easyui-textbox" data-options="tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitRoyaltyDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formRoyalty').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>

    <script language="javascript" type="text/javascript">
        //页面初始化
        $(function () {
            var h = $(window).height();
            var w = $(window).width();
            $('#tab').css("height", h + 'px');
            $('#tab0,#tab1,#tab2,#tab3,#tab4').css("height", h - $('.tabs-header').height() + 'px');
            $('#tab').tabs({
                onSelect: tabsSelect
            });
            InitSubscriptionDataGrid();
        });

        function tabsSelect(title, index) {
            var ItemTab = $('#tab').tabs('getTab', index);
            if (ItemTab.data("issel") == true) {
                return;
            } else {
                ItemTab.data("issel", true);
                if (index == 1) {
                    //合同新签
                    setTimeout(function () {
                        InitAddDataGrid();
                    }, 300);
                } else if (index == 2) {
                    //合同续签
                    setTimeout(function () {
                        InitRenewalDataGrid();
                    }, 300);
                } else if (index == 3) {
                    //合同变更
                    setTimeout(function () {
                        InitChangeDataGrid();
                    }, 300);
                } else if (index == 4) {
                    //合同提成
                    setTimeout(function () {
                        InitRoyaltyDataGrid();
                    }, 300);
                }
            }
        }
        /* 认租签约 */
        var SubscriptionColumn = [[
            { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 150, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"SubscriptionEdit('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        var SubscriptionToolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    SubscriptionEdit("", 'add');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerSubscription").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的认租签约流程设置!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的认租签约流程设置?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_AuditSet', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        $.messager.alert("温馨提示", "删除成功")
                                        InitSubscriptionDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_Subscription").dialog("open");
                }
            }];
        //加载列表
        function InitSubscriptionDataGrid() {
            $("#TableContainerSubscription").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: SubscriptionColumn,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: SubscriptionToolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.AuditType = "认租签约";
                    param.Class = "Renting_AuditSet";
                    param.Method = "GetList";
                    var paramJson = $.getFromParam("formSubscription");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('1', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_Subscription").dialog("close");
        }
        //编辑
        function SubscriptionEdit(ID, opType) {
            var param = {
                OpType: opType,
                ID: ID,
                AuditType: "认租签约"
            }
            LayerDialog.OpenWin('450', '310', '/HM/M_Main/Renting/BaseSet/AuditSet/Edit.aspx?' + $.param(param), "认租签约流程设置", true, function callback(_Data) {
                if (_Data != "") {
                    InitSubscriptionDataGrid();
                }
            });
        }

        /* 租赁合同新签 */
        var AddColumn = [[
            { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 150, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"AddEdit('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        var AddToolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    AddEdit("", 'add');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerAdd").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的租赁合同新签流程设置!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的租赁合同新签流程设置?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_AuditSet', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        $.messager.alert("温馨提示", "删除成功")
                                        InitAddDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_Add").dialog("open");
                }
            }];
        //加载列表
        function InitAddDataGrid() {
            $("#TableContainerAdd").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: AddColumn,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: AddToolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.AuditType = "租赁合同新签";
                    param.Class = "Renting_AuditSet";
                    param.Method = "GetList";
                    var paramJson = $.getFromParam("formAdd");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('2', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_Add").dialog("close");
        }
        //编辑
        function AddEdit(ID, opType) {
            var param = {
                OpType: opType,
                ID: ID,
                AuditType: "租赁合同新签"
            }
            LayerDialog.OpenWin('450', '310', '/HM/M_Main/Renting/BaseSet/AuditSet/Edit.aspx?' + $.param(param), "租赁合同新签流程设置", true, function callback(_Data) {
                if (_Data != "") {
                    InitAddDataGrid();
                }
            });
        }

        /* 租赁合同续签 */
        var RenewalColumn = [[
            { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 150, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"RenewalEdit('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        var RenewalToolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    RenewalEdit("", 'add');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerRenewal").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的租赁合同续签流程设置!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的租赁合同续签流程设置?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_AuditSet', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        $.messager.alert("温馨提示", "删除成功")
                                        InitRenewalDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_Renewal").dialog("open");
                }
            }];
        //加载列表
        function InitRenewalDataGrid() {
            $("#TableContainerRenewal").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: RenewalColumn,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: RenewalToolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.AuditType = "租赁合同续签";
                    param.Class = "Renting_AuditSet";
                    param.Method = "GetList";
                    var paramJson = $.getFromParam("formRenewal");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('3', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_Renewal").dialog("close");
        }
        //编辑
        function RenewalEdit(ID, opType) {
            var param = {
                OpType: opType,
                ID: ID,
                AuditType: "租赁合同续签"
            }
            LayerDialog.OpenWin('450', '310', '/HM/M_Main/Renting/BaseSet/AuditSet/Edit.aspx?' + $.param(param), "租赁合同续签流程设置", true, function callback(_Data) {
                if (_Data != "") {
                    InitRenewalDataGrid();
                }
            });
        }


        /* 租赁合同提成 */
        var RoyaltyColumn = [[
            { field: 'ContractTypeName', title: '合同类别', width: 300, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 150, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"RoyaltyEdit('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        var RoyaltyToolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    RoyaltyEdit("", 'add');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerRoyalty").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的租赁合同提成流程设置!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的租赁合同提成流程设置?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_AuditSet', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        $.messager.alert("温馨提示", "删除成功")
                                        InitRoyaltyDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_Royalty").dialog("open");
                }
            }];
        //加载列表
        function InitRoyaltyDataGrid() {
            $("#TableContainerRoyalty").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: RoyaltyColumn,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: RoyaltyToolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.AuditType = "租赁合同提成";
                    param.Class = "Renting_AuditSet";
                    param.Method = "GetList";
                    var paramJson = $.getFromParam("formRoyalty");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('5', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_Royalty").dialog("close");
        }
        //编辑
        function RoyaltyEdit(ID, opType) {
            var param = {
                OpType: opType,
                ID: ID,
                AuditType: "租赁合同提成"
            }
            LayerDialog.OpenWin('450', '310', '/HM/M_Main/Renting/BaseSet/AuditSet/Edit.aspx?' + $.param(param), "租赁合同提成流程设置", true, function callback(_Data) {
                if (_Data != "") {
                    InitRoyaltyDataGrid();
                }
            });
        }


        /* 租赁合同变更 */
        var ChangeColumn = [[
            { field: 'ChangeType', title: '变更类型', width: 100, align: 'left' },
            {
                field: 'WorkFlowName', title: '流程名称', width: 150, align: 'left', formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"ChangeEdit('" + row.ID + "','edit');\">" + row.WorkFlowName + "</a>";
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 200, align: 'left' }
        ]];
        var ChangeToolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    ChangeEdit("", 'add');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainerChange").datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert("温馨提示", '请选择需要删除的租赁合同变更流程设置!');
                        return;
                    }
                    $.messager.confirm('确定', '是否删除选中的租赁合同变更流程设置?', function (r) {
                        if (r) {
                            $.dataPostJson('Renting_AuditSet', 'Del', { "idList": row.ID }, true, false,
                                function Init() {
                                },
                                function callback(data) {
                                    if (data.result) {
                                        $.messager.alert("温馨提示", "删除成功")
                                        InitChangeDataGrid();
                                    } else { $.messager.alert("温馨提示", data.msg); }
                                },
                                function completeCallback() {
                                }, function errorCallback() {
                                });
                        }
                    });
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $("#dlg_Change").dialog("open");
                }
            }];
        //加载列表
        function InitChangeDataGrid() {
            $("#TableContainerChange").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                columns: ChangeColumn,
                rownumbers: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: ChangeToolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.AuditType = "租赁合同变更";
                    param.Class = "Renting_AuditSet";
                    param.Method = "GetList";
                    var paramJson = $.getFromParam("formChange");
                    for (var key in paramJson) {
                        var values = paramJson[key];
                        key = key.replaceAll('4', '');
                        param[key] = values;
                    }
                },
                onLoadSuccess: function (data) {
                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_Change").dialog("close");
        }
        //编辑
        function ChangeEdit(ID, opType) {
            var param = {
                OpType: opType,
                ID: ID,
                AuditType: "租赁合同变更"
            }
            LayerDialog.OpenWin('450', '290', '/HM/M_Main/Renting/BaseSet/AuditSet/EditChange.aspx?' + $.param(param), "租赁合同变更流程设置", true, function callback(_Data) {
                if (_Data != "") {
                    InitChangeDataGrid();
                }
            });
        }
    </script>
</body>
</html>
