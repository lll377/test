<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="M_Main.Mt.Purchase" %>
<!DOCTYPE html>
<html>
<head>
    <title>采购单</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
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
                    申购类型
                </td>
                <td class="TdContent">
                    <select id="PurchaseType" runat="server">
                        <option value=""></option>
                        <option value="计划采购">计划采购</option>
                        <option value="零星采购">零星采购</option>
                        <option value="紧急采购">紧急采购</option>
                        <option value="专项采购">专项采购</option>
                        <option value="集中采购">集中采购</option>
                    </select>
                </td>
                <td class="TdTitle">
                    申购单号
                </td>
                <td class="TdContent">
                    <input id="PurchaseNum" name="PurchaseNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    采购开始时间
                </td>
                <td class="TdContentSearch">
                    <input id="PurchaseStartDate" name="PurchaseStartDate" class="easyui-datebox" runat="server"  />
                </td>
                <td class="TdTitle">
                    采购结束时间
                </td>
                <td class="TdContentSearch">
                    <input id="PurchaseEndDate" name="PurchaseEndDate" class="easyui-datebox"  runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    制单人
                </td>
                <td class="TdContent">
                    <input id="Originator" name="Originator" runat="server" />
                </td>
                <td class="TdTitle">
                    申购部门
                </td>
                <td class="TdContent">
                    <input id="DepName" name="DepName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    申购仓库
                </td>
                <td class="TdContent">
                    <input id="PurchaseWareHouseName" name="PurchaseWareHouseName" runat="server" />
                </td>
                <td class="TdTitle">
                    入库仓库
                </td>
                <td class="TdContent">
                    <input id="InWareHouseName" name="InWareHouseName" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
    <script  src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                { field: 'PurchaseType', title: '申购类型', align: 'left', width: 50, sortable: true },
                {
                    field: 'PurchaseNum', title: '申购单号', align: 'left', width: 80, sortable: true, formatter: function (value, row, index) {
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
                { field: 'Amount', title: '申购总额', align: 'left', width: 50, sortable: true },
                { field: 'Originator', title: '制单人', align: 'left', width: 50, sortable: true },
                { field: 'PurchaseWareHouseName', title: '申购仓库', width: 50, align: 'left', sortable: true },
                { field: 'InWareHouseName', title: '入库仓库', width: 50, align: 'left', sortable: true },
                { field: 'DepName', title: '申购部门', width: 50, align: 'left', sortable: true },
                { field: 'State', title: '采购单状态', width: 50, align: 'left', sortable: true }
        ]];
        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    Detail('','add');
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    DelRecord(row)
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function DelRecord(row) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    if (row.State == "未启动") {
                        $.tool.DataGet('Purchase', 'PurchaseDelete', 'Id=' + row.Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            $('#SearchDlg').parent().appendTo($("form:first"));
                            if (_Data.substring(0, 5) == "false") {
                                HDialog.Info(_Data.substring(6));
                            }
                            else {
                                LoadList();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                    }
                    else {
                        HDialog.Info("无法删除");
                    }
                }
            });
        } 

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Purchase&Command=PurchaseList&' + $('#frmForm').serialize(),
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
                width: "100%",
                toolbar: toolbar,
                border: false,
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
            HDialog.Open(w, h, '../Mt/PurchaseDetail.aspx?Id=' + Id + '&OpType=' + OpType, '采购申请单', false, function callback(_Data) {
                if (_Data != '') {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    LoadList();
                }
            });
        }
    </script>
    </form>
</body>
</html>