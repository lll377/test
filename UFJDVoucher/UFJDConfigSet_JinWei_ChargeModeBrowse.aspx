<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDConfigSet_JinWei_ChargeModeBrowse.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDConfigSet_JinWei_ChargeModeBrowse" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 500px; height: 200px; padding: 10px;">

            <table class="DialogTable" style="width: 100%">                 
                <tr>
                    <td class="TdTitle">收款方式</td>
                    <td class="TdContent" colspan="3">
                        <input id="ChargeMode" name="ChargeMode" maxlength="50"  style="width: 90%; " />
                    </td>
                </tr>               
                 <tr>
                    <td class="TdTitle">结算方式</td>
                    <td class="TdContent" colspan="3">
                        <input id="ChargeModeName" name="ChargeModeName" maxlength="50" style="width: 90%; " />                       
                    </td>
                 </tr>
                  <tr>
                       <td  colspan="4" align="center">
                     <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                     </td>
                </tr>
            </table>
        </div>

        <script type="text/javascript">
            var column = [[
                { field: 'ConfigID', title: 'ConfigID', width: 50, align: 'left', sortable: true, hidden: true },                        
                {
                    field: 'ChargeMode', title: '收款方式', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改设置','update'," + row.ConfigID + ");\">" + row.ChargeMode + "</a>";
                            return str;
                        }
                },                
                { field: 'ChargeModeCode', title: '结算方式编码', width: 100, align: 'left', sortable: true },
                { field: 'ChargeModeName', title: '结算方式名称', width: 100, align: 'left', sortable: true },
                { field: 'AccSubjCode', title: '科目编码', width: 100, align: 'left', sortable: true },
                { field: 'AccSubjName', title: '科目名称', width: 100, align: 'left', sortable: true },              
                { field: 'TaxRate', title: '手续费', width: 100, align: 'left', sortable: true },
                { field: 'TaxAccSubjCode', title: '科目(手续费)编码', width: 100, align: 'left', sortable: true },
                { field: 'TaxAccSubjName', title: '科目(手续费)名称', width: 100, align: 'left', sortable: true },
                { field: 'BankAccountCode', title: '银行账户编码', width: 100, align: 'left', sortable: true },
                { field: 'BankAccountNum', title: '银行账户', width: 100, align: 'left', sortable: true },
                { field: 'BankAccountName', title: '银行账户名称', width: 100, align: 'left', sortable: true },
                { field: 'CashFlowCode', title: '现金流量编码', width: 100, align: 'left', sortable: true },
                { field: 'CashFlowName', title: '现金流量名称', width: 100, align: 'left', sortable: true }

            ]];            

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            var toolbar = [
                 {
                     text: '新增',
                     iconCls: 'icon-add',
                     handler: function () {
                         ViewDetail("结算方式设置", 'add', 0);
                     }
                 }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row != undefined && row != null) {
                            DelRecord(row.ConfigID);
                        }
                    }
                }, '-',

                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');                            
                    }
                }
                ,'-',
                    {
                        text: 'Excel导入',
                        iconCls: 'icon-page_white_excel',
                        handler: function () {
                             HDialog.Open(770, 400, '../UFJDVoucher/UFJDConfigSet_JinWei_ChargeModeExcelInput.aspx', '批量导入信息', false, function callback(_Data) {
                                if (_Data == "true") {
                                    LoadList();
                                }
                            });
                        }
                }
            ];

            LoadList();

            function DelRecord(Id) {
                HDialog.Prompt('是否删除该项', function () {
                    $.tool.DataGet('UFJDConfigChargeMode', 'delete', 'ConfigID=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {

                            var varObjects = _Data.split("|");

                            if (varObjects[0] == "true") {
                                HDialog.Info(varObjects[1]);
                            }
                            else { HDialog.Info('删除失败,' + varObjects[1]); }
                            LoadList();


                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                    
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=UFJDConfigChargeMode&Command=List&' + $("#frmForm").serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    remoteSort: false,
                    onLoadSuccess: function (data) {

                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function ViewDetail(title, OpType, ID) {
                var vPK_CORP = $('#PK_CORP').val();

                HDialog.Open('800', '400', '../UFJDVoucher/UFJDConfigSet_JinWei_ChargeModeManage.aspx?ConfigID=' + ID + '&OpType=' + OpType, title, true, function callback(_Data) {
                    //if (_Data == "true") {
                        LoadList();
                    //}
                   
                });
            }
        </script>
    </form>
</body>
</html>
