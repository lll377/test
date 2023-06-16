<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialSendReport.aspx.cs" Inherits="M_Main.Mt.MaterialSendReport" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html>
<head>
    <title>物料收发汇总表</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/export.js"></script>
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
        <input id="WareHouseId" value="" name="WareHouseId" type="hidden" />
        <%--小数位数--%>
        <input type="hidden" id="DecimalNum" name="DecimalNum" runat="server" value="4" />
        <input type="hidden" id="QueryType" name="QueryType" runat="server" value="1" />
        <input type="hidden" id="IsLoad" name="IsLoad" runat="server" value="0" />
        <input type="hidden" id="MaterialTypeId" name="MaterialTypeId" runat="server" value="" />
        <div id="TableContainer" style="width: 100%;"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">仓库
                    </td>
                    <td class="TdContent">
                        <input id="WareHouseName" name="WareHouseName" runat="server" />
                    </td>
                    <td class="TdTitle">物资类别
                    </td>
                    <td class="TdContent">
                        <input id="MaterialType" name="MaterialType" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间
                    </td>
                    <td class="TdContent">
                        <input id="StartDate" name="StartDate" onclick="WdatePicker()" runat="server" />
                    </td>
                    <td class="TdTitle">结束时间
                    </td>
                    <td class="TdContent">
                        <input id="EndDate" name="EndDate" onclick="WdatePicker()" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SearchData();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
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
            column = [
                [
                    { rowspan: 2, field: '会计期间', title: '会计期间', align: 'center', sortable: false, width: 180 },
                    { rowspan: 2, field: '物料类别', title: '1级物料类别', align: 'center', sortable: false, width: 100 },
                    { rowspan: 2, field: '物料编码', title: '物料长代码', align: 'center', sortable: false, width: 100 },
                    { colspan: 3, title: '期初结存' },
                    { colspan: 3, title: '本期收入' },
                    { colspan: 3, title: '本期发出' },
                    { colspan: 3, title: '期末结存' }
                ],
                [
                    { field: '期初结存单价', title: '单价(基本)', align: 'center', sortable: false, width: 100 },
                    { field: '期初结存数量', title: '数量(基本)', align: 'center', sortable: false, width: 100 },
                    { field: '期初结存金额', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: '本期收入单价', title: '单价(基本)', align: 'center', sortable: false, width: 100 },
                    { field: '本期收入数量', title: '数量(基本)', align: 'center', sortable: false, width: 100 },
                    { field: '本期收入金额', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: '本期发出单价', title: '单价(基本)', align: 'center', sortable: false, width: 100 },
                    { field: '本期发出数量', title: '数量(基本)', align: 'center', sortable: false, width: 100 },
                    { field: '本期发出金额', title: '金额', align: 'center', sortable: false, width: 100 },
                    { field: '期末结存单价', title: '单价(基本', align: 'center', sortable: false, width: 100 },
                    { field: '期末结存数量', title: '数量(基本)', align: 'center', sortable: false, width: 100 },
                    { field: '期末结存金额', title: '金额', align: 'center', sortable: false, width: 100 }
                ]
            ];
          
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
                text: '导出Excel',
                iconCls: 'icon-page_white_excel',
                handler: function ()
                {
                    window.open("../Mt/MtReport/MaterialSendReportExcel.aspx?random=" + Math.random());

                }
            }
            ];
            function SearchData()
            {
            $("#QueryType").val("0");
            $("#IsLoad").val("1");
            if ($("#WareHouseId").val() == "") {
                HDialog.Info("请选择仓库");
                return;
            }
                if ($("#StartDate").val() == "") {
                HDialog.Info("开始时间不能为空");
                return;
            }
                if ($("#EndDate").val() == "") {
                HDialog.Info("结束时间不能为空");
                return;
            }
            LoadList();
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
                toolbar: toolbar,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                    $("#QueryType").val("1");
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("MaterialStat", "MaterialSendReport", "TableContainer", param);
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
