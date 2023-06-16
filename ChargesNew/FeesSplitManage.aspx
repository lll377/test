<%@ Page Language="c#" CodeBehind="FeesSplitManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.FeesSplitManage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>费用拆分</title>

    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>


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
    <script type="text/javascript">

        $(function () {
            $.tool.DataPostChk('FeesSplitManage', 'WriteOff', 'CheckIsWriteOff', 'CheckDates=' + $('#FeesDueDate').val(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == 'True') {
                        $("#CustName1").searchbox({
                            disabled: true
                        });
                        $("#CustName2").searchbox({
                            disabled: true
                        });
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                })

        });

        function better_time(strDateStart, strDateEnd) {
            var strSeparator = "-";   //日期分隔符   
            var strDateArrayStart;
            var strDateArrayEnd;
            var intDay = 9999;
            if ((strDateStart != "") && (strDateEnd != "")) {
                strDateArrayStart = strDateStart.split(strSeparator);
                strDateArrayEnd = strDateEnd.split(strSeparator);
                var strDateS = new Date(strDateArrayStart[0] + "/" + strDateArrayStart[1] + "/" + strDateArrayStart[2]);
                var strDateE = new Date(strDateArrayEnd[0] + "/" + strDateArrayEnd[1] + "/" + strDateArrayEnd[2]);
                intDay = (strDateS - strDateE) / (1000 * 3600 * 24)
            }
            return intDay
        }

        function add_Date(strDate, days) {
            var strSeparator = "-";   //日期分隔符
            var strDateArray;
            var strNewDate = "";
            if (strDate != "") {
                strDateArray = strDate.split(strSeparator);
                var tmpDate = new Date(strDateArray[0] + "/" + strDateArray[1] + "/" + strDateArray[2]);
                tmpDate.setTime(tmpDate.getTime() + days * 24 * 60 * 60 * 1000);
                strNewDate = tmpDate.getFullYear() + "-" + (tmpDate.getMonth() + 1) + "-" + tmpDate.getDate();
            }
            return strNewDate;
        }

        function CheckData() {
            var iDueAmount1 = parseFloat(getObject("DueAmount1").value)
            var iDueAmount2 = parseFloat(getObject("DueAmount2").value);

            if (iDueAmount1 != 0) {
                if (FeesSplitManage.FeesEndDate1.value == "") {
                    HDialog.Info("请输入结束日期,此项不能为空!");
                    return false;
                }
            }
            if (iDueAmount2 != 0) {
                if (FeesSplitManage.FeesStateDate2.value == "") {
                    HDialog.Info("请输入开始日期,此项不能为空!");
                    return false;
                }
            }

            if (FeesSplitManage.AccountsDueDate1.value == "") {
                HDialog.Info("请输入应收日期,此项不能为空!");
                return false;
            }

            if (FeesSplitManage.AccountsDueDate2.value == "") {
                HDialog.Info("请输入应收日期,此项不能为空!");
                return false;
            }

            if (FeesSplitManage.AccountsDueDate2.value == "") {
                HDialog.Info("请输入应收日期,此项不能为空!");
                return false;
            }
            var FeesStateDate1 = new Date($('#FeesStateDate1').val());
            var FeesEndDate1 = new Date($('#FeesEndDate1').val());
            if (FeesStateDate1 > FeesEndDate1) {
                HDialog.Info('第一个开始日期大于结束日期选择错误');
                return false;
            }
            var FeesStateDate2 = new Date($('#FeesStateDate2').val());
            var FeesEndDate2 = new Date($('#FeesEndDate2').val());
            if (FeesStateDate2 > FeesEndDate2) {
                HDialog.Info('第二个开始日期大于结束日期选择错误');
                return false;
            }
            return true;
        }

        function getNextday() {
            var today = document.getElementById("lang0").value;
            var t = new Date(Date.parse(today.replace(/-/g, "/")));
            var tm = new Date(t.getFullYear(), t.getMonth(), t.getDate() + 1);
            var m = '0' + (tm.getMonth() + 1);
            var d = '0' + tm.getDate()
            document.getElementById("lang0").value = tm.getFullYear() + '-' + m.substr(m.length - 2) + '-' + d.substr(d.length - 2);
        }

        //前一天
        function getYestoday(date) {
            var date = document.getElementById("lang0").value;
            var t = new Date(Date.parse(date.replace(/-/g, "/")));
            var yesterday_milliseconds = t.getTime() - 1000 * 60 * 60 * 24;
            var yesterday = new Date();
            yesterday.setTime(yesterday_milliseconds);
            var strYear = yesterday.getFullYear();
            var strDay = yesterday.getDate();
            var strMonth = yesterday.getMonth() + 1;
            if (strMonth < 10) { strMonth = "0" + strMonth; }
            if (strDay < 10) { strDay = "0" + strDay }
            datastr = strYear + "-" + strMonth + "-" + strDay;
            document.getElementById("lang0").value = datastr;
        }

        function Onblur_FeesEndDate1() {
            switch ($("#SpliteType").val()) {
                case "0":
                    var FeesEndDate1 = new Date($('#FeesEndDate1').val());
                    if ($('#hiFeesEndDate').val() != "") {
                        var OFeesEndDate1 = new Date($('#hiFeesEndDate').val());
                        var OFeesStateDate1 = new Date($('#hiFeesStateDate').val());
                        if (FeesEndDate1 > OFeesEndDate1 || FeesEndDate1 < OFeesStateDate1) {
                            HDialog.Info('结束日期选择错误');
                            $('#FeesEndDate1').val($('#hiFeesEndDate').val());
                            GetDueSplitAmount();
                            return false;
                        }
                        else {
                            GetDueSplitAmount();
                        }
                    }
                    else {
                        GetDueSplitAmount();
                    }
                    break;
                case "1":
                    var FeesEndDate2 = new Date($('#FeesEndDate2').val());
                    var FeesEndDate1 = new Date($('#FeesEndDate1').val());
                    if (FeesEndDate1 > FeesEndDate2) {
                        HDialog.Info('结束日期选择错误');
                        $('#FeesEndDate1').val($('#FeesStateDate1').val());
                        return false;
                    }

                    var strDateStateOld = $("#hiFeesStateDate").val();
                    var strDateEndOld = $("#hiFeesEndDate").val();
                    var strDateS = $("#FeesStateDate1").val();
                    var strDate = $("#FeesEndDate1").value;

                    var today = $('#FeesEndDate1').val();
                    var t = new Date(Date.parse(today.replace(/-/g, "/")));
                    var tm = new Date(t.getFullYear(), t.getMonth(), t.getDate() + 1);
                    var m = '0' + (tm.getMonth() + 1);
                    var d = '0' + tm.getDate()
                    $("#FeesStateDate2").val(tm.getFullYear() + '-' + m.substr(m.length - 2) + '-' + d.substr(d.length - 2));
                    GetDueSplitAmount();
                    break;
                case "2":
                    if ($("#hiFeesStateDate").val() != "") {
                        $("#FeesStateDate1").val($("#hiFeesStateDate").val());
                        $("#FeesStateDate2").val($("#hiFeesStateDate").val());
                    }
                    if ($("#hiFeesEndDate").val() != "") {
                        $("#FeesEndDate1").val($("#hiFeesEndDate").val());
                        $("#FeesEndDate2").val($("#hiFeesEndDate").val());
                    }
                    GetDueSplitAmount();
                    break;
            }
        }

        function Onblur_FeesStateDate2() {

            switch ($("#SpliteType").val()) {
                case "0":
                    GetDueSplitAmount();
                    var FeesStateDate2 = new Date($('#FeesStateDate2').val());
                    if ($('#hiFeesStateDate').val() != "") {
                        var oFeesStateDate = new Date($('#hiFeesStateDate').val());
                        var oFeesEndDate = new Date($('#hiFeesEndDate').val());
                        if (FeesStateDate2 < oFeesStateDate || FeesStateDate2 > oFeesEndDate) {
                            HDialog.Info('开始日期选择错误');

                            $('#FeesStateDate2').val($('#hiFeesStateDate').val());
                            GetDueSplitAmount();
                            return false;
                        }
                        else {
                            GetDueSplitAmount();
                        }
                    }
                    else {
                        GetDueSplitAmount();
                    }

                    break;
                case "1":

                    var FeesStateDate1 = new Date($('#FeesStateDate1').val());
                    var FeesStateDate2 = new Date($('#FeesStateDate2').val());
                    if (FeesStateDate2 < FeesStateDate1) {
                        HDialog.Info('开始日期选择错误');
                        $('#FeesStateDate2').val($('#FeesEndDate1').val());
                        GetDueSplitAmount();
                        return false;
                    }

                    var strDateStateOld = getObject("hiFeesStateDate").value;
                    var strDateEndOld = getObject("hiFeesEndDate").value;
                    var strDateE = getObject("FeesEndDate2").value;
                    var strDate = getObject("FeesStateDate2").value;
                    var date = $("#FeesStateDate2").val();
                    var t = new Date(Date.parse(date.replace(/-/g, "/")));
                    var yesterday_milliseconds = t.getTime() - 1000 * 60 * 60 * 24;
                    var yesterday = new Date();
                    yesterday.setTime(yesterday_milliseconds);
                    var strYear = yesterday.getFullYear();
                    var strDay = yesterday.getDate();
                    var strMonth = yesterday.getMonth() + 1;
                    if (strMonth < 10) { strMonth = "0" + strMonth; }
                    if (strDay < 10) { strDay = "0" + strDay }
                    datastr = strYear + "-" + strMonth + "-" + strDay;
                    $("#FeesEndDate1").val(datastr);
                    GetDueSplitAmount();
                    break;
                case "2":
                    if ($("#hiFeesStateDate").val() != "") {
                        $("#FeesStateDate1").val($("#hiFeesStateDate").val());
                        $("#FeesStateDate2").val($("#hiFeesStateDate").val());
                    }
                    if ($("#hiFeesEndDate").val() != "") {
                        $("#FeesEndDate1").val($("#hiFeesEndDate").val());
                        $("#FeesEndDate2").val($("#hiFeesEndDate").val());
                    }
                    GetDueSplitAmount();
                    break;

            }

        }

        //获得金额
        function GetDueSplitAmount() {
            var strFeesID = getObject("FeesID").value;
            var strFeesSplitDate = getObject("FeesEndDate1").value;
            if ($('#hiFeesStateDate').val() == "" || $('#hiFeesEndDate').val() == '') {
                var DueAmount = parseFloat($('#DueAmount').val()).toFixed(2);

                $("#DueAmount1").val(DueAmount);
                $("#DueAmount2").val(0);

            }
            else {
                if (strFeesSplitDate != "") {
                    getObject("results").innerHTML = "正在计算...";
                    $.tool.pageLoading();
                    $.ajax({
                        url: "../Charges/GetDueSplitAmount.aspx?FeesID=" + strFeesID + "&FeesSplitDate=" + strFeesSplitDate + "&rdm=" + Math.random(),
                        type: 'POST',
                        dataType: 'text',
                        cache: false,
                        async: true,
                        success: function (_Data) {
                            $.tool.pageUnLoading();
                            var varReturn = _Data;
                            var varObjects = varReturn.split("\t");
                            getObject("results").innerHTML = varObjects[0];
                            if (varObjects[1] != "") {
                                if (parseFloat(varObjects[1]) > parseFloat($('#DueAmount').val())) {
                                    $("#DueAmount1").val($('#DueAmount').val());
                                    $("#DueAmount2").val(0);
                                }
                                else {
                                    var d = parseFloat($('#DueAmount').val()) - parseFloat(varObjects[1]);
                                    $("#DueAmount1").val(varObjects[1]);
                                    $("#DueAmount2").val(d.toFixed(2));
                                }
                            }
                        },
                        complete: function (XMLHttpRequest, textStatus, errorThrown) {
                            $.tool.pageUnLoading();

                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            $.tool.pageUnLoading();
                        }
                    });

                }
            }
        }


        function GetDueAmount1() {
            var iDueAmount = parseFloat(getObject("DueAmount").value);
            var iDueAmount1 = parseFloat(getObject("DueAmount1").value);
            var iDueAmount2 = parseFloat(getObject("DueAmount2").value);
            switch ($("#SpliteType").val()) {
                case "0":
                    if (iDueAmount1 > iDueAmount) {
                        iDueAmount1 = iDueAmount;
                        $("#DueAmount1").val(iDueAmount1);
                    }
                    if (iDueAmount1 <= 0) {
                        iDueAmount1 = 0;
                        $("#DueAmount1").val(iDueAmount1);
                    }
                    $("#DueAmount2").val((iDueAmount - iDueAmount1).toFixed(2));
                    break;
                case "1":
                    break;
                case "2":
                    if (iDueAmount1 > iDueAmount) {
                        iDueAmount1 = iDueAmount;
                        $("#DueAmount1").val(iDueAmount1);
                    }
                    if (iDueAmount1 <= 0) {
                        iDueAmount1 = 0;
                        $("#DueAmount1").val(iDueAmount1);
                    }
                    var d = iDueAmount - iDueAmount1;
                    $("#DueAmount2").val(d.toFixed(2));

                    var iDueAmount1 = parseFloat($("#DueAmount1").val());
                    var iPerAmount = parseFloat($("#PerAmount").val());
                    if ((iPerAmount > 0) && (iDueAmount1 > 0) && (iDueAmount1 != iDueAmount) && ($("#FeesStateDate1").val() != "")) {

                        var iDay = parseInt(iDueAmount1 / iPerAmount, 10);

                        $("#FeesEndDate1").val(add_Date($("#FeesStateDate1").val(), iDay));
                        $("#FeesStateDate2").val(add_Date($("#FeesEndDate1").val(), 1));
                    }

                    break;
            }
        }

        function GetDueAmount2() {

            var iDueAmount = parseFloat(getObject("DueAmount").value);
            var iDueAmount1 = parseFloat(getObject("DueAmount1").value);
            var iDueAmount2 = parseFloat(getObject("DueAmount2").value);
            switch ($("#SpliteType").val()) {
                case "0":
                    if (iDueAmount2 > iDueAmount) {
                        iDueAmount2 = iDueAmount;
                        $("#DueAmount2").val(iDueAmount1);
                    }
                    if (iDueAmount2 <= 0) {
                        iDueAmount2 = 0;
                        $("#DueAmount2").val(iDueAmount1);
                    }
                    var d = iDueAmount - iDueAmount2;
                    $("#DueAmount1").val(d.toFixed(2));
                    break;
                case "1":
                    break;
                case "2":
                    if (iDueAmount2 > iDueAmount) {
                        iDueAmount2 = iDueAmount;
                        $("#DueAmount2").val(iDueAmount1);
                    }
                    if (iDueAmount2 <= 0) {
                        iDueAmount2 = 0;
                        $("#DueAmount2").val(iDueAmount1);
                    }
                    var d = iDueAmount - iDueAmount2;
                    $("#DueAmount1").val(d.toFixed(2));

                    var iDueAmount1 = parseFloat(getObject("DueAmount1").value).toFixed(2);
                    var iPerAmount = parseFloat(getObject("PerAmount").value).toFixed(2);
                    if ((iPerAmount > 0) && (iDueAmount1 > 0) && (iDueAmount1 != iDueAmount) && (getObject("FeesStateDate1").value != "")) {

                        var iDay = parseInt(iDueAmount1 / iPerAmount, 10);
                        getObject("FeesEndDate1").value = add_Date(getObject("FeesStateDate1").value, iDay);
                        getObject("FeesStateDate2").value = add_Date(getObject("FeesEndDate1").value, 1);
                    }
                    break;
            }
        }

        function SpliteTypeChange() {
            $('#DueAmount1').removeAttr('readonly');
            $('#DueAmount2').removeAttr('readonly');
            $('#FeesEndDate1').removeAttr('readonly');
            $('#FeesStateDate2').removeAttr('readonly');
            $('#FeesEndDate2').removeAttr('readonly');
            $('#FeesStateDate1').removeAttr('readonly');

            if ($('#hiFeesStateDate').val() == "" || $('#hiFeesEndDate').val() == '') {
                if ($('#SpliteType').val() == '1') {
                    HDialog.Info('此费用项目未填开始时间或结束时间，不能选择按时间拆分');
                    $('#SpliteType').val(0);
                    return false;
                }
            }
            if ($('#hiFeesStateDate').val() != "" && $('#hiFeesEndDate').val() != '') {

                if ($('#SpliteType').val() == '0') {
                    $('#FeesStateDate1').attr('readonly', 'readonly');
                    $('#FeesEndDate2').attr('readonly', 'readonly');
                    if ($('#hiFeesStateDate').val() != '') {
                        $('#FeesStateDate1').removeAttr('readonly');
                    }
                    if ($('#hiFeesEndDate').val() != '') {

                        $('#FeesEndDate2').removeAttr('readonly');
                    }
                }

                if ($('#SpliteType').val() == '0') {
                    document.getElementById('FeesEndDate1').onclick = tt;
                    document.getElementById('FeesStateDate2').onclick = tt;
                }
                if ($('#SpliteType').val() == '1') {
                    $('#DueAmount1').attr('readonly', 'readonly');
                    $('#DueAmount2').attr('readonly', 'readonly');
                    document.getElementById('FeesEndDate1').onclick = tt;
                    document.getElementById('FeesStateDate2').onclick = tt;
                }
                if ($('#SpliteType').val() == '2') {
                    $('#FeesStateDate1').attr('readonly', 'readonly');
                    $('#FeesEndDate2').attr('readonly', 'readonly');
                    $('#FeesEndDate1').attr('readonly', 'readonly');
                    $('#FeesStateDate2').attr('readonly', 'readonly');
                    document.getElementById('FeesEndDate1').onclick = tt2;
                    document.getElementById('FeesStateDate2').onclick = tt2;
                }
            }

        }
        function tt() {
            WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' });
        }
        function tt2() {

        }
        function initLoad() {
            $('#DueAmount1').attr('readonly', 'readonly');
            $('#DueAmount2').attr('readonly', 'readonly');

            GetDueSplitAmount();
        }
        //-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body onload="initLoad();" style="overflow: hidden">

    <form id="FeesSplitManage" method="post" runat="server">
        <input id="hiOPType" style="width: 32px; height: 22px" type="hidden" size="1" name="hiOPType"
            runat="server" />

        <input id="IsWriteOff" style="width: 32px; height: 22px" type="hidden" size="1" name="IsWriteOff"
            runat="server" />

        <input id="FeesID" style="width: 16px; height: 22px" type="hidden" size="1" name="FeesID"
            runat="server" /><input id="PerAmount" style="width: 16px; height: 22px" type="hidden" size="1" name="PerAmount"
                runat="server" /><input id="hiFeesStateDate" style="width: 16px; height: 22px" type="hidden" size="1" name="hiFeesStateDate"
                    runat="server"><input id="hiFeesEndDate" style="width: 16px; height: 22px" type="hidden" size="1" name="hiFeesEndDate"
                        runat="server">
        <table class="DialogTable" style="width: 100%">

            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input id="CustName" readonly class="easyui-validatebox"
                        type="text" name="CustName" runat="server" /></td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" readonly class="easyui-validatebox"
                        type="text" name="RoomSign" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch">
                    <input id="CostName" readonly class="easyui-validatebox"
                        type="text" name="CostName" runat="server" /></td>
                <td class="TdTitle">费用日期</td>
                <td>
                    <input id="FeesDueDate" readonly class="easyui-validatebox"
                        type="text" name="FeesDueDate" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">应收日期</td>
                <td class="TdContentSearch">
                    <input id="AccountsDueDate" class="easyui-validatebox"
                        readonly type="text" name="AccountsDueDate" runat="server" /></td>
                <td class="TdTitle">收费金额</td>
                <td class="TdContentSearch">
                    <input id="DueAmount" readonly class="easyui-validatebox"
                        type="text" name="DueAmount" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">费用备注</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="FeesMemo" class="easyui-validatebox" type="text" style="width: 79%" name="FeesMemo" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle"><font face="宋体">费用拆分方式</font></td>
                <td class="TdContentSearch" colspan="3">
                    <select id="SpliteType" name="SpliteType" onchange="SpliteTypeChange();" runat="server">
                        <option value="0">自定义拆分</option>
                        <option value="1" selected>按时间拆分</option>
                        <option value="2">按金额拆分</option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">拆分结果</td>
                <td class="TdContentSearch" colspan="3">
                    <table class="DialogTable" style="width: 75%">
                        <tr>
                            <td style="width: 10%">开始日期</td>
                            <td style="width: 20%">
                                <input id="FeesStateDate1" style="width: 80%" type="text" name="FeesStateDate1" onclick="WdatePicker()" runat="server" /></td>
                            <td style="width: 10%">结束日期</td>
                            <td style="width: 20%">
                                <input onkeypress="CheckSmallDate();" class="Wdate" style="width: 80%" id="FeesEndDate1" onblur="javascript:Onblur_FeesEndDate1();" onclick="WdatePicker()" type="text" name="FeesEndDate1" runat="server" /></td>
                            <td style="width: 10%">应收日期</td>
                            <td style="width: 20%">
                                <input onkeypress="CheckSmallDate();" class="Wdate" style="width: 80%" id="AccountsDueDate1" onclick="WdatePicker()" type="text" name="AccountsDueDate1" runat="server" /></td>
                        </tr>
                        <tr>
                            <td style="width: 10%">金额
                            </td>
                            <td style="width: 25%">
                                <input onkeypress="CheckNumeric();" style="width: 80%" id="DueAmount1" type="text" name="DueAmount1" runat="server" onblur="javascript:GetDueAmount1();" />
                            </td>
                            <td style="width: 10%">新客户
                            </td>
                            <td class="TdContentSearch" style="width: 55%" colspan="3">
                                <input id="CustName1" class="easyui-searchbox" data-options="editable:false" searcher="SelCust1" type="text" name="CustName1" runat="server" />
                                <input class="button_sel" id="btnSelCust1" style="height: 22px" type="button" name="btnSelCust1" runat="server" />
                                <input id="CustID1" style="width: 8px; height: 19px" type="hidden" size="1" name="CustID1" runat="server" />
                                <input id="hiCustName1" style="width: 12px; height: 19px" type="hidden" size="1" name="hiCustName1" runat="server" />
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 10%">开始日期
                            </td>
                            <td style="width: 15%">
                                <input onkeypress="CheckSmallDate();" style="width: 80%" id="FeesStateDate2" onblur="javascript:Onblur_FeesStateDate2();"
                                    onclick="WdatePicker()" type="text" class="Wdate" name="FeesStateDate2" runat="server" />
                            </td>
                            <td style="width: 10%">结束日期
                            </td>
                            <td style="width: 15%">
                                <input id="FeesEndDate2" style="width: 80%" onclick="WdatePicker()" type="text" class="Wdate" name="FeesEndDate2" runat="server" />
                            </td>
                            <td style="width: 10%">应收日期
                            </td>
                            <td style="width: 15%">
                                <input onkeypress="CheckSmallDate();" id="AccountsDueDate2" style="width: 80%"
                                    onclick="WdatePicker()" type="text" class="Wdate" name="AccountsDueDate2"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10%">金额
                            </td>
                            <td style="width: 15%">
                                <input onkeypress="CheckNumeric();" id="DueAmount2" style="width: 80%"
                                    type="text" name="DueAmount2" runat="server" onblur="javascript:GetDueAmount2();" />
                            </td>
                            <td style="width: 10%">新客户
                            </td>
                            <td style="width: 55%" class="TdContentSearch" colspan="3">
                                <input id="CustName2" data-options="editable:false" class="easyui-searchbox" searcher="SelCust2"
                                    type="text" name="CustName2" runat="server"><input class="button_sel" id="btnSelCust2" style="height: 22px"
                                        type="button" value=" " name="btnSelCust2" runat="server" /><input id="CustID2" style="width: 8px; height: 19px" type="hidden"
                                            size="1" name="CustID2" runat="server" /><input id="hiCustName2" style="width: 12px; height: 19px" type="hidden"
                                                size="1" name="hiCustName2" runat="server" />
                            </td>

                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="TdTitle"></td>
                <td class="TdContentSearch" align="left" colspan="3">
                    <div class="font_red" id="results"></div>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnSave" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                                            <input class="button" id="btnReturn" type="button" value="关闭"
                                                name="btnReturn" runat="server" /></td>
            </tr>
        </table>

        <script type="text/javascript">

            function Cli() {
                var dateObj = WdatePicker({ dateFmt: 'yyyy-MM', skin: 'default' });
            }

            function Init() {
                if ($('#hiFeesStateDate').val() != '') {
                    $('#FeesStateDate1').attr('readonly', 'readonly');
                    $('#FeesStateDate1').removeAttr("onclick");
                    $('#FeesStateDate1').click(function () { });
                }
                if ($('#hiFeesEndDate').val() != '') {

                    //$('#FeesEndDate2').attr('readonly', 'readonly');
                    //$('#FeesEndDate2').removeAttr("onclick");
                    //$('#FeesEndDate2').click(function () { });
                }
            }
            $('#btnSelCust1').hide();
            $('#btnSelCust2').hide();

            function SelCust1() {
                $('#CustName1').searchbox("setValue", '');
                $('#CustID1').val('');
                $('#hiCustName1').val('');
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName1').searchbox("setValue", data.CustName);
                    $('#CustID1').val(data.CustID);
                    $('#hiCustName1').val(data.CustName);
                });
            }

            function SelCust2() {
                $('#CustName2').searchbox("setValue", '');
                $('#CustID2').val('');
                $('#hiCustName2').val('');
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open('900', '500', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName2').searchbox("setValue", data.CustName);
                    $('#CustID2').val(data.CustID);
                    $('#hiCustName2').val(data.CustName);
                });
            }

            $('#btnReturn').click(function () {
                HDialog.Close();
            });

        </script>
    </form>
</body>
</html>
