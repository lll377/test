<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Emergency.Practice.List" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>应急演练登记</title>
    <link href="../../css/base.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../../jscript/help.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/uuid.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <style type="text/css">
    </style>
</head>

<body>
    <input type="hidden" name="LoginRoleCode" id="LoginRoleCode" runat="server" />
    <input type="hidden" name="CommID" id="CommID" value="-1" />
    <input type="hidden" name="CommName" id="CommName" />
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300,title:'项目列表'">
            <ul id="treeOrgan" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',border:true,title:'应急演练登记列表-请选择项目!',">
            <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 800px; height: 252px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>应急演练类型</span></td>
                    <td class="text">
                        <input id="EmergencyTypeName" name="EmergencyTypeName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>责任人</span></td>
                    <td class="text">
                        <input id="DutyUserName" name="DutyUserName" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>计划开始时间</span></td>
                    <td class="text">
                        <input id="StartPlanBeginTime" name="StartPlanBeginTime" class="easyui-datebox" data-options="editable:false,width:100" />&nbsp;-
                        <input id="EndPlanBeginTime" name="EndPlanBeginTime" class="easyui-datebox" data-options="editable:false,width:100" />
                    </td>
                    <td class="title"><span>计划结束时间</span></td>
                    <td class="text">
                        <input id="StartPlanEndTime" name="StartPlanEndTime" class="easyui-datebox" data-options="editable:false,width:100" />&nbsp;-
                        <input id="EndPlanEndTime" name="EndPlanEndTime" class="easyui-datebox" data-options="editable:false,width:100" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>实际开始时间</span></td>
                    <td class="text">
                        <input id="StartActualStartTime" name="StartActualStartTime" class="easyui-datebox" data-options="editable:false,width:100" />&nbsp;-
                        <input id="EndActualStartTime" name="EndActualStartTime" class="easyui-datebox" data-options="editable:false,width:100" /></td>
                    <td class="title"><span>实际结束时间</span></td>
                    <td class="text">
                        <input id="StartActualEndTime" name="StartActualEndTime" class="easyui-datebox" data-options="editable:false,width:100" />&nbsp;-
                        <input id="EndActualEndTime" name="EndActualEndTime" class="easyui-datebox" data-options="editable:false,width:100" /></td>
                </tr>
                <tr>
                    <td class="title"><span>计划审核状态</span></td>
                    <td class="text">
                        <select id="PlanAuditState" name="PlanAuditState" class="easyui-combobox" style="width: 80px;" data-options="tipPosition:'bottom',editable:false,panelHeight:'auto'">
                            <option value="全部">全部</option>
                            <option value="未审核">未审核</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                    <td class="title"><span>结果审核状态</span></td>
                    <td class="text">
                        <select id="ActualResultAuditState" name="ActualResultAuditState" class="easyui-combobox" style="width: 80px;" data-options="tipPosition:'bottom',editable:false,panelHeight:'auto'">
                            <option value="全部">全部</option>
                            <option value="未审核">未审核</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            PageInit();
        });
        function PageInit() {
            InitDataTree();
            //  InitDataGrid();
        }
        //机构
        function InitDataTree() {
            $("#treeOrgan").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    if (data.length > 0) {
                        var dataJson = $("#treeOrgan").tree("getChildren");
                        $.each(dataJson, function (i, itemNode) {
                            if ($("#treeOrgan").tree("isLeaf", itemNode.target)) {
                                //默认选中第一个节点
                                $("#treeOrgan").tree('select', itemNode.target);
                                return false;
                            }
                        });
                    } else {
                        InitDataGrid();
                    }
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "CpComPatrols";
                    param.Method = "DepMenuList";
                    //控制用户权限
                    param.SelRoleCode = $("#LoginRoleCode").val();

                },
                onBeforeSelect: function (node) {
                    if (!$(this).tree('isLeaf', node.target) || node.attributes.CommID == 0) {
                        return false;
                    }
                },
                onSelect: function (row) {
                    $('#layout_center').panel('setTitle', '应急演练登记列表-' + row.text);
                    $("#CommID").val(row.attributes.CommID);
                    $("#CommName").val(row.text);
                    $('#frm').form('clear');
                    InitDataGrid();
                }
            });
        }

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    Edit("新增", '');
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        Edit('编辑', row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
                    }
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        if (row.PlanAuditState == "已审核") {
                            HDialog.Info("演练计划已审核，不允许再操作数据！");
                            return;
                        }
                        Del(row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            },
            '-', {
                text: '计划审核/取消审核',
                iconCls: 'icon-man',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (!row) {
                        HDialog.Info("请选择需要审核/取消审核的数据！");
                        return;
                    }
                    if (row.ActualResultAuditState == "已审核") {
                        HDialog.Info("演练结果已审核，不允许再操作数据！");
                        return;
                    }
                    //判断是否有审核或者是取消审核权限
                    $.tool.DataGet('Emergency', 'SelFunc_Emergency', 'FunCode=0902',
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "false") {
                                HDialog.Info("无审核权限！");
                                return;
                            }
                            //审核 取消审核
                            AuditRecord(row.ID, "Plan");
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            },
            '-', {
                text: '结果审核/取消审核',
                iconCls: 'icon-man',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (!row) {
                        HDialog.Info("请选择需要审核/取消审核的数据！");
                        return;
                    }
                    if (row.IsComplete != "是") {
                        HDialog.Info("演练需要完成后才能审核！");
                        return;
                    }
                    if (row.ActualResultAuditState == "已审核") {
                        HDialog.Info("演练结果已审核，不允许再操作数据！");
                        return;
                    }
                    //判断是否有审核或者是取消审核权限
                    $.tool.DataGet('Emergency', 'SelFunc_Emergency', 'FunCode=0903',
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "false") {
                                HDialog.Info("无审核权限！");
                                return;
                            }
                            //审核 取消审核
                            AuditRecord(row.ID, "Result");
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }
            //'-', {
            //    text: '导出',
            //    iconCls: 'icon-page_white_excel',
            //    handler: function () {
            //        if ($("#CommID").val() == "-1") {
            //            $.messager.alert('温馨提示', '请选择项目!');
            //            return;
            //        }
            //        window.open("Export.aspx?random=" + Math.random());
            //    }
            //}
        ];
        //审核，取消审核
        function AuditRecord(ID, Type) {
            $.dataPostJson('Emergency_Practice', 'AuditEmergencyPractice', { "ID": ID, "Type": Type }, true, false,
                function Init() {
                },
                function callback(data) {
                    if (data.result) {
                        HDialog.Info("审核/取消审核成功！");
                        InitDataGrid();
                    } else {
                        HDialog.Info(data.msg);
                    }
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        var column = [[
            { field: 'CommName', title: '项目名称', width: 140, align: 'left', sortable: false },
            { field: 'EmergencyTypeName', title: '应急演练类型', width: 140, align: 'center', sortable: false },
            {
                field: 'PlanBeginTime', title: '计划开始时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd HH:mm:ss')
                    }
                    //return $.dateFormat(value);
                    return "";
                }
            }, {
                field: 'PlanEndTime', title: '计划结束时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd HH:mm:ss')
                    }
                    //return $.dateFormat(value);
                    return "";
                }
            },
            { field: 'DutyUserName', title: '责任人', width: 80, align: 'center', sortable: false },
            { field: 'PlanAuditState', title: '计划审核状态', width: 90, align: 'center', sortable: false },
            {
                field: 'ActualStartTime', title: '实际开始时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd HH:mm:ss')
                    }
                    //return $.dateFormat(value);
                    return "";
                }
            }, {
                field: 'ActualEndTime', title: '实际结束时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd HH:mm:ss')
                    }
                    //return $.dateFormat(value);
                    return "";
                }
            },
            { field: 'IsComplete', title: '是否完成', width: 60, align: 'center', sortable: false },
            { field: 'ActualResultAuditState', title: '结果审核状态', width: 90, align: 'center', sortable: false },
            { field: 'SchemeCount', title: '演练方案', width: 60, align: 'center', sortable: false },
            { field: 'RecordCount', title: '签到记录', width: 60, align: 'center', sortable: false },
            { field: 'PhotoCount', title: '演练照片', width: 60, align: 'center', sortable: false },
            { field: 'SummaryCount', title: '演练总结', width: 60, align: 'center', sortable: false },
            {
                field: 'Opt', title: '操作', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value = "<a onclick=\"Detailed('" + row.ID + "')\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                fit: true,
                idField: "ID",
                columns: column,
                rownumbers: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID);
                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("Emergency_Practice", "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $('#dg').datagrid('clearChecked');
            $("#dlg_search").dialog("close");
        }

        function Edit(title, id) {
            var OpType = "Add";
            if (isValueNull(id)) { OpType = "Edit"; } else { id = Math.uuid(); }
            var param = { "OpType": OpType, "ID": id, "CommID": $("#CommID").val(), "CommName": $("#CommName").val() };
            LayerDialog.OpenWin('800', '600', '../Emergency/Practice/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Del(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.dataPostJson('Emergency_Practice', 'Del', { "idList": idList }, true, false,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                InitDataGrid();
                            } else { $.messager.alert("温馨提示", data.msg); }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }
        function Detailed(id) {
            var urlParam = { "ID": id };
            LayerDialog.OpenWin('800', '600', '../Emergency/Practice/Detailed.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                //if (isValueNull(data)) {
                InitDataGrid();
                //}
            });
        }
    </script>
</body>
</html>
