<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemporaryParkingFees.aspx.cs" Inherits="M_Main.CarparkNew.TemporaryParkingFees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="cc" class="easyui-layout" style="width: 100%; height: 600px;">
            <div data-options="region:'north'" style="height: 170px">

                <table class="TableContainer" style="width: 100%">
                    <tr>
                        <td align="center">上次生成时间:</td>
                        <td>
                            <input type="text" class="easyui-datetimebox" id="BeginTime" name="BeginTime" /></td>
                        &nbsp;&nbsp;&nbsp;<td>本次截至时间:</td>
                        <td>
                            <input type="text" class="easyui-datetimebox" id="EndTime" name="EndTime" /></td>

                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <input type="button" class="button" style="background-color: #2b58a0" value="费用查询" id="BtnSave" />

                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 2px; background-color: #e6e6e6" colspan="4"></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td align="center">开始时间</td>
                        <td>
                            <label id="BeginDate"></label>
                        </td>
                        <td align="center">结束时间</td>
                        <td>
                            <label id="EndDate"></label>
                        </td>

                    </tr>
                    <tr>
                        <td align="center">金额</td>
                        <td colspan="3">微信: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="WeChatMoney"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            支付宝:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="Alipay"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            现金:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="Cash"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <input type="button" class="button" style="background-color: #2b58a0" value="费用生成" id="BtnFees" />
                        </td>
                    </tr>
                </table>

            </div>
            <%-- <div data-options="region:'south',split:true" style="height: 50px;"></div>--%>

            <div data-options="region:'center',title:'临停费用明细'" style="padding: 10px; height: 430px">
                <div style="width: 100%; height: 100%; background-color: #cccccc;" id="TableContainer">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">

    $(function () {
        InitTableHeight();
        LoadList();
    });


    $('#BeginTime').datetimebox({
        onChange: function () {
            $("#BeginDate").html($("#BeginTime").datetimebox('getValue'))
        }
    });

    $('#EndTime').datetimebox({
        onChange: function () {
            $("#EndDate").html($("#EndTime").datetimebox('getValue'))
        }
    });

    function InitTableHeight() {
        var h = $(window).height() * 0.6;
        $("#TableContainer").css("height", h + "px");
    }

    var column = [[

        {
            field: 'DictionaryName', title: '停车场名称', width: 80, align: 'left', sortable: true
        },
        { field: 'recordSyscode', title: '订单号', width: 50, align: 'left', sortable: true, hidden: true },
        { field: 'plateNo', title: '车牌号码', width: 100, align: 'left', sortable: true },
        { field: 'enRecordSyscode', title: '卡编号', width: 80, align: 'left', sortable: true },
        { field: 'cardNo', title: '卡号', width: 100, align: 'left', sortable: true },

        { field: 'inTime', title: '车辆入场时间', width: 100, align: 'left', sortable: true },
        { field: 'supposeCost', title: '应收金额', width: 100, align: 'left', sortable: true },
        { field: 'cost', title: '实收金额', width: 100, align: 'left', sortable: true },
        { field: 'deduceCost', title: '折扣金额', width: 100, align: 'left', sortable: true },
        {
            field: 'chargeType', title: '支付方式', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                var str = "";
                if (row.chargeType == "1") {
                    str = "现金"
                } else if (row.chargeType == "2") {
                    str = "储值账户"
                }
                else if (row.chargeType == "3") {
                    str = "第三方"
                } else if (row.chargeType == "4") {
                    str = "支付宝"
                } else if (row.chargeType == "5") {
                    str = "微信"
                } else if (row.chargeType == "6") {
                    str = "无感支付"
                }
                return str;
            }
        }

    ]];


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
            //toolbar: toolbar,
            sortOrder: "asc",
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("Carpark", "ParkingTemporaryStopInfo", "TableContainer", param);
            }, onLoadSuccess: function (data) {
                $("#SearchDlg").dialog("close");
            },
        });
        $("#SearchDlg").dialog("close");
    }


    $("#BtnSave").click(function () {
        $.ajax({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Carpark&Command=SearchStopInfo&BeginTime=' + $("#BeginTime").datetimebox('getValue') + '&EndTime=' + $("#EndTime").datetimebox('getValue'),
            type: 'post',
            dataType: 'text',
            cache: false,
            async: false,
            success: function (result) {

                var json = eval(result);

                $.each(json, function (index, item) {
                    //循环获取数据  
                    var cash = json[index].CashMonay;
                    var WeChatMoney = json[index].WeChatMonay;
                    var Alipay = json[index].AlipayMonay;

                    if (cash == null) {
                        $("#Cash").html("0.00");
                    } else {
                        $("#Cash").html(cash);
                    }

                    if (Alipay == null) {
                        $("#Alipay").html("0.00");
                    } else {
                        $("#Alipay").html(Alipay);
                    }

                    if (WeChatMoney == null) {
                        $("#WeChatMoney").html("0.00");
                    } else {
                        $("#WeChatMoney").html(WeChatMoney);
                    }


                });
            },
            complete: function (XMLHttpRequest, textStatus, errorThrown) {

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                HDialog.Info("数据读取错误");
            }
        });
        LoadList();
    })


    $("#BtnFees").click(function () {
        $.ajax({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Carpark&Command=GenerateFees&BeginTime=' + $("#BeginTime").datetimebox('getValue') + '&EndTime=' + $("#EndTime").datetimebox('getValue') + '&WeChatMoney=' + $("#WeChatMoney").html() + '&Alipay=' + $("#Alipay").html() + '&Cash=' + $("#Cash").html(),
            type: 'post',
            dataType: 'text',
            cache: false,
            async: false,
            success: function (result) {
                HDialog.Info(result)
            },
            complete: function (XMLHttpRequest, textStatus, errorThrown) {

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                HDialog.Info("数据读取错误");
            }
        });
        //LoadList();
    })
</script>
