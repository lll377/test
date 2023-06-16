<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysPointList.aspx.cs" Inherits="M_Main.ComprehensivePatrols.SysPointList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>通用点位</title>
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
        #dlg_search_point {
            padding: 10px;
            width: 800px;
            height: 90px;
        }

        .SearchTable {
            width: 800px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 8%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
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
    <div id="dlg_search_point" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <form id="frmPoint">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">任务类型</td>
                    <td class="TdContentSearch">
                        <select id="TaskType" runat="server" name="TaskType" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">任务点位</td>
                    <td class="TdContentSearch">
                        <input id="PointName" name="PointName" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">点位简称</td>
                    <td class="TdContentSearch">
                        <input id="PointCode" name="PointCode" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadListPoint();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmPoint').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
        <input type="hidden" id="SysPointId" name="SysPointId" runat="server" />
    </div>
    <script language="javascript" type="text/javascript">
        $(function () {
            LoadListPoint();
        });

        //--------------------------------------------------------------- 通用点位---------------------------------------------------
        var toolbarPoint = [
             {
                 text: '新增',
                 iconCls: 'icon-add',
                 handler: function () {
                     EditPoint("新增通用点位", '', "Insert");
                 }
             }, '-',
             {
                 text: '修改',
                 iconCls: 'icon-edit',
                 handler: function () {
                     var row = $("#tgPoint").datagrid("getSelected");
                     if (row) {
                         EditPoint('修改通用点位', row.SysPointId, "Edit");
                     } else {
                         HDialog.Info('请选择需要修改的通用点位数据!');
                     }
                 }
             }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#tgPoint").datagrid("getChecked");
                     if (row.length > 0) {
                         var IdList = "";
                         for (var i = 0; i < row.length; i++) {
                             IdList += row[i].SysPointId + ',';
                         }
                         if (IdList.length > 0) {
                             IdList = IdList.substring(IdList, IdList.length - 1);
                         }
                         DelPoint(IdList);
                     } else {
                         HDialog.Info('请勾选需要删除的通用点位数据!');
                     }
                 }
             }, '-',
             {
                 text: '筛选',
                 iconCls: 'icon-search',
                 handler: function () {
                     $('#dlg_search_point').dialog('open');
                 }
             }
        ];
        var columnPoint = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                { field: 'PointName', title: '任务点位', width: 120, align: 'left', sortable: true },
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
                toolbar: toolbarPoint,
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
                            checkOnSelect: true,
                            selectOnCheck: false,
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
            $("#dlg_search_point").dialog("close");
        }
        //通用点位编辑
        function EditPoint(title, id, OpType) {
            HDialog.OpenWin('500', '304', '../ComprehensivePatrols/SysPointEdit.aspx?ID=' + id + "&OpType=" + OpType, title, false, function callback(_Data) {
                if (_Data != "") {
                    LoadListPoint();
                }
            });
        }
        //删除通用点位 
        function DelPoint(id) {
            $.messager.confirm('确定', '是否确认删除勾选的通用点位?', function (r) {
                if (r) {
                    $.tool.DataGet('CpComPatrols', 'DeleteSysPointByIdList', "ID=" + id,
                          function Init() {
                          },
                          function callback(data) {
                              if (data == "true") {
                                  HDialog.Info("删除成功！");
                                  LoadListPoint();
                              } else {
                                  HDialog.Info(data);
                              }
                          },
                          function completeCallback() {
                          }, function errorCallback() {
                          });
                }
            });
        }

        //--------------------------------------------------------------- 通用对象---------------------------------------------------
        var toolbarObject = [
             {
                 text: '新增',
                 iconCls: 'icon-add',
                 handler: function () {
                     var row = $("#tgPoint").datagrid("getSelected");
                     if (row) {
                         EditObject("新增通用对象", '', "insert", row.SysPointId);
                     } else {
                         HDialog.Info('请选择添加对象的点位数据!');
                     }
                 }
             }, '-',
             {
                 text: '修改',
                 iconCls: 'icon-edit',
                 handler: function () {
                     var row = $("#tgObject").datagrid("getSelected");
                     if (row) {
                         EditObject('修改通用对象', row.SysObjId, "edit", row.SysPointId);
                     } else {
                         HDialog.Info('请选择需要修改的通用对象数据!');
                     }
                 }
             }, '-',
             {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#tgObject").datagrid("getChecked");
                     if (row.length > 0) {
                         var IdList = "";
                         for (var i = 0; i < row.length; i++) {
                             IdList += '‘' + row[i].SysObjId + '’,';
                         }
                         if (IdList.length > 0) {
                             IdList = IdList.substring(IdList, IdList.length - 1);
                         }
                         DelObject(IdList);
                     } else {
                         HDialog.Info('请勾选需要删除的通用对象数据!');
                     }
                 }
             }
        ];
        var columnObject = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
                { field: 'ObjName', title: '通用对象', width: 100, align: 'left', sortable: true },
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
                checkOnSelect: true,
                selectOnCheck: false,
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

        //编辑通用点位的对象
        function EditObject(title, id, OpType, parentID) {
            HDialog.OpenWin('500', '304', '../ComprehensivePatrols/SysPointObjectEdit.aspx?ID=' + id + "&OpType=" + OpType + "&SysPointId=" + parentID, title, false, function callback(_Data) {
                if (_Data != "") {
                    LoadListObject();
                }
            });
        }
        //批量删除通用点位下的通用对象
        function DelObject(id) {
            $.messager.confirm('确定', '是否确认删除勾选的通用对象?', function (r) {
                if (r) {
                    $.tool.DataGet('CpComPatrols', 'DeleteSysPointObjByIdList', "Id=" + id,
                          function Init() {
                          },
                          function callback(data) {
                              if (data == "true") {
                                  LoadListObject();
                              } else {
                                  HDialog.Info(data);
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

