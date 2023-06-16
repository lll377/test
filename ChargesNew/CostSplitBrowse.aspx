<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostSplitBrowse.aspx.cs" Inherits="M_Main.ChargesNew.CostSplitBrowse" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>采购单</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 200px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select id="RegionSNum" name="RegionSNum" class="easyui-combobox"
                            data-options=" multiple: true " runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContent">
                        <select id="BuildSNum" runat="server" class="easyui-combobox"
                            data-options=" multiple: true " style="width: 140px;" name="BuildSNum">
                        </select>
                    </td>
                </tr>
                <tr class="tr">
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="RoomSign" name="RoomSign" style="width: 140px;" searcher="SelRoomSign" runat="server" />
                        <input type="hidden" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" id="CustName" data-options="editable:false" name="CustName"
                            style="width: 140px;" searcher="SelCust" runat="server" />
                        <input id="CustID" type="hidden" name="CustID" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">车位编号</td>
                    <td class="TdContentSearch">
                        <input name="ParkName" type="text" id="ParkName" class="easyui-searchbox" data-options="editable:false" searcher="SelPark" />
                        <input type="hidden" id="ParkID" />

                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input name="CostName" type="text" id="CostName" class="easyui-searchbox" data-options="editable:false" maxlength="50" searcher="SelCost" />
                        <input name="CostID" type="hidden" id="CostID" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费标准</td>
                    <td class="TdContentSearch">
                        <input id="StanNames" class="easyui-searchbox" data-options="editable:false" searcher="SelStan"
                            name="StanNames" runat="server" />
                        <input type="hidden" id="StanIDs" name="StanIDs" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从</td>
                    <td class="TdContentSearch" colspan="3">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditBeginDate" runat="server" name="EditBeginDate" />&nbsp;到&nbsp;
						<input type="text" runat="server" class="Wdate" onclick="    WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EditEndDate" name="EditEndDate" />

                    </td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            function SelStan() {
                var tmpCostIDs = $('#CostID').val();
                if (tmpCostIDs == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                    return false;
                }
                var w = 700;
                var h = 400;
                HDialog.Open('700', '400', "../dialogNew/MultiStanDlg.aspx?CostIDs=" + tmpCostIDs + "&IsShowHis=1" + "&Ram=" + Math.random(), '收费标准选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");
                        $('#StanIDs').val(varObjects[0]);
                        $('#StanNames').searchbox('setValue', varObjects[1]);
                        var varObjects = _Data.split("|");
                        var StanIDs = "";
                        var StanNames = "";
                        $('#StanIDs').val(StanIDs);
                        $('#StanNames').searchbox('setValue', StanNames);
                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];
                                StanIDs = StanIDs + "," + varObjects[i].split(',')[0];
                                StanNames = StanNames + "," + varObjects[i].split(',')[1];
                            }
                        }
                        $('#StanIDs').val(StanIDs.substring(1, StanIDs.length));
                        $('#StanNames').searchbox('setValue', StanNames.substring(1, StanNames.length));
                    }
                });
            }

            function SelCost() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");
                        $('#CostID').val(varObjects[0]);
                        $('#CostName').searchbox('setValue', varObjects[1]);
                    }
                });
            }

            function SelPark() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#ParkName').searchbox("setValue", '');
                $("#HandID").val('');
                HDialog.Open('700', '400', "../dialogNew/ParkingHandDlg.aspx", '车位选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var obj = JSON.parse(_Data);
                        console.log(obj);
                        $('#ParkName').searchbox("setValue", obj.ParkName);
                        $("#ParkID").val(obj.ParkID);
                        $('#CustName').searchbox("setValue", obj.CustName);
                        $('#CustID').val(obj.CustID);
                        $('#RoomSign').searchbox("setValue", obj.RoomSign);
                        $('#RoomID').val(obj.RoomID);
                    }
                });

            }

            function SelRoomSign() {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', true, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#RoomID').val(data.RoomID);
                });
            }

            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                HDialog.Open('1100', '530', "../DialogNew/CustDlg.aspx", '选择客户名称', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }

            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
            ]];

            var column = [[
                { field: 'CostCode', title: 'CostCode', width: '50', align: 'center', sortable: true, hidden: 'true' },
                { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

                { field: 'ParkName', title: '车位编号', width: 80, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true }


            ]];

            var toolbar = [
                {
                    text: '按单价拆分',
                    iconCls: 'icon-cut',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row != null) {
                            var feesids = GetDateGridCheckId();
                            if (feesids != '' && feesids != undefined) {
                                var width = 600;
                                var height = 250;
                                var Title = "拆分费用";
                                var conent = "../ChargesNew/CostSplitBrowseManage.aspx?OPType=Edit&FeesID=" + feesids
                                HDialog.Open(width, height, conent, Title, false, function callback(_Data) {
                                    if (_Data != "") {
                                        HDialog.Info(_Data);
                                        LoadList();
                                    }
                                });
                            }
                        }
                        else {
                            HDialog.Info("请至少选择一行数据！");
                        }
                    }
                }, '-',
                {
                    text: '按比例拆分',
                    iconCls: 'icon-cut',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        if (row != null) {
                            var feesids = GetDateGridCheckId2();
                            if (feesids != '' && feesids != undefined) {
                                var width = 600;
                                var height = 250;
                                var Title = "拆分费用";
                                var conent = "../ChargesNew/CostSplitBrowseManageProportion.aspx?OPType=Edit&FeesID=" + feesids
                                HDialog.Open(width, height, conent, Title, false, function callback(_Data) {
                                    if (_Data != "") {
                                        HDialog.Info(_Data);
                                        LoadList();
                                    }
                                });
                            }
                        }
                        else {
                            HDialog.Info("请至少选择一行数据！");
                        }
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '<span style="color:red">备注：按单价拆分只使用收费标准为“按建筑面积*单价”、“按单定额每月”的费用。</span>',
                }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Fees", "CostSplitSearch", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }
            $('#SearchDlg').parent().appendTo($("form:first"));
            //LoadList();

            function DeLoadList() {
                $("#TableContainer").datagrid({
                    data: null,
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }
            DeLoadList();

            //获取单选或者批量的ID
            function GetDateGridCheckId() {
                var str = "";
                var row = $("#TableContainer").datagrid("getChecked");
                if (row.length > 0) {
                    for (var i = 0; i < row.length; i++) {
                        if (row[i].StanFormula != '1' && row[i].StanFormula != '2' && row[i].StanFormula != '3') {
                            HDialog.Info("费用标准不能拆分");
                            str = "";
                            return;
                        }
                        str += "," + row[i].FeesID;
                    }
                    if (str.length > 0)
                        str = str.substr(1, str.length - 1);
                }
                return str;
            }

            function GetDateGridCheckId2() {
                var str = "";
                var row = $("#TableContainer").datagrid("getChecked");
                if (row.length > 0) {
                    for (var i = 0; i < row.length; i++) {
                        str += "," + row[i].FeesID;
                    }
                    if (str.length > 0)
                        str = str.substr(1, str.length - 1);
                }
                return str;
            }
        </script>
    </form>
</body>
</html>
