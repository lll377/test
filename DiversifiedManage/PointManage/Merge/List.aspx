﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Merge.List" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>点位合并</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/compatible.css" rel="stylesheet" />
    <%--<script src="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="/HM/M_Main/jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/help.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>

</head>
<body>
    <input id="ChangeType" name="ChangeType" type="hidden" value="合并" />
    <div id="toolbar" class="datagrid-toolbar">
        <table cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true,onClick:function(){Edit('新增合并','Add');}">新增合并</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true,onClick:function(){CancelMerge();}">取消合并</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,onClick:function(){$('#dlg_search').dialog('open');}">筛选</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-inventory',plain:true,onClick:function(){ListHistory()}">查看历史</a></td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="javascript:void(0)" title="温馨提示：<br/>&emsp;&emsp;双击表格一行查看点位详情/点位使用信息/合并详情!" class="easyui-linkbutton easyui-tooltip" data-options="plain:true,iconCls:'icon-help'"></a></td>
                </tr>
            </tbody>
        </table>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 800px; height: 210px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">原点位编号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="ChangeNumber" name="ChangeNumber" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:'unnormal'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">原点位面积</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="StartChangeArea" name="StartChangeArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'>=',width:80" />
                    <label class="control-text">-</label>
                    <input id="EndChangeArea" name="EndChangeArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'<=',width:80" />
                    <label class="control-text">(单位:平米)</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">新点位编号</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="Number" name="Number" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%',validType:'unnormal'" />
                </div>
                <label class="col-sm-1 col-xs-1 control-label">新点位面积</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="StartArea" name="StartArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'>=',width:80" />
                    <label class="control-text">-</label>
                    <input id="EndArea" name="EndArea" class="easyui-numberbox" data-options="required:false,tipPosition:'bottom',precision:'2',suffix:' ㎡',prompt:'<=',width:80" />
                    <label class="control-text">(单位:平米)</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 col-xs-1 control-label">创建人</label>
                <div class="col-sm-5 col-xs-5">
                    <input id="AddUserName" name="AddUserName" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                </div>
            </div>
        </form>
    </div>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitPage();
        });
        function InitPage() {
            InitDataGrid();
        }

        function CancelMerge() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                $.messager.confirm('温馨提示', '确定取消[新点位编号:' + row.Number + ']数据?', function (r) {
                    if (r) {
                        $.dataPostJson('DivfManage_Point_Split_Merge', 'CancelMerge', { "ID": row.ID }, true, false,
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
            } else {
                $.messager.alert("温馨提示", '请选择需要取消的点位数据!');
            }
        }

        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'Number', title: '新点位编号', width: 250, align: 'center', sortable: false },
            { field: 'Area', title: '新点位面积(平米)', width: 200, align: 'center', sortable: false },
            {
                field: 'ChangeNumber', title: '原点位编号', width: 200, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return "请在详情页面查看原点位!";
                }
            },
            { field: 'ChangeArea', title: '原点位面积(平米)', width: 200, align: 'center', sortable: false },
            {
                field: 'AddUserName', title: '创建人', width: 100, align: 'center', sortable: false
            },
            {
                field: 'AddTime', title: '创建时间', width: 100, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss');
                }
            }, {
                field: 'Opt', title: '操作', width: 80, align: 'center', sortable: false, formatter: function (value, row, index) {
                    value = "<a onclick=\"Detailed('" + row.ID + "','" + row.ChangeID + "')\" href=\"javascript:void(0)\">查看详情</a>";
                    return value;
                }
            },
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                nowrap: false,
                fitColumns: true,
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
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onDblClickRow: function (index, row) {
                    Detailed(row.ID,row.ChangeID);
                },
                onBeforeLoad: function (param) {
                    param.SortField = "AddTime";
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param = $.getDataGridParam("DivfManage_Point_Split_Merge", "GetListMerge", param);
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

        function Edit(title, opType) {
            var param = { "OpType": opType };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Merge/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Detailed(ID, ChangeID) {
            var urlParam = { "ID": ID, "ChangeID": ChangeID };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Merge/Tab.aspx?' + $.param(urlParam), "详情", true, function callback(data) {
                InitDataGrid();
            });
        }
        function ListHistory() {
            var urlParam = { "Type": "" };
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/DiversifiedManage/PointManage/Merge/ListHistory.aspx?' + $.param(urlParam), "合并历史", true, function callback(data) {
                InitDataGrid();
            });
        }
    </script>
</body>
</html>
