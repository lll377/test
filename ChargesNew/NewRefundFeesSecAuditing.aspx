<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRefundFeesSecAuditing.aspx.cs" Inherits="M_Main.ChargesNew.NewRefundFeesSecAuditing" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>

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
</head>
<body>
    <form id="frmForm" runat="server">

        <input id="AllData" name="AllData" type="hidden" runat="server" />
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">


            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:false" searcher="SelCust" runat="server" dd="dd" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 82%;" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />

                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCost" id="CostNames" data-options="editable:false"
                            name="CostNames" runat="server" /><%--<INPUT class="button_sel" id="btnSelCost"  onclick="javascript:if(btnSelCost_OnClick()==false) return false;"
										type="button"  name="btnSelCost" runat="server"/>--%><input class="Control_ItemInput" id="CostIDs" style="width: 8px;" type="hidden"
                                            size="1" name="CostIDs" runat="server" /><input class="Control_ItemInput" id="hiCostNames" style="width: 8px; height: 22px" type="hidden"
                                                size="1" name="hiCostNames" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">提交时间从</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EditBeginDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" type="text" name="EditBeginDate"
                            runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EditEndDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" type="text" name="EditEndDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">退款类型</td>
                    <td class="TdContent">
                        <select id="BusinessType" name="BusinessType" runat="server">
                            <option value="0" selected>全部</option>
                            <option value="1">实收</option>
                            <option value="2">预收</option>
                            <option value="3">冲抵</option>
                            <option value="4">预存</option>
                        </select></td>
                    <td class="TdTitle">是否审核</td>
                    <td class="TdContent">
                        <asp:DropDownList ID="IsAudit" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">未审核</asp:ListItem>
                            <asp:ListItem Value="1">已审核</asp:ListItem>
                            <asp:ListItem Value="2">审核未通过 </asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }

       
            function InitFrom() {
                var com = getQueryVariable("FromIndex");
                if (com != "") {
                    $("#FromIndex").val(com);
                }
            }
            InitFrom();

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();


            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = $(window).width();
                var h = $(window).height();

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
                                $('#SelectRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {


                                        var data = $('#SelectRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    $('#RoomID').val(data[i].RoomID.split('|')[0]);
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#CalcArea').val(buildArea);

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
            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);




                    }

                });

            }


            var frozenColumns = [[
                { field: 'ck', checkbox: true },
                //    {
                //        field: 'IsMayAudit', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                //            var values = "";

                //            var IsAudit = row.IsAudit;

                //            //已审核数
                //            var iHasAuditCount = row.HasAuditCount;
                //            //需审核总数
                //            var iHasCount = row.HasCount;

                //            //需审核岗位 000012,0|000017,0
                //            var RefundRoleCodes = row.RefundRoleCodes;

                //            var RefundRoleNames = row.RefundRoleNames;

                //            //操作员岗位LoginRoles 如"'000031','000133','000047','000017'"
                //            var IsMayAudit = row.IsMayAudit

                //            var strAuditName = row.strAuditName;

                //            var strTmp = row.strTmp;

                //            if (IsAudit == "1") {
                //                values = "<font color='Red'>已通过</font>";

                //            }
                //            else if (IsAudit == 2) {
                //                values = "<font color='Blue'>未通过</font>";

                //            }
                //            else {
                //                values = "<font color='Green'>未审核" + strTmp + "</font>";


                //            }

                //            return values;
                //        }
                //    },
                //{ field: 'RefundRoleNames', title: '未审岗位', width: 120, align: 'left', sortable: true },
                //{
                //    field: 'IID', title: '退款状态', width: 70, align: 'left', sortable: true, formatter: function (value, row, index) {

                //        var values = "";
                //        var IsRefund = row.IsRefund;
                //        if (IsRefund == "1") {

                //            values = "<font color='Blue'>已退款</font>";
                //        }
                //        return values;
                //    }
                //},
                { field: 'BusinessTypeName', title: '退款类型', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true }
            ]];

            var column = [[

                { field: 'RoomName', title: '房屋名称', width: 120, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 120, align: 'left', sortable: true },
                { field: 'SubUserName', title: '提交人', width: 70, align: 'left', sortable: true },
                { field: 'SubDatatime', title: '提交时间', width: 180, align: 'left', sortable: true },
                { field: 'CanRefundAmount', title: '提交本金', width: 100, align: 'left', sortable: true },
                { field: 'CanRefundPrecAmount', title: '提交冲抵金额', width: 100, align: 'left', sortable: true },
                { field: 'CanRefundLateFeeAmount', title: '提交合同违约金', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeesDueDate', title: '费用时间', width: 180, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'ChargeDate', title: '收款时间', width: 180, align: 'left', sortable: true },
                { field: 'BillsSign', title: '收据号码', width: 180, align: 'left', sortable: true },
                { field: 'ChargeUserName', title: '收款人', width: 100, align: 'left', sortable: true },
                { field: 'ChargeAmount', title: '收款金额', width: 100, align: 'left', sortable: true },
                { field: 'PrecAmount', title: '冲抵金额', width: 100, align: 'left', sortable: true },
                { field: 'LateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'RefundMemo', title: '备注', width: 180, align: 'left', sortable: true },
                { field: 'FeesRoleNamesMemo', title: '审核流程', width: 120, align: 'left', sortable: true },
                {
                    field: 'IsAudit', title: '审核状态', width: 130, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var values = "";
                        var IsAudit = row.IsAudit;

                        if (IsAudit == 1) {
                            values = "<font color='Green'>已通过</font>";
                        }
                        else if (IsAudit == 2) {
                            values = "<font color='red'>未通过</font>";
                        }
                        else {
                            values = "<font color='Blue'>未审核</font>";
                        }
                        return values;
                    }
                }

            ]];

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
                    text: '确认审核',
                    iconCls: 'icon-add',
                    handler: function () {

                        if ($('#AllData').val() == "") {
                            HDialog.Info('请选择要审核退款的费用!');
                        }
                        else {

                            HDialog.MessageBox("确认审核", "审核通过", "审核不通过", function () {
                                $.tool.DataPostChk('frmForm', 'AuditManage', 'RefundMultiAudit', $('#frmForm').serialize() + "&iIsAudit=1",
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data.split('|');

                                        if (r[0] == "true") {
                                            LoadList();
                                        }
                                        if (r.length > 1) {
                                            HDialog.Info(r[1]);
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });

                            }, function () {
                                $.tool.DataPostChk('frmForm', 'AuditManage', 'RefundMultiAudit', $('#frmForm').serialize() + "&iIsAudit=2",
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data.split('|');

                                        if (r[0] == "true") {
                                            LoadList();
                                        }
                                        if (r.length > 1) {
                                            HDialog.Info(r[1]);
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });

                            });



                        }

                    }
                }
            ];



            function IsChecked(row) {
                //参数为你要判断的行
                var allRows = $("#TableContainer").datagrid('getChecked');
                //获取所有被选中的行
                $.each(allRows, function (i, n) {
                    if (row.id == n.id) {    //id为一个列的属性，任意列都可以
                        $(this).addClass("datagrid-row-checked");
                    }
                })
            }

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
                    singleSelect: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    //selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("AuditManage", "RefundMultiAuditList", "TableContainer", param);


                    },
                    onLoadSuccess: function (data) {

                        if (data.rows.length > 0) {
                            for (var i = 0; i < data.rows.length; i++) {
                                if (data.rows[i].IsRefund == "1") {
                                    $("input[type='checkbox']")[i + 1].disabled = true;

                                }

                                if (data.rows[i].IsMayAudit != "True") {
                                    $("input[type='checkbox']")[i + 1].disabled = true;

                                }
                            }
                        }
                    },

                    onCheck: function (rowIndex, rowData) {

                        var Data = JSON.stringify(rowData);
                        $("#AllData").val($("#AllData").val() + "," + Data);
                        if ($("#AllData").val().substr(0, 1) == ",")
                            $("#AllData").val($("#AllData").val().substr(1, $("#AllData").val().length - 1));
                    },

                    onUncheck: function (rowIndex, rowData) {

                        var ss = document.getElementById("AllData").value;
                        var Data = JSON.stringify(rowData);
                        if (ss.indexOf(Data) > -1) {
                            ss = ss.replace(Data, "");

                        }
                        $("#AllData").val(ss);
                        if ($("#AllData").val().substr(0, 1) == ",")
                            $("#AllData").val($("#AllData").val().substr(1, $("#AllData").val().length - 1));
                    },
                    onCheckAll: function (rows) {

                        $("input[type='checkbox']").each(function (index, el) {
                            var Data = JSON.stringify(rows[index]);
                            if (el.disabled) {
                                $(el).removeAttr("checked");
                            }
                        });

                        var rows = $('#TableContainer').datagrid("getChecked");
                        $.each(rows, function (index, item) {
                            if (item.IsRefund != "1") {
                                var Data = JSON.stringify(item);
                                var ss = document.getElementById("AllData").value;
                                if (ss.indexOf(Data) < 0) {

                                    $("#AllData").val($("#AllData").val() + "," + Data);
                                }
                            }
                        });
                        if ($("#AllData").val().substr(0, 1) == ",")
                            $("#AllData").val($("#AllData").val().substr(1, $("#AllData").val().length - 1));
                    },
                    onUncheckAll: function (rows) {
                        var ss = document.getElementById("AllCheck").value;

                        $.each(rows, function (index, item) {
                            var Data = JSON.stringify(item);

                            if (ss.indexOf(Data) > -1) {
                                ss = ss.replace(Data, "");
                            }
                            $("#AllData").val(ss);
                        });
                        if ($("#AllData").val().substr(0, 1) == ",")
                            $("#AllData").val($("#AllData").val().substr(1, $("#AllData").val().length - 1));


                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();


        </script>
    </form>
</body>
</html>
