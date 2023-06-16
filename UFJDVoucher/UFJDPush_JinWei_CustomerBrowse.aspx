<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDPush_JinWei_CustomerBrowse.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDPush_JinWei_CustomerBrowse" %>


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
        <input id="SendID" type="hidden" size="1" name="SendID" runat="server" />
        <input id="IsSynch" type="hidden" size="1" name="IsSynch" runat="server" value="0" />
        <table class="DialogTable" id="HeadTable" name="HeadTable" style="width: 100%;">
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">生成同步客户</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
             <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent"><input id="CustName"
                    type="text"  name="CustName" runat="server" />    
                </td>
                <td class="TdTitle">客商名称</td>
                <td class="TdContent"><input id="UFCustName"
                    type="text"  name="UFCustName" runat="server" />    
                </td>
            </tr>
             <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td class="TdTitle" >客户类别</td>
                <td class="TdContent" ><input id="CustTypeName"
                    type="text"  name="CustTypeName" runat="server" /></td>
                <td class="TdTitle" >公司</td>
                <td class="TdContent" ><input id="UFCorpName"
                    type="text"  name="UFCorpName" runat="server" /></td>
            </tr>            
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnCre" type="button" value="查询生成" name="btnCre" runat="server" />
                </td>
            </tr>           
            <tr>
                <td colspan="4" style="height: 6px"></td>
            </tr>
            <tr>
                <td class="TdTitle">生成数量</td>
                <td class="TdContent">
                    <span id="lbPushCounts" name="lbPushCounts" runat="server"></span>
                </td>
                <td class="TdTitle">生成时间</td>
                <td class="TdContent">
                    <span id="lbPushDate" name="lbPushDate" runat="server"></span>
                </td>
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
               
                $.tool.DataPost('UFJDPushFees_JinWei', 'CustCre', $('#frmForm').serialize(),
                  function Init() {

                  },
                    function callback(_Data) {
                      
                      var Data = _Data.split('|');
                      if (Data[0] == "true") {
                          
                          var dData = Data[1].split(',');
                          HDialog.Info(dData[0]);

                          $('#SendID').val(dData[1]);    
                          $('#lbPushCounts').html(dData[2]); 
                          $('#lbPushDate').html(dData[3]);                          
                          $('#lbResultMessage').html(dData[4]);

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
                { field: 'ConfigID', title: 'ConfigID', width: 50, align: 'left', sortable: true, hidden: true }, 
                { field: 'CommName', title: '管理项目', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 300, align: 'left', sortable: true },
                { field: 'UFCustCode', title: '客商编码', width: 150, align: 'left', sortable: true },
                { field: 'UFCustName', title: '客商名称', width: 300, align: 'left', sortable: true },
                { field: 'CustTypeName', title: '客商类别', width: 100, align: 'left', sortable: true },
                { field: 'UFCorpName', title: '公司', width: 300, align: 'left', sortable: true },
                { field: 'IsSynchName', title: '是否同步', width: 100, align: 'left', sortable: true },
                
                ]]

            var toolbar1 = [ 
                //{
                //    text: '下载文件',
                //    iconCls: 'icon-page_white_excel',
                //    handler: function () {
                //        var data = $("#TableContainer1").datagrid('getData');
                //        if (data.rows.length>0) {
                //            window.location.href = "../UFJDVoucher/UFJDPushCustomerCre.aspx"
                //                + "?CustName=" + escape($('#CustName').val())
                //                + "&UFCustName=" + escape($('#UFCustName').val())
                //                + "&CustType=" + escape($('#CustType').val())
                //                + "&UFCorpName=" + escape($('#UFCorpName').val());
                //        }
                //    }
                //}
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

                        param = $.JQForm.GetParam("UFJDPushFees_JinWei", "LoadCust", "TableContainer1", param);
                    }
                });
            }
            LoadEntry();

           
            $('#btnOk').click(function () {
                
                if ($('#SendID').val() == '' || $('#SendID').val() == '0') {
                    HDialog.Info('请先生成，再确认提交');
                }
                else {

                    $.tool.DataPost('UFJDPushFees_JinWei', 'PushSubCust', $('#frmForm').serialize(),
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
