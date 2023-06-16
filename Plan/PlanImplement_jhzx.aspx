<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanImplement_jhzx.aspx.cs" Inherits="M_Main.Plan.hczgdj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划执行</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <script src="../jscript/QualityDictionaryCanNull.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../jscript/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
    <script type="text/javascript" src="../jscript/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="../jscript/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="hczgdj" runat="server">
        <input type="hidden" id="SubmitType" name="SubmitType" runat="server" />
        <div style="width: 110%; background-color: #cccccc;" id="TableContainer">
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 35;
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var frozenColumns = [[
                { field: 'PlanNO', title: '计划单号', width: 150, align: 'left', sortable: true },
            ]];

            var column = [[
                { field: 'ImpId', title: 'ImpId', width: 20, align: 'left', sortable: true, hidden: true },
                { field: 'DetailId', title: 'DetailId', width: 20, align: 'left', sortable: true, hidden: true },
                { field: 'Name', title: '计划周期', width: 60, align: 'left', sortable: true },
                { field: 'TypeName', title: '计划类型', width: 80, align: 'left', sortable: true },
                {
                    field: 'PlanName', title: '计划名称', width: 160, align: 'left', sortable: true

                },
                {
                    field: 'ActualStartTime', title: '本期实施开始时间', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.ActualStartTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ActualEndTime', title: '本期实施结束时间', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.ActualEndTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'Target', title: '本期完成目标', width: 80, align: 'left', sortable: true },
                { field: 'ActualTarget', title: '累计完成目标', width: 80, align: 'left', sortable: true, },
                { field: 'Cost', title: '本期完成费用（元）', width: 100, align: 'left', sortable: true },
                { field: 'ActualCost', title: '累计完成费用（元）', width: 100, align: 'left', sortable: true },
                { field: 'CheckTypeName', title: '本期考评类型', width: 80, align: 'left', sortable: true },
                { field: 'Point', title: '本期所得分值', width: 80, align: 'left', sortable: true },
                { field: 'CumulativePoint', title: '累计所得分值', width: 80, align: 'left', sortable: true },
                { field: 'GetCost', title: '本期所得金额（元）', width: 100, align: 'left', sortable: true },
                { field: 'CumulativeGetCost', title: '累计所得金额（元）', width: 100, align: 'left', sortable: true },
                { field: 'AssistMan', title: '协助人', width: 100, align: 'left', sortable: true },
                { field: 'PlanSourceName', title: '计划来源', width: 100, align: 'left', sortable: true },
                { field: 'AuditingState', title: '审核状态', width: 60, align: 'left', sortable: true },
            ]];

            var toolbar = [
                {
                    text: '新增执行',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (GetQueryString("IsClose") == "是") {
                            HDialog.Info("只能新增未关闭的计划明细的计划执行记录！", "只能新增未关闭的计划明细的计划执行记录！");
                            return;
                        }
                        if ($("#SubmitType").val() == "IsSubmit") {
                            HDialog.Open('920', '500', '../Plan/PlanImplement_Add.aspx?DetailId=' + GetQueryString('DetailId') + "&ImpId=" + row["ImpId"].toString() + "&SubmitType=" + $("#SubmitType").val(), '新增执行', true, function callback(_Data) {
                                LoadList();
                            });
                        } else {
                            HDialog.Open('920', '500', '../Plan/PlanImplement_Add.aspx?OpType=insert&DetailId=' + GetQueryString('DetailId') + "&SubmitType=" + $("#SubmitType").val(), '新增执行', true, function callback(_Data) {
                                LoadList();
                            });
                        }
                    }
                }, '-',
             {
                    text: '批量引用',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (GetQueryString("IsClose") == "是") {
                            HDialog.Info("只能新增未关闭的计划明细的计划执行记录！", "只能新增未关闭的计划明细的计划执行记录！");
                            return;
                        }
                        if ($("#SubmitType").val() == "IsSubmit") {
                            HDialog.Open('920', '500', '../Plan/PlanImplement_BatchReference.aspx?DetailId=' + GetQueryString('DetailId')+'&PlanId=' + GetQueryString('PlanId') + "&ImpId=" + row["ImpId"].toString() + "&SubmitType=" + $("#SubmitType").val(), '批量引用列表', true, function callback(_Data) {
                                LoadList();
                            });
                        } else {
                            HDialog.Open('920', '500', '../Plan/PlanImplement_BatchReference.aspx?DetailId=' + GetQueryString('DetailId')+'&PlanId=' + GetQueryString('PlanId') + "&SubmitType=" + $("#SubmitType").val(), '批量引用列表', true, function callback(_Data) {
                                LoadList();
                            });
                        }
                    }
                }
                , '-',
                {
                    text: '删除执行',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择删除数据", "请选择删除数据");
                            return;
                        }
                        HDialog.Prompt('是否删除该项!', function () {
                            if (row.AuditingState == "已审核" || row.AuditingState == "审核中") {
                                HDialog.Info("已送审核数据不能删除", "已送审核数据不能删除");
                                return;
                            }
                            $.tool.DataGet('CsPlan', 'DelImplement', 'ImpId=' + row["ImpId"].toString(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    LoadList();
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        });
                    }
                }
                , '-',
                {
                    text: '修改执行',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info("请选择修改数据", "请选择修改数据");
                            return;
                        }
                        if (row.AuditingState == "已审核" || row.AuditingState == "审核中") {
                            HDialog.Info("已送审核数据不能修改", "已送审核数据不能修改");
                            return;
                        }

                        HDialog.Open('920', '500', '../Plan/PlanImplement_Add.aspx?OpType=edit&DetailId=' + GetQueryString('DetailId') + "&ImpId=" + row["ImpId"].toString(), '修改执行', true, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
            ];


            function Edit(Id) {
                HDialog.Open('650', '400', '../Plan/PlanImplement_Add.aspx?OpType=edit&DetailId=' + Id + "&ImpId=" + row["ImpId"].toString(), '编辑执行', true, function callback(_Data) {
                    LoadList();
                });
            }

            function LoadList() {
                $.tool.DataGet('CsPlan', 'CanImplement', 'DetailId=' + GetQueryString('DetailId'),
                    function Init() {
                    },
                    function callback(_Data) {
                        var tool = toolbar;
                        if (_Data == "0")
                            tool = [];
                        var url = '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsPlan&Command=GetImplementList1&DetailId=' + GetQueryString('DetailId');
                        $("#TableContainer").datagrid({
                            url: url,
                            method: "get",
                            loadMsg: '数据加载中,请稍候...',
                            nowrap: false,
                            pageSize: 20,
                            pageList: [20, 50, 100],
                            frozenColumns: frozenColumns,
                            columns: column,
                            fitColumns: false,
                            singleSelect: true,
                            rownumbers: true,
                            pagination: true,
                            width: "100%",
                            border: false,
                            toolbar: toolbar,
                            sortOrder: "asc",
                        });
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
