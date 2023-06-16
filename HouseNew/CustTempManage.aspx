<%@ Page Language="c#" CodeBehind="CustTempManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.CustTempManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>CustTempManage</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/ajax.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script language="javascript">

        function CheckData() {
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
            }
            //else {
            //    if ($("#PaperName").combobox("getValue") == "0001" && !idCardCheckfun($("#PaperCode").val())) {
            //        HDialog.Info("֤������,����ȷ!");
            //        return false;
            //    } else if (!checkYskh($("#PaperCode").val())) {
            //        HDialog.Info("֤������,ֻ�ܰ������֡�Ӣ�ġ����(���š���б��)!");
            //        return false;
            //    }
            //}


            if (CustTempManage.CustName.value == "") {
                HDialog.Info("��������ʱ�ͻ�����,�����Ϊ��!");
                CustTempManage.CustName.focus();
                return false;
            }

            if (CustTempManage.CustTypeID.value == "") {
                HDialog.Info("��ѡ��ͻ����,�����Ϊ��!");
                CustTempManage.CustTypeID.focus();
                return false;
            }




            if (CustTempManage.Linkman.value == "") {
                HDialog.Info("��������ֻ�����,�����Ϊ��!");
                CustTempManage.Linkman.focus();
                return false;
            }
            if (CustTempManage.LinkmanTel.value == "") {
                HDialog.Info("��������ֻ�����,�����Ϊ��!");
                CustTempManage.LinkmanTel.focus();
                return false;
            }


            if (CustTempManage.BankAccount.value != "") {
                if (CustTempManage.BankAccount.value != CustTempManage.BankAccountTwo.value) {
                    HDialog.Info("��������������˺Ų�ͬ,����������!");
                    CustTempManage.BankAccount.focus();
                    return false;
                }
            }

            var strPaperCodeResults = getObject("PaperCodeResults").innerHTML;

            if ((strPaperCodeResults != "") && (strPaperCodeResults != "�µĺ��룡")) {
                HDialog.Info(strPaperCodeResults);
                CustTempManage.PaperCode.focus();
                return false;
            }

            var strLinkmanTel = CustTempManage.LinkmanTel.value;

            if (strLinkmanTel.length != 11) {
                HDialog.Info("���ֻ�����λ������!");
                CustTempManage.LinkmanTel.focus();
                return false;
            }

            var strBillPhone = CustTempManage.BillPhone.value;
            if (strBillPhone) {
                if (strBillPhone.length != 11) {
                    HDialog.Info("��Ʊ��Ϣ��ϵ�绰λ������!");
                    CustTempManage.BillPhone.focus();
                    return false;
                }
            }
            if (CustTempManage.PaperName.value == "0001") {
                if (PaperCodeVerification(CustTempManage.PaperCode.value) == false) {
                    return false;
                }
            }
            return true;
        }

        function PaperCodeVerification(strPaperCode) {
            var strCustID = CustTempManage.CustID.value;
            if (CustTempManage.PaperName.value == "0001") {
                if (strPaperCode.split(',').length > 1) {
                    for (var i = 0; i < strPaperCode.split(',').length; i++) {
                        if (strPaperCode.split(',')[i] == "") {
                            HDialog.Info("���֤��" + (i + 1) + "������Ϊ��!");
                            return false;
                        }
                        if (IdentityCodeValid(strPaperCode.split(',')[i]) == false) {
                            HDialog.Info("���֤��" + strPaperCode.split(',')[i] + "����Ч��У��δͨ��������!");
                            return false;
                        }
                    }
                } else {
                    if (IdentityCodeValid(strPaperCode) == false) {
                        HDialog.Info("���֤У����������!");
                        return false;
                    }
                }
            }
        }
        //���֤У��
        function IdentityCodeValid(idCard) {
            //15λ��18λ���֤�����������ʽ
            var regIdCard = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
            var Pass = false;
            //���ͨ������֤��˵�����֤��ʽ��ȷ����׼ȷ�Ի������
            if (regIdCard.test(idCard)) {
                if (idCard.length == 18) {
                    var idCardWi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); //��ǰ17λ��Ȩ���ӱ�����������
                    var idCardY = new Array(1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2); //���ǳ���11�󣬿��ܲ�����11λ��������֤�룬Ҳ���������
                    var idCardWiSum = 0; //��������ǰ17λ���Թ��Լ�Ȩ���Ӻ���ܺ�
                    for (var i = 0; i < 17; i++) {
                        idCardWiSum += idCard.substring(i, i + 1) * idCardWi[i];
                    }
                    var idCardMod = idCardWiSum % 11;//�����У�������������λ��
                    var idCardLast = idCard.substring(17);//�õ����һλ���֤����
                    //�������2����˵��У������10�����֤�������һλӦ����X
                    if (idCardMod == 2) {
                        if (idCardLast == "X" || idCardLast == "x") {
                            //alert("��ϲͨ����֤����");
                            Pass = true;
                        } else {
                            Pass = false;
                            //alert("���֤�������");
                        }
                    } else {
                        //�ü��������֤�������һλ���֤����ƥ�䣬���һ�£�˵��ͨ������������Ч�����֤����
                        if (idCardLast == idCardY[idCardMod]) {
                            //alert("��ϲͨ����֤����");
                            Pass = true;
                        } else {
                            //alert("���֤�������");
                            Pass = false;
                        }
                    }
                }
            } else {
                //alert("���֤��ʽ����ȷ!");
                Pass = false;
            }
            return Pass;

            //var city = { 11: "����", 12: "���", 13: "�ӱ�", 14: "ɽ��", 15: "���ɹ�", 21: "����", 22: "����", 23: "������ ", 31: "�Ϻ�", 32: "����", 33: "�㽭", 34: "����", 35: "����", 36: "����", 37: "ɽ��", 41: "����", 42: "���� ", 43: "����", 44: "�㶫", 45: "����", 46: "����", 50: "����", 51: "�Ĵ�", 52: "����", 53: "����", 54: "���� ", 61: "����", 62: "����", 63: "�ຣ", 64: "����", 65: "�½�", 71: "̨��", 81: "���", 82: "����", 91: "���� " };
            //var tip = "";
            //var pass = true;

            //if (!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)) {
            //    tip = "���֤�Ÿ�ʽ����";
            //    pass = false;
            //}

            //else if (!city[code.substr(0, 2)]) {
            //    tip = "��ַ�������";
            //    pass = false;
            //}
            //else {
            //    //18λ���֤��Ҫ��֤���һλУ��λ
            //    if (code.length == 18) {
            //        code = code.split('');
            //        //��(ai��Wi)(mod 11)
            //        //��Ȩ����
            //        var factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
            //        //У��λ
            //        var parity = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2];
            //        var sum = 0;
            //        var ai = 0;
            //        var wi = 0;
            //        for (var i = 0; i < 17; i++) {
            //            ai = code[i];
            //            wi = factor[i];
            //            sum += ai * wi;
            //        }
            //        var last = parity[sum % 11];
            //        if (parity[sum % 11] != code[17]) {
            //            tip = "У��λ����";
            //            pass = false;
            //        }
            //    }
            //}
            ////if (!pass) alert(tip);
            //return pass;
        }


        function CheckPaperCode() {
            var strCustID = CustTempManage.CustID.value;
            var strPaperCode = CustTempManage.PaperCode.value;

            getObject("results").innerHTML = "";

            if (CustTempManage.PaperName.value == "0001") {
                if (PaperCodeVerification(strPaperCode) == false) {
                    return;
                }
            } else {
                Request.sendPOST("../House/CheckPaperCode.aspx", "CustID=" + strCustID + "&PaperCode=" + strPaperCode + "&Ram=" + Math.random(), callbackPaperCode);

            }
            //Request.sendPOST("../House/CheckPaperCode.aspx", "CustID=" + strCustID + "&PaperCode=" + strPaperCode + "&Ram=" + Math.random(), callbackPaperCode);

        }
        function callbackPaperCode(xmlHttp) {
            //alert(xmlHttp.responseText);
            //var varReturn = xmlHttp.responseText;
            //getObject("PaperCodeResults").innerHTML = varReturn;
            var varReturn = xmlHttp.responseText;
            var res = varReturn.split('|');
            if (res.length > 1) {
                getObject("PaperCodeResults").innerHTML = res[1];
                if (res[0] == "false") {
                    HDialog.Info(res[1]);
                }
            }
            
        }

        function btnFileUp_Onclick() {
            if (CustTempManage.AdjunctName.value == "") {
                alert("�������ļ���������,�����Ϊ��!");
                CustTempManage.AdjunctName.focus();
                return false;
            }

            if (CustTempManage.btnFile.value == "") {
                alert("��ѡ��Ҫ�ϴ��ı����ļ�!");
                CustTempManage.btnFile.focus();
                return false;
            }

            return true;
        }

        function btnFile_Onclick() {
            var filename = CustTempManage.btnFile.value;
            var realname = filename.substring(filename.lastIndexOf("\\") + 1, filename.lastIndexOf("."));
            CustTempManage.AdjunctName.value = realname;
            $("#AdjunctName").val(realname);
        }

        function btnChangeName_Onclick() {
            var strCustID = CustTempManage.CustID.value;

            var varReturn = showModalDlg("../dialog/CustChangeNameDlg.aspx?CustID=" + strCustID + "&Ram=" + Math.random(), "", 500, 300);

            //alert(varReturn);
            if (varReturn != "") {//**��÷��صĲ�����Ϣ

                var varObjects = varReturn.split("\t");

                CustTempManage.CustName.value = varObjects[0];
            }
        }


        function showIsUnit(expid1, expid2) {

            if ($(this).attr('id') == 'IsUnit1') {
                $("#" + expid1 + "").show();
                $("#" + expid2 + "").hide();
            }
            else {
                $("#" + expid1 + "").hide();
                $("#" + expid2 + "").show();
            }
            //if (getObject(expid1).style.display == "none") {
            //    $("#" + expid1 + "").show();
            //    $("#" + expid2 + "").hide();
            //    //getObject(expid1).style.display = "inline";
            //    //getObject(expid2).style.display = "none";
            //}
            //else {
            //    $("#" + expid1 + "").hide();
            //    $("#" + expid2 + "").show();
            //    //getObject(expid1).style.display = "none";
            //    //getObject(expid2).style.display = "inline";
            //}
        }

        function OnFormload() {

            if (CustTempManage.IsUnit1.checked) {
                $("#Table2").show();
                $("#Table3").hide();
            }
            else {
                $("#Table2").hide();
                $("#Table3").show();
            }
        }
        function onLinkmanTel() {

            var strMobilePhone = CustTempManage.MobilePhone.value;
            if (strMobilePhone.length > 11) {
                CustTempManage.LinkmanTel.value = strMobilePhone.substr(0, 11);
            }
            else {
                CustTempManage.LinkmanTel.value = strMobilePhone;
            }
        }
        function onLinkman() {


            CustTempManage.Linkman.value = CustTempManage.CustName.value;

        }

        function WriteLinkman() {
            $("#Linkman").val($("#CustName").val());
            $("#Recipient").val($("#CustName").val());
        }

        function WriteLinkmanTel() {
            var tempTel = $("#MobilePhone").val();
            if (tempTel.length > 11) {
                tempTel = tempTel.substr(0, 11);
            }
            $("#LinkmanTel").val(tempTel);
        }
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        function CheckUpdate() {

            if (GetQueryString("IsLock") == "1") {
                $("#save").attr('disabled', false)
                $("#save").removeAttr("onclick");
                $("#save").css("background-color", "#B8B8B8");


                $("#btnChangeName").attr('disabled', false)
                $("#btnChangeName").removeAttr("onclick");
                $("#btnChangeName").css("background-color", "#B8B8B8");


                $("#btnReadPaperCode").attr('disabled', false)
                $("#btnReadPaperCode").removeAttr("onclick");
                $("#btnReadPaperCode").css("background-color", "#B8B8B8");

                $("#SaveBillInfo").show(0);
            }
        }


        $(document).ready(
            function () {
                CheckUpdate();
            }
        )

    </script>
