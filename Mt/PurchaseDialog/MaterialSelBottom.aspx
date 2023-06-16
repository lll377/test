<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialSelBottom.aspx.cs" Inherits="M_Main.Mt.PurchaseDialog.MaterialSelBottom" %>
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
    <link href="../../css/button.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        body { 
            margin:0px;
            padding:0px;
            font-size:12px;
            overflow-y:auto;
        }
        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }
        .panel-header, .panel-body {
            border-color: #cccccc;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input type="hidden" id="SearchResult" name="SearchResult" value="{total:0,rows:[]}" runat="server" />
    <div id="TableContainer"></div>
    <div style="text-align:center;bottom:0;position:fixed;width:100%;height:50px;line-height:50px;background-color:#f5f5f5;margin-right:45px;"><input type="button" id="BtnSave" value="确定选择" class="button"></div>

    <script  src="../../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        function InitFunction() {
            var h = $(window).height()-4-50;
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                { field: 'Name', title: '物资名称', align: 'left', width: 50, sortable: true },
                { field: 'MaterialTypeName', title: '物资类别', align: 'left', width: 50, sortable: true },
                { field: 'Number', title: '物资编号', align: 'left', width: 50, sortable: true },
                { field: 'Spell', title: '简拼', align: 'left', width: 50, sortable: true },
                { field: 'Property', title: '属性', width: 50, align: 'left', sortable: true },
                { field: 'Specification', title: '规格型号', width: 50, align: 'left', sortable: true },
                { field: 'UnitName', title: '单位', width: 50, align: 'left', sortable: true },
                { field: 'Brand', title: '品牌', width: 50, align: 'left', sortable: true },
                { field: 'ColorName', title: '颜色', width: 50, align: 'left', sortable: true }
        ]];

        function LoadList() {

            $("#TableContainer").datagrid({
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                remoteSort: false,
                rownumbers: true,
                width: "100%",
                border: true,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                },
                onDblClickRow: function (rowIndex, rowData) {
                    $('#TableContainer').datagrid('deleteRow', rowIndex);
                },
            });
        }
        LoadList();

        //初始化加载数据

        function AddRow(rows) {
            var _Data = $('#TableContainer').datagrid('getData');
            var row_index = _Data.rows.length;
            $('#TableContainer').datagrid('insertRow', {
                index: row_index,
                row: {
                    Id: rows.Id,
                    Name: rows.Name,
                    MaterialTypeName: rows.MaterialTypeName,
                    Number: rows.Num,
                    Spell: rows.Spell,
                    Property: rows.Property,
                    Specification:rows.Specification,
                    UnitName: rows.UnitName,
                    Brand: rows.Brand,
                    ColorName: rows.ColorName,
                    Quantity:1//仓库调拨数量记录
                }
            });
        }

        //批量添加
        function AddAllRow(param) {
            //绑定表格
            for (var i = 0; i < param.rows.length; i++) {
                if (Check(param.rows[i].Id)) {
                    AddRow(param.rows[i]);
                }
            }
        }
        //重复验证
        function Check(num) {
            var _Data = $("#TableContainer").datagrid("getData");
            var bl = true;
            if (_Data.rows.length > 0) {
                for (var j = 0; j < _Data.rows.length; j++) {
                    if (_Data.rows[j].Id == num) {
                        bl = false;
                        break;
                    }
                }
            }
            return bl;
        }




        $("#BtnSave").click(function () {
            var rows = $("#TableContainer").datagrid("getRows");
            HDialog.ReturnIsJson = true;
            HDialog.CloseWindow(rows, parent.window.name);
        });

    </script>
    </form>
</body>
</html>