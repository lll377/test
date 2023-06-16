<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseRoomTransferFees.aspx.cs" Inherits="M_Main.LeaseManage.LeaseRoomTransferFees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同费用转移</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            line-height: 20px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 8%;
            text-align: right;
            /*background: #F8F8F8;*/
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }

        .TdContentSearch .InputRadio {
            cursor: pointer;
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="LeaseRoomTransFee" method="post" runat="server">
        <input id="LeaseRoomID" type="hidden" name="LeaseRoomID" runat="server">
        <input id="CustID" type="hidden" ame="CustID" runat="server">
        <input id="RoomID" type="hidden" name="RoomID" runat="server">
        <input id="MasterID" type="hidden" name="MasterID" runat="server">
        <input id="FeesIDs" type="hidden" name="FeesIDs" runat="server">
        <input id="PrecIDs" type="hidden" name="PrecIDs" runat="server">
        <input id="LimitCount" type="hidden" name="LimitCount" runat="server">
        <input type="hidden" name="NoEdit" runat="server">
        <input id="SearchResult" name="SearchResult" runat="server" type="hidden" />
        <input id="SearchResult2" name="SearchResult2" runat="server" type="hidden" />
        <input id="AllData" name="AllData" runat="server" type="hidden" />
        <table class="SearchTable">
            <tr>
                <td class="TdTitle">租户名称</td>
                <td class="TdContentSearch">
                    <label id="CustName" runat="server" />
                </td>
                <td class="TdTitle">业主名称</td>
                <td class="TdContentSearch">
                    <label id="MasterName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <label id="RoomSign" runat="server" />
                </td>
                <td class="TdTitle">变更时间</td>
                <td class="TdContentSearch">
                    <label id="ChargeTime" runat="server" />
                </td>
            </tr>
        </table>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer1">
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer2">
        </div>
        <table style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 22px; background-color: #f5f5f5; border-top: 1px solid #cccccc;">
            <tr>
                <td align="center">
                    <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="确定转移" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input class="button" id="btnReturn" type="button" onclick="Close()" value="关闭" name="btnReturn" runat="server"></td>
            </tr>
        </table>

        <div id="toolbar">
            <table style="width: 100%;">
                <tr>
                    <td style="padding-left: 5px;"><span class="fa fa-laptop"></span>业主应收费用</td>
                    <td style="text-align: right; padding-right: 40px;">月份筛选：<asp:DropDownList ID="FeesYearMonth" runat="server" AutoPostBack="True"></asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div id="toolbar2">
            <table style="width: 100%;">
                <tr>
                    <td style="padding-left: 5px;"><span class="fa fa-laptop"></span>业主预交余额</td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            function Close() {
                HDialog.Close("");
            }
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
                GetFeesID();
                $('#TableContainer2').datagrid('acceptChanges');
                var rows = $("#TableContainer2").datagrid("getData").rows;
                $('#AllData').val(JSON.stringify(rows));
                return true;
            }
        </script>
    </form>
</body>
</html>
