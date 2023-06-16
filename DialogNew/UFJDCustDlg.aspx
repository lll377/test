<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDCustDlg.aspx.cs" Inherits="M_Main.DialogNew.UFJDCustDlg" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 500px; 
            height: 240px; 
        }
        .SearchTable
        {
            width: 500px; 
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
    <div id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>               
                <td class="TdTitle">客商编码</td>
                <td class="TdContent">
                    <input type="text" id="CustCode" name="CustCode" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客商名称</td>
                <td class="TdContent">
                    <input type="text" id="CustName" name="CustName" />
                </td>               
            </tr>           
            <tr>
                <td colspan="2" style="text-align:center;padding-top:5px;">
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
                { field: 'CustID', title: '客商ID', width: 150, align: 'left', sortable: true },
                { field: 'CustCode', title: '客商编码', width: 150, align: 'left', sortable: true },
                { field: 'CustName', title: '客商名称', width: 400, align: 'left', sortable: true }
        ]];

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=UFJDCust&Command=List&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                },
                onClickRow: function (rowIndex, rowData) {
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(rowData);
                }
            });
        }
        LoadList();

    </script>
 </form>
</body>
</html>
