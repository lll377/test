<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseSelRight.aspx.cs" Inherits="M_Main.Mt.StorageDialog.PurchaseSelRight" %>
<!DOCTYPE html>
<html>
<head>
    <title>采购明细选择</title>
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
            width: 400px; 
            height: 160px; 
        } 
        .SearchTable
        {
            width: 400px; 
            height:auto;
        }
        .SearchTable .TdTitle {
            width:15%;
        }
        .SearchTable .TdContent {
            width:85%;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
    <input type="hidden" id="Id" name="Id" runat="server" />
    <input type="hidden" id="WareHouseId" name="WareHouseId" runat="server" />
    <input type="hidden" id="SupplierId" name="SupplierId" runat="server" />

    <input type="hidden" id="hiNumOrMaterialName" name="hiNumOrMaterialName" runat="server"/>

           <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
    <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />
         <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    物资名称
                </td>
                <td class="TdContent">
                    <input id="MaterialName" name="MaterialName" runat="server" value=""  />
                </td>
                </tr>
            <tr>
                 <td class="TdTitle">
                    物编码
                </td>
                <td class="TdContent">
                    <input id="Num" name="Num" runat="server" value=""  />
                </td>
            </tr>
            <tr>
                <td class="TdContent" style="text-align:center;"  colspan="2">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </td>
            </tr>
        </table>
    </div>

    <div class="datagrid-toolbar" id="divtt" >
        <table>
            <tr>
                <td>
                    <a href="javascript:void(0)" onclick="CheckAll(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">全选</span><span class="l-btn-icon icon-reload">&nbsp;</span></span></a>
                </td>
                <td>
                    <div class="datagrid-btn-separator"></div>
                </td>
                <td>
                    <a href="javascript:void(0)" onclick=" JavaScript: Select()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                    <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">更多筛选</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                </td>
                <td>
                    <div class="datagrid-btn-separator"></div>
                </td>
                <td>
                    <input type="text" id="NumOrMaterialName"  style="width: 130px" runat="server" name="NumOrMaterialName" />
                </td>
                 <td >
                    <a href="javascript:void(0)" onclick=" JavaScript: FastSearch()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                        <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">快速查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                 </td>
                <td>
                    <div class="datagrid-btn-separator"></div>
                </td>
                <td >
                    <a href="javascript:void(0)" onclick=" JavaScript: Clear()" class="l-btn l-btn-small l-btn-plain" group="" id="">
                        <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">清空</span><span class="l-btn-icon icon-cancel">&nbsp;</span></span></a>
                 </td>
                <td>
                    <div class="datagrid-btn-separator"></div>
                </td>
            </tr>
        </table>
    </div>
    <div id="TableContainer"></div>

    <script  src="../../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">

        //计算小数位数
        var decimalPos = Number($("#DecimalNum").val());
        var moneyPos = Number($("#MoneyNum").val());

        function InitFunction() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        } 
        InitFunction();
        var column;
        column = [[
                { field: 'BuyMethod', title: '采购方式', width: 50, align: 'center', sortable: true },
                { field: 'MaterialTypeName', title: '物资类别', width: 50, align: 'center', sortable: true },
                { field: 'MaterialName', title: '物资名称', width: 50, align: 'center', sortable: true },
                { field: 'UnitName', title: '单位名称', width: 50, align: 'center', sortable: true },
                { field: 'Brand', title: '品牌', align: 'center', width: 50, sortable: true },
                { field: 'Specification', title: '规格', align: 'center', width: 50, sortable: true },
                { field: 'ColorName', title: '颜色', align: 'center', width: 50, sortable: true },
                { field: 'SafeCount', title: '安全库存', align: 'center', width: 50, sortable: true },
                { field: 'StoreCount', title: '当前库存', align: 'center', width: 50, sortable: true },
                { field: 'SupplierName', title: '分供方名称', align: 'center', width: 50, sortable: true },

                {
                    field: 'BasePrice', title: '含税参考价', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, decimalPos);
                        return str;
                    }
                },
                {
                    field: 'Price', title: '含税单价', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, decimalPos);
                        return str;
                    }
                },
                {
                    field: 'Taxes', title: '税率', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, 2);
                        return str;
                    }
                },
                {
                    field: 'NoTaxPrice', title: '不含税单价', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, decimalPos);
                        return str;
                    }
                },
                {
                    field: 'Quantity', title: '数量', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, 2);
                        return str;
                    }
                },
                {
                    field: 'InCount', title: '已入库数量', align: 'left', width: 120, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, 2);
                        return str;
                    }
                },
                {
                    field: 'Amount', title: '含税金额', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, moneyPos);
                        return str;
                    }
                },
                {
                    field: 'TaxMoney', title: '税款', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, moneyPos);
                        return str;
                    }
                },
                {
                    field: 'NoTaxAmount', title: '不含税金额', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var str = ToDecimal(value, moneyPos);
                        return str;
                    }
                }
        ]];

        var toolbar = [
                 {
                     text: '全选',
                     iconCls: 'icon-reload',
                     handler: function () {
                         var rows = $('#TableContainer').datagrid('getRows');
                         for (var i = 0; i < rows.length; i++) {
                             parent.window.frames["PurchaseSelBottom"].window.AddRow(rows[i]);
                         }
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

        //指定列求和
        function ComputeGridCol(colName) {
            var rows = $('#TableContainer').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return ToDecimal(total, decimalPos);
        }

        //重写DataGrid,支持更改页脚样式
        var myview = $.extend({}, $.fn.datagrid.defaults.view, {
            renderFooter: function (target, container, frozen) {
                var opts = $.data(target, 'datagrid').options;
                var rows = $.data(target, 'datagrid').footer || [];
                var fields = $(target).datagrid('getColumnFields', frozen);
                var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                for (var i = 0; i < rows.length; i++) {
                    var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                    var style = styleValue ? 'style="' + styleValue + '"' : '';
                    table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                    table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                    table.push('</tr>');
                }
                table.push('</tbody></table>');
                $(container).html(table.join(''));
            }
        });

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
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Storage&Command=PurchaseDetailList&' + $('#frmForm').serialize(),
                method: "get",
                idField: "Id",
                nowrap: true,
                pageSize: 50,
                pageList: [50, 150, 300],
                columns: column,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                rownumbers: true,
                border: false,
                showFooter: true,
                striped: true,
                view: myview,
                toolbar: '#divtt',
                remoteSort: false,
                rowStyler: function (index, row) {
                    //如果是页脚
                    if (row.BuyMethod == '合计') {
                        return 'background-color:#F4F4F4;border:none;'; // return inline style
                    }
                },
                onLoadSuccess: function () {
                    //加载页脚
                    $('#TableContainer').datagrid('reloadFooter', [
                            {
                                BuyMethod: "合计",
                                Amount: ToDecimal("0.00", decimalPos),
                                NoTaxAmount: ToDecimal("0.00", decimalPos)
                            }
                    ]);
                    $("#SearchDlg").dialog("close");
                },
                onDblClickRow: function (rowIndex, rowData) {
                    parent.window.frames["PurchaseSelBottom"].window.AddRow(rowData);
                }
            });
        }
        LoadList();


        function CheckAll() {

            var rows = $('#TableContainer').datagrid('getRows');
            for (var i = 0; i < rows.length; i++) {
                parent.window.frames["PurchaseSelBottom"].window.AddRow(rows[i]);
            }
        }

        function Select() {

            $('#SearchDlg').parent().appendTo($("form:first"));
            $('#SearchDlg').dialog('open');

        }

        function FastSearch() {

            var NumOrMaterialName = $("#NumOrMaterialName").val();
            var hiNumOrMaterialName = $("#hiNumOrMaterialName").val();
            if (hiNumOrMaterialName == "") {
                $("#hiNumOrMaterialName").val(NumOrMaterialName);
            }
            if (hiNumOrMaterialName != "" && hiNumOrMaterialName != NumOrMaterialName) {
                $("#hiNumOrMaterialName").val(hiNumOrMaterialName + "|" + NumOrMaterialName);
            }
            //alert($("#hiNumOrMaterialName").val());

            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Storage&Command=PurchaseDetailList_New&' + $('#frmForm').serialize(),
                method: "get",
                idField: "Id",
                nowrap: true,
                pageSize: 50,
                pageList: [50, 150, 300],
                columns: column,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                rownumbers: true,
                border: false,
                showFooter: true,
                striped: true,
                view: myview,
                //toolbar: toolbar,
                toolbar: '#divtt',
                remoteSort: false,
                rowStyler: function (index, row) {
                    //如果是页脚
                    if (row.BuyMethod == '合计') {
                        return 'background-color:#F4F4F4;border:none;'; // return inline style
                    }
                },
                onLoadSuccess: function () {
                    //加载页脚
                    $('#TableContainer').datagrid('reloadFooter', [
                        {
                            BuyMethod: "合计",
                            Amount: ToDecimal("0.00", decimalPos),
                            NoTaxAmount: ToDecimal("0.00", decimalPos)
                        }
                    ]);
                    $("#SearchDlg").dialog("close");
                },
                onDblClickRow: function (rowIndex, rowData) {
                    parent.window.frames["PurchaseSelBottom"].window.AddRow(rowData);
                }
            });

        }


        function Clear() {

            $("#MaterialName").val('');
            $("#Num").val('');
            $("#NumOrMaterialName").val('');
            $("#hiNumOrMaterialName").val('');
        }

    </script>
    </form>
</body>
</html>
