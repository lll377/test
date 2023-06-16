<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiveFeesCancelBrowse.aspx.cs" Inherits="M_Main.ChargesNew.ReceiveFeesCancelBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title>撤销收款/恢复票号</title>
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
</head>
<body>
    <form id="frmForm" runat="server">

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">

            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">业务类型
                    </td>
                    <td class="TdContentSearch">
                        <select id="DrReceive" runat="server" name="DrReceive">
                            <option value="0" selected>全部</option>
                            <option value="1">收款</option>
                            <option value="2">预存</option>
                            <option value="5">退款</option>
                            <option value="6">预存退款</option>

                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
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
                    <td class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom"
                            name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiRoomSign" runat="server" /></td>
                    <td class="TdTitle">票据号码</td>
                    <td class="TdContent">
                        <input id="BillsSign" type="text"
                            name="BillsSign" runat="server" /></td>
                </tr>

                <tr>
                    <td class="TdTitle">收费日期</td>
                    <td class="TdContent">从<input id="EditBeginDate" class="Wdate" style="width: 40%"
                        onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" maxlength="50" name="EditBeginDate"
                        runat="server">到<input class="Wdate" id="EditEndDate" style="width: 40%"
                            onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd', alwaysUseStartDate: true })" type="text" maxlength="50" name="EditEndDate"
                            runat="server"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent">
                        </td>
                </tr>
                <tr>
                   
                    <td class="TdTitle">是否撤销</td>
                    <td class="TdContent"><select id="IsDelete" name="IsDelete" runat="server">
                            <option selected></option>
                        </select></td>
                     <td class="TdTitle">是否冲销</td>
                    <td class="TdContent"> <select id="IsWriteOff" name="IsWriteOff" runat="server">
                            <option selected></option>
                        </select></td>
                    </tr>

                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>

                    </td>
                </tr>
            </table>
        </div>
         <div id="DlgDetail1" class="easyui-dialog" title="作废明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width:1024px;height:300px;">
          <div style="width:100%;background-color:#ffffff;"  id="TableContainerDetail1"></div>
        </div>
         <div id="DlgDetail2" class="easyui-dialog" title="冲销明细" data-options="iconCls:'icon-search',closed: true,modal:true" style="width:1024px;height:300px;">
          <div style="width:100%;background-color:#ffffff;"  id="TableContainerDetail2"></div>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
            }
            InitFunction();

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 800;
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

            var frozenColumns = [[
                 { field: 'SourceTypeName', title: '业务类型', width: 100, align: 'left', sortable: true },
                    { field: 'CustName', title: '客户名称', width: 140, align: 'left', sortable: true },
                    { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                    { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                    {
                        field: 'BillsSign', title: '票据号码', width: 120, align: 'left', sortable: true,
                        formatter: function (value, row, index) {
                            var str = "";
                            str = "<a href='javascript:void(0);' class=\"HrefStyle\" onclick=ViewDetail('票据明细','" + row.ReceID + "','cancel','" + row.AccountWay + "','" + row.SourceType + "','" + row.CommID + "','" + row.UseRepID + "');>" + row.BillsSign + "</a>";
                            return str;
                        }
                    }
            ]];
            var column = [[
                    { field: 'ReceID', title: 'ReceID', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'UseRepID', title: 'UseRepID', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'SourceType', title: 'SourceType', width: 50, align: 'left', sortable: true, hidden: true },
                    { field: 'AccountWay', title: 'AccountWay', width: 50, align: 'left', sortable: true, hidden: true },
               
                   { field: 'PaidAmount', title: '收/退款金额', width: 100, align: 'left', sortable: true },
                    {
                        field: 'BillsDate', title: '收费日期', width: 150, align: 'left', sortable: true,
                        formatter: function (value, row, index) {
                            var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                            return str;
                        }
                    },
                     { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                     { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                     //{ field: 'IsReferName', title: '申请撤销', width: 50, align: 'left', sortable: true },
                     //{
                     //    field: 'ReferDate', title: '提交时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                     //        var str = formatDate(row.ReferDate, "yyyy-MM-dd HH:mm:ss");
                     //        return str;
                     //    }
                     //},
                     //{ field: 'ReferUserName', title: '提交人', width: 100, align: 'left', sortable: true },
                     //{ field: 'IsAuditName', title: '审核', width: 50, align: 'left', sortable: true },
                     //{
                     //    field: 'AuditDate', title: '审核时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                     //        var str = formatDate(row.AuditDate, "yyyy-MM-dd HH:mm:ss");
                     //        return str;
                     //    }
                     //},
                     //{ field: 'AuditUserName', title: '审核人', width: 50, align: 'left', sortable: true },
                     //{ field: 'ReceMemo', title: '备注', width: 100, align: 'left', sortable: true },
                    {
                        field: 'IsDeleteName', title: '是否撤销', width: 50, align: 'left', sortable: true
                        ,formatter: function (value, row, index) {
                            var str = "";
                            str = "<a href='javascript:void(0);' class=\"HrefStyle\" onclick=ViewDetail1('票据明细','" + row.ReceID + "','" + row.SourceType + "');>" + row.IsDeleteName + "</a>";
                            return str;
                        }

                    },
                    {
                        field: 'IsWriteOffName', title: '是否冲销', width: 50, align: 'left', sortable: true, formatter: function (value, row, index) {
                            var str = "";
                            if (row.SourceType == '5' || row.SourceType == '6')
                                str = row.IsWriteOffName;
                            else {
                                str = "<a href='javascript:void(0);' class=\"HrefStyle\" onclick=ViewDetail2('票据明细','" + row.ReceID + "','" + row.SourceType + "');>" + row.IsWriteOffName + "</a>";
                            }
                            return str;
                        }
                    },
                    { field: 'PrintTimes', title: '打印次数', width: 50, align: 'left', sortable: true },
                     {
                         field: '预览', title: '预览', width: 60, align: 'left', sortable: true,
                         formatter: function (value, row, index) {
                             var str = "";
                             str = "<a href='javascript:void();' class=\"HrefStyle\" onclick=ViewDetail('票据明细','" + row.ReceID + "','printsel','" + row.AccountWay + "','" + row.SourceType + "','" + row.CommID + "','" + row.UseRepID + "');>预览</a>";
                          
                             return str;
                         }
                     },
            {
                field: '打印', title: '打印', width: 60, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = "";
                    str = "<a href='javascript:void();' class=\"HrefStyle\" onclick=ViewDetail('票据明细','" + row.ReceID + "','print','" + row.AccountWay + "','" + row.SourceType + "','" + row.CommID + "','" + row.UseRepID + "');>打印</a>";
                    return str;
                }
            }


            ]];




            var column2 = [[
               { field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true },
                   { field: 'IsReferName', title: '申请撤销', width: 50, align: 'left', sortable: true },
                   {
                       field: 'ReferDate', title: '提交时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                           var str = formatDate(row.ReferDate, "yyyy-MM-dd HH:mm:ss");
                           return str;
                       }
                   },
                   { field: 'ReferUserName', title: '提交人', width: 100, align: 'left', sortable: true },
                   { field: 'IsAuditName', title: '审核', width: 50, align: 'left', sortable: true },
                   {
                       field: 'AuditDate', title: '审核时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                           var str = formatDate(row.AuditDate, "yyyy-MM-dd HH:mm:ss");
                           return str;
                       }
                   },
                   { field: 'AuditUserName', title: '审核人', width: 50, align: 'left', sortable: true },
                   { field: 'ReceMemo', title: '备注', width: 100, align: 'left', sortable: true },
                  {
                      field: 'IsDeleteName', title: '是否撤销', width: 50, align: 'left', sortable: true
                    

                  }

            ]];

            var column3 = [[
          { field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true },
           {
               field: 'WriteAmount', title: '冲销金额', width: 150, align: 'left', sortable: true 
           },
             
              {
                  field: 'SubmitterDate', title: '提交时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                      var str = formatDate(row.SubmitterDate, "yyyy-MM-dd HH:mm:ss");
                      return str;
                  }
              },
              { field: 'SubmitterUserName', title: '提交人', width: 100, align: 'left', sortable: true },
            
              {
                  field: 'WriteOffAuditDate', title: '审核时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                      var str = formatDate(row.WriteOffAuditDate, "yyyy-MM-dd HH:mm:ss");
                      return str;
                  }
              },
              { field: 'WriteOffAuditUserName', title: '审核人', width: 50, align: 'left', sortable: true },
              { field: 'ReceMemo', title: '备注', width: 100, align: 'left', sortable: true },
             {
                 field: 'IsWriteOffName', title: '是否冲销', width: 50, align: 'left', sortable: true
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
                }
            ];



            function ViewDetail2(title, ReceID, SourceType) {


                $("#TableContainerDetail2").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesReceipts&Command=ReceiveAllCancel&ReceID=' + ReceID + '&SourceType=' + SourceType,
                    method: "get",
                    nowrap: false,
                    height: 260,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column3,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onLoadSuccess: function (data) {
                    }
                });


                $('#DlgDetail2').dialog('open');
            }

            function ViewDetail1(title, ReceID, SourceType) {
                 

                $("#TableContainerDetail1").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=FeesReceipts&Command=ReceiveAllCancel&ReceID=' + ReceID + '&SourceType=' + SourceType + '&EditBeginDate=' + $('#EditBeginDate').val() + '&EditEndDate=' + $('#EditEndDate').val(),
                    method: "get",
                    nowrap: false,
                    height:260,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column2,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                   
                    onLoadSuccess: function (data) {
                    }
                });

                $('#DlgDetail1').dialog('open');
            }

            function ViewDetail(title, ReceID, type, AccountWay, SourceType, CommID, UseRepID) {

                //alert("ReceID=" + ReceID + " type=" + type + " AccountWay=" + AccountWay + " SourceType=" + SourceType);
                //debugger
                var w = $(window).width();
                var h = $(window).height();

                var conent = '';
                
                var strAccountWay = AccountWay;//row.AccountWay
                var strSourceType = SourceType;//row.SourceType

                var iReceiptType = 0;


                //实收
                if (strSourceType == "1") {

                    iReceiptType = 1;
                    RepUrl = "../ChargesNew/ReceiveReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + ReceID + "&re=5&UseRepID=" + UseRepID + "&CommID=" + CommID;

                    conent = '../ChargesNew/ReceiveFeesCancelManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;

                }
                //预存
                if (strSourceType == "2") {

                    if (strAccountWay == "3") {
                        iReceiptType = 1;
                    }
                    else {
                        iReceiptType = 3;
                    }
                    RepUrl = "../ChargesNew/PreCostsReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + ReceID + "&re=5&UseRepID=" + UseRepID + "&CommID=" + CommID;

                    conent = '../ChargesNew/PreCostsCancelManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;
                }

                //实收退款
                if (strSourceType == "5") {

                    iReceiptType = 1;
                    RepUrl = "../ChargesNew/RefundFeesReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + ReceID + "&re=5&UseRepID=" + UseRepID + "&CommID=" + CommID;

                    conent = '../ChargesNew/RefundFeesCancelManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;

                }

                //预存退款
                if (strSourceType == "6") {

                    iReceiptType = 1;
                    RepUrl = "../ChargesNew/PreCostsReceiptBrowse.aspx" + "?ReceiptType=" + iReceiptType + "&ReceID=" + ReceID + "&re=5&UseRepID=" + UseRepID + "&CommID=" + CommID;

                    conent = '../ChargesNew/PreCostsCancelManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;
                  //  conent = '../ChargesNew/PreCostsRefundManage.aspx?ReceID=' + ReceID + "&SourceType=" + strSourceType;

                }

                switch (type) {
                    case "cancel":
                        $.tool.DataGet('FeesReceipts', 'CheckRepeal', "ReceID=" + ReceID + "&SourceType=" + strSourceType,
                        function Init() {
                        },
                        function callback(_Data) {
                            var r = _Data;
                           
                            //if (r.split('|')[0] == "true") {

                                HDialog.Open(w, h, conent, title, false, function callback(_Data) {
                                    LoadList();
                                });
                            //}
                            //else {
                            //    HDialog.Info(r.split('|')[1] + "票据不能作废！");
                            //}

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

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns:frozenColumns,
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
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesReceipts", "ReceiveAllCancel", "TableContainer", param);

                        //if ($('#DrReceive').val() == "1") {
                        //    param = $.JQForm.GetParam("FeesReceipts", "ReceiveFeesCancel", "TableContainer", param);
                        //}
                        //if ($('#DrReceive').val() == "2") {
                        //     param = $.JQForm.GetParam("FeesReceipts", "PreCostsReceipts", "TableContainer", param);
                        // }
                    },
                    onLoadSuccess: function (data) {
                    }
                });


                $('#SearchDlg').dialog('close');

            }
            LoadList();

        </script>
    </form>
</body>
</html>


