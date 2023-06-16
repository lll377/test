<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyEventReportList.aspx.cs" Inherits="M_Main.Emergency.EmergencyEventReportList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急事件报告</title>
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
        #dlg_search_AuditSet {
            padding: 10px;
            width: 740px;
            height: 230px;
        }

        .SearchTable {
            width: 740px;
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
                width: 9%;
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

        #CommName {
            width: 97%;
            height: 40px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
    </div>
    <div id="dlg_search_AuditSet" class="easyui-dialog" title="筛选" data-options=" iconCls:'icon-search',modal:true,closed:true">
        <form id="frmFrom" runat="server">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea id="CommName" name="CommName" class="easyui-validatebox" onclick="SelComm()" readonly runat="server"></textarea>
                        <input type="hidden" id="CommID" name="CommID" runat="server" />
                        <input type="hidden" id="hCommID" name="hCommID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">应急类型</td>
                    <td class="TdContentSearch">
                        <input id="EmergencyTypeName" name="EmergencyTypeName" maxlength="100" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">事件主题</td>
                    <td class="TdContentSearch" colspan="3">
                        <input id="EventTheme" name="EventTheme" maxlength="1200" style="width: 95%" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">事发时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EventTimeBegin" name="EventTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="EventTimeEnd" name="EventTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">发起人</td>
                    <td class="TdContentSearch">
                        <input id="AddUserName" name="AddUserName" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AddTimeBegin" name="AddTimeBegin" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="AddTimeEnd" name="AddTimeEnd" class="easyui-datebox" runat="server" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">审批状态</td>
                    <td class="TdContentSearch">
                        <select id="AuditStatus" name="AuditStatus" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="未启动">未启动</option>
                            <option value="审核中">审核中</option>
                            <option value="已驳回">已驳回</option>
                            <option value="审批不通过">审批不通过</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">处理状态</td>
                    <td class="TdContentSearch">
                        <select id="DealState" name="DealState" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'">
                            <option value="全部">全部</option>
                            <option value="未处理">未处理</option>
                            <option value="处理中">处理中</option>
                            <option value="已处理">已处理</option>
                        </select>
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="ClearWhere()">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript"> 
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h - 2 + "px");
        }

        function ClearWhere() {
            $('#frmFrom').form('clear');
            $('#AuditStatus').combobox("setValue", "全部");
            $('#DealState').combobox("setValue", "全部");
        }

        //选择项目
        function SelComm() {
            if ($('#hCommID').val() == "") {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../Visit/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }
        }

        var column = [[
            { field: 'CommName', title: '项目名称', width: 140, align: 'left', sortable: false },
            { field: 'EmergencyTypeName', title: '应急类型', width: 100, align: 'left', sortable: false },
            {
                field: 'EventTheme', title: '事件主题', width: 120, align: 'left', sortable: false, formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" onclick=\"Detail('edit','" + row.ID + "')\" href=\"javascript:void(0);\">" + row.EventTheme + "</a>";
                    return str;
                }
            },
            { field: 'EventTime', title: '事发时间', width: 100, align: 'left', sortable: false },
            { field: 'DealState', title: '处理状态', width: 80, align: 'left', sortable: false },
            { field: 'AddUserName', title: '发起人', width: 100, align: 'left', sortable: false },
            { field: 'AddTime', title: '发起时间', width: 100, align: 'left', sortable: false },
            { field: 'AuditStatus', title: '审批状态', width: 100, align: 'left', sortable: false }
        ]];

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Detail("insert", '');
                }
            }, '-',
            {
                text: '变更处理状态',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要变更处理状态的数据!');
                        return;
                    }
                    UpdateDealState(row.ID);
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择需要删除的数据!');
                        return;
                    }
                    if (row.AuditStatus != "未启动" || row.AuditStatus == "已驳回") {
                        HDialog.Info('当前应急事件报告不允许删除!');
                        return;
                    }

                    Del(row.ID);
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg_search_AuditSet').dialog('open');
                }
            }, '-', {
                text: '导出应急事件报告',
                iconCls: 'icon-print',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row) {
                        window.open("EmergencyEventReportPrint.aspx?ID=" + row.ID);
                    } else {
                        HDialog.Info("请选择需要导出应急事件报告的数据");
                    }
                }
            }
        ];

        //详情
        function Detail(OpType, ID) {
            var w = $(window).width() * 9 / 11;
            var h = $(window).height();

            HDialog.OpenWin(w, h, '../Emergency/EmergencyEventReportDetail.aspx?OpType=' + OpType + '&ID=' + ID, "应急事件报告详情", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        //变更处理状态
        function UpdateDealState(ID) {
            var w = "340";
            var h = "200";

            HDialog.OpenWin(w, h, '../Emergency/EmergencyEventReportUpdateDealState.aspx?ID=' + ID, "变更处理状态", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });
        }
        //删除
        function Del(IdList) {
            $.messager.confirm('温馨提示', '确定删除选择的应急事件报告?', function (r) {
                if (r) {
                    $.tool.DataPostJson('Emergency', 'DelEmergencyEventReport', "idList=" + IdList,
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                HDialog.Info("删除成功");
                                LoadList();
                            } else {
                                HDialog.Info(data.msg);
                            }
                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });
                }
            });
        }

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: 50,
                pageList: [50, 100, 300],
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                remoteSort: false,
                columns: column,
                fitColumns: true,
                rownumbers: true,
                pagination: true,
                toolbar: toolbar,
                border: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Emergency", "GetEmergencyEventReportList", "TableContainer", param);
                }
            });
            $("#dlg_search_AuditSet").dialog("close");
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        });
    </script>

</body>
</html>
