<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="M_Main.DiversifiedManage.PointManage.Category.List" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>点位类别设置</title>
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
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 600px; height: 190px;" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">点位类型</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="Type" name="Type" class="easyui-combobox" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">点位类别</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="Name" name="Name" class="easyui-textbox" />
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 col-xs-2 control-label">类别代码</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="Code" name="Code" class="easyui-textbox" />
                </div>
                <label for="inputPassword" class="col-sm-2 col-xs-2 control-label">序号</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="Sort" name="Sort" class="easyui-numberbox" />
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
            InitControl();
            InitDataGrid();
        }
        function InitControl() {
            var data = [{ id: '房屋', text: '房屋' },{ id: '车位', text: '车位' },{ id: '广告', text: '广告' },{ id: '场地', text: '场地' }];
            $('#Type').combobox({
                required: false,
                editable: false,
                tipPosition: 'bottom',
                panelHeight: 'auto',
                valueField: 'id', textField: 'text',
                data: data,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });
        }

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
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
            },
            //'-', {
            //    text: '导出',
            //    iconCls: 'icon-page_white_excel',
            //    handler: function () {
            //        if ($("#CommID").val() == "-1") {
            //            $.messager.alert('温馨提示', '请选择项目!');
            //            return;
            //        }
            //        window.open("EqSpaceListoutput.aspx?random=" + Math.random());
            //    }
            //}
        ];
        var column = [[
            //{ field: 'ck', checkbox: true },
            { field: 'Type', title: '点位类型', width: 30, align: 'center', sortable: false },
            { field: 'Name', title: '点位类别', width: 50, align: 'center', sortable: false },
            { field: 'Code', title: '类别代码', width: 50, align: 'center', sortable: false },
            { field: 'Remark', title: '备注', width: 100, align: 'center', sortable: false },
            { field: 'Sort', title: '排序序号', width: 20, align: 'center', sortable: false }
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
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onClickRow: function (index, row) {
                },
                onBeforeLoad: function (param) {
                    param = $.getDataGridParam("DivfManage_Category", "GetList", param);
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
            if (isValueNull(id)) { OpType = "Edit"; }
            var param = { "OpType": OpType, "ID": id };
            LayerDialog.OpenWin('400', '350', '/HM/M_Main/DiversifiedManage/PointManage/Category/Edit.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Del(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.dataPostJson('DivfManage_Category', 'Del', { "idList": idList }, true, false,
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
