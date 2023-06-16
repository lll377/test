<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskFollowUpNoComplete_Inspection.aspx.cs" Inherits="M_Main.EquipmentNew.TaskFollowUpNoComplete_Inspection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>巡检任务跟进--未完成任务</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: auto;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-left: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
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

        .tabs-container .panel-body {
            border-color: #95B8E7;
            border-width: 1px;
            border-style: solid;
            padding: 0px;
        }
    </style>
</head>
<body class="easyui-layout" style="margin: 0px; padding: 0px; overflow: hidden;">
    <div style="width: 100%; background-color: #cccccc;" id="DivContainer">
    </div>
    <div class="tabs-container">
        <ul class="nav nav-tabs">
            <li class="active" name="room" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">空间巡检</a>
            </li>
            <li class="" name="cust" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">设备巡检</a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane active">
                <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetailSpace">
                </div>
            </div>
            <div id="tab-2" class="tab-pane">
                <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetail">
                </div>
            </div>
        </div>
    </div>
    <div id="dlg_search_point" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
        <form id="frmFrom">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">任务编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskNO" name="TaskNO" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">设备系统</td>
                    <td class="TdContentSearch">
                        <select id="SystemId" runat="server" name="SystemId" data-options="editable:false,panelHeight:'auto',multiple:true" class="easyui-combobox">
                        </select>
                    </td>
                    <td class="TdTitle">设备空间</td>
                    <td class="TdContentSearch">
                        <input id="SpaceName" name="SpaceName" type="text" class="easyui-textbox" readonly />
                        <input type="hidden" id="SpaceId" name="SpaceId" />
                    </td>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskBeginTime" name="TaskBeginTime" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskBeginTimeEnd" name="TaskBeginTimeEnd" class="easyui-datebox" data-options="editable:false" />
                    </td>

                    <td class="TdTitle">结束时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskEndTime" name="TaskEndTime" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskEndTimeEnd" name="TaskEndTimeEnd" class="easyui-datebox" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">巡检内容</td>
                    <td class="TdContentSearch">
                        <input type="text" id="InspectionContent" name="InspectionContent" maxlength="1000" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">责任岗位</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskRoleName" name="TaskRoleName" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContentSearch">
                        <input type="text" id="TaskUserName" name="TaskUserName" class="easyui-textbox" />
                    </td>
                    <td class="TdTitle">任务类别</td>
                    <td class="TdContentSearch">
                        <select id="TaskSource" name="TaskSource" runat="server" data-options="editable:false,panelHeight:'auto'" class="easyui-combobox">
                            <option value=""></option>
                            <option value="自动生成">自动生成</option>
                            <option value="手动生成">手动生成</option>
                            <option value="维护生成">维护生成</option>
                            <option value="临时任务">临时任务</option>
                        </select>
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">关闭人</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CloseUserName" readonly name="CloseUserName" class="easyui-textbox" />
                        <input type="hidden" id="CloseUserId" name="CloseUserId" />
                    </td>
                    <td class="TdTitle">关闭时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CloseTime" name="CloseTime" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CloseTimeEnd" name="CloseTimeEnd" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">巡检人</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ExecuteUserName" name="ExecuteUserName" readonly class="easyui-textbox" />
                        <input type="hidden" id="ExecuteUserId" name="ExecuteUserId" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">巡检时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ExecuteBeginTimeStart" name="ExecuteBeginTimeStart" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="ExecuteBeginTimeEnd" name="ExecuteBeginTimeEnd" class="easyui-datebox" data-options="editable:false" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadBind();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmFrom').form('clear')">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="IsFireControl" name="IsFireControl" />
    <input type="hidden" id="isDesk" name="isDesk" />
    <input type="hidden" id="Flag" name="Flag" value="NoComplete" runat="server" />
    <script type="text/javascript">
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        //页面初始化
        $(function () {
            $("#IsFireControl").val(GetQueryString('IsFireControl'));
            $("#isDesk").val(GetQueryString('isDesk'));
            $('#SystemId').combobox("clear");
            InitTableHeight();
            LoadBind();
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                $("#DivContainerDetail").datagrid("resize");
                $("#DivContainerDetailSpace").datagrid("resize");
            });
            //设备空间名称
            $('#SpaceName').textbox('textbox').bind("click", function () {
                if ($('#SystemId').combobox("getValues") == "") {
                    HDialog.Info("请先选择设备系统");
                    return;
                }
                var parameterStr = "?SystemId=" + $('#SystemId').combobox("getValues") + "&CommId=" + $('#CommID').val();

                HDialog.OpenWin('500', '450', '../EquipmentNew/SelSpace.aspx' + parameterStr, '选择设备空间', false, function callback(_Data) {
                    if (_Data != "") {
                        var arrRet = JSON.parse(_Data);
                        $("#SpaceId").val(arrRet.SpaceId);
                        $("#SpaceName").textbox("setValue", arrRet.SpaceName);
                    }
                });
            });

            //关闭人
            $('#CloseUserName').textbox('textbox').bind("click", function () {
                var parameterStr = "?IsSingle=1&CommId=" + $('#CommID').val();
                HDialog.OpenWin('650', '500', '../EquipmentNew/SelUser.aspx' + parameterStr, '选择人员', false, function callback(_Data) {
                    if (_Data != "") {
                        $("#CloseUserId").val(_Data.split(';')[1]);
                        $("#CloseUserName").textbox('setValue', _Data.split(';')[0]);
                    }
                });
            });

            //巡检人
            $('#ExecuteUserName').textbox('textbox').bind("click", function () {
                var parameterStr = "?IsSingle=1&CommId=" + $('#CommID').val();
                HDialog.OpenWin('650', '500', '../EquipmentNew/SelUser.aspx' + parameterStr, '选择人员', false, function callback(_Data) {
                    if (_Data != "") {
                        $("#ExecuteUserId").val(_Data.split(';')[1]);
                        $("#ExecuteUserName").textbox('setValue', _Data.split(';')[0]);
                    }
                });
            });

        });

        function InitTableHeight() {
            var h = $(window).height();
            $("#DivContainer").css("height", h / 2 - 15 + "px");
            $("#DivContainerDetail").css("height", h / 2 - 25 + "px");
            $("#DivContainerDetailSpace").css("height", h / 2 - 25 + "px");
        }

        //巡检任务
        var toolbar =
            [
                {
                    text: '导出Excel',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var Rows = $('#DivContainer').datagrid("getRows");
                        if (Rows.length == 0) {
                            HDialog.Info("没有可以导出的数据");
                            return;
                        }
                        window.open("TaskFollowUpExport.aspx?Type=Inspection&Flag=" + $('#Flag').val() + "&CommID=" + $('#CommID').val() + "&" + $("#frmFrom").serialize());
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
        var frozenColumns = [[
            { field: 'ck', checkbox: true },
            { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true }
        ]];

        var column = [[
            { field: 'TaskNO', title: '任务编号', width: 130, align: 'left', sortable: true },
            { field: 'SystemName', title: '设备系统', width: 100, align: 'left', sortable: true },
            { field: 'SpaceName', title: '空间名称', width: 100, align: 'left', sortable: true },
            { field: 'PlanName', title: '计划名称', width: 170, align: 'left', sortable: true },
            { field: 'InspectionContent', title: '巡检内容', width: 200, align: 'left', sortable: true },
            { field: 'TaskBeginTime', title: '开始时间', width: 145, align: 'left', sortable: true },
            { field: 'TaskEndTime', title: '结束时间', width: 145, align: 'left', sortable: true },
            { field: 'TaskRoleName', title: '责任岗位', width: 110, align: 'left', sortable: true },
            { field: 'TaskUserName', title: '责任人', width: 110, align: 'left', sortable: true },
            { field: 'Remark', title: '备注', width: 120, align: 'left', sortable: true },
            { field: 'TaskSource', title: '任务类型', width: 80, align: 'left', sortable: true },
            { field: 'TaskStatueName', title: '任务状态', width: 60, align: 'left', sortable: true },
            { field: 'IsOverDueName', title: '是否过期', width: 90, align: 'left', sortable: true },
            { field: 'IsCloseName', title: '是否关闭', width: 90, align: 'left', sortable: true },
            { field: 'CloseUserName', title: '关闭人', width: 60, align: 'left', sortable: true },
            { field: 'CloseTime', title: '关闭时间', width: 145, align: 'left', sortable: true },
            { field: 'CloseReasonName', title: '关闭原因', width: 80, align: 'left', sortable: true },
            { field: 'ExecuteUserName', title: '巡检人', width: 60, align: 'left', sortable: true },
            { field: 'ExecuteBeginTime', title: '巡检开始时间', width: 145, align: 'left', sortable: true },
            { field: 'ExecuteEndTime', title: '巡检结束时间', width: 145, align: 'left', sortable: true },
            { field: 'InspectionHours', title: '巡查工时', width: 80, align: 'left', sortable: true }
        ]];

        //加载巡检任务
        function LoadBind() {
            $("#DivContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                frozenColumns: frozenColumns,
                rownumbers: true,
                fitColumns: false,
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "desc",
                remoteSort: false,
                onSelect: function (index, row) {
                    LoadBindDetail();
                    LoadBindDetailSpace();
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("CsEquipment", "GetTaskFollowUpList_Inspection", "DivContainer", param);
                },
                onLoadSuccess: function (data) {
                    if (data.rows.length > 0) {
                        $("#DivContainer").datagrid("selectRow", 0);
                    } else {
                        LoadBindDetail();
                        LoadBindDetailSpace();
                    }
                }
            });
            $("#dlg_search_point").dialog("close");
        }

        var columnDetail = [[
            { field: 'EquipmentName', title: '设备名称', width: 40, align: 'left', sortable: true },
            { field: 'ResultDescribe', title: '巡检描述', width: 60, align: 'left', sortable: true },
            { field: 'Result', title: '巡检结果', width: 25, align: 'left', sortable: true },
            {
                field: 'IncidentCount', title: '查看报事', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" onclick=\"IncidentView('" + row.TaskEquipmentId + "','" + row.TaskId + "','" + row.CommID + "');\">" + value + "</a>";
                    return str;
                }
            },
            {
                field: 'fj', title: '附件', width: 15, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" onclick=\"UploadFileView('" + row.EquipmentId + "','" + row.TaskId + "','" + row.CommID + "');\">查看附件</a>";
                    return str;
                }
            },
            {
                field: 'xq', title: '查看详情', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" onclick=\"checkPatrolMsgDetail('" + row.EquipmentId + "','" + row.TaskId + "','" + row.CommID + "');\">查看详情</a>";
                    return str;
                }
            }
        ]];

        var columnDetailSpace = [[
            { field: 'SpaceName', title: '空间名称', width: 40, align: 'left', sortable: true },
            { field: 'ResultDescribe', title: '巡检描述', width: 60, align: 'left', sortable: true },
            { field: 'Result', title: '巡检结果', width: 25, align: 'left', sortable: true },
            {
                field: 'IncidentCount', title: '查看报事', width: 25, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" onclick=\"IncidentView('" + row.TaskSpaceId + "','" + row.TaskId + "','" + row.CommID + "');\">" + value + "</a>";
                    return str;
                }
            },
            {
                field: 'fj', title: '附件', width: 15, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" onclick=\"UploadFileView('" + row.SpaceId + "','" + row.TaskId + "','" + row.CommID + "');\">查看附件</a>";
                    return str;
                }
            },
            {
                field: 'xq', title: '查看详情', width: 20, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a class=\"HrefStyle\" onclick=\"checkPatrolMsgDetailSpace('" + row.SpaceId + "','" + row.TaskId + "','" + row.CommID + "');\">查看详情</a>";
                    return str;
                }
            }
        ]];

        //查看报事
        function IncidentView(TaskEquipmentId, TaskId, CommID) {
            HDialog.Open('800', '600', '../EquipmentNew/TaskEquipmentIncidentList.aspx?TaskEquipmentId=' + TaskEquipmentId + '&TaskId=' + TaskId + "&CommID=" + CommID, '查看报事', true, function callback(_Data) {
            });
        }

        //查看附件
        function UploadFileView(EquipmentId, TaskId, CommID) {
            HDialog.Open('600', '340', '../EquipmentNew/EquipmentUploadView_AppFiles.aspx?EquipmentId=' + EquipmentId + '&TaskId=' + TaskId + "&CommID=" + CommID, '查看附件', true, function callback(_Data) {
            });
        }
        //查看详情
        function checkPatrolMsgDetail(EquipmentId, TaskId, CommID) {
            HDialog.Open('840', '450', '../EquipmentNew/TaskFollowUpLineDetail_Inspection.aspx?EquipmentId=' + EquipmentId + '&TaskId=' + TaskId + "&CommID=" + CommID, '设备工艺路线详情', true, function callback(_Data) {
            });
        }
        //查看详情
        function checkPatrolMsgDetailSpace(SpaceId, TaskId, CommID) {
            HDialog.Open('840', '450', '../EquipmentNew/TaskFollowUpLineDetail_Inspection_Space.aspx?SpaceId=' + SpaceId + '&TaskId=' + TaskId + "&CommID=" + CommID, '空间工艺路线详情', true, function callback(_Data) {
            });
        }

        //加载巡检设备列表
        function LoadBindDetail(Id) {
            var TaskId = '99999999999999999';
            var DivContainerSelectId = $('#DivContainer').datagrid("getSelected");
            if (DivContainerSelectId != null) {
                TaskId = DivContainerSelectId.TaskId;
            }
            $("#DivContainerDetail").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                singleSelect: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnDetail,
                fitColumns: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                selectOnCheck: false,
                checkOnSelect: false,
                width: "100%",
                remoteSort: false,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "CsEquipment";
                    param.Command = "GetTaskFollowUpEquipmentList_Inspection";
                    param.TaskId = TaskId;
                    param.CommID = $('#CommID').val();
                }
            });
        }

        //加载巡检空间列表
        function LoadBindDetailSpace(Id) {
            var TaskId = '99999999999999999';
            var DivContainerSelectId = $('#DivContainer').datagrid("getSelected");
            if (DivContainerSelectId != null) {
                TaskId = DivContainerSelectId.TaskId;
            }
            $("#DivContainerDetailSpace").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                singleSelect: true,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: columnDetailSpace,
                fitColumns: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                selectOnCheck: false,
                checkOnSelect: false,
                width: "100%",
                remoteSort: false,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param.Method = "DataPost";
                    param.Class = "CsEquipment";
                    param.Command = "GetTaskFollowUpSpaceList_Inspection";
                    param.TaskId = TaskId;
                    param.CommID = $('#CommID').val();
                }
            });
        }
    </script>
</body>
</html>
