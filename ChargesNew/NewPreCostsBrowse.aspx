<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPreCostsBrowse.aspx.cs" Inherits="M_Main.ChargesNew.NewPreCostsBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

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

    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .tabs-container .tabs-left .panel-body {
            margin-left: 0px;
        }

        .panel-body2 {
            margin-left: 20%;
            width: 80%;
        }
    </style>

</head>
<body>
    <form id="frmForm">
        <input id="hiSearchSql" type="hidden" size="1" name="hiSearchSql" runat="server">
        <input id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server" />

        <input id="selTabID" type="hidden" name="selTabID" />

        <div class="datagrid-toolbar" id="divtt">
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" style="width: 89%;" searcher="SelCust" name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false" />
                        <input id="CustID" type="hidden" size="1" name="CustID" runat="server" />
                        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server" />
                    </td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 89%;" class="easyui-combobox" data-options="editable:false,panelHeight: '200'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" style="width: 89%;" searcher="SelRoom"
                            name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" />
                        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
                        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />
                    </td>
                    <td><a href="javascript:void(0)" onclick="LoadData(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                        <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                        <a href="javascript:void(0)" onclick="Clear(); " class="l-btn l-btn-small l-btn-plain" group="" id="">
                            <span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">清空</span><span class="l-btn-icon icon-filter">&nbsp;</span></span></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                           <span style="color: red;">*请通过"前台收费"模块预存费用。</span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="tabs-container">
            <div class="tabs-left" id="DivLeft" style="margin: 0px;">
                <ul class="nav nav-tabs">
                    <li class="active" refsel="1" name="ssmx" refid="Tab1" refpage="NewReceiveFeesHisBrowse" reftype="已预交登记的费用">
                        <a data-toggle="tab" href="#tab-1"><i class="fa fa-cogs "></i>已预交登记的费用</a>
                    </li>
                    <li class="" refsel="0" refid="Tab2" name="ysmx" refpage="NewHaveFeesEnquiries" reftype="已预交冲抵的费用">
                        <a data-toggle="tab" href="#tab-2"><i class="fa fa-cogs "></i>已预交冲抵的费用</a>
                    </li>
                    <li class="" refsel="0" refid="Tab3" name="ltmx" refpage="NewReceiveAdvanceFeesHisBrowse" reftype="已预交费用的余额">
                        <a data-toggle="tab" href="#tab-3"><i class="fa fa-cogs "></i>已预交费用的余额</a>
                    </li>


                </ul>
                <div class="tab-content ">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer1" style="margin-left: 0px">1</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer2">2</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body2" style="padding: 0px; position: absolute;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer3">3</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 624px; height: 150px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdTitle" colspan="5"></td>
                </tr>
                <tr>
                    <td class="TdTitle" colspan="5"></td>
                </tr>
                <tr>
                    <td colspan="5" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick=" JavaScript:LoadData(); ">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    $(function () {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        InitTableHeight();
        LoadFees1();
    })
    function InitTableHeight() {
        var h = $(window).height();
        $(".Frm").css({ "height": h + "px" });
        //$(".datagrid-wrap panel-body panel-body-noheader panel-body-noborder").css({ "margin": "0px" });
        $("[class='datagrid-wrap panel-body panel-body-noheader panel-body-noborde']").css({ "margin": "0px" });
        var h1 = $('#divtt').height();
        h = h - h1 - 4;


        $("#TableContainer1").css("height", h + "px");
        $("#TableContainer2").css("height", h + "px");
        $("#TableContainer3").css("height", h + "px");

        $('#selTabID').val(1);
    }


    $(".tabs-container li").click(function () {

        $('#tab-1').attr("class", "tab-pane");
        $('#tab-2').attr("class", "tab-pane");
        $('#tab-3').attr("class", "tab-pane");

        $('#ssmx').attr("refsel", "0");
        $('#ysmx').attr("refsel", "0");
        $('#ltmx').attr("refsel", "0");

        $('#ssmx').attr("class", "");
        $('#ysmx').attr("class", "");
        $('#ltmx').attr("class", "");

        switch ($(this).attr("name")) {

            case "ssmx":
                $('#selTabID').val(1);
                $('#tab-1').attr("class", "tab-pane active");
                $('#ssmx').attr("refsel", "1");
                $('#ssmx').attr("class", "active");
                LoadFees1();
                break;
            case "ysmx":
                $('#selTabID').val(2);
                $('#tab-2').attr("class", "tab-pane active");
                $('#ysmx').attr("refsel", "1");
                $('#ysmx').attr("class", "active");
                LoadFees2();
                break;
            case "ltmx":
                $('#selTabID').val(3);
                $('#tab-3').attr("class", "tab-pane active");
                $('#ltmx').attr("refsel", "1");
                $('#ltmx').attr("class", "active");
                LoadFees3();
                break;


        }

    });

    //指定列求和
    function compute1(colName) {
        var rows = $('#TableContainer1').datagrid('getRows');
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total += parseFloat(rows[i][colName]);
        }
        return ToDecimal(total, 2);
    }
    function compute2(colName) {
        var rows = $('#TableContainer2').datagrid('getRows');
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total += parseFloat(rows[i][colName]);
        }
        return ToDecimal(total, 2);
    }
    function compute3(colName) {
        var rows = $('#TableContainer3').datagrid('getRows');
        var total = 0;
        for (var i = 0; i < rows.length; i++) {
            total += parseFloat(rows[i][colName]);
        }
        return ToDecimal(total, 2);
    }

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


            $('#SelectRoomID').combobox({
                data: '',
                valueField: 'RoomID',
                textField: 'RoomText'
            });

        });
    }

    function ExcuteOnServer() {
        //btnClear_OnClick();
        LoadData();
        //$('#SearchDlg').parent().appendTo($("form:first"))
        //$('#SearchDlg').dialog('open');
    }

    function LoadData() {
        document.getElementById('hiIsSQLData').value = 1;

        switch ($('#selTabID').val()) {
            case "1":
                LoadFees1();
                break;
            case "2":
                LoadFees2();
                break;
            case "3":
                LoadFees3();
                break;
        }
        //Clear();
    }

    function btnClear_OnClick() {
        document.getElementById('CustID').value = "";
        document.getElementById('CustName').value = "";
        document.getElementById('hiCustName').value = "";

        document.getElementById('RoomID').value = "";
        document.getElementById('RoomSign').value = "";
        document.getElementById('hiRoomSign').value = "";

    }


    function Clear() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#hiCustName').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#hiRoomSign').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        //document.getElementById('CustID').value = "";
        //document.getElementById('CustName').value = "";
        //document.getElementById('hiCustName').value = "";

        //document.getElementById('RoomID').value = "";
        //document.getElementById('RoomSign').value = "";
        //document.getElementById('hiRoomSign').value = "";

    }

    var frozenColumns = [[
        { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200, fixed: true },
        { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200, fixed: true },
        { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 200, fixed: true },
    ]];

    var fees1column = [[
        { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 160, fixed: true },
        { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'ParkNames', title: '车位编号', align: 'left', sortable: true, width: 100, fixed: true },
        {
            field: 'PrecDate', title: '预交时间', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.PrecDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'BillsSign', title: '收据号码', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'RepCostNames', title: '费用项目', align: 'left', sortable: true, width: 140, fixed: true },
        { field: 'PrecAmount', title: '预交金额', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'UserName', title: '收款人', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'AccountWayName', title: '处理方式', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'PrecMemo', title: '备注', align: 'left', sortable: true, width: 200, fixed: true },
        { field: 'BillsSigns', title: '发票号', align: 'left', sortable: true, width: 140, fixed: true },
        { field: 'PrintTimes', title: '打印次数', align: 'left', sortable: true, width: 100, fixed: true },
        {
            field: 'IsWriteOff', title: '是否冲销', align: 'left', sortable: true, width: 100, fixed: true, formatter: function (value, row, index) {
                var str = row.IsWriteOff == 'True' ? "是" : "否";
                return str;
            }
        },
        {
            field: '预览', title: '预览', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.SourceType != 1 && row.PrecMemo != "自动转移") {
                    var strAccountWay = row.AccountWay;
                    //var strRecdID = row.RecdID;
                    var strReceID = row.ReceID;
                    var UseRepID = row.UseRepID;
                    //var LoginCommID = $("#hiCommID").val();
                    //var iReceiptType = 0;
                    //if(strAccountWay == "3")
                    //{
                    //    iReceiptType = 1;
                    //}
                    //else
                    //{
                    //    iReceiptType = 3;
                    //}
                    //var url = "../ChargesNew/PreCostsReceiptBrowse.aspx";
                    //url=url+"?ReceiptType="+iReceiptType+"&RecdID="+strRecdID+"&ReceID="+strReceID+"&CommID="+LoginCommID+"&isSel=1";

                    str = "<a href='javascript:void()' onclick=\"ViewDetail('','" + strReceID + "','printsel',2," + strAccountWay + ",'" + UseRepID + "')\" >预览</a>";
                } else {

                }
                return str;
            }
        },
        {
            field: '打印', title: '打印', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = "";
                if (row.SourceType != 1 && row.PrecMemo != "自动转移") {
                    var strAccountWay = row.AccountWay;
                    var strReceID = row.ReceID;
                    var UseRepID = row.UseRepID;

                    str = "<a href='javascript:void()' onclick=ViewDetail('','" + strReceID + "','print',2," + strAccountWay + ",'" + UseRepID + "') >打印</a>";
                } else {

                }
                return str;
            }
        },
        {
            field: '下载附件', title: '下载附件', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = "";

                if (row.strAdjunctFile != "") {
                    str = "<a href='../House/AdjunctDownLoad.aspx?AdjunctFile=" + row.strAdjunctFile + "' >下载</a>";
                }
                return str;
            }
        }
        //,{
        //    field: 'IsWriteOff', title: '是否冲销', width: 100, align: 'left', sortable: true,
        //    formatter: function (value, row, index) {
        //        var strIsWriteOff = "";
        //        if (value) {
        //            strIsWriteOff = "是";
        //        } else {
        //            strIsWriteOff = "否";
        //        }
        //        return strIsWriteOff;
        //    }
        //}
    ]];

    function LoadFees1() {
        $("#TableContainer1").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: fees1column,
            //frozenColumns: frozenColumns,
            fitColumns: false,
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
            showFooter: true,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "searchprecostsdetail", "TableContainer1", param);
            },
            onLoadSuccess: function (data) {
                //加载页脚
                $('#TableContainer1').datagrid('reloadFooter', [
                    {
                        RoomSign: "<span style='color:red'>合计</span>",
                        PrecAmount: "<span style='color:red'>" + compute1("PrecAmount") + "</span>"
                    }
                ]);
            }
        });
        $('#SearchDlg').dialog('close');
    }

    var fees2column = [[
        { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 160, fixed: true },
        { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100, fixed: true },
        {
            field: 'AuditDate', title: '预交冲抵日期', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.AuditDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 140, fixed: true },
        {
            field: 'FeesDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, fixed: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.FeesDueDate, "yyyy-MM-dd");
                return str;
            }
        },
        { field: 'DebtsAmount', title: '应冲抵金额', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'CostNames', title: '冲抵费用项目', align: 'left', sortable: true, width: 120, fixed: true },
        { field: 'OldPrecAmount', title: '原预交余额', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'OffsetAmount', title: '冲抵金额', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'NewPrecAmount', title: '预交余额', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'TakeWiseName', title: '处理方式', align: 'left', sortable: true, width: 100, fixed: true },
        {
            field: 'IsWriteOff', title: '是否冲销', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var strIsWriteOff = "";
                if (value == 'True') {
                    strIsWriteOff = "是";
                } else {
                    strIsWriteOff = "否";
                }
                return strIsWriteOff;
            }
        }
    ]];


    function LoadFees2() {

        $("#TableContainer2").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: fees2column,
            fitColumns: false,
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
            showFooter: true,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "searchoffsetpredetail", "TableContainer2", param);
            },
            onLoadSuccess: function (data) {
                //加载页脚
                $('#TableContainer2').datagrid('reloadFooter', [
                    {
                        RoomSign: "<span style='color:red'>合计</span>",
                        DebtsAmount: "<span style='color:red'>" + compute2("DebtsAmount") + "</span>",
                        OldPrecAmount: "<span style='color:red'>" + compute2("OldPrecAmount") + "</span>",
                        OffsetAmount: "<span style='color:red'>" + compute2("OffsetAmount") + "</span>",
                        NewPrecAmount: "<span style='color:red'>" + compute2("NewPrecAmount") + "</span>"
                    }
                ]);
            }
        });
        $('#SearchDlg').dialog('close');

    }

    var fees3column = [[
        { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 160, fixed: true },
        { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'RoomName', title: '房屋名称', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'ParkNames', title: '车位', align: 'left', sortable: true, width: 100, fixed: true },
        {
            field: 'PrecAmount', title: '预交金额', align: 'left', sortable: true, width: 100, fixed: true,

        },
        { field: 'IsPrecName', title: '是否参与冲抵', align: 'left', sortable: true, width: 100, fixed: true },
        { field: 'CostNames', title: '冲抵费用项目', align: 'left', sortable: true, width: 140, fixed: true },
        //{
        //    field: '删 除', title: '删 除', align: 'left', sortable: true, width: 100, fixed: true,
        //    formatter: function (value, row, index) {
        //        var str = "";
        //        if (row.PrecAmount <= "0") {
        //            str = "<a href='JavaScript:void(0);' onclick=Del(" + row.PrecID + ") >删 除</a>";
        //        }
        //        return str;
        //    }
        //},
        {
            field: '冻结/转移', title: '冻结/转移', align: 'left', sortable: true, width: 110, fixed: true,
            formatter: function (value, row, index) {
                var str = "";
                str = "<a href='JavaScript:void(0);' onclick=FreezeFees('" + row.PrecID + "') >冻结/转移</a>";
                return str;
            }
        }
    ]];

    function LoadFees3() {
        $("#TableContainer3").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: fees3column,
            fitColumns: false,
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
            showFooter: true,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("PrecReceFee", "precostsdeatilsearch", "TableContainer3", param);
            },
            onLoadSuccess: function (data) {
                //加载页脚
                $('#TableContainer3').datagrid('reloadFooter', [
                    {
                        RoomSign: "<span style='color:red'>合计</span>",
                        PrecAmount: "<span style='color:red'>" + compute3("PrecAmount") + "</span>"
                    }
                ]);
            }
        });
        $('#SearchDlg').dialog('close');

    }

    //冻结转移
    function FreezeFees(precID) {
        if (precID != 'undefined') {
            HDialog.Open('1020', '550', '../ChargesNew/PreCostsEdtManage.aspx?OPType=Edit&PrecID=' + precID,
                '预交费用信息', false, function callback(_Data) {
                    if (_Data == "true" && _Data != "") {
                        LoadFees3();
                    }
                });
        }
    }

    //删除余额
    function Del(PrecID) {
        $.messager.confirm('确定', '是否删除', function (r) {
            if (r) {
                $.tool.DataGet('PrecReceFee', 'DelReceFee', "PrecID=" + PrecID,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info("删除成功!");
                            LoadFees3();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }

    document.getElementById('hiIsSQLData').value = -1;

    //打印预览
    function ViewDetail(title, ReceID, type, strSourceType, strAccountWay, UseRepID) {
        var w = $(window).width();
        var h = $(window).height();

        var conent = '';
        var RepUrl = '';
        //var row = $("#TableContainer1").datagrid("getSelected");

        //var strAccountWay = row.AccountWay
        //var strSourceType = row.SourceType

        var iReceiptType = 0;


        ////实收
        //if (strSourceType == "1") {

        //    iReceiptType = 1;
        //    RepUrl = "../ChargesNew/ReceiveReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + row.ReceID + "&re=5&UseRepID=" + row.UseRepID + "&CommID=" + row.CommID;

        //    conent = '../ChargesNew/ReceiveFeesCancelManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;

        //}
        //预存
        if (strSourceType == "2") {

            if (strAccountWay == "3") {
                iReceiptType = 1;
            }
            else {
                iReceiptType = 3;
            }
            RepUrl = "../ChargesNew/PreCostsReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + ReceID + "&re=5&UseRepID=" + UseRepID + "&CommID=" + $("#hiCommID").val();

            conent = '../ChargesNew/PreCostsCancelManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;
        }

        //实收退款
        //if (strSourceType == "5") {

        //    iReceiptType = 1;
        //    RepUrl = "../ChargesNew/RefundFeesReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + row.ReceID + "&re=5&UseRepID=" + row.UseRepID + "&CommID=" + row.CommID;

        //    conent = '../ChargesNew/RefundFeesCancelManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;

        //}

        //预存退款
        //if (strSourceType == "6") {

        //    iReceiptType = 1;
        //    RepUrl = "../ChargesNew/PreCostsReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + row.ReceID + "&re=5&UseRepID=" + row.UseRepID + "&CommID=" + row.CommID;

        //    conent = '';
        //    //conent = '../ChargesNew/PreCostsRefundManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;

        //}

        switch (type) {
            case "cancel":
                $.tool.DataGet('FeesReceipts', 'CheckRepeal', "ReceID=" + ReceID + "&SourceType=" + strSourceType,
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data;

                        if (r.split('|')[0] == "true") {

                            HDialog.Open(w, h, conent, title, false, function callback(_Data) {
                                LoadList();
                            });
                        }
                        else {
                            HDialog.Info(r.split('|')[1] + "票据不能作废！");
                        }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                break;
            case "printsel":
                RepUrl = RepUrl + "&isSel=1";
                window.open(RepUrl);
                break;
            case "print":
                $.tool.DataGet('FeesReceipts', 'UpdateTimes', "ReceID=" + ReceID + "&SourceType=" + strSourceType,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            window.open(RepUrl);
                            LoadList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

                break;
        }


    }
</script>
