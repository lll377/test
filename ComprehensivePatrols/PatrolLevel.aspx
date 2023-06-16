<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatrolLevel.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PatrolLevel" %>

<!DOCTYPE html>
<html>
<head>
    <title>任务级别设置</title>
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
    <div id="dlg_search" class="easyui-dialog" title="筛选" style="width: 900px; height: 220px; max-width: 1024px; padding: 5px" data-options="
            iconCls:'icon-search',modal:true,closed:true">
        <form id="frmForm">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title3"><span>任务类型:</span></td>
                    <td class="text3">
                        <input id="TaskType" name="TaskType" class="easyui-combobox" tasktypedictionary="true" bindid="ID" bindname="Name" typename="任务类型" data-options="validType:['comboBoxValid[\'#TaskType\']'],
                        icons:[{iconCls:'icon-clear',
                        handler: function(e){
                            $(e.data.target).combobox('clear');
                        }}]" />
                    </td>
                    <td class="title3"><span>任务级别:</span></td>
                    <td class="text3">
                        <input id="TaskLevelName" name="TaskLevelName" class="easyui-textbox" />
                    </td>
                    <td class="title3"><span>是否评分:</span></td>
                    <td class="text3_1">
                        <input id="IsScore" name="IsScore" class="easyui-combobox" data-options="editable:true,required:false,panelHeight:'auto',validType:['comboBoxValid[\'#IsScore\']'],
                        data:[{value:'0',text:'否'},{value:'1',text:'是'}],
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).combobox('clear');
                            }}]" />
                    </td>

                </tr>
                <tr>
                    <td class="title3"><span>责任岗位:</span></td>
                    <td class="text" colspan="5">
                        <input id="TaskRoleCode" name="TaskRoleCode" class="easyui-textbox" data-options="editable:false,required:false,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetTaskRole('TaskRoleCode');},
                             icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                </tr>
                <tr>
                    <td class="title3"><span>计划设置岗位:</span></td>
                    <td class="text" colspan="5">
                        <input id="CheckRoleCode" name="CheckRoleCode" class="easyui-textbox" data-options="editable:false,required:false,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetTaskRole('CheckRoleCode');},
                             icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />

                    </td>
                </tr>
                <tr>
                    <td class="title3"><span>计划审核岗位:</span></td>
                    <td class="text" colspan="5">
                        <input id="AuditingRoleCode" name="AuditingRoleCode" class="easyui-textbox" data-options="editable:false,required:false,multiline:false,width:'98%',
                        buttonText:'请选择',buttonIcon:'icon-add',onClickButton:function(){GetTaskRole('AuditingRoleCode');},
                             icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />

                    </td>

                </tr>
                <tr>
                    <td class="btn" colspan="6">
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
                         Edit('变更', row.LevelId);
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
                         Del(row.LevelId);
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
                {
                    field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                }, {
                    field: 'TaskTypeName', title: '任务类型', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                }, {
                    field: 'TaskLevelName', title: '任务级别', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                }, {
                    field: 'TaskRoleCodeName', title: '责任岗位<b style="color:red">(通用岗位)<b/>', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                }, {
                    field: 'CheckRoleCodeName', title: '计划设置岗位<b style="color:red">(通用岗位)<b/>', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                }, {
                    field: 'AuditingRoleCodeName', title: '计划审核岗位<b style="color:red">(通用岗位)<b/>', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
            }, {
                field: 'CanSeeRoleCodeName', title: '计划可见岗位<b style="color:red">(通用岗位)<b/>', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            }, {
                    field: 'IsScore', title: '是否评分', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) {
                        value = "否";
                        if (row.IsScore == "1") {
                            value = "是";
                        }
                        return value;
                    }
                }, {
                    field: 'Remark', title: '备注', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        return value;
                    }
                }
        ]];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "LevelId",
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
                    param = $.JQForm.GetParam("CpComPatrols", "GetPatrolLevelList", "TableContainer", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {
                }
            });
            $("#dlg_search").dialog("close");
        }

        //选择岗位
        function GetTaskRole(id) {
            HDialog.OpenWin('700', '400', '../ComprehensivePatrols/DialogSelectRole.aspx', '选择岗位', false, function callback(data) {
                //console.log(data);
                var idRole = "", textRole = "";
                if (data != "") {
                    var arrayData = data.split('_');
                    idRole = arrayData[0];
                    textRole = arrayData[1];
                }
                $("#" + id).textbox("setValue", idRole);
                $('#' + id).textbox("setText", textRole);
            });
        }

        function Edit(title, id) {
            HDialog.OpenWin('1024', '370', '../ComprehensivePatrols/PatrolLevelEdit.aspx?ID=' + id, title, false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        function Del(id) {
            $.messager.confirm('确定', '是否删除该项?', function (r) {
                if (r) {
                    $.tool.DataPostJson('CpComPatrols', 'DelPatrolLevel', "ID=" + id,
                  function Init() {
                  },
                  function callback(data) {
                      if (data.result) {
                          LoadList();
                      } else { HDialog.Info(data.msg); }
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
