<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Region.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Region" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>区域选择</title>
    <link href="../../Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/compatible.css" rel="stylesheet" />
    <%--<script src="../../Jscript-Ui/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <style type="text/css">
        .form-horizontal {
            padding: 3px;
        }
    </style>
</head>
<body>
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <label class="control-label">点位区域</label>
                    <input id="Region" name="Region" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <label class="control-label">报事公区</label>
                    <input id="RegionalPlace" name="RegionalPlace" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="<div><p>温馨提示：<br/>&emsp;&emsp;双击表格一行也可以选择数据!</p></div>" data-options="plain:true,iconCls:'icon-help'"></a>
                </div>
            </div>
        </form>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitDataGrid();
        });
        var column = [[
            { field: 'Region', title: '点位区域', width: 50, align: 'center', sortable: false },
            { field: 'RegionalPlace', title: '报事公区', width: 50, align: 'center', sortable: false },
            { field: 'Remark', title: '备注', width: 80, align: 'center', sortable: false },
            { field: 'Sort', title: '排序序号', width: 20, align: 'center', sortable: false }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    LayerDialog.ReturnIsJson = true;
                    LayerDialog.Close(row);
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("DivfManage_Region", "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
        }
        function Save() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(row);
            } else {
                $.messager.alert("温馨提示", '请选择一行需要的数据!');
            }
        }


    </script>
</body>
</html>
