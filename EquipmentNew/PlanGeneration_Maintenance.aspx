<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanGeneration_Maintenance.aspx.cs" Inherits="M_Main.EquipmentNew.PlanGeneration_Maintenance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>维保任务生成</title>
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
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
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
                width: 20%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">任务生成时间</td>
                    <td class="TdContentSearch">
                        <input id="BeginTime" name="BeginTime" runat="server"
                            style="width: 100px; border: 1px #cccccc solid;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" />
                        到： 
                        <input id="EndTime" name="EndTime" runat="server"
                            style="width: 100px; border: 1px #cccccc solid;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" />
                    </td>
                    <td class="TdTitle">添加人</td>
                    <td class="TdContentSearch">
                        <input class="Control_IteminputNoStyle" id="AddUserName" name="AddUserName" style="width: 140px; border: 1px #cccccc solid;" />
                        <%--<input type="hidden" name="AddPId" value="" id="AddPId" />--%>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="UserCode" name="UserCode" runat="server" />
        <script type="text/javascript">
            function btnClear() {
                $("#BeginTime").val("");
                $("#EndTime").val("");
                $("#AddUserName").val("");
                //$("#AddPId").val("");
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            function ShowPatralPlanDetails(TaskProduceId, AddPId) {
                HDialog.Open('1400', '600', '../EquipmentNew/PlanGenerationComm_Maintenance.aspx?TaskProduceId=' + TaskProduceId + '&AddPId=' + AddPId, '任务批次项目列表', true, function callback(_Data) {
                    LoadList();
                });
            }
            //function SelUser() {
            //    HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
            //        if (_Data != "") {//**获得返回的参数信息
            //            var varObjects = JSON.parse(_Data);
            //            $("#AddPId").val(varObjects.UserCode);
            //            $("#AddUserName").val(varObjects.UserName);
            //        }
            //    });
            //}

            var column = [[
                { field: 'AddUserName', title: '添加人', width: 100, align: 'left', sortable: true },
                { field: 'AddTimeBegin', title: '添加时间', width: 100, align: 'left', sortable: true },
                {
                    field: 'BeginTime', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.BeginTime, 'yyyy-MM-dd');
                        return str;
                    }
                },
                {
                    field: 'EndTime', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.EndTime, 'yyyy-MM-dd');
                        return str;
                    }
                },
                {
                    field: 'TaskNum', title: '任务数量', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue;\"   onclick=\"ShowPatralPlanDetails('" + row.TaskProduceId + "','" + row.AddPId + "')\">" + row.TaskNum + "</a>";
                        return str;
                    }
                }
            ]];
            var toolbar = [
                {
                    text: '生成计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.OpenWinNoClose('800', '285', '../EquipmentNew/PlanGenerationAdd_Maintenance.aspx', '任务生成', true, function callback(_Data) {
                            LoadList();
                            if (_Data == "2") {//生成有错误  展示错误信息
                                HDialog.Open('1400', '600', '../EquipmentNew/PlanGenerationProblem_Maintenance.aspx', '生成信息', true, function callback(_Data) {
                                });
                            }
                        });
                    }
                }, '-',
                {
                    text: '删除计划',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $("#TableContainer").datagrid("getSelected");
                        if (rows.length == 0) {
                            HDialog.Info("请选择至少一行数据进行删除!");
                            return false;
                        } else {
                            if (rows.AddPId == $("#UserCode").val()) {
                                HDialog.Prompt('当本次生成的计划中，有任何一个计划详情已经开始执行（扫码一个及以上设备），那么不允许批量删除，只能按照计划详情进行删除!（若删除后需重新生成需到任务维护页面新增）', function () {
                                    //判断该任务批次计划详情是否已经开始执行
                                    if (IsTaskProduceImplement(rows.TaskProduceId) == false) {
                                        //删除计划详情
                                        DelRecord(rows.TaskProduceId);
                                    }
                                });
                            } else {
                                HDialog.Info("只能删除自己生成的计划汇总记录!");
                            }
                        }
                    }
                }, '-',
                {
                    text: '筛选计划',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '查看生成信息',
                    iconCls: 'icon-tip',
                    handler: function () {
                        HDialog.Open('1400', '600', '../EquipmentNew/PlanGenerationProblem_Maintenance.aspx', '生成信息', true, function callback(_Data) {
                        });
                    }
                }
            ];

            //判断该计划详情是否已经开始执行 
            function IsTaskProduceImplement(str) {
                var IsBool = false;
                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=IsTaskProduceImplement_Maintenance&TaskProduceId=' + str,
                    type: 'GET',
                    dataType: 'text',
                    cache: false,
                    async: false,
                    success: function (_Data) {
                        if (_Data == "true") {
                            HDialog.Info("生成的计划中，有任何一个计划详情已经开始执行，不允许删除");
                            IsBool = true;
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.alert('错误', '数据读取错误', 'error');
                    }
                });
                return IsBool;
            }

            //删除计划详情
            function DelRecord(TaskProduceId) {
                $.tool.DataGet('CsEquipment', 'DelTaskProduce_Maintenance', 'TaskProduceId=' + TaskProduceId,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("删除成功");
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetTaskProduceList_Maintenance&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();
        </script>
    </form>
</body>
</html>
