<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCPushFeesRefundEntryDetail.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCPushFeesRefundEntryDetail" %>


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
        <input id="PushID" type="hidden" size="1" name="PushID" runat="server" />
        <input id="PushSetType" type="hidden" size="1" name="PushSetType" runat="server" value="1"/>
        <input id="TotalSumAmount" type="hidden" size="1" name="TotalSumAmount" runat="server" />

        <table class="DialogTable" id="HeadTable" name="HeadTable" style="width: 100%;">            
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">推送单</span> </td>
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
             <TR>
			    <TD class="TdTitle" >备注</TD>
			    <TD class="TdContent" colspan="3">
				    <asp:label id="lbPushMemo" runat="server"></asp:label></TD>
		    </TR>
           <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">提交结果</span> </td>
            </tr>
             <tr>
                <td class="TdTitle">返回信息</td>
                <td class="TdContent" colspan="3">
                    <span id="lbResultCode" name="lbResultCode" runat="server"></span>
                    <span id="lbResultMessage" name="lbResultMessage" runat="server"></span>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 6px"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn"
                                                                    runat="server">
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

            $('#btnReturn').click(function () {

                HDialog.Close(1);
            });

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

            
            var EntryColumn = [[
                { field: 'Entry_ID', title: '分录号', width: 100, align: 'left', sortable: true },
                { field: 'BusinessNo', title: '单据编号', width: 300, align: 'left', sortable: true },
                { field: 'BusinessTitle', title: '单据标题', width: 300, align: 'left', sortable: true },
                { field: 'ApplyAmount', title: '支付金额', width: 100, align: 'left', sortable: true },
                { field: 'ApplyDate', title: '单据申请时间', width: 100, align: 'left', sortable: true },
                { field: 'AccountBodyName', title: '核算主体', width: 100, align: 'left', sortable: true },
                { field: 'ActuallyBodyName', title: '实际承担主体', width: 400, align: 'left', sortable: true }
                ]]

            var toolbar1 = [ {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var data = $("#TableContainer1").datagrid('getData');
                        if (data.rows.length>0) {
                            window.location.href = "../UFLJTH_NCVoucher/LJTH_NCPushRefundEntryCre.aspx?PushID=" + $('#PushID').val();
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

                        param = $.JQForm.GetParam("LJTH_NCPushFees", "LoadPushRefEntry", "TableContainer1", param);
                    }
                });
            }
            LoadEntry();

        </script>
    </form>
</body>
</html>
