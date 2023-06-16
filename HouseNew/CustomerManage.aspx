<%@ Page Language="c#" CodeBehind="CustomerManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.CustomerManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>CustomerManage</title>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link href="../jscript/PicChoose/css/picbox.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/ajax.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/PicChoose/js/picbox.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript">
        function CheckData(IsRoom) {
            var key = "", value = "", innerText = "", cellIndex = -1, result = false;
            $("input[type=text],textarea").each(function () {
                key = $(this).attr("id");
                value = $(this).val();
                if (isValueNull(key) && isValueNull(value)) {
                    if (!$(this)[0].attributes["onclick"]) {
                        $(this).val(value.replace(/[\s'"\\]/g, ""));
                    }
                }

            });

            if ($("input[name='PaperName']").val() == "") {
                HDialog.Info("֤�����Ʊ�����д!");
                return false;
            }
            if (!isValueNull($("#PaperCode").val())) {
                HDialog.Info("������֤������,�����Ϊ��!");
                CustTempManage.PaperCode.focus();
                return false;
            } else {
                //if ($("#PaperName").combobox("getValue") == "0001" && !idCardCheckfun($("#PaperCode").val())) {
                //     HDialog.Info("֤������,����ȷ!");
                //     return false;
                //} else
                //if (!checkYskh($("#PaperCode").val())) {
                //    HDialog.Info("֤������,ֻ�ܰ������֡�Ӣ�ġ����(���š���б��)!");
                //    return false;
                //}
            }

            if (CustomerManage.CustName.value == "") {
                HDialog.Info("������ҵ������,�����Ϊ��!");
                return false;
            }



            if (CustomerManage.CustTypeID.value == "") {
                HDialog.Info("��ѡ��ͻ����,�����Ϊ��!");
                return false;
            }
            if (CustomerManage.MobilePhone.value == "") {
                HDialog.Info("�������ƶ��绰,�����Ϊ��!");
                return false;
            }
            if (CustomerManage.Linkman.value == "") {
                HDialog.Info("��������ֻ�����,�����Ϊ��!");
                CustomerManage.Linkman.focus();
                return false;
            }
            if (CustomerManage.LinkmanTel.value == "") {
                HDialog.Info("��������ֻ�����,�����Ϊ��!");
                CustomerManage.LinkmanTel.focus();
                return false;
            }

            if ($("#Memo").val() != "") {
                var memo = stripscript($("#Memo").val());
                $("#Memo").val(memo);
            }

            if (IsRoom != "1") {
                if ((CustomerManage.RoomCount.value == "0") || (CustomerManage.RoomCount.value == "")) {
                    //HDialog.Info("����ӷ���!");
                    //CustomerManage.btnSelMultiRoom.focus();
                    btnSelMultiRoom_OnClick();
                    return false;
                }
            }

            var strPaperCodeResults = getObject("PaperCodeResults").innerHTML;

            if ((strPaperCodeResults != "") && (strPaperCodeResults != "�µĺ��룡")) {
                HDialog.Info(strPaperCodeResults);
                CustomerManage.PaperCode.focus();
                return false;
            }

            var strresults = getObject("results").innerHTML;

            //if ((strresults != "") && (strresults != "�µĿ��ţ�")) {
            //    HDialog.Info(strresults);
            //    CustomerManage.InquireAccount.focus();
            //    return false;
            //}

            var strLinkmanTel = CustomerManage.LinkmanTel.value;

            //if (strLinkmanTel.length > 11) {
            //    HDialog.Info("���ֻ����볬��11λ!");
            //    CustomerManage.LinkmanTel.focus();
            //    return false;
            //}
            if ($.trim(strLinkmanTel) == "") {
                HDialog.Info("���ֻ����벻��Ϊ�գ�");
                CustomerManage.LinkmanTel.focus();
                return false;
            }

            //if ($.trim(strLinkmanTel) != "") {
            //    var reg = /^1[3|4|5|7|8][0-9]\d{8}$/;
            //    if (!reg.test($.trim(strLinkmanTel))) {
            //        HDialog.Info("���ֻ������ʽ���ԣ�");
            //        //CustomerManage.LinkmanTel.focus();
            //        return false;
            //    }
            //}
            //���֤У��
            if ($("#PaperName").combo("getText") == "���֤") {
                var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                if (reg.test($("#PaperCode").val()) === false) {
                    HDialog.Info("���֤���벻�Ϸ�");
                    return false;
                }
            }


            return true;
        }

        //���˷Ƿ��ַ�  
        function stripscript(s) {
            var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~��@#������&*��������|{}��������������'��������]")
            var rs = "";
            for (var i = 0; i < s.length; i++) {
                rs = rs + s.substr(i, 1).replace(pattern, '');
            }
            //ȥ������
            rs = rs.replace(/<\/?.+?>/g, "");
            rs = rs.replace(/[\r\n]/g, "");
            return rs;
        }

        function onchangeBankName() {
            var strBankName = getObject("BankName").value;
            if (strBankName.length > 4) {
                strBankName = strBankName.substring(0, 4);
            }

            if (strBankName == "ͨ��֧��" || strBankName == "�й�����") {
                getObject("BankCode").disabled = false;
            }
            else {
                getObject("BankCode").value = "";
                getObject("BankCode").disabled = true;
            }
        }

        function btnClear_OnClick() {

            CustomerManage.RoomSign.value = "";
        }

        function OnSelCardSign() {
            var strInquireAccount = CustomerManage.InquireAccount.value;
            var strOldAccount = CustomerManage.OldAccount.value;
            if (strInquireAccount != "" && strInquireAccount != strOldAccount) {
                getObject("IsSendCard").value = "1";

                var today = new Date();
                var tmpYear = today.getFullYear();
                var tmpMonth = today.getMonth() + 1;
                var tmpDay = today.getDate();
                getObject("SendCardDate").value = tmpYear + "-" + tmpMonth + "-" + tmpDay;
            }
            else {
                if (strInquireAccount == "") {
                    getObject("IsSendCard").value = "0";
                    getObject("SendCardDate").value = "";
                }
            }
        }

        function CheckCardSign() {
            var strInquireAccount = CustomerManage.InquireAccount.value;
            var strOldAccount = CustomerManage.OldAccount.value;
            getObject("results").innerHTML = "";

            Request.sendPOST("CheckCardSign.aspx", "InquireAccount=" + strInquireAccount + "&OldAccount=" + strOldAccount + "&Rnd=" + Math.random(), callbackCardSign)

            }

        function callbackCardSign(xmlHttp) {
            //alert(xmlHttp.responseText);
            var varReturn = xmlHttp.responseText;
            getObject("results").innerHTML = varReturn;

            OnSelCardSign();
        }

        function CheckPaperCode() {
            var strCustID = CustomerManage.CustID.value;
            var strPaperCode = CustomerManage.PaperCode.value;

            getObject("results").innerHTML = "";
            //alert(strLoginCode);

            Request.sendPOST("../House/CheckPaperCode.aspx", "CustID=" + strCustID + "&PaperCode=" + strPaperCode + "&Rnd=" + Math.random(), callbackPaperCode);

            }

        function callbackPaperCode(xmlHttp) {
            //alert(xmlHttp.responseText);
            var varReturn = xmlHttp.responseText;
            var res = varReturn.split('|');

            getObject("PaperCodeResults").innerHTML = res[1];
            if (res[0] == "false") {
                HDialog.Info(res[1]);
            }
        }

        function btnSelRoom_OnClick() {
            var strRoomIDs = CustomerManage.SelRoomIDs.value;
            var varReturn;
            varReturn = showModalDlg("../dialog/CustSelRoomDlg.aspx?RoomIDs=" + strRoomIDs, "", 650, 400);

            if (varReturn != "") {//**��÷��� ˢ��
                var varObjects = varReturn.split("\t");

                CustomerManage.RoomID.value = varObjects[0];
                CustomerManage.RoomSign.value = varObjects[2];
                CustomerManage.IsSplitUnite.value = varObjects[6]

                return true;
            }

            return false;
        }

        function checkFormAll(chk) {
            var val = CustomerManage.SelReturn.value
            var form = document.getElementById("CustomerManage");
            var chkval = "";
            for (var i = 0; i < form.elements.length; i++) {

                //��ֵ
                if (form.elements[i].type == "checkbox") {
                    if (form.elements[i].value != "on") {
                        chkval = "," + form.elements[i].value

                        if (chk.checked) {
                            if (val.indexOf(chkval) < 0) {
                                val = val + chkval
                            }
                        }
                        else {
                            val = val.replace(chkval, "")
                        }

                        form.elements[i].checked = chk.checked

                    }
                }
            }

            CustomerManage.SelReturn.value = val

            //alert(CustomerManage.SelReturn.value);
        }

        function checkFormOne(chk) {
            var val = CustomerManage.SelReturn.value
            var chkval = "";
            chkval = "," + chk.value
            if (chk.checked) {
                if (val.indexOf(chkval) < 0) {
                    val = val + chkval
                }
            }
            else {
                val = val.replace(chkval, "")
            }
            CustomerManage.SelReturn.value = val

            //alert(CustomerManage.SelReturn.value);
        }

        function btnFileUp_Onclick() {
            //if (CustomerManage.AdjunctName.value == "") {
            //    HDialog.Info("�������ļ���������,�����Ϊ��!");
            //    CustomerManage.AdjunctName.focus();
            //    return false;
            //}

            if (CustomerManage.btnFile.value == "") {
                HDialog.Info("��ѡ��Ҫ�ϴ��ı����ļ�!");
                CustomerManage.btnFile.focus();
                return false;
            }

            return true;
        }

        function btnChangeName_Onclick() {
            var strCustID = CustomerManage.CustID.value;
            var conent = "../DialogNew/CustChangeNameDlg.aspx?CustID=" + strCustID + "&Rnd=" + Math.random();

            HDialog.Open('500', '300', conent, '�ͻ�����', false, function callback(_Data) {
                if (_Data != "") {
                    $('#CustName').val(_Data);
                }

            });


            //var varReturn=showModalDlg("../dialogNew/CustChangeNameDlg.aspx?CustID="+strCustID+"&Rnd="+Math.random(),"",500,300);

            ////alert(varReturn);
            //if(varReturn!="")
            //{//**��÷��صĲ�����Ϣ

            //	var varObjects=varReturn.split("\t");

            //	CustomerManage.CustName.value=varObjects[0];
            //}
            }

        function SelbtnChangeCard() {
            var strCustID = $('#CustID').val();
            var conent = "../DialogNew/CustChangeCardDlg.aspx?CustID=" + strCustID + "&Rnd=" + Math.random();

            HDialog.Open('450', '250', conent, 'ѡ��', false, function callback(_Data) {
                if (_Data != "") {
                    $('#InquireAccount').val(_Data);

                    OnSelCardSign();
                }

            });
        }

        function btnChangeCard_Onclick() {
            var strCustID = CustomerManage.CustID.value;

            var varReturn = showModalDlg("../dialog/CustChangeCardDlg.aspx?CustID=" + strCustID + "&Rnd=" + Math.random(), "", 600, 400);

            //alert(varReturn);
            if (varReturn != "") {//**��÷��صĲ�����Ϣ

                var varObjects = varReturn.split("\t");

                CustomerManage.InquireAccount.value = varObjects[0];

                OnSelCardSign();
            }
        }

        function WriteLinkman() {
            $("#Linkman").val($("#CustName").val());
            $("#Recipient").val($("#CustName").val());
            $("#Linkman").removeClass();
        }

        function WriteLinkmanTel() {
            var tempTel = $("#MobilePhone").val();

            if (tempTel.length > 11) {
                tempTel = tempTel.substr(0, 11);
            }
            $("#LinkmanTel").val(tempTel);
            $("#LinkmanTel").removeClass();
        }

        function CheckTel() {
            var tempTel = $("#LinkmanTel").val();
            if ($.trim(tempTel) == "") {
                HDialog.Info("���ֻ����벻��Ϊ�գ�");
                return false;
            }

            //if ($.trim(tempTel) != "") {
            //    var reg = /^1[3|4|5|7|8][0-9]\d{8}$/;
            //    if (!reg.test($.trim(tempTel))) {
            //        HDialog.Info("���ֻ������ʽ���ԣ�");
            //        return false;
            //    }
            //}
            return true;
        }

        function SelbtnChangePwd() {
            var strCustID = $('#CustID').val();
            var conent = "../HouseNew/CustomerChangePwd.aspx?CustID=" + strCustID + "&Rnd=" + Math.random();

            HDialog.Open('450', '300', conent, '�����޸�', false, function callback(_Data) {

            });
            }

        function btnChangePwd_Onclick() {
            var strCustID = CustomerManage.CustID.value;

            showModalDlg("CustomerChangePwd.aspx?CustID=" + strCustID + "&Rnd=" + Math.random(), "", 600, 300);
        }

        function btnOK_Onclick() {
            if (CustomerManage.RoomID.value == "") {
                HDialog.Info("��ѡ����,�����Ϊ��!");
                CustomerManage.btnSelRoom.focus();
                return false;
            }

            return true;
            }

        function showIsUnit(expid1, expid2) {
            var val = $('input:radio[name="IsUnit"]:checked').val();
            if (val == "0") {
                $("#" + expid1 + "").show();
                $("#" + expid2 + "").hide();
                //getObject(expid1).style.display = "inline";
                //getObject(expid2).style.display = "none";
            }
            else {
                $("#" + expid1 + "").hide();
                $("#" + expid2 + "").show();
                //getObject(expid1).style.display = "none";
                //getObject(expid2).style.display = "inline";
            }
        }

        function GetUnCustID() {
            var strPath = "";
            var ram = Math.random();
            var strCustID = getObject("CustID").value;

            Request.sendPOST(strPath + "GetUnCustID.aspx", "CustID=" + strCustID + "&Ram=" + ram, callbackUnCustID);

        }

        function callbackUnCustID(xmlHttp) {
            getObject("UnCustID").value = xmlHttp.responseText;
        }

        function OnFormload() {
            if (CustomerManage.IsUnit1.checked) {
                $("#Table2").show();
                $("#Table3").hide();
                //getObject('Table2').style.display = "block";
                //getObject('Table3').style.display = "none";
            }
            else if (CustomerManage.IsUnit2.checked) {
                $("#Table2").hide();
                $("#Table3").show();
                //getObject('Table2').style.display = "none";
                //getObject('Table3').style.display = "block";
            }
        }

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        function CheckUpdate() {

            if (GetQueryString("IsLock") == "1") {
                $("#save").removeAttr("onclick");
                $("#save").css("background-color", "#B8B8B8");

                $("#btnChangeName").removeAttr("onclick");
                $("#btnChangeName").css("background-color", "#B8B8B8");

                $("#btnReadPaperCode").removeAttr("onclick");
                $("#btnReadPaperCode").css("background-color", "#B8B8B8");

                $("#btnChangePwd").removeAttr("onclick");
                $("#btnChangePwd").css("background-color", "#B8B8B8");

                $("#SaveBillInfo").show(0);
            }
            }

        function BillInfoSave() {
            if ($('#CustomerManage').form('enableValidation').form('validate') == false) {
                return false;
            }
            $.tool.DataPost("EInvoiceManage", "UpdateBillsInfo", $('#CustomerManage').serialize(), function Init() {
            },
                function callback(_Data) {

                    if (_Data == "true") {
                        HDialog.Info("���³ɹ�");
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

    </script>

    <style type="text/css">
        .auto-style1 {
            height: 16px;
            width: 7%;
            text-align: center;
        }

        .auto-style2 {
            height: 16px;
            width: 18%;
            text-align: left;
        }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="CustomerManage" method="post" runat="server">
        <input class="button" id="btnDel" type="button" value="ɾ��" style="display: none;" name="btnDel" runat="server">
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="CustID" type="hidden" size="1" name="CustID" runat="server">
        <input id="RoomCount" type="hidden" size="1" name="RoomCount" runat="server">
        <input id="SelRoomIDs" type="hidden" size="1" name="SelRoomIDs" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="SelReturn" type="hidden" size="1" name="SelReturn" runat="server">
        <input id="CustSynchCode" type="hidden" size="1" name="CustSynchCode" runat="server">
        <input id="MethodName" type="hidden" size="1" name="MethodName" runat="server">
        <input id="hiLiveID" type="hidden" size="1" name="hiLiveID" runat="server" />
        <input id="hiRoomId" type="hidden" size="1" name="hiRoomId" runat="server" />
        <input id="RoomIDs" type="hidden" size="1" name="RoomIDs" runat="server">
        <input id="btnSelMultiRoom" style="display: none;" type="button" class="button" value="ѡ��" name="btnSelMultiRoom" runat="server">
        <input id="IsInsert" name="IsInsert" runat="server" type="hidden" value="0" />
        <input id="IsSendCard" type="hidden" name="IsSendCard" runat="server">
        <input id="OldAccount" type="hidden" name="OldAccount" runat="server">
        <input id="InquireAccount" type="hidden" name="InquireAccount" runat="server">
        <input id="SendCardDate" type="hidden" name="SendCardDate" runat="server">
        <input id="hiAdjunctName" type="hidden" name="hiAdjunctName" runat="server" />
        <input id="BillInfoID" type="hidden" name="BillInfoID" runat="server" />
        <input id="FixedTelHistory" type="hidden" name="FixedTelHistory" runat="server" />
        <input id="MobilePhoneHistory" type="hidden" name="MobilePhoneHistory" runat="server" />
        <input id="PaperCodeHistory" type="hidden" name="PaperCodeHistory" runat="server" />
        <table class="DialogTable" id="Table1">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">ҵ��������Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">ҵ������</td>
                <td class="TdContent">
                    <input id="CustName" class="easyui-validatebox" onblur="javascript:WriteLinkman();" data-options="required:true" style="width: 60%;" maxlength="50" name="CustName" runat="server">
                    <input class="button" style="width: 20%;" id="btnChangeName" onclick="SelbtnChangeName()" type="button" value="�޸�" name="btnChangeName" runat="server">
                </td>
                <td class="TdTitle">���뿨��</td>
                <td class="TdContent">
                    <input id="PassSign" maxlength="50" name="PassSign" runat="server">
                </td>
                <td class="auto-style1">֤������</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="PaperName" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList></td>
                <td class="TdTitle">֤������</td>
                <td class="TdContent">
                    <input id="PaperCode" class="easyui-validatebox" data-options="required:true" onblur="javascript:CheckPaperCode();" maxlength="500" name="PaperCode" runat="server">
                    <div class="font_red" style="display: none;" id="PaperCodeResults"></div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�ͻ����</td>
                <td class="TdContentSearch">
                    <select id="CustTypeID" style="width: 82%;" name="CustTypeID" runat="server">
                        <option selected></option>
                    </select>
                    <input id="hCustTypeID" name="hCustTypeID" runat="server" type="hidden" />
                </td>
                <td class="TdTitle">�̶��绰</td>
                <td class="TdContent">
                    <input id="FixedTel" maxlength="50" name="FixedTel" runat="server"></td>
                <td class="auto-style1">�ƶ��绰</td>
                <td class="TdContent">
                    <input id="MobilePhone" class="easyui-validatebox" data-options="required:true" name="MobilePhone" onblur="javascript:WriteLinkmanTel();" runat="server"></td>
                <td class="TdTitle">����绰</td>
                <td class="TdContent">
                    <input id="FaxTel" maxlength="50" name="FaxTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">��ϵ��ַ</td>
                <td class="TdContent">
                    <input id="Address" maxlength="50" name="Address" runat="server"></td>
                <td class="TdTitle">��������</td>
                <td class="TdContent">
                    <input id="PostCode" maxlength="50" name="PostCode" runat="server"></td>
                <td class="auto-style1">�� �� ��</td>
                <td class="TdContent">
                    <input id="Recipient" maxlength="50" name="Recipient" runat="server"></td>
                <td class="TdTitle">�����ʼ�</td>
                <td class="TdContent">
                    <input id="EMail" maxlength="50" name="EMail" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">���ֻ�����</td>
                <td class="TdContent">
                    <input id="Linkman" class="easyui-validatebox" data-options="required:true" name="Linkman" runat="server"></td>
                <td class="TdTitle">���ֻ�����</td>
                <td class="TdContent">
                    <input id="LinkmanTel" onblur="javascript:CheckTel();" class="easyui-validatebox" data-options="required:true" maxlength="11" name="LinkmanTel" runat="server"></td>
                <td style="display: none;" class="auto-style1">ҵ���˺�</td>
                <td style="display: none;" class="TdContent">
                    <input id="UnCustID" style="width: 50%;" maxlength="50" name="UnCustID" runat="server" readonly>
                    <input class="button" style="width: 65px;" id="btnChangePwd" onclick="SelbtnChangePwd()"
                        tabindex="1" type="button" value="�޸�����" name="btnChangePwd" runat="server">
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch">
                    <%--      <input id="IsUnit1" onclick="javascript: showIsUnit('Table2', 'Table3');" type="radio" checked
                        value="0" name="IsUnit" runat="server">����ҵ��<input id="IsUnit2" onclick="javascript: showIsUnit('Table2', 'Table3');" type="radio" value="1"
                            name="IsUnit" runat="server">��λҵ��--%>
                    <input id="IsUnit1" type="radio" checked
                        value="0" name="IsUnit" runat="server">����<input id="IsUnit2" type="radio" value="1"
                            name="IsUnit" runat="server">��λ
                </td>
            </tr>
            <tr style="display: none;">
                <%-- <td class="TdTitle">�Ƿ�Ӧ��</td>
                <td class="TdContentSearch">
                    <select id="IsSupplier" style="width: 82%;" name="IsSupplier" runat="server" data-options="editable:false,panelHeight: 'auto',onChange:function(newValue,oldValue){ SupplierChange(newValue, oldValue)}" class="easyui-combobox">
                        <option value="0" selected>��</option>
                        <option value="1">��</option>
                    </select></td>--%>
                <td class="TdTitle">������</td>
                <td class="TdContent">
                    <input id="Charge" class="easyui-validatebox" maxlength="50" name="Charge" runat="server"></td>
                <td class="TdTitle">�����˵绰</td>
                <td class="TdContent">
                    <input id="ChargeTel" class="easyui-validatebox" maxlength="50" name="ChargeTel" runat="server"></td>
                <td class="TdTitle">��Ӫ��Χ</td>
                <td class="TdContent">
                    <input id="ManagementScope" maxlength="500" name="ManagementScope" runat="server"></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>

            </tr>
            <tr>
                <td class="TdTitle">����ҵ��</td>
                <td class="TdContent" colspan="4">
                    <input id="PublicOwner" class="easyui-validatebox" maxlength="50" style="width: 79%;" name="Charge" runat="server">
                </td>
                <td class="TdContent">
                    <input class="button" id="btnReadPaperCode" onclick="ReadPaperCode()" type="button" value="��ȡ���֤��Ϣ" runat="server">
                </td>
            </tr>
            <tr style="display: none;">
                <td class="auto-style1"><%--��Ӧ�����--%></td>
                <td class="auto-style2">
                    <asp:DropDownList ID="SupplierType" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox" Visible="False"></asp:DropDownList>
                </td>

            </tr>
        </table>
        <table class="DialogTable" id="Table2">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">����ҵ����Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��</td>
                <td class="TdContent">
                    <input id="Surname" maxlength="50" name="Surname" runat="server">
                </td>
                <td class="TdTitle">��</td>
                <td class="TdContent">
                    <input id="Name" name="Name" runat="server">
                </td>
                <td class="TdTitle">�Ա�</td>
                <td class="TdContentSearch">
                    <select id="Sex" style="width: 82%;" name="Sex" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">����</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="Nationality" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��������</td>
                <td class="TdContent">
                    <input id="Birthday" name="Birthday" class="easyui-validatebox" onclick="WdatePicker()" type="text" runat="server" /></td>
                <td class="TdTitle">������λ</td>
                <td class="TdContent">
                    <input id="WorkUnit" maxlength="50" name="WorkUnit" runat="server"></td>
                <td class="TdTitle">ְҵ</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="DrJob" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="TdTitle">��Ȥ����</td>
                <td class="TdContentSearch" colspan="7">
                    <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <table class="DialogTable" id="Table3">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">��λҵ����Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">����������</td>
                <td class="TdContent">
                    <input id="LegalRepr" maxlength="50" name="LegalRepr" runat="server"></td>
                <td class="TdTitle">���������˵绰</td>
                <td class="TdContent">
                    <input id="LegalReprTel" maxlength="50" name="LegalReprTel" runat="server"></td>
                <td class="TdTitle">�������</td>
                <td class="TdContent">
                    <input id="SiteArea" maxlength="50" name="SiteArea" runat="server"></td>
                <%--          <td class="TdTitle">������</td>
                <td class="TdContent">
                    <input id="Charge" maxlength="50" name="Charge" runat="server"></td>
                <td class="TdTitle">�����˵绰</td>
                <td class="TdContent">
                    <input id="ChargeTel" maxlength="50" name="ChargeTel" runat="server"></td>--%>
            </tr>
            <tr>
                <%--                <td class="TdTitle">��Ӫ��Χ</td>
                <td class="TdContent">
                    <input id="ManagementScope" maxlength="500" name="ManagementScope" runat="server"></td>--%>
                <%--           <td class="TdTitle">�������</td>
                <td class="TdContent">
                    <input id="SiteArea" maxlength="50" name="SiteArea" runat="server"></td>--%>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
        </table>
        <table class="DialogTable" id="Table7">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">��˰������Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">����</td>
                <td class="TdContent">
                    <input id="VATCode" name="VATCode" runat="server" type="hidden" class="easyui-validatebox">
                    <input id="VATName" name="VATName" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle">��˰��ʶ���</td>
                <td class="TdContent">
                    <input id="VATNumber" name="VATNumber" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle">��ַ���绰</td>
                <td class="TdContent">
                    <input id="VATAddLinkTel" name="VATAddLinkTel" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle">�����м��ʺ�</td>
                <td class="TdContent">
                    <input id="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server" class="easyui-validatebox" />
                </td>
            </tr>
        </table>
        <table class="DialogTable" id="Table4">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">���д�����Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�������</td>
                <td class="TdContentSearch">
                    <select id="BankName" style="width: 82%;" name="BankName" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">�����б�</td>
                <td class="TdContentSearch">
                    <select id="BankCode" style="width: 82%;" name="BankCode" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">�������к�</td>
                <td class="TdContent">
                    <input id="BankNo" maxlength="50" name="BankNo" runat="server">
                </td>
                <td class="TdTitle">���л���</td>
                <td class="TdContent">
                    <input id="BankIDs" maxlength="50" name="BankIDs" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�����˺�</td>
                <td class="TdContent">
                    <input id="BankAccount" maxlength="50" name="BankAccount" runat="server"></td>
                <td class="TdTitle">ȷ�������˺�</td>
                <td class="TdContent">
                    <input id="BankAccountTwo" maxlength="50" name="BankAccountTwo" runat="server"></td>
                <td class="TdTitle">����Э����</td>
                <td class="TdContent">
                    <input id="BankAgreement" maxlength="50" name="BankAgreement" runat="server"></td>
                <td class="TdTitle">���۷�ʽ</td>
                <td class="TdContentSearch">
                    <input id="IsSelfPay1" value="0" checked type="radio" name="IsSelfPay" runat="server" />��������
                    <input id="IsSelfPay2" value="1" type="radio" name="IsSelfPay" runat="server" />�����ɷ�
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��ע</td>
                <td class="TdContentSearch" colspan="7">
                    <textarea id="Memo" style="width: 96%; height: 60px" name="Memo" rows="3" cols="96" runat="server"></textarea>
                </td>
            </tr>
        </table>
        <table class="DialogTable" id="ETable">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">��Ʊ��Ϣ</span>
                </td>
            </tr>
            <tr>
                <%--                <td class="TdTitle">�ͻ����</td>
                <td class="TdContent">
                    <select id="BillCustType" name="BillCustType" style="width: 82%" runat="server">
                        <option value="����" selected>����</option>
                        <option value="��˾">��˾</option>
                    </select>
                </td>--%>

                <td class="TdTitle">��������</td>
                <td class="TdContent">
                    <input id="BillBankName" maxlength="50" name="BillBankName" runat="server" class="easyui-validatebox">
                </td>
                <td class="TdTitle">�����˺�</td>
                <td class="TdContent">
                    <input id="BillBankAccount" maxlength="50" name="BillBankAccount" runat="server" class="easyui-validatebox">
                </td>
                <td class="TdTitle">��ַ</td>
                <td class="TdContent">
                    <input id="BillAddress" maxlength="50" name="BillAddress" runat="server" class="easyui-validatebox">
                </td>
                <td class="TdTitle">��ϵ�绰</td>
                <td class="TdContent">
                    <input id="BillPhone" maxlength="50" name="BillPhone" runat="server" class="easyui-validatebox">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��˰������</td>
                <td class="TdContent">
                    <input id="BillTaxpayer" maxlength="50" name="BillTaxpayer" runat="server">
                </td>
                <td class="TdTitle">��˰��ʶ���</td>
                <td class="TdContent">
                    <input id="BillTaxpayerNumber" maxlength="50" name="BillTaxpayerNumber" runat="server" class="easyui-validatebox">
                </td>
                <td class="TdTitle">��ϵ��</td>
                <td class="TdContent">
                    <input id="BillContacts" maxlength="50" name="BillContacts" runat="server">
                </td>
                <td class="TdTitle">��������</td>
                <td class="TdContent">
                    <input id="BillEmail" maxlength="50" name="BillEmail" runat="server" class="easyui-validatebox" data-options="prompt:'Enter a valid email.',validType:'email'">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��ע</td>
                <td class="TdContentSearch" colspan="7">
                    <textarea id="BillRemark" style="width: 96%; height: 60px" name="BillRemark" rows="3" cols="96" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <input class="button" id="SaveBillInfo" style="float: right; margin-right: 3.5%; display: none" onclick="BillInfoSave()"
                        type="button" value="���濪Ʊ��Ϣ" name="btnFilter" />
                </td>
            </tr>
        </table>
        <table class="DialogTable" id="Table5">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">ҵ��������Ϣ</span>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <div style="width: 100%; height: 200px; background-color: #cccccc;" id="TableContainer">
                    </div>
                    <div id="SearchDlg" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
                        style="width: 600px; height: 150px; padding: 10px;">
                        <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                            <tr>
                                <td class="TdTitle">���ݵǼ�</td>
                                <td class="TdContent">
                                    <input id="RoomSigns" style="width: 60%;" readonly maxlength="50" name="RoomSigns" runat="server">

                                    <input id="hiRoomSigns" type="hidden" size="1" name="hiRoomSigns" runat="server">
                                </td>
                                <td class="TdTitle">���ݲ�ѯ</td>
                                <td class="TdContent">
                                    <input id="RoomSign" name="RoomSign" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;" colspan="4">
                                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">ȷ��ɸѡ</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="CancelParm();">��&nbsp;&nbsp;��</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="SearchDlgRoom" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
                        style="width: 600px; height: 150px; padding: 10px;">
                        <table style="width: 100%; padding-top: 5px; line-height: 25px;">
                            <tr>
                                <td class="TdTitle">���ݱ��</td>
                                <td class="TdContent">
                                    <input id="RoomSign2" name="RoomSign2" runat="server">
                                </td>
                                <td class="TdTitle">��������</td>
                                <td class="TdContent">
                                    <input id="RoomName2" name="RoomName2" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;" colspan="4">
                                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">ȷ��ɸѡ</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <table class="DialogTable">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">����������Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�ļ��ϴ�</td>
                <td class="TdContentSearch" colspan="7">�ļ�˵����<input id="AdjunctName" style="width: 40%; height: 22px" maxlength="200"
                    name="AdjunctName" runat="server">
                    <input id="btnFile" style="width: 20%; height: 22px" tabindex="1" type="file" size="1"
                        name="btnFile" runat="server">&nbsp;
                    <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        tabindex="1" type="button" value="�ϴ�" name="btnFileUp" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdContentSearch" colspan="8">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                        AutoGenerateColumns="False">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="AdjunctCode">
                                <HeaderStyle Width="0px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="AdjunctName" HeaderText="�ļ�˵��">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="FileSize" HeaderText="��С(KB)" DataFormatString="{0:N2}">
                                <HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="[Ԥ��]">
                                <ItemTemplate>
                                    <div>
                                        <a href="<%#DataBinder.Eval(Container.DataItem ,"FilPath").ToString().IndexOf('.')<0?"../"+Eval("FilPath")+Eval("AdjunctCode")+Eval("FileExName"):Eval("FilPath") %>" rel='lightbox'>Ԥ��</a>

                                    </div>
                                </ItemTemplate>
                                <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>

                            <asp:TemplateColumn HeaderText="[����]">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='����'  >"
                                        CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="[ɾ��]">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('��ȷ���Ƿ�ɾ���ü�¼')==false) return false;&quot; alt='ɾ��' >"
                                        CommandName="Delete" CausesValidation="false" TabIndex="1" ID="btnDelete"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; height: 60px;" class="DialogTdSubmit"></td>
            </tr>
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>

                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="save" onclick="BtnSave()"
                            type="button" value="����" name="btnFilter" runat="server">
                        <input class="button" style="display: none;" id="btnSave"
                            type="button" value="����" name="btnFilter" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" class="button" value="�� ��" id="btnReturn" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
            CheckUpdate();
            LoadList();
            OnFormload();
            validateBillInfo();
        }
    );
    $(function () {
        if ($("#OnlyShow").val() == "1") {
            $("input[type='text']").prop("disabled", "true");
            $("input[type='radio']").prop("disabled", "true");
            $("#btnChangeName").css("display", "none");
            $("#btnReadPaperCode").css("display", "none");
            $("#btnFileUp").css("display", "none");
            $("#btnFile").css("display", "none");
            $("#save").css("display", "none");
            $("#btnReturn").css("display", "none");
            $("#AdjunctName").parent().parent().css("display", "none");

            $('#PaperName').combobox('readonly');
            $('#CustTypeID').combobox('readonly');
            $('#IsSupplier').combobox('readonly');
        }
        else {
            if ($('#IsSupplier').combobox('getValue') == "1") {
                SetInputRequired('MobilePhone');
                SetInputRequired('Address');
                SetInputRequired('Charge');
                SetInputRequired('ChargeTel');
                SetInputRequired('ManagementScope');
                //SetInputRequired('UserBillMsg');

                $('#PaperName').combobox(
                    {
                        required: true
                    }
                );
                $('#PaperName').parent().prev().append('<span class="mustS" style="color:red">*</span>');

                if ($("input[name='IsUnit']:checked").attr('id') == 'IsUnit2') {
                    var obj = $('#PaperName').combobox('getData');
                    for (var i = 0; i < obj.length; i++) {
                        if (obj[i].text.indexOf("Ӫҵִ��") >= 0) {
                            $('#PaperName').combobox('select', obj[i].value);
                            break;
                        }
                    }
                    $('#PaperName').combobox('readonly');
                }
                $('#SupplierType').combobox(
                    {
                        required: true
                    });

            }
            else {
                $('#SupplierType').combobox('setValue', '');
                $('#SupplierType').combobox('readonly');
            }
        }
    });

    var column = [[
        { field: 'RoomSign', title: '���ݱ��', width: 150, align: 'left', sortable: true },
        { field: 'RoomName', title: '��������', width: 150, align: 'left', sortable: true },
        { field: 'BuildArea', title: '�������', width: 150, align: 'left', sortable: true },
        { field: 'InteriorArea', title: '�������', width: 150, align: 'left', sortable: true },
        { field: 'CommonArea', title: '��̯���', width: 150, align: 'left', sortable: true },
        {
            field: 'ActualSubDate', title: 'ʵ�ʽ���ʱ��', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'RoomFittingTime', title: 'װ��ʱ��', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.RoomFittingTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'RoomStayTime', title: '��סʱ��', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.RoomStayTime, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'PayBeginDate', title: '��ʼ�ɷ�ʱ��', width: 150, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.PayBeginDate, "yyyy-MM-dd");
                return str;
            }
        }
    ]];

    var toolbar = [
        {
            text: '<font style="font-weight:bold;color:red;" size=2>��ӷ���</font>',
            iconCls: 'icon-add',
            handler: function () {
                //if (CheckData(1) == false) {
                //    return false;
                //}
                //else {
                //$('#SearchDlg').parent().appendTo($("form:first"))
                //$('#SearchDlg').dialog('open');
                //if ( == true)
                //{
                //    document.getElementById('btnSelMultiRoom').click();
                //}
                btnSelMultiRoom_OnClick();
                //}

            }
        }, '-',
        {
            text: '<font style="font-weight:bold;color:red;" size=2>ɾ������</font>',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#TableContainer").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('��ѡ��ɾ���');
                    return;
                }
                $("#hiLiveID").val(row.LiveID);
                $("#hiRoomId").val(row.RoomID);
                document.getElementById('btnDel').click();
                LoadList();
            }
        }, '-',
        {
            text: 'ɸѡ����',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlgRoom').parent().appendTo($("form:first"))
                $('#SearchDlgRoom').dialog('open');
            }
        }
    ];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Customer&Command=searchcustomerlive&CustID=' + $("#CustID").val() + '&RoomSign=' + $("#RoomSign2").val() + '&RoomName=' + $("#RoomName2").val(),
            method: "get",
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
            onLoadSuccess: function (data) {
                $("#RoomCount").val(data.total);
            }
        });
        $("#SearchDlgRoom").dialog("close");
        $("#SearchDlg").dialog("close");

    }

    function SelbtnChangeName() {
        var strCustID = $('#CustID').val();
        var conent = "../DialogNew/CustChangeNameDlg.aspx?CustID=" + strCustID + "&Rnd=" + Math.random();

        HDialog.Open('600', '380', conent, '�ͻ�����', false, function callback(_Data) {
            if (_Data != "") {
                $('#CustName').val(_Data);
            }

        });
    }

    var w = $(window).width();
    var h = $(window).height();
    function btnSelMultiRoom_OnClick() {
        if (CheckData(1) == false) {
            return false;
        }
        else {
            //*����
            // var strCustID = CustomerManage.CustID.value;

            HDialog.Open(w, h, "../dialogNew/CustSelMultiRoomDlg.aspx", '����ѡ��', false, function callback(_Data) {
                if (_Data != "") {
                    if (_Data != "") {//**��÷��� ˢ��

                        _Data = "[" + _Data + "]";
                        var data = JSON.parse(_Data);

                        if (data.length > 0) {

                            var RoomSigns = '';
                            var RoomIDs = '';
                            for (var k = 0; k < data.length; k++) {
                                RoomSigns = RoomSigns + ',' + data[k].RoomSign;
                                RoomIDs = RoomIDs + ',' + data[k].RoomID;

                            }
                            if (RoomSigns.length > 0) {
                                CustomerManage.RoomIDs.value = RoomIDs.substr(1, RoomIDs.length - 1);
                                //$('#RoomIDs').val(RoomIDs.substr(1, RoomIDs.length - 1));
                                document.getElementById('btnSelMultiRoom').click();
                            }

                        }

                    }
                }

            });
            return true;
        }
    }

    function SelMultiRoom() {
        if (CheckData(1) == false) {
            return;
        }
        else {
            //*����
            var varReturn = showModalDlg("../dialog/CustSelMultiRoomDlg.aspx?Ram=" + Math.random(), "", 600, 300);

            //alert(varReturn);
            if (varReturn != "") {//**��÷��صĲ�����Ϣ
                CustomerManage.RoomIDs.value = varReturn;
            }
        }
        document.getElementById('btnSelMultiRoom').click();
    }

    function BtnSave() {
        var BillAddress = $("#BillAddress").val();
        if (BillAddress != "" && !(/^[\u0391-\uFFE5\uFF00-\uFFFFA-Za-z0-9-()����/]+$/.test(BillAddress))) {
            $.messager.alert("��ܰ��ʾ", "��Ʊ��Ϣ��ַֻ�������ġ�Ӣ�ģ����ּ�-����/");
            return false;
        }

        var BillPhone = $("#BillPhone").val();
        if (BillPhone != "" && !(/^[0-9-]+$/.test(BillPhone))) {
            $.messager.alert("��ܰ��ʾ", "��Ʊ��Ϣ��ϵ�绰ֻ�������ּ�-");
            return false;
        }

        var BillTaxpayer = $("#BillTaxpayer").val();
        if (BillTaxpayer != "" && !(/^[\u0391-\uFFE5\uFF00-\uFFFFA-Za-z0-9-()����/#]+$/.test(BillTaxpayer))) {
            $.messager.alert("��ܰ��ʾ", "��Ʊ��Ϣ��˰������ֻ�������ġ�Ӣ�ģ����ּ�-����/#");
            return false;
        }

        var BillBankName = $("#BillBankName").val();
        if (BillBankName != "" && !(/^[\u0391-\uFFE5\uFF00-\uFFFF0-9-()����]+$/.test(BillBankName))) {
            $.messager.alert("��ܰ��ʾ", "��Ʊ��Ϣ��������ֻ�������ģ����ּ�-����");
            return false;
        }

        var BillBankAccount = $("#BillBankAccount").val();
        if (BillBankAccount != "" && !(/^[0-9-]+$/.test(BillBankAccount))) {
            $.messager.alert("��ܰ��ʾ", "��Ʊ��Ϣ�����˺�ֻ�������ּ�-");
            return false;
        }

        var BillEmail = $("#BillEmail").val();
        if (BillEmail != "" && !(/^[A-Za-z0-9-@.]+$/.test(BillEmail))) {
            $.messager.alert("��ܰ��ʾ", "��Ʊ��Ϣ��������ֻ����Ӣ�ģ����ּ�- @.");
            return false;
        }


        if ($('#CustomerManage').form('enableValidation').form('validate') == false) {
            return false;
        }
        if (CheckData() == false) return false;
        document.getElementById('btnSave').click();

    }

    function SupplierChange(newValue, oldValue) {
        if (newValue == "1") {
            SetInputRequired('MobilePhone');
            SetInputRequired('Address');
            SetInputRequired('Charge');
            SetInputRequired('ChargeTel');
            SetInputRequired('ManagementScope');
            //SetInputRequired('UserBillMsg');

            $('#PaperName').combobox(
                {
                    required: true
                }
            );

            $('#PaperName').parent().prev().append('<span class="mustS" style="color:red">*</span>');

            if ($("input[name='IsUnit']:checked").attr('id') == 'IsUnit2') {
                var obj = $('#PaperName').combobox('getData');
                for (var i = 0; i < obj.length; i++) {
                    if (obj[i].text.indexOf("Ӫҵִ��") >= 0) {
                        $('#PaperName').combobox('select', obj[i].value);
                        break;
                    }
                }
                $('#PaperName').combobox('readonly');
            }
            else {
                $('#PaperName').combobox('readonly', false);
            }

            $('#SupplierType').combobox(
                {
                    required: true
                }
            );

        }
        else {
            SetInputNORequire('MobilePhone');
            SetInputNORequire('Address');
            SetInputNORequire('Charge');
            SetInputNORequire('ChargeTel');
            SetInputNORequire('ManagementScope');
            //SetInputNORequire('UserBillMsg');

            $('#PaperName').combobox('readonly', false);
            $('#PaperName').parent().prev().find('.mustS').remove();

            $('#SupplierType').combobox(
                {
                    required: false
                }
            );
            $('#SupplierType').combobox('setValue', '');
            $('#SupplierType').combobox('readonly');

        }
    }

    $("[name='IsUnit']").click(function () {

        if ($(this).attr('id') == 'IsUnit1') {
            $("#Table2").show();
            $("#Table3").hide();
            $('#PaperName').combobox('readonly', false);
        }
        else {
            $("#Table2").hide();
            $("#Table3").show();
            if ($('#IsSupplier').combobox('getValue') == "1") {
                var obj = $('#PaperName').combobox('getData');
                for (var i = 0; i < obj.length; i++) {
                    if (obj[i].text.indexOf("Ӫҵִ��") >= 0) {
                        $('#PaperName').combobox('select', obj[i].value);
                        break;
                    }
                }
                $('#PaperName').combobox('readonly');
            }

        }
        validateBillInfo();
    });

    $("#btnReturn").click(function () {
        close("false");
    });

    function close(callparm) {
        HDialog.Close(callparm);
    }

    function ReadPaperCode() {

        Cache.SetData("PaperInfo", "");

        var Height = 400;
        var Width = 700;

        var iTop2 = (window.screen.height - 400) / 2;
        var iLeft2 = (window.screen.width - 700) / 2;
        var sFeatures = "status:no;help:no;resizable:no;scroll:no;dialogHeight:" + Height + "px;modal=yes;dialogWidth:" + Width + "px;dialogLeft=" + iLeft2 + "px;dialogTop=" + iTop2 + "px";

        //window.showModalDialog('PaperCodeRead.aspx', "", sFeatures);

        var conent = "../HouseNew/PaperCodeRead.aspx?Rnd=" + Math.random();
        HDialog.Open('600', '380', conent, '��ȡ�����Ϣ', false, function callback(_Data) {
            Request.sendPOST("PaperCodeReadInfo.aspx", "", callbackPaperCodeInfo);
        })

    }

    function callbackPaperCodeInfo(xmlHttp) {
        //alert(xmlHttp.responseText);
        var varReturn = xmlHttp.responseText;

        if (varReturn != "") {
            var strName = varReturn.split('|')[0];
            var strSex = varReturn.split('|')[1];
            var strNation = varReturn.split('|')[2];
            var strBorn = varReturn.split('|')[3];
            var strAddress = varReturn.split('|')[4];
            var strCardNo = varReturn.split('|')[5];
            var strPicSrc = varReturn.split('|')[6];
            strBorn = strBorn.replace('��', '-').replace('��', '-').replace('��', '');
            $('#CustName').val(strName);
            $('#PaperCode').val(strCardNo);
            $('#Address').val(strAddress);
            $('#Sex').val(strSex);
            $('#Birthday').val(strBorn)
        }
        //alert(varReturn);
    }

    function SetInputRequired(input) {

        $('#' + input).validatebox({
            required: true
        });
        $('#' + input).parent().prev().append('<span class="mustS" style="color:red">*</span>');
    }

    function SetInputNORequire(input) {
        $('#' + input).validatebox({
            required: false
        });
        $('#' + input).parent().prev().find('.mustS').remove();
    }

    function validateBillInfo() {
        if ($("input[name='IsUnit']:checked").attr('id') == 'IsUnit2') {
            $('#BillTaxpayerNumber').attr("disabled", false);
            $('#BillBankName').attr("disabled", false);
            $('#BillBankAccount').attr("disabled", false);
            $('#BillAddress').attr("disabled", false);
            $('#BillPhone').attr("disabled", false);
            $('#BillTaxpayer').attr("disabled", false);

            $('#BillTaxpayerNumber').validatebox({
                required: true
            });
            $('#BillTaxpayer').validatebox({
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
            $('#BillTaxpayerNumber').val('');
            $('#BillBankName').val('');
            $('#BillBankAccount').val('');
            //$('#BillAddress').val('');
            //$('#BillPhone').val('');
            $('#BillTaxpayer').val('');

            $('#BillTaxpayerNumber').attr("disabled", true);
            $('#BillBankName').attr("disabled", true);
            $('#BillBankAccount').attr("disabled", true);
            //$('#BillAddress').attr("disabled", true);
            //$('#BillPhone').attr("disabled", true);
            $('#BillTaxpayer').attr("disabled", true);

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
            $('#BillTaxpayer').validatebox({
                required: false
            });
        }
    }

</script>
