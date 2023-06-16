<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompletionAcceptance.aspx.cs" Inherits="M_Main.RenovationNew.CompletionAcceptance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修验收列表</title>
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
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <style type="text/css">
      
    </style>
</head>
<body>
    <input type="hidden" name="RID" id="RID" />
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 800px; height: 180px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmPoint">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName" name="CustName" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign" name="RoomSign" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>许可证编号</span></td>
                    <td class="text">
                        <input id="LicenceNum" name="LicenceNum" class="easyui-textbox" />
                    </td>
                    <td class="title"><span>施工单位</span></td>
                    <td class="text">
                        <input id="BuildCompany" name="BuildCompany" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>开工时间</span></td>
                    <td class="text">
                        <input id="StartDate" name="StartDate" class="easyui-datebox" />
                    </td>
                    <td class="title"><span>完工时间</span></td>
                    <td class="text">
                        <input id="ActualCompleteDate" name="ActualCompleteDate" class="easyui-datebox" />
                    </td>
                </tr>
                <tr>
                    <td class="btn" colspan="4">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="InitDataGrid();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#dlg_search').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dlg_QRCode" class="easyui-dialog" data-options="modal:true,title:'照片',closed:true" style="width: 263px; height: 290px;">
        <img id="img_QRCode" width="250" height="250" style="margin: 0;" />
    </div>
    <script language="javascript" type="text/javascript">


        $(function () {
            $("#RID").val($.getUrlParam("RID"));
            InitTableHeight();
            InitDataGrid();
        });
        function InitTableHeight() {
            var h = $(window).height();
            $("#dg").css("height", h + "px");
        }
        //--------------------------------------------------------------- 通用点位---------------------------------------------------
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Edit("新增", "");
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
            }
        ];

        var column = [[
            { field: 'AcceptanceDepartment', title: '验收部门', width: 100, align: 'left', sortable: false },
            { field: 'AcceptancePeople', title: '验收人', width: 50, align: 'left', sortable: false },
            {
                field: 'AcceptanceDate', title: '验收时间', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'AcceptanceOrder', title: '验收次序', width: 50, align: 'left', sortable: false },
            { field: 'Qualified', title: '是否合格', width: 50, align: 'left', sortable: false },
            { field: 'AcceptanceIdea', title: '验收意见', width: 200, align: 'left', sortable: false },

        ]];
        function InitDataGrid() {
            var OpType = $.getUrlParam("OpType");
            if (OpType == "Detailed") {
                toolbar = [];
            }
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
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
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Renovation", "GetListCompletionAcceptance", "dg", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
            //$('#dg').datagrid('clearSelections');
            //$('#dg').datagrid('clearChecked');
            //$("#dlg_search").dialog("close");
        }

        function Edit(title, id) {
            var urlParam = $.param({ "ID": id, "RID": $("#RID").val() });
            HDialog.OpenWin('550', '600', '../RenovationNew/CompletionAcceptanceEdit.aspx?' + urlParam, title, true, function callback(data) {
                if (data=="是") {
                    Close();
                }
                //if (isValueNull(data)) {
                InitDataGrid();
                //}
            });
        }
        function Del(idList) {
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    $.tool.DataPostJson('Renovation', 'DelCompletionAcceptance', "idList=" + idList,
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
        function Close() {
            HDialog.CloseWindow("", parent.window.name);
        }
    </script>
</body>
</html>