</head>
<body style="overflow-y: auto;">
    <form id="CustTempManage" method="post" runat="server">
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="BillInfoID" type="hidden" size="1" name="BillInfoID" runat="server">
        <input id="CustID" type="hidden" size="1" name="CustID" runat="server">
        <input id="OnlyShow" type="hidden" size="1" name="OnlyShow" runat="server">
        <input id="FixedTelHistory" type="hidden" name="FixedTelHistory" runat="server" />
        <input id="MobilePhoneHistory" type="hidden" name="MobilePhoneHistory" runat="server" />
        <input id="PaperCodeHistory" type="hidden" name="PaperCodeHistory" runat="server" />
        <table class="DialogTable" id="Table1">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">��ʱ�ͻ�������Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��ʱ�ͻ�����</td>
                <td class="TdContent">
                    <input id="CustName" onblur="javascript:WriteLinkman();" class="easyui-validatebox" data-options="required:true" style="width: 58%;" maxlength="50" name="CustName" runat="server">
                    <input class="button" style="width: 45px;" id="btnChangeName" onclick="SelbtnChangeName()" type="button" value="����" name="btnChangeName" runat="server">
                </td>
                <td class="TdTitle">����֤��</td>
                <td class="TdContent">
                    <input id="PassSign" maxlength="50" name="PassSign" runat="server">
                </td>
                <td class="TdTitle">֤������</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="PaperName" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList></td>
                <td class="TdTitle">֤������</td>
                <td class="TdContent">
                    <input id="PaperCode" class="easyui-validatebox" data-options="required:true" onblur="javascript:CheckPaperCode();" maxlength="50" name="PaperCode" runat="server">
                    <div class="font_red" id="PaperCodeResults"></div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�ͻ����</td>
                <td class="TdContentSearch">
                    <select id="CustTypeID" style="width: 82%;" name="CustTypeID" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">�̶��绰</td>
                <td class="TdContent">
                    <input id="FixedTel" maxlength="50" name="FixedTel" runat="server"></td>
                <td class="TdTitle">�ƶ��绰</td>
                <td class="TdContent">
                    <input id="MobilePhone" class="easyui-validatebox" onblur="javascript:WriteLinkmanTel();" name="MobilePhone" runat="server"></td>
                <td class="TdTitle">����绰</td>
                <td class="TdContent">
                    <input id="FaxTel" maxlength="50" name="FaxTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">��ϵ��ַ</td>
                <td class="TdContent">
                    <input id="Address" maxlength="50" name="Address" class="easyui-validatebox" runat="server"></td>
                <td class="TdTitle">��������</td>
                <td class="TdContent">
                    <input id="PostCode" maxlength="50" name="PostCode" runat="server"></td>
                <td class="TdTitle">�� �� ��</td>
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
                    <input id="Linkman" name="Linkman" runat="server"></td>
                <td class="TdTitle">���ֻ�����</td>
                <td class="TdContent">
                    <input id="LinkmanTel" maxlength="11" name="LinkmanTel" runat="server">
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent">
                    <%--       <input id="IsUnit1" onclick="javascript:showIsUnit('Table2', 'Table3');" type="radio" checked
                        value="0" name="IsUnit" runat="server">����ҵ��<input id="IsUnit2" onclick="javascript: showIsUnit('Table2', 'Table3');" type="radio" value="1"
                            name="IsUnit" runat="server">��λҵ��</td>--%>
                    <input id="IsUnit1" type="radio" checked
                        value="0" name="IsUnit" runat="server">����<input id="IsUnit2" type="radio" value="1"
                            name="IsUnit" runat="server">��λ</td>
                <td class="TdTitle">�Ƿ�Ӧ��</td>
                <td class="TdContentSearch">
                    <select id="IsSupplier" style="width: 82%;" name="IsSupplier" runat="server" data-options="editable:false,panelHeight: 'auto',onChange:function(newValue,oldValue){ SupplierChange(newValue, oldValue)}" class="easyui-combobox">
                        <option value="0" selected>��</option>
                        <option value="1">��</option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">������</td>
                <td class="TdContent">
                    <input id="Charge" class="easyui-validatebox" maxlength="50" name="Charge" runat="server"></td>
                <td class="TdTitle">�����˵绰</td>
                <td class="TdContent">
                    <input id="ChargeTel" class="easyui-validatebox" maxlength="50" name="ChargeTel" runat="server"></td>
                <td class="TdTitle">��Ӫ��Χ</td>
                <td class="TdContent">
                    <input id="ManagementScope" maxlength="500" name="ManagementScope" runat="server"></td>
                <td class="TdTitle" style="display: none">��Ʊ��Ϣ</td>
                <td class="TdContent" style="display: none">
                    <input id="UserBillMsg" class="easyui-validatebox" name="UserBillMsg" runat="server">
                </td>
                <td class="TdTitle">��Ӧ�����</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="SupplierType" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                 <td class="TdTitle"></td>
                <td class="TdContent">
                    <input class="button" id="btnReadPaperCode" onclick="ReadPaperCode()" type="button" value="��ȡ���֤��Ϣ" runat="server"></td>
                <td style="display:none;" class="TdContent" colspan="3">
                    <input id="PublicOwner" width="100%" class="easyui-validatebox" name="PublicOwner" runat="server">
                </td>

            </tr>
        </table>
        <table class="DialogTable" id="Table2">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">������ʱ�ͻ���Ϣ</span>
                </td>
            </tr>
            <asp:Panel ID="PanelName" runat="server" Visible="False">
                <tr>
                    <td class="TdTitle">��</td>
                    <td class="TdContent">
                        <input style="width: 45%" id="Surname" maxlength="50" name="Surname"
                            runat="server">��
                        <input style="width: 45%" id="Name" maxlength="50" name="Name"
                            runat="server">
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
            </asp:Panel>
            <tr>
                <td class="TdTitle">�Ա�</td>
                <td class="TdContentSearch">
                    <select id="Sex" style="width: 82%;" name="Sex" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">��������</td>
                <td class="TdContentSearch">
                    <select id="nYear" style="width: 80px" name="nYear" runat="server" class="easyui-combobox">
                        <option selected></option>
                    </select>��<select id="nMonth" style="width: 40px" name="nMonth" runat="server" class="easyui-combobox">
                        <option selected></option>
                    </select>��<select id="nDay" style="width: 40px" name="nDay" runat="server" class="easyui-combobox">
                        <option selected></option>
                    </select>��<input id="Birthday" style="width: 20px; height: 19px" type="hidden"
                        maxlength="10" size="10" name="Birthday" runat="server">
                </td>
                <td class="TdTitle">����</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="Nationality" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                </td>
                <td class="TdTitle">ְҵ</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="DrJob" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">������λ</td>
                <td class="TdContent">
                    <input id="WorkUnit" maxlength="50" name="WorkUnit" runat="server"></td>
                <td class="TdTitle">��Ȥ����</td>
                <td class="TdContentSearch" colspan="5">
                    <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
            </tr>
        </table>
        <table class="DialogTable" id="Table3">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">��λ��ʱ�ͻ���Ϣ</span>
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
            </tr>
        </table>
        <table class="DialogTable" id="Table4">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">���д�����Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">��������</td>
                <td class="TdContent">
                    <input id="BankName" maxlength="50" name="BankName" runat="server"></td>
                <td class="TdTitle">���л���</td>
                <td class="TdContent">
                    <input id="BankIDs" maxlength="50" name="BankIDs" runat="server"></td>
                <td class="TdTitle">�����˺�</td>
                <td class="TdContent">
                    <input id="BankAccount" maxlength="50" name="BankAccount" runat="server"></td>
                <td class="TdTitle">ȷ�������˺�</td>
                <td class="TdContent">
                    <input id="BankAccountTwo" maxlength="50" name="BankAccountTwo" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">����Э����</td>
                <td class="TdContent">
                    <input id="BankAgreement" maxlength="50" name="BankAgreement"
                        runat="server"></td>
                <td class="TdTitle">��ע</td>
                <td class="TdContent">
                    <input id="Memo" maxlength="50" name="Linkman" runat="server">
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
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
                    <textarea id="BillRemark" style="width: 96%; height: 60px" name="BillRemark" rows="3" cols="96" runat="server"></textarea></td>
            </tr>
            <tr>
                <td colspan="8">
                    <input class="button" id="SaveBillInfo" style="float: right; margin-right: 3.5%; display: none" onclick="BillInfoSave()"
                        type="button" value="���濪Ʊ��Ϣ" name="btnFilter" />
                </td>

            </tr>
            <tr>
                <td colspan="8">
                    <div id="BRGrid" style="width: 100%; height: 200px;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">����������Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">�ļ��ϴ�</td>
                <td class="TdContentSearch" colspan="7">
                    <input id="AdjunctName" style="width: 40%; height: 22px" maxlength="200"
                        name="AdjunctName" runat="server">
                    <input id="btnFile" style="width: 20%; height: 22px" tabindex="1" type="file" size="1"
                        name="btnFile" onpropertychange="javascript:btnFile_Onclick();" onchange="btnFile_Onclick();" runat="server">&nbsp;
                    <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        tabindex="1" type="button" value="�ϴ�" name="btnFileUp" runat="server"></td>
            </tr>
            <tr>
                <td class="TdContent" colspan="8">
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
                            <asp:TemplateColumn HeaderText="[����]">
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='����'  >"
                                        CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="[ɾ��]">
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('��ȷ���Ƿ�ɾ���ü�¼')==false) return false;&quot; alt='ɾ��' >"
                                        CommandName="Delete" CausesValidation="false" TabIndex="1" ID="btnDelete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td colspan="8"></td>
            </tr>
            <tr>
                <td class="DialogTdSubmit" align="center" colspan="8">
                    <input class="button" id="save" onclick="BtnSave()"
                        type="button" value="����" name="btnFilter" runat="server">
                    <input class="button" style="display: none;" id="btnSave"
                        type="button" value="����" name="btnFilter" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="��������" name="btnFilter" runat="server"></td>
            </tr>
        </table>

    </form>
