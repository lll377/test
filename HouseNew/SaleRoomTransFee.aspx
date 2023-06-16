<%@ Page Language="c#" CodeBehind="SaleRoomTransFee.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.SaleRoomTransFee" %>

<!DOCTYPE HTML >
<html>
<head>
    <title></title>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script language="javascript">
		<!--

    function CheckData() {
        //if(SaleRoomTransFee.CustName.value=="")
        //{
        //	alert("请输入业主名称,此项不能为空!");
        //	SaleRoomTransFee.CustName.focus();
        //	return false;
        //}										
        return true;
    }

    //勾选所有复选框
    function onClickAll(obj) {
        var tmpLimitCount = parseInt(getObject("LimitCount").value, 10);

        if (!obj) obj = event.srcElement;

        var i, j;
        var objTable = DGridFee;

        for (i = 0; i < objTable.rows.length; i++) {
            for (j = 0; j < objTable.rows[i].cells.length; j++) {
                if (objTable.rows[i].cells[j].children[0] && !objTable.rows[i].cells[j].children[0].disabled && tmpLimitCount >= 0 && objTable.rows[i].SysCostSign != "Head") {
                    if (obj.checked) {
                        objTable.rows[i].cells[j].children[0].checked = obj.checked;
                        tmpLimitCount = tmpLimitCount - 1;
                    }
                    else {
                        objTable.rows[i].cells[j].children[0].checked = obj.checked;
                    }
                }
            }
        }

        GetFeesID(obj);
    }

    //勾选节点复选框
    function onClickOne(obj) {

        if (!obj) obj = event.srcElement;
        var i, cidx, ridex;
        var objTable = DGridFee;
        //var tmpRoomID;
        var tmpFeesID;
        var tmpOwnerFeesID;
        var tmpSelRoomID;

        cidx = obj.parentElement.cellIndex;
        ridex = obj.parentElement.parentElement.rowIndex;
        //tmpRoomID = objTable.rows[ridex].RoomID;
        tmpFeesID = objTable.rows[ridex].FeesID;
        tmpOwnerFeesID = objTable.rows[ridex].OwnerFeesID;

        //费用与佣金同时选择
        for (i = 0; i < objTable.rows.length; i++) {
            if (objTable.rows[i].cells[cidx].children[0] && !objTable.rows[i].cells[cidx].children[0].disabled) {
                if ((objTable.rows[i].OwnerFeesID == tmpFeesID) || (objTable.rows[i].FeesID == tmpOwnerFeesID)) {
                    objTable.rows[i].cells[cidx].children[0].checked = obj.checked;
                }
            }
        }

        GetFeesID(obj);
    }

    function GetFeesID(obj) {
        if (!obj) obj = event.srcElement;

        var i, cidx, ridex;
        var objTable = DGridFee;
        var strFeesIDs = "";
        //var strIsProperty = "";
        //var strIsCostType3 = "";
        var SelCount = 0;

        cidx = obj.parentElement.cellIndex;
        ridex = obj.parentElement.parentElement.rowIndex;

        for (i = 1; i < objTable.rows.length - 1; i++) {
            if (!objTable.rows[i].cells[cidx].children[0].disabled) {
                if (objTable.rows[i].cells[cidx].children[0].checked) {
                    SelCount = SelCount + 1;

                    if (SelCount > 90) {
                        objTable.rows[i].cells[cidx].children[0].checked = false;
                    }
                    else {
                        if (strFeesIDs != "") {
                            strFeesIDs = strFeesIDs + "," + objTable.rows[i].FeesID;
                        }
                        else {
                            strFeesIDs = objTable.rows[i].FeesID;
                        }
                    }

                }
            }
        }

        if (SelCount > 90) {
            alert("提示：最多一次可选择90笔费用！");//点确定继续
        }

        getObject("FeesIDs").value = strFeesIDs;
    }

    //勾选所有复选框
    function onClickPrecAll(obj) {

        if (!obj) obj = event.srcElement;

        var i, j;
        var objTable = DGridPrec;

        for (i = 0; i < objTable.rows.length; i++) {
            for (j = 0; j < objTable.rows[i].cells.length; j++) {
                if (objTable.rows[i].cells[j].children[0] && !objTable.rows[i].cells[j].children[0].disabled && objTable.rows[i].SysCostSign != "Head") {
                    if (obj.checked) {
                        objTable.rows[i].cells[j].children[0].checked = obj.checked;
                    }
                    else {
                        objTable.rows[i].cells[j].children[0].checked = obj.checked;
                    }
                }
            }
        }

        GetPrecID(obj);
    }

    //勾选节点复选框
    function onClickPrecOne(obj) {
        if (!obj) obj = event.srcElement;
        GetPrecID(obj);
    }

    function GetPrecID(obj) {
        if (!obj) obj = event.srcElement;

        var i, cidx, ridex;
        var objTable = DGridPrec;
        var strPrecIDs = "";
        var SelCount = 0;

        cidx = obj.parentElement.cellIndex;
        ridex = obj.parentElement.parentElement.rowIndex;

        for (i = 1; i <= objTable.rows.length - 1; i++) {
            if (!objTable.rows[i].cells[cidx].children[0].disabled) {

                if (objTable.rows[i].cells[cidx].children[0].checked) {
                    SelCount = SelCount + 1;

                    if (SelCount > 90) {
                        objTable.rows[i].cells[cidx].children[0].checked = false;
                    }
                    else {
                        if (strPrecIDs != "") {
                            strPrecIDs = strPrecIDs + "," + objTable.rows[i].PrecID + "\t" + objTable.rows[i].cells[cidx - 1].children[0].value;
                        }
                        else {
                            strPrecIDs = objTable.rows[i].PrecID + "\t" + objTable.rows[i].cells[cidx - 1].children[0].value;
                        }
                    }
                }
            }
        }

        if (SelCount > 90) {
            alert("提示：最多一次可选择90笔费用！");//点确定继续
        }

        getObject("PrecIDs").value = strPrecIDs;

        //alert(strPrecIDs);
    }

    //勾选节点复选框
    function onblurPrecOne(obj) {
        if (!obj) obj = event.srcElement;

        var i, cidx, ridex;
        var objTable = DGridPrec;

        cidx = obj.parentElement.cellIndex;
        ridex = obj.parentElement.parentElement.rowIndex;

        var iPrecAmount = parseFloat(obj.value);
        var iLimitAmount = parseFloat(objTable.rows[ridex].getAttribute("PrecAmount"));

        if (iPrecAmount > iLimitAmount) {
            obj.value = iLimitAmount;
        }

        if (iPrecAmount < 0) {
            obj.value = 0;
        }

        GetPrecID(objTable.rows[ridex].cells[cidx + 1].children[0]);
    }


		//-->
    </script>
