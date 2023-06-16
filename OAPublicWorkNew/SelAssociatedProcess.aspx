<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelAssociatedProcess.aspx.cs" Inherits="M_Main.OAPublicWorkNew.SelAssociatedProcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择关联流程</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .toolbartable {
            margin: 0px 10px;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="padding: 5px; width: 460px;" data-options="iconCls:'icon-search',modal:true,closed:true">
        <form id="mainForm">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>发起时间</span></td>
                    <td class="text">
                        <input type="text" id="StartDate" name="StartDate" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="title"><span>至</span></td>
                    <td class="text">
                        <input type="text" id="EndDate" name="EndDate" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>流程标题</span></td>
                    <td class="text" colspan="3">
                        <input id="Key" name="Key" class="easyui-textbox" data-options="prompt:'请输入流程标题',width:'100%',
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4" style="text-align: center;">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:100" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#mainForm').form('clear');">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <input type="hidden" id="OAType" name="OAType" value="" runat="server" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <script language="javascript" type="text/javascript">
        $(function () {
            InitDataGrid();
        });

        var column = [[
            { field: 'Title', title: '流程标题', width: 100, align: 'center' },
            {
                field: 'WorkDays', title: '完结时间', width: 30, align: 'center', formatter: function (value, row, index) {
                    return value + "天前";
                }
            },
            {
                field: 'WorkStartDate', title: '发起时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd');
                }
            }
        ]];
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search').dialog('open');
                }
            }, '-',
            {
                text: '确定',
                iconCls: 'icon-ok',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                        ClosePage(row);
                    } else {
                        $.messager.alert('温馨提示', "请选择关联流程");
                    }
                }
            }, '-',
            {
                text: '取消选择',
                iconCls: 'icon-cancel',
                handler: function () {
                    HDialog.Close("Cancel");
                }
            }, '-',
            {
                text: '放弃返回',
                iconCls: 'icon-cancel',
                handler: function () {
                    HDialog.Close("");
                }
            }
        ];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: true,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                onDblClickRow: function (rowIndex, rowData) {
                    ClosePage(rowData);
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("OASearch", "GetAssociatedProcessList", "dg", param);
                },
                onLoadSuccess: function (data) {

                }
            });
            $('#dlg_search').dialog('close');
        }

        function ClosePage(row) {
            HDialog.ReturnIsJson = true;
            HDialog.Close(row);
        }
    </script>
</body>
</html>

