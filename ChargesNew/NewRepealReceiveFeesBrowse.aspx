<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRepealReceiveFeesBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewRepealReceiveFeesBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
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
    <script type="text/javascript" src="../jscript/export.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <div class="datagrid-mask" style="height: 100%; width: 100%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <input id="DrReceivePro" name="DrReceivePro" type="hidden" />
        <input id="ReceIDPro" name="ReceIDPro" type="hidden" />
        <input id="IsRestorePro" name="IsRestorePro" type="hidden" />

        <input id="AllData" name="AllData" type="hidden" runat="server" />
        <input id="IsAudit" name="IsAudit" type="hidden" runat="server" />
        <input type="hidden" id="hCkIsDelete" name="hCkIsDelete" />
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">收据类型</td>
                    <td class="TdContent">
                        <select id="DrReceive" runat="server" name="DrReceive">
                            <option value="0" selected>全部</option>
                            <option value="1">收款收据</option>
                            <option value="2">预存收据</option>
                            <option value="3">退款凭据</option>
                            <option value="6">预存退款凭据</option>

                        </select></td>
                    <td class="TdTitle">收据号码</td>
                    <td class="TdContent">
                        <input class="Control_ItemInput" id="BillsSign"
                            size="26" name="BillsSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" data-options="editable:false" searcher="SelCust" runat="server" dd="dd" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" style="width: 82%" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" data-options="editable:false" id="RoomSign" name="RoomSign" searcher="SelRoom" runat="server" data-dd="ddd" />

                        <input type="hidden" name="RoomID" id="RoomID" runat="server" /></td>
                    <td class="TdTitle">是否审核</td>
                    <td class="TdContent">
                        <input id="CkIsDelete" name="CkIsDelete" type="checkbox" style="display: none" />
                        <select id="SelIsAudit" name="SelIsAudit" runat="server"></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否撤销
                    </td>
                    <td class="TdContent">
                        <select id="SelIsCancel" name="SelIsCancel" runat="server"></select>
                    </td>
                    <td class="TdTitle">是否恢复票号
                    </td>
                    <td class="TdContent">
                        <select id="SelIsRestore" name="SelIsRestore" runat="server"></select>
                    </td>
                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                </tr>
            </table>
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="恢复票号" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 300px; height: 100px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">是否恢复票号</td>

                    <td class="TdContentSearch" colspan="3">
                        <select id="IsRestore" name="IsRestore" runat="server">
                            <option selected></option>
                        </select></td>
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


            $(document).ready(function () {
                // 任何需要执行的js特效 
                $("#IsRestore").val("0");
            });
			  
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
            var column = [[

                {
                    field: 'BillsSign', title: '收据号码', width: 130, align: 'left', sortable: true, sortable: true
                    //,formatter: function (value, row, index) {

                    //    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "');\">" + row.BillsSign + "</a>";
                    //    return str;
                    //}
                },
                {
                    field: 'CustName', title: '客户名称', width: 130, align: 'left', sortable: true
                },
                { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
                { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                { field: 'BillsDate', title: '收费日期', width: 180, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '收款金额', width: 180, align: 'left', sortable: true },
                { field: 'ChargeMode', title: '收款方式', width: 120, align: 'left', sortable: true },
                { field: 'UserName', title: '收款人', width: 120, align: 'left', sortable: true },
                { field: 'ReceMemo', title: '票据备注', width: 120, align: 'left', sortable: true },
                { field: 'ReferReason', title: '撤销原因', width: 120, align: 'left', sortable: true },
                { field: 'PrintTimes', title: '打印次数', width: 120, align: 'left', sortable: true },
                { field: 'IsReferName', title: '是否提交撤销', width: 120, align: 'left', sortable: true },
                { field: 'IsRestoreName', title: '是否恢复票号', width: 120, align: 'left', sortable: true },
                { field: 'IsAuditName', title: '是否审核', width: 120, align: 'left', sortable: true },
                { field: 'IsDeleteName', title: '是否撤销', width: 120, align: 'left', sortable: true },
                { field: 'FeesRoleNamesMemo', title: '审核流程', width: 360, align: 'left', sortable: true },
                {
                    field: 'AuditID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var IsAudit = row.IsAuditing;


                        if (IsAudit == 1) {
                            values = "<font color='red'>已通过</font>";

                        }
                        else if (IsAudit == 2) {
                            values = "<font color='Blue'>未通过</font>";

                        }
                        else {
                            values = "<font color='Green'>未审核</font>";

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
                    text: '审核',
                    iconCls: 'icon-add',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));

                        var row = $("#TableContainer").datagrid('getSelected');
                        if (row != null && row != undefined) {

                            var ReceID = row.ReceID;
                            var CommandName = "";
                            var BillsDate = row.BillsDate;


                            HDialog.MessageBox("确认审核", "审核通过", "审核不通过", function () {


                                $('#SearchDlg2').parent().appendTo($("form:first"))
                                $('#SearchDlg2').dialog('open');



                            }, function () {
                                $.tool.DataPostChk('frmForm', 'AuditManage', 'RepealReceiptsAudit', $('#frmForm').serialize() + "&iIsAudit=2&CommandName=cancel&ReceID=" + ReceID + "&BillsDate=" + BillsDate,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data.split('|');

                                         LoadList();
                                        HDialog.Info(r[1]);

                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });

                            });

                        }
                        else {
                            HDialog.Info('请选择要审核的票据');
                        }
                    }
                }

            ];

            var ProgressInterval;
            function WaivAudit() {
                var row = $("#TableContainer").datagrid('getSelected');
                var ReceID = row.ReceID;
                var CommandName = "";
                var BillsDate = row.BillsDate;
                var DrReceive = '';
                if ($('#DrReceive').val() != "0") {
                    DrReceive = $('#DrReceive').val();
                }
                else {
                    DrReceive = row.SourceType;
                }
                var IsRestore = $('#IsRestore').val();
                //$.tool.DataPost('AuditManage', 'RepealReceiptsAudit', "DrReceive=" + DrReceive + "&iIsAudit=1&CommandName=ok&ReceID=" + ReceID + "&BillsDate=" + BillsDate + "&IsRestore=" + IsRestore,
                //    function Init() {
                //    },
                //    function callback(_Data) {
                //        var r = _Data.split('|');

                //        if (r[0] == "true") {
                //            LoadList();
                //        }
                //        HDialog.Info(r[1]);
                //        $('#SearchDlg2').dialog('close');
                //    },
                //    function completeCallback() {
                //    },
                //    function errorCallback() {
                //        $('#SearchDlg2').dialog('close');
                //    });
                if (DrReceive == "3" || DrReceive == "6") {
                    $.tool.DataPost('AuditManage', 'RepealReceiptsAudit', "DrReceive=" + DrReceive + "&iIsAudit=1&CommandName=ok&ReceID=" + ReceID + "&BillsDate=" + BillsDate + "&IsRestore=" + IsRestore,
                        function Init() {
                        },
                        function callback(_Data) {
                            var r = _Data.split('|');
                             
                                LoadList();
                            
                            HDialog.Info(r[1]);
                            $('#SearchDlg2').dialog('close');
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                            $('#SearchDlg2').dialog('close');
                        });
                } else if (DrReceive == "1" || DrReceive == "2") {
                    //启动任务
                    StartTask(DrReceive, ReceID, IsRestore);
                }
            }

            function StartTask(DrReceive, ReceID, IsRestore) {
                //启动一个任务
                var FromIndex = $("#FromIndex").val();

                $.tool.DataPostNoLoading('RepealReceiptsAudit', 'StartTask', "DrReceive=" + DrReceive + "&ReceID=" + ReceID + "&IsRestore=" + IsRestore +'&FromIndex='+FromIndex,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == 'true') {
                            $('#SearchDlg2').dialog('close');
                            //展示进度
                            ShowProgress();
                            //获取执行情况进度
                            ProgressInterval = setInterval("TakeProgress()", 1000);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('RepealReceiptsAudit', 'TakeProgress', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Obj = JSON.parse(_Data);
                        if (_Data == '[]') {
                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {
                                CloseProgress();
                                HDialog.Info(Obj[0].AuditResult);
                            }
                            else {
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }

            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }

            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }

            function ViewDetail(title, OpType, ReceID, type) {
                var Page = "RepealReceiveFeesDetail";
                if (type == '1') {
                }
                else if (type == '2') {
                    Page = "RepealPreCostsDetail";
                }
                var FromIndex = $("#FromIndex").val();
               
                HDialog.Open($(window).width(), $(window).height(), '../ChargesNew/' + Page + '.aspx?ReceID=' + ReceID + '&OpType=' + OpType +'&FromIndex='+FromIndex, title, true, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }



            function LoadList() {
                $('#hCkIsDelete').val('0');

                var DrReceive = $('#DrReceive').val();
                switch (DrReceive) {
                    case "0":

                        column = [[

                            {
                                field: 'SourceType', title: '票据类别', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                                    var sSourceType = '收款收据';
                                    switch (row.SourceType) {
                                        case '1':
                                            sSourceType = '收款收据';
                                            break;
                                        case '2':
                                            sSourceType = '预存收据';
                                            break;
                                        case '3':
                                            sSourceType = '退款凭据';
                                            break;
                                        case '6':
                                            sSourceType = '预存退款凭据';
                                            break;
                                    }
                                    return sSourceType;
                                }
                            },
                            {
                                field: 'BillsSign', title: '票据号码', width: 200, align: 'left', sortable: true, sortable: true
                                , formatter: function (value, row, index) {

                                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "','1');\">" + row.BillsSign + "</a>";

                                    switch (row.SourceType) {
                                        case '1':
                                            str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "','1');\">" + row.BillsSign + "</a>";
                                            break;
                                        case '2':
                                            str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "','2');\">" + row.BillsSign + "</a>";
                                            break;
                                        case '3':
                                            str = row.BillsSign;
                                            break;
                                        case '6':
                                            str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "','2');\">" + row.BillsSign + "</a>";
                                            break;
                                    }
                                    return str;
                                }
                            },
                            {
                                field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true
                            },
                            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
                            { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                            { field: 'BillsDate', title: '票据日期', width: 180, align: 'left', sortable: true },
                            { field: 'PaidAmount', title: '票据金额', width: 180, align: 'left', sortable: true },
                            { field: 'ChargeMode', title: '收款方式', width: 120, align: 'left', sortable: true },
                            { field: 'UserName', title: '收款人', width: 120, align: 'left', sortable: true },
                            { field: 'ReceMemo', title: '票据备注', width: 120, align: 'left', sortable: true },
                            { field: 'ReferReason', title: '撤销原因', width: 120, align: 'left', sortable: true },
                            { field: 'PrintTimes', title: '打印次数', width: 120, align: 'left', sortable: true },
                            { field: 'IsReferName', title: '是否提交撤销', width: 120, align: 'left', sortable: true },
                            { field: 'IsRestoreName', title: '是否恢复票号', width: 120, align: 'left', sortable: true },
                            { field: 'IsAuditName', title: '是否审核', width: 120, align: 'left', sortable: true },
                            { field: 'IsDeleteName', title: '是否撤销', width: 120, align: 'left', sortable: true },
                            { field: 'FeesRoleNamesMemo', title: '审核流程', width: 360, align: 'left', sortable: true },
                            {
                                field: 'AuditID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                    var IsAudit = row.IsAuditing;


                                    if (IsAudit == 1) {
                                        values = "<font color='red'>已通过</font>";

                                    }
                                    else if (IsAudit == 2) {
                                        values = "<font color='Blue'>未通过</font>";

                                    }
                                    else {
                                        values = "<font color='Green'>未审核</font>";

                                    }
                                    return values;
                                }
                            }

                        ]];

                        break;
                    case "1":

                        column = [[

                            {
                                field: 'BillsSign', title: '收据号码', width: 200, align: 'left', sortable: true, sortable: true
                                , formatter: function (value, row, index) {

                                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "','1');\">" + row.BillsSign + "</a>";
                                    return str;
                                }
                            },
                            {
                                field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true
                            },
                            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
                            { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                            { field: 'BillsDate', title: '收费日期', width: 180, align: 'left', sortable: true },
                            { field: 'PaidAmount', title: '收款金额', width: 180, align: 'left', sortable: true },
                            { field: 'ChargeMode', title: '收款方式', width: 120, align: 'left', sortable: true },
                            { field: 'UserName', title: '收款人', width: 120, align: 'left', sortable: true },
                            { field: 'ReceMemo', title: '票据备注', width: 120, align: 'left', sortable: true },
                            { field: 'ReferReason', title: '撤销原因', width: 120, align: 'left', sortable: true },
                            { field: 'PrintTimes', title: '打印次数', width: 120, align: 'left', sortable: true },
                            { field: 'IsReferName', title: '是否提交撤销', width: 120, align: 'left', sortable: true },
                            { field: 'IsRestoreName', title: '是否恢复票号', width: 120, align: 'left', sortable: true },
                            { field: 'IsAuditName', title: '是否审核', width: 120, align: 'left', sortable: true },
                            { field: 'IsDeleteName', title: '是否撤销', width: 120, align: 'left', sortable: true },
                            { field: 'FeesRoleNamesMemo', title: '审核流程', width: 360, align: 'left', sortable: true },
                            {
                                field: 'AuditID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                    var IsAudit = row.IsAuditing;


                                    if (IsAudit == 1) {
                                        values = "<font color='red'>已通过</font>";

                                    }
                                    else if (IsAudit == 2) {
                                        values = "<font color='Blue'>未通过</font>";

                                    }
                                    else {
                                        values = "<font color='Green'>未审核</font>";

                                    }
                                    return values;
                                }
                            }


                        ]];
                        break;

                    case "2":
                        column = [[

                            {
                                field: 'BillsSign', title: '收据号码', width: 200, align: 'left', sortable: true, sortable: true
                                , formatter: function (value, row, index) {

                                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "','2');\">" + row.BillsSign + "</a>";
                                    return str;
                                }
                            },
                            {
                                field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true
                            },
                            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
                            { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                            { field: 'BillsDate', title: '收费日期', width: 180, align: 'left', sortable: true },
                            { field: 'PrecAmount', title: '收款金额', width: 180, align: 'left', sortable: true },
                            { field: 'ChargeMode', title: '收款方式', width: 120, align: 'left', sortable: true },
                            { field: 'UserName', title: '收款人', width: 120, align: 'left', sortable: true },
                            { field: 'ReceMemo', title: '票据备注', width: 120, align: 'left', sortable: true },
                            { field: 'ReferReason', title: '撤销原因', width: 120, align: 'left', sortable: true },
                            { field: 'PrintTimes', title: '打印次数', width: 120, align: 'left', sortable: true },
                            { field: 'IsReferName', title: '是否提交撤销', width: 120, align: 'left', sortable: true },
                            { field: 'IsRestoreName', title: '是否恢复票号', width: 120, align: 'left', sortable: true },
                            { field: 'IsAuditName', title: '是否审核', width: 120, align: 'left', sortable: true },
                            { field: 'IsDeleteName', title: '是否撤销', width: 120, align: 'left', sortable: true },
                            { field: 'FeesRoleNamesMemo', title: '审核流程', width: 360, align: 'left', sortable: true },
                            {
                                field: 'AuditID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                    var IsAudit = row.IsAuditing;


                                    if (IsAudit == 1) {
                                        values = "<font color='red'>已通过</font>";

                                    }
                                    else if (IsAudit == 2) {
                                        values = "<font color='Blue'>未通过</font>";

                                    }
                                    else {
                                        values = "<font color='Green'>未审核</font>";

                                    }
                                    return values;
                                }
                            }

                        ]];
                        break;

                    case "3":
                        column = [[

                            {
                                field: 'BillsSign', title: '退款凭据号码', width: 200, align: 'left', sortable: true, sortable: true

                            },
                            {
                                field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true
                            },
                            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
                            { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                            { field: 'RefundDate', title: '退款日期', width: 180, align: 'left', sortable: true },
                            { field: 'RefundAmount', title: '退款金额', width: 180, align: 'left', sortable: true },
                            { field: 'ChargeMode', title: '收款方式', width: 120, align: 'left', sortable: true },
                            { field: 'UserName', title: '收款人', width: 120, align: 'left', sortable: true },
                            { field: 'Memo', title: '票据备注', width: 120, align: 'left', sortable: true },
                            { field: 'ReferReason', title: '撤销原因', width: 120, align: 'left', sortable: true },
                            { field: 'PrintTimes', title: '打印次数', width: 120, align: 'left', sortable: true },
                            { field: 'IsReferName', title: '是否提交撤销', width: 120, align: 'left', sortable: true },
                            { field: 'IsRestoreName', title: '是否恢复票号', width: 120, align: 'left', sortable: true },
                            { field: 'IsAuditName', title: '是否审核', width: 120, align: 'left', sortable: true },
                            { field: 'IsDeleteName', title: '是否撤销', width: 120, align: 'left', sortable: true },
                            { field: 'FeesRoleNamesMemo', title: '审核流程', width: 360, align: 'left', sortable: true },
                            {
                                field: 'AuditID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                    var IsAudit = row.IsAuditing;


                                    if (IsAudit == 1) {
                                        values = "<font color='red'>已通过</font>";

                                    }
                                    else if (IsAudit == 2) {
                                        values = "<font color='Blue'>未通过</font>";

                                    }
                                    else {
                                        values = "<font color='Green'>未审核</font>";

                                    }
                                    return values;
                                }
                            }

                        ]];
                        break;

                    case "6":

                        column = [[

                            {
                                field: 'BillsSign', title: '退款凭据号码', width: 200, align: 'left', sortable: true, sortable: true
                                , formatter: function (value, row, index) {

                                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('收费明细','Edit','" + row.ReceID + "','2');\">" + row.BillsSign + "</a>";
                                    return str;
                                }
                            },
                            {
                                field: 'CustName', title: '客户名称', width: 150, align: 'left', sortable: true
                            },
                            { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },
                            { field: 'RoomName', title: '房屋名称', width: 150, align: 'left', sortable: true },
                            { field: 'ChequeBill', title: '支/汇票号', width: 100, align: 'left', sortable: true },
                            { field: 'BillsDate', title: '退款日期', width: 180, align: 'left', sortable: true },
                            { field: 'PrecAmount', title: '退款金额', width: 180, align: 'left', sortable: true },
                            { field: 'ChargeMode', title: '收款方式', width: 120, align: 'left', sortable: true },
                            { field: 'UserName', title: '收款人', width: 120, align: 'left', sortable: true },
                            { field: 'ReceMemo', title: '票据备注', width: 120, align: 'left', sortable: true },
                            { field: 'ReferReason', title: '撤销原因', width: 120, align: 'left', sortable: true },
                            { field: 'PrintTimes', title: '打印次数', width: 120, align: 'left', sortable: true },
                            { field: 'IsReferName', title: '是否提交撤销', width: 120, align: 'left', sortable: true },
                            { field: 'IsRestoreName', title: '是否恢复票号', width: 120, align: 'left', sortable: true },
                            { field: 'IsAuditName', title: '是否审核', width: 120, align: 'left', sortable: true },
                            { field: 'IsDeleteName', title: '是否撤销', width: 120, align: 'left', sortable: true },
                            { field: 'FeesRoleNamesMemo', title: '审核流程', width: 360, align: 'left', sortable: true },
                            {
                                field: 'AuditID', title: '审核状态', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                    var IsAudit = row.IsAuditing;


                                    if (IsAudit == 1) {
                                        values = "<font color='red'>已通过</font>";

                                    }
                                    else if (IsAudit == 2) {
                                        values = "<font color='Blue'>未通过</font>";

                                    }
                                    else {
                                        values = "<font color='Green'>未审核</font>";

                                    }
                                    return values;
                                }
                            }

                        ]];
                        break;

                }


                toolbar = [
                    {
                        text: '筛选',
                        iconCls: 'icon-search',
                        handler: function () {
                            $('#SearchDlg').parent().appendTo($("form:first"))
                            $('#SearchDlg').dialog('open');

                        }
                    }, '-',
                    {
                        text: '审核',
                        iconCls: 'icon-add',
                        handler: function () {


                            var row = $("#TableContainer").datagrid('getSelected');
                            if (row != null && row != undefined) {

                                var ReceID = row.ReceID;
                                var CommandName = "";
                                var BillsDate = row.BillsDate;


                                HDialog.MessageBox("确认审核", "审核通过", "审核不通过", function () {


                                    $('#SearchDlg2').parent().appendTo($("form:first"))
                                    $('#SearchDlg2').dialog('open');



                                }, function () {
                                    var DrReceive = '';
                                    if ($('#DrReceive').val() != "0") {
                                        var DrReceive = $('#DrReceive').val();
                                    }
                                    else {
                                        DrReceive = row.SourceType;
                                    }
                                    $.tool.DataPost('AuditManage', 'RepealReceiptsAudit', $('#frmForm').serialize() + "&iIsAudit=2&CommandName=cancel&ReceID=" + ReceID + "&BillsDate=" + BillsDate + "&DrReceive=" + DrReceive,
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var r = _Data.split('|');

                                            if (r[0] == "true") {
                                                LoadList();
                                            }
                                            HDialog.Info(r[1]);

                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });

                                });

                            }
                            else {
                                HDialog.Info('请选择要审核的票据');
                            }
                        }
                    }

                ];

                if ($('#CkIsDelete').is(':checked')) {
                    $('#hCkIsDelete').val('1');
                    toolbar = [
                        {
                            text: '筛选',
                            iconCls: 'icon-search',
                            handler: function () {
                                $('#SearchDlg').parent().appendTo($("form:first"))
                                $('#SearchDlg').dialog('open');

                            }
                        }]

                }





                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
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
                    onBeforeLoad: function (param) {
                        
                        param = $.JQForm.GetParam("AuditManage", "RepealReceiptsList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                        var a = data;
                    },

                });
                $("#SearchDlg").dialog("close");
                $('#SearchDlg2').dialog('close');
            }
            LoadList();

        </script>
    </form>
</body>
</html>
