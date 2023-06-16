<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HeadquartersBasicQuery_SysPointSearch.aspx.cs" Inherits="M_Main.ComprehensivePatrols.HeadquartersBasicQuery_SysPointSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>总部基础查询-通用点位查询</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 70px;
            }

        .TdContentSearch {
            width: 160px;
        }

            .TdContentSearch input, select {
                border: 1px #cccccc solid;
            }
    </style>
</head>
<body class="easyui-layout" style="margin: 0px; padding: 0px; overflow: hidden;">
        <div data-options="region:'north',border:false" style="height: 300px;">
            <table id="tgPoint" border="0" cellspacing="0" cellpadding="0" style="height: 100%;"></table>
        </div>
        <div data-options="region:'center',border:false,title:'通用对象'">
            <table id="tgObject" border="0" cellspacing="0" cellpadding="0" style="height: 100%"></table>
        </div>

        <table id="ToolBarTable" class="SearchTable">
            <tr>
                <td class="TdTitle">任务类型</td>
                <td style="width: 100px;">
                    <select id="TaskType" runat="server" name="TaskType" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                        <option value=""></option>
                    </select>
                </td>
                <td class="TdTitle">通用点位</td>
                <td class="TdContentSearch">
                    <input id="PointName" name="PointName" class="easyui-textbox" />
                </td>
                <td class="TdTitle">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadListPoint();">查询</a>
                </td>
                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-page_white_excel'" onclick="Export();">导出Excel</a>
                </td>
            </tr>
        </table>
        <input type="hidden" id="SysPointId" name="SysPointId" runat="server" />
        <script language="javascript" type="text/javascript">
            $(function () {
                LoadListPoint();
            });

            //--------------------------------------------------------------- 通用点位---------------------------------------------------
            function Export() {
                var Rows = $("#tgPoint").datagrid("getRows");
                if (Rows.length == 0) {
                    HDialog.Info("没有通用点位数据导出!");
                    return;
                }
                var parameterStr = "TaskType=" + $('#TaskType').combobox("getValue") + "&PointName=" + $('#PointName').val();
                window.open("HeadquartersBasicQuery_SysPointSearchExport.aspx?" + parameterStr);
            }
            var columnPoint = [[
                    { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                    { field: 'PointName', title: '通用点位', width: 120, align: 'left', sortable: true },
                    { field: 'TaskTypeName', title: '任务类型', width: 150, align: 'left', sortable: true },
                    { field: 'PointCode', title: '点位简称', width: 80, align: 'left', sortable: true },
                    { field: 'Remark', title: '备注', width: 150, align: 'left', sortable: true }
            ]];
            function LoadListPoint() {
                $("#tgPoint").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnPoint,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: '#ToolBarTable',
                    sortOrder: "desc",
                    remoteSort: false,
                    onSelect: function (index, row) {
                        $('#SysPointId').val(row.SysPointId);
                        LoadListObject();
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CpComPatrols", "GetSysPointList", "tgPoint", param);
                    },
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            $("#tgPoint").datagrid("selectRow", 0);
                        } else {
                            $("#tgObject").datagrid({
                                url: '',
                                data: [],
                                method: "post",
                                nowrap: false,
                                pageSize: top.ListPageSize,
                                pageList: top.ListPageList,
                                columns: columnObject,
                                rownumbers: true,
                                fitColumns: true,
                                singleSelect: true,
                                border: false,
                                pagination: true,
                                width: "100%",
                                toolbar: toolbarObject,
                                sortOrder: "desc",
                                remoteSort: false,
                                border: false
                            });
                        }
                    }
                });
            }

            //--------------------------------------------------------------- 通用对象---------------------------------------------------
            var toolbarObject = [
            ];
            var columnObject = [[
                    { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                    { field: 'ObjName', title: '任务对象', width: 100, align: 'left', sortable: true },
                    { field: 'TaskTypeName', title: '任务类型', width: 100, align: 'left', sortable: true },
                    { field: 'Remark', title: '备注', width: 100, align: 'left', sortable: true }
            ]];
            function LoadListObject() {
                $("#tgObject").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columnObject,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbarObject,
                    sortOrder: "desc",
                    remoteSort: false,
                    border: false,
                    onBeforeLoad: function (param) {
                        //param = $.JQForm.GetParam("CpComPatrols", "GetSysPointObjectList", "tgObject", param);
                        param.Method = "DataPost";
                        param.Class = "CpComPatrols";
                        param.Command = "GetSysPointObjectList";
                        //通用点位
                        param.SysPointId = $("#SysPointId").val();
                    }
                });
            }

        </script>
</body>
</html>

