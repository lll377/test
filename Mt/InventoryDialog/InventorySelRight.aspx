<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventorySelRight.aspx.cs" Inherits="M_Main.Mt.InventoryDialog.InventorySelRight" %>

<!DOCTYPE html>


<html>
<head>
    <title>物资列表</title>
    <script type="text/javascript" src="../../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding:10px;
            width: 500px; 
            height: 200px; 
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
<body style="padding:0px;margin:0px;">
    <form id="frmForm" runat="server">
    <input type="hidden" id="SortCode" name="SortCode" runat="server" />
        <input type ="hidden" id="WareHouseId" name="WareHouseId" runat="server" />
    <%--    <input id="Num" name="Num" runat="server" value="" type="hidden"  />--%>
    <div id="TableContainer"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    物资名称
                </td>
                <td class="TdContentSearch">
                    <input id="Name" name="Name" runat="server"  />
                </td>
                <td class="TdTitle">
                    物资编号
                </td>
                <td class="TdContentSearch">
                      <input id="Num" name="Num" runat="server"  />
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
            $("#TableContainer").css("height", h +"px");
        } 
        InitFunction();
        var column;
        column = [[
                //{ field: 'Id', title: '编号', align: 'left', width: 50, sortable: true, checkbox:true },
                { field: 'Name', title: '物资名称', align: 'left', width: 50, sortable: true },
                { field: 'MaterialTypeName', title: '物资类别', align: 'left', width: 50, sortable: true },
                { field: 'Num', title: '物资编号', align: 'left', width: 50, sortable: true },
                { field: 'Spell', title: '简拼', align: 'left', width: 50, sortable: true },
                { field: 'Property', title: '属性', width: 50, align: 'left', sortable: true },
                { field: 'Specification', title: '规格型号', width: 50, align: 'left', sortable: true },
                { field: 'UnitName', title: '单位', width: 50, align: 'left', sortable: true },
                { field: 'Brand', title: '品牌', width: 50, align: 'left', sortable: true },
                 { field: 'ColorName', title: '颜色', width: 50, align: 'left', sortable: true }
        ]];
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            },
            {
                text:'全选',
                iconCls: 'icon-ok',
                handler:function(){
                    var _Data = $('#TableContainer').datagrid('getData');
                    parent.window.frames["InventorySelBottom"].window.AddAllRow(_Data);
                }
            }
        ];

        function LoadList() {
            
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=MaterialList&' + $('#frmForm').serialize(),
                method: "get",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                singleSelect: false,//支持全选
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
                onDblClickRow: function (rowIndex, rowData) {
                    parent.window.frames["InventorySelBottom"].window.AddRow(rowData);
                }
               
            });
        }
        LoadList();
    </script>
    </form>
</body>
</html>

