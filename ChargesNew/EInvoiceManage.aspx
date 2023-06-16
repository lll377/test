<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EInvoiceManage.aspx.cs" Inherits="M_Main.ChargesNew.EInvoiceManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开具电票</title>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style>
        table tr {
            height: 30px;
        }
    </style>

</head>
<body style="overflow: auto">
    <form id="form1" runat="server">
        <input id="CommID" name="CommID" type="hidden" runat="server" value="" />
        <input id="CustID" name="CustID" type="hidden" runat="server" value="" />
        <input id="ReserveDate" name="ReserveDate" type="hidden" value="" />

        <input id="RoomID" name="RoomID" type="hidden" value="" />

        <input id="ReceiveIDs" name="ReceiveIDs" type="hidden" value="" />
        <input id="PreReceiveIDs" name="PreReceiveIDs" type="hidden" value="" />
        <input id="PrecIDs" name="PrecIDs" type="hidden" value="" />
        <input id="LateFeesIDs" name="LateFeesIDs" type="hidden" value="" />
        <input id="OffsetIDs" name="OffsetIDs" type="hidden" value="" />
        <input id="IsEmail" name="IsEmail" value="0" type="hidden" />

        <input id="BillData" name="BillData" value="" type="hidden" />
        <table class="DialogTable">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">开票信息</span>
                </td>
            </tr>
        </table>
        <table class="DialogTable" id="ETable" style="width: 90%; margin: 0px auto">

            <tr>
                <td class="TdTitle">客户类别</td>
                <td class="DialogTdContent">
                    <input id="BillCustType" name="BillCustType" disabled="disabled" runat="server" />
                </td>
                <td class="TdTitle">客户名称</td>
                <td class="DialogTdContent">
                    <input id="CustName" searcher="SelCust"
                        name="CustName" class="easyui-searchbox" data-options="editable:false,readonly:true" runat="server" />
                </td>

            </tr>
            <tr>

                <td class="TdTitle">纳税人识别号</td>
                <td class="DialogTdContent">
                    <input id="BillTaxpayerNumber" maxlength="50" name="BillTaxpayerNumber" runat="server" class="easyui-validatebox" />
                </td>
                <td class="TdTitle">开户银行</td>
                <td class="DialogTdContent">
                    <input id="BillBankName" maxlength="50" name="BillBankName" runat="server" class="easyui-validatebox" />
                </td>

            </tr>
            <tr>
                <td class="TdTitle">地址</td>
                <td class="DialogTdContent">
                    <input id="BillAddress" maxlength="50" name="BillAddress" runat="server" class="easyui-validatebox" />
                </td>
                <td class="TdTitle">银行账号</td>
                <td class="DialogTdContent">
                    <input id="BillBankAccount" maxlength="50" name="BillBankAccount" runat="server" class="easyui-validatebox" />
                </td>

            </tr>
            <tr>
                <td class="TdTitle">电子邮箱</td>
                <td class="DialogTdContent">
                    <input id="BillEmail" maxlength="50" name="BillEmail" runat="server" class="easyui-validatebox" data-options="prompt:'Enter a valid email.',validType:'email'" />
                </td>
                <td class="TdTitle">联系电话</td>
                <td class="DialogTdContent">
                    <input id="BillPhone" maxlength="50" name="BillPhone" runat="server" class="easyui-validatebox" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContentSearch" colspan="3">
                    <textarea id="BillRemark" style="width: 96%; height: 60px" name="BillRemark" rows="3" cols="96" runat="server"></textarea></td>
            </tr>
            <tr>
                <td class="TdTitle" align="center">
                    <input type="checkbox" id="SendEmail" name="SendEmail" style="" /><label for="SendEmail" style="color: red">发送电子邮件</label>
                </td>
                <td colspan="2"></td>
                <td>
                    <input class="button" onclick="UpdateBillInfo()" style="margin-right: 20px; float: right"
                        type="button" value="更新信息" name="btnFilter" runat="server" /></td>
            </tr>
        </table>
        <div id="TableContainer" style="width: 100%; height: 160px"></div>
        <div style="height: 30px; float: left; line-height: 30px; width: 100%">
            <div style="float: right; margin-right: 20px; margin-top: 2px">总金额&nbsp;&nbsp;&nbsp;<span style="margin-left: 5px" id="Amount"></span></div>
        </div>
        <div style="height: 10px; width: 100%"></div>
        <input class="button" onclick="Return()" style="margin-right: 20px; float: right"
            type="button" value="返回" name="btnFilter" runat="server" />
        <input class="button" onclick="SureBill()" style="margin-right: 20px; float: right"
            type="button" value="确认开票" name="btnFilter" runat="server" />

    </form>

    <script>

        function Return() {
            HDialog.Close();
        }

        function SureBill() {

            if ($('#form1').form('enableValidation').form('validate') == false) {
                return;
            }
            if ($("#SendEmail").is(":checked")) {
                if ($("#BillEmail").val() == "") {
                    HDialog.Info("请输入邮箱");
                    return;
                }
            }
            var costArr = new Array();
            var ob = $("#TableContainer").datagrid('getRows');
            for (var i = 0; i < ob.length; i++) {
                costArr.push(ob[i].CostID);
            }
            var costids = costArr.join(",");
            //判断是否有未设置税率的费用
             $.tool.pageLoading();
            $.tool.DataPostNoLoading("EInvoiceManage", "CheckNoSetTaxCost", "CostIDs=" + costids, function Init() {
            },
                function callback(_Data) {
                    if (_Data == "true") {

                        //判断是否有税率为0的费用
                        for (var i = 0; i < ob.length; i++) {
                            if (ob[i].TaxRate == "0") {
                                $.tool.pageUnLoading();
                                HDialog.Info(ob[i].CostName+"费用不允许开票，请到开具电票页面为同收据中其余费用开票");
                                return;
                            }
                        }

                        //清除未开票完成的票据数据
                        $.tool.DataPostNoLoading("EInvoiceManage", "CleanEinvoice", "ReceiveIDs=" + $("#ReceiveIDs").val() + "&PreReceiveIDs=" + $("#PreReceiveIDs").val()
                            + "&PrecIDs=" + $("#PrecIDs").val() + "&LateFeesIDs=" + $("#LateFeesIDs").val() + "&OffsetIDs=" + $("#OffsetIDs").val(), function Init() {
                            },
                            function callback(_Data) {
                                //发起开票
                                $.tool.DataPostNoLoading("EInvoiceManage", "ApplyBill", $('#form1').serialize(), function Init() {
                                },
                                    function callback(_Data) {
                                        $.tool.pageUnLoading();
                                        var data = JSON.parse(_Data);
                                        if (data.state == "true") {
                                            HDialog.Info(data.msg);
                                            HDialog.Close('ok');
                                        }
                                        else {
                                            HDialog.Info(data.msg);
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });

                    }
                    else {
                        $.tool.pageUnLoading();
                        HDialog.Info(_Data);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        }

        function UpdateBillInfo() {
            if ($('#form1').form('enableValidation').form('validate') == false) {
                return false;
            }
            $.tool.DataPost("EInvoiceManage", "UpdateBillsInfo", $('#form1').serialize(), function Init() {
            },
                function callback(_Data) {

                    if (_Data == "true") {
                        HDialog.Info("更新成功");
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }


        function SelCust() {

            //$('#CustName').searchbox("setValue", '');
            //$('#CustID').val('');

            //var w = $(window).width();
            //var h = $(window).height();

            //var conent = "../DialogNew/CustDlg.aspx";

            //HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            //    var data = JSON.parse(_Data);
            //    $('#CustName').searchbox("setValue", data.CustName);
            //    $('#CustID').val(data.CustID);
            //    //更新开票信息
            //    $.post("/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=EInvoiceManage&Command=GetBillsInfo", {
            //        CustID: $('#CustID').val()
            //    }, function (data) {
            //        var obj = data[0];
            //        $("#BillTaxpayerNumber").val(obj.BillTaxpayerNumber);
            //        $("#BillAddress").val(obj.BillAddress);
            //        $("#BillBankAccount").val(obj.BillBankAccount);
            //        $("#BillPhone").val(obj.BillPhone);
            //        $("#BillBankName").val(obj.BillBankName);
            //        $("#BillCustType").val(obj.BillCustType);
            //        $("#BillEmail").val(obj.BillEmail);
            //        $("#BillRemark").val(obj.BillRemark);
            //        validateBillInfo();
            //    }, 'json');
            //});
        }

        function validateBillInfo() {
            if ($("#BillCustType").val() == "单位") {

                $('#BillTaxpayerNumber').attr("disabled", false);
                $('#BillBankName').attr("disabled", false);
                $('#BillBankAccount').attr("disabled", false);
                $('#BillAddress').attr("disabled", false);
                $('#BillPhone').attr("disabled", false);
                $('#BillTaxpayerNumber').validatebox({
                    required: true
                });
                //$('#BillBankName').validatebox({
                //    required: true
                //});
                //$('#BillBankAccount').validatebox({
                //    required: true
                //});
                //$('#BillAddress').validatebox({
                //    required: true
                //});
                //$('#BillPhone').validatebox({
                //    required: true
                //});
            }
            else {
                //$('#BillTaxpayerNumber').val('');
                //$('#BillBankName').val('');
                //$('#BillBankAccount').val('');
                //$('#BillAddress').val('');
                //$('#BillPhone').val('');

                $('#BillTaxpayerNumber').attr("disabled", true);
                $('#BillBankName').attr("disabled", true);
                $('#BillBankAccount').attr("disabled", true);
                //$('#BillAddress').attr("disabled", true);
                //$('#BillPhone').attr("disabled", true);

                $('#BillTaxpayerNumber').validatebox({
                    required: false
                });
                $('#BillBankName').validatebox({
                    required: false
                });
                $('#BillBankAccount').validatebox({
                    required: false
                });
                $('#BillAddress').validatebox({
                    required: false
                });
                $('#BillPhone').validatebox({
                    required: false
                });
            }
        }
        $(function () {
            validateBillInfo();
            //$("#BillCustType").change(function () {
            //    validateBillInfo();

            //});


            $("#SendEmail").change(function () {
                if ($("#SendEmail").prop('checked')) {
                    $("#IsEmail").val("1");
                }
                else {
                    $("#IsEmail").val("0");
                }
            });

        })

        var FeesColumn = [[
            { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
            { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
            {
                field: 'FeesStateDate', title: '应收开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = formatDate(value, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'FeesEndDate', title: '应收结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = formatDate(value, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'TaxRate', title: '税率(%)', width: 100, align: 'left', sortable: true },
            { field: 'TaxAmount', title: '税额', width: 100, align: 'left', sortable: true },
            { field: 'BillAmount', title: '开票金额', width: 100, align: 'left', sortable: true }
        ]];



        var FeesMsg = sessionStorage.getItem("BillFeesMsg");
        console.log(FeesMsg);
        var MsgArr = FeesMsg.split(",");
        var RoomID = MsgArr[0].split("|")[1];
        //for (var i = 0; i < MsgArr.length; i++) {
        //    if (MsgArr[i].split("|")[2] != RoomID) {
        //        $('#CustName').searchbox({ readonly: true });
        //        break;
        //    }
        //}
        var ReceiveIDs = new Array();
        var PreReceiveIDs = new Array();
        var PrecIDs = new Array();
        var LateIDs = new Array();
        var OffsetIDs = new Array();

        for (var i = 0; i < MsgArr.length; i++) {
            var arr = MsgArr[i].split("|");

            switch (arr[2]) {
                case "1":
                    ReceiveIDs.push(arr[0]);
                    break;
                case "2":
                    PreReceiveIDs.push(arr[0]);
                    break;
                case "3":
                    PrecIDs.push(arr[0]);
                    break;
                case "4":
                    LateIDs.push(arr[0]);
                    break;
                case "5":
                    OffsetIDs.push(arr[0]);
                    break;
                default:
            }

        }
        $("#ReceiveIDs").val(ReceiveIDs.join(","));
        $("#PreReceiveIDs").val(PreReceiveIDs.join(","));
        $("#PrecIDs").val(PrecIDs.join(","));
        $("#LateFeesIDs").val(LateIDs.join(","));
        $("#OffsetIDs").val(OffsetIDs.join(","));


        //加载数据
        function LoadData() {

            //加载已经统计了的数据
            $("#TableContainer").datagrid({
                title: '费用详情',
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: 50,
                pageList: [30, 50, 100],
                columns: FeesColumn,
                fitColumns: true,
                singleSelect: true,
                remoteSort: false,
                rownumbers: true,
                border: false,
                sortOrder: "asc",
                onLoadSuccess: function (data) {
                    var rows = data.rows;
                    var amount = 0;
                    for (var i = 0; i < rows.length; i++) {
                        amount += parseFloat(rows[i].BillAmount)
                    }
                    $("#Amount").text(amount.toFixed(2));
                    $("#BillData").val(JSON.stringify(rows));
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParamNoPage("EInvoiceManage", "GetCanBillFees", "TableContainer", param);
                },
                rowStyler: function (index, row) {
                    return 'height:20px;';
                }
            });
        }

        LoadData();

    </script>
</body>
</html>
