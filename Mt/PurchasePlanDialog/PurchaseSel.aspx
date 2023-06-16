<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseSel.aspx.cs" Inherits="M_Main.Mt.PurchasePlanDialog.PurchaseSel" %>
<!DOCTYPE html>
<html>
<head>
    <title>采购单选择</title>
    <script type="text/javascript" src="../../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../../css/button.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 700px; 
            height: 200px; 
        } 
        .SearchTable 
        {
            width: 700px; 
            height:auto;
        }
        .SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:35%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
    <div id="TableContainer"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    申购仓库
                </td>
                <td colspan="3" class="TdContentSearch">
                    <input id="PurchaseWareHouseIds" name="PurchaseWareHouseIds" crunat="server"  />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    申购开始时间
                </td>
                <td class="TdContentSearch">
                    <input id="PurchaseStartDate" name="PurchaseStartDate" class="easyui-datebox" runat="server"  />
                </td>
                <td class="TdTitle">
                    申购结束时间
                </td>
                <td class="TdContentSearch">
                    <input id="PurchaseEndDate" name="PurchaseEndDate" class="easyui-datebox"  runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    申购单号
                </td>
                <td class="TdContent">
                    <input id="PurchaseNum" name="PurchaseNum" runat="server" />
                </td>
                <td class="TdTitle">
                    申购部门
                </td>
                <td class="TdContent">
                    <input id="DepName" name="DepName" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align:center;bottom:0;position:fixed;width:100%;height:50px;line-height:50px;background-color:#f5f5f5;margin-right:45px;"><input type="button" id="BtnSave" value="确定选择" class="button"></div>
    <script  src="../../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">


        //监听键盘回车事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                LoadList();
            }
        };

        function InitFunction() {
            var h = $(window).height()-55 ;
            $("#TableContainer").css("height", h + "px");
        } 
      InitFunction();
        var column;
        column = [[
                { field: 'ck', checkbox: true },
                { field: 'PurchaseType', title: '申购类型', align: 'left', width: 50, sortable: true },
                {
                    field: 'PurchaseNum', title: '申购单号', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit');\">" + row.PurchaseNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'PurchaseDate', title: '申购时间', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.PurchaseDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'Originator', title: '制单人', align: 'left', width: 50, sortable: true },
                { field: 'PurchaseWareHouseName', title: '申购仓库', width: 50, align: 'left', sortable: true },
                { field: 'InWareHouseName', title: '入库仓库', width: 50, align: 'left', sortable: true },
                { field: 'DepName', title: '申购部门', width: 50, align: 'left', sortable: true },
                { field: 'State', title: '采购单状态', width: 50, align: 'left', sortable: true },
                { field: 'Memo', title: '备注', width: 50, align: 'left', sortable: true }
        ]];
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=PurchasePlan&Command=PurchaseSel&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                toolbar: toolbar,
                border: false,
                selectOnCheck: false,
                checkOnSelect: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                    $("#SearchDlg").dialog("close");
                },
                rowStyler: function (index, row) {
                    return 'height:20px;';
                }
            });
        }

        $('#SearchDlg').parent().appendTo($("form:first"));
        LoadList();

        function Detail(Id,OpType) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(w, h, '../Mt/PurchaseDetail.aspx?Id=' + Id + '&OpType=' + OpType, '采购单查询', true, function callback(_Data) {
            });
        }

        $("#BtnSave").click(function () {
            var rows = $("#TableContainer").datagrid("getChecked");
            HDialog.ReturnIsJson = true;
            HDialog.Close(rows);
        });
    </script>
    </form>
</body>
</html>