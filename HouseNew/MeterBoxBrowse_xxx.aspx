<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeterBoxBrowse_xxx.aspx.cs" Inherits="M_Main.HouseNew.MeterBoxBrowse_xxx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/DateFormat.js"></script>

    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
        }

        .active {
            background-color: #cccccc;
        }

        #SearchDlg table tr {
            height: 35px;
        }

            #SearchDlg table tr td {
                width: 60px;
            }

        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; margin-topid: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <input type="hidden" id="MeterBoxName" name="MeterBoxName" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height() - 4;
                $("#TableContainer").css({ "height": h + "px" });
            }
            InitTableHeight();

            var frozenColumns = [[
                {
                    field: '表记序号', title: '表计序号', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<span style=\"color:blue;\">" + row.ResTID + "</span>";
                        return str;
                    }
                }
            ]];

            var column = [[
                { field: '房号', title: '房号', width: 100, align: 'left', sortable: true },
                { field: '表记序号', title: '表计序号', width: 150, align: 'left', sortable: true },
                { field: '表记名称', title: '表计名称', width: 150, align: 'left', sortable: true },
                { field: '最近抄表日期', title: '最近一次抄表时间', width: 100, align: 'left', sortable: true },
                { field: '止度', title: '止度', width: 100, align: 'left', sortable: true }
            ]];
            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;

            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Meter&Command=MeterBoxTableRecord&MeterBoxID=' + $("#MeterBoxName").val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    rownumbers: true,
                    //frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    //pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {

                    },
                    onLoadError: function (none) {

                    },
                    onClickRow: function (rowIndex, rowData) {
                    },
                });
            }

            LoadList();

        </script>
    </form>
</body>
</html>
