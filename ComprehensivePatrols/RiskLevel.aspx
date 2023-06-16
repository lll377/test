<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiskLevel.aspx.cs" Inherits="M_Main.ComprehensivePatrols.RiskLevel" %>

<!DOCTYPE html>
<html>
<head>
    <title>巡查级别设置</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <style type="text/css">
        select {
            min-width: 50px;
        }
    </style>
</head>
<body>
    <table id="TableContainer" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 400px; height: 120px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmForm">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>风险等级:</span></td>
                    <td class="text">
                        <input id="Level" name="Level" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="2">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script language="javascript" type="text/javascript">
        function PageInfo() {

        }
        $(function () {
            InitTableHeight();
            LoadList();
            PageInfo();

        });
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
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
                     var row = $("#TableContainer").datagrid("getSelected");
                     if (row) {
                         Edit('变更', row.ID);
                     } else {
                         HDialog.Info('请选择一行需要变更的数据!');
                     }
                 }
             }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#TableContainer").datagrid("getSelected");
                     if (row) {
                         Del(row.ID);
                     } else {
                         HDialog.Info('请选择一行需要删除的数据!');

                     }
                 }
             }, '-',
             {
                 text: '筛选',
                 iconCls: 'icon-search',
                 handler: function () {
                     // $('#dlg_search').parent().appendTo($("form:first"))

                     $('#dlg_search').dialog('open');
                 }
             }
        ];

        var column = [[
                { field: 'Sort', title: '等级序号', width: 50, align: 'left', sortable: true },
                { field: 'Level', title: '风险等级', width: 100, align: 'left', sortable: true },
                { field: 'Coefficient', title: '风险系数', width: 100, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 100, align: 'left', sortable: true }
        ]];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onDblClickRow: function (index, row) {
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CpComPatrols", "GetListRiskLevel", "TableContainer", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_search").dialog("close");
        }


        function Edit(title, id) {
            HDialog.OpenWin('800', '220', '../ComprehensivePatrols/RiskLevelEdit.aspx?ID=' + id, title, true, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        function Del(id) {
            $.messager.confirm('确定', '是否删除该项?', function (r) {
                if (r) {
                    $.tool.DataPostJson('CpComPatrols', 'DelRiskLevel', "ID=" + id,
                  function Init() {
                  },
                  function callback(data) {
                      if (data.result) {
                          LoadList();
                      } else {
                          HDialog.Info(data.msg);
                      }
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
