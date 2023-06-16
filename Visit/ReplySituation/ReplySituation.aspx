<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReplySituation.aspx.cs" Inherits="M_Main.Visit.ReplySituation.ReplySituation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>字典</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <style type="text/css">
    </style>
</head>

<body>
    <input type="hidden" name="DType" id="DType" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 600px; height: 172px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frm">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>名称</span></td>
                    <td class="text">
                        <input id="DictionaryName" name="DictionaryName" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frm_Dictionary').form('clear')">清空</a>
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
            var DType = $.getUrlParam("DType");
            $("#DType").val(DType == 0 ? "问题类别" : "关闭原因");
            InitDataGrid();

        }
        var toolbar = [
            //{
            //    text: '新增',
            //    iconCls: 'icon-add',
            //    handler: function () {
            //        Edit("新增", '');
            //    }
            //}, '-',
            //{
            //    text: '编辑',
            //    iconCls: 'icon-edit',
            //    handler: function () {
            //        var row = $("#dg").datagrid("getSelected");
            //        if (row) {
            //            Edit('编辑', row.ID);
            //        } else {
            //            $.messager.alert("温馨提示", '请选择一行需要编辑的数据!');
            //        }
            //    }
            //}, '-',
            //{
            //    text: '删除',
            //    iconCls: 'icon-cancel',
            //    handler: function () {
            //        var row = $("#dg").datagrid("getSelected");
            //        if (row) {
            //            Del(row.ID);
            //        } else {
            //            $.messager.alert("温馨提示", '请选择需要删除的数据!');
            //        }
            //    }
            //}, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            },
            '-', {
                text: '返回',
                iconCls: 'icon-back',
                handler: function () {
                   history.back(-1);
                }
            }
        ];
        var column = [[
            //{ field: 'ck', checkbox: true },
            //{ field: 'DType', title: '类别', width: 50, align: 'left', sortable: false },
            { field: 'DictionaryName', title: '名称', width: 100, align: 'left', sortable: false },
            { field: 'DictionaryCode', title: '排序序号', width: 20, align: 'left', sortable: false }
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
                    param = $.getDataGridParam("IncidentBasicConfiguration", "GetReplySituationList", param);
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
            var param = { "OpType": OpType, "ID": id, "DType": $("#DType").val() };
            LayerDialog.OpenWin('400', '300', '../Visit/Dictionary/Edit_Single.aspx?' + $.param(param), title, true, function callback(_Data) {
                InitDataGrid();
            });
        }
        function Del(idList) {
            $.messager.confirm('确定', '是否删除?', function (r) {
                if (r) {
                    $.dataPostJson('Visit', 'DelDictionary', { "idList": idList }, true, false,
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
