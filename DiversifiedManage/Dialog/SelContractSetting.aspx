<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelContractSetting.aspx.cs" Inherits="M_Main.DiversifiedManage.Dialog.SelContractSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择合同标准</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />
    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .toolbartable {
            margin: 0px 10px;
            padding: 0;
        }

            .toolbartable tr {
            }

                .toolbartable tr td {
                    padding: 5px 3px;
                }
    </style>
</head>
<body>
    <div id="toolbar" class="easyui-panel" data-options="closed:true">
        <form id="mainForm">
            <table class="toolbartable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>客户名称</span></td>
                    <td class="text">
                        <input id="CustName" name="CustName" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td class="title"><span>房屋编号</span></td>
                    <td class="text">
                        <input id="RoomSign" name="RoomSign" class="easyui-textbox" data-options="
                        icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).textbox('clear');
                            }}] " />
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:false,width:80" onclick="InitDataGrid();">筛选</a>
                    </td>
                    <td>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:false,width:80" onclick="Save();">保存</a>

                    </td>
                </tr>
            </table>
        </form>
    </div>
    <table id="dg" border="0" cellspacing="0" cellpadding="0"></table>
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <input type="hidden" id="ContractID" name="ContractID" runat="server" />
    <input type="hidden" id="ChargeCalculation" name="ChargeCalculation" runat="server" />
    <script language="javascript" type="text/javascript">
        $(function () {
            var CommID = $.getUrlParam("CommID");
            var ContractID = $.getUrlParam("ContractID");
            var ChargeCalculation = $.getUrlParam("ChargeCalculation");
            $('#CommID').val(CommID);
            $('#ContractID').val(ContractID);
            $('#ChargeCalculation').val(ChargeCalculation);
            InitDataGrid();
        });

        var column = [[
            { field: 'CommName', title: '项目名称', width: '100', align: 'center' },
            { field: 'CustName', title: '客户名称', width: '200', align: 'center' },
            { field: 'RoomSign', title: '房屋编号', width: '200', align: 'center' },
            { field: 'PointNumber', title: '点位编号', width: '200', align: 'center' },
            { field: 'BeginDate', title: '开始时间', width: '100', align: 'center' },
            { field: 'EndDate', title: '结束时间', width: '100', align: 'center' },
            { field: 'DueDate', title: '应收时间', width: '100', align: 'center' },
            { field: 'CostName', title: '费用项目', width: '120', align: 'center' },
            {
                field: 'ChargeCalculation', title: '计费方式', width: '100', align: 'center', formatter: function (value, row, index) {
                    if (value == "1") {
                        return "总额固定方式";
                    } else if (value == "2") {
                        return "据实结算方式";
                    } else if (value == "3") {
                        return "营业提成方式";
                    }
                }
            },
            {
                field: 'CalculationMethod', title: '计算方式', width: '100', align: 'center', formatter: function (value, row, index) {
                    if (value == "0") {
                        return "按每月单价";
                    } else if (value == "1") {
                        return "按缴费周期总额";
                    } else if (value == "2") {
                        return "按合同期间总额";
                    } else if (value == "3") {
                        return "按每天单价";
                    } else if (value == "4") {
                        return "按数量*单价";
                    } else if (value == "5") {
                        return "按实际发生额";
                    } else if (value == "6") {
                        return "按提成";
                    } else if (value == "7") {
                        return "按保底+提成";
                    }
                }
            },
            { field: 'ContPeriod', title: '计费周期', width: '100', align: 'center' },
            { field: 'ContPrice', title: '计费标准', width: '100', align: 'center' },
            { field: 'ChargeNumber', title: '计费数量', width: '100', align: 'center' },
            { field: 'GuaranteeAmount', title: '保底金额', width: '80', align: 'center' },
            { field: 'BusinessRoyaltyRatio', title: '提成比例', width: '80', align: 'center' },
            {
                field: 'ContractDelinBeginMonth', title: '合同违约金起计时间', width: '200', align: 'left', formatter: function (value, row, index) {
                    if (value != "") {
                        return "应收时间延后(" + value + ")月(" + row.ContractDelinBeginDay + ")日起计";
                    } else {
                        if (row.ContractDelinBeginDay != "") {
                            return "应收时间(" + row.ContractDelinBeginDay + ")天之后起计";
                        }
                    }
                    return "";
                }
            },
            { field: 'ContractDelinAmountStandard', title: '合同违约金标准(小数/天)', width: '150', align: 'center' }
        ]];
        function InitDataGrid() {
            $("#dg").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                fit: true,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                rownumbers: true,
                fitColumns: false,
                singleSelect: true,
                border: false,
                pagination: true,
                width: "100%",
                toolbar: "#toolbar",
                onDblClickRow: function (rowIndex, rowData) {
                    ClosePage(rowData);
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("DiversifiedManage", "GetContractSettingList_Dialog", "dg", param);
                },
                onLoadSuccess: function (data) {

                }
            });
        }
        function Save() {
            var row = $("#dg").datagrid("getSelected");
            if (row) {
                ClosePage(row);
            } else {
                $.messager.alert('温馨提示', "请选择合同标准");
            }
        }

        function ClosePage(row) {
            HDialog.ReturnIsJson = true;
            HDialog.Close(row);
        }
    </script>
</body>
</html>
