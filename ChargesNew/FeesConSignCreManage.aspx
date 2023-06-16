<%@ Page Language="c#" CodeBehind="FeesConSignCreManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.FeesConSignCreManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title></title>
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
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
		<!--

    function CheckData() {
        if ($('#BillsSign').searchbox('getValue') == "") {
            HDialog.Info("��ѡ���վݺ�!");

            return false;
        }


        HDialog.Prompt('��ȷ���Ƿ������˹�����', function () {

            $('#SearchDlg2').parent().appendTo($("form:first"));
            $("#SearchDlg2").dialog("close");

            $.tool.DataPost('FeesConSignNew', 'DetailCreCreate', $('#frmForm').serialize() + "&ChargeModeName=" + $("#ChargeMode").find("option:selected").text(),
                function Init() {
                },
                function callback(_Data) {


                    if (_Data == "true") {
                        HDialog.Info('���ɳɹ�');
                        HDialog.Close(1);
                    } else if (_Data == "û�������յķ���") {
                        HDialog.Info(_Data);
                    }
                    else {
                        HDialog.Info("����ʧ��");
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        })
    }

    function btnSelBill_OnClick() {
        var strBillTypeID = getObject("BillType").value;

        if ((strBillTypeID == "0") || (strBillTypeID == "")) {
            alert("��ѡ���վ����,�����Ϊ��!");
            FeesConSignCreManage.BillType.focus();
            return false;
        }

        var varReturn;

        varReturn = showModalDlg("../dialog/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random(), "", 650, 430);


        //alert("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.BillsSign.value = varObjects[0];
            FeesConSignCreManage.hiBillsSign.value = varObjects[0];
            return true;
        }

    }

    //�վ����
    function onchangeBillType() {
        var strBillType = getObject("BillType").value;

        Request.sendPOST("GetFirstBillsSign.aspx", "InvoiceType=" + strBillType + "&Rdm=" + Math.random(), callbackBillType);
    }

    function callbackBillType(xmlHttp) {
        var varReturn = xmlHttp.responseText;

        if (varReturn != "") {
            var Search = eval('(' + varReturn + ')');

            var SearchData = Search.SelData.Data;

            getObject("BillsSign").value = "";
            getObject("hiBillsSign").value = "";

            for (var i = 0; i < SearchData.length; i++) {
                getObject(SearchData[i].Name).value = SearchData[i].Val;
            }
        }
        else {
            getObject("BillsSign").value = "";
            getObject("hiBillsSign").value = "";
        }
    }

    function checkFormAll(chk) {
        val = document.FeesConSignCreManage.SelReturn.value
        form = document.getElementById("FeesConSignCreManage");
        var chkval;
        for (var i = 0; i < form.elements.length; i++) {
            chkval = "," + form.elements[i].value;
            //ѡ��
            if (form.elements[i].type == "checkbox") {
                form.elements[i].checked = chk.checked

                //��ֵ
                if (form.elements[i].value != "on") {
                    if (form.elements[i].checked) {
                        if (val.indexOf(chkval) < 0) {
                            val = val + chkval
                        }
                    }
                    else {
                        val = val.replace(chkval, "")

                    }
                }
            }
        }
        document.FeesConSignCreManage.SelReturn.value = val

        //alert(document.FeesConSignCreManage.SelReturn.value)
    }

    function checkFormOne(chk) {
        var val = document.FeesConSignCreManage.SelReturn.value
        var chkval = "," + chk.value;
        if (chk.checked) {
            if (val.indexOf(chkval) < 0) {
                val = val + chkval;
            }

        }
        else {
            val = val.replace(chkval, "")

        }
        document.FeesConSignCreManage.SelReturn.value = val

        //alert(document.FeesConSignCreManage.SelReturn.value)
    }
    function setcheckForm() {
        val = document.frmForm.SelReturn.value;
        form = document.getElementById("frmForm");
        var chkval = "";

        for (var i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type == "checkbox") {
                chkval = "," + form.elements[i].value
                if (form.elements[i].value != "on") {
                    if (val.indexOf(chkval) < 0) {
                        form.elements[i].checked = false
                    }
                    else {
                        form.elements[i].checked = true
                    }
                }
            }
        }

    }

    function btnClear_OnClick() {
        FeesConSignCreManage.CustID.value = "";
        FeesConSignCreManage.CustName.value = "";
        FeesConSignCreManage.hiCustName.value = "";

        FeesConSignCreManage.RoomID.value = "";
        FeesConSignCreManage.RoomSign.value = "";
        FeesConSignCreManage.hiRoomSign.value = "";

        FeesConSignCreManage.CostID.value = "";
        FeesConSignCreManage.hiCostName.value = "";
        FeesConSignCreManage.CostName.value = "";

        FeesConSignCreManage.CustTypeID.value = "ȫ��";
        FeesConSignCreManage.ChargeTypeID.value = "";
        FeesConSignCreManage.IsPay.value = "";

        FeesConSignCreManage.StartDate.value = "";
        FeesConSignCreManage.EndDate.value = "";

    }

    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.RoomID.value = varObjects[0];
            FeesConSignCreManage.RoomSign.value = varObjects[2];
            FeesConSignCreManage.hiRoomSign.value = varObjects[2];

            FeesConSignCreManage.CustID.value = varObjects[1];
            FeesConSignCreManage.CustName.value = varObjects[3];
            FeesConSignCreManage.hiCustName.value = varObjects[3];
            //alert(varReturn);

            return true;
        }

        return false;
    }

    function btnSelCust_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.CustID.value = varObjects[0];
            FeesConSignCreManage.CustName.value = varObjects[1];
            FeesConSignCreManage.hiCustName.value = varObjects[1];

            FeesConSignCreManage.RoomSign.value = "";
            FeesConSignCreManage.RoomID.value = "";
            FeesConSignCreManage.hiRoomSign.value = "";

            return true;
        }

        return false;
    }

    function SelRoomID_OnChange() {
        FeesConSignCreManage.RoomID.value = FeesConSignCreManage.SelRoomID.options[FeesConSignCreManage.SelRoomID.selectedIndex].value;
        FeesConSignCreManage.RoomSign.value = FeesConSignCreManage.SelRoomID.options[FeesConSignCreManage.SelRoomID.selectedIndex].text;
        FeesConSignCreManage.hiRoomSign.value = FeesConSignCreManage.RoomSign.value;

    }

    function btnSelCost_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.CostID.value = varObjects[0];
            FeesConSignCreManage.CostName.value = varObjects[2];
            FeesConSignCreManage.hiCostName.value = varObjects[2];

            return true;
        }

        return false;
    }
    //-->
    </script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="SelReturn" style="width: 24px; height: 22px" type="hidden" size="1" name="SelReturn" runat="server">
        <input id="hiRoundingNum" style="width: 16px; height: 22px" type="hidden" size="1" name="hiRoundingNum" runat="server">
        <input id="hiSurplusGame" style="width: 16px; height: 22px" type="hidden" size="1" name="hiSurplusGame" runat="server">
        <input id="requestPath" type="hidden" name="requestPath" runat="server" />
        <input id="hiIsSelectSQL" name="hiIsSelectSQL" runat="server" type="hidden" />
        <input id="AllData" name="AllData" type="hidden" />
        <input id="IsExcel" name="IsExcel" type="hidden" />
        <div id="SearchDlg1" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px; padding: 10px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">���ÿ�ʼ����</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="FeesStateDate" onclick="WdatePicker()" name="FeesStateDate" data-options="editable:false" runat="server"></td>
                    <td class="TdTitle">���ý�������</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="FeesEndDate" onclick="WdatePicker()" name="FeesEndDate" data-options="editable:false" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">����ΥԼ��</td>
                    <td class="TdContentSearch">
                        ��<input type="radio" checked="checked" name="IsLateFeeAmount" value="0" />
                        ��<input type="radio" name="IsLateFeeAmount" value="1"  />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="btnCreate" type="button" value="��ѯ������ϸ" name="btnCreate" runat="server"></td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg2" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px; padding: 10px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">���ɷ�ʽ</td>
                    <td class="TdContent">
                        <asp:RadioButton Style="z-index: 0" ID="RbCust" runat="server" Checked="True" Text="���ͻ�����" GroupName="RbCreate"></asp:RadioButton>
                        <asp:RadioButton ID="RbBuild" runat="server" GroupName="RbCreate" Text="����������"></asp:RadioButton></td>
                    <tr>
                        <td class="TdTitle">�տʽ</td>
                        <td class="TdContentSearch">
                            <select id="ChargeMode" name="ChargeMode" runat="server">
                                <option selected></option>
                            </select></td>
                        <td class="TdTitle">�վ���ʽ</td>
                        <td class="TdContentSearch">
                            <select id="UseRepID" name="UseRepID" runat="server">
                                <option selected></option>
                            </select></td>
                    </tr>
                <tr>
                    <td class="TdTitle">Ʊ�����</td>
                    <td class="TdContentSearch">
                        <select id="BillType" name="BillType" onchange="BillTypeChange()" runat="server"></select></td>
                    <td class="TdTitle">Ʊ�ݺ�</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelBillsSign" data-options="editable:false" id="BillsSign" maxlength="50" name="BillsSign" runat="server">
                        <input class="button_sel" style="display: none;" id="btnSelBill" onclick="javascript: if (btnSelBill_OnClick() == false) return false;" type="button" value=" " name="btnSelBill" runat="server">
                        <input class="Control_ItemInput" id="hiBillsSign" style="width: 8px; height: 19px" type="hidden" size="1" name="hiBillsSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">�Ƿ�ȡ��</td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="IsSurplus" name="IsSurplus" runat="server">
                            <option selected></option>
                        </select>
                        <asp:Label ID="LbSurplus" runat="server"></asp:Label>
                        <asp:CheckBox ID="IsAutoSurplus" runat="server" Text="�Զ�������ͷ��ת���" Checked="True"></asp:CheckBox></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="btnCreFees" onclick="javascript: if (CheckData() == false) return false;" type="button" value="ȷ������" name="btnCreFees" runat="server">
                        <input id="btnExcel" class="button" style="display: none" value="Excel���" type="button" name="btnExcel" runat="server">
                        <input class="button" id="btnReturn" type="button" value="�ر�" name="btnReturn" runat="server"></td>
                </tr>
            </table>
        </div>

        <div id="TableContainer"></div>
        <div id="SearchDlg3" class="easyui-dialog" title="ɸѡ����" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px;">
            <table class="DialogTable">
                 <tr>
                    <td class="TdTitle" colspan="4" >
                        <div style="float:left">
                        <input type="radio" name="IsExcelTJ" value="1" checked="checked" onchange="ChanTJ(1)"  />ѡ��ɸѡ���� 
                        <input type="radio" name="IsExcelTJ" value="2"  onchange="ChanTJ(2)"  />����ɸѡ����</div></td> 
                </tr>
                <tr id="tr1">
                    <td class="TdTitle">¥��</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                    <td class="TdTitle">�ͻ����</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr id="tr2">
                    <td class="TdTitle">�ͻ�����</td>
                    <td class="TdContentSearch">
                        <input id="CustName" class="easyui-searchbox" maxlength="50" data-options="editable:false" searcher="SelCust" name="CustName" runat="server">
                        <input class="button_sel" id="btnSelCust" style="display: none;" onclick="javascript: if (btnSelCust_OnClick() == false) return false;" type="button" value=" " name="btnSelCust" runat="server">
                        <input class="Control_ItemInput" id="CustID" style="width: 8px; height: 19px" type="hidden" size="1" name="CustID" runat="server">
                        <input class="Control_ItemInput" id="hiCustName" style="width: 12px; height: 19px" type="hidden" size="1" name="hiCustName" runat="server"></td>
                    <td class="TdTitle">��ѡ����</td>
                    <td class="TdContentSearch">
                        <select id="SelRoomID" class="easyui-combobox" data-options="editable:false" style="width: 154px;" name="SelRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr id="tr3">
                    <td class="TdTitle">���ݱ��</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" data-options="editable:false" searcher="SelRoomSign" maxlength="50" name="RoomSign" runat="server">
                        <input class="button_sel" id="btnSelRoom" style="display: none;" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;" type="button" value=" " name="btnSelRoom" runat="server">
                        <input class="Control_ItemInput" id="RoomID" style="width: 8px; height: 22px" type="hidden" size="1" name="RoomID" runat="server">
                        <input class="Control_ItemInput" id="hiRoomSign" style="width: 8px; height: 22px" type="hidden" size="1" name="hiRoomSign" runat="server"></td>
                    <td class="TdTitle">�շ�����</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr id="tr4" style="display:none">
                    <td class="TdTitle">���ݱ��</td>
                    <td class="TdContentSearch" colspan="3"> 
                        <input  id="InputRoomSign"     type="text" style="width:370px"  name="InputRoomSign"  > <a href="#" onclick="SelInputRoom('RoomSign','����')">Excel����</a>
                          </td>
                 </tr>   
                <tr id="tr5" style="display:none">
                    <td class="TdTitle">��λ���</td> 
                     <td class="TdContentSearch" colspan="3"> 
                        <input  id="InputParkName"     type="text" style="width:370px"  name="InputParkName"  > <a href="#" onclick="SelInputRoom('ParkName','��λ')">Excel����</a>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">������Ŀ</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostNames" maxlength="50" data-options="editable:false" name="CostNames" searcher="SelCostName" runat="server">
                        <input class="button_sel" id="btnSelCost" style="display: none;" onclick="javascript: if (btnSelCost_OnClick() == false) return false;" type="button" value=" " name="btnSelCost" runat="server">
                        <input class="Control_ItemInput" id="hiCostName" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCostName" runat="server">
                        <input class="Control_ItemInput" id="CostIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CostIDs" runat="server"></td>
                    <td class="TdTitle">�Ƿ�����</td>
                    <td class="TdContentSearch">
                        <select id="IsPay" name="IsPay" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">��ʼ����</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="StartDate" data-options="editable:false" name="StartDate" runat="server" onclick="WdatePicker()"></td>
                    <td class="TdTitle">��������</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="EndDate" data-options="editable:false" name="EndDate" runat="server" onclick="WdatePicker()"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">��ѯ</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="menu" class="easyui-menu" style="width: 50px; display: none;">
            <!--����һ�����صĲ˵�Div-->

            <div data-options="iconCls:'icon-add'" onclick="CheckSel(1)">ȷ��ѡ��</div>
            <div data-options="iconCls:'icon-cancel'" onclick="CheckSel(0)">ȷ��ȡ��</div>
            <!--����Ĳ˵��¼���������ӣ���toolbar�ķ����ǻ���һ����-->
            <div data-options="iconCls:'icon-edit'" onclick="CheckSelAll(1)">ȫ��ѡ��</div>
            <div data-options="iconCls:'icon-clear'" onclick="CheckSelAll(0)">ȫ��ȡ��</div>
        </div>

        <script type="text/javascript">


            function SelInputRoom(type,title) {
                var w = 800
                var h = 400;
                HDialog.Open(w, h, '../ChargesNew/FeesConsignCre_InputRoos.aspx?Ram=' + Math.random() + "&Type=" + type, '����'+title+'���', false, function callback(_Data) {

                    $("#IsExcel").val(type);
                    $("#Input" + type).val(_Data);
                });
            } 

            function ChanTJ(va) {
                if (va == "2") {
                    $("#tr1").css("display", "none");
                    $("#tr2").css("display", "none");
                    $("#tr3").css("display", "none");
                    $("#tr4").css("display", "");
                    $("#tr5").css("display", "");
                }
                else {
                    $("#tr1").css("display", "");
                    $("#tr2").css("display", "");
                    $("#tr3").css("display", "");
                    $("#tr4").css("display", "none");
                    $("#tr5").css("display", "none");

                }
            }

            function SelBillsSign() {
                var strBillTypeID = getObject("BillType").value;
                var strBillsSigns;
                var iFixedAmount = 0;

                if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                    HDialog.Info("��ѡ��Ʊ�����,�����Ϊ��!");
                    BillsEditManage.BillTypeID.focus();
                    return;
                }

                var conent = "../dialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();

                var w = 650;
                var h = 430;

                HDialog.Open(w, h, conent, 'Ʊ�ݺ�ѡ��', false, function callback(_Data) {
                    var varObjects = _Data;
                    $('#BillsSign').searchbox("setValue", varObjects);
                    $('#hiBillsSign').val(varObjects);
                });

            }

            function SelCust() {
                HDialog.Open('650', '430', '../DialogNew/CustDlg.aspx?Ram=' + Math.random(), 'ѡ��ͻ�����', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);

                    $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + encodeURI($("#CustID").val()),
                        function Init() {
                        },
                        function callback(RoomSignData) {

                            varObjects = JSON.parse(RoomSignData);
                            if (varObjects.length > 0) {

                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {

                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";

                                    if (vIsDelLive == 1) {
                                        strTmp = "(��ʷ)";
                                    }

                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;
                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                                }

                                $('#SelRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    panelWidth: 'auto',
                                    onChange: function (n, o) {
                                        var data = $('#SelRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {
                                                    $("#RoomID").val(data[i].RoomID);
                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
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

            function SelRoomSign() {

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), 'ѡ���ݱ��', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);
                });
            }

            function SelCostName() {
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx" + "?Ram=" + Math.random(), '�շ���Ŀѡ��', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**��÷��� ˢ��
                        var varObjects = varReturn.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                        $('#hiCostName').val(varObjects[1]);
                    }

                });
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#hiIsSelectSQL').val('-1');
            }
            InitTableHeight();



            $("#btnReturn").click(function () {
                //HDialog.Close();
                $('#SearchDlg2').dialog('close');
            })

            var column1 = [[
                { field: '', checkbox: true },
                { field: 'CustName', title: '�ͻ�����', width: 200, align: 'left', sortable: true },
                { field: 'RoomSign', title: '���ݱ��', width: 200, align: 'left', sortable: true },
                { field: 'ParkName', title: '��λ���', width: 200, align: 'left', sortable: true },
                { field: 'CostSNum', title: '�������', width: 200, align: 'left', sortable: true },
                { field: 'CostName', title: '��������', width: 200, align: 'left', sortable: true },
                { field: 'FeeDueYearMonth', title: '��������', width: 200, align: 'left', sortable: true },
                {
                    field: 'AccountsDueDate', title: 'Ӧ������', width: 200, align: 'left', sortable: true, formatter: changeDateFormat
                },
                { field: 'FeesStateDate', title: '��ʼ����', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'FeesEndDate', title: '��������', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'DueAmount', title: 'Ӧ�ս��', width: 200, align: 'left', sortable: true },
                { field: 'PaidAmount', title: 'ʵ�ս��', width: 200, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: 'Ƿ�ս��', width: 200, align: 'left', sortable: true },
                { field: 'LateFeeAmount', title: '��ͬΥԼ��', width: 200, align: 'left', sortable: true },
                { field: 'IsPayName', title: '�Ƿ�����', width: 200, align: 'left', sortable: true }
            ]];

            var column2 = [[
                { field: '', checkbox: true },
                { field: 'CustName', title: '�ͻ�����', width: 200, align: 'left', sortable: true },
                { field: 'RoomSign', title: '���ݱ��', width: 200, align: 'left', sortable: true },
                { field: 'CostSNum', title: '�������', width: 200, align: 'left', sortable: true },
                { field: 'CostName', title: '��������', width: 200, align: 'left', sortable: true },
                { field: 'FeeDueYearMonth', title: '��������', width: 200, align: 'left', sortable: true },
                {
                    field: 'AccountsDueDate', title: 'Ӧ������', width: 200, align: 'left', sortable: true, formatter: changeDateFormat
                },
                { field: 'FeesStateDate', title: '��ʼ����', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'FeesEndDate', title: '��������', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'DueAmount', title: 'Ӧ�ս��', width: 200, align: 'left', sortable: true },
                { field: 'PaidAmount', title: 'ʵ�ս��', width: 200, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: 'Ƿ�ս��', width: 200, align: 'left', sortable: true },
                //{ field: 'LateFeeAmount', title: '��ͬΥԼ��', width: 200, align: 'left', sortable: true },
                { field: 'IsPayName', title: '�Ƿ�����', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [


                {
                    text: '��һ������ѯ������ϸ',
                    iconCls: 'icon-edit',
                    handler: function () {
                        $('#SearchDlg1').parent().appendTo($("form:first"))
                        $('#SearchDlg1').dialog('open');
                    }
                }, '-',
                {
                    text: '�ڶ�����ɸѡ������ϸ',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg3').parent().appendTo($("form:first"))
                        $('#SearchDlg3').dialog('open');
                    }
                }, '-',
                {
                    text: '�����������������ļ�',
                    iconCls: 'icon-save',
                    handler: function () {
                        $('#SearchDlg2').parent().appendTo($("form:first"))
                        $('#SearchDlg2').dialog('open');

                    }
                }, '-',
                {
                    text: 'Excel���',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {


                        window.location.href = '../Charges/FeesConSignExcelCre.aspx';
                    }
                }
                , '-',

                {
                    text: '<span style=\"color:red\">*����һ������б���е���������ѡ���ȡ��ѡ��</span>'
                }

            ];

            function changeDateFormat(value, rowData, rowIndex) {
                var result = "";
                if (value != undefined && value != null) {
                    result = formatDate(value, 'yyyy-MM-dd');
                }
                return result;
            }

            //��ѯ
            function Search() {
                $('#hiIsSelectSQL').val('1');
                LoadList();
            }

            function LoadList() {
                var column = [];
                if ($("input[name='IsLateFeeAmount']").get(0).checked) {
                    column = column1;
                }
                else {
                    column= column2
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    onRowContextMenu: function (e, rowIndex, rowData) { //�Ҽ�ʱ�����¼�
                        //����������e��������ݺܶ࣬���Ĳ����ף�rowIndex���ǵ�ǰ���ʱ�����е�������rowData��ǰ�е�����
                        e.preventDefault(); //��ֹ����������Ҽ��¼�
                        $(this).datagrid("clearSelections"); //ȡ������ѡ����
                        $(this).datagrid("selectRow", rowIndex); //��������ѡ�и���
                        $('#menu').menu('show', {
                            //��ʾ�Ҽ��˵�
                            left: e.pageX,//�����������ʾ�˵�
                            top: e.pageY
                        });
                    },
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesConSignNew", "DetailSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg1").dialog("close");
                        $("#SearchDlg2").dialog("close");
                        $("#SearchDlg3").dialog("close");
                    }
                });

            }
            $.parser.parse("#SearchDlg1");
            $.parser.parse("#SearchDlg2");
            $.parser.parse("#SearchDlg3");
            LoadList();

            $("#btnCreate").click(function () {
                $('#hiIsSelectSQL').val('1');
                var IsLateFeeAmount = 0;
                if ($("input[name='IsLateFeeAmount']").get(1).checked) {
                    IsLateFeeAmount = 1;
                }
                $.tool.DataPost('FeesConSignNew', 'DetailCreate', 'FeesStateDate=' + $("#FeesStateDate").val()
                    + "&FeesEndDate=" + $("#FeesEndDate").val() + '&IsLateFeeAmount=' + IsLateFeeAmount + "&ConSignType=",
                    function Init() {
                    },
                    function callback(_Data) {
                        var data = _Data.split("|");
                        if (data.length > 0) {
                            if (data[0] == "true") {
                                LoadList();
                            }
                            else {
                                HDialog.Info("��ѯʧ��!" + data[1]);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            })


            function CheckSelAll(IsNoPay) {
                var row = $('#TableContainer').datagrid('getRows');
                if (row != '') {
                    if (IsNoPay == "1") {
                        HDialog.Prompt('�Ƿ�ȫ��ȷ�����е���������', function () {

                            $.tool.DataPost('FeesConSignNew', 'CheckAll', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info('����ɹ�');
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {

                                });
                        });
                    }
                    else if (IsNoPay == "0") {
                        HDialog.Prompt('�Ƿ�ȫ��ȡ�����е���������', function () {

                            $.tool.DataPost('FeesConSignNew', 'CancelAll', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info('����ɹ�');
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {

                                });
                        });
                    }

                }
                else {
                    HDialog.Info('û�пɲ���������!');
                }
            }
            function CheckSel(IsNoPay) {
                var row = $('#TableContainer').datagrid('getRows');
                if (row != '') {
                    var checkRows = $('#TableContainer').datagrid('getChecked');
                    if (checkRows != '') {
                        //var AllData = JSON.stringify(checkRows);
                        //$('#AllData').val(AllData);
                        if (IsNoPay == "1") {
                            HDialog.Prompt('�Ƿ�ȷ����ѡ�����յ�����', function () {
                                var checkValues = "";
                                $.each(checkRows, function (index, item) {
                                    checkValues += item.IID + ",";
                                })
                                $.tool.DataPost('FeesConSignNew', 'DetailCheck', 'CheckValue=' + checkValues,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "true") {
                                            HDialog.Info('����ɹ�');
                                            LoadList();
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {

                                    });
                            });
                        }
                        else if (IsNoPay == "0") {
                            HDialog.Prompt('�Ƿ�ȷ��ȡ����ѡ�����յ�����', function () {
                                var checkValues = "";
                                $.each(checkRows, function (index, item) {
                                    checkValues += item.IID + ",";
                                })
                                $.tool.DataPost('FeesConSignNew', 'DetailCancel', 'CheckValue=' + checkValues,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "true") {
                                            HDialog.Info('����ɹ�');
                                            LoadList();
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {

                                    });
                            });
                        }

                    }
                    else {
                        HDialog.Info('��ѡ��Ҫ����������!');
                    }
                }
                else {
                    HDialog.Info('û�пɲ���������!');
                }
            }

            function BillTypeChange() {
                $.tool.DataPostNoLoading('FeesConSignNew', 'SetBillsSign', 'BillType=' + $('#BillType').val(),
                    function Init() {
                        $('#BillsSign').val();
                        $('#hiBillsSign').val();
                    },
                    function callback(_Data) {
                        if (_Data != "") {

                            $('#BillsSign').searchbox('setValue', _Data);
                            $('#hiBillsSign').val(_Data);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            }
        </script>
    </form>
</body>
</html>
