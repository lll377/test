﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepealReceiveFeesDetail.aspx.cs" Inherits="M_Main.ChargesNew.RepealReceiveFeesDetail" %>

<!DOCTYPE html>
<html>
<head>
    <title>收费管理--收据明细</title>
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
<body style="overflow-y: auto;">
    <form id="RepealReceiveFeesDetail" method="post" runat="server">
        
        <input id="strLoginCommID" name="strLoginCommID" type="hidden" runat="server" /> 
                 <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="ReceID" style="width: 32px; height: 22px" type="hidden" size="1" name="ReceID"
            runat="server"><input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
                runat="server"><input id="IsRefer" style="width: 32px; height: 22px" type="hidden" size="1" name="IsRefer"
                    runat="server"><input id="IsAudit" style="width: 32px; height: 22px" type="hidden" size="1" name="IsAudit"
                        runat="server"><input id="IsDelete" style="width: 32px; height: 22px" type="hidden" size="1" name="IsDelete"
                            runat="server"><input id="hiBillsDate" style="width: 32px; height: 22px" type="hidden" size="1" name="hiBillsDate"
                                runat="server"><input id="OldBillTypeID" style="width: 24px; height: 21px" type="hidden" size="1" name="OldBillTypeID"
                                    runat="server"><input id="hiOldBillsSign" style="width: 24px; height: 21px" type="hidden" size="1" name="hiOldBillsSign"
                                        runat="server">
        <input id="FeesDetail" name="FeesDetail" type="hidden" runat="server" />
        <input id="PreCostsDetail" name="PreCostsDetail" type="hidden" runat="server" />

        <table class="DialogTable" id="table1">

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">票据信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent">
                    <asp:Label ID="CustName" runat="server"></asp:Label></td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContent">
                    <asp:Label ID="RoomSign" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">收据号码</td>
                <td class="TdContent">
                    <asp:Label ID="BillsSign" runat="server"></asp:Label></td>
                <td class="TdTitle">收费日期</td>
                <td class="TdContent">
                    <asp:Label ID="BillsDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">收费合计</td>
                <td class="TdContent">
                    <asp:Label ID="PaidAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">本次结余</td>
                <td class="TdContent">
                    <asp:Label ID="PerSurplus" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">结转余额</td>
                <td class="TdContent">
                    <asp:Label ID="SurplusAmount" runat="server"></asp:Label></td>
                <td class="TdTitle">收款方式</td>
                <td class="TdContent">
                    <asp:Label ID="ChargeMode" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">收款人</td>
                <td class="TdContent">
                    <asp:Label ID="UserName" runat="server"></asp:Label></td>
                <td class="TdTitle">收据样式</td>
                <td class="TdContent">
                    <select id="UseRepID" name="UseRepID" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">费用备注</td>
                <td class="TdContent">
                    <asp:Label ID="ReceMemo" runat="server"></asp:Label></td>
                <td class="TdTitle">打印次数</td>
                <td class="TdContent">
                    <asp:Label ID="PrintTimes" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle" style="z-index: 0">已换发票</td>
                <td class="TdContent" colspan="3">
                    <asp:Label ID="NewBillsSign" runat="server" Style="z-index: 0"></asp:Label></td>
            </tr>

            <tr>
                <td class="TdTitle">是否已审核</td>
                <td class="TdContent">
                    <asp:Label Style="z-index: 0" ID="IsAuditName" runat="server"></asp:Label></td>
                <td class="TdTitle">是否撤销</td>
                <td class="TdContent">
                    <asp:Label ID="IsDeleteName" runat="server" Style="z-index: 0"></asp:Label></td>
            </tr>

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">票据审核信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">撤销原因</td>
                <td class="TdContent">
                    <input class="Control_ItemInput" id="ReferReason" name="ReferReason"
                        runat="server"></td>
                <td class="TdTitle">是否恢复票号</td>
                <td class="TdContent">
                    <select id="IsRestore" name="IsRestore" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input id="btnOk" class="button" value="审核通过" type="button" name="btnOk" runat="server">&nbsp;
                    <input id="btnNo" class="button" value="审核不通过" type="button" name="btnNo" runat="server">&nbsp;
                    <input id="btnSave" class="button" value="保存" type="button" name="btnSave" runat="server">
                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server"></td>
            </tr>
        </table>
        <table class="DialogTable" id="table2">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">已收取的费用</span> </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="SearchContainer" id="TableContainer1">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">已收取的预收费用</span> </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div class="SearchContainer" id="TableContainer2">
                    </div>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>


<script type="text/javascript">
    $(function () {
        InitTable();
        LoadList();
    });

    function InitTable() {
        var ah = $(window).height();
        var h = $('#table1').height();
        h = ah - h
        h = h - 64;
        h = h / 2;
        if (h < 50) {
            h = h + 100;
            $("#TableContainer1").css("height", h + "px");
            $("#TableContainer2").css("height", h + "px");
        } else {
            $("#TableContainer1").css("height", h + "px");
            $("#TableContainer2").css("height", h + "px");
        }
      
    }
    

    var column1 = [[
        { field: 'ChargeDate', title: '收款时间', width: 180, align: 'left', sortable: true },

        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },

          { field: 'CostName', title: '收款方式', width: 120, align: 'left', sortable: true },
          { field: 'FeeDueYearMonth', title: '费用日期', width: 120, align: 'left', sortable: true },
          {
              field: 'AccountsDueDate', title: '应收日期', width: 120, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                  var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                  return str;
              }
          },
          {
              field: 'FeesStateDate', title: '开始日期', width: 120, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                  var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                  return str;
              }
          },
          {
              field: 'FeesEndDate', title: '结束日期', width: 120, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                  var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                  return str;
              }
          },
          { field: 'ChargeAmount', title: '收款金额', width: 120, align: 'left', sortable: true },
          { field: 'LateFeeAmount', title: '合同违约金', width: 120, align: 'left', sortable: true },
          { field: 'UserName', title: '收款人', width: 120, align: 'left', sortable: true },
          { field: 'ReceMemo', title: '备注', width: 200, align: 'left', sortable: true }
    ]];

    var column2 = [[
        { field: 'ChargeDate', title: '收款时间', width: 180, align: 'left', sortable: true },

        { field: 'RoomSign', title: '房屋编号', width: 150, align: 'left', sortable: true },

          { field: 'CostName', title: '收款方式', width: 120, align: 'left', sortable: true },
          { field: 'FeeDueYearMonth', title: '费用日期', width: 120, align: 'left', sortable: true },
          {
              field: 'AccountsDueDate', title: '应收日期', width: 120, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                  var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                  return str;
              }
          },
          {
              field: 'FeesStateDate', title: '开始日期', width: 120, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                  var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                  return str;
              }
          },
          {
              field: 'FeesEndDate', title: '结束日期', width: 120, align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                  var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                  return str;
              }
          },
          { field: 'PrecAmount', title: '预交金额', width: 120, align: 'left', sortable: true },
          { field: 'UserName', title: '预交操作人', width: 120, align: 'left', sortable: true },
          { field: 'PrecMemo', title: '备注', width: 200, align: 'left', sortable: true }
    ]];
    function LoadList() {

        var data = $('#FeesDetail').val();
        var obj = JSON.parse(data);

        $("#TableContainer1").datagrid({

            data: obj.rows,
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column1,
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
            sortOrder: "asc"
        });

        var data2 = $('#PreCostsDetail').val();
        var obj2 = JSON.parse(data2);
        $("#TableContainer2").datagrid({

            data: obj2.rows,
            nowrap: false,
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
            sortOrder: "asc"
        });

    }
   
</script>
