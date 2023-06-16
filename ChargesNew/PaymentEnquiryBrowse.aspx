<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentEnquiryBrowse.aspx.cs" Inherits="M_Main.ChargesNew.PaymentEnquiryBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>微信订单</title>
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
</head>
<body>
    <form id="BankCustSurrBrowse" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
           <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 580px; height: 120px; padding: 10px;">
            <table id="tabtishi" cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red;display:none;'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、主动缴费时指客户通过网站、APP、微信等渠道自助查费、缴费的方式，物管通过本模块查询业主主动缴费缴费结果。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、主动缴费失败后，须取消后方可再次缴费。
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 220px; padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">
                <tr>
                    <td class="TdTitle">是否成功</td>
                    <td class="TdContentSearch">
                        <select class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" id="IsSucc" name="IsSucc" runat="server">
                            <option selected="selected"></option>
                            
                        </select></td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                       <input id="CustomerName" style="width: 83%;" class="easyui-validatebox"  name="CustomerName" runat="server">
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">订单时间从</td>
                    <td class="TdContentSearch">
                        <input id="BeginDate1" style="width: 83%;" class="easyui-datebox" data-options="editable:false" name="BeginDate1" runat="server"></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="BeginDate2" style="width: 83%;" class="easyui-datebox" data-options="editable:false" name="BeginDate2" runat="server"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">清&nbsp;&nbsp;空</a>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();

    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
    }

    var toolbar = [
        //{
        //    text: '刷新订单',
        //    iconCls: 'icon-reload',
        //    handler: function () {
        //        var row = $("#TableContainer").datagrid("getSelected");
        //        if (row == null) {
        //            HDialog.Info("请选择订单");
        //            return;
        //        }
        //        RefreshOrder(row);
        //    }
        //}, '-',
        {
            text: '下帐',
            iconCls: 'icon-undo',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info("请选择订单");
                    return;
                }
                UnderAccount(row);
            }
        }, '-',
        //{
        //        text: '取消订单',
        //        iconCls: 'icon-cancel',
        //        handler: function () {
        //            var row = $("#TableContainer").datagrid("getSelected");
        //            if (row == null) {
        //                HDialog.Info("请选择订单");
        //                return;
        //            }
        //            CancelOrder(row);
        //        }
        //    }, '-',
        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
        }, '-'
        , {
            text: '导出Excel',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                var IsSucc = $("#IsSucc").combobox("getValue");
                var CustomerName = $("#CustomerName").val();
                var BeginDate1 = $("#BeginDate1").datebox("getValue");
                var BeginDate2 = $("#BeginDate2").datebox("getValue");
                window.open("../ChargesNew/PaymentEnquiryBrowseExcel.aspx?IsSucc=" + IsSucc + "&CustomerName=" + CustomerName + "&BeginDate1=" + BeginDate1 + "&BeginDate2=" + BeginDate2);
            }
        }
    ];


    var Column =
        [[
            { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
            { field: 'OrderSN', title: '订单号', width: 100, align: 'left', sortable: true },
            {
                field: 'PayTime', title: '交易时间', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.PayTime, "yyyy-MM-dd HH:mm:ss");
                    return str;
                }
            },
            { field: 'DueAmount', title: '应付总金额', width: 100, align: 'left', sortable: true },
            { field: 'PaidAmount', title: '已支付金额', width: 100, align: 'left', sortable: true },
            {
                field: 'IsSuccName', title: '是否下帐', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    if (row.StateName == "已支付已下账") {
                        return '是';
                    } else {
                        return '否';
                    }
                }
            },
            { field: 'StateName', title: '交易状态', width: 100, align: 'left', sortable: true }

        ]]
    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: Column,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: '100%',
            sortOrder: "asc",
            toolbar: toolbar,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("BankAgentSet", "SearchBankWeiXinPaySearch", "TableContainer", param);
            }
            //,
            //onDblClickRow: function (rowIndex, rowData) {
                
            //    HDialog.Open(w, h, '../ChargesNew/BankCustSurrWeiXinPayDetail.aspx?orderId=' + rowData.Id + "&PrecAmount=" + rowData.PrecAmount, "费用详情", false, function callback(_Data) {
            //        if (_Data == "true") {
            //            LoadList();
            //        }
            //    });
            //}
        });
        $('#SearchDlg').dialog('close');
    }

    //下帐
    function UnderAccount(row) {
        if (row.IsSuccName == '是') {
            HDialog.Info("此订单已下帐");
            return;
        }
        if (row.IsDeleteName == '是') {
            HDialog.Info("已取消的订单无法下帐");
            return;
        }

        $.messager.confirm('确定', '是否执行下帐操作', function (r) {
            if (r) {
                var operationType = '';
                if (ToDecimal(row.PrecAmount, 2)>0) {//预存
                    operationType = 'prestore';
                }
                if (ToDecimal(row.PrecAmount, 2) <= 0) {//实收
                    operationType = 'receipts';
                }
                $.tool.DataPost('BankAgentSet', 'WeiXinUnderAccount', 'Id=' + row.out_trade_no + '&Comid=' + row.CommunityId + '&respCode=' + row.respCode + '&respMsg=' + row.respMsg + '&operationType=' + operationType,
                              function Init() {
                              },
                              function callback(_Data) {
                                  LoadList();
                                  //var macstr = JSON.stringify(_Data);
                                  //if (macstr == "success") {
                                  //    HDialog.Info("下帐成功");
                                  //    //刷新列表
                                  //    LoadList();
                                  //} else {
                                  //    HDialog.Info(macstr);
                                  //}
                              },
                              function completeCallback() {
                              },
                              function errorCallback() {
                              });
            }
        });
        }

    //取消下帐
    function NoReceProperyOrder(row) {
        if (row.IsSuccName == '否') {
            HDialog.Info("此订单未下帐");
            return;
        }

        $.messager.confirm('确定', '是否执行取消下帐操作', function (r) {
            if (r) {

                $.tool.DataPost('BankAgentSet', 'NoReceWeiXinOrder', 'Id=' + row.out_trade_no + '&Comid=' + row.CommunityId + '&respCode=' + row.respCode + '&respMsg=' + row.respMsg + '&operationType=1',
                      function Init() {
                      },
                      function callback(_Data) {
                          //刷新列表
                          LoadList();
                          //var macstr = JSON.stringify(_Data);
                          //if (_Data == "success") {
                          //    HDialog.Info("下帐成功");
                          //    //刷新列表
                          //    LoadList();
                          //} else {
                          //    HDialog.Info(macstr);
                          //}
                      },
                      function completeCallback() {
                      },
                      function errorCallback() {
                      });
            }
        });
    }




    //刷新订单
    function RefreshOrder(row) {
        if (row.IsSuccName == '是') {
            HDialog.Info("已下帐订单无法刷新");
            return;
        }
        if (row.IsDeleteName == '是') {
            HDialog.Info("已取消的订单无法刷新");
            return;
        }
        //if (row.Memo != '') {
        //    HDialog.Info("已下帐订单无法刷新");
        //    return;
        //}
        if (row.IsSuccName == '否' && row.IsDeleteName=='否') {
            HDialog.Info("刷新订单");            
            $.tool.DataPost('BankAgentSet', 'WeiXinRefreshOrder', 'Id=' + row.out_trade_no + '&Comid=' + row.CommID + '&respCode=' + row.return_code + '&respMsg=' + row.return_msg,
                       function Init() {
                       },
                       function callback(_Data) {
                           var macstr = JSON.stringify(_Data);
                           //alert(macstr);
                           //刷新列表
                           LoadList();
                       },
                       function completeCallback() {
                       },
                       function errorCallback() {
                       });
        }
    }
    //取消订单
    function CancelOrder(row) {

        if (row.IsDeleteName == '是') {
            HDialog.Info("该订单已取消");
            return;
        }
        if (row.IsSuccName == '是') {
            HDialog.Info("已下帐订单无法取消");
            return; 
        }
        //if (row.Memo != '') {
        //    HDialog.Info("已下帐订单无法取消");
        //    return; 
        //}
        $.messager.confirm('确定', '是否取消', function (r) {
            if (r) {
                $.tool.DataPost('BankAgentSet', 'WeiXinCancelOrder', 'Id=' + row.out_trade_no + '&Comid=' + row.CommID + '&respCode=' + row.respCode + '&respMsg=' + row.respMsg,
                        function Init() {
                        },
                        function callback(_Data) {
                            var str = JSON.parse(_Data);
                            if (str.Result == "true") {
                                LoadList();
                            }
                            else {
                                HDialog.Info(str.data);
                            }
                           
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }
        });

    }

    //清空条件
    function CancelParm() {
        $("#BeginDate1").datebox("setValue", '');
        $("#BeginDate2").datebox("setValue", '');
        $("#IsSucc").combobox('clear');
        
        $("#CustomerName").val("");
    }

    $("select").each(function () {
        var key = $(this).attr("id");
        $(this).css("width", '83%');
    });
</script>
