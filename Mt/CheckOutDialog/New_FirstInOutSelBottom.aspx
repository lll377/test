<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New_FirstInOutSelBottom.aspx.cs" Inherits="M_Main.Mt.CheckOutDialog.New_FirstInOutSelBottom" %>

<!DOCTYPE html>

<html>
<head>
    <title>已选物资列表</title>
    <script type="text/javascript" src="../../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript/Guid.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../../jscript/format.js" type="text/javascript"></script>
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
        //编辑的行号
        var editIndex = undefined;
        column = [[
               { field: 'MaterialName', title: '物资名称', align: 'left', width: 100, sortable: true },
                { field: 'TypeName', title: '物资类别', align: 'left', width: 100, sortable: true },
                { field: 'Num', title: '物资编号', align: 'left', width: 100, sortable: true },
                { field: 'Spell', title: '简拼', align: 'left', width: 100, sortable: true },

                { field: 'Specification', title: '规格型号', width: 100, align: 'left', sortable: true },
                { field: 'UnitName', title: '单位', width: 100, align: 'left', sortable: true },
                { field: 'Brand', title: '品牌', width: 100, align: 'left', sortable: true },

                { field: 'ColorName', title: '颜色', width: 100, align: 'left', sortable: true },               
                {
                    field: 'Quantity', title: '出库数量', align: 'left', width: 90, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, 2);
                        return str;
                    }
                }
        ]];

        var toolbar = [
                 {
                     text: '删除',
                     iconCls: 'icon-cancel',
                     handler: function () {
                         var row = $("#TableContainer").datagrid("getSelected");
                         var index = $("#TableContainer").datagrid("getRowIndex", row);
                         $('#TableContainer').datagrid('deleteRow', index);
                     }
                 }, '-',
                 {
                     text: '提交',
                     iconCls: 'icon-save',
                     handler: function () {
                         if (editIndex != undefined) {
                             $("#TableContainer").datagrid('acceptChanges', editIndex);                           
                         }
                     }
                 }
        ];


        //给datagrid扩展方法
        $.extend($.fn.datagrid.methods, {
            addEditor: function (jq, param) {
                if (param instanceof Array) {
                    $.each(param, function (index, item) {
                        var e = $(jq).datagrid('getColumnOption', item.field);
                        e.editor = item.editor;
                    });
                } else {
                    var e = $(jq).datagrid('getColumnOption', param.field);
                    e.editor = param.editor;
                }
            },
            removeEditor: function (jq, param) {
                if (param instanceof Array) {
                    $.each(param, function (index, item) {
                        var e = $(jq).datagrid('getColumnOption', item);
                        e.editor = {};
                    });
                } else {
                    var e = $(jq).datagrid('getColumnOption', param);
                    e.editor = {};
                }
            }
        });


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
                toolbar: toolbar,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                },               
                onClickRow: function (rowIndex, rowData) {
                    if (editIndex != undefined) {
                        $("#TableContainer").datagrid('acceptChanges', editIndex);                        
                    }
                    //更改当前行号
                    editIndex = rowIndex;
                    $("#TableContainer").datagrid('removeEditor', 'Quantity');
                    $("#TableContainer").datagrid('addEditor', [ //添加cardNo列editor
                        {
                            field: 'Quantity',
                            editor: {
                                type: 'numberbox',
                                options: {
                                    precision: 2
                                }
                            }
                        }]);


                    //开始编辑
                    $("#TableContainer").datagrid('beginEdit', rowIndex);
                },
                onClickCell: function (rowIndex, field, value) {

                }
            });
        }

        LoadList();

        //初始化加载数据

        function AddRow(rows) {
            if (Check(rows.Id)) {
                var _Data = $('#TableContainer').datagrid('getData');
                var row_index = _Data.rows.length;
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        Id: rows.Id,
                        MaterialName: rows.MaterialName,
                        TypeName: rows.TypeName,
                        Num: rows.Num,
                        Spell: rows.Spell,
                        Specification: rows.Specification,
                        UnitName: rows.UnitName,
                        Brand: rows.Brand,
                        ColorName: rows.ColorName,
                        Quantity: rows.Quantity
                    }
                });
            }
        }

        $("#BtnSave").click(function () {
            if (editIndex != undefined) {
                $("#TableContainer").datagrid('acceptChanges', editIndex);
            }
            $("#TableContainer").datagrid('removeEditor', 'Quantity');
            var rows = $("#TableContainer").datagrid("getRows");
            HDialog.ReturnIsJson = true;
            HDialog.CloseWindow(rows, parent.window.name);
        });

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


    </script>
    </form>
</body>
</html>