<%@ Page Language="c#" CodeBehind="FeesSporadicManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.FeesSporadicManage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>费用输入</title>

    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="documesssnt"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script type="text/javascript">
		<!--
    $(function () {


        $("#btnSaveAddA").click(function () {
            CheckIsOverAcount("SaveAdd");
        });

        $("#btnSaveA").click(function () {
            CheckIsOverAcount("Save");
        });

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

    function CheckIsOverAcount(type) {
        $('#CheckDates').val($("#FeesDueDate").val());

        if ($('#CostID').val() == "" || $('#CostID').val() == "0") {
            HDialog.Info("请选择费用项目,此项不能为空!");

            return false;
        }
        //判断所选费用是否设置增值税率
        $.tool.DataPost('TaxRateSetting', 'CheckNoSetTaxCost', 'CostIDs=' + $('#CostID').val(), function Init() {
        },
            function callback(_Data) {
                if (_Data == "true") {
                    $.tool.DataPostChk('FeesSporadicManage', 'WriteOff', 'GetOverAccountsSetInfoByCommID', $('#FeesSporadicManage').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "") {
                                $("#IsOverAcount").val("1"); //没有设置关账信息
                                $.tool.DataPostChk('FeesSporadicManage', 'WriteOff', 'NoAccountsCheckDate', $('#FeesSporadicManage').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "1") {

                                            HDialog.Info("不能操作往月费用！");
                                        } else {
                                            if (type == "SaveAdd") {
                                                if (CheckData()) {
                                                    $('#btnSaveAdd').click();
                                                }
                                            } else {
                                                if (CheckData()) {
                                                    $('#btnSave').click();
                                                }
                                            }
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });


                            } else {
                                //已设置关账信息
                                //判断是否已结账 2017-11-8 14:59:30
                                $.tool.DataPostChk('FeesSporadicManage', 'WriteOff', 'CheckIsWriteOff', $('#FeesSporadicManage').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "True") {
                                            HDialog.Info("已关账，不能输入费用！！！");
                                            return;
                                        } else {
                                            if (type == "SaveAdd") {
                                                if (CheckData()) {
                                                    $('#btnSaveAdd').click();
                                                }
                                            } else {
                                                if (CheckData()) {
                                                    $('#btnSave').click();
                                                }
                                            }
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
                else {
                    HDialog.Info(_Data);
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });

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
        if ($('#AccountsDueDate').val() == "") {
            HDialog.Info("请输入应收日期,此项不能为空!");
            return false;
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
    function GetNewAreaAmount() {
        var strRoomID = $("#RoomID").val();
        if (strRoomID != "") {

        }
    }

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
                    $('#qjjfxx').hide();
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

                            if (varObjects[0].indexOf('期间已计费') > -1) {
                                $('#qjjfxx').show();
                                LoadFeesList();
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

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    $(document).ready(function () {

        if (GetQueryString("ShowType") == "1") {
            $('body').pagewalkthrough({
                name: 'introduction3',
                steps: [{
                    wrapper: '#TdCostName',
                    popup: {
                        content: '<span style=\'font-size:30px\'>选择费用项目</span>',
                        type: 'tooltip',
                        position: 'bottom'
                    }
                },
                {
                    wrapper: '#FeesStateDate',
                    popup: {
                        content: '<span style=\'font-size:30px\'>输入费用开始日期</span>',
                        type: 'tooltip',
                        position: 'bottom'
                    }
                }, {
                    wrapper: '#FeesEndDate',
                    popup: {
                        content: '<span style=\'font-size:30px\'>输入费用结束日期</span>',
                        type: 'tooltip',
                        position: 'bottom'
                    }
                },
                {
                    wrapper: '#FeesDueDate',
                    popup: {
                        content: '<span style=\'font-size:30px\'>输入费用日期</span>',
                        type: 'tooltip',
                        position: 'bottom'
                    }
                },
                {
                    wrapper: '#AccountsDueDate',
                    popup: {
                        content: '<span style=\'font-size:30px\'>输入应收日期</span>',
                        type: 'tooltip',
                        position: 'bottom'
                    }
                },
                {
                    wrapper: '#btnSave',
                    popup: {
                        content: '<span style=\'font-size:30px\'>点击保存</span>',
                        type: 'tooltip',
                        position: 'top'
                    },
                    onLeave: function (e) {
                        if (e) {
                            HDialog.Close("true")
                        }
                    }
                }
                ],
                buttons: {
                    jpwNext: {
                        i18n: "下一步 &rarr;"
                    },
                    jpwFinish: {
                        i18n: "结束指引 &#10004;",
                    },
                    jpwPrevious: {
                        i18n: "&larr; 上一步"
                    },
                    jpwClose: {
                        i18n: "关闭",
                    }
                },
                onClose: function () {
                    HDialog.Close()
                }
            })

            $('body').pagewalkthrough('show');
        }
    }



    )

    //-->
    </script>
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body onload="OnWinLoad();" style="overflow: auto">
    <form id="FeesSporadicManage" method="post" runat="server">
        <input id="BK" value="TRUE" name="BK" type="hidden" runat="server" />
        <input id="IsOverAcount" type="hidden" size="1" name="IsOverAcount" runat="server" value="0" />
        <input id="IsAddMonth" type="hidden" size="1" name="IsAddMonth" runat="server" value="0" />
        <input id="CheckDates" type="hidden" size="1" name="CheckDates" runat="server" />
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server" />
        <input id="RenoID" type="hidden" size="1" name="RenoID" runat="server" />
        <input id="CustCardID" type="hidden" size="1" name="CustCardID" runat="server" />
        <input id="HoldID" type="hidden" size="1" name="HoldID" runat="server" />
        <input id="FeesID" type="hidden" size="1" name="FeesID" runat="server" />
        <input id="SysCostSign" type="hidden" size="1" name="SysCostSign" runat="server" />
        <input id="CostGeneType" type="hidden" size="1" name="CostGeneType" runat="server" />
        <input id="hiFeesDueDate" type="hidden" size="1" name="hiFeesDueDate" runat="server" />
        <input id="StanFormula" type="hidden" size="1" name="StanFormula" runat="server" />
        <input id="IsCalc" type="hidden" size="1" name="IsCalc" runat="server" />
        <input id="CorpStanID" type="hidden" size="1" name="CorpStanID" runat="server" />
        <input id="IsPost" type="hidden" size="1" name="IsPost" runat="server" />
        <input id="IncidentID" type="hidden" size="1" name="IncidentID" runat="server" />
        <input id="LeaseContID" type="hidden" size="1" name="LeaseContID" runat="server" />
        <input id="ContID" type="hidden" size="1" name="ContID" runat="server" />
        <input id="HiHandID" type="hidden" size="1" name="HiHandID" runat="server" />
        <input id="hiCoordinateNum" type="hidden" size="1" name="ContID" runat="server" />
        <input id="hiFeesAmount" type="hidden" size="1" name="hiFeesAmount" runat="server" />
        <input id="HiFeesStateDate" type="hidden" size="1" name="hiFeesAmount" runat="server" />
        <input id="TmpFees" type="hidden" size="1" name="TmpFees" runat="server" />
        <input id="IsAuditing" type="hidden" size="1" name="IsAuditing" runat="server" />
        <input id="OrderCode" type="hidden" size="1" name="OrderCode" runat="server" />
        <input id="CommID" type="hidden" size="1" name="CommID" runat="server" />
        <input id="HChargesMode" type="hidden" size="1" name="HChargesMode" runat="server" />
        <input id="AreaChage" type="hidden" size="1" name="AreaChage" runat="server" />
        <input id="hiPayType" type="hidden" size="1" name="hiPayType" runat="server" />
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input id="CustName"
                        maxlength="50" name="CustName" class="easyui-searchbox" searcher="SelCust" data-options="editable:false" runat="server" />
                    <input class="button_sel" id="btnSelCust"
                        type="button" value=" " name="btnSelCust" runat="server" visible="True" />
                    <input id="CustID" type="hidden" size="1" name="CustID" runat="server" />
                    <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server" />
                    <input id="hCustType" type="hidden" size="1" name="hCustType" runat="server" />
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContent">
                    <asp:DropDownList ID="SelRoomID" runat="server" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" name="RoomSign" class="easyui-searchbox" searcher="SelRoom" data-options="editable:false" runat="server"><input class="button_sel" id="btnSelRoom" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                        type="button" value=" " name="btnSelRoom" runat="server"><input id="RoomID" type="hidden"
                            size="1" name="RoomID" runat="server"><input id="hiRoomSign" type="hidden"
                                size="1" name="hiRoomSign" runat="server"></td>
                <td class="TdTitle">车位</td>
                <td class="TdContent">
                    <asp:DropDownList ID="HandID" runat="server" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch" id="TdCostName">
                    <input id="CostName"
                        name="CostName" class="easyui-searchbox" searcher="SelCost" data-options="editable:false" runat="server"><input class="button_sel" id="btnSelCost" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                            type="button" value=" " name="btnSelCost" runat="server"><input id="hiCostName" type="hidden"
                                size="1" name="hiCostName" runat="server"><input id="CostID" type="hidden"
                                    size="1" name="CostID" runat="server">
                </td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContentSearch">
                    <input id="StanName" class="easyui-searchbox"
                        name="StanName" searcher="SelStan" data-options="editable:false" runat="server"><input class="button_sel" id="btnSelStan"
                            type="button" value=" " name="btnSelStan" runat="server"><input id="StanID" type="hidden"
                                size="1" name="StanID" runat="server"><input id="hiStanName" type="hidden"
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
            <tr>
                <td class="TdTitle">应收开始日期</td>
                <td class="TdContent">
                    <input onkeypress="CheckSmallDate();" id="FeesStateDate" onblur="javascript:GetDueAmount();" class="Wdate"
                        onclick="WdatePicker()" maxlength="50" size="26" name="FeesStateDate"
                        runat="server"></td>
                <td class="TdTitle">应收结束日期</td>
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
            <tr id="AdjustAreaTr" style="display: none">
                <td class="TdTitle">调整面积</td>
                <td class="TdContent" colspan="1">
                    <input id="AdjustArea" style="width: 90%; height: 22px"
                        size="26" name="AdjustArea" runat="server"></td>
                <td>
                    <input class="button" id="SureAdjust" type="button" value="重新计算" name="SureAdjust" /></td>
            </tr>
            <tr>
                <td class="TdTitle">费用备注</td>
                <td class="TdContent" colspan="3">
                    <input id="FeesMemo" style="width: 90%; height: 22px"
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
                    <input id="btnSaveAdd" type="button" value="保存并新增" runat="server" style="display: none" />
                    <input id="btnSave" type="button" value="保存" runat="server" style="display: none" />
                    <input id="btnSaveAddA" class="button" value="保存并新增" type="button" name="btnSaveAddA" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnSaveA" type="button" value="保 存" name="btnSaveA" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server" /></td>
            </tr>
        </table>
        <div id="qjjfxx" style="height: 300px"></div>
        <script type="text/javascript">

            $('#btnSelCust').hide();
            $('#btnSelRoom').hide();
            $('#btnSelCost').hide();
            $('#btnSelStan').hide();
            $('#qjjfxx').hide();
            function Init() {
                if ($('#hiOPType').val() != 'Insert') {
                    $('#CustName').attr("disabled", "disabled");
                    $('#RoomSign').attr("disabled", "disabled");
                    $('#CostName').attr("disabled", "disabled");
                    $('#StanName').attr("disabled", "disabled");
                }
            }
            Init();
            function SelCust() {
                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#hiRoomSign').val('');
                $('#RoomID').val('');
                $('#hiCustName').val('');
                $('#RoomSign').searchbox("setValue", '');



                var conent = "../DialogNew/CustDlg.aspx?CommID=" + $('#CommID').val();

                HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#hiCustName').val(data.CustName);
                    $('#hCustType').val(data.CustTypeID);
                    ClearStan();
                    document.getElementById('btnSelCust').click();

                });


            }

            function SelRoom() {
                if ($('#hiOPType').val() != 'Insert') {
                    return;
                }

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#hiRoomSign').val('');
                $('#RoomID').val('');
                $('#hiCustName').val('');
                $('#RoomSign').searchbox("setValue", '');

                var conent = "../DialogNew/RoomDlg.aspx?CommID=" + $('#CommID').val();

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
                var tmpCostGeneType = $('#CostGeneType').val();
                var conent;
                if ($('#IncidentID').val() != "") {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&IncidentID=" + $('#IncidentID').val() + "&Ram=" + Math.random();
                }
                else if ($('#HiHandID').val() != "") {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&IsPark=parktax" + "&Ram=" + Math.random();
                }
                else if ($('#RenoID').val() != "") {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&RenoID=" + $('#RenoID').val() + "&Ram=" + Math.random();
                }
                else if ($('#CustCardID').val() != "") {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&RenoID=" + $('#CustCardID').val() + "&Ram=" + Math.random();
                }
                else {
                    conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&Ram=" + Math.random();
                }


                HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新

                        var data = JSON.parse(_Data);
                        if (data.IsSealed == "1") {
                            $('#CostID').val('');
                            $('#CostName').searchbox('setValue', '');
                            $('#hiCostName').val('');
                            HDialog.Info('费项【' + data.CostName + '】已封存，请重新选择！！！');
                            return;
                        }

                        if (data.SysCostSign == "H0000") {
                            HDialog.Info('费用输入不能选择合同类费用');
                            return;
                        }

                        if ($("#BK").val() == "TRUE") {
                            if (data.SysCostSign == "BK0001") {
                                HDialog.Info('费用输入不能选择办卡类费用');
                                return;
                            }
                        }

                        $('#CostName').searchbox("setValue", data.CostName);
                        $('#CostID').val(data.CostID);
                        $('#hiCostName').val(data.CostName);
                        if (data.PrentCostCode == "0001") {
                            $('#IsAddMonth').val("1");
                        } else {
                            $('#IsAddMonth').val("0");
                        }
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

            var frozenColumns = [[
                { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
                { field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 200 },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 200 },
                { field: 'ParkName', title: '车位编号', align: 'left', sortable: true, width: 100 }
            ]]

            var column = [[
                { field: 'BuildArea', title: '建筑面积', align: 'left', sortable: true, width: 70 },
                { field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 100 },
                { field: 'StanName', title: '标准名称', align: 'left', sortable: true, width: 170 },
                { field: 'FeeDueYearMonth', title: '费用日期', align: 'left', sortable: true, width: 100 },
                {
                    field: 'AccountsDueDate', title: '应收日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', align: 'left', sortable: true, width: 100, formatter: function (value, row, index) {
                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'StartDegree', title: '起度', align: 'left', sortable: true, width: 70 },
                { field: 'EndDegree', title: '止度', align: 'left', sortable: true, width: 70 },
                { field: 'CalcAmount', title: '数量1', align: 'left', sortable: true, width: 70 },
                { field: 'CalcAmount2', title: '数量2', align: 'left', sortable: true, width: 70 },
                { field: 'DueAmount', title: '应收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PaidAmount', title: '实收金额', align: 'left', sortable: true, width: 100 },
                { field: 'PrecAmount', title: '预交冲抵', align: 'left', sortable: true, width: 100 },
                { field: 'WaivAmount', title: '减免冲抵', align: 'left', sortable: true, width: 100 },
                { field: 'RefundAmount', title: '退款金额', align: 'left', sortable: true, width: 100 },
                { field: 'DebtsAmount', title: '欠收金额', align: 'left', sortable: true, width: 100 },
                { field: 'IsPrecName', title: '是否预收', align: 'left', sortable: true, width: 100 },
                { field: 'FeesMemo', title: '备注', align: 'left', sortable: true, width: 100 }
            ]];


            function LoadFeesList() {

                var strCommID = $("#CommID").val();
                var strCustID = $("#CustID").val();
                var strRoomID = $("#RoomID").val();
                var strHandID = $("#HandID").val();
                var strCostID = $("#CostID").val();
                var strStanID = $("#StanID").val();
                var strFeesStateDate = $("#FeesStateDate").val();
                var strFeesEndDate = $("#FeesEndDate").val();

                $("#qjjfxx").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "Post",
                    nowrap: false,
                    title: '期间计费信息',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    rownumbers: true,
                    border: false,
                    width: "100%",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Fees", "FeesPeriodList", "qjjfxx", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            function isNumber(s) {
                var regu = "^[0-9]+\.?[0-9]*$";
                //	var regu = "^[0-9]*$";
                var re = new RegExp(regu);
                if (re.test(s)) {
                    return true;
                }
                else {
                    return false;
                }
            }



            $("#SureAdjust").click(function () {
                if ($("#RoomID").val() == "") {
                    HDialog.Info("请选择房屋");
                    return;
                }
                if (isNumber($("#AdjustArea").val()) == false) {
                    HDialog.Info("请输入正确的房屋面积");
                    return;
                }
                $.post("/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=MarketingLoop&Command=UpdateRoomArea", { "RoomID": $("#RoomID").val(), "Area": $("#AdjustArea").val() }, function (data) {
                    GetDueAmount();
                    $("#AreaChage").val("1");
                });
            });

            $(function () {
                var costname = $("#CostName").searchbox('getValue');
                if (costname.indexOf("物业服务费") >= 0) {
                    $("#AdjustAreaTr").show(0);
                }
                else {
                    $("#AdjustAreaTr").hide(0);
                }
                if ($("#RoomID").val() != "" && $("#RoomID").val() != "-1") {
                    //获取建筑面积
                    $.post("/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=MarketingLoop&Command=GetBuildArea", { "RoomID": $("#RoomID").val() }, function (data) {
                        $("#AdjustArea").val(data);
                    });
                }
            })
        </script>
    </form>
</body>
</html>
