<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiversFeeSettlement.aspx.cs" Inherits="M_Main.ChargesNew.WaiversFeeSettlement" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>WaiversFeeSettlement</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

</head>
<body>
    <form id="FrmForm" runat="server" method="post">
                 <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="WaivID" type="hidden"  name="WaivID" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        
    </form>

</body>
</html>

<script type="text/javascript">
    var w = $(window.parent).width();
    var h = $(window.parent).height()-38;
  
    function InitTableHeight() {
       
        $("#TableContainer").css("height", h + "px");
    }
    InitTableHeight();
   
    var Column = [[

           {
               field: 'SettlementDate', title: '结算时间', align: 'left', sortable: true, width: 150
           },
           { field: 'BefourMoney', title: '结算前剩余金额', align: 'left', sortable: true, width: 200 },
           { field: 'ThisMoney', title: '本次结算金额', align: 'left', sortable: true, width: 100 },
           { field: 'LastMoney', title: '结算后剩余金额', align: 'left', sortable: true, width: 100 },
           
            { field: 'Memo', title: '备注', align: 'left', sortable: true, width: 120 }
    ]];

    var toolbar = [
         {
             text: '新增',
             iconCls: 'icon-add',
             handler: function () {
                 HDialog.Open(700, 300, '../ChargesNew/WaiversFeeSettlementManage.aspx?WaivID='+$('#WaivID').val()+'&OpType=Insert', '新增费用结算信息', false, function callback(_Data) {
                     LoadList();
                     window.parent.LoadLastMoney();
                 });
             }
         }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row != null) {
                        if (row.SettlementID != '') {
                            $.tool.DataPost('WaiversFees', "SettlementDel", "SettlementID=" + row.SettlementID + "&WaivID=" + $('#WaivID').val() + "&SettlementDate=" + row.SettlementDate,
                                 function Init() {
                                 },
                                 function callback(_Data) {
                                     var data = _Data.split('|');
                                     HDialog.Info(data[1]);
                                     if (data[0] == "true") {
                                         LoadList();
                                         window.parent.LoadLastMoney();
                                     }
                                    
                                 },
                                 function completeCallback() {
                                 },
                                 function errorCallback() {

                                 });
                        }
                        else {
                            HDialog.Info('请选择要删除的费用');
                        }
                    } else {
                        HDialog.Info('请选择要删除的费用');
                    }
                }
            }
    ];

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
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {

                param = $.JQForm.GetParam("WaiversFees", "WaivSettlementList", "TableContainer", param);
            }
        });
    }

    LoadList();


</script>
