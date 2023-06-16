<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentDelayApplyManage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentDelayApplyManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事延期申请列表页面</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 800px;
            height: 140px;
        }

        .SearchTable {
            width: 800px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 120px;
            }


        .TdContent input, select {
            border: 1px #cccccc solid;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">标题
                    </td>
                    <td class="TdContent">
                        <input id="Title" name="Title" style="width: 83%;" value="" runat="server" />
                    </td>
                    <td class="TdTitle">审核状态
                    </td>
                    <td class="TdContent">
                        <select id="AuditState" name="AuditState" class="easyui-combobox" style="width: 83%;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="审核中" selected>审核中</option>
                            <option value="审核不通过">审核不通过</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                    <td class="TdTitle">发起人</td>
                    <td class="TdContent">
                        <input id="UserName" name="UserName" style="width: 83%;" value="" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起时间从</td>
                    <td class="TdContent ">
                        <input id="WorkStartDate_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="CreateDate_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent ">
                        <input id="WorkStartDate_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="CreateDate_End" runat="server" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent "></td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ClaerWhere();">清  除 </a>
                    </td>
                </tr>
            </table>
        </div>
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" />
        <script type="text/javascript">
            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitFunction();

            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }


            function InitFrom() {
                var com = getQueryVariable("FromIndex");
                if (com != "") {
                    $("#FromIndex").val(com);
                }
            }
            InitFrom();
            //清空筛选条件
            function ClaerWhere() {
                $("#Title").val("");
                $("#UserName").val("");
                $("#WorkStartDate_Begin").datebox("setValue", "");
                $("#WorkStartDate_End").datebox("setValue", "");
                $('#AuditState').combobox("select", "审核中");
            }

            var column = [[
                { field: 'CommName', title: '项目名称', align: 'center', width: 100, sortable: true },
                { field: 'RoomSign', title: '房屋编号', align: 'center', width: 100, sortable: true },
                {
                    field: 'Title', title: '标题', align: 'left', width: 300, sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"Detail('" + row.IID + "','" + row.IncidentID + "','edit')\" href=\"javascript:void(0);\">" + row.Title + "</a>";
                        return str;
                    }
                },
                { field: 'DelayReason', title: '延期原因', align: 'left', width: 300, sortable: true },
                { field: 'DealLimit', title: '原处理时限', align: 'left', width: 90, sortable: true },
                { field: 'NowDealLimit', title: '延期后处理时限', align: 'left', width: 120, sortable: true },
                { field: 'UserName', title: '发起人', width: 100, align: 'center', sortable: true },
                {
                    field: 'WorkStartDate', title: '发起时间', width: 180, align: 'center', sortable: true
                },
                { field: 'FeesRoleNamesMemo', title: '审核流程', width: 220, align: 'left', sortable: true },
                { field: 'AuditState', title: '审核状态', width: 90, align: 'center', sortable: true },
                //{ field: 'FeesRoleNames', title: '未审岗位', width: 140, align: 'left', sortable: true },
                //{
                //    field: 'IID', title: '审核状态', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                //        var values = "";
                //        //已审核数
                //        var iHasAuditCount = row.HasAuditCount;
                //        //需审核总数
                //        var iHasCount = row.HasCount;
                //        var strTmp = "(" + iHasAuditCount + "/" + iHasCount + ")";
                //        if (iHasCount != iHasAuditCount && row.AuditState == '审核中') {
                //            values = "<font color='Green'>未审核" + strTmp + "</font>";
                //        }
                //        return values;
                //    }
                //}
            ]];

            //工具栏
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '审核',
                    iconCls: 'icon-add',
                    handler: function () {
                        var rows = $('#TableContainer').datagrid('getSelected');
                        if (rows == null) {
                            HDialog.Info('请选择需要审核的延期申请!');
                        }
                        else {
                            Detail(rows.IID, rows.IncidentID, "edit");
                        }
                    }
                }
                //, '-',
                //{
                //    text: '新增',
                //    iconCls: 'icon-add',
                //    handler: function () {
                //        Detail('', '601413000000000013', "insert");
                //    }
                //}
            ];
            var flag = "1";
            //加载列表
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 100, 200],
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "dasc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("IncidentProcessingNew", "GetIncidentDelayList", "TableContainer", param);
                        if (flag == "1") {
                            param["AuditState"] = $('#AuditState').val();
                            flag = "2";
                        }
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

            LoadList();
            $('#SearchDlg').parent().appendTo($("form:first"));

            //新增 修改
            function Detail(IID, IncidentID, OpType) {
                var w = 1000;
                var h = 500;
                HDialog.Open(w, h, '../IncidentNewJH/IncidentDelayApplyManageDetail.aspx?id=' + IID + '&IncidentID=' + IncidentID + '&OpType=' + OpType, "报事延期申请", true, function callback(_Data) {
                    if (_Data != "") {
                        if (_Data == "1") {
                            HDialog.Info("审核成功");
                        }
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }
        </script>
    </form>
</body>
</html>

