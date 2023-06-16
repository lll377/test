<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyReceiptsBrowse.aspx.cs" Inherits="M_Main.ChargesNew.ModifyReceiptsBrowse" %>


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
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">

        <input type="hidden" id="ModifyType" name="ModifyType" runat="server" />


        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 200px;">
            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">票据类型</td>
                    <td class="TdContent">
                        <select id="DListPage" runat="server" name="DListPage">
                            <option value="1">收费</option>
                            <option value="2">垫付收费</option>
                            <option value="3">预交收费</option>
                            <option value="4">退款</option>
                            <option value="5">预交退款</option>
                        </select></td>
                    <td class="TdTitle">收费日期</td>
                    <td class="TdContent">从<input class="Wdate" id="EditBeginDate" style="width: 40%"
                        onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" name="EditBeginDate"
                        runat="server" />到<input class="Wdate" id="EditEndDate" style="width: 40%"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" name="EditEndDate"
                            runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false"  /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">可选房号
                    </td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td Class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom"
                            name="RoomSign" class="easyui-searchbox" data-options="editable:false"  runat="server" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign" runat="server" /></td>
                    <td class="TdTitle">收据号码</td>
                    <td class="TdContent">
                        <input id="BillsSign" type="text"
                            name="BillsSign" runat="server" /></td>
                </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a></td>
                </tr>
            </table>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 200 + 'px');
            }
            InitFunction();



            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


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
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#BuildArea').val(buildArea);
                                                    $('#CalcArea').val(buildArea);
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
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

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

            { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
            { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
            {
                field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                    var ReceID = row.ReceID;
                    var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + ReceID + "');\">" + row.BillsSign + "</a>";
                    return str;
                }
            },
            {
                field: 'BillsDate', title: '收费日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = formatDate(row.BillsDate, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'ChargeModes', title: '收款方式', width: 100, align: 'left', sortable: true },
            { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true }


            ]];


            var toolbar = [
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');

                     }
                 }
            ];


            function ViewDetail(ID) {

              
                var title = '修改收费时间';
                var method = "FeesReceiptsCheckUpdateDate"

                if ($('#ModifyType').val() == "2")
                {
                    title = '修改收款方式';
                    var method = "FeesReceiptsCheckChargeMode"
                }
                var DListPage = $('#DListPage').val();
                $.tool.DataGet('FeesReceipts', method, 'ReceID=' + ID + '&DListPage=' + DListPage,
                         function Init() {
                         },
                         function callback(_Data) {
                             var r = _Data.split('|');

                             if (r[0] == "true") {

                                 var h = $(window).height();
                                 var w = $(window).width();
                                 var Content = '../ChargesNew/ModifyReceiptsManage.aspx?ReceID=' + ID + '&OpType=update&ModifyType=' + $('#ModifyType').val();
                                 //alert(DListPage);
                                 switch (DListPage) {
                                     case '1':
                                         Content = '../ChargesNew/ModifyReceiptsManage.aspx?ReceID=' + ID + '&OpType=update&ModifyType=' + $('#ModifyType').val();
                                         break;
                                     case '2':
                                         Content = '../ChargesNew/ModifyAdvanceReceiptsManage.aspx?ReceID=' + ID + '&OpType=update&ModifyType=' + $('#ModifyType').val();
                                         break;
                                     case '3':
                                         Content = '../ChargesNew/ModifyPreCostsManage.aspx?ReceID=' + ID + '&OpType=update&ModifyType=' + $('#ModifyType').val();
                                         break;
                                     case '4':
                                         Content = '../ChargesNew/ModifyRefundReceiptsManage.aspx?ReceID=' + ID + '&OpType=update&ModifyType=' + $('#ModifyType').val();
                                         break;
                                     case '5':
                                         Content = '../ChargesNew/ModifyPrecRefundReceiptsManage.aspx?ReceID=' + ID + '&OpType=update&ModifyType=' + $('#ModifyType').val();
                                         break;
                                 }
                                 HDialog.Open(w, h, Content, title, false, function callback(_Data) {
                                     if (_Data != null) {
                                         LoadList();
                                     }
                                 });
                             }
                             else { HDialog.Info(r[1]); }


                         },
                         function completeCallback() {
                         },
                         function errorCallback() {
                         });

            }



            function LoadList() {
                var DListPage = $('#DListPage').val();
                var title = '收款收据';
                switch (DListPage) {
                    case "1":
                        column = [[

                       { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                       { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                       { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                       { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                       {
                           field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                               var ReceID = row.ReceID;
                               var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + ReceID + "');\">" + row.BillsSign + "</a>";
                               return str;
                           }
                       },
                       { field: 'InvoiceBill', title: '发票号码', width: 100, align: 'left', sortable: true },
                       {
                           field: 'BillsDate', title: '收费日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                               var str = row.BillsDate;
                               return str;
                           }
                       },
                       { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                       { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true }


                        ]];
                         title = '收款票据';
                        break;
                    case "2":
                        column = [[

                             { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                             { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                             { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                             { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                             {
                                 field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                     var ReceID = row.ReceID;
                                     var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + ReceID + "');\">" + row.BillsSign + "</a>";
                                     return str;
                                 }
                             },
                             { field: 'InvoiceBill', title: '发票号码', width: 100, align: 'left', sortable: true },
                             {
                                 field: 'BillsDate', title: '收费日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                                     var str = row.BillsDate;
                                     return str;
                                 }
                             },
                             { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                             { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true }


                        ]];
                        title = '垫付收款票据';
                        break;
                    case "3":
                        column = [[

                             { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                             { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                             { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                             { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                             {
                                 field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                     var ReceID = row.ReceID;
                                     var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + ReceID + "');\">" + row.BillsSign + "</a>";
                                     return str;
                                 }
                             },
                             { field: 'InvoiceBill', title: '发票号码', width: 100, align: 'left', sortable: true },
                             
                             {
                                 field: 'BillsDate', title: '收费日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                                     var str = row.BillsDate;
                                     return str;
                                 }
                             },
                             { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                             { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true }


                        ]];
                        title = '预交收款收据';
                        break;
                    case "4":
                        column = [[

                             { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                             { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                             { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                             { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                             {
                                 field: 'RefundBillSNum', title: '退款凭据', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                     var ReceID = row.ReceID;
                                     var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + ReceID + "');\">" + row.RefundBillSNum + "</a>";
                                     return str;
                                 }
                             },
                             {
                                 field: 'RefundDate', title: '退款日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                                     var str = row.RefundDate;
                                     return str;
                                 }
                             },
                             { field: 'RefundMode', title: '退款方式', width: 100, align: 'left', sortable: true },
                             { field: 'UserName', title: '退款人', width: 100, align: 'left', sortable: true }


                        ]];
                        title = '退款凭据';
                        break;
                    case "5":
                        column = [[

                             { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                             { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                             { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                             { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                             {
                                 field: 'BillsSign', title: '退款凭据', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                     var ReceID = row.ReceID;
                                     var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + ReceID + "');\">" + row.BillsSign + "</a>";
                                     return str;
                                 }
                             },
                             { field: 'InvoiceBill', title: '发票号码', width: 100, align: 'left', sortable: true },
                             {
                                 field: 'BillsDate', title: '退款日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                                     var str = row.BillsDate;
                                     return str;
                                 }
                             },
                             { field: 'ChargeMode', title: '退款方式', width: 100, align: 'left', sortable: true },
                             { field: 'UserName', title: '退款人', width: 100, align: 'left', sortable: true }


                        ]];
                        title = '预交退款凭据';
                        break;

                }

                LoadData(title);
            }
            function LoadData(title)
            {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    //title: title,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
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
                        param = $.JQForm.GetParam("FeesReceipts", "FeesReceiptsSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            LoadList();

            $('#btnSave').click(function () {

                LoadList();

            });


        </script>
    </form>
</body>
</html>

