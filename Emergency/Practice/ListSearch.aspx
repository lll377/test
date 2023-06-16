﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListSearch.aspx.cs" Inherits="M_Main.Emergency.Practice.ListSearch" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>应急演练查询</title>
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

        //选择应急类型
        function SelType() {
            LayerDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyType.aspx?', '选择应急类型', true, function callback(data) {
                //console.log(data);
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#EmergencyTypeID").textbox("setValue", data.id);
                    $("#EmergencyTypeID").textbox("setText", data.text);
                }

            });
        }
        function SelUser() {
            LayerDialog.OpenWin('1024', '450', '../Emergency/Dialog/User.aspx', '选择责任人', true, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#DutyUserCode").textbox('setValue', data.UserCode);
                    $("#DutyUserCode").textbox('setText', data.UserName);
                }
            });
        }


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
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }
            , '-', {
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($("#CommID").val() == "-1") {
                        $.messager.alert('温馨提示', '请选择项目!');
                        return;
                    }
                    var Rows = $("#dg").datagrid("getRows");
                    if (Rows.length == 0) {
                        $.messager.alert('温馨提示', '没有需要导出的应急演练数据!');
                        return;
                    }
                    window.open("PracticeListSearchExport.aspx?CommID=" + $('#CommID').val() + "&" + $('#frm').serialize());
                }
            }
        ];
        var column = [[
            { field: 'CommName', title: '项目名称', width: 140, align: 'left', sortable: false },
            { field: 'EmergencyTypeName', title: '应急演练类型', width: 140, align: 'center', sortable: false },
            {
                field: 'PlanBeginTime', title: '计划开始时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd HH')
                    }
                    //return $.dateFormat(value);
                    return "";
                }
            }, {
                field: 'PlanEndTime', title: '计划结束时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd HH')
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
                        return formatDate(value, 'yyyy-MM-dd HH')
                    }
                    //return $.dateFormat(value);
                    return "";
                }
            }, {
                field: 'ActualEndTime', title: '实际结束时间', width: 110, align: 'center', sortable: false, formatter: function (value, row, index) {
                    if (value != "") {
                        return formatDate(value, 'yyyy-MM-dd HH')
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
