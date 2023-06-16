<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WriteoffPreCostsOffsetAudit.aspx.cs" Inherits="M_Main.WriteOffManage.WriteoffPreCostsOffsetAudit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预交冲抵冲销审核</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="WriteoffPreCostsOffsetAuditForm" method="post" runat="server">
        <input id="KeyIDs" name="KeyIDs" value="" type="hidden" runat="server" />
        <input id="IsAuditOK" name="IsAuditOK" value="" type="hidden" runat="server" />
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="ListType" name="ListType" value="WriteoffPreCostsOffsetAudit" type="hidden" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 550px; height: 150px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="text-align: right">是否审核</td>
                    <td style="text-align: center">
                        <select name="IsAudit" id="IsAudit" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto'" runat="server" style="width: 143px">
                            <option value=""></option>
                            <option value="0" selected="selected">未审核</option>
                            <option value="1">已审核</option>
                            <option value="2">已驳回</option>
                        </select>
                    </td>
                    <td>审核人</td>
                    <td>
                        <input id="AuditUser" name="AuditUser" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">审核时间</td>
                    <td style="text-align: center">
                        <input id="AuditBeginDate" name="AuditBeginDate" runat="server" class="Wdate" onclick="WdatePicker()" />
                    </td>
                    <td colspan="2">&nbsp;&nbsp;至&nbsp;&nbsp;<input id="AuditEndDate" name="AuditEndDate" runat="server" class="Wdate" onclick="WdatePicker()" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">查询</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">

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


            $(function () {
                InitTableHeight();
                $.parser.parse("#SearchDlg");
                LoadList();
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            function Search() {
                LoadList();
            }

            var toolbar = [
                {
                    text: '审核',
                    iconCls: 'icon-shape_square_edit',
                    handler: function () {
                        var rows = $("#TableContainer").datagrid('getSelections');
                        var keyIIDs = "";
                        var IsAudit = true;
                        if (rows == null || rows == "") {
                            HDialog.Info('请选择审核项！');
                            return;
                        }
                        $.each(rows, function (index, item) {
                            keyIIDs += item.IID + ",";
                            if (item.IsAudit != 0) {
                                IsAudit = false;
                                return false;
                            }
                        });
                        if (!IsAudit) {
                            HDialog.Info("不能重复审核！！！");
                            return;
                        }
                        keyIIDs = keyIIDs.substring(0, keyIIDs.length - 1);
                        $("#KeyIDs").val(keyIIDs);
                        HDialog.MessageBoxThird("预交冲抵冲销审核", "通过审核", "驳回", "返回",
                            //通过审核
                            function () {
                                $('#IsAuditOK').val(1);
                                $.tool.DataPostChk('WriteoffPreCostsOffsetAuditForm', 'WriteOffAuditing', 'WriteOffAudit', $('#WriteoffPreCostsOffsetAuditForm').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "True") {
                                            HDialog.Info("审核成功!!!");
                                            LoadList();
                                        } else {
                                            HDialog.Info("审核失败!!!");
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    })
                            },
                            //驳回
                            function () {
                                $('#IsAuditOK').val(0);
                                $.tool.DataPostChk('WriteoffPreCostsOffsetAuditForm', 'WriteOffAuditing', 'WriteOffAudit', $('#WriteoffPreCostsOffsetAuditForm').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "True") {
                                            HDialog.Info("已驳回!!!");
                                            LoadList();
                                        } else {
                                            HDialog.Info("驳回失败!!!");
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    })
                            },
                            function () {
                            }
                        );
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'center', sortable: true },
                //{ field: 'AuditUserName', title: '审核人', width: 80, align: 'left', sortable: true },
                //{
                //    field: 'AuditDate', title: '审核时间', width: 150, align: 'center', sortable: true,
                //    formatter: function (value, row, index) {
                //        var str = formatDate(row.AuditDate, "yyyy-MM-dd HH:mm:ss");
                //        return str;
                //    }
                //},
                //{ field: 'WriteOffRoleNames', title: '未审岗位', width: 120, align: 'left', sortable: true }
            ]];
            var column = [[
                { field: 'SubmitterUserName', title: '提交人', width: 150, align: 'center', sortable: true },
                { field: 'SubmitterDate', title: '提交时间', width: 150, align: 'center', sortable: true },

                { field: 'WriteAmount', title: '冲销冲抵金额', width: 150, align: 'center', sortable: true },
                { field: 'ReferReason', title: '冲销冲抵原因', width: 150, align: 'center', sortable: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'center', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'center', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'center', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 180, align: 'center', sortable: true },
                {
                    field: 'PreDate', title: '预交冲抵日期', width: 200, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PreDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'CostName', title: '费用名称', width: 170, align: 'center', sortable: true },
                { field: 'DebtsAmount', title: '应冲抵金额', width: 130, align: 'left', sortable: true },
                { field: 'CostNames', title: '冲抵费用项目', width: 170, align: 'left', sortable: true },
                { field: 'OldPrecAmount', title: '原预交余额', width: 100, align: 'left', sortable: true },
                { field: 'OffsetAmount', title: '冲抵金额', width: 100, align: 'left', sortable: true },
                { field: 'OffsetLateFeeAmount', title: '冲抵合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'NewPrecAmount', title: '预交余额', width: 100, align: 'left', sortable: true },
                { field: 'TakeWiseName', title: '处理方式', width: 100, align: 'left', sortable: true },
                { field: 'BillsSign', title: '收据号', width: 100, align: 'left', sortable: true },
                { field: 'FeesRoleNamesMemo', title: '审核流程', width: 260, align: 'left', sortable: true },
                {
                    field: 'IsAudit', title: '审核状态', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var values = "";
                        var IsAudit = row.IsAudit;

                        if (IsAudit == 1) {
                            values = "<font color='Green'>已通过</font>";
                        }
                        else if (IsAudit == 2) {
                            values = "<font color='red'>未通过</font>";
                        }
                        else {
                            values = "<font color='Blue'>未审核</font>";
                        }


                        return values;
                    }
                }
                //{
                //    field: 'IsAudit', title: '审核状态', width: 150, align: 'center', sortable: true,
                //    formatter: function (value, row, index) {
                //        var str = "";
                //        if (value == 0) {
                //            str = "未审核";
                //        } else if (value == 1) {
                //            str = "已审核";
                //        } else if (value == 2) {
                //            str = "已驳回";
                //        }
                //        return str;
                //    }
                //}

            ]];

            //显示详细
            function ViewDetail(ID, IsAudit) {
                if (IsAudit == "True") {
                    HDialog.Info("审核通过，不能修改！！！");
                    return false;
                }
                HDialog.Open(700, 300, '../ChargesNew/ApplySetOverAccountSetDate.aspx?OpType=Edit&ID=' + ID,
                    "反结账申请修改", false, function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Close("true");
                            LoadList();
                        }
                    });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    frozenColumns: frozenColumns,
                    columns: column,
                    rownumbers: true,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("WriteOffAuditing", "GetList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }

        </script>
    </form>
</body>
</html>


