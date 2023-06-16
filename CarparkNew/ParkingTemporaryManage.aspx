<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingTemporaryManage.aspx.cs" Inherits="M_Main.CarparkNew.ParkingTemporaryManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="FrmForm">
        <input type="hidden" id="SelAll" name="SelAll" runat="server" />
        <input type="hidden" id="SelParkID" name="SelParkID" value="" runat="server" />
        <input id="strParkType" size="1" type="hidden" name="strParkType" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 680px; height: 280px; padding: 10px;">
            <table class="DialogTable" style="line-height: 25px;">

                <tr>
                    <td class="TdTitle">停车场名称</td>
                    <td class="TdContentSearch">
                        <input type="text" style="width: 140px;" id="CarparkName" name="CarparkName" />
                    </td>
                    <td class="TdTitle">车牌号码</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Plate" name="Plate" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">入场时间从</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EnterStarttime" maxlength="50" name="EnterStarttime" runat="server" type="text" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EnterEndTime" maxlength="50" name="EnterEndTime" runat="server" type="text" />
                    </td>

                </tr>
                <%--<tr>
                    <td class="TdTitle">出场时间从</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="BeginPayTime" maxlength="50" name="BeginPayTime" runat="server" type="text" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="EndPayTime" maxlength="50" name="EndPayTime" runat="server" type="text" />
                    </td>

                </tr>--%>
                <tr>
                    
                     <td class="TdTitle">支付方式</td>
                    <td class="TdContentSearch">
                        <select id="Paychannel" style="width: 140px;" name="Paychannel" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="cash">现金</option>
                            <option value="weixin">微信</option>
                            <option value="alipay">支付宝</option>
                            <option value="cmb">招商银行</option>
                            <option value="lespay">莱斯</option>
                           
                        </select>
                    </td>
                   
                </tr>

                <tr>
                    <td class="TdTitle"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: center;" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>

                </tr>

            </table>
        </div>
    </form>
</body>
</html>

<script language="javascript" type="text/javascript">

    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        InitTableHeight();
        LoadList();
    });

    function InitTableHeight() {
        $("#TableContainer").css("height", h + "px");
        var wi = document.body.clientWidth * 0.29 * 0.8;
    }

    var column = [[
        {
            field: 'Billid', title: '订单号', width: 80, align: 'left', sortable: true
        },
        { field: 'Pid', title: '车场编码', width: 80, align: 'left', sortable: true },
        { field: 'Plate', title: '车牌号码', width: 80, align: 'left', sortable: true },
        { field: 'Entertime', title: '入场时间', width: 80, align: 'left', sortable: true },
        { field: 'Payid', title: '离场时间', width: 80, align: 'left', sortable: true },
        { field: 'Totalfee', title: '停车费用总金额', width: 80, align: 'left', sortable: true },
        { field: 'Discountfee', title: '优惠金额', width: 80, align: 'left', sortable: true },
        { field: 'Billfee', title: '支付账单总金额', width: 80, align: 'left', sortable: true },
        {
            field: 'Paychannel', title: '支付方式', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "";
                if (row.Paychannel == "cash") {
                    str = "现金"
                } else if (row.Paychannel == "weixin") {
                    str = "微信"
                }
                else if (row.Paychannel == "alipay") {
                    str = "支付宝"
                } else if (row.Paychannel == "cmb") {
                    str = "招商银行"
                } else if (row.Paychannel == "lespay") {
                    str = "莱斯"
                } else {
                    str = "其他"
                }
                return str;
            }
        },
        { field: 'Paytime', title: '订单时间 ', width: 80, align: 'left', sortable: true }
    ]];
    var toolbar = [

        {
            text: '筛选',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }, '-',
        //{
        //    text: '临停费用生成',
        //    iconCls: 'icon-filter',
        //    handler: function () {
        //        ViewReport('临停交款');

        //    }
        //}, '-',
        {
            text: 'Excel导出',
            iconCls: 'icon-page_white_excel',
            handler: function () {
                window.location.href = "../CarparkNew/ParkingTemporaryManageExcel.aspx";
            }
        }, '-', {
            text: "<span style='color:red'>备注：查询车场临时费用明细</span>"
        }

    ];



    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            title: '',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            remoteSort: false,
            fitColumns: true,
            rownumbers: true,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Carpark", "ParkingTemporaryStop", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }


    function ViewReport(title) {
        HDialog.Open('820', '600', '../CarparkNew/TemporaryParkingFees.aspx', title, true, function callback(_Data) {
            if (_Data == "true") {
                LoadList();
            }
        });
    }
</script>
