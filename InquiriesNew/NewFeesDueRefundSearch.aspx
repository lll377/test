<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesDueRefundSearch.aspx.cs" Inherits="M_Main.InquiriesNew.NewFeesDueRefundSearch" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>




    <script language="javascript" type="text/javascript">
    <!--
    function btnClear_OnClick() {
        document.getElementById('CustID').value = "";
        document.getElementById('CustName').value = "";
        document.getElementById('hiCustName').value = "";

        document.getElementById('RoomID').value = "";
        document.getElementById('RoomSign').value = "";
        document.getElementById('hiRoomSign').value = "";

        document.getElementById('CostIDs').value = "";
        document.getElementById('CostNames').value = "";
        document.getElementById('hiCostNames').value = "";
        document.getElementById('CostNum').value = "";

        document.getElementById('RoomIDs').value = "";
        document.getElementById('RoomSigns').value = "";
        document.getElementById('hiRoomSigns').value = "";
        document.getElementById('RoomNum').value = "";

        document.getElementById('CustTypeID').value = "";
        document.getElementById('ChargeTypeID').value = "";

        document.getElementById('ParkIDs').value = "";
        document.getElementById('ParkNames').value = "";
        document.getElementById('hiParkNames').value = "";
        document.getElementById('ParkNum').value = "";

        document.getElementById('CarparkIDs').value = "";
        document.getElementById('CarparkNames').value = "";
        document.getElementById('hiCarparkNames').value = "";
        document.getElementById('CarparkNum').value = "";

        document.getElementById('RoomState').value = "";
        document.getElementById('BuildType').value = "";

        document.getElementById('RegionSNums').value = "";
        document.getElementById('RegionNames').value = "";
        document.getElementById('hiRegionNames').value = "";
        document.getElementById('RegionNum').value = "";

    }




    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }

    </script>
