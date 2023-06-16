<%@ Page Language="c#" CodeBehind="FeesPastManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.FeesPastManage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>费用输入</title>

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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />

    <script type="text/javascript">
        //< !--
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

        function CheckData() {
            if ($('#CommID').val() == "0") {
                $('#CommID').val('');
            }
            if ($('#CustID').val() == "0") {
                $('#CustID').val('');
            }
            if ($('#CostID').val() == "0") {
                $('#CostID').val('') = "";
            }
            if ($('#CommID').val() == "") {
                HDialog.Info("请选择小区,此项不能为空!");
                return false;
            }
            if ($('#CustID').val() == "") {
                HDialog.Info("请选择客户,此项不能为空!");

                return false;
            }
            if ($('#CostID').val() == "") {
                HDialog.Info("请选择费用项目,此项不能为空!");

                return false;
            }
            if ($('#StanID').val() == "") {
                HDialog.Info("请选择收费标准,此项不能为空!");

                return false;
            }
            if ($('#FeesDueDate').val() == "") {
                HDialog.Info("请输入费用日期,此项不能为空!");

                return false;
            }
            //else {
            //    var d1 = new date($('#FeesDueDate').val());
            //    var d2 = new date($('#hiDateNow').val());
            //    if (d1 > d2)
            //    {
            //        HDialog.Info("费用日期错误,只能输入往月日期!");
            //    }
            //}
            if ($('#AccountsDueDate').val() == "") {
                HDialog.Info("请输入应收日期,此项不能为空!");
                return false;
            }
            else {
                var d1 = new Date($('#AccountsDueDate').val());
                var d2 = new Date($('#hiDateNow').val());
                if (d1 > d2) {
                    HDialog.Info("应收日期错误,只能输入往月日期!");
                    return false;
                }
            }
            if ($('#DueAmount').val() == "") {
                HDialog.Info("请输入收费金额,此项不能为空!");
                return false;
            }
            if (parseFloat($('#DueAmount').val()) <= 0) {
                HDialog.Info("收费金额应大于零!");
                return false;
            }
            if ($('#HiHandID').val() != "" && $('#TmpFees').val() != "1") {
                if ($('#FeesStateDate').val() == "") {

                    HDialog.Info("车位费请输入开始日期,此项不能为空!");
                    return false;
                }
                if ($('#FeesEndDate').val() == "") {
                    HDialog.Info("车位费请输入结束日期,此项不能为空!");
                    return false;
                }
                if ($('#TmpFees').val() != "1") {
                    var iday = better_time($('#FeesStateDate').val(), $('#HiFeesStateDate').val())
                    if (parseInt(iday, 10) < 0) {
                        HDialog.Info("车位费用开始时间应大于上次截止时间！");
                        return false;
                    }
                }
            }

            return true;
        }



        function btnSelRoom_OnClick() {

            //var vCommID = $('#CommID.value;
            //var varReturn;

            //varReturn=showModalDlg("../dialog/RoomDlg.aspx"+"?CommID="+vCommID+"&Ram="+Math.random(),"",650,430);

            //if(varReturn!="")
            //{//**获得返回 刷新
            //	var varObjects=varReturn.split("\t");

            //	$('#RoomID.value=varObjects[0];
            //	$('#RoomSign.value=varObjects[2];
            //	$('#hiRoomSign.value=varObjects[2];

            //	$('#CustID.value=varObjects[1];
            //	$('#CustName.value=varObjects[3];
            //	$('#hiCustName.value = $('#CustName.value;

            //	//alert(varReturn);
            //	ClearStan();

            //	return true;
            //}

            //return false;
        }

        function btnSelCust_OnClick() {

            //var vCommID = $('#CommID.value;
            //var varReturn;
            //varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?CommID=" + vCommID + "&Ram=" + Math.random(), "", 650, 430);
            ////alert("["+varReturn+"]");
            //if(varReturn!="")
            //{//**获得返回 刷新
            //	var varObjects=varReturn.split("\t");

            //	$('#CustID.value=varObjects[0];
            //	$('#CustName.value=varObjects[1];
            //	$('#hiCustName.value=varObjects[1];

            //	$('#RoomSign.value = "";
            //	$('#RoomID.value = "";
            //	$('#hiRoomSign.value = "";

            //	ClearStan();	

            //	return true;
            //}


        }

        function btnSelCost_OnClick() {

            //var vCommID = $('#CommID.value;
            //var tmpCostGeneType = $('#CostGeneType.value;
            //var varReturn;
            //if($('#IncidentID.value!="")
            //{
            //    varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&IncidentID=" + $('#IncidentID.value + "&Ram=" + Math.random(), "", 500, 400);
            //}
            //else if($('#HiHandID.value!="")
            //{
            //    varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&IsPark=parktax" + "&Ram=" + Math.random(), "", 500, 400);
            //}
            //else
            //{
            //    varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&Ram=" + Math.random(), "", 500, 400);
            //}

            ////alert("["+varReturn+"]");
            //if(varReturn!="")
            //{//**获得返回 刷新
            //	var varObjects=varReturn.split("\t");

            //	$('#CostID.value=varObjects[0];
            //	$('#CostName.value=varObjects[2];
            //	$('#hiCostName.value=varObjects[2];

            //	ClearStan();

            //	return true;
            //}

            //return false;
        }

        function ClearStan() {
            $('#StanID').val('');
            $('#StanName').searchbox('setValue', '');
            $('#hiStanName').val('');

            $('#StanFormula').val('');
            $('#StanFormulaName').val('');
            $('#StanAmount').val('');
            $('#ChargeCycle').val('');

            $('#CorpStanID').val('');

            $('#FeesStateDate').val('');
            $('#FeesEndDate').val('');
        }

        function btnSelStan_OnClick() {

            //var vCommID = $('#CommID.value;
            //var tmpCostID = $('#CostID.value;
            //if (tmpCostID =="")
            //{
            //	alert("请选择费用项目,此项不能为空!");
            //	$('#btnSelCost.focus();
            //	return false;	
            //}

            //var varReturn;
            //varReturn = showModalDlg("../dialog/StanDlg.aspx" + "?CommID=" + vCommID + "&CostID=" + tmpCostID, "", 650, 400);
            ////alert("["+varReturn+"]");
            //if(varReturn!="")
            //{//**获得返回 刷新
            //	var varObjects=varReturn.split("\t");

            //	$('#StanID.value=varObjects[0];
            //	$('#StanName.value=varObjects[4];
            //	$('#hiStanName.value=varObjects[4];

            //	$('#StanFormula.value=varObjects[5];
            //	$('#StanFormulaName.value=varObjects[6];
            //	$('#StanAmount.value=varObjects[7];
            //	$('#ChargeCycle.value=varObjects[8];
            //	$('#CorpStanID.value=varObjects[9];	

            //	GetDueAmount();								

            //	return true;
            //}

            //return false;
        }

        //function SelRoomID_OnChange()
        //{
        //	$('#RoomID.value = $('#SelRoomID.options[$('#SelRoomID.selectedIndex].value;
        //	$('#RoomSign.value = $('#SelRoomID.options[$('#SelRoomID.selectedIndex].text;
        //	$('#hiRoomSign.value = $('#RoomSign.value;				
        //}


        //获得金额
        function GetDueAmount() {
            var strCommID = $("#CommID").val();
            var strCustID = $("#CustID").val();
            var strRoomID = $("#RoomID").val();
            var strHandID = $("#HandID").val();
            var strCostID = $("#CostID").val();
            var strStanID = $("#StanID").val();
            var strFeesStateDate = $("#FeesStateDate").val();
            var strFeesEndDate = $("#FeesEndDate").val();

            var strCalcAmount = $("#CalcAmount").val();
            var strCalcAmount2 = $("#CalcAmount2").val();

            var strIsCalc = $("#IsCalc").val();


            var strIsSplit = "1";
            if (getObject("CkIsSplit").checked == true) {
                strIsSplit = "1";
            }
            else {
                strIsSplit = "0";
            }

            //alert("|"+strFeesStateDate + "|" +strFeesEndDate + "|" + strIsCalc+"|"+strStanID+"|"+strCostID+"|"+strCustID)
            //alert(strIsCalc);
            if (strIsCalc == "0") {
                if ((strCommID != "") && (strCommID != "0") && (strCustID != "") && (strCustID != "0") && (strCostID != "") && (strCostID != "0") && (strStanID != "") && (strStanID != "0")) {
                    if (((strFeesStateDate != "") && (strFeesEndDate != "")) || ((strFeesStateDate == "") && (strFeesEndDate == ""))) {

                        getObject("results").innerHTML = "正在计算...";

                        $.tool.pageLoading();

                        $.ajax({
                            url: "../Charges/GetDueAmount.aspx?CommID=" + strCommID + "&CustID=" + strCustID + "&RoomID=" + strRoomID + "&HandID=" + strHandID + "&CostID=" + strCostID + "&StanID=" + strStanID + "&FeesStateDate=" + strFeesStateDate + "&FeesEndDate=" + strFeesEndDate + "&CalcAmount=" + strCalcAmount + "&CalcAmount2=" + strCalcAmount2 + "&IsSplit=" + strIsSplit + "&rdm=" + Math.random(),
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
                                    $('#DueAmount').val(varObjects[1]);
                                }
                                if (getObject("results").innerHTML.search("期间已计费") > 0) {
                                    $("#btnSaveAdd").attr("disabled", true);
                                    $("#btnSave").attr("disabled", true);
                                } else {
                                    $("#btnSaveAdd").attr("disabled", false);
                                    $("#btnSave").attr("disabled", false);
                                }
                            },
                            complete: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.tool.pageUnLoading();

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.tool.pageUnLoading();
                            }
                        });

                        //Request.sendPOST("../Charges/GetDueAmount.aspx", "CommID=" + strCommID + "&CustID=" + strCustID + "&RoomID=" + strRoomID + "&HandID=" + strHandID + "&CostID=" + strCostID + "&StanID=" + strStanID + "&FeesStateDate=" + strFeesStateDate + "&FeesEndDate=" + strFeesEndDate + "&CalcAmount=" + strCalcAmount + "&CalcAmount2=" + strCalcAmount2 + "&IsSplit=" + strIsSplit + "&rdm=" + Math.random(), callbackGetDueAmount)
                    }
                }
            }

        }
        function callbackGetDueAmount(xmlHttp) {
            var varReturn = xmlHttp.responseText;
            var varObjects = varReturn.split("\t");

            //if (varObjects[0]!="")
            //{
            //alert(varObjects[0]);					
            //}
            getObject("results").innerHTML = varObjects[0];

            if (varObjects[1] != "") {
                getObject("DueAmount").value = varObjects[1];
            }


            //alert(xmlHttp.responseText);
        }
        function Onblur_FeesDueDate() {
            getObject("AccountsDueDate").value = getObject("FeesDueDate").value;
        }


        function OnWinLoad() {
            if (getObject("hiOPType").value == "Insert") {
                GetDueAmount();
            }
        }
    </script>
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body onload="OnWinLoad();" style="overflow: hidden">
    <form id="FeesPastManage" method="post" runat="server">

        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                请输入客户名称和房屋编号
            </div>

            <div id="walkthrough-2">
                请输入费用项目
            </div>

            <div id="walkthrough-3">
                输入费用开始日期、费用结束日期、费用日期和应收日期
            </div>

            <div id="walkthrough-4">
                接下来点击保存就可以啦
            </div>
        </div>

        <input id="hiOPType" style="width: 32px; height: 22px" type="hidden" size="1" name="hiOPType"
            runat="server" />
        <input id="FeesID" style="width: 16px; height: 22px" type="hidden" size="1" name="FeesID"
            runat="server" /><input id="SysCostSign" style="width: 16px; height: 22px" type="hidden" size="1" name="SysCostSign"
                runat="server" />
        <input id="CostGeneType" style="width: 16px; height: 22px" type="hidden" size="1" name="CostGeneType"
            runat="server" />
        <input id="hiFeesDueDate" style="width: 8px; height: 22px" type="hidden" size="1" name="hiFeesDueDate"
            runat="server" /><input id="StanFormula" style="width: 8px; height: 22px" type="hidden" size="1" name="StanFormula"
                runat="server" />
        <input id="IsCalc" style="width: 8px; height: 22px" type="hidden" size="1" name="IsCalc"
            runat="server" />
        <input id="CorpStanID" style="width: 16px; height: 22px" type="hidden" size="1" name="CorpStanID"
            runat="server" />
        <input id="IsPost" style="width: 16px; height: 22px" type="hidden" size="1" name="IsPost"
            runat="server" />
        <input id="IncidentID" style="width: 8px; height: 22px" type="hidden" size="1" name="IncidentID"
            runat="server" /><input id="LeaseContID" style="width: 16px; height: 22px" type="hidden" size="1" name="LeaseContID"
                runat="server" /><input id="ContID" style="width: 16px; height: 22px" type="hidden" size="1" name="ContID"
                    runat="server" />
        <input id="HiHandID" style="width: 8px; height: 22px" type="hidden" size="1" name="HiHandID"
            runat="server" />
        <input id="hiCoordinateNum" style="width: 16px; height: 22px" type="hidden" size="1" name="ContID"
            runat="server" />
        <input id="hiFeesAmount" style="width: 16px; height: 22px" type="hidden" size="1" name="hiFeesAmount"
            runat="server" />
        <input id="HiFeesStateDate" style="width: 16px; height: 22px" type="hidden" size="1" name="hiFeesAmount"
            runat="server" />
        <input id="TmpFees" style="width: 16px; height: 22px" type="hidden" size="1" name="TmpFees"
            runat="server" />
        <input id="IsAuditing" style="width: 16px; height: 22px" type="hidden" size="1" name="IsAuditing"
            runat="server" /><input id="OrderCode" style="width: 16px; height: 22px" type="hidden" size="1" name="OrderCode"
                runat="server" /><input id="CommID" style="width: 16px; height: 22px" type="hidden" size="1" name="CommID"
                    runat="server" />
        <input id="hiDateNow" name="hiDateNow" runat="server" type="hidden" />
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td class="TdTitle">管理项目
                </td>
                <td class="TdContentSearch" colspan="3">
                    <input type="text" class="easyui-searchbox" searcher="SelComm" data-options="editable:false"
                        id="CommName" name="CommName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch" id="ones">
                    <input id="CustName"
                        maxlength="50" name="CustName" class="easyui-searchbox" data-options="editable:false" searcher="SelCust" runat="server" />
                    <input class="button_sel" id="btnSelCust"
                        type="button" value=" " name="btnSelCust" runat="server" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                            size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                size="1" name="hiCustName" runat="server" /></td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContent">
                    <asp:DropDownList ID="SelRoomID" runat="server" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" name="RoomSign" class="easyui-searchbox" data-options="editable:false" searcher="SelRoom" runat="server"><input class="button_sel" id="btnSelRoom" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                        type="button" value=" " name="btnSelRoom" runat="server"><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server"><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server"></td>
                <td class="TdTitle">车位</td>
                <td class="TdContent">
                    <asp:DropDownList ID="HandID" runat="server" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch" id="twos">
                    <input id="CostName"
                        name="CostName" class="easyui-searchbox" data-options="editable:false" searcher="SelCost" runat="server"><input class="button_sel" id="btnSelCost" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelCost" runat="server"><input id="hiCostName" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiCostName" runat="server"><input id="CostID" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="CostID" runat="server"></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContentSearch">
                    <input id="StanName" class="easyui-searchbox" data-options="editable:false"
                        name="StanName" searcher="SelStan" runat="server"><input class="button_sel" id="btnSelStan"
                            type="button" value=" " name="btnSelStan" runat="server"><input id="StanID" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="StanID" runat="server"><input id="hiStanName" style="width: 8px; height: 22px" type="hidden"
                                    size="1" name="hiStanName" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">计算方式</td>
                <td class="TdContent">
                    <input id="StanFormulaName"
                        readonly maxlength="50" size="26" name="StanFormulaName" runat="server">按<input id="ChargeCycle" style="width: 40px; height: 22px" readonly
                            maxlength="50" size="10" name="ChargeCycle" runat="server">月</td>
                <td class="TdTitle">计算标准</td>
                <td class="TdContent">
                    <input id="StanAmount" readonly maxlength="50"
                        size="10" name="StanAmount" runat="server"></td>
            </tr>
            <tr class="threes">
                <td class="TdTitle">费用开始日期</td>
                <td class="TdContent">
                    <input onkeypress="CheckSmallDate();" id="FeesStateDate" onblur="javascript:GetDueAmount();" class="Wdate"
                        onclick="WdatePicker()" maxlength="50" size="26" name="FeesStateDate"
                        runat="server"></td>
                <td class="TdTitle">费用结束日期</td>
                <td class="TdContent">
                    <input onkeypress="CheckSmallDate();" id="FeesEndDate" onblur="javascript:GetDueAmount();" class="Wdate"
                        onclick="WdatePicker()" maxlength="50" size="26" name="FeesEndDate"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">费用日期</td>
                <td class="TdContent">
                    <input id="FeesDueDate" onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })"
                        maxlength="50" size="26" class="Wdate" name="FeesDueDate" runat="server" onblur="javascript:Onblur_FeesDueDate();"></td>
                <td class="TdTitle">应收日期</td>
                <td class="TdContent">
                    <input id="AccountsDueDate"
                        onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" class="Wdate" maxlength="50" size="26" name="AccountsDueDate"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:Label ID="lbCalcAmount" runat="server">数　　量</asp:Label></td>
                <td class="TdContent">
                    <input id="CalcAmount" onblur="javascript:GetDueAmount();"
                        maxlength="50" size="12" style="width: 45%;" name="CalcAmount" runat="server">&nbsp;*
													<input onkeypress="CheckNumeric();" id="CalcAmount2" onblur="javascript:GetDueAmount();"
                                                        maxlength="50" size="12" value="1" name="CalcAmount2" style="width: 45%;"
                                                        runat="server"></td>
                <td class="TdTitle">收费金额</td>
                <td class="TdContent">
                    <input id="DueAmount"
                        maxlength="50" size="26" name="DueAmount" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">费用备注</td>
                <td class="TdContent" colspan="3">
                    <input id="FeesMemo" style="width: 90%; height: 22px" maxlength="50"
                        size="26" name="FeesMemo" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:CheckBox ID="CkIsSplit" runat="server" Text="按自然月分解" Checked="True"></asp:CheckBox></td>
                <td class="TdContent" colspan="3">
                    <div class="font_red" id="results"></div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContent" colspan="3">如果添加“费用日期”相同的费用，而已有费用未收取，将修改已有费用，将不作为新费用进行登记。</td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input id="btnSaveAdd" class="button" onclick="javascript: if (CheckData() == false) return false;"
                        value="保存并新增" type="button" name="btnSaveAdd" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                                                    type="button" value="保 存" name="btnSave" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input class="button" id="btnReturn" type="button" value="关闭"
                                                    name="btnReturn" runat="server" /></td>
            </tr>
        </table>
        <script type="text/javascript">

            $('#btnSelCust').hide();
            $('#btnSelRoom').hide();
            $('#btnSelCost').hide();
            $('#btnSelStan').hide();

            function Init() {
                if ($('#hiOPType').val() != 'Insert') {
                    $('#CommName').attr("disabled", "disabled");
                    $('#CustName').attr("disabled", "disabled");
                    $('#RoomSign').attr("disabled", "disabled");
                    $('#CostName').attr("disabled", "disabled");
                    $('#StanName').attr("disabled", "disabled");
                }
            }
            Init();


            function SelComm() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelComm.aspx', '管理项目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        //var Obj = JSON.parse(_Data);

                        var arrRet = JSON.parse(_Data);
                        $("#CommID").val(arrRet.id);
                        $("#CommName").searchbox("setValue", arrRet.name);
                        //$("#CommIDs").val(arrRet.id);
                        //$("#CommNames").val(arrRet.name);
                    }
                });
            }

            function SelCust() {
                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }

                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择管理项目,此项不能为空!");
                    return;
                }

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#hiRoomSign').val('');
                $('#RoomID').val('');
                $('#hiCustName').val('');
                $('#RoomSign').searchbox("setValue", '');

                var conent = "../DialogNew/CustDlg.aspx" + "?CommID=" + vCommID;

                HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#hiCustName').val(data.CustName);
                    ClearStan();
                    document.getElementById('btnSelCust').click();

                });
            }

            function SelRoom() {
                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }

                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择社区,此项不能为空!");
                    return;
                }

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#hiRoomSign').val('');
                $('#RoomID').val('');
                $('#hiCustName').val('');
                $('#RoomSign').searchbox("setValue", '');

                var conent = "../DialogNew/RoomDlg.aspx" + "?CommID=" + vCommID;

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);
                    $('#hiCustName').val(data.CustName);
                    $('#hiRoomSign').val(data.RoomSign);
                    ClearStan();
                    document.getElementById('btnSelRoom').click();
                });

            }
            function SelCost() {

                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }
                var vCommID = $('#CommID').val();

                if (vCommID == "") {
                    HDialog.Info("请选择社区,此项不能为空!");
                    return;
                }

                var tmpCostGeneType = $('#CostGeneType').val();
                var conent;
                if ($('#IncidentID').val() != "") {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&IncidentID=" + $('#IncidentID').val() + "&Ram=" + Math.random();
                }
                else if ($('#HiHandID').val() != "") {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&IsPark=parktax" + "&Ram=" + Math.random();
                }
                else {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&Ram=" + Math.random();
                }


                HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        //var varObjects = _Data.split("\t");

                        //$('#CostID').val(varObjects[0]);
                        //$('#CostName').searchbox('setValue', varObjects[1]);
                        //$('#hiCostName').searchbox('setValue', varObjects[1]);

                        var data = JSON.parse(_Data);
                        $('#CostName').searchbox("setValue", data.CostName);
                        $('#CostID').val(data.CostID);
                        $('#hiCostName').val(data.CostName);
                        ClearStan();
                        document.getElementById('btnSelCost').click();
                    }
                });

            }
            function SelStan() {
                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }
                var vCommID = $('#CommID').val();
                var tmpCostID = $('#CostID').val();

                if (tmpCostID == "") {
                    HDialog.Info("请选择费用项目,此项不能为空!");
                }
                else {
                    var conent = "../dialogNew/NewStanDlg.aspx?CommID=" + vCommID + "&CostID=" + tmpCostID;


                    HDialog.Open('700', '400', conent, '收费标准选择', false, function callback(_Data) {


                        if (_Data != "") {//**获得返回 刷新


                            var data = JSON.parse(_Data);

                            $('#StanID').val(data.StanID);
                            $('#StanName').searchbox('setValue', data.StanName);
                            $('#hiStanName').val(data.hiStanName);

                            $('#StanFormula').val(data.StanFormula);
                            $('#StanFormulaName').val(data.StanFormulaName);
                            $('#StanAmount').val(data.StanAmount);
                            $('#ChargeCycle').val(data.ChargeCycle);
                            $('#CorpStanID').val(data.CorpStanID);

                            GetDueAmount();

                            document.getElementById('btnSelStan').click();
                        }
                    });
                }
            }
        </script>

        <script>
            if (getUrlParam("is_show") == "1") {
                $('body').pagewalkthrough({
                    name: 'introduction',
                    steps: [{
                        wrapper: '#ones',
                        popup: {
                            content: '#walkthrough-1',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#twos',
                        popup: {
                            content: '#walkthrough-2',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: ".threes",
                        popup: {
                            content: '#walkthrough-3',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#btnSave',
                        popup: {
                            content: '#walkthrough-4',
                            type: 'tooltip',
                            position: 'top'
                        },
                        onLeave: function () {
                            HDialog.Close("1");
                        }
                    }
                    ],
                    buttons: {
                        jpwNext: {
                            i18n: "下一步 &rarr;"
                        },
                        jpwFinish: {
                            i18n: "结束指引 &rarr;"
                        },
                        jpwPrevious: {
                            i18n: "&larr; 上一步"
                        },
                        jpwClose: {
                            i18n: "关闭",
                        }
                    }
                });
                $('body').pagewalkthrough('show');
            }

            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
