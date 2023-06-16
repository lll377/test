<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCPushFeesRefundBrowse.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCPushFeesRefundBrowse" %>


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
        <input id="BatchCode" type="hidden" size="1" name="BatchCode" runat="server" />
        <input id="IsRefer" type="hidden" size="1" name="IsRefer" runat="server" value="0"/>
        <table class="DialogTable" id="HeadTable" name="HeadTable" style="width: 100%;">
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">生成退款单</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="height: 24px; line-height: 24px;">退款时间从</td>
                <td class="TdContent" style="height: 24px; line-height: 24px;">
                    <input id="EditBeginDate" style="height: 24px; line-height: 24px;" class="Wdate" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditBeginDate" runat="server" /></td>
                <td class="TdTitle" style="height: 24px; line-height: 24px;">到</td>
                <td class="TdContent" style="height: 24px; line-height: 24px;">
                    <input id="EditEndDate" style="height: 24px; line-height: 24px;" class="Wdate" onclick="WdatePicker({startDate:'%y-%M-%d 23:59:59',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditEndDate" runat="server" /></td>
            </tr>          
            <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">                     
                    <input class="button" id="btnCre" type="button" value="查询生成" name="btnCre" runat="server" />
                    &nbsp;&nbsp;
                    <input class="button" id="btnOk"  type="button" value="确认提交" name="btnOk" runat="server">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 12px"></td>
            </tr>           
            <tr>
                <td align="center" colspan="4">
                    
                </td>
            </tr>           
        </table>
        <div id="Divreport" name="Divreport" class="easyui-layout">
             <div data-options="region:'center',title:'退款单'" style="background: #ffffff; border: hidden">
               <div class="SearchContainer" id="TableContainer"></div>
            </div>
        </div>
        <script type="text/javascript">
            function InitTableHeight()
            {
                var AllHeight = $(window).height();
                var AllWidht = $(window).width();
                var TableHeight = $('#HeadTable').height();

                var DivHeight = AllHeight - TableHeight;
                $("#Divreport").css("width", AllWidht + "px");
                $("#Divreport").css("height", DivHeight + "px");

                var h = DivHeight - 30;

                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            $('#btnCre').click(function () {

                $.tool.DataPost('LJTH_NCPushFees', 'RefundCre', $('#frmForm').serialize(),
                  function Init() {

                  },
                  function callback(_Data) {
                      var Data = _Data.split('|');
                      if (Data[0] == "true") {
                          
                          HDialog.Info(Data[1]);

                          $('#BatchCode').val(Data[2]);
                          
                          setTimeout(function () { LoadList(); }, 1000);
                          
                      }
                      else {
                          HDialog.Info(Data[1]);
                      }

                  },
                  function completeCallback() {
                  },
                  function errorCallback() {

                  });
            });
            
            var column = [[
                { field: 'PushTypeName', title: '退款单类别', width: 100, align: 'left', sortable: true },
                { field: 'ChargeModeName', title: '结算方式', width: 100, align: 'left', sortable: true },
                {
                    field: 'PushDate', title: '推送时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('推送明细','" + row.PushID + "');\">" + formatDate(row.PushDate, "yyyy-MM-dd HH:mm:ss") + "</a>";
                        return str;
                    }
                },
                { field: 'PushUserName', title: '推送人', width: 100, align: 'left', sortable: true },
                {
                    field: 'BeginDate', title: '开始时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.BeginDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                {
                    field: 'EndDate', title: '结束时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.EndDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'PushAmount', title: '发生额', width: 80, align: 'left', sortable: true },
                { field: 'PushMemo', title: '备注', width: 100, align: 'left', sortable: true },
                { field: 'IsSendName', title: '是否推送', width: 50, align: 'left', sortable: true },
                {
                    field: 'SendDate', title: '推送时间', width: 120, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.SendDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'ResultCodeName', title: '是否成功', width: 50, align: 'left', sortable: true },
                { field: 'ResultMessage', title: '返回信息', width: 200, align: 'left', sortable: true }
               
            ]];

            function LoadList() {

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("LJTH_NCPushFees", "LoadPushRefHead", "TableContainer", param);
                    }
                });
            }

            LoadList();

            $('#btnOk').click(function () {
                if ($('#BatchCode').val() == '') {
                    HDialog.Info('请先生成，再确认提交');
                }
                else {

                    $.tool.DataPost('LJTH_NCPushFees', 'PushRefundSub', $('#frmForm').serialize(),
                 function Init() {

                 },
                 function callback(_Data) {
                     var Data = _Data.split('|');
                    
                     if (Data[0] == "true") {

                         if (Data[1] != "") {
                             HDialog.Info(Data[1]);
                         }
                         LoadList();
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

            function ViewDetail(title, PushID) {
                var w = $(window).width();
                var h = $(window).height()+100;
                HDialog.Open(w, h, '../UFLJTH_NCVoucher/LJTH_NCPushFeesRefundEntryDetail.aspx?PushID=' + PushID, '推送明细', false, function callback(_Data) {
                    LoadList();
                });
            }
        </script>
    </form>
</body>
</html>
