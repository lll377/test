<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dictionary.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Dictionary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>字典</title>
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
    <input id="IsMultiple" name="IsMultiple" type="hidden" value="否" />
    <input id="Type" name="Type" type="hidden" />
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-sm-12 col-xs-12">
                    <label class="control-label">名称</label>
                    <input id="Name" name="Name" class="easyui-textbox" data-options="prompt:'',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    <label class="control-label">序号</label>
                    <input id="Sort" name="Sort" class="easyui-numberbox" data-options="prompt:'',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).numberbox('clear');
                            }}] " />
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm').form('clear')">清空</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>
                    <a id="tip" href="javascript:void(0)" class="easyui-linkbutton easyui-tooltip" title="<div><p>温馨提示：<br/>&emsp;&emsp;双击表格一行也可以选择数据!</p></div>" data-options="plain:true,iconCls:'icon-help'"></a>
                </div>
            </div>
        </form>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitPage();
        });
        function InitPage() {
            var param = $.getUrlParam();
            if (!!param.Type) { $("#Type").val(param.Type); }
            if (!!param.IsMultiple) { $("#IsMultiple").val(param.IsMultiple); }
            InitDataGrid();
        }

        var column = [[

            { field: 'Type', title: '类别', width: 50, align: 'center', sortable: false },
            { field: 'Name', title: '名称', width: 100, align: 'center', sortable: false },
            { field: 'Sort', title: '排序序号', width: 20, align: 'center', sortable: false }
        ]];
        function InitDataGrid() {
            var IsSingleSelect = true;
            if ($("#IsMultiple").val() == "是") {
                IsSingleSelect = false;
                column[0].unshift({ field: 'ck', checkbox: true });
                $("#tip").hide();
            } 
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
                singleSelect: IsSingleSelect,
                checkOnSelect: true,
                selectOnCheck: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                sortOrder: "desc",
                remoteSort: false,
                onDblClickRow: function (index, row) {
                    if ($("#IsMultiple").val() == "否") {
                        LayerDialog.ReturnIsJson = true;
                        LayerDialog.Close(row);
                    }
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("DivfManage_Dictionary", "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
        }
        function Save() {
            var row = $("#dg").datagrid("getChecked");
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
