<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDPushFeesDueBrowse.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDPushFeesDueBrowse" %>


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
        <input id="BeginDate" type="hidden" size="1" name="BeginDate" runat="server" />
        <input id="EndDate" type="hidden" size="1" name="EndDate" runat="server" />
        <input id="VID" type="hidden" size="1" name="VID" runat="server" />
        <input id="PushSetType" type="hidden" size="1" name="PushSetType" runat="server" value="1"/>
        <input id="TotalSumAmount" type="hidden" size="1" name="TotalSumAmount" runat="server" />

        <table class="DialogTable" id="HeadTable" name="HeadTable" style="width: 100%;">
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">生成应收凭证</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td class="TdTitle" >费用时间从</td>
                <td class="TdContent" >
                    <input id="EditBeginDate" style="height: 24px; line-height: 24px;width: 200px;" class="Wdate" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditBeginDate" runat="server" /></td>
                <td class="TdTitle" >到</td>
                <td class="TdContent" >
                    <input id="EditEndDate" style="height: 24px; line-height: 24px;width: 200px;" class="Wdate" onclick="WdatePicker({startDate:'%y-%M-%d 23:59:59',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="EditEndDate" runat="server" /></td>
            </tr>
             <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
             <tr>
                <td class="TdTitle" >类型</td>
                <td class="TdContent" ><SELECT id="PushType" name="PushType" runat="server">                                                                         
                        <OPTION value=""></OPTION>
                        <OPTION value="1">应收凭证</OPTION>
                        <OPTION value="2">减免凭证</OPTION>
					</SELECT> </td>
               
                <td class="TdTitle">会计年月</td>
                <td class="TdContentSearch"><SELECT id="FYear" name="FYear" runat="server">
													<OPTION selected></OPTION>
												</SELECT>年<SELECT id="FMonth" name="FMonth" runat="server">
														<OPTION selected></OPTION>
													</SELECT>月</td>
            </tr>
           <%-- <tr>
                 <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch">
                    <SELECT id="SelCostType" name="SelCostType" runat="server">
						<OPTION selected></OPTION>
                        <OPTION value="1">业主主管理费</OPTION>
                        <OPTION value="2">地产空置费</OPTION>
                        <OPTION value="3">创收合同款项</OPTION>
					</SELECT>
                </td>
                 <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>--%>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnCre" type="button" value="查询生成" name="btnCre" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 12px"></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">应收凭证</span> </td>
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
                <td class="TdTitle">借方</td>
                <td class="TdContent">
                    <span id="lbDebitAmount" name="lbDebitAmount" runat="server"></span>
                </td>
                <td class="TdTitle">贷方</td>
                <td class="TdContent">
                    <span id="lbCreditAmount" name="lbCreditAmount" runat="server"></span>
                </td>
                
            </tr>
            <tr>
                <td class="TdTitle">发 生 额</td>
                <td class="TdContent">
                    <span id="lbPushAmount" name="lbPushAmount" runat="server"></span>
                </td>
                <td class="TdTitle">生成时间</td>
                <td class="TdContent">
                    <span id="lbPushDate" name="lbPushDate" runat="server"></span>
                </td>
            </tr>
           
            <tr>
                <td colspan="4" style="height: 3px"></td>
            </tr>
            <tr>
                <td class="TdTitle">单据日期</td>
                <td class="TdContent" colspan="3">
                    <input id="BillDate" style="height: 24px; line-height: 24px;width: 200px;" class="Wdate" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" type="text" name="BillDate" runat="server" /></td>
            </tr>
          
            <tr>
                <td colspan="4" style="height: 6px"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnOk"  type="button" value="确认提交" name="btnOk" runat="server">
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">提交结果</span> </td>
            </tr>
             <tr>
                <td class="TdTitle">返回信息</td>
                <td class="TdContent" colspan="3">
                    <span id="lbResultMessage" name="lbResultMessage" runat="server"></span>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 6px"></td>
            </tr>
        </table>
        <div id="Divreport" name="Divreport" class="easyui-layout">
             <div data-options="region:'center',title:'明细'" style="background: #ffffff; border: hidden">
               <div class="SearchContainer" id="TableContainer1"></div>
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

                $("#TableContainer1").css("height", h + "px");
            }
            InitTableHeight();

            $('#btnCre').click(function () {

                $.tool.DataPost('UFJDPushFees', 'DueCre', $('#frmForm').serialize(),
                  function Init() {

                  },
                  function callback(_Data) {
                      var Data = _Data.split('|');
                      if (Data[0] == "true") {
                          
                          var dData = Data[1].split(',');
                          HDialog.Info(dData[0]);

                          $('#VID').val(dData[1]);
                          $('#lbBeginDate').html(dData[2]);
                          $('#lbEndDate').html(dData[3]);
                          $('#lbPushAmount').html(dData[4]);
                          $('#TotalSumAmount').val(dData[4]);

                          $('#lbCreditAmount').html(dData[5]);
                          $('#lbDebitAmount').html(dData[6]);

                          $('#lbPushDate').html(dData[7]);
                          $('#lbResultMessage').html(dData[8]);

                          LoadEntry();
                     
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
            
            var EntryColumn = [[
                { field: 'Entry_ID', title: '分录号', width: 100, align: 'left', sortable: true },
                { field: 'Abstract', title: '摘要', width: 400, align: 'left', sortable: true },
                { field: 'Account_Code', title: '科目编码', width: 300, align: 'left', sortable: true },
                { field: 'DispName', title: '科目名称', width: 300, align: 'left', sortable: true },

                { field: 'Auxiliary_Name', title: '辅助核算', width: 300, align: 'left', sortable: true },
                { field: 'Primary_Debit_Amount', title: '借方', width: 100, align: 'left', sortable: true },
                { field: 'Primary_Credit_Amount', title: '贷方', width: 100, align: 'left', sortable: true }
                
                ]]

            var toolbar1 = [ {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var data = $("#TableContainer1").datagrid('getData');
                        if (data.rows.length>0) {
                            window.location.href = "../UFJDVoucher/UFJDPushEntryCre.aspx?VID=" + $('#VID').val();
                        }
                       
                    }
                },'-',
                {
                    text: '下载文件',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var data = $("#TableContainer1").datagrid('getData');
                        if (data.rows.length>0) {
                            window.location.href = "../UFJDVoucher/UFJDPushEntryFilesCre.aspx?VID=" + $('#VID').val();
                        }
                       
                    }
                }
            ];
            
            function LoadEntry() {

                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: EntryColumn,
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

                        param = $.JQForm.GetParam("UFJDPushFees", "LoadPushEntry", "TableContainer1", param);
                    }
                });
            }
            LoadEntry();

            $('#btnOk').click(function () {
                if ($('#VID').val() == '' || $('#VID').val() == '0') {
                    HDialog.Info('请先生成，再确认提交');
                }
                else {

                    $.tool.DataPost('UFJDPushFees', 'PushSub', $('#frmForm').serialize(),
                 function Init() {

                 },
                 function callback(_Data) {
                     var Data = _Data.split('|');
                    
                     if (Data[0] == "true") {
                         
                         $('#lbResultMessage').html(Data[1]);
                         
                         LoadEntry();

                         HDialog.Info(Data[1]);
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
            
            
        </script>
    </form>
</body>
</html>
