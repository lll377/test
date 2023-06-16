<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentMaterialFrame.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentMaterialFrame" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body style="padding: 0px; margin: 0px;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="IncidentID" name="IncidentID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="IsReply" name="IsReply" runat="server" />
        <div id="TableContainer">
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var column = [[
                { field: 'CheckOutType', title: '出库类型', align: 'left', width: 50, sortable: true },
                {
                    field: 'ReceiptSign', title: '出库单号', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.Id + "');\">" + row.ReceiptSign + "</a>";
                        return str;
                    }
                },
                { field: 'ReceiptDate', title: '时间', align: 'left', width: 50, sortable: true },
                { field: 'OriginatorName', title: '制单人', align: 'left', width: 50, sortable: true },
                { field: 'WareHouseName', title: '仓库名称', width: 50, align: 'left', sortable: true },
                { field: 'State', title: '出库单状态', width: 50, align: 'left', sortable: true }
            ]];

            function LoadList() {
                var toolbar = null;
                if ($("#IsReply").val() == "1") {
                    toolbar = [
                        {
                            text: '物资出库',
                            iconCls: 'icon-add',
                            handler: function () {
                                var w = $(parent.parent.window).width();
                                var h = $(parent.parent.window).height();
                                HDialog.Open(w, h, "../Mt/CheckOutDetail.aspx?OpType=add&IncidentID=" + $('#IncidentID').val(), '新增出库', false, function callback(_Data) {
                                    if (_Data != "") {
                                        HDialog.Info("新增成功");
                                        LoadList();
                                    }
                                });
                            }
                        }
                    ];
                }

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CheckOut&Command=CheckOutList&IncidentID=' + $('#IncidentID').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc"
                });
            }

            LoadList();

            function ViewDetail(ID) {
                var w = $(parent.parent.window).width();
                var h = $(parent.parent.window).height();
                HDialog.Open(w, h, "../Mt/CheckOutDetail.aspx?OpType=edit&Id=" + ID, '修改出库', false, function callback(_Data) {
                    if (_Data != "") {
                        HDialog.Info("修改成功");
                        LoadList();
                    }
                });

            }
        </script>
    </form>
</body>
</html>
