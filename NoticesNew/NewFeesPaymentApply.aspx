<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesPaymentApply.aspx.cs" Inherits="M_Main.NoticesNew.NewFeesPaymentApply" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
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
    </style>


</head>
<body>
    <form id="frmForm" runat="server">
        <input id="BeginDate" style="width: 16px; height: 22px" type="hidden" size="1" name="BeginDate"
            runat="server" /><input id="EndDate" style="width: 16px; height: 22px" type="hidden" size="1" name="EndDate"
                runat="server" /><input id="PayID" style="width: 16px; height: 22px" type="hidden" size="1" name="PayID"
                    runat="server" /><input id="TotalSumAmount" style="width: 16px; height: 22px" type="hidden" size="1" name="TotalSumAmount"
                        runat="server" /><input id="IsAuditing24" style="width: 16px; height: 22px" type="hidden" size="1" name="IsAuditing24" 
                    runat="server" />

        <table class="DialogTable" id="HeadTable" name="HeadTable" style="width: 100%;">

            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">生成交款报表</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="height: 24px; line-height: 24px;">上次交款时间</td>
                <td class="TdContent" style="height: 24px; line-height: 24px;">
                    <input id="EditBeginDate" style="height: 24px; line-height: 24px;" class="Wdate" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditBeginDate" runat="server"  /></td>
                <td class="TdTitle" style="height: 24px; line-height: 24px;">交款截止时间</td>
                <td class="TdContent" style="height: 24px; line-height: 24px;">
                    <input id="EditEndDate" style="height: 24px; line-height: 24px;" class="Wdate" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditEndDate" runat="server" /></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnSelPeriod" type="button" value="未交款时间选择"
                        onclick="javascript:if(btnSelPeriod_OnClick()==false) return false;" name="btnSelPeriod" runat="server" />&nbsp;&nbsp;
										<input class="button" id="btnCre" type="button" value="查询生成" name="btnCre"
                                            runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 12px"></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">交款报表</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">开始时间</td>
                <td class="TdContent">
                    <span id="lbBeginDate" name="lbBeginDate" runat="server"></span>
                </td>
                <td class="TdTitle">结束时间</td>
                <td class="TdContent">
                    <span id="lbEndDate" name="lbEndDate" runat="server"></span></td>
            </tr>
            <tr>
                <td class="TdTitle">总 金 额</td>
                <td class="TdContent">
                    <span id="lbPayAmount" name="lbPayAmount" runat="server"></span>
                </td>
                <td class="TdTitle">申请时间</td>
                <td class="TdContent">
                    <span id="lbPayDate" name="lbPayDate" runat="server"></span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">交款方式</td>
                <td colspan="3" style="height: 24px; line-height: 24px;">
                    <input style="height: 24px; line-height: 24px; width: 87.5%" id="PaymentMethods" readonly name="PaymentMethods"
                        runat="server" />&nbsp;<input class="button" id="btnSelPaymentMethod" onclick="javascript:if(btnSelPaymentMethod_OnClick()==false) return false;"
                            type="button" value="选择交款方式" name="btnSelPaymentMethod" style="height: 24px" runat="server"  /><input class="Control_ItemInput" id="hiPaymentMethods" style="width: 8px; height: 19px"
                                type="hidden" size="1" name="hiPaymentMethods" runat="server"><input class="Control_ItemInput" id="PaymentMethodAmount" style="width: 8px; height: 19px"
                                    type="hidden" size="1" name="PaymentMethodAmount" runat="server"></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 3px"></td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="formTable_ItemInput" style="height: 24px; line-height: 24px;" colspan="3">
                    <input style="height: 24px; line-height: 24px; width: 95%" id="PayMemo" name="PayMemo" runat="server"></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 6px"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnOk"  type="button" value="提交申请"
                        onclick="javascript:if(CheckData()==false) return false;" name="btnOk" runat="server">
                </td>

            </tr>
            <tr>
                <td colspan="4" style="height: 6px"></td>
            </tr>
        </table>
        <div id="Divreport" name="Divreport" class="easyui-layout" title="交款报表">
            <div data-options="region:'center',title:'交款报表'" style="background: #ffffff; border: hidden">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" id="jjbb" name="jjbb" refpage="NewPublicMeterNewResultManage" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">缴款日报表</a>
                        </li>

                        <li class="" name="pjhz" id="pjhz" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">票据汇总表</a>
                        </li>
                        <li class="" name="pjmx" id="pjmx" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">票据明细表</a>
                        </li>
                        <li class="" name="fymx" id="fymx" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false">费用明细表</a>
                        </li>
                        <li class="" name="tsmx" id="tsmx" refpage="NewBatchPublicResultManage" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false">托收明细表</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer1">1</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer2">2</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer3">3</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer4">4</div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-5" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div class="SearchContainer" id="TableContainer5">5</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight() {
                var AllHeight = $(window).height();
                var AllWidht = $(window).width();
                var TableHeight = $('#HeadTable').height();

                var DivHeight = AllHeight - TableHeight;
                $("#Divreport").css("width", AllWidht + "px");
                $("#Divreport").css("height", DivHeight + "px");

                var h = DivHeight - 68;

                $(".Frm").css({ "height": h + "px" });

                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer2").css("height", h + "px");
                $("#TableContainer3").css("height", h + "px");
                $("#TableContainer4").css("height", h + "px");
                $("#TableContainer5").css("height", h + "px");




                $("#TableContainer1").css("height", h + "px");
                $("#TableContainer2").css("height", h + "px");
                $("#TableContainer3").css("height", h + "px");
                $("#TableContainer4").css("height", h + "px");
                $("#TableContainer5").css("height", h + "px");

                if ($("#IsAuditing24").val() == "1")
                {
                    $('#EditBeginDate').attr("disabled","disabled")
                }
               
            }
            InitTableHeight();
          
            $(".tabs-container li").click(function () {
               



                $('#tab-1').attr("class", "tab-pane");
                $('#tab-2').attr("class", "tab-pane");
                $('#tab-3').attr("class", "tab-pane");
                $('#tab-4').attr("class", "tab-pane");
                $('#tab-5').attr("class", "tab-pane");

                $('#jjbb').attr("refsel", "0");
                $('#pjhz').attr("refsel", "0");
                $('#pjmx').attr("refsel", "0");
                $('#fymx').attr("refsel", "0");
                $('#tsmx').attr("refsel", "0");


                $('#jjbb').attr("class", "");
                $('#pjhz').attr("class", "");
                $('#pjmx').attr("class", "");
                $('#fymx').attr("class", "");
                $('#tsmx').attr("class", "");


                switch ($(this).attr("name")) {
                   
                    case "jjbb":
                      
                        $('#tab-1').attr("class", "tab-pane active");
                        $('#jjbb').attr("refsel", "1");
                        $('#jjbb').attr("class", "active");
                        LoadPayment();
                        break;
                    case "pjhz":
                     
                        $('#tab-2').attr("class", "tab-pane active");
                        $('#pjhz').attr("refsel", "1");
                        $('#pjhz').attr("class", "active");
                        LoadBill();
                        break;
                    case "pjmx":
                       
                        $('#tab-3').attr("class", "tab-pane active");
                        $('#pjmx').attr("refsel", "1");
                        $('#pjmx').attr("class", "active");
                        LoadRece();
                        break;
                    case "fymx":
                        
                        $('#tab-4').attr("class", "tab-pane active");
                        $('#fymx').attr("refsel", "1");
                        $('#fymx').attr("class", "active");
                       LoadDetail();
                        break;
                    case "tsmx":
                        
                        $('#tab-5').attr("class", "tab-pane active");
                        $('#tsmx').attr("refsel", "1");
                        $('#tsmx').attr("class", "active");
                        LoadConSign();
                        break;

                }


            });

            $('#btnCre').click(function () {

                $(".tabs-container li").each(function (index, item) {

                    $(item).attr("refsel", "0");
                    $(item).attr("class", "");
                    if ($(item).attr("name") == "jjbb")
                    {
                        $(item).attr("refsel", "1");
                        $(item).attr("class", "active");
                    }
                });

                $('#tab-1').attr("class", "tab-pane active");
                $('#tab-2').attr("class", "tab-pane");
                $('#tab-3').attr("class", "tab-pane");
                $('#tab-4').attr("class", "tab-pane");
                $('#tab-5').attr("class", "tab-pane");
                $('#EditBeginDate').removeAttr("disabled")

                $.tool.DataPost('FeesPayment', 'FeesPaymentCre', $('#frmForm').serialize(),
                  function Init() {

                  },
                  function callback(_Data) {
                      var Data = _Data.split('|');
                      if (Data[0] == "true") {

                      

                          var dData = Data[1].split(',');
                          HDialog.Info(dData[0]);

                          $('#PayID').val(dData[1]);

                          $('#lbBeginDate').html(dData[2]);
                          $('#lbEndDate').html(dData[3]);
                          $('#lbPayAmount').html(dData[4]);
                          $('#lbPayDate').val(dData[5]);
                          $('#TotalSumAmount').val(dData[4]);

                          $('#Divreport').layout('panel', 'center').panel({ title: '交款报表<span style=\'color:red\'>(时间从' + dData[2] + '到' + dData[3] +')</span>'});

                          LoadPayment();

                        if ($("#IsAuditing24").val() == "1")
                        {
                            $('#EditBeginDate').attr("disabled","disabled")
                        }
                      }
                      else {
                          HDialog.Info(Data[1]);

                           if ($("#IsAuditing24").val() == "1")
                            {
                                $('#EditBeginDate').attr("disabled","disabled")
                            }
                      }




                  },
                  function completeCallback() {
                  },
                  function errorCallback() {

                  });
            });
            
            var Paymentcolumn = [[
                { field: 'CorpCostName', title: '费用大项', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'TotalAmount', title: '合计', width: 100, align: 'left', sortable: true },
                { field: 'ChargeAmount', title: '实收', width: 100, align: 'left', sortable: true },
                { field: 'OffsetPrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款', width: 100, align: 'left', sortable: true },
                { field: 'BeforePrecAmount', title: '前期预交余额', width: 100, align: 'left', sortable: true },
                { field: 'CurrPrecAmount', title: '本期预交收款', width: 100, align: 'left', sortable: true },
                { field: 'RefundPrecAmount', title: '本期预交退款', width: 100, align: 'left', sortable: true },
                { field: 'OffsetPrecTotalAmount', title: '本期预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'AfterPrecAmount', title: '期末预交余额', width: 100, align: 'left', sortable: true },
                { field: 'PerSurplusAmount', title: '本期零头结转', width: 100, align: 'left', sortable: true },
                { field: 'ExpenseAmount', title: '本期付款', width: 100, align: 'left', sortable: true }
                ]]

            var Billcolumn = [[
               { field: 'BillTypeName', title: '票据类别', width: 100, align: 'left', sortable: true },
               { field: 'UserCaseName', title: '使用方式', width: 100, align: 'left', sortable: true },
                 { field: 'BillNum', title: '数量', width: 100, align: 'left', sortable: true },
               { field: 'BillsSigns', title: '摘要', width: 100, align: 'left', sortable: true },
            ]]
            var Rececolumn = [[
               { field: 'ReceTypeName', title: '票据来源', width: 100, align: 'left', sortable: true },
               { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
               { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
               { field: 'BillsSign', title: '票据号码', width: 100, align: 'left', sortable: true },
               { field: 'EInvoiceNos', title: '电子发票号', width: 100, align: 'left', sortable: true },
               {
                   field: 'BillsDate', title: '收款时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                       var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                       return str;
                   }
               },
               { field: 'ChargeModes', title: '收款方式', width: 100, align: 'left', sortable: true },
               { field: 'BillsAmount', title: '票据金额', width: 100, align: 'left', sortable: true },
               { field: 'PerSurplus', title: '结余金额', width: 100, align: 'left', sortable: true },
               { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
               { field: 'ReceMemo', title: '备注', width: 100, align: 'left', sortable: true }
            ]]
            var Detailcolumn = [[
              { field: 'ReceTypeName', title: '票据来源', width: 100, align: 'left', sortable: true },
               { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
               { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
               { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
               {
                   field: 'ChargeDate', title: '收款时间', width: 180, align: 'left', sortable: true, formatter: function (value, row, index) {

                       var str = formatDate(row.ChargeDate, "yyyy-MM-dd HH:mm:ss");
                       return str;
                   }
               },
                { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true },
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
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '收款金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidLateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'CommisionCostName', title: '佣金费用名称', width: 100, align: 'left', sortable: true },
                { field: 'CommissPaidAmount', title: '佣金收款金额', width: 100, align: 'left', sortable: true },
                { field: 'CommissPaidLateFeeAmount', title: '佣金合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'UserName', title: '收款人', width: 100, align: 'left', sortable: true },
                { field: 'ChargeMode', title: '收款方式', width: 100, align: 'left', sortable: true },
                { field: 'IsPropertyName', title: '是否垫付回收', width: 100, align: 'left', sortable: true },
                { field: 'OFeesMemo', title: '备注', width: 100, align: 'left', sortable: true }
                
            ]]
            var ConSigncolumn = [[
                { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
                //{ field: 'EInvoiceNos', title: '电子发票号', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '收款金额', width: 100, align: 'left', sortable: true },
                {
                    field: 'BillsDate', title: '托收时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.BillsDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'UserName', title: '托收人', width: 100, align: 'left', sortable: true },
                {
                    field: 'ConfirmBillsDate', title: '收款时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ConfirmBillsDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'ConfirmUserName', title: '收款人', width: 100, align: 'left', sortable: true },
                {
                    field: 'DelBillsDate', title: '撤销时间', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.DelBillsDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'DelUserName', title: '撤销人', width: 100, align: 'left', sortable: true },
                { field: 'IsSuccName', title: '是否已托收', width: 100, align: 'left', sortable: true }
               
            ]]
            var toolbar1 = [ {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var data = $("#TableContainer1").datagrid('getData');
                        if (data.rows.length>0) {
                            window.location.href = "../NoticesNew/FeesPaymentCre.aspx";
                        }
                       
                    }
                }
            ];
            var toolbar2 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer2").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentBillCre.aspx";
                    }
                }
            }
            ];
            var toolbar3 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer3").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentReceCre.aspx";
                    }
                }
            }
            ];
            var toolbar4 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer4").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentDetailCre.aspx";
                    }
                }
            }
            ];
            var toolbar5 = [{
                text: 'Excel输出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    var data = $("#TableContainer5").datagrid('getData');
                    if (data.rows.length > 0) {
                        window.location.href = "../NoticesNew/FeesPaymentConSignCre.aspx";
                    }
                }
            }
            ];
            function LoadPayment() {

                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Paymentcolumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar1,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesPayment", "LoadPayment", "TableContainer1", param);
                    }
                });
            }
            function LoadBill() {
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Billcolumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar2,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesPayment", "LoadBill", "TableContainer2", param);
                    }
                });
            }
            function LoadRece() {
                $("#TableContainer3").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Rececolumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar3,
                    width:'100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        
                        param = $.JQForm.GetParam("FeesPayment", "LoadRece", "TableContainer3", param);
                    }
                });
            }
            function LoadDetail() {
                
                $("#TableContainer4").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Detailcolumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar4,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                       
                        param = $.JQForm.GetParam("FeesPayment", "LoadDetail", "TableContainer4", param);
                    }
                });
            }
            function LoadConSign() {
                $("#TableContainer5").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: ConSigncolumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar5,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        
                        param = $.JQForm.GetParam("FeesPayment", "LoadConSign", "TableContainer5", param);
                    }
                });
            }
            LoadPayment();
            $('#btnSelPeriod').click(function () {


                HDialog.Open('500', '320', '../dialogNew/PaymentNoPeriodDlg.aspx', '未交款期间', false, function (_Data) {
                    obj = JSON.parse(_Data);
                    $('#EditBeginDate').val(obj.BeginDate);
                    $('#EditEndDate').val(obj.EndDate);
                });
            });

            $('#btnOk').click(function () {
                if ($('#PayID').val() == '' || $('#PayID').val() == '0') {
                    HDialog.Info('请先生成交款报表，再提交交款申请');
                }
                else if ($('#hiPaymentMethods').val()=="") {
                    HDialog.Info("请选择交款方式,此项不能为空!");
                }
                else {

                    $.tool.DataPost('FeesPayment', 'FeesPaymentSub', $('#frmForm').serialize(),
                 function Init() {

                 },
                 function callback(_Data) {
                     var Data = _Data.split('|');
                    
                     if (Data[0] == "true") {

                         window.location.href = 'NewFeesPaymentApply.aspx?PayID=' + $('#PayID').val();
                     }
                     else {
                         if (Data[1] != "") {
                             HDialog.Info(Data[1]);
                         }
                     }

                 },
                 function completeCallback() {
                 },
                 function errorCallback() {

                 });
                }
            });

            $('#btnSelPaymentMethod').click(function () {
                if ($('#PayID').val() == '' || $('#PayID').val() == '0') {
                    HDialog.Info('请先生成交款报表');
                }
                else { 

                    HDialog.Open('650', '430', '../dialogNew/PaymentMethodMulDlg.aspx?TotalAmount=' + $('#TotalSumAmount').val(), '交款方式', false, function (_Data) {
                 
                        var varObjects = _Data.split("\t");

                        $('#PaymentMethods').val(varObjects[0]);
                        $('#hiPaymentMethods').val(varObjects[1]);
                        $('#PaymentMethodAmount').val(varObjects[2]);

                    });
                }

            });

            function SearchDetail()
            {
                HDialog.Info('交款报表提交成功！');

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../NoticesNew/FeesPaymentDetail.aspx?PayID=' + $('#PayID').val(), '交款明细', false, function callback(_Data) {
                    $('#PayID').val('0');
                    LoadPayment();
                });
                $('#PayID').val('0');
                LoadPayment();
            }
        </script>
    </form>
</body>
</html>