</head>
<body style="overflow-y: auto">
    <form id="SaleRoomTransFee" method="post" runat="server">
        <input id="PageIndex" style="width: 16px; height: 22px" type="hidden" size="1" name="PageIndex"
            runat="server"><input id="LiveID" style="width: 16px; height: 22px" type="hidden" size="1" name="LiveID"
                runat="server"><input id="CustID" style="width: 16px; height: 22px" type="hidden" size="1" name="CustID"
                    runat="server"><input id="RoomID" style="width: 16px; height: 22px" type="hidden" size="1" name="RoomID"
                        runat="server"><input id="OldCustID" style="width: 16px; height: 22px" type="hidden" size="1" name="OldCustID"
                            runat="server"><input id="FeesIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="FeesIDs"
                                runat="server"><input id="PrecIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="PrecIDs"
                                    runat="server"><input id="LimitCount" style="width: 16px; height: 22px" type="hidden" size="1" name="LimitCount"
                                        runat="server">
        <input id="SearchResult" name="SearchResult" runat="server" type="hidden" />
        <input id="SearchResult2" name="SearchResult2" runat="server" type="hidden" />
        <input id="AllData" name="AllData" runat="server" type="hidden" />
        <table class="DialogTable" width="100%">

            <tr>
                <td class="TdTitle" align="right" width="15%"><font face="宋体">现业主名称</font></td>
                <td class="TdContent" width="35%">
                    <asp:Label ID="CustName" runat="server"></asp:Label></td>
                <td class="TdTitle" align="right" width="15%"><font face="宋体">原业主名称</font></td>
                <td class="TdContent" width="35%">
                    <asp:Label ID="MasterName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle" align="right" width="15%"><font face="宋体">房屋编号</font></td>
                <td class="TdContent" width="35%">
                    <asp:Label ID="RoomSign" runat="server"></asp:Label></td>
                <td class="TdTitle" align="right" width="15%"><font face="宋体">变更时间</font></td>
                <td class="TdContent" width="35%">
                    <asp:Label ID="ChargeTime" runat="server"></asp:Label></td>
            </tr>
        </table>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer1">
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer2">
        </div>
        <table class="DialogTable" width="100%">
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="确定转移" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server"></td>
            </tr>
        </table>

        <div id="toolbar">
            <table style="width: 100%;">
                <tr>
                    <td style="padding-left: 5px;"><span class="fa fa-laptop"></span>原业主应收费用</td>
                    <td style="text-align: right; padding-right: 40px;">月份筛选：<asp:DropDownList ID="FeesYearMonth" runat="server" AutoPostBack="True"></asp:DropDownList>

                    </td>
                </tr>
            </table>

        </div>
        <div id="toolbar2">
            <table style="width: 100%;">
                <tr>
                    <td style="padding-left: 5px;"><span class="fa fa-laptop"></span>原业主预交余额</td>

                </tr>
            </table>

        </div>

        <script type="text/javascript">

            function InitFunction() {

                $("#TableContainer1").css("height", 250 + "px");
                $("#TableContainer2").css("height", 150 + "px");
            }
            InitFunction();


            //冻结列
            var frozenColumns =
                [[
                    {
                        field: 'Fids', checkbox: false, title: '<span id=\'SelAllSpan\' onclick=\'SelAllFees();\'>全选</span>', width: '26', align: 'center', sortable: false, formatter: function (value, row, index) {
                            if (value == 'footer') return "";
                            var Disabled = "";
                            var isLock = "false";
                            if (row.IsBank != 0 || row.IsFreeze != 0 || row.IsPrec != 0) {
                                Disabled = "Disabled";
                                isLock = "true";
                            }
                            var str = "<input onclick=\"Fids_Click('" + index + "');\" id='Fids' name='Fids' type='checkbox' class='Fids' " + Disabled + " isLock=\"" + isLock + "\" value=\"" + row.FeesID + "\" >";
                            return str;
                        }
                    },
                    { field: 'CustName', title: '客户名称', width: '160', align: 'center', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', width: '80', align: 'center', sortable: true },
                    { field: 'ParkName', title: '车位编号', width: '80', align: 'center', sortable: true },
                    { field: 'CostName', title: '费用名称', width: '100', align: 'center', sortable: true }
                ]]
            //绑定列表列
            var column;
            column = [[
                //{ field: 'FeesIDs', title: '选择', align: 'left', checkbox: true, sortable: false },

                { field: 'FeeDueYearMonth', title: '费用日期', width: '120', align: 'center', sortable: true },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: '70', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: '70', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: '70', align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: '75', align: 'center', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: '60', align: 'center', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: '60', align: 'center', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: '60', align: 'center', sortable: true },
                { field: 'IsBankName', title: '托收', width: '60', align: 'center', sortable: true },
                { field: 'IsFreezeName', title: '冻结', width: '60', align: 'center', sortable: true },
                { field: 'IsPropertyName', title: '垫付', width: '60', align: 'center', sortable: true },
                { field: 'IsPrecName', title: '预交', width: '60', align: 'center', sortable: true }
            ]];

            //计算小数位数
            var decimalPos = 2;

            //绑定列表列
            var column1;
            column1 = [[
                { field: 'ck', checkbox: true },
                { field: 'CustName', title: '客户名称', width: '160', align: 'center', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: '80', align: 'center', sortable: true },
                { field: 'ParkNames', title: '车位编号', width: '80', align: 'center', sortable: true },
                { field: 'PrecAmount', title: '预交余额', width: '75', align: 'center', sortable: true },
                { field: 'IsPrecName', title: '是否参与冲抵', width: '100', align: 'center', sortable: true },
                { field: 'CostNames', title: '冲抵费用项目', width: '200', align: 'center', sortable: true },
                {
                    field: 'PrecAmountE', title: '转移金额', width: '75', align: 'center', sortable: true
                    , editor: {
                        type: 'numberbox',
                        options: {
                            precision: decimalPos
                        }
                    }
                },
            ]];

            //指定列求和
            function compute(colName) {
                var rows = $('#TableContainer1').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
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

            //列表绑定定义
            $("#TableContainer1").datagrid({
                //url: '/HM/M_Main/HC/DataPostControl.aspx',
                //method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                singleSelect: false,
                remoteSort: false,
                pagination: false,
                rownumbers: true,
                checkOnSelect: true,
                selectOnCheck: true,
                cascadeCheck: true,
                IsCustomHead: false,
                showFooter: true,
                striped: true,
                view: myview,
                width: "100%",
                toolbar: '#toolbar',
                border: false,
                sortOrder: "asc",
                frozenColumns: frozenColumns,
                rowStyler: function (index, row) {
                    //如果是页脚
                    if (row.Fids == 'footer') {
                        return 'background-color:#F4F4F4;border:none;'; // return inline style
                    }
                },
                onLoadSuccess: function (data) {
                    //加载页脚
                    $('#TableContainer1').datagrid('reloadFooter', [
                        {
                            Fids: 'footer',
                            RoomSign: "<span style='color:red'>全部合计</span>",
                            DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                            PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>",
                            WaivAmount: "<span style='color:red'>" + compute("WaivAmount") + "</span>",
                            DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>",
                            LateFeeAmount: "<span style='color:red'>" + compute("LateFeeAmount") + "</span>",
                            IsBank: 'footer'
                        }
                    ]);
                },
                onClickRow: function (index, row) {
                    RowClick(index, row);
                }
            });

            //全选控制
            var IsSelAll = false;
            function SelAllFees() {
                var rows = $('#TableContainer1').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    if (IsSelAll == false) {
                        var RI = $("#TableContainer1").datagrid("getRowIndex", rows[i]);
                        var IsLock = $("input[value='" + rows[i].FeesID + "']").attr("isLock");
                        if (IsLock == "true") {
                            $("#TableContainer1").datagrid("unselectRow", RI);
                            $("input[value='" + rows[i].FeesID + "']").prop("checked", false);
                        }
                        if (IsLock == "false") {
                            $("#TableContainer1").datagrid("selectRow", RI);
                            $("input[value='" + rows[i].FeesID + "']").prop("checked", true);
                        }
                    }
                    else {
                        var RI = $("#TableContainer1").datagrid("getRowIndex", rows[i]);
                        $("#TableContainer1").datagrid("unselectRow", RI);
                        $("input[value='" + rows[i].FeesID + "']").prop("checked", false);
                    }
                }
                if (IsSelAll == false) {
                    IsSelAll = true;
                    $("#SelAllSpan").html("取消");
                }
                else {
                    IsSelAll = false;
                    $("#SelAllSpan").html("全选");
                }
                //得到FeesID的列表，并设置相应参数
                GetFeesID();
            }

            function SelRow(RowIndex, FeesID, IsClickCheckBox) {
                //如果是尾行统计则返回false;
                if (FeesID == undefined) {
                    $("#TableContainer1").datagrid("unselectRow", RowIndex);
                    return false;
                }
                var IsLock = $("input[value='" + FeesID + "']").attr("isLock");
                if (IsLock == "true") {
                    $("#TableContainer1").datagrid("unselectRow", RowIndex);
                    $("input[value='" + FeesID + "']").prop("checked", false);
                    return false;
                }
                else {
                    var IsSel = $("input[value='" + FeesID + "']").is(':checked');
                    //如果是从行点击，则控制状态
                    if (IsClickCheckBox == false) {
                        var Cmd = "selectRow";
                        if (IsSel == false) {
                            $("#TableContainer1").datagrid("selectRow", RowIndex);
                            $("input[value='" + FeesID + "']").prop("checked", true);
                        }
                        if (IsSel == true) {
                            $("#TableContainer1").datagrid("unselectRow", RowIndex);
                            $("input[value='" + FeesID + "']").prop("checked", false);
                        }
                    }
                }

                return true;
            }

            //CheckBox上面直接单击
            var IsCheckBoxClick = false;
            function Fids_Click(RowIndex) {
                IsCheckBoxClick = true;
            }
            //行点击,需要计算费用
            function RowClick(RowIndex, Row) {
                ////如果已经通过CheckBox单击了
                if (IsCheckBoxClick == true) {
                    var IsSel = $("input[value='" + Row.FeesID + "']").is(':checked');
                    if (IsSel == true) {
                        $("#TableContainer1").datagrid("selectRow", RowIndex);
                    }
                    else {
                        $("#TableContainer1").datagrid("unselectRow", RowIndex);
                    }
                    //第三个参数：true:CheckBox单击 
                    FunRowClick(RowIndex, Row, true);
                    IsCheckBoxClick = false;
                    return false;
                }
                //第三个参数：true:CheckBox单击 
                FunRowClick(RowIndex, Row, false);
            }

            function FunRowClick(RowIndex, Row, IsClickCheckBox) {
                var tmpRoomID;
                var tmpFeesID;
                var tmpOwnerFeesID;
                var tmpSelRoomID;
                var tmpSysCostSign;
                tmpRoomID = Row.RoomID;
                tmpFeesID = Row.FeesID;
                tmpOwnerFeesID = Row.OwnerFeesID;
                tmpSysCostSign = Row.SysCostSign;
                tmpIsTax = $("#IsTax").val();


                var R = SelRow(RowIndex, Row.FeesID, IsClickCheckBox);
                if (R == false) return false;

                //佣金与费项联动
                var IsSel = $("input[value='" + Row.FeesID + "']").is(':checked');
                var Cmd = "selectRow";
                if (IsSel == false) Cmd = "unselectRow";
                var rows = $('#TableContainer1').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    var RI = $("#TableContainer1").datagrid("getRowIndex", rows[i]);
                    if (rows[i].OwnerFeesID == tmpFeesID) {
                        $("#TableContainer1").datagrid(Cmd, RI);
                        $("input[value='" + rows[i].FeesID + "']").prop("checked", IsSel);
                    }
                    if (rows[i].FeesID == tmpOwnerFeesID) {
                        $("#TableContainer1").datagrid(Cmd, RI);
                        $("input[value='" + rows[i].FeesID + "']").prop("checked", IsSel);
                    }
                }

                getObject("IsTax").value = tmpIsTax;
                //计算费用
                //得到FeesID的列表，并设置相应参数
                GetFeesID();
            }

            function GetFeesID() {
                var strFeesIDs = "";
                var strIsProperty = "";
                var strIsCostType3 = "";
                var SelCount = 0;

                var rows = $('#TableContainer1').datagrid('getChecked');

                var IsCklsBatchReceFees = $("#CklsBatchReceFees").is(':checked');

                //如果是批量收费，则不用检查提交的笔数
                if (IsCklsBatchReceFees == false) {
                    if (rows.length > 90) {
                        HDialog.Info("提示：最多一次可选择90笔费用！");
                        return;
                    }
                }

                for (var i = 0; i < rows.length; i++) {

                    if (strFeesIDs != "") {
                        strFeesIDs = strFeesIDs + "," + rows[i].FeesID;
                    }
                    else {
                        strFeesIDs = rows[i].FeesID;
                    }

                }
                $('#FeesIDs').val(strFeesIDs);
            }



            //编辑的行号
            var editIndex = undefined;
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



            //列表绑定定义
            $("#TableContainer2").datagrid({
                //url: '/HM/M_Main/HC/DataPostControl.aspx',
                //method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column1,
                fitColumns: true,
                singleSelect: false,
                remoteSort: false,
                pagination: false,
                rownumbers: true,
                checkOnSelect: false,
                selectOnCheck: false,
                IsCustomHead: false,
                showFooter: true,
                striped: true,
                width: "100%",
                toolbar: '#toolbar2',
                border: false,
                sortOrder: "asc",

                onClickRow: function (rowIndex, rowData) {
                    //更改当前行号
                    editIndex = rowIndex;

                    $("#TableContainer2").datagrid('acceptChanges', editIndex);
                    //去除编辑器
                    $("#TableContainer2").datagrid('removeEditor', 'PrecAmountE');



                    $("#TableContainer2").datagrid('addEditor', [ //添加DeclareMoney列editor
                        {
                            field: 'PrecAmountE', editor: {
                                type: 'text'
                            }
                        }]);

                    //开始编辑
                    $("#TableContainer2").datagrid('beginEdit', rowIndex);

                    //绑定JS事件
                    var ed = $('#TableContainer2').datagrid('getEditors', rowIndex);
                    for (var i = 0; i < ed.length; i++) {
                        var e = ed[i];
                        if (e.field == "PrecAmountE") {

                            $(e.target).bind("click", function () {

                            }).bind("change", function () {
                                //文本变化事件

                                var val = e.target[0].value;

                                if (parseFloat(val) == "NaN") {
                                    HDialog.Info("请输入正确数字！");
                                    e.target[0].value = sl;
                                    return;
                                }

                                var sl = parseFloat(rowData.PrecAmount) - val;


                                if (sl < 0) {
                                    HDialog.Info("转移金额输入错误！");
                                    e.target[0].value = rowData.PrecAmount;
                                    return;
                                }

                            });
                        }
                    }
                }
            });


            var Rows = JSON.parse($("#SearchResult").val());
            $('#TableContainer1').datagrid('loadData', Rows);


            var Rows2 = JSON.parse($("#SearchResult2").val());
            $('#TableContainer2').datagrid('loadData', Rows2);


            function CheckData() {
                $('#TableContainer2').datagrid('acceptChanges');

                var rows1 = $('#TableContainer1').datagrid('getChecked');
                var rows2 = $('#TableContainer2').datagrid('getChecked');
                if (rows1.length == 0 && rows2.length == 0) {
                    HDialog.Info('请先选择要转移的费用!');
                    return false;
                }
                if (rows2.length > 0) {
                    $('#AllData').val(JSON.stringify(rows2));
                }
                return true;
            }
        </script>
    </form>
</body>
</html>
