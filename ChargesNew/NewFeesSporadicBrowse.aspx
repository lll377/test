<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesSporadicBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewFeesSporadicBrowse" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />

    <style>
        body {
            background-color: #F3F3F4;
            margin: 0px;
        }
    </style>
    <script language="javascript" type="text/javascript">

        $.fn.combobox.defaults.filter = function (q, row) {
            var opts = $(this).combobox('options');
            return row[opts.textField].indexOf(q) >= 0;
        }
    </script>
</head>
<body>
    <form id="frmForm" runat="server">


        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <h3>这里是应收管理-应收输入操作介绍<br />
                    点击下一步继续教程</h3>
            </div>

            <div id="walkthrough-2">
                在这里选择查询条件进行筛选
            </div>

            <div id="walkthrough-3">
                点击这里新增费用
            </div>
        </div>
        <input type="hidden" name="CommID" id="CommID" runat="server" />
        <input type="hidden" name="CheckDates" id="CheckDates" runat="server" />
        <input type="hidden" name="IsAddMonth" id="IsAddMonth" runat="server" />
        <input type="hidden" name="CostGeneType" id="CostGeneType" runat="server" />
        <input type="hidden" name="FeesRow" id="FeesRow" runat="server" />
        <input type="hidden" name="OperatorType" id="OperatorType" runat="server" />
        <input type="hidden" name="HChargesMode" id="HChargesMode" runat="server" />
        <input type="hidden" name="FeesDueDate" id="FeesDueDate" runat="server" />
        <input type="hidden" name="IsRecovery" id="IsRecovery" runat="server" />
        <input id="IsOverAcount" style="width: 32px; height: 22px" type="hidden" size="1" name="IsOverAcount"
            runat="server" value="0" />
        <div id='tbb'>

            <table class="DialogTable" width="100%" id="DialogTable">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:false" searcher="SelCust" runat="server" dd="dd" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle">车位编号 </td>
                    <td class="TdContentSearch">
                        <input id="ParkName" class="easyui-searchbox" data-options="editable:false" searcher="SelPark"
                            name="ParkName" runat="server">
                        <input type="hidden" id="HandID" />
                        <%--       <select id="HandID" class="easyui-combobox" data-options="panelHeight: 'auto'" name="HandID" runat="server">
                            <option selected></option>
                        </select>--%>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostName" data-options="editable:false" maxlength="50" name="CostName" searcher="SelCost" runat="server" dd="dd" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                    <td class="TdTitle">楼宇名称</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" />
                        <input id="BuildSNums" name="BuildSNums" type="hidden" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <input type="button" class="button" value="查询" id="btnSearch" name="btnSearch" />
                        &nbsp;&nbsp;
                         <input type="button" class="button" value="新增" id="btnSave" name="btnSave" runat="server" />
                    </td>
                </tr>
            </table>
            <div class="panel-header panel-header-noborder" style="width: 100%">
                <div class="panel-title">未收取的费用</div>
                <div class="panel-tool"></div>
            </div>
            <div class="datagrid-toolbar" id="divtt">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td><a href="javascript:void(0)" onclick=" JavaScript:FeesSplit(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">拆分</span><span class="l-btn-icon icon-cut">&nbsp;</span></span></a></td>
                        <td>
                            <div class="datagrid-btn-separator"></div>
                        </td>
                        <td><a href="javascript:void(0)" onclick="FeesDelete();" class="l-btn l-btn-small l-btn-plain" group="" id="shtg" name="shtg"><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text" id="sshtg" name="sshtg">删除</span><span class="l-btn-icon icon-cancel">&nbsp;</span></span></a></td>
                        <td>
                            <div class="datagrid-btn-separator"></div>
                        </td>

                    </tr>
                </table>
            </div>

        </div>


        <div style="width: 100%; background-color: #cccccc" id="TableContainer">
        </div>

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function SelBuild() {

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


            //指定列求和
            function compute(colName) {
                var rows = $('#TableContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
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
                        $("#HandID").val(obj.ParkID);

                        $('#CustName').searchbox("setValue", obj.CustName);
                        $('#CustID').val(obj.CustID);
                        $('#RoomSign').searchbox("setValue", obj.RoomSign);
                        $('#RoomID').val(obj.RoomID);
                        //console.log(_Data);
                        //var varObjects = _Data.split("|");

                        //var data = _Data.split('|');
                        //if (data.length > 0) {
                        //    var ParkIDs = "";
                        //    var ParkNames = "";

                        //    for (var i = 0; i < data.length; i++) {
                        //        if (data[i] != "") {
                        //            var obj = JSON.parse(data[i]);
                        //            if (obj.ParkID != 0) {
                        //                ParkIDs = ParkIDs + "," + obj.ParkID;
                        //                ParkNames = ParkNames + ',' + obj.ParkName;
                        //            }
                        //        }
                        //    }

                        //    $('#ParkIDs').val(ParkIDs.substring(1, ParkIDs.length));
                        //    $('#ParkNames').searchbox('setValue', ParkNames.substring(1, ParkNames.length));
                        //}
                    }
                });

            }

            function SelCost() {
                var varReturn;

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");

                        $('#CostID').val(varObjects[0]);
                        $('#CostName').searchbox('setValue', varObjects[1]);


                        return true;
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
                //$('#HandID').combobox({ data: [], valueField: 'HandID', textField: 'HandText' });


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

                                ////2017-4-21 15:27:26 增加自动带出车位编号
                                //$.tool.DataGet('Parking', 'search', 'CustID=' + data.CustID + '&page=1&rows=100',
                                //    function Init() {
                                //    },
                                //    function callback(_Data) {
                                //        var Parking = $.parseJSON(_Data); //转换为json对象 HandID
                                //        var ParkingList = new Array();
                                //        var IsExist = true;
                                //        if (Parking.rows.length > 0) {
                                //            for (var i = 0; i < Parking.rows.length; i++) {
                                //                IsExist = true;
                                //                if (ParkingList.length > 0) {
                                //                    for (var j = 0; j < ParkingList.length; j++) {
                                //                        if (ParkingList[j].ParkID == Parking.rows[i].ParkID) {
                                //                            IsExist = false;
                                //                            break;
                                //                        }
                                //                    }
                                //                }
                                //                if (IsExist) {
                                //                    ParkingList.push({ "ParkID": Parking.rows[i].ParkID, "ParkName": Parking.rows[i].ParkName });
                                //                }
                                //            }
                                //        }
                                //        $("#HandID").combobox({
                                //            data: ParkingList,
                                //            valueField: 'ParkID',
                                //            textField: 'ParkName'
                                //        });
                                //    },
                                //    function completeCallback() {
                                //    },
                                //    function errorCallback() {
                                //    });
                                //////
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
                    text: '拆分',
                    iconCls: 'icon-cut',
                    handler: function () {

                        //DelRecord(row.RoomID)
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {

                        //DelRecord(row.RoomID)
                    }
                }
            ];


            function FeesSplit() {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {
                    if (row.FeesID != 0) {
                        var IsOperator;
                        IsOperator = FeesIsOperator(row);

                        var IsSplit = IsOperator.split('|')[2];
                        if (IsSplit.split(':')[0] == "true") {
                            FeesOperator(row, "split");
                        }
                        else {
                            HDialog.Info(IsSplit.split(':')[1]);
                        }
                    }
                    else {
                        HDialog.Info('请选择要拆分的费用');
                    }
                } else {
                    HDialog.Info('请选择要拆分的费用');
                }
            }

            //判断是否已结账 2017-11-8 16:44:58
            function CheckIsOverAcount(rowData, type) {
                var CheckDates = rowData["FeesDueDate"];
                var CostCode = rowData["CostCode"].substring(0, 4);
                var CostName = rowData["CostName"];
                if (!CheckDates) {
                    HDialog.Info("已关账，不能删除，若需要删除，请到冲销节点操作!!!");
                    return;
                }
                $('#CheckDates').val(CheckDates);
                $('#FeesDueDate').val(CheckDates);
                if (CostName.indexOf('物业服务费') > -1) {
                    $('#IsAddMonth').val("1");
                } else {
                    $('#IsAddMonth').val("0");
                }

                $.tool.DataPostChk('frmForm', 'WriteOff', 'GetOverAccountsSetInfoByCommID', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "") {

                            $("#IsOverAcount").val("1"); //没有设置关账信息

                            $.tool.DataPostChk('frmForm', 'WriteOff', 'NoAccountsCheckDate', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "1") {

                                        HDialog.Info("不能操作往月费用！");
                                    } else {
                                        FeesOperator(rowData, "delete");
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });


                        } else {

                            //已设置关账信息
                            $.tool.DataPostChk('frmForm', 'WriteOff', 'CheckIsWriteOff', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "True") {
                                        HDialog.Info("已关账，不能删除，若需要删除，请到冲销节点操作!!!");
                                        return;
                                    } else {
                                        FeesOperator(rowData, "delete");
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }





            function FeesDelete()
            {

                var row = $("#TableContainer").datagrid("getSelected");
                if (row != null) {
                    if (row.FeesID != 0) {
                        
                        var IsOperator;
                        IsOperator = FeesIsOperator(row);

                        var IsDel = IsOperator.split('|')[1];
                        if (IsDel.split(':')[0] == "true") {
                            HDialog.MessageBox("费开始时间是否退回生成该笔费用之前", "是", "否", function () {
                                $("#IsRecovery").val(1);
                                CheckIsOverAcount(row, "delete");
                            }, function () {
                                $("#IsRecovery").val(0);
                                 CheckIsOverAcount(row, "delete");
                            });
                        }
                        else
                        {
                            HDialog.Info(IsDel.split(':')[1]);
                        }
                    }
                    else {
                        HDialog.Info('请选择要删除的费用');
                    }
                } else {
                    HDialog.Info('请选择要删除的费用');
                }
            }

            var frozenColumns = [[
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
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
                { field: 'IsBankName', title: '托收状态', width: '50', align: 'center', sortable: true },
                { field: 'IsFreezeName', title: '冻结状态', width: '50', align: 'center', sortable: true },
                { field: 'IsPropertyName', title: '垫付状态', width: '50', align: 'center', sortable: true },
                { field: 'IsPrecName', title: '预交状态', width: '50', align: 'center', sortable: true }


            ]];

            function InitTableHeight() {
                var h = $(window).height();
                h = h - 173;
                $("#TableContainer").css("height", h + 'px');

                //$('#HandID').combobox({
                //    width: 148
                //});


                $('#SelectRoomID').combobox({
                    width: 148
                });



            }
            InitTableHeight();

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



            function LoadFeesList() {
                var CustID = $('#CustID').val();
                var RoomID = $('#RoomID').val();
                var CostID = $('#CostID').val();
                var HandID = $("#HandID").val();
                var BuildSNums = $("#BuildSNums").val();
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Fees&Command=feessearch&CustID=' + CustID + '&RoomID=' + RoomID + '&CostID=' + CostID + '&ParkID=' + HandID + '&BuildSNums=' + BuildSNums,
                    method: "Get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    toolbar: toolbar,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    rownumbers: true,
                    border: false,
                    width: "100%",
                    showFooter: true,
                    toolbar: '#tb',
                    view: myview,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {

                        var IsOperator;
                        IsOperator = FeesIsOperator(rowData);

                        var IsUpdate = IsOperator.split('|')[0];
                        if (IsUpdate.split(':')[0] == "true") {

                            FeesOperator(rowData, "update");

                        }
                        else {
                            HDialog.Info(IsUpdate.split(':')[1]);
                        }
                    },
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }

                    },
                    onLoadSuccess: function (data) {
                        //加载页脚
                        $('#TableContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                RoomSign: "<span style='color:red'>合计</span>",
                                DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                                PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>",
                                WaivAmount: "<span style='color:red'>" + compute("WaivAmount") + "</span>",
                                DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>",
                                LateFeeAmount: "<span style='color:red'>" + compute("LateFeeAmount") + "</span>"

                            }
                        ]);
                    }
                });

            }

            function FeesIsOperator(row) {

                var IsSplit = "false:false";
                var IsDel = "false:false";
                var IsUpdate = "false:false";

                var iCostGeneType = parseInt($('#CostGeneType').val());
                var strSysCostSign = row.SysCostSign;
                var strDueAmount = row.DueAmount;
                var strDebtsAmount = row.DebtsAmount;
                var strAccountFlag = row.AccountFlag;
                var strCostName = row.CostName;

                var strIsBank = row.IsBank;
                var strIsFreeze = row.IsFreeze;
                var strIsProperty = row.IsProperty;
                var strIsPrec = row.IsPrec;
                var strMeterSign = row.MeterSign;



                var iIncidentID = ToDecimal(row.IncidentID, 0);
                var iLeaseContID = ToDecimal(row.LeaseContID, 0);
                var iContID = ToDecimal(row.ContID, 0);


                if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                    && ((iCostGeneType != 0 && ToDecimal(strAccountFlag, 0) == 100)
                        || (iCostGeneType == 0)
                    )
                    && (ToDecimal(strIsBank, 0) == 0)
                    && (ToDecimal(strIsFreeze, 0) == 0)
                    && (ToDecimal(strIsProperty, 0) == 0)
                    && (ToDecimal(strIsPrec, 0) == 0)
                ) {

                    if (strMeterSign == "") {
                        IsUpdate = "true:true"
                        IsDel = "true:true";
                        IsSplit = "true:true";
                    }
                    else {
                        IsUpdate = "false:抄表类费用不允许修改";
                        //    IsDel = "false:抄表类费用不允许删除";
                        IsDel = "true:true";
                        IsSplit = "false:抄表类费用不允许拆分";
                    }



                }
                else {
                    if ((ToDecimal(strDueAmount, 2) != ToDecimal(strDebtsAmount, 2))) {
                        IsUpdate = "false:应收金额不等于欠收金额不允许修改";
                        IsDel = "false:应收金额不等于欠收金额不允许删除";
                        IsSplit = "false:应收金额不等于欠收金额不允许拆分";
                    }
                    if ((iCostGeneType != 0 && ToDecimal(strAccountFlag, 0) == 0)) {
                        IsUpdate = "false:入账费用在应收输入模块中不允许修改";
                        IsDel = "false:入账费用在应收输入模块中不允许删除";

                    }
                    if (ToDecimal(strIsBank, 0) != 0) {
                        IsUpdate = "false:费用已托收不允许修改";
                        IsDel = "false:费用已托收不允许删除";
                        IsSplit = "false:费用已托收不允许拆分";
                    }
                    if (ToDecimal(strIsFreeze, 0) != 0) {
                        IsUpdate = "false:费用已冻结不允许修改";
                        IsDel = "false:费用已冻结不允许删除";
                        IsSplit = "false:费用已冻结不允许拆分";
                    }
                    if (ToDecimal(strIsProperty, 0) != 0) {
                        IsUpdate = "false:费用已垫付不允许修改";
                        IsDel = "false:费用已垫付不允许删除";
                        IsSplit = "false:费用已垫付不允许拆分";
                    }
                    if (ToDecimal(strIsPrec, 0) != 0) {
                        IsUpdate = "false:费用已预收不允许修改";
                        IsDel = "false:费用已预收不允许删除";
                        IsSplit = "false:费用已预收不允许拆分";
                    }
                }

                if ((ToDecimal(strDueAmount, 2) == ToDecimal(strDebtsAmount, 2))
                    && (ToDecimal(strIsBank, 0) == 0)
                    && (ToDecimal(strIsFreeze, 0) == 0)
                    && (ToDecimal(strIsProperty, 0) == 0)
                    && (ToDecimal(strIsPrec, 0) == 0)
                    && (strMeterSign == "")
                ) {
                    IsSplit = "true:true";
                }
                else {



                    if (ToDecimal(strIsBank, 0) != 0) {
                        IsUpdate = "false:费用已托收不允许修改";
                        IsDel = "false:费用已托收不允许删除";
                        IsSplit = "false:费用已托收不允许拆分";
                    }
                    if (ToDecimal(strIsFreeze, 0) != 0) {
                        IsUpdate = "false:费用已冻结不允许修改";
                        IsDel = "false:费用已冻结不允许删除";
                        IsSplit = "false:费用已冻结不允许拆分";
                    }
                    if (ToDecimal(strIsProperty, 0) != 0) {
                        IsUpdate = "false:费用已垫付不允许修改";
                        IsDel = "false:费用已垫付不允许删除";
                        IsSplit = "false:费用已垫付不允许拆分";
                    }
                    if (ToDecimal(strIsPrec, 0) != 0) {
                        IsUpdate = "false:费用已预收不允许修改";
                        IsDel = "false:费用已预收不允许删除";
                        IsSplit = "false:费用已预收不允许拆分";
                    }
                }

                if (strSysCostSign == "B0005" && strCostName != "补交") {

                    IsUpdate = "false:产权税费不允许修改";
                    IsDel = "false:产权税费不允许删除";
                    IsSplit = "false:产权税费不允许拆分";
                }
                if ((iIncidentID > 0 || iLeaseContID > 0 || iContID > 0) && (iCostGeneType != 0)) {
                    if (iIncidentID > 0) {
                        IsUpdate = "false:特约服务类费用不允许修改";
                        IsDel = "false:特约服务类费用不允许删除";
                        IsSplit = "false:特约服务类费用不允许拆分";
                    }
                    else {
                        IsUpdate = "false:合同费用不允许修改";
                        IsDel = "false:合同费用不允许删除";
                        IsSplit = "false:合同费用不允许拆分";
                    }
                }
                //0 修改，1删除，2修改
                return IsUpdate + "|" + IsDel + "|" + IsSplit;
            }
            function FeesOperator(rowData, type)
            {
                var FeesRow = JSON.stringify(rowData);

                $('#FeesRow').val(FeesRow);
                $('#OperatorType').val(type);

                //保存到隐藏文本框;
                $.tool.DataPostNoLoading('Fees', "feescheck", $('#frmForm').serialize(),
                    function Init() {

                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            var cotent = "";
                            var Title = "";
                            var width = 900;
                            var height = 450;
                            switch (type) {

                                //case "update":
                                //    Title = "修改费用";
                                //    conent = "../ChargesNew/FeesSporadicManage.aspx?OPType=Edit&FeesID=" + rowData.FeesID + "&CostGeneType=" + $('#CostGeneType').val();
                                //    break;
                                case "delete":
                                    Title = "删除费用";
                                    width = 600;
                                    height = 250;
                                    conent = "../DialogNew/FeesAmendDelDlg.aspx?FeesID=" + rowData.FeesID + "&IsOverAcount=" + $("#IsOverAcount").val() + "&FeesDueDate=" + rowData.FeeDueYearMonth + "&CommIDs=" + $("#CommID").val() + "&IsRecovery=" + $("#IsRecovery").val();
                                    break;
                                case "split":
                                    Title = "拆分费用";
                                    conent = "../ChargesNew/FeesSplitManage.aspx?OPType=Edit&FeesID=" + rowData.FeesID + "&CostGeneType=" + $('#CostGeneType').val();
                                    break;

                            }
                            HDialog.Open(width, height, conent, Title, false, function callback(_Data) {
                                if (_Data != "") {
                                    HDialog.Info(_Data);
                                    LoadFeesList();
                                }
                            });
                        }
                        else {
                            HDialog.Info(_Data);
                        }
                    },
                    function completeCallback() {

                    },
                    function errorCallback() {

                    });
            }


            LoadFeesList();


            $("#btnSearch").click(function () {

                LoadFeesList();
            });
            $("#btnSave").click(function () {
                btn_add("0");
            });

            function btn_add(types) {
                var CustName = $('#CustName').searchbox("getValue");
                var RoomSign = $('#RoomSign').searchbox("getValue");
                var CustID = $('#CustID').val();
                var RoomID = $('#RoomID').val();
                var CostGeneType = $('#CostGeneType').val();
              
                var w =950 ;
                var h = 400;

                var conent = null;
                if (types == "0") {
                    conent = "../ChargesNew/FeesSporadicManage.aspx?CostGeneType=" + CostGeneType + "&CustID=" + CustID + "&CustName=" + CustName + "&RoomSign=" + RoomSign + "&RoomID=" + RoomID;
                }
                else {
                    conent = "../ChargesNew/FeesSporadicManage.aspx?CostGeneType=" + CostGeneType + "&CustID=" + CustID + "&CustName=" + CustName + "&RoomSign=" + RoomSign + "&RoomID=" + RoomID + "&ShowType=1";
                }

                HDialog.Open(w, h, conent, '新增费用', false, function callback(_Data) {
                    if (types == "0") {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                            LoadFeesList();
                        }
                    }
                    else {
                        $('body').pagewalkthrough('close');
                    }
                });
            }


            function GetShow() {
                $('body').pagewalkthrough({
                    name: 'introduction',
                    steps: [{
                        popup: {
                            content: '#walkthrough-1',
                            type: 'modal'
                        }
                    }, {
                        wrapper: '#DialogTable',
                        popup: {
                            content: '#walkthrough-2',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#btnSave',
                        popup: {
                            content: '#walkthrough-3',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function () {
                            btn_add("1");
                        }
                    }
                    ],
                    buttons: {
                        jpwNext: {
                            i18n: "下一步 &rarr;"
                        },
                        jpwFinish: {
                            i18n: "下一步 &rarr;"
                        },
                        jpwPrevious: {
                            i18n: "&larr; 上一步"
                        },
                        jpwClose: {
                            i18n: "关闭",
                        }
                    }
                });
                $('body').pagewalkthrough('show');
            };
        </script>
    </form>
</body>
</html>
