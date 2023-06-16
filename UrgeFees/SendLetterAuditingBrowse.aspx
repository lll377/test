<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendLetterAuditingBrowse.aspx.cs" Inherits="M_Main.UrgeFees.SendLetterAuditingBrowse" %>


<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 160px; padding: 10px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">费用开始期间</td>
                    <td class="TdContentSearch">
                        <select id="nYear1" name="nYear1" runat="server">
                            <option selected></option>
                        </select>年
                                <select id="nMonth1" name="nMonth1" runat="server">
                                    <option selected></option>
                                </select>月</td>
                    <td class="TdTitle">费用结束期间</td>
                    <td class="TdContentSearch">
                        <select id="nYear2" name="nYear2" runat="server">
                            <option selected></option>
                        </select>年
                                <select id="nMonth2" name="nMonth2" runat="server">
                                    <option selected></option>
                                </select>月</td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();

        var column = [[
                        { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                        { field: 'FeesStartYearMonth', title: '费用开始期间', width: 100, align: 'left', sortable: true },
                        { field: 'FeesEndYearMonth', title: '费用结束期间', width: 100, align: 'left', sortable: true },
                        { field: 'ChargeCutDate', title: '收费截止期间', width: 160, align: 'left', sortable: true },

                          { field: 'SubDebtsAmountCount', title: '提交户数', width: 100, align: 'left', sortable: true },
                          { field: 'SubDebtsAmount', title: '提交金额', width: 100, align: 'left', sortable: true },
                          { field: 'UserName', title: '提交人', width: 100, align: 'left', sortable: true },

                        { field: 'CreDate', title: '提交时间', width: 100, align: 'left', sortable: true },
                        { field: 'FeesRoleNamesMemo', title: '未审岗位', width: 260, align: 'left', sortable: true },
        {
            field: 'SendLetterID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

            //var values = "";
            //var IsAudit = row.AuditState;

            //    //已审核数
            //var iHasAuditCount = row.HasAuditCount;
            //    //需审核总数
            //var iHasCount = row.HasCount;



            //var strTmp = "(" + iHasAuditCount + "/" + iHasCount + ")";

            //if (IsAudit == 1) {
            //    values = "<font color='red'>已通过</font>";

            //}
            //else if (IsAudit == 2) {
            //    values = "<font color='Blue'>未通过</font>";

            //}
            //else {
            //    values = "<font color='Green'>未审核" + strTmp + "</font>";

            //}
            //return values;

                var IsAudit = row.AuditState;

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
        ]];

        var toolbar = [
                     //{
                     //    text: '欠费生成',
                     //    iconCls: 'icon-save',
                     //    handler: function () {
                     //        HDialog.Open(800, 320, '../UrgeFees/SendLetterManage.aspx', "欠费明细生成", false, function callback(_Data) {
                     //            LoadList();
                     //        });
                     //    }
                     //}, '-',                   
                    //{
                    //    text: '欠费分析',
                    //    iconCls: 'icon-edit',
                    //    handler: function () {
                    //        var row = $("#TableContainer").datagrid("getSelected");
                    //        if (row != undefined) {
                    //            var w = $(window).width();
                    //            var h = $(window).height();
                    //            HDialog.Open(w, h, '../NoticesNew/ArrearsReasonDetail.aspx?OPType=Edit&SendLetterID=' + row.SendLetterID, "欠费明细", false, function callback(_Data) {
                    //            });

                    //        }
                    //    }
                    //}, '-',
                    {
                        text: '欠费明细',
                        iconCls: 'icon-edit',
                        handler: function () {
                            var row = $("#TableContainer").datagrid("getSelected");
                            if (row != undefined) {
                                var w = $(window).width();
                                var h = $(window).height();
                                if (row.AuditState == "1") {
                                    HDialog.Info("审核通过数据不允许在操作！");

                                } else if (row.AuditState == "2") {
                                    HDialog.Info("审核不通过数据不允许在操作！");
                                } else {
                                    var w = $(window).width();
                                    var h = $(window).height();
                                    HDialog.Open(w, h, '../UrgeFees/SendLetterDetailFrame.aspx?OPType=Auditing&SendLetterID=' + row.SendLetterID, "欠费明细", false, function callback(_Data) {
                                        LoadList();
                                    });
                                }
                            }
                        }
                    }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#TableContainer").datagrid("getSelected");
                            if (row != undefined) {
                                HDialog.Prompt('是否删除该项', function () {
                                    $.tool.DataGet('ArrearsReason', 'ArrearsReasonDelete', 'SendLetterID=' + row.SendLetterID,
                                            function Init() {
                                            },
                                            function callback(_Data) {
                                                if (_Data == "true") {
                                                    HDialog.Info('删除成功');
                                                    LoadList();
                                                }
                                                else { HDialog.Info('删除失败'); }
                                            },
                                            function completeCallback() {
                                            },
                                            function errorCallback() {
                                            });
                                });
                            }
                        }
                    }, '-',
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');
                        }
                    }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
              //  fitColumns: true,
                rownumbers: true,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                pagination: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("SendLetter", "SendLetterBrowse", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                }
                , onDblClickRow: function (rowIndex, rowData) {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row != undefined) {
                        if (row.AuditState == "1" ) {
                            HDialog.Info("审核通过数据不允许在操作！");

                        } else if (row.AuditState == "2") {
                            HDialog.Info("审核不通过数据不允许在操作！"); 
                        } else { 
                            var w = $(window).width();
                            var h = $(window).height();
                            HDialog.Open(w, h, '../UrgeFees/SendLetterDetailFrame.aspx?OPType=Auditing&SendLetterID=' + row.SendLetterID, "欠费明细", false, function callback(_Data) {
                                LoadList();
                            });
                        }

                     

                    }
                }

            });

        }
        $.parser.parse("#SearchDlg");
        LoadList();
    </script>
</body>
</html>
