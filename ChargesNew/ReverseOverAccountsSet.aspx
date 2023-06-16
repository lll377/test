<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReverseOverAccountsSet.aspx.cs" Inherits="M_Main.ChargesNew.ReverseOverAccountsSet" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>结账延期申请</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/CostDictionaryCanNull.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 250px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="FinanceOverAccountsSetInfo" method="post" runat="server">
        <div id="TableContainer"></div>
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

            function Search() {
                LoadList();
            }

            function SelStart() {
                $("#EndDate").val("");
                WdatePicker({ dateFmt: 'yyyy-MM' });
            }

            var mainToolbar = [
                {
                    text: '设置结账时间',
                    iconCls: 'icon-add',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选择设置项！');
                            return;
                        }
                        if ($("#TableContainer").datagrid("getRowIndex", row) != 0) {
                            HDialog.Info('反结帐只能反结当前日期的上一期！');
                            return;
                        }
                        if (row.IsEffect == "True") {
                            HDialog.Info('不能选择失效数据！');
                            return;
                        }
                        HDialog.Open(700, 300, '../ChargesNew/ApplySetOverAccountSetDate.aspx?OverAccountMonth=' + row.OverAccountMonth + '&OpType=Insert&OverAccountYear=' + row.OverAccountYear + '&FinanceOverAccountsSetInfoID=' + row.ID,
                            '设置结账日期', false, function callback(_Data) {
                                if (_Data == "true") {
                                    HDialog.Close("true");
                                }
                            });
                    }
                }
            ];

            var mainColumn = [[
                { field: 'OrganName', title: '区域名称', width: 150, align: 'center', sortable: true },
                { field: 'CommName', title: '项目名称', width: 150, align: 'center', sortable: true },
                {
                    field: 'OverAccountMonth', title: '结账月份', width: 150, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = row.OverAccountYear + "年" + row.OverAccountMonth + "月"
                        return str;
                    }
                },
                { field: 'OverAccountBeginDate', title: '费用结账开始日期', width: 150, align: 'center', sortable: true },
                { field: 'OverAccountEndDate', title: '费用结账结束日期', width: 150, align: 'center', sortable: true },
                { field: 'OverAccountSetDate', title: '结账日期', width: 150, align: 'center', sortable: true },
                { field: 'OverAccountPerson', title: '设置人', width: 100, align: 'center', sortable: true },
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
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: mainColumn,
                    rownumbers: true,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: mainToolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FinanceOverAccountsSetInfo", "GetListByCommID", "TableContainer", param);
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



