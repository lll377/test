<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorageList.aspx.cs" Inherits="M_Main.Mt.StorageDialog.StorageList" %>

<!DOCTYPE html>

<html>
<head>
    <title>物资入库单选择列表</title>
    <script type="text/javascript" src="../../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
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
        <input id="StorId" type="hidden" name="StorId" runat="server" />
    <div id="TableContainer"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    入库开始时间
                </td>
                <td class="TdContentSearch">
                    <input id="ReceiptStartDate" name="ReceiptStartDate" class="easyui-datebox" runat="server"  />
                </td>
                <td class="TdTitle">
                    入库结束时间
                </td>
                <td class="TdContentSearch">
                    <input id="ReceiptEndDate" name="ReceiptEndDate" class="easyui-datebox"  runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    入库单号
                </td>
                <td class="TdContent">
                    <input id="ReceiptSign" name="ReceiptSign" runat="server" />
                </td>
                <td class="TdTitle">
                    入库仓库
                </td>
                <td class="TdContent">
                    <input id="WareHouseName" name="WareHouseName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    制单人
                </td>
                <td class="TdContent">
                    <input id="OriginatorName" name="OriginatorName" runat="server" />
                </td>
                <td class="TdTitle">
                    入库类别
                </td>
                <td class="TdContent">
                    <select id="StorageType" name="StorageType" runat="server">
                        <option value=""></option>
                        <option value="计划采购">计划采购</option>
                        <option value="非计划采购">非计划采购</option>
                        <option value="调拨入库">调拨入库</option>
                        <option value="盘盈入库">盘盈入库</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>
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
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
            { field: 'ck', checkbox: true },
                { field: 'StorageType', title: '入库类型', align: 'left', width: 50, sortable: true },
                {
                    field: 'ReceiptSign', title: '入库单号', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','edit');\">" + row.ReceiptSign + "</a>";
                        return str;
                    }
                },
                { field: 'ReceiptDate', title: '时间', align: 'left', width: 50, sortable: true },
                { field: 'OriginatorName', title: '制单人', align: 'left', width: 50, sortable: true },
                { field: 'WareHouseName', title: '仓库名称', width: 50, align: 'left', sortable: true },
                { field: 'SupplierName', title: '供方名称', width: 50, align: 'left', sortable: true },
                { field: 'State', title: '入库单状态', width: 50, align: 'left', sortable: true }
        ]];
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
                text: '确认选择',
                iconCls: 'icon-save',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getSelections");
                    
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(rows);
                }
            }
        ];

      
        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Storage&Command=StorageList&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: false,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                ////onDblClickRow: function (rowIndex, rowData) {
                ////    var row = $("#TableContainer").datagrid("getSelected");
                    
                ////    HDialog.Close(JSON.stringify(row));
                ////},StorId
                //onClickRow: function (rowIndex, rowData) {
                //    //var row = $("#TableContainer").datagrid("getSelected");
                //    $("#TableContainer").treegrid("selectRow", rowIndex);
                //},
              
                onLoadSuccess: function (data) {                   
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
            HDialog.Open(w, h, '../Mt/StorageDetail.aspx?Id=' + Id + '&OpType=' + OpType, '入库单', false, function callback(_Data) {
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
