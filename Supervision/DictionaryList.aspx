<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DictionaryList.aspx.cs" Inherits="M_Main.Supervision.DictionaryList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数据字典</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
      
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 140px; padding: 10px; overflow: hidden;">
            <table class="dlg_table">
                <tr>
                    <td class="title">字典类别</td>
                    <td class="text">
                        <input id="DType" name="DType" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:false,
                            panelHeight:'auto',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '检查级别',text: '检查级别'},
                                {id: '问题类型',text: '问题类型'},
                                {id: '关闭原因',text: '关闭原因'}
                            ]" />
                    </td>
                    <td class="title">字典名称</td>
                    <td class="text">
                        <input id="Name" name="Name" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }


            var column = [[
                { field: 'Id', title: 'ID', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 20, align: 'left', sortable: true },
                { field: 'DType', title: '类别', width: 25, align: 'left', sortable: true },
                { field: 'Code', title: '编码', width: 25, align: 'left', sortable: true },
                {
                    field: 'Name', title: '名称', width: 45, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Edit('" + row.Id + "')\">" + row.Name + "</a>";
                        return str;
                    }
                }
            ]];

            function Edit(id) {
                HDialog.Open('400', '275', '../Supervision/DictionaryEdit.aspx?OpType=edit&Id=' + id, '编辑字典', true, function callback(_Data) {
                    LoadList();
                });
            }

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('400', '275', '../Supervision/DictionaryEdit.aspx?OpType=insert', '新增字典', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据");
                            return;
                        }
                        DelRecord(row.Id);
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function DelRecord(Id) {
                HDialog.Prompt('是否删除选中的数据!', function () {
                    $.tool.DataGet('CSSupervision', 'Del', 'TableName=Tb_Supervision_Dictionary&Id=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                HDialog.Info(_Data);
                                return;
                            }
                            LoadList();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetDictionaryList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: 0
                });
                $("#SearchDlg").dialog("close");
            }

            $(function () {
                InitTableHeight();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
                LoadList();
            });
        </script>
    </form>
</body>
</html>
