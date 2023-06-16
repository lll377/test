<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patrol.aspx.cs" Inherits="M_Main.RenovationNew.Patrol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修巡查列表</title>
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
            { field: 'PatrolPeople', title: '巡查人', width: 40, align: 'left', sortable: false },
            {
                field: 'PatrolDate', title: '巡查时间', width: 70, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd HH:mm");
                }
            },
            { field: 'ViolationSituation', title: '违章情况', width: 170, align: 'left', sortable: false },
            { field: 'RectificationSingle', title: '是否开据整改单', width: 50, align: 'left', sortable: false },
            {
                field: 'RectificationSingleDate', title: '整改单时间', width: 50, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return formatDate(value, "yyyy-MM-dd");
                }
            },
            { field: 'RectificationSingleNum', title: '整改单号', width: 80, align: 'left', sortable: false },
            {
                field: 'Opt', title: '操作', width: 40, align: 'left', sortable: false, formatter: function (value, row, index) {
                    return value = "<a onclick=\"Detailed('详情','" + row.ID + "');\" href=\"javascript:void(0)\">查看详情</a>";;
                }
            },
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
                toolbar: null,
                sortOrder: "desc",
                remoteSort: false,
                onDblClickRow: function (index, row) {
                     Detailed('详情',row.ID);
                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Renovation", "GetListPatrol", "dg", param);
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
            var urlParam = $.param({ "ID": id });
            HDialog.OpenWin('900', '570', '../RenovationNew/PatrolEdit.aspx?' + urlParam, title, true, function callback(data) {
                //if (isValueNull(data)) {
                InitDataGrid();
                //}
            });
        }
        function Detailed(title, id) {
            var pageparam = $.param({ "ID": id, "RID": $("#RID").val() });
            HDialog.OpenWin(900, 435, '../RenovationNew/PatrolDetailed.aspx?' + pageparam, title, true, function callback(data) {
                InitDataGrid();
            });
        }
        function Del(idList) {
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    $.tool.DataPostJson('Renovation', 'DelPatrol', "idList=" + idList,
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