</head>
<body>
    <form id="NewFeesDueCutSearch" runat="server">
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaid" size="1" type="hidden" name="hiLoadFeesPaid" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidPrec" size="1" type="hidden" name="hiLoadFeesPaidPrec" runat="server" />
        <input style="width: 8px" id="hiLoadFeesPaidLt" size="1" type="hidden" name="hiLoadFeesPaidLt" runat="server" />


        <input type="hidden" id="SelectRoomList" name="SelectRoomList" value="" runat="server" />
        <input type="hidden" id="SelRoomIDs" name="SelRoomIDs" value="" runat="server" />
        <input type="hidden" id="SelRoomSigns" name="SelRoomSigns" value="" runat="server" />

        <input id="BuildSNums" type="hidden"
            size="1" name="BuildSNums" runat="server" /><input id="hiBuildNames" type="hidden"
                size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <input id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />

        <input id="hiParkNames" class="easyui-validatebox" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input id="ParkIDs" class="easyui-validatebox" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />

        <input style="width: 32px" id="PageIndex" size="1" type="hidden" name="PageIndex"
            runat="server"><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
                runat="server"><input style="width: 24px" id="CostGeneType" size="1" type="hidden" name="CostGeneType"
                    runat="server"><input style="height: 21px; width: 24px" id="OptCode" size="1" type="hidden" name="OptCode"
                        runat="server"><input style="height: 21px; width: 24px" id="Flag" size="1" type="hidden" name="Flag" runat="server">

        <input id="selTabID" type="hidden" name="selTabID" />




        <div style="width: 100%; background-color: #ffffff;" id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 800px; height: 350px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">截至时间
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datebox" id="FeesStopEndDate" runat="server" name="FeesStopEndDate" />
                    </td>
                    <td class="TdTitle">费用性质
                    </td>
                    <td class="TdContentSearch">
                        <select id="CostType" name="CostType">
                            <option value="0">全部</option>
                            <option value="1">收入</option>
                            <option value="2">代收</option>
                            <option value="3" selected>暂收</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="TdContentSearch">

                        <input type="text" class="easyui-datebox" id="EditBeginDate" style="width: 40%" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;<input type="text" runat="server" class="easyui-datebox" id="EditEndDate" style="width: 40%" name="EditEndDate" />
                    </td>
                    <td class="TdTitle">时间类型</td>
                    <td class="TdContentSearch">
                        <select id="FeesDateType" name="FeesDateType">
                            <option value="1" selected>费用日期</option>
                            <option value="2">应收日期</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" /></td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            size="14" name="RegionNames" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">楼宇类型</td>
                    <td class="TdContentSearch">
                        <select style="z-index: 0" id="BuildType" name="BuildType" runat="server">
                            <option selected></option>
                        </select></td>

                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <select id="RoomState" name="RoomState" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" />

                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" class="easyui-combobox" style="width: 150px" name="SelRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" searcher="SelRoom" name="RoomSign" data-options="editable:false" runat="server" />
                        <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" />

                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>



                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server"></td>
                    <td class="TdTitle">收据号码</td>
                    <td class="TdContentSearch">
                        <input class="easyui-textbox" id="BillsSign" name="BillsSign" runat="server">
                    </td>
                </tr>

                <tr>
                    <td colspan="4" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" setIsSQLData();LoadList(); ">确定筛选</a>

                    </td>
                </tr>
            </table>
        </div>


        <input style="width: 8px" id="CostIDs" class="easyui-validatebox" size="1"
            type="hidden" name="CostIDs" runat="server" />
        <input style="width: 8px" id="StanIDs" class="easyui-validatebox" size="1"
            type="hidden" name="StanIDs" runat="server" />
        <input style="width: 8px" id="hiStanNames" class="easyui-validatebox" size="1"
            type="hidden" name="hiStanNames" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

            }

            InitTableHeight();
            var column = [[

                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 150 },
                { field: 'ChargeDate', title: '收款时间', align: 'left', sortable: true, width: 200 },
                { field: 'BillsSign', title: '收据号码', align: 'left', sortable: true, width: 100 },
                { field: 'UserName', title: '收款人', align: 'left', sortable: true, width: 100 },
                { field: 'ChargeAmount', title: '收款金额', align: 'left', sortable: true, width: 100 },
                { field: 'PrecAmount', title: '冲抵金额', align: 'left', sortable: true, width: 100 },
                { field: 'LateFeeAmount', title: '合同违约金', align: 'left', sortable: true, width: 100 },
                { field: 'ExpenseAccount', title: '付款金额', align: 'left', sortable: true, width: 100 },
                { field: 'RefundAllAmount', title: '已退金额', align: 'left', sortable: true, width: 100 },
                { field: 'IsRefundAllAmount', title: '未退金额', align: 'left', sortable: true, width: 100 },
                {
                    field: 'CostType', title: '费用性质', align: 'left', sortable: true, width: 100,
                    formatter: function (value, row, index) {
                        switch (value) {
                            case "0":
                                return "全部";
                                break;
                            case "1":
                                return "收入";
                                break;
                            case "2":
                                return "代收";
                                break;
                            case "3":
                                return "暂收";
                                break;
                            default:
                                return "";
                        }
                    }
                },
                { field: 'FeesDueDate', title: '费用时间', align: 'left', sortable: true, width: 200 },
                //{
                //    field: 'FeesDueDate', title: '费用时间', align: 'left', sortable: true, width: 100,
                //    formatter: function (value, row, index) {
                //        var str = formatDate(value, "yyyy-MM-dd");
                //        return str;
                //    }
                //},
                { field: 'RefundFeesMemo', title: '备注', align: 'left', sortable: true, width: 100 }

            ]];
            var frozenColumns = [[
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, fixed: true, width: 200 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, fixed: true, width: 200 }

            ]];

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

            function SelBuild() {
                var varReturn;



                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildSNums = "";
                        var BuildNames = "";
                        $('#BuildSNums').val(BuildSNums);
                        $('#BuildNames').searchbox('setValue', BuildNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                        $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });

            }




            function SelRegion() {

                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var RegionSNums = "";
                        var RegionNames = "";


                        $('#RegionSNums').val(RegionSNums);
                        $('#RegionNames').searchbox('setValue', RegionNames);
                        $('#hiRegionNames').val(RegionNames);



                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {

                                RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                                RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                        $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));

                        $('#hiRegionNames').val(RegionNames);

                    }
                });

            }
            function SelCarpark() {

                HDialog.Open('700', '400', "../dialogNew/MultiCarparkDlg.aspx", '车位区域选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");


                        var CarparkIDs = "";
                        var CarparkNames = "";
                        $('#CarparkIDs').val(CarparkIDs);
                        $('#CarparkNames').searchbox('setValue', CarparkNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                CarparkIDs = CarparkIDs + "," + varObjects[i].split(',')[0];
                                CarparkNames = CarparkNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#CarparkIDs').val(CarparkIDs.substring(1, CarparkIDs.length));
                        $('#CarparkNames').searchbox('setValue', CarparkNames.substring(1, CarparkNames.length));

                    }
                });

            }



            function SelCost() {
                var varReturn;

                var w = 700;
                var h = 400;


                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);

                    }
                });

                return false;
            }

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 700;
                var h = 400;

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);


                    $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                        function Init() {
                        },
                        function callback(_Data) {

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {

                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {

                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";

                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }
                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                                }

                                $('#SelRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {


                                        var data = $('#SelRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#RoomID').val(data[i].RoomID.split("|")[0]);

                                                    break;
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });
            }

            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);
                });

            }



            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: 'Excel输出(按笔)',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ToExcel();
                    }
                }, '-',
                {
                    text: 'Excel输出(按户)',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        ToExcel2();
                    }
                }
            ];

            function SearchDlg() {


                btnClear_OnClick();
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }


            function setIsSQLData() {
                $('#ExcelDc').linkbutton('enable');
                document.getElementById('hiIsSQLData').value = 1;
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    toolbar: toolbar,
                    view: myview,
                    sortOrder: "asc",
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("FeesRefundSearch", "DueRefundFees", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {


                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }
                    }, onLoadSuccess: function (data) {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                CustName: "<span style='color:red'>累计合计</span>",
                                ChargeAmount: "<span style='color:red'>0</span>",
                                PrecAmount: "<span style='color:red'>0</span>",
                                LateFeeAmount: "<span style='color:red'>0</span>",
                                ExpenseAccount: "<span style='color:red'>0</span>",
                                RefundAllAmount: "<span style='color:red'>0</span>",
                                IsRefundAllAmount: "<span style='color:red'>0</span>"
                            }
                        ]);
                        if (data.total != 0 && data != '') {
                            $.tool.DataPostNoLoading('FeesRefundSearch', "DueRefundFeesSum", $('#NewFeesDueCutSearch').serialize(),
                                function Init() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            ChargeAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmount: "<span style='color:red'>0</span>",
                                            ExpenseAccount: "<span style='color:red'>0</span>",
                                            RefundAllAmount: "<span style='color:red'>0</span>",
                                            IsRefundAllAmount: "<span style='color:red'>0</span>"
                                        }
                                    ]);
                                },
                                function callback(_Data) {

                                    var Data = eval("(" + _Data + ")"); //转换为json对象
                                    var obj = Data.rows[0];
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            ChargeAmount: "<span style='color:red'>" + obj.ChargeAmount + "</span>",
                                            PrecAmount: "<span style='color:red'>" + obj.PrecAmount + "</span>",
                                            LateFeeAmount: "<span style='color:red'>" + obj.LateFeeAmount + "</span>",
                                            ExpenseAccount: "<span style='color:red'>" + obj.ExpenseAccount + "</span>",
                                            RefundAllAmount: "<span style='color:red'>" + obj.RefundAllAmount + "</span>",
                                            IsRefundAllAmount: "<span style='color:red'>" + obj.IsRefundAllAmount + "</span>"

                                        }
                                    ]);
                                },
                                function completeCallback() {

                                },
                                function errorCallback() {
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            FeesID: 'footer',
                                            CustName: "<span style='color:red'>累计合计</span>",
                                            ChargeAmount: "<span style='color:red'>0</span>",
                                            PrecAmount: "<span style='color:red'>0</span>",
                                            LateFeeAmount: "<span style='color:red'>0</span>",
                                            ExpenseAccount: "<span style='color:red'>0</span>",
                                            RefundAllAmount: "<span style='color:red'>0</span>",
                                            IsRefundAllAmount: "<span style='color:red'>0</span>"

                                        }
                                    ]);
                                });
                        }
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            document.getElementById('hiIsSQLData').value = -1;
            LoadList();
            document.getElementById('hiLoadFeesPaid').value = 1;
            $(window).resize(function () {
                $('#TableContainer').datagrid('resize')
            });

        </script>

        <script type="text/javascript">
            function ExcuteOnServer() {

                document.getElementById('hiIsSQLData').value = "";
                LoadList();
                $('#SearchDlg').dialog('close');

            }



            function ToExcel() {

                window.location.href = "../Inquiries/FeesDueRefundSearchCreExcel.aspx";
            }
            function ToExcel2() {

                window.location.href = "../Inquiries/FeesDueRefundDepartmentSearchCreExcel.aspx?CostIDs="
                    + $('#CostIDs').val() + "&BuildSNums=" + $('#BuildSNums').val() + "&RegionSNums="
                    + $('#RegionSNums').val() + "&CustTypeID=" + $('#CustTypeID').val() + "&ChargeTypeID="
                    + $('#ChargeTypeID').val() + "&RoomState=" + $('#RoomState').val() + "&RoomID="
                    + $('#RoomID').val();

            }


        </script>




    </form>
</body>
</html>
