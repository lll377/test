<%@ Page Language="c#" CodeBehind="RefundFeesNewBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.RefundFeesNewBrowse" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>RefundFeesBrowse</title>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framedialog_eightcol.css" rel="stylesheet" />
    <style type="text/css">
        .panel {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
		<!--
    function btnClear_OnClick() {
        $('#CustID').val('');

        $('#CustName').searchbox("setValue", '');
        $('#hiCustName').val('');


        $('#RoomID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#hiRoomSign').val('');

        $('#SelectRoomID').searchbox("setValue", '');
      
 

         
        

    }
    function CheckData() {
        if ($('#CustID').val() == "0") {
            $('#CustID').val('');
        }
        if ($('#CostID').val() == "0") {
            $('#CostID').val('');
        }
        if ($('#CustID').val() == "") {
            HDialog.Info("请选择客户,此项不能为空!");

            return false;
        }
        if ($('#CostID').val() == "") {
            HDialog.Info("请选择费用项目,此项不能为空!");

            return false;
        }
        if ($('#BillsSign').val() == "") {
            HDialog.Info("请选择退款凭据票号!");
            return false;
        }
        if ($('#DrawIdentityCard').val() == "") {
            HDialog.Info("请输入证件号码!");
            return false;
        }


        return true;
    }


    function GetElements(obj, tag, result) {
        if (!result) {
            var result = new Array();
        }

        if (obj) {
            if (obj.tagName == tag) {
                result[result.length] = obj;
            }
            if (obj.children) {
                for (var i = 0; i != obj.children.length; i++) {
                    result = GetElements(obj.children[i], tag, result);
                }
            }
        }
        return result;
    }

    function checkFormAll(chk) {
        document.all.btnSave.disabled = true;
        document.all.RefundAmount.value = "";
        var val = document.all.SelReturn.value;
        var form = document.getElementById("RefundFeesBrowse");
        var chkval = "";
        var SelCount = 0;

        var elements = GetElements(document.getElementById("DGrid"), 'INPUT');

        var elementsPrec = GetElements(document.getElementById("DGridPrec"), 'INPUT');

        for (var i = 0; i < elementsPrec.length; i++) {
            if (elementsPrec[i].type == "checkbox") {
                if (elementsPrec[i].checked == true) {
                    chk.checked = false;
                    window.HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                    return;
                }
            }
        }
        for (var i = 0; i < elements.length; i++) {
            if (elements[i].type == "checkbox") {
                if ((elements[i].value != "on") && (elements[i].disabled == false)) {
                    chkval = "," + elements[i].value

                    if (chk.checked) {
                        SelCount = SelCount + 1;
                        if (val.indexOf(chkval) < 0) {
                            val = val + chkval
                        }

                    }
                    else {
                        val = val.replace(chkval, "")
                    }

                    elements[i].checked = chk.checked

                }
            }
        }
        if (SelCount > 6) {
            //HDialog.Info("提示：最多一次可选择6笔费用！");//点确定继续
        }
        else {
            document.all.hiBusinessType.value = 1;
            document.all.SelReturn.value = val

            GetRefundFeesAmount(1);
        }
        //HDialog.Info(document.document.all.SelReturn.value)
    }

    function checkFormOne(chk) {
        document.all.btnSave.disabled = true;
        document.all.RefundAmount.value = "";
        var val = document.all.SelReturn.value;
        var val2 = Number(document.all.selcout.value);
        var chkval = "";
        chkval = "," + chk.value

        var elementsPrec = GetElements(document.getElementById("DGridPrec"), 'INPUT');

        for (var i = 0; i < elementsPrec.length; i++) {
            if (elementsPrec[i].type == "checkbox") {
                if (elementsPrec[i].checked == true) {
                    chk.checked = false;
                    window.HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                    return;
                }
            }
        }

        if (chk.checked) {
            if (val2 == "") {
                val2 = 0;
            }
            if (val.indexOf(chkval) < 0) {
                val = val + chkval
                val2 = val2 + 1;
            }


        }
        else {
            val = val.replace(chkval, "")

        }

        document.all.SelReturn.value = val
        document.all.selcout.value = val2
        if (Number(document.all.selcout.value) > 6) {
            //HDialog.Info("提示：最多一次可选择6笔费用！");//点确定继续
        }
        else {
            document.all.hiBusinessType.value = 1;
            //HDialog.Info(document.document.all.SelReturn.value);
            GetRefundFeesAmount(1);
        }

    }

    function checkFormPrecAll(chk) {
        document.all.btnSave.disabled = true;
        document.all.RefundAmount.value = "";
        var val = document.all.SelReturn.value;
        var form = document.getElementById("RefundFeesBrowse");
        var chkval = "";
        var SelCount = 0;

        var elements = GetElements(document.getElementById("DGridPrec"), 'INPUT');
        var elementsDetail = GetElements(document.getElementById("DGrid"), 'INPUT');

        for (var i = 0; i < elementsDetail.length; i++) {
            if (elementsDetail[i].type == "checkbox") {
                if (elementsDetail[i].checked == true) {
                    chk.checked = false;
                    window.HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                    return;
                }
            }
        }

        for (var i = 0; i < elements.length; i++) {
            if (elements[i].type == "checkbox") {
                if ((elements[i].value != "on") && (elements[i].disabled == false)) {
                    chkval = "," + elements[i].value

                    if (chk.checked) {
                        SelCount = SelCount + 1;
                        if (val.indexOf(chkval) < 0) {
                            val = val + chkval
                        }

                    }
                    else {
                        val = val.replace(chkval, "")
                    }

                    elements[i].checked = chk.checked

                }
            }
        }
        if (SelCount > 6) {
            //HDialog.Info("提示：最多一次可选择6笔费用！");//点确定继续
        }
        else {
            document.all.hiBusinessType.value = 2;
            document.all.SelReturn.value = val
            GetRefundFeesAmount(2);
        }
    }

    function checkFormPrecOne(chk) {
        document.all.btnSave.disabled = true;
        document.all.RefundAmount.value = "";
        var val = document.all.SelReturn.value;
        var val2 = Number(document.all.selcout.value);
        var chkval = "";
        chkval = "," + chk.value
        var elementsDetail = GetElements(document.getElementById("DGrid"), 'INPUT');

        for (var i = 0; i < elementsDetail.length; i++) {
            if (elementsDetail[i].type == "checkbox") {
                if (elementsDetail[i].checked == true) {
                    chk.checked = false;
                    window.HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                    return;
                }
            }
        }

        if (chk.checked) {
            if (val2 == "") {
                val2 = 0;
            }
            if (val.indexOf(chkval) < 0) {
                val = val + chkval
                val2 = val2 + 1;
            }


        }
        else {
            val = val.replace(chkval, "")

        }

        document.all.SelReturn.value = val
        document.all.selcout.value = val2
        if (Number(document.all.selcout.value) > 6) {
            //HDialog.Info("提示：最多一次可选择6笔费用！");//点确定继续
        }
        else {
            document.all.hiBusinessType.value = 2;
            //HDialog.Info(document.document.all.SelReturn.value);
            GetRefundFeesAmount(2);
        }

    }


    //合计金额
    function GetRefundFeesAmount(strBusinessType) {
        $("#RefundAmount").val('');
        var strRefundFeesIDS = $("#SelReturn").val();
        strRefundFeesIDS = ',' + strRefundFeesIDS;

        Request.sendPOST("GetRefundFeesAmount.aspx", "RefundFeesIDS=" + strRefundFeesIDS + "&BusinessType=" + strBusinessType + "&Rdm=" + Math.random(), callbackBRefundFeesAmoun);
    }

    function callbackBRefundFeesAmoun(xmlHttp) {
        var varReturn = xmlHttp.responseText;

        if (varReturn != "") {
            var Search = eval('(' + varReturn + ')');

            var SearchData = Search.SelData.Data;

            $("#RefundAmount").val('');
            //getObject("hiBillsSign").value = "";

            for (var i = 0; i < SearchData.length; i++) {
                getObject(SearchData[i].Name).value = SearchData[i].Val;
                //document.all.btnSave.disabled = false;

                if (SearchData[i].Name == "LabTitle") {
                    getObject(SearchData[i].Name).innerText = SearchData[i].Val;
                    if (SearchData[i].Val != "") {
                        //document.all.btnSave.disabled=true;
                    }

                }
            }
        }
        else {
            $("#RefundAmount").val('');
            //document.all.btnSave.disabled = true;


        }




    }

    //收据类别
    function onchangeBillType() {
        var strBillType = getObject("BillType").value;

        Request.sendPOST("GetFirstBillsSign.aspx", "InvoiceType=" + strBillType + "&Rdm=" + Math.random(), callbackBillType);
    }

    function callbackBillType(xmlHttp) {
        var varReturn = xmlHttp.responseText;

        if (varReturn != "") {
            var Search = eval('(' + varReturn + ')');

            var SearchData = Search.SelData.Data;

            $('#BillsSign').searchbox("setValue", SearchData[0].Val);
            $('#hiBillsSign').val(SearchData[0].Val);
            //getObject("BillsSign").value = "";
            //getObject("hiBillsSign").value = "";

            //for(var i=0; i<SearchData.length; i++)
            //{

            //	getObject(SearchData[i].Name).value = SearchData[i].Val;


            //}
        }
        else {
            $('#BillsSign').searchbox("setValue", '');
            $('#hiBillsSign').val('');
        }
    }

    function CheckData() {
        if ($('#BillsSign').val() == "") {
            HDialog.Info("请选择退款凭据票号!");
            return false;
        }
        if ($('#DrawIdentityCard').val() == "") {
            HDialog.Info("请输入证件号码!");
            return false;
        }

        return true;
    }

    function btnSelBill_OnClick() {
        var strBillTypeID = getObject("BillType").value;

        if ((strBillTypeID == "0") || (strBillTypeID == "")) {
            HDialog.Info("请选择凭据类别,此项不能为空!");
            document.all.BillType.focus();
            return false;
        }

        var varReturn;

        varReturn = showModalDlg("../dialog/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random(), "", 650, 430);


        //HDialog.Info("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            document.all.BillsSign.value = varObjects[0];
            document.all.hiBillsSign.value = varObjects[0];
            return true;
        }

    }

    //-->
    </script>
</head>
<body style="overflow-y:auto">
    <form id="RefundFeesBrowse" method="post" runat="server">
        <input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
            runat="server" />
        <input id="hiSearchData" style="width: 16px; height: 22px" type="hidden" size="1" name="hiSearchData"
            runat="server" /><input id="hiSearchSql" style="width: 16px; height: 22px" type="hidden" size="1" name="hiSearchSql"
                runat="server" /><input id="TableSign" style="width: 16px; height: 22px" type="hidden" size="1" name="TableSign"
                    runat="server" /><input id="SelReturn" style="width: 24px; height: 22px" type="hidden" size="1" name="SelReturn"
                        runat="server" /><input id="selcout" style="width: 24px; height: 22px" type="hidden" size="1" name="selcout"
                            runat="server" /><input id="hiBusinessType" style="width: 24px; height: 22px" type="hidden" size="1" name="hiBusinessType"
                                runat="server" /><input id="ReceID" style="width: 32px; height: 22px" type="hidden" size="1" name="ReceID"
                                    runat="server" />

        <input id="hDGridData" style="width: 24px; height: 22px" type="hidden" size="1" name="hDGridData"
            runat="server" />
        <input id="hDGridPrecData" style="width: 24px; height: 22px" type="hidden" size="1" name="hDGridPrecData"
            runat="server" />
        <table class="DialogTable" id="table1" cellspacing="0" cellpadding="0">

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第一步:选择客户</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 2px"></td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input id="CustName" searcher="SelCust" style="width: 76%;"
                        name="CustName" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                            size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                size="1" name="hiCustName" runat="server" /></td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" style="width: 76%;" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 2px"></td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" searcher="SelRoom" style="width: 76%;"
                        name="RoomSign" class="easyui-searchbox" data-options="editable:false" runat="server" /><input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiRoomSign" runat="server" /></td>
                <td class="TdTitle">当前欠费</td>
                <td class="TdContent"><asp:label id="DueAmount" runat="server"></asp:label></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnFilter" type="button" value="查询" name="btnFilter" runat="server"
                        style="z-index: 0">&nbsp;&nbsp;&nbsp;&nbsp;<input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();" type="button"
                            value="清空" name="btnClear" runat="server" style="z-index: 0"></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 2px"></td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第二步：选择费用</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 2px"></td>
            </tr>
        </table>
        <table class="DialogTable" id="table2" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" width="100%">
                    <div class="SearchContainer" id="DGrid" style="height:200px"></div>
                    <div class="SearchContainer" id="DGridPrec" style="height:200px"></div>
                    <asp:Label ID="LabTitle" runat="server" ForeColor="Red"></asp:Label>

                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 2px"></td>
            </tr>
        </table>

        <table class="DialogTable" id="table3" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top">
                    <table class="DialogTable" cellspacing="0" cellpadding="0">

                        <tr>
                            <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第三步：退款确认</span> </td>
                        </tr>
                        <tr><td colspan="4" style="height:5px;"></td></tr>
                        <tr>
                            <td class="TdTitle">退款金额</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="RefundAmount" readonly
                                    name="RefundAmount" runat="server"></td>
                            <td class="TdTitle">退款方式</td>
                            <td class="TdContent">
                                <select id="ChargeMode" name="ChargeMode" data-options="required:true" runat="server">
                                    <option selected></option>
                                </select></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">退款凭据类别</td>
                            <td class="TdContent">
                                <select id="BillType" name="BillType" runat="server" data-options="required:true" onchange="onchangeBillType();"></select></td>
                            <td class="TdTitle">退款凭据票号</td>
                            <td class="TdContentSearch">
                                <input id="BillsSign" searcher="SelBillsSign" style="width: 76%;" 
                                    name="BillsSign" runat="server" class="easyui-searchbox"  data-options="editable:false" />
                                <%-- <input class="button_sel" id="btnSelBill" onclick="javascript:if(btnSelBill_OnClick()==false) return false;"
                                    type="button" value=" " name="btnSelBill" runat="server">--%>
                                <input class="easyui-validatebox" id="hiBillsSign" style="width: 8px; height: 19px" type="hidden"
                                    size="1" name="hiBillsSign" runat="server"></td>
                        </tr>
                        <tr><td colspan="4" style="height:5px;"></td></tr>
                        <tr>
                            <td class="TdTitle">领款人</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="DrawMoneyMan"
                                    size="26" name="DrawMoneyMan" runat="server"></td>
                            <td class="TdTitle">身份证号</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="DrawIdentityCard" data-options="required:true"
                                    name="DrawIdentityCard" runat="server"></td>
                        </tr>
                        <tr><td colspan="4" style="height:5px;"></td></tr>
                        <tr>
                            <td class="TdTitle">退款人</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="HandleMan"
                                    size="26" name="HandleMan" runat="server"></td>
                            <td class="TdTitle">验收人</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="AcceptMan"
                                    size="26" name="AcceptMan" runat="server"></td>
                        </tr>
                        <tr><td colspan="4" style="height:5px;"></td></tr>
                        <tr>
                            <td class="TdTitle">备注</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="Memo"
                                    size="26" name="HandleMan" runat="server"></td>
                            <td class="TdTitle"></td>
                            <td class="TdContent"></td>
                        </tr>
                       <%-- <tr>
                            <td colspan="4" align="left"><font face="宋体" color="#ff0033">提示：预收费用退款后，系统将自动撤销该笔应收。</td>
                        </tr>--%>
                        <tr>
                            <td align="center" colspan="4">
                                <input id="MayRefundAmount" style="width: 24px; height: 22px" type="hidden" size="1" name="MayRefundAmount"
                                    runat="server"><input id="hiChargeAmount" style="width: 24px; height: 22px" type="hidden" size="1" name="hiChargeAmount"
                                        runat="server"><input class="button" id="btnSave"
                                            type="button" value="退款确认" name="btnSave" runat="server"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                var table1h = $('#table1').height();
                var table3h = $('#table3').height();

                var table2h = h - table1h - table3h - 8;

                $("#table3h").css("height", table2h + "px");
                table2h = table2h / 2
                $("#DGrid").css("height", "200px");
                $("#DGridPrec").css("height", "200px");
            }
            InitFunction();

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 1024;
                var h = 800;

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);




                    $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                        function Init() {
                        },
                        function callback(_Data) {

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {

                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {

                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";

                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }
                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                                }
                                $('#SelectRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {


                                        var data = $('#SelectRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    $('#RoomID').val(data[i].RoomID.split('|')[0]);



                                                    break;
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });
            }

            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                  $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);



                    $('#SelectRoomID').combobox({
                        data: '',
                        valueField: 'RoomID',
                        textField: 'RoomText'
                    });

                });
            }

            function SelBillsSign() {



                var strBillTypeID = $('#BillType').val();
                var strBillsSigns;
                var iFixedAmount = 0;

                if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                    HDialog.Info("请选择票据类别,此项不能为空!");
                    BillsEditManage.BillTypeID.focus();
                    return;
                }

                var conent = "../dialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();

                var w = 650;
                var h = 430;

                HDialog.Open(w, h, conent, '票据号选择', false, function callback(_Data) {

                    var varObjects = _Data;
                    if (varObjects == "" && $('#BillsSign').searchbox("getValue") != "") {

                    }
                    else {

                        $('#BillsSign').searchbox("setValue", varObjects);

                        $('#hiBillsSign').val(varObjects);
                    }

                });

            }
            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'BusinessTypeName', title: '费用类型', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'ChargeDate', title: '收款/冲抵时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ChargeDate, "yyyy-MM-dd HH:mm:ss");
                        return str;
                    }
                },
                { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
                { field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd ");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd ");
                        return str;
                    }
                },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'CanRefundAllAmount', title: '审核金额', width: 100, align: 'left', sortable: true },
                { field: 'RefundMemo', title: '备注', width: 100, align: 'left', sortable: true }



            ]];
            function LoadRefundFeesAudit() {
                $("#DGrid").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    title: '已审核实收/冲抵费用',
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RefundFees", "RefundFeesAudit", "DGrid", param);
                    },
                    onLoadSuccess: function (data) {
                    },
                    onCheck: function (rowIndex, rowData) {

                        $('#hiBusinessType').val(1);
                        var PrecRows = $('#DGridPrec').datagrid('getChecked');

                        if (PrecRows.length < 1) {
                            var rows = $('#DGrid').datagrid('getChecked');
                            if (rows.length > 6) {
                                //HDialog.Info("提示：最多一次可选择6笔费用！");
                                //$('#DGrid').datagrid('uncheckRow', rowIndex);
                            }
                            else {
                                if ($('#SelReturn').val() == "") {
                                    $('#SelReturn').val(rowData.RefundID);
                                }
                                else {
                                    $('#SelReturn').val($('#SelReturn').val() + "," + rowData.RefundID);
                                }
                                if ($('#RefundAmount').val() == '') {
                                    $('#RefundAmount').val(0);
                                }
                                var RefundAmount = parseFloat($('#RefundAmount').val()) + parseFloat(rowData.CanRefundAllAmount);
                                $('#RefundAmount').val(RefundAmount.toFixed(2));
                            }
                        }
                        else {
                            $('#DGrid').datagrid('uncheckRow', rowIndex);
                            HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                        }
                    },

                    onUncheck: function (rowIndex, rowData) {
                        var ss = $('#SelReturn').val();
                        $('#hiBusinessType').val(1);


                        if (ss.indexOf(rowData.RefundID) > -1) {
                            ss = ss.replace(rowData.RefundID + ",", "");

                            var RefundAmount = parseFloat($('#RefundAmount').val()) - parseFloat(rowData.CanRefundAllAmount);
                            $('#RefundAmount').val(RefundAmount.toFixed(2));
                        }
                        $('#SelReturn').val(ss);

                    },
                    onCheckAll: function (rows) {

                        var PrecRows = $('#DGridPrec').datagrid('getChecked');
                        $('#hiBusinessType').val(1);
                        if (PrecRows.length < 1) {

                            if (rows.length > 6) {
                                //HDialog.Info("提示：最多一次可选择6笔费用！");

                            }
                            $('#SelReturn').val('');
                            $('#DGrid').datagrid('uncheckAll');
                            $('#RefundAmount').val(0);
                            for (var i = 0; i < rows.length; i++) {
                                $('#DGrid').datagrid('checkRow', i);

                            }

                            var CheckRows = $('#DGrid').datagrid('getChecked');
                            $('#RefundAmount').val(0);
                            for (var i = 0; i < CheckRows.length; i++) {
                                if ($('#SelReturn').val() == "") {
                                    $('#SelReturn').val(CheckRows[i].RefundID);
                                }
                                else {
                                    $('#SelReturn').val($('#SelReturn').val() + "," + CheckRows[i].RefundID);
                                }
                                if ($('#RefundAmount').val() == '') {
                                    $('#RefundAmount').val(0);
                                }
                                var RefundAmount = parseFloat($('#RefundAmount').val()) + parseFloat(CheckRows[i].CanRefundAllAmount);

                                $('#RefundAmount').val(RefundAmount.toFixed(2));
                            }
                        }
                        else {
                            $('#DGrid').datagrid('uncheckAll');
                            HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                        }
                    },
                    onUncheckAll: function (rows) {
                        $('#hiBusinessType').val(1);
                        $('#SelReturn').val('');
                        $('#RefundAmount').val(0);
                    }
                });
            }

            function LoadPrecRefundAudit() {
                $("#DGridPrec").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    title: '已审核预存/预收费用',
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RefundFees", "PrecRefundAudit", "DGridPrec", param);
                    },
                    onLoadSuccess: function (data) {
                    },
                    onCheck: function (rowIndex, rowData) {
                        $('#hiBusinessType').val(2);
                        var DGridRows = $('#DGrid').datagrid('getChecked');

                        if (DGridRows.length < 1) {
                            var rows = $('#DGridPrec').datagrid('getChecked');
                            if (rows.length > 6) {
                                //HDialog.Info("提示：最多一次可选择6笔费用！");
                                //$('#DGridPrec').datagrid('uncheckRow', rowIndex);
                            }
                            else {
                                if ($('#SelReturn').val() == "") {
                                    $('#SelReturn').val(rowData.RefundID);
                                }
                                else {
                                    $('#SelReturn').val($('#SelReturn').val() + "," + rowData.RefundID);
                                }
                                if ($('#RefundAmount').val() == '') {
                                    $('#RefundAmount').val(0);
                                }
                                var RefundAmount = parseFloat($('#RefundAmount').val()) + parseFloat(rowData.CanRefundAllAmount);
                                $('#RefundAmount').val(RefundAmount.toFixed(2));
                            }
                        }
                        else {
                            $('#DGridPrec').datagrid('uncheckRow', rowIndex);
                            HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                        }
                    },

                    onUncheck: function (rowIndex, rowData) {
                        var ss = $('#SelReturn').val();
                        $('#hiBusinessType').val(2);


                        if (ss.indexOf(rowData.RefundID) > -1) {
                            ss = ss.replace(rowData.RefundID + ",", "");

                            var RefundAmount = parseFloat($('#RefundAmount').val()) - parseFloat(rowData.CanRefundAllAmount);
                            $('#RefundAmount').val(RefundAmount.toFixed(2));
                        }
                        $('#SelReturn').val(ss);

                    },
                    onCheckAll: function (rows) {

                        var DGridRows = $('#DGrid').datagrid('getChecked');
                        $('#hiBusinessType').val(2);
                        if (DGridRows.length < 1) {

                            if (rows.length > 6) {
                                //HDialog.Info("提示：最多一次可选择6笔费用！");

                            }
                            $('#SelReturn').val('');
                            $('#DGridPrec').datagrid('uncheckAll');
                            $('#RefundAmount').val(0);
                            for (var i = 0; i < rows.length; i++) {
                                $('#DGridPrec').datagrid('checkRow', i);

                            }

                            var CheckRows = $('#DGridPrec').datagrid('getChecked');
                            $('#RefundAmount').val(0);
                            for (var i = 0; i < CheckRows.length; i++) {
                                if ($('#SelReturn').val() == "") {
                                    $('#SelReturn').val(CheckRows[i].RefundID);
                                }
                                else {
                                    $('#SelReturn').val($('#SelReturn').val() + "," + CheckRows[i].RefundID);
                                }
                                if ($('#RefundAmount').val() == '') {
                                    $('#RefundAmount').val(0);
                                }
                                var RefundAmount = parseFloat($('#RefundAmount').val()) + parseFloat(CheckRows[i].CanRefundAllAmount);

                                $('#RefundAmount').val(RefundAmount.toFixed(2));
                            }
                        }
                        else {
                            $('#DGridPrec').datagrid('uncheckAll');
                            HDialog.Info('实收、冲抵费用与预存、预收费用不能同时选择');
                        }
                    },
                    onUncheckAll: function (rows) {
                        $('#hiBusinessType').val(2);
                        $('#SelReturn').val('');
                        $('#RefundAmount').val(0);
                    }
                });
            }

            LoadRefundFeesAudit();
            LoadPrecRefundAudit();

            $('#btnSave').click(function () {


                var hiChargeMode = $("#ChargeMode").find("option:selected").text();
                if ($('#CustID').val() == "") {
                    HDialog.Info("请选择客户!");

                }
                else if ($('#SelReturn').val() == '' || parseFloat($('#RefundAmount').val()) == 0) {
                    HDialog.Info("请选择要退款的费用!");
                }
                else if (hiChargeMode == "") {
                    HDialog.Info("请选择退款方式!");
                }
                else if ($('#BillsSign').val() == "") {
                    HDialog.Info("请选择退款凭据票号!");

                }
                else if ($('#DrawIdentityCard').val() == "") {
                    HDialog.Info("请输入证件号码!");

                }
                else {

                    HDialog.Prompt('是否确认退款', function () {

                        $.tool.DataPost('RefundFees', "RefundReceipts", $('#RefundFeesBrowse').serialize() + "&hiChargeMode=" + hiChargeMode,
                           function Init() {

                           },
                           function callback(_Data) {

                               var data = _Data.split('|');

                               if (data[0] == "true") {

                                   LoadRefundFeesAudit();
                                   LoadPrecRefundAudit();
                                   HDialog.Info('退款成功!');

                                   $('#SelReturn').val('');
                                   $('#RefundAmount').val('0');

                                   $('#BillsSign').searchbox("setValue", '');

                                   $('#DrawMoneyMan').val('');
                                   $('#DrawIdentityCard').val('');
                                   $('#HandleMan').val('');
                                   $('#AcceptMan').val('');
                                   $('#Memo').val('');
                                   var url = data[1];
                                   url = url.replace('？', '?');
                                   url = url.replace('＆', '&');

                                   window.open(url);
                               }
                               else {
                                   LoadRefundFeesAudit();
                                   LoadPrecRefundAudit();
                                   HDialog.Info('退款失败!');
                               }



                           },
                           function completeCallback() {
                           },
                           function errorCallback() {

                           });
                    });
                }
            });
        </script>
    </form>
</body>
</html>

