<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StorageList.aspx.cs" Inherits="M_Main.Mt.StorageList" %>
<!DOCTYPE html>
<html>
<head>
    <title>物资入库明细查询</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script  src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
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
        <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
    <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />
    <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
        <input id="WareHouseId" value="" name="WareHouseId" type="hidden"  />
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
                    <input id="WareHouseName" name="WareHouseName" class="easyui-validatebox" data-options="required:true" runat="server" />
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
                        <%--<option value="计划采购">计划采购</option>
                        <option value="非计划采购">非计划采购</option>--%>
                        <option value="调拨入库">调拨入库</option>
                        <option value="直接入库">直接入库</option>
                        <option value="赠送入库">赠送入库</option>
                        <option value="退还入库">退还入库</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    物资名称
                </td>
                <td class="TdContent">
                    <input id="MaterialName" name="MaterialName" runat="server" />
                </td>
                <td class="TdTitle">
                    物资类别
                </td>
                <td class="TdContent">
                      <input id="MaterialType" name="MaterialType" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">物资编号</td>
                <td class="TdContent">
                    <input id="Num" name="Num" runat="server"/>
                </td>
                <td class="TdTitle">物资属性</td>
                <td class="TdContent">
                    <input id="Property" name="Property" runat="server"/>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">规格型号</td>
                <td class="TdContent">
                    <input id="Specification" name="Specification" runat="server"/>
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
                { field: 'StorageType', title: '入库类型', align: 'left', width: 130, sortable: true },
                { field: 'ReceiptSign', title: '入库单号', align: 'left', width: 130, sortable: true },
                { field: 'ReceiptDate', title: '时间', align: 'left', width: 150, sortable: true },
                { field: 'OriginatorName', title: '制单人', align: 'left', width: 80, sortable: true },
                { field: 'WareHouseName', title: '仓库名称', width: 130, align: 'left', sortable: true },
                { field: 'SupplierName', title: '供方名称', width: 180, align: 'left', sortable: true },
                { field: 'State', title: '入库单状态', width: 100, align: 'left', sortable: true },
                { field: 'MaterialTypeName', title: '物资类别', width: 80, align: 'center', sortable: true },
                { field: 'MaterialName', title: '物资名称', width: 150, align: 'center', sortable: true },
                { field: 'Num', title: '物资编号', width: 150, align: 'center', sortable: true },
                { field: 'UnitName', title: '单位名称', width: 50, align: 'center', sortable: true },
                { field: 'Brand', title: '品牌', align: 'center', width: 150, sortable: true },
                { field: 'Specification', title: '规格', align: 'center', width: 150, sortable: true },
                { field: 'ColorName', title: '颜色', align: 'center', width: 80, sortable: true },
                {
                    field: 'PurchasePrice', title: '采购含税价', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.PurchasePrice, decimalPos);
                    }
                },
                {
                    field: 'Price', title: '含税单价', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Price, decimalPos);
                    }
                },
                {
                    field: 'Taxes', title: '税率', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Taxes, 2);
                    }
                },
                {
                    field: 'NoTaxPrice', title: '不含税单价', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.NoTaxPrice, decimalPos);
                    }
                },
                {
                    field: 'Quantity', title: '数量', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Quantity, 3);
                    }
                },
                {
                    field: 'Amount', title: '含税金额', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.Amount, moneyPos);
                    }
                },
                {
                    field: 'NoTaxAmount', title: '不含税金额', align: 'center', width: 80, sortable: true, formatter: function (value, row, index) {
                        return ToDecimal(row.NoTaxAmount, moneyPos);
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
                    text: '明细导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.open("../Mt/MtReport/StoreListExcel.aspx?random=" + Math.random());
                    }
            }, '-',
            {
                text: '汇总导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.open("../Mt/MtReport/StorageSumExcel.aspx?random=" + Math.random());
                }
            }, '-',
                {
                    text: '入库排行榜',
                    iconCls: 'icon-large-chart',
                    handler: function () {
                        var warehouse = $("#WareHouseName").val().trim();
                        if (warehouse=="") {
                            HDialog.Info("请先选择入库仓库");
                            return;
                        }
                        var w = $(window).width();
                        var h = $(window).height();
                        HDialog.Open(w, h, '../Mt/MtReport/StoreListHistogram.aspx?random=' + Math.random() + GetParam(), '入库排行榜', true, function callback(_Data) {
                        });
                    }
                }
        ];

        function DelRecord(row) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    if (row.State == "未启动") {
                        $.tool.DataGet('Storage', 'StorageDelete', 'Id=' + row.Id,
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
                width: "100%",
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                    $("#SearchDlg").dialog("close");
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Storage", "StorageDetailList", "TableContainer", param);
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

        function GetParam() {
            var str = '';

            str += '&ReceiptStartDate=' + $("#ReceiptStartDate").val().trim();
            str += '&ReceiptEndDate=' + $('#ReceiptEndDate').val().trim();
            str += '&ReceiptSign=' + $('#ReceiptSign').val().trim();

            str += '&WareHouseName=' + $("#WareHouseName").val().trim();
            str += '&OriginatorName=' + $('#OriginatorName').val().trim();
            str += '&StorageType=' + $('#StorageType').val().trim();

            str += '&MaterialName=' + $("#MaterialName").val().trim();
            return encodeURI(str);

        }

        $("#WareHouseName").click(function (e) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(300, h, '../DialogNew/SelWareHouses.aspx', '仓库选择', true, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                var _n = '';
                var _Id = '';
                for (var i = 0; i < Obj.length; i++) {
                    _n = _n + Obj[i].text + ",";
                    _Id = _Id + Obj[i].attributes.Id + ",";
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                $("#WareHouseName").val(_n);
                $("#WareHouseId").val(_Id);

            });
        });

        $("#MaterialType").click(function (e) {
            var w = top.$(window).width();
            var h = parent.$(window).height();
            HDialog.Open(300, h, '../DialogNew/SelMaterialType.aspx', '类别选择', true, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                var _n = '';
                var _Id = '';
                for (var i = 0; i < Obj.length; i++) {
                    _n = _n + Obj[i].text + ",";
                    _Id = _Id + Obj[i].attributes.Id + ",";
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                $("#MaterialType").val(_n);

            });
        });

    </script>
    </form>
</body>
</html>