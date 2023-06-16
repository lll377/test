<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewWaiversFeeAuditBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewWaiversFeeAuditBrowse" %>


<!DOCTYPE html>
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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" />
        <input id="CheckDates" name="CheckDates" type="hidden" runat="server" />
        <input id="AllData" name="AllData" type="hidden" runat="server" />
        <input id="IsAudit" name="IsAudit" type="hidden" runat="server" />
        <input id="HidRoleCodes" name="HidRoleCodes" type="hidden" runat="server" />
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
                        <select id="SelectRoomID" class="easyui-combobox" style="width: 82%" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />

                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContent">
                        <select id="SelAudit" name="SelAudit" runat="server">
                            <option value="" selected>全部</option>
                            <option value="0">未审核</option>
                            <option value="1">已通过</option>
                            <option value="2">未通过</option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCost" data-options="editable:false" id="CostNames"
                            name="CostNames" runat="server" /><%--<INPUT class="button_sel" id="btnSelCost"  onclick="javascript:if(btnSelCost_OnClick()==false) return false;"
										type="button"  name="btnSelCost" runat="server"/>--%><input class="Control_ItemInput" id="CostIDs" style="width: 8px;" type="hidden"
                                            size="1" name="CostIDs" runat="server" /><input class="Control_ItemInput" id="hiCostNames" style="width: 8px; height: 22px" type="hidden"
                                                size="1" name="hiCostNames" runat="server" /></td>
                    <td class="TdTitle">减免业务类型</td>
                    <td class="TdContent">
                        <select id="WaiversCategory" name="WaiversCategory" runat="server" style="width: 82%;">
                            <option value=""></option>
                            <option value="应收调帐">应收调帐</option>
                            <option value="房产代付">房产代付</option>
                            <option value="物业代付">物业代付</option>
                        </select></td>

                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="审核确认" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 300px; height: 100px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">原因</td>

                    <td class="TdContentSearch" colspan="3">
                        <input class="Control_ItemInput" id="AuditReason" name="AuditReason" runat="server"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search2" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="WaivAudit();">确定</a>
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
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCommCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
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

                {
                    field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var param = "WaivID=" + row.WaivID + "";
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"ViewDetail('查看减免费用','SeeDetail','" + param + "');\">" + row.CustName + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true }
            ]];

            var column = [[
                { field: 'RoomName', title: '房屋名称', width: 180, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 120, align: 'left', sortable: true },
                { field: 'MeterName', title: '表计名称', width: 120, align: 'left', sortable: true },
                { field: 'CostNames', title: '费用名称', width: 120, align: 'left', sortable: true },

                { field: 'WaivTypeName', title: '减免方式', width: 100, align: 'left', sortable: true },
                { field: 'WaivMonthAmount', title: '单月减免金额', width: 100, align: 'left', sortable: true },
                { field: 'WaivRates', title: '减免比例', width: 80, align: 'left', sortable: true },
                { field: 'WaivAmount', title: '减免总金额', width: 100, align: 'left', sortable: true },
                { field: 'ShareWaivAmount', title: '均摊减免总金额', width: 100, align: 'left', sortable: true },
                { field: 'WaivModifyAmount', title: '取消减免金额', width: 100, align: 'left', sortable: true },
                {
                    field: 'WaivStateDuring', title: '开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.WaivStateDuring, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'WaivEndDuring', title: '结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.WaivEndDuring, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'SubUserName', title: '提交人', width: 70, align: 'left', sortable: true },
                { field: 'WaivCreDate', title: '提交时间', width: 180, align: 'left', sortable: true },

                { field: 'WaivReason', title: '减免原因', width: 200, align: 'left', sortable: true },
                { field: 'WaivMemo', title: '备注', width: 200, align: 'left', sortable: true },
                { field: 'FeesRoleNamesMemo', title: '审核流程', width: 260, align: 'left', sortable: true },
                {
                    field: 'IsAuditing', title: '审核状态', width: 130, align: 'left', sortable: true,
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
                            HDialog.Info('请选择要审核减免的费用!');
                        }
                        else {

                            $('#AuditReason').val('');


                            HDialog.MessageBox("审核减免费用", "通过审核", "不通过审核", function () {

                                $('#SearchDlg2').parent().appendTo($("form:first"))
                                $('#IsAudit').val('1');
                                $('#SearchDlg2').dialog('open');

                            }, function () {

                                $('#SearchDlg2').parent().appendTo($("form:first"))
                                $('#IsAudit').val('2');
                                $('#SearchDlg2').dialog('open');

                            });

                        }

                    }
                }, '-',
                {
                    text: '取消审核通过',
                    iconCls: 'icon-remove',
                    handler: function () {
                        var IsCheckDates = false;
                        if ($('#AllData').val() == "") {
                            HDialog.Info('请选择要取消审核的费用!');
                        }
                        else {
                            var rows = $('#TableContainer').datagrid('getChecked');
                            var CheckDates = "";
                            $.each(rows, function (key, val) {
                                CheckDates += rows[key]["WaivDate"] + ",";
                                if (!rows[key]["WaivDate"]) {
                                    IsCheckDates = true;
                                    HDialog.Info("包含已关账的数据，不能取消审核！");
                                    return false;
                                }
                            });
                            if (IsCheckDates) {
                                return;
                            } else {
                                CheckDates = CheckDates.substr(0, CheckDates.length - 1);
                            }
                            $('#CheckDates').val(CheckDates);
                            //判断是否已结账 2017年11月8日11:17:24
                            $.tool.DataPostChk('frmForm', 'WriteOff', 'CheckIsWriteOff', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "True") {
                                        HDialog.Info("包含已关账的数据，不能取消审核！");
                                        return;
                                    } else {
                                        $('#AuditReason').val('');
                                        $('#SearchDlg2').parent().appendTo($("form:first"))
                                        $('#IsAudit').val('0');
                                        $('#SearchDlg2').dialog('open');
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });

                        }
                    }
                },
                '-',
                {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = "../ChargesNew/NewWaiversFeeAuditExcel.aspx?";
                    }
                }
            ];

            function WaivAudit() {
                 var rows = $('#TableContainer').datagrid("getChecked");
                //if (rows.length != 1) {
                //    HDialog.Info("请必须选择一条且仅能选择一条进行审核进行审核");
                //    return;
                //}
                
                $.tool.DataPostChk('frmForm', 'AuditManage', 'WaiversFeeAudit', $('#frmForm').serialize() + "&iIsAuditing=" + $('#IsAudit').val() + "&FeesRoleCodes=" + rows[0].WaivRoleCodes + "&WaivID=" + rows[0].WaivID + "&AuditStatus=" + rows[0].IsAudit,
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data.split('|');

                        if (r[0] == "true") {
                            LoadList();
                            $("#AllData").val('');
                        }
                        HDialog.Info(r[1]);

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                $('#SearchDlg2').dialog('close');
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
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("AuditManage", "WaiversFeeAuditList", "TableContainer", param);

                    },
                    onLoadSuccess: function (data) {
                    },

                    onCheck: function (rowIndex, rowData) {
                        var Data = JSON.stringify(rowData);

                        var roles = $("#HidRoleCodes").val();
                        // alert(roles.indexOf(rowData.WaivRoleCodes.substr(0, 6)));
                        if (roles.indexOf(rowData.WaivRoleCodes.substr(0, 6)) < 1 && rowData.IsAudit==0) {
                            $('#TableContainer').datagrid('uncheckRow', rowIndex);
                            HDialog.Info("该行数据不能审核！");
                            return;
                        }


                        //debugger;
                        $("#AllData").val($("#AllData").val() + "," + Data);
                        if ($("#AllData").val().substr(0, 1) == ",")
                            $("#AllData").val($("#AllData").val().substr(1, $("#AllData").val().length - 1));

                        //HDialog.Info($("#AllData").val());
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

                        //HDialog.Info($("#AllData").val());
                    },
                    onCheckAll: function (rows) {

                        var rows = $('#TableContainer').datagrid("getChecked");
                        $.each(rows, function (index, item) {
                            var Data = JSON.stringify(item);
                            var ss = document.getElementById("AllData").value;
                            if (ss.indexOf(Data) < 0) {

                                $("#AllData").val($("#AllData").val() + "," + Data);
                            }
                        });
                        if ($("#AllData").val().substr(0, 1) == ",")
                            $("#AllData").val($("#AllData").val().substr(1, $("#AllData").val().length - 1));

                        //HDialog.Info($("#AllData").val());
                    },
                    onUncheckAll: function (rows) {
                        var ss = document.getElementById("AllData").value;

                        $.each(rows, function (index, item) {
                            var Data = JSON.stringify(item);

                            if (ss.indexOf(Data) > -1) {
                                ss = ss.replace(Data, "");
                            }
                            $("#AllData").val(ss);
                        });
                        if ($("#AllData").val().substr(0, 1) == ",")
                            $("#AllData").val($("#AllData").val().substr(1, $("#AllData").val().length - 1));

                        //HDialog.Info($("#AllData").val());
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

            function ViewDetail(title, OpType, param) {
                var h = $(window).height();
                var w = $(window).width();
                HDialog.Open(w, h + 100, '../ChargesNew/WaiversFeeManageFrame1.aspx?' + param + '&OpType=' + OpType + '&FromIndex=' + $("#FromIndex").val(), title, true, function callback(_Data) {
                    LoadList();
                });
            }
        </script>
    </form>
</body>
</html>
