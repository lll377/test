<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.Renting.BaseSet.Dictionary.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁管理-字典设置列表页面</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" id="ClassName" name="ClassName" value="Renting_Dictionary" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 600px; height: auto;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="formMain" class="form-horizontal" role="form">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">查询信息</legend>
                <div class="form-group">
                    <label class="col-sm-1 col-xs-1 control-label">类型</label>
                    <div class="col-sm-5 col-xs-5">
                        <%--<input id="Type" name="Type" class="easyui-combobox"
                            data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:false,
                                    valueField:'id',textField:'text',data: [
                                        {id: '物业细类',text: '物业细类'},{id: '经营业态',text: '经营业态'},{id: '跟进阶段',text: '跟进阶段'},{id: '经营品牌',text: '经营品牌'},
                                        {id: '品牌代理级别',text: '品牌代理级别'},{id: '主营车型',text: '主营车型'},{id: '经营地址',text: '经营地址'},{id: '退租原因',text: '退租原因'}]"
                            runat="server" />--%>
                        <input id="Type" name="Type" class="easyui-combobox"
                            data-options="required:false,editable:false,tipPosition:'bottom',panelHeight:'auto',width:'100%',multiple:false,
                                    valueField:'id',textField:'text',data: [
                                        {id: '物业细类',text: '物业细类'},{id: '经营业态',text: '经营业态'},{id: '跟进阶段',text: '跟进阶段'},{id: '退租原因',text: '退租原因'}]"
                            runat="server" />
                    </div>
                    <label class="col-sm-1 col-xs-1 control-label">名称</label>
                    <div class="col-sm-5 col-xs-5">
                        <input id="Name" name="Name" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',width:'100%'" />
                    </div>
                </div>
            </fieldset>
            <div class="form-group">
                <div class="col-sm-12 col-xs-12" style="text-align: center">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#formMain').form('clear')">清空</a>
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
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Edit("新增字典", '');
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        Edit('编辑字典', row.ID);
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
                        Del(row.ID);
                    } else {
                        $.messager.alert("温馨提示", '请选择需要删除的数据!');
                    }
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }
        ];
        var column = [[
            { field: 'Type', title: '类型', width: 50, align: 'center', sortable: false },
            { field: 'Code', title: '编码', width: 50, align: 'center', sortable: false },
            { field: 'Name', title: '名称', width: 100, align: 'center', sortable: false },
            { field: 'Sort', title: '序号', width: 20, align: 'center', sortable: false }
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
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                remoteSort: false,
                onBeforeLoad: function (param) {
                    param.SortOrder = 0;
                    param.IsDelete = 0;
                    param.SortField = "Sort";
                    param = $.getDataGridParam($("#ClassName").val(), "GetList", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $('#dg').datagrid('clearSelections');
            $("#dlg_search").dialog("close");
        }

        function Edit(title, id) {
            var param = $.getParam()
            var opType = "Add";
            if (!!id) { opType = "Edit"; }
            var param = {
                OpType: opType,
                ID: id
            }
            LayerDialog.OpenWin('500', '360', '/HM/M_Main/Renting/BaseSet/Dictionary/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                if (_Data != "") {
                    InitDataGrid();
                }
            });
        }
        function Del(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.dataPostJson($("#ClassName").val(), 'Del', { "idList": idList }, true, false,
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
    </script>
</body>
</html>
