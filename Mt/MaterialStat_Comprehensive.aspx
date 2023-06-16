<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialStat_Comprehensive.aspx.cs" Inherits="M_Main.Mt.MaterialStat_Comprehensive" %>

<!DOCTYPE html>
<html>
<head>
    <title>库存综合汇总表</title>
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
    <form id="frmForm" runat="server">
        <input type="hidden" id="MoneyNum" name="MoneyNum" runat="server" value="2" />
    <input id="WareHouseId" value="" name="WareHouseId" type="hidden"  />
    <input id="Attribute" name="Attribute" value=""  type="hidden" />
           <%--小数位数--%>
    <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
    <input type="hidden" id="Hidden1" name="MoneyNum" runat="server" value="2" />
    <input type="hidden" id="QueryType" name="QueryType" runat="server" value="1" />
    <input type="hidden" id="IsLoad" name="IsLoad" runat="server" value="0" />
    <input type="hidden"  id="MaterialTypeId" name="MaterialTypeId" runat="server" value=""/>
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
                    物资名称
                </td>
                <td class="TdContent">
                    <input id="MaterialName" name="MaterialName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    开始时间
                </td>
                <td class="TdContent">
                    <input id="StartDate" name="StartDate"  onclick="WdatePicker()" runat="server" />
                </td>
                <td class="TdTitle">
                    结束时间
                </td>
                <td class="TdContent">
                    <input id="EndDate" name="EndDate"  onclick="WdatePicker()" runat="server" />
                </td>
            </tr>
            <tr>
                  <td class="TdTitle">物资类别
                </td>
                <td class="TdContent">
                      <input id="MaterialType" name="MaterialType" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:5px;">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">确定筛选</a>
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
                SearchData();
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
            { field: 'WareHouseName', title: '仓库名称', width: 150, align: 'center', sortable: true },
            { field: 'MaterialTypeName', title: '物资类别', width: 150, align: 'center', sortable: true },
            { field: 'Num', title: '物资编号', width: 150, align: 'center', sortable: true },
            { field: 'Name', title: '物资名称', width: 180, align: 'center', sortable: true },
            { field: 'Brand', title: '品牌', width: 120, align: 'center', sortable: true },
            { field: 'UnitName', title: '单位名称', width: 80, align: 'center', sortable: true },
            { field: 'Specification', title: '规格', align: 'center', width: 250, sortable: true },
            { field: 'UnitName', title: '单位', align: 'center', width: 80, sortable: true },
            { field: 'ColorName', title: '颜色', align: 'center', width: 80, sortable: true },
            {
                field: '期初数量', title: '期初数量', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, 3);
                    return str;
                }
            },
            {
                field: '期初金额', title: '期初金额', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, moneyPos);
                    return str;
                }
            },
            {
                field: '本期入库数量', title: '本期入库数量', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, 3);
                    return str;
                }
            },
            {
                field: '本期入库金额', title: '本期入库金额', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, moneyPos);
                    return str;
                }
            },
            {
                field: '本期出库数量', title: '本期出库数量', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, 3);
                    return str;
                }
            },
            {
                field: '本期出库金额', title: '本期出库金额', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, moneyPos);
                    return str;
                }
            },
            {
                field: '期末数量', title: '期末数量', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, 3);
                    return str;
                }
            },
            {
                field: '期末金额', title: '期末金额', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                    var str = ToDecimal(value, moneyPos);
                    return str;
                }
            }
        ]];
        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: '库存综合汇总表',
                iconCls: 'icon-print',
                handler: function () {
                    ReportPrint("MaterialStatComprehensive");
                }
            }
        ];

        function ReportPrint(Cmd) {
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

        function SetAttribute() {
            var strAttribute = "<Attribute><WareHouseId>" + $("#WareHouseId").val() + "</WareHouseId><WareHouseName>" + $("#WareHouseName").val() + "</WareHouseName><StartDate>" + $("#StartDate").val() + "</StartDate><EndDate>" + $("#EndDate").val() + "</EndDate><MaterialName>" + $("#MaterialName").val() + "</MaterialName><MaterialTypeId>" + $("#MaterialTypeId").val() + "</MaterialTypeId></Attribute>";
            $("#Attribute").val(strAttribute);
        }

        function SearchData() {
            $("#QueryType").val("0");
            $("#IsLoad").val("1");
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
            LoadList();
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
                    $("#QueryType").val("1");
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("MaterialStat", "Comprehensive", "TableContainer", param);
                },
                rowStyler: function (index, row) {
                    return 'height:20px;';
                }
            });
        }

        $('#SearchDlg').parent().appendTo($("form:first"));
        LoadList();

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
                console.log(Obj);
                var _n = '';
                var _Id = '';
                for (var i = 0; i < Obj.length; i++) {
                    _n = _n + Obj[i].text + ",";
                    _Id = _Id + Obj[i].attributes.Id + ",";
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                $("#MaterialTypeId").val(_Id);
                $("#MaterialType").val(_n);

            });
        });

    </script>
    </form>
</body>
</html>