</body>
</html>
<script type="text/javascript">
    $(function () {

        OnFormload();
    });

    function SelbtnChangeName() {
        var strCustID = $('#CustID').val();
        var conent = "../DialogNew/CustChangeNameDlg.aspx?CustID=" + strCustID + "&Rnd=" + Math.random();

        HDialog.Open('450', '300', conent, '�ͻ�����', false, function callback(_Data) {
            if (_Data != "") {
                $('#CustName').val(_Data);
            }

        });
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


        if ($('#CustTempManage').form('enableValidation').form('validate') == false) {
            return false;
        }

        if (CheckData() == false)
            return false;

        document.getElementById('btnSave').click();

    }
    function BillInfoSave() {
        if ($('#CustTempManage').form('enableValidation').form('validate') == false) {
            return false;
        }
        $.tool.DataPost("EInvoiceManage", "UpdateBillsInfo", $('#CustTempManage').serialize(), function Init() {
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



        var Height = 400;
        var Width = 700;

        var iTop2 = (window.screen.height - 400) / 2;
        var iLeft2 = (window.screen.width - 700) / 2;
        var sFeatures = "status:no;help:no;resizable:no;scroll:no;dialogHeight:" + Height + "px;modal=yes;dialogWidth:" + Width + "px;dialogLeft=" + iLeft2 + "px;dialogTop=" + iTop2 + "px";

        window.showModalDialog('PaperCodeRead.aspx', "", sFeatures);


        Request.sendPOST("PaperCodeReadInfo.aspx", "", callbackPaperCodeInfo);

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
            // $('#Birthday').val(strBorn)
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
                    }
                );

            }
            else {
                $('#SupplierType').combobox('setValue', '');
                $('#SupplierType').combobox('readonly');
            }
        }

    });

    var RoomColumn = [[
        { field: 'RoomName', title: '��������', width: 100, align: 'left', sortable: true },
        { field: 'RoomSign', title: '���ݱ��', width: 100, align: 'left', sortable: true },
        { field: 'CustName', title: '�ͻ�����', width: 100, align: 'left', sortable: true },
        { field: 'BuildArea', title: '�������', width: 100, align: 'left', sortable: true }
    ]];


    var toolbar = [
        {
            text: '��������',
            iconCls: 'icon-add',
            handler: function () {

                if ($("#CustID").val() == "0") {
                    HDialog.Info("���ȱ���ͻ�");
                    return;
                }
                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '����ѡ��', false, function callback(_Data) {

                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $.tool.DataPost("EInvoiceManage", "AddCustBillRoom", "RoomID=" + data.RoomID + "&CustID=" + $("#CustID").val(), function Init() {
                        },
                            function callback(_Data) {
                                LoadData();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }

                });
            }
        }, '-',
        {
            text: 'ɾ������',
            iconCls: 'icon-cancel',
            handler: function () {
                var ob = $("#BRGrid").datagrid('getSelected');
                if (ob != null) {
                    $.tool.DataPost("EInvoiceManage", "DelCustBillRoom", "RoomID=" + ob.RoomID + "&CustID=" + $("#CustID").val(), function Init() {
                    },
                        function callback(_Data) {
                            LoadData();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
                else {
                    HDialog.Info("��ѡ����");
                }
            }
        }];

    function LoadData() {
        //�����Ѿ�ͳ���˵�����
        $("#BRGrid").datagrid({
            title: '���⻧����',
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            pageSize: 50,
            pageList: [30, 50, 100],
            columns: RoomColumn,
            fitColumns: true,
            singleSelect: true,
            remoteSort: false,
            rownumbers: true,
            pagination: true,
            toolbar: toolbar,
            border: false,
            sortOrder: "asc",
            onLoadSuccess: function (data) {

            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParamNoPage("EInvoiceManage", "GetCustBillRoom", "TableContainer", param);
            },
            rowStyler: function (index, row) {
                return 'height:20px;';
            }
        });
    }

    LoadData();


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

            //$('#BillTaxpayerNumber').validatebox({
            //    required: true
            //});
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



    $(function () {

        validateBillInfo();

    })
</script>
