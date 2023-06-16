<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinanceOverAccountsSetInfoRight.aspx.cs" Inherits="M_Main.ChargesNew.FinanceOverAccountsSetInfoRight" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>财务结账设置</title>
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

    <style type="text/css">
        #CostNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }

        #CommNames {
            width: 91.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="FinanceOverAccountsSetInfo" method="post" runat="server">
        <input id="CommIDs" name="CommIDs" value="" type="hidden" runat="server" />
        <input id="OrganCode" name="OrganCode" value="" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 187px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>项目名称</td>
                    <td colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelCommInfo();"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>结帐延期申请人</td>
                    <td>
                        <input id="ReverseOverAccountPerson" name="ReverseOverAccountPerson" runat="server" class="easyui-textbox" />
                    </td>
                    <td>结帐状态</td>
                    <td>
                        <select name="OverAccountState" id="OverAccountState" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto'" runat="server" style="width: 143px">
                            <option value="" selected="selected"></option>
                            <option value="0">未结账</option>
                            <option value="1">已结账</option>
                        </select>
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

            $(function () {
                InitTableHeight();
                $.parser.parse("#SearchDlg");
                LoadList();
            });

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            function SelCommInfo() {
                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommIDs").val(arrRet.id);
                    $("#CommNames").val(arrRet.name);
                });
            }

            function Search() {
                LoadList();
            }

            function SelStart() {
                $("#EndDate").val("");
                WdatePicker({ dateFmt: 'yyyy-MM' });
            }

            var mainToolbar = [
                {
                    text: '设置',
                    iconCls: 'icon-edit',
                    handler: function () {
                        HDialog.Open(770, 300, '../ChargesNew/FinanceOverAccountsSet.aspx', '财务结账设置', false, function callback(_Data) {
                            if (_Data == "true") {
                                LoadList();
                            }
                        });
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

            var frozenColumns = [[
                { field: 'OrganName', title: '区域名称', width: 120, align: 'center', sortable: true },
                { field: 'CommName', title: '项目名称', width: 120, align: 'center', sortable: true },
                {
                    field: 'OverAccountMonth', title: '结账月份', width: 120, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = row.OverAccountYear + "年" + row.OverAccountMonth + "月"
                        return str;
                    }
                },
            ]]

            var mainColumn = [[

                { field: 'OverAccountBeginDate', title: '费用结账开始日期', width: 150, align: 'center', sortable: true },
                { field: 'OverAccountEndDate', title: '费用结账结束日期', width: 150, align: 'center', sortable: true },
                { field: 'OverAccountSetDate', title: '结账日期', width: 150, align: 'center', sortable: true },
                { field: 'OverAccountPerson', title: '设置人', width: 100, align: 'center', sortable: true },
                {
                    field: 'OverAccountState', title: '结账状态', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var strState = "未结账";
                        var overAccountSetDate = new Date(row.OverAccountSetDate.replace("-", "/").replace("-", "/"));
                        if (overAccountSetDate < new Date()) {
                            strState = "已结账";
                        }
                        return strState;
                    }
                },
                {
                    field: 'IsEffect', title: '是否生效', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var strState = "已生效";
                        if (value == "True") {
                            strState = "未生效";
                        }
                        return strState;
                    }
                },
                { field: 'UpdatePerson', title: '修改人', width: 150, align: 'center', sortable: true },
                { field: 'UpdateDate', title: '修改日期', width: 150, align: 'center', sortable: true },
                { field: 'ReverseOverAccountPerson', title: '结账延期申请人', width: 150, align: 'center', sortable: true },
                //{ field: 'ReverseOverAccountDate', title: '反结账申请日期', width: 150, align: 'center', sortable: true },
                { field: 'ReverseOverAccountReason', title: '结账延期申请原因', width: 150, align: 'center', sortable: true },
                { field: 'ReverseOverAccountAuditPerson', title: '审核人', width: 150, align: 'center', sortable: true },
                { field: 'ReverseOverAccountAuditDate', title: '审核日期', width: 150, align: 'center', sortable: true }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: mainColumn,
                    frozenColumns: frozenColumns,
                    rownumbers: true,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: mainToolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FinanceOverAccountsSetInfo", "GetList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                        $.tool.MergeEasyUiGrid("TableContainer", "OrganName,CommName");
                    }
                });
            }

        </script>
    </form>
</body>
</html>
