<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseOrderFrame.aspx.cs" Inherits="M_Main.Mt.PurchaseOrderFrame" %>
<!DOCTYPE html>
<html>
<head>
    <title>采购汇总表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>   
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
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
    <form id="frmForm">
    <input id="WareHouseId" value="" name="WareHouseId" type="hidden"  />
    <input id="Attribute" name="Attribute" value=""  type="hidden" />
        <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
    <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />
    <div id="TableContainer" style="width:100%;"></div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow:hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">
                    仓库
                </td>
                <td class="TdContent">
                    <input id="WareHouseName" name="WareHouseName" runat="server"/>
                </td>
                <td class="TdTitle">
                    分供方
                </td>
                <td class="TdContent">
                    <input id="SupplierName" name="SupplierName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    统计开始时间
                </td>
                <td class="TdContent">
                    <input id="PurchaseStartDate" name="PurchaseStartDate"  onclick="WdatePicker()" runat="server" />
                </td>
                <td class="TdTitle">
                    统计结束时间
                </td>
                <td class="TdContent">
                    <input id="PurchaseEndDate" name="PurchaseEndDate"  onclick="WdatePicker()" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    采购类型
                </td>
                <td class="TdSearchContent">
                    <select id="PurchaseType" name="PurchaseType">
                        <option value="">所有</option>
                        <option value="计划采购">计划采购</option>
                        <option value="零星采购">零星采购</option>
                        <option value="紧急采购">紧急采购</option>
                        <option value="专项采购">专项采购</option>
                        <option value="集中采购">集中采购</option>
                    </select>
                </td>
                <td class="TdTitle">
                    采购方式
                </td>
                <td class="TdSearchContent">
                    <select id="BuyMethod" name="BuyMethod">
                        <option value="">所有</option>
                        <option value="自购">自购</option>
                        <option value="统购">统购</option>
                </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    申购单号
                </td>
                <td class="TdContent">
                    <input id="PurchaseNum" name="PurchaseNum" value=""  runat="server" />
                </td>
                <td class="TdTitle">
                </td>
                <td class="TdContent">
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

        //监听键盘回车事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                LoadList();
            }
        };

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
                            { field: 'PurchaseNum', title: '采购单号', width: 150, align: 'center', sortable: true },
                            { field: 'InWareHouseName', title: '入库仓库', width: 150, align: 'center', sortable: true },
                            { field: 'PurchaseWareHouseName', title: '申购仓库', width: 150, align: 'center', sortable: true },
                            { field: 'BuyMethod', title: '采购方式', width: 80, align: 'center', sortable: true },
                            { field: 'MaterialTypeName', title: '物资类别', width: 120, align: 'center', sortable: true },
                            { field: 'MaterialName', title: '物资名称', width: 250, align: 'center', sortable: true },
                            { field: 'NUM', title: '物资编号', width: 250, align: 'center', sortable: true },
                            { field: 'UnitName', title: '单位名称', width: 50, align: 'center', sortable: true },
                            { field: 'Brand', title: '品牌', align: 'center', width: 150, sortable: true },
                            { field: 'Specification', title: '规格', align: 'center', width: 250, sortable: true },
                            { field: 'ColorName', title: '颜色', align: 'center', width: 50, sortable: true },
                            {
                                field: 'SafeCount', title: '安全库存', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.SafeCount, 2);
                                }
                            },
                            {
                                field: 'StoreCount', title: '当前库存', align: 'center', width: 50, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.StoreCount, 2);
                                }
                            },
                            { field: 'SupplierName', title: '分供方名称', align: 'center', width: 250, sortable: true },
                            {
                                field: 'BasePrice', title: '含税参考价', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.BasePrice, decimalPos);
                                }
                            },

                            {
                                field: 'Price', title: '采购含税单价', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.Price, decimalPos);
                                }
                            },
                            {
                                field: 'Taxes', title: '申购税率', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.Taxes, 2);
                                }
                            },
                            {
                                field: 'NoTaxPrice', title: '申购不含税单价', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.NoTaxPrice, decimalPos);
                                }
                            },
                            {
                                field: 'Quantity', title: '数量', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.Quantity, 2);
                                }
                            },
                            {
                                field: 'Amount', title: '申购含税金额', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.Amount, moneyPos);
                                }
                            },
                            {
                                field: 'NoTaxAmount', title: '申购不含税金额', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.NoTaxAmount, moneyPos);
                                }
                            },

                            {
                                field: 'PlanPrice', title: '计划含税单价', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.PlanPrice, decimalPos);
                                }
                            },
                            {
                                field: 'PlanTaxes', title: '计划税率', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.PlanTaxes, 2);
                                }
                            },
                            {
                                field: 'PlanNoTaxPrice', title: '计划不含税单价', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.PlanNoTaxPrice, decimalPos);
                                }
                            },
                            {
                                field: 'PlanQuantity', title: '计划数量', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.PlanQuantity, 2);
                                }
                            },
                            {
                                field: 'PlanAmount', title: '计划含税金额', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.PlanAmount, moneyPos);
                                }
                            },
                            {
                                field: 'PlanTaxMoney', title: '税款', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.PlanTaxMoney, moneyPos);
                                }
                            },
                            {
                                field: 'PlanNoTaxAmount', title: '计划不含税金额', align: 'center', width: 100, sortable: true, formatter: function (value, row, index) {
                                    return ToDecimal(row.PlanNoTaxAmount, moneyPos);
                                }
                            }

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
                text: '采购汇总表',
                iconCls: 'icon-print',
                handler: function () {
                    ReportPrint("PurchaseOrderStat");
                }
            }, '-',
            {
                text: '采购明细表',
                iconCls: 'icon-print',
                handler: function () {
                    ReportPrint("PurchaseOrderDetail");
                }
            }, '-',
            {
                text: '供方订货表',
                iconCls: 'icon-print',
                handler: function () {
                    ReportPrint("PurchaseOrderSupplierGoods");
                }
            }, '-',
            {
                text: '供方配送表',
                iconCls: 'icon-print',
                handler: function () {
                    ReportPrint("PurchaseOrderDistribution");
                }
            }
        ];

        function ReportPrint(Cmd)
        {

            if ($("#WareHouseId").val() == "") {
                HDialog.Info("请选择仓库");
                return;
            }
            if ($("#PurchaseStartDate").val() == "") {
                HDialog.Info("开始时间不能为空");
                return;
            }
            if ($("#PurchaseEndDate").val() == "") {
                HDialog.Info("结束时间不能为空");
                return;
            }
            $.tool.Print(Cmd, "");
        }

        function SetAttribute()
        {
            var strAttribute = "<Attribute><WareHouseId>" + $("#WareHouseId").val() + "</WareHouseId><WareHouseName>" + $("#WareHouseName").val() + "</WareHouseName><SupplierName>" + $("#SupplierName").val() + "</SupplierName><PurchaseStartDate>" + $("#PurchaseStartDate").val() + "</PurchaseStartDate><PurchaseEndDate>" + $("#PurchaseEndDate").val() + "</PurchaseEndDate><PurchaseType>" + $("#PurchaseType").val() + "</PurchaseType><BuyMethod>" + $("#BuyMethod").val() + "</BuyMethod><PurchaseNum>" + $("#PurchaseNum").val() + "</PurchaseNum></Attribute>";
            $("#Attribute").val(strAttribute);
        }

        function LoadList() {
            SetAttribute();
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: true,
                pagination: true,
                remoteSort: false,
                rownumbers: true,
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("PurchaseOrder", "PurchaseOrderList", "TableContainer", param);
                },
                rowStyler: function (index, row) {
                    return 'height:20px;';
                }
            });
        }

        $('#SearchDlg').parent().appendTo($("form:first"));
        LoadList();

        $("#SupplierName").click(function (e) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(w, h, '../DialogNew/SelectSupplier.aspx', '分供方选择', true, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                var _n = '';
                for (var i = 0; i < Obj.length; i++) {
                    _n = _n + Obj[i].SupplierName + ",";
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                $("#SupplierName").val(_n);
            });
        });

        $("#WareHouseName").click(function (e) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(w, h, '../DialogNew/SelWareHouses.aspx', '仓库选择', true, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                var _n='';
                var _Id='';
                for(var i=0;i<Obj.length;i++)
                {
                    _n = _n + Obj[i].text+",";
                    _Id = _Id + Obj[i].attributes.Id+",";
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                $("#WareHouseName").val(_n);
                $("#WareHouseId").val(_Id);

            });
        });

    </script>
    </form>
</body>
</html>
