<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectHandoverRegistration.aspx.cs" Inherits="M_Main.DutyManage.ProjectHandoverRegistration" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>交班登记事项</title>
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
    <script src="../jscript/uuid.js" type="text/javascript"></script>
        <script src="../jscript/help.js" type="text/javascript"></script>
    <style type="text/css">
      
    </style>
</head>
<body>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
        <form id="frmPoint">
            <input type="hidden" id="ProjectTemplateID" name="ProjectTemplateID"/>
            <input type="hidden" id="OpType" name="OpType"/>
           
        </form>
    <script language="javascript" type="text/javascript">

        $(function () {
            InitTableHeight();
            onLoad();
            InitDataGrid();

        });
        function InitTableHeight() {
            var h = $(window).height();
            $("#dg").css("height", h + "px");
        }
        function onLoad() {
            $("#ProjectTemplateID").val($.getUrlParam("ProjectTemplateID"));
            $("#OpType").val($.getUrlParam("OpType"));
        }
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                     var OpType = $("#OpType").val();
                    if (OpType == "Add") {
                        $.messager.alert("温馨提示", '请先添加主数据!');
                        return false;
                    }
                    Edit("新增", "Add", "", $("#ProjectTemplateID").val());
                }
            }, '-',
            {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#dg").datagrid("getSelected");
                    if (row) {
                            Edit('编辑', "Edit", row.ID,$("#ProjectTemplateID").val());
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
            { field: 'Sort', title: '序号', width: 50, align: 'left', sortable: true },
            { field: 'HandoverRegister', title: '事项名称', width: 200, align: 'left', sortable: true },
            { field: 'GuidelinesForWork', title: '工作指引', width: 200, align: 'left', sortable: true },
            {
                field: 'IsMustFill', title: '是否必填', width: 250, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "";
                    if (row.IsMustFill == "0") {
                        str = "否";
                    } else if (row.IsMustFill == "1") {
                        str = "是";
                    } else {
                        str = "否";
                    }
                    return str;
                }
            },
            { field: 'Remark', title: '备注', width: 280, align: 'left', sortable: true }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: false,
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
                onDblClickRow: function (index, row) {
                   // Edit("详情", "Detailed", row.ID,$("#ProjectTemplateID").val());
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Duty", "SearchProjectHandoverRegistration", "dg", param);
                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (data) {

                }
            });
            $("#dlg_search").dialog("close");
        }

        function Edit(title, OpType, ID) {
            var urlParam = $.param({ "OpType": OpType, "ID": ID,"ProjectTemplateID":$("#ProjectTemplateID").val()});
            HDialog.OpenWin('800', '360', '../DutyManage/ProjectHandoverRegistrationEdit.aspx?' + urlParam, title, true, function callback(data) {
                if (data != null && data != "") {
                    $.messager.alert('温馨提示',data);
                }
                InitDataGrid();
            });
        }
        function Del(idList) {
            $.messager.confirm('温馨提示', '确定删除?', function (r) {
                if (r) {
                    $.tool.DataPostJson('Duty', 'DelProjectHandoverRegistration', "ID=" + idList,
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


