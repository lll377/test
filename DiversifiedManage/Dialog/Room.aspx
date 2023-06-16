<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.Room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>房屋选择</title>
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

            .form-horizontal .form-group {
                margin: 0;
                margin-top: 5px;
            }

                .form-horizontal .form-group:first-child {
                    margin: 0;
                }
    </style>
</head>
<body>
    <div id="layout" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',border:true,width:300,title:'楼宇列表'">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-12 col-xs-12" style="padding: 0">
                        <label class="control-label">楼宇名称</label>
                        <input id="TreeBuildName" name="TreeBuildName" class="easyui-textbox" data-options="prompt:'楼宇名称',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:63" onclick="LoadTree();">筛选</a>
                    </div>
                </div>
            </form>
            <ul id="tree" class="easyui-tree"></ul>
        </div>
        <div id="layout_center" data-options="region:'center',border:true,title:'房间列表 ( 温馨提示:双击表格一行也可以选择房屋! )',">
            <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
        </div>
    </div>
    <div id="toolbar" class="easyui-panel" data-options="closed:true" style="background: #F5F5F5">
        <div>
            <form id="frm" class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-sm-4 col-md-4" style="padding: 0">
                        <label class="control-label">楼&emsp;&emsp;宇</label>
                        <input id="BuildName" name="BuildName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </div>
                    <div class="col-sm-4 col-md-4" style="padding: 0">
                        <label class="control-label">单&emsp;&emsp;元</label>
                        <input type="hidden" id="TypeID" name="TypeID" />
                        <input id="UnitSNum" name="UnitSNum" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </div>
                    <div class="col-sm-4 col-md-4" style="padding: 0">
                        <label class="control-label">楼&emsp;&emsp;层</label>
                        <input id="FloorSNum" name="FloorSNum" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 col-md-4" style="padding: 0">
                        <label class="control-label">房屋编号</label>
                        <input id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </div>

                    <div class="col-sm-4 col-md-4" style="padding: 0">
                        <label class="control-label">房屋名称</label>
                        <input id="RoomName" name="RoomName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </div>
                    <div class="col-sm-4 col-md-4" style="padding: 0">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:65" onclick="InitDataGrid();">筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:65" onclick="$('#frm').form('clear')">清空</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:65" onclick="Save();">确定</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitPage()
            LoadTree();
            InitDataGrid();
            $("#layout_center").panel({
                onResize: function (width, height) {
                    SetToolbar(width)
                }
            });
        });
        function InitPage() {
            SetToolbar($("#layout_center").width());
        }
        function SetToolbar(w) {
            $('#toolbar').width(w);
        }

        function LoadTree() {
            $("#tree").tree({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                treeField: 'text',
                idField: 'id',
                lines: true,
                animate: true,
                border: false,
                loadMsg: '加载中,请稍侯...',
                onLoadSuccess: function (node, data) {
                    //console.log(node, data);
                    //InitDataGrid();
                    $("#tree").tree('collapseAll');
                    $.messager.progress('close');
                    //InitTableHeight();
                },
                onBeforeLoad: function (row, param) {
                    param.Class = "DivfManage_Dialog";
                    param.Method = "GetListTreeBuild";
                    param.BuildNum = "";
                    param.TreeBuildName = $("#TreeBuildName").textbox('getValue');
                    $.messager.progress({
                        title: '温馨提示',
                        msg: '正在加载数据,请稍候...',
                        interval: 3000
                    });
                },
                onBeforeSelect: function (node) {
                    //if (!$(this).tree('isLeaf', node.target)) {
                    //    return false;
                    //}
                },
                onSelect: function (row) {
                    //var isLeaf = $("#tree").tree('isLeaf', row.target);
                    //if (isLeaf) {
                    //    $('#layout_center').panel('setTitle', '房间列表-' + row.text);
                    //} else {
                    //    $('#layout_center').panel('setTitle', '房间列表');
                    //}
                    $('#layout_center').panel('setTitle', '房间列表-' + row.attributes.Location + '( 温馨提示:双击表格一行也可以选择房屋! )');


                    $("#UnitSNum").textbox('setValue', row.attributes.UnitSNum);
                    $("#FloorSNum").textbox('setValue', row.attributes.FloorSNum);
                    var BuildName = "";
                    if (row.attributes.Type == '楼宇') { BuildName = row.text; }
                    else {
                        row = $("#tree").tree('getParent', row.target);
                        while (!$("#tree").tree('isLeaf', row.target)) {
                            if (row.attributes.Type == '楼宇') {
                                BuildName = row.text;
                                break;
                            }
                            row = $("#tree").tree('getParent', row.target);
                        }
                    }
                    $("#BuildName").textbox('setValue', BuildName);
                    InitDataGrid();
                },
                onLoadError: function (arguments) {
                    $.messager.progress('close');
                    $.messager.alert("温馨提示", '系统错误!');
                }
            });
        }
        var column = [[
            { field: 'RoomSign', title: '房屋编号', width: 200, align: 'center', sortable: false },
            { field: 'RoomName', title: '房屋名称', width: 200, align: 'center', sortable: false },
            { field: 'CustName', title: '客户名称', width: 200, align: 'center', sortable: false },
            { field: 'BuildArea', title: '建筑面积', width: 100, align: 'center', sortable: false },
            { field: 'RegionName', title: '组团区域', width: 100, align: 'center', sortable: false },
            { field: 'BuildName', title: '楼宇', width: 200, align: 'center', sortable: false },
            { field: 'UnitSNum', title: '单元', width: 100, align: 'center', sortable: false },
            { field: 'FloorSNum', title: '楼层', width: 100, align: 'center', sortable: false },
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
                fitColumns: false,
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
                    param = $.getDataGridParam("DivfManage_Dialog", "GetListRoom", param);
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
