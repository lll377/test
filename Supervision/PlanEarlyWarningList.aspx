<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanEarlyWarningList.aspx.cs" Inherits="M_Main.Supervision.PlanEarlyWarningList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划列表</title>
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
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="background-color: #cccccc;" id="TableContainer"></div>
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="PlanId" name="PlanId" />
        <input type="hidden" id="CanEdit" name="CanEdit" />
        <input type="hidden" id="Frequency" name="Frequency" />
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TableContainer").css("width", w + "px");
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                { field: 'Sort', title: '序号', width: 100, align: 'left', sortable: true },
                { field: 'WarningMinute', title: '提前预警时间（分钟）', width: 100, align: 'left', sortable: true },
                { field: 'WarningDays', title: '提前预警时间天数', width: 100, align: 'left', sortable: true },
                { field: 'WarningRoleName', title: '预警岗位', width: 100, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open('800', '200', '../Supervision/PlanEarlyWarningEdit.aspx?OpType=insert&PlanId=' + $("#PlanId").val() + '&Frequency=' + encodeURI(encodeURI(decodeURI($("#Frequency").val()))), '新增预警信息', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
                , '-',
                {
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据");
                            return;
                        }
                        Edit(row.Id);
                    }
                }
                , '-',
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
                }
            ];

            function Edit(Id) {
                HDialog.Open('800', '200', '../Supervision/PlanEarlyWarningEdit.aspx?OpType=edit&Id=' + Id + '&Frequency=' + $("#Frequency").val(), '编辑预警信息', true, function callback(_Data) {
                    LoadList();
                });
            }

            function DelRecord(Id) {
                HDialog.Prompt('是否删除选中的数据!', function () {
                    $.tool.DataGet('CSSupervision', 'Del', 'TableName=Tb_Supervision_PlanEarlyWarning&Id=' + Id,
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
                var tool = null;
                if ($("#OpType").val() == 'edit' && $("#CanEdit").val() == "1")
                    tool = toolbar;
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=GetPlanEarlyWarningList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: tool,
                    sortOrder: "asc",
                    border: 0
                });
            }

            $(function () {
                $("#OpType").val(GetQueryString('OpType'));
                $("#PlanId").val(GetQueryString('Id'));
                $("#Frequency").val(GetQueryString('Frequency'));
                InitTableHeight();
                $.tool.DataGet('CSSupervision', 'CheckPlanCanEdit', 'Id=' + $("#PlanId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#CanEdit").val(_Data);
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
