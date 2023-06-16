<%@ Page Language="c#" CodeBehind="LeaseRoomThdCreManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.RentalNew.LeaseRoomThdCreManage" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script language="javascript">
		<!--

    function CheckData() {

        if (LeaseRoomThdCreManage.RoomIDs.value == "") {

            HDialog.Info("��ѡ����,�����Ϊ��!");
            LeaseRoomThdCreManage.btnSelRoom.focus();
            return false;
        }

        if (!getObject("IsRelet").checked) {

            if ($('#NewCustID').val() == "") {

                HDialog.Info("�������µĿͻ�,�����Ϊ��!");
                LeaseRoomThdCreManage.NewCustName.focus();
                return false;
            }
        }
        if (LeaseRoomThdCreManage.StartDate.value == "") {
            HDialog.Info("�����뿪ʼʱ��,�����Ϊ��!");
            LeaseRoomThdCreManage.StartDate.focus();
            return false;
        }
        if (LeaseRoomThdCreManage.EndDate.value == "") {
            HDialog.Info("���������ʱ��,�����Ϊ��!");
            LeaseRoomThdCreManage.EndDate.focus();
            return false;
        }
        if (LeaseRoomThdCreManage.PaperCode.value == "") {
            HDialog.Info("������֤������,�����Ϊ��!");
            LeaseRoomThdCreManage.PaperCode.focus();
            return false;
        }

        if (LeaseRoomThdCreManage.Linkman.value == "") {
            HDialog.Info("��������ϵ��,�����Ϊ��!");
            LeaseRoomThdCreManage.Linkman.focus();
            return false;
        }
        if (LeaseRoomThdCreManage.LinkmanTel.value == "") {
            HDialog.Info("��������ϵ�˵绰,�����Ϊ��!");
            LeaseRoomThdCreManage.LinkmanTel.focus();
            return false;
        }

        //var strresults = getObject("results").innerHTML;

        //if((strresults!="")&&(strresults!="�µĵ�¼�˺ţ�"))
        //{
        //	HDialog.Info(strresults);
        //	LeaseRoomThdCreManage.InquireAccount.focus();
        //	return false;
        //}				
        return true;
    }

    function CheckAccount() {
        var strInquireAccount = LeaseRoomThdCreManage.InquireAccount.value;
        var strOldAccount = LeaseRoomThdCreManage.OldAccount.value;
        getObject("results").innerHTML = "";
        //HDialog.Info(strLoginCode);

        Request.sendPOST("CheckAccount.aspx", "InquireAccount=" + strInquireAccount + "&OldAccount=" + strOldAccount, callbackAccount)

    }
    function callbackAccount(xmlHttp) {
        //HDialog.Info(xmlHttp.responseText);
        var varReturn = xmlHttp.responseText;
        getObject("results").innerHTML = varReturn;
    }

    function btnSelRooms_OnClick() {

        //varReturn=showModalDlg("../dialog/RoomLeaseDlg.aspx?IsLease=1"+"&Ram="+Math.random(),"",650,400);
        //*����
        varReturn = showModalDlg("../dialog/MultiRoomLeaseDlg.aspx?IsRental=1&Ram=" + Math.random(), "", 750, 600);
        //HDialog.Info(varReturn);
        if (varReturn != "") {//**��÷��صĲ�����Ϣ

            var varObjects = varReturn.split("\t");

            LeaseRoomThdCreManage.RoomIDs.value = varObjects[0];
            LeaseRoomThdCreManage.RoomSigns.value = varObjects[1];
            LeaseRoomThdCreManage.hiRoomSigns.value = varObjects[1];

            LeaseRoomThdCreManage.RoomSigns2.value = LeaseRoomThdCreManage.RoomSigns.value;

            var arrRoomIDs = varObjects[0].split(',');

            LeaseRoomThdCreManage.RoomNum.value = arrRoomIDs.length;

            return true;
        }

        return false;
    }

    function btnSelNewCust_OnClick() {
        if (LeaseRoomThdCreManage.RoomID.value == "") {
            HDialog.Info("��ѡ����,�����Ϊ��!");
            LeaseRoomThdCreManage.btnSelRoom.focus();
            return false;
        }

        //var strLiveType = LeaseRoomThdCreManage.LiveType.value;
        var strLiveType = 0;
        var strCustID = LeaseRoomThdCreManage.CustID.value;
        var varReturn;
        varReturn = showModalDlg("../dialog/CustSingleDlg.aspx?LiveType=" + strLiveType + "&CustID=" + strCustID + "&Ram=" + Math.random(), "", 650, 400);
        //HDialog.Info("["+varReturn+"]");
        if (varReturn != "") {//**��÷��� ˢ��
            var varObjects = varReturn.split("\t");

            LeaseRoomThdCreManage.NewCustID.value = varObjects[0];
            $('#NewCustName').searchbox("setValue", varObjects[1]);
            LeaseRoomThdCreManage.hiNewCustName.value = varObjects[1];

            return true;
        }

        return false;
    }
    function showIsUnit(expid1, expid2) {
        if (getObject(expid1).style.display == "none") {
            getObject(expid1).style.display = "";
            getObject(expid2).style.display = "none";
        }
        else {
            getObject(expid1).style.display = "none";
            getObject(expid2).style.display = "";
        }
    }

    function OnFormload() {

        if (LeaseRoomThdCreManage.IsUnit1.checked) {
            getObject('Table2').style.display = "";
            getObject('Table3').style.display = "none";
        }
        else {
            getObject('Table2').style.display = "none";
            getObject('Table3').style.display = "";
        }
    }

    function btnFileUp_Onclick() {
        if (LeaseRoomThdCreManage.AdjunctName.value == "") {
            HDialog.Info("�������ļ���������,�����Ϊ��!");
            LeaseRoomThdCreManage.AdjunctName.focus();
            return false;
        }

        if (LeaseRoomThdCreManage.btnFile.value == "") {
            HDialog.Info("��ѡ��Ҫ�ϴ��ı����ļ�!");
            LeaseRoomThdCreManage.btnFile.focus();
            return false;
        }

        return true;
    }

    function btnFile_Onclick() {
        var filename = LeaseRoomThdCreManage.btnFile.value;
        var realname = filename.substring(filename.lastIndexOf("\\") + 1, filename.lastIndexOf("."));

        //HDialog.Info(realname);
        LeaseRoomThdCreManage.AdjunctName.value = realname;
        $("#AdjunctName").val(realname);
    }
		//-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body onload="javascript:OnFormload();" style="overflow-y: auto">
    <form id="LeaseRoomThdCreManage" method="post" runat="server">
        <input style="width: 32px; height: 22px" id="PageIndex" size="1" type="hidden" name="PageIndex"
            runat="server"><input style="width: 32px; height: 22px" id="LiveType" size="1" type="hidden" name="LiveType"
                runat="server"><input style="z-index: 0; width: 16px; height: 22px" id="IsCheck" size="1" type="hidden"
                    name="NoEdit" runat="server"><input style="z-index: 0; width: 32px; height: 22px" id="DestID" size="1" type="hidden"
                        name="DestID" runat="server">
        <input id="btnSelNewCust" type="button" name="btnSelNewCust" runat="server" />
        <table id="Table1" class="DialogTable" style="width: 100%">
            <asp:Panel ID="SinglePanel" runat="server">


                <tr>
                    <td class="TdTitle" style="width: 15%">�ͻ�����</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestCustName"
                            disabled name="DestCustName"
                            size="5" runat="server"></td>
                    <td class="TdTitle" style="width: 15%">Ԥ��ʱ��</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestDate" class="Control_ItemInput" disabled
                            onkeypress="CheckDate();" onclick="WdatePicker()" name="DestDate"
                            runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 15%">��ϵ��</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestLinkMan" disabled name="DestLinkMan"
                            maxlength="100" runat="server"></td>
                    <td class="TdTitle" style="width: 15%">��ϵ�绰</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestLinkTel" disabled
                            name="DestLinkTel" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 15%">��Ӫҵ̬</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestDealPurpose" class="Control_ItemInput"
                            disabled name="DestDealPurpose" runat="server"></td>
                    <td class="TdTitle" style="width: 15%">Ԥ�����ݱ��</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            style="width: 80%; height: 19px" id="DestRoomName"
                            disabled name="DestRoomName" readonly
                            runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 15%">Ԥ�����</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestArea" disabled name="DestArea"
                            runat="server"></td>
                    <td class="TdTitle" style="width: 15%">������</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestAmount" disabled
                            name="DestAmount" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 15%">Ԥ����𵥼�</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestPrice" disabled name="DestPrice"
                            runat="server"></td>
                    <td class="TdTitle" style="width: 15%">Ԥ��Լ������</td>
                    <td class="TdContent" style="width: 35%">
                        <input
                            id="DestPromise" disabled
                            name="DestPromise" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 15%">Ԥ����ע</td>
                    <td class="TdContent" style="width: 35%" colspan="3">
                        <textarea id="DestMemo" cols="60" rows="5" name="DestMemo" runat="server"></textarea></td>
                </tr>
            </asp:Panel>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">������Ϣ</span> </td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">���ݱ��</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="RoomSigns"
                        name="RoomSigns" style="width: 90%" searcher="SelRooms" class="easyui-searchbox" data-options="editable:false" runat="server" />
                    <input type="hidden" id="SelAll" name="SelAll" runat="server" />
                    <input type="hidden" id="RoomList" name="RoomList" value="" runat="server" />
                    <input type="hidden" id="RoomIDs" name="RoomIDs" value="" runat="server" />
                    <input type="hidden" id="hiRoomSigns" name="hiRoomSigns" value="" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <div style="width: 100%; height: 200px" id="TableContainer"></div>
                </td>
            </tr>
            <tr>
                <td valign="top" colspan="4">
                    <%--<asp:DataGrid ID="DGridStan" runat="server" Height="100%" CssClass="DataGrid"
                        Width="100%" AutoGenerateColumns="False">
                        <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="IID"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="CustID"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="RoomID"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="CostID"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
                            <asp:BoundColumn DataField="StateName" HeaderText="����״̬"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ParkName" HeaderText="��λ���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="MeterName" HeaderText="�������"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="CostSNum" HeaderText="�������"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CostName" HeaderText="��������"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="StanSign" HeaderText="��׼���">
                                <HeaderStyle Width="80px"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="StanName" HeaderText="��׼����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="StanAmount" HeaderText="ͨ���շѱ�׼"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ChargeCycleName" HeaderText="�Ʒ�����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="StanEndHit" HeaderText="��׼״̬"></asp:BoundColumn>
                            <asp:BoundColumn DataField="IsInheritName" HeaderText="����ʱ�Զ�ת���⻧"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CalcBeginDate" HeaderText="�Ʒѿ�ʼ����"></asp:BoundColumn>
                        </Columns>
                        <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                    </asp:DataGrid>--%>

                </td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">�⻧��Ϣ</span> </td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">�⻧����</td>
                <td class="TdContentSearch" style="width: 35%">
                    <input id="NewCustName"
                        maxlength="50" name="NewCustName" class="easyui-searchbox" searcher="SelCust" data-options="editable:false,required:true" runat="server" />
                    <input id="hiNewCustName" size="1"
                        type="hidden" name="hiNewCustName" data-options="" runat="server"><input style="width: 8px; height: 22px" id="NewCustID" size="1"
                            type="hidden" name="NewCustID" runat="server"></td>
                <td class="TdTitle" style="width: 15%">���ݱ��</td>
                <td class="TdContent" style="width: 35%">
                    <input id="RoomSigns2"  name="RoomSigns2" class="easyui-validatebox" data-options="required:true" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��ʼʱ��</td>
                <td class="TdContent" style="width: 35%">
                    <input id="StartDate" class="easyui-validatebox" data-options="required:true"
                        onkeypress="CheckSmallDate();" onclick="WdatePicker()"  name="StartDate" runat="server"></td>
                <td class="TdTitle" style="width: 15%">����ʱ��</td>
                <td class="TdContent" style="width: 35%">
                    <input id="EndDate" class="easyui-validatebox" data-options="required:true"
                        onkeypress="CheckSmallDate();" onclick="WdatePicker()" name="EndDate" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��Լʱ����</td>
                <td class="TdContent" style="width: 35%">
                    <input id="ReletDate"
                        onkeypress="CheckSmallDate();" onclick="WdatePicker()" class="Wdate" name="ReletDate" runat="server"></td>
                <td class="TdTitle" style="width: 15%">����֤��</td>
                <td class="TdContent" style="width: 35%">
                    <input id="PassSign" name="PassSign"  runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">֤������</td>
                <td class="TdContent" style="width: 35%">
                    <asp:DropDownList ID="PaperName" runat="server" class="easyui-validatebox" data-options="required:true"></asp:DropDownList></td>
                <td class="TdTitle" style="width: 15%">֤������</td>
                <td class="TdContent" style="width: 35%">
                    <input id="PaperCode" name="PaperCode" class="easyui-validatebox" data-options="required:true" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">�ͻ����</td>
                <td class="TdContent" style="width: 35%">
                    <select id="CustTypeID" class="easyui-validatebox" data-options="required:true" name="CustTypeID" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle" style="width: 15%">�̶��绰</td>
                <td class="TdContent" style="width: 35%">
                    <input id="FixedTel" name="FixedTel"  runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">�ƶ��绰</td>
                <td class="TdContent" style="width: 35%">
                    <input id="MobilePhone" name="MobilePhone" runat="server"></td>
                <td class="TdTitle" style="width: 15%">����绰</td>
                <td class="TdContent" style="width: 35%">
                    <input id="FaxTel" name="FaxTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��ϵ��ַ</td>
                <td class="TdContent" style="width: 35%">
                    <input id="Address" name="Address" runat="server"></td>
                <td class="TdTitle" style="width: 15%">��������</td>
                <td class="TdContent" style="width: 35%">
                    <input id="PostCode" name="PostCode" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">�� �� ��</td>
                <td class="TdContent" style="width: 35%">
                    <input id="Recipient" name="Recipient" runat="server"></td>
                <td class="TdTitle" style="width: 15%">�����ʼ�</td>
                <td class="TdContent" style="width: 35%">
                    <input id="EMail" name="EMail" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��ϵ��</td>
                <td class="TdContent" style="width: 35%">
                    <input id="Linkman" data-options="required:true" class="easyui-validatebox" 
                        name="Linkman" runat="server"></td>
                <td class="TdTitle" style="width: 15%">��ϵ�˵绰</td>
                <td class="TdContent" style="width: 35%">
                    <input id="LinkmanTel" data-options="required:true" class="easyui-validatebox"
                        name="LinkmanTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%"></td>
                <td class="TdContent" style="width: 35%">
                    <input id="IsUnit1" onclick="javascript: showIsUnit('Table2', 'Table3');" value="0" checked type="radio" name="IsUnit" runat="server">���˿ͻ�<input id="IsUnit2" onclick="javascript: showIsUnit('Table2', 'Table3');" value="1" type="radio"
                        name="IsUnit" runat="server">��λ�ͻ�</td>
            </tr>
            <tr style="display: none;">
                <td class="TdTitle" style="width: 15%">��¼�˺�<input style="width: 31px;" id="OldAccount" size="1" type="hidden" name="OldAccount"
                    runat="server"></td>
                <td class="TdContent" style="width: 35%">
                    <input onblur="javascript:CheckAccount();" id="InquireAccount"
                        name="InquireAccount" runat="server">
                    <div id="results" class="font_red"></div>
                </td>
            </tr>
        </table>

        <table id="Table2" class="DialogTable" style="width: 100%">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">����ҵ����Ϣ</span> </td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��</td>
                <td class="TdContent" style="width: 35%">
                    <input id="Surname" name="Surname" style="width: 35%" 
                        runat="server">��<input id="Name" name="Name"  style="width: 35%"
                            runat="server"></td>
                <td class="TdTitle" style="width: 15%">�Ա�</td>
                <td class="TdContent" style="width: 35%">
                    <select id="Sex" name="Sex"  runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">����</td>
                <td class="TdContent" style="width: 35%">
                    <asp:DropDownList ID="Nationality" runat="server"></asp:DropDownList></td>
                <td class="TdTitle" style="width: 15%">��������</td>
                <td class="TdContent" style="width: 35%">
                    <select id="nYear" name="nYear" runat="server">
                        <option selected></option>
                    </select>��<select id="nMonth" name="nMonth" runat="server">
                        <option selected></option>
                    </select>��<select id="nDay" name="nDay" runat="server">
                        <option selected></option>
                    </select>��<input style="width: 20px;" id="Birthday"
                        type="hidden" name="Birthday" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">������λ</td>
                <td class="TdContent" style="width: 35%">
                    <input id="WorkUnit" name="WorkUnit" runat="server"></td>
                <td class="TdTitle" style="width: 15%">ְҵ</td>
                <td class="TdContent" style="width: 35%">
                    <asp:DropDownList ID="DrJob" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��Ȥ����</td>
                <td class="TdContent" style="width: 35%" colspan="3">
                    <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
            </tr>
        </table>

        <table id="Table3" class="DialogTable" style="width: 100%">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">��λҵ����Ϣ</span> </td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">����������</td>
                <td class="TdContent" style="width: 35%">
                    <input id="LegalRepr" name="LegalRepr" runat="server"></td>
                <td class="TdTitle" style="width: 15%">���������˵绰</td>
                <td class="TdContent" style="width: 35%">
                    <input id="LegalReprTel" name="LegalReprTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">������</td>
                <td class="TdContent" style="width: 35%">
                    <input id="Charge" name="Charge" runat="server"></td>
                <td class="TdTitle" style="width: 15%">�����˵绰</td>
                <td class="TdContent" style="width: 35%">
                    <input id="ChargeTel" name="ChargeTel" runat="server"></td>
            </tr>
        </table>
        <table class="DialogTable" id="Table7" style="width: 100%">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;">
                    <span style="font-size: 16px">��˰������Ϣ</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">����</td>
                <td class="TdContent" style="width: 35%">
                    <input id="VATCode" name="VATCode" runat="server" type="hidden" class="easyui-validatebox">
                    <input id="VATName" name="VATName" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle" style="width: 15%">��˰��ʶ���</td>
                <td class="TdContent" style="width: 35%">
                    <input id="VATNumber" name="VATNumber" runat="server" class="easyui-validatebox"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��ַ���绰</td>
                <td class="TdContent" style="width: 35%">
                    <input id="VATAddLinkTel" name="VATAddLinkTel" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle" style="width: 15%">�����м��ʺ�</td>
                <td class="TdContent" style="width: 35%">
                    <input id="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server" class="easyui-validatebox"></td>
            </tr>
        </table>
        <table id="Table4" class="DialogTable" style="width: 100%">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">���д�����Ϣ</span> </td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��������</td>
                <td class="TdContent" style="width: 35%">
                    <input id="BankName" name="BankName" runat="server"></td>
                <td class="TdTitle" style="width: 15%">���л���</td>
                <td class="TdContent" style="width: 35%">
                    <input id="BankIDs" name="BankIDs" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">�����˺�</td>
                <td class="TdContent" style="width: 35%">
                    <input id="BankAccount" name="BankAccount" runat="server"></td>
                <td class="TdTitle" style="width: 15%">ȷ�������˺�</td>
                <td class="TdContent" style="width: 35%">
                    <input id="BankAccountTwo" name="BankAccountTwo"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">����Э����</td>
                <td class="TdContent" style="width: 35%">
                    <input id="BankAgreement" name="BankAgreement"
                        runat="server"></td>
                <td class="TdTitle" style="width: 15%"></td>
                <td class="TdContent" style="width: 35%"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 15%">��ע</td>
                <td class="TdContent" style="width: 35%" colspan="3">
                    <textarea id="Memo" rows="3" cols="50" name="Memo" runat="server"></textarea></td>
            </tr>
            <tr>
                <td class="formTable_Item" align="right">�ļ��ϴ�</td>
                <td class="TdContent" style="width: 35%" colspan="3">�ļ�˵����<input style="width: 300px" id="AdjunctName" maxlength="200"
                    name="AdjunctName" runat="server"><input id="btnFile" tabindex="1" size="1" type="file"
                        name="btnFile" runat="server" onchange="btnFile_Onclick();" onpropertychange="javascript:btnFile_Onclick();">&nbsp;<input id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                            value="�ϴ�" type="button" name="btnFileUp" runat="server"></td>
            </tr>
            <tr>
                <td class="TdContent" style="width: 35%" colspan="4">
                    <asp:DataGrid Style="font-size: 12px" ID="DGrid" runat="server" CssClass="DataGrid" Width="100%"
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
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='����'  >" CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="[ɾ��]">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('��ȷ���Ƿ�ɾ���ü�¼')==false) return false;&quot; alt='ɾ��' >" CommandName="Delete" CausesValidation="false" TabIndex="1" ID="btnDelete"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" colspan="4" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="btnOK" class="button" onclick="javascript: if (CheckData() == false) return false;"
                                        value="����" type="button" name="btnOK" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="btnReturn" class="button" value="�ر�" type="button" name="btnReturn" runat="server"></td>
            </tr>
        </table>
        <script type="text/javascript">
            function Init() {
                $('#btnSelNewCust').hide();
                $('#TableContainer').css("height", '200px');
                if ($('#RoomIDs').val() == '') {
                    $('#RoomIDs').val('-1');
                }
            }
            Init();

            function SelRooms() {
                var varReturn;

                var w = $(window).width();;
                var h = $(window).height();;

                HDialog.Open(w, h, "../dialogNew/MultiRoomLeaseDlg.aspx", '����ѡ��', false, function callback(_Data) {


                    if (_Data != "") {//**��÷��� ˢ��

                        // SelAll + "��" + SelRoomSigns + "��" + SelRoomIDs;


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
                                $('#RoomSigns').searchbox('setValue', RoomSigns.substr(1, RoomSigns.length - 1));
                                $('#hiRoomSigns').val(RoomSigns.substr(1, RoomSigns.length - 1));
                                $('#RoomIDs').val(RoomIDs.substr(1, RoomIDs.length - 1));
                                $('#RoomSigns2').val(RoomSigns.substr(1, RoomSigns.length - 1));
                                LoadLeaseRoomCostStanList();
                            }
                        }

                        return true;
                    }
                });

                return false;
            }

            LoadLeaseRoomCostStanList();
            function SelCust() {

                if ($('#RoomIDs').val() == "") {
                    HDialog.Info('��ѡ��Ҫ�������޵ķ���');
                    return;
                }


                var w = $(window).width();;
                var h = $(window).height();;

                var conent = "../DialogNew/CustSingleDlg.aspx";

                HDialog.Open(w, h, conent, '�ͻ�ѡ��', false, function callback(_Data) {
                    $('#NewCustName').searchbox("setValue", '');
                    $('#NewCustID').val('');
                    $('#hiNewCustName').val('');


                    var data = JSON.parse(_Data);

                    $('#NewCustName').searchbox("setValue", data.CustName);
                    $('#NewCustID').val(data.CustID);
                    $('#hiNewCustName').val(data.CustName);

                    $('#btnSelNewCust').click();

                });


            }
            var column = [[

                { field: 'ParkName', title: '��λ���', width: 180, align: 'left', sortable: true },
                { field: 'MeterName', title: '�������', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '��������', width: 100, align: 'left', sortable: true },
                { field: 'StanName', title: '��׼����', width: 180, align: 'left', sortable: true },
                { field: 'StanAmount', title: 'ͨ���շѱ�׼', width: 100, align: 'left', sortable: true },
                { field: 'ChargeCycleName', title: '�Ʒ�����', width: 100, align: 'left', sortable: true },
                { field: 'StanEndHit', title: '��׼״̬', width: 100, align: 'left', sortable: true },
                { field: 'IsInheritName', title: '����ʱ�Զ�ת�Ƹ��⻧', width: 100, align: 'left', sortable: true },
                {
                    field: 'CalcBeginDate', title: '�Ʒѿ�ʼ����', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.CalcBeginDate.ToCustomizeDate();
                        return str;
                    }
                }

            ]];
            var frozenColumns = [[
                { field: 'CustName', title: '�ͻ�����', width: 180, align: 'left', sortable: true },
                { field: 'RoomSign', title: '���ݱ��', width: 250, align: 'left', sortable: true },
                { field: 'StateName', title: '����״̬', width: 100, align: 'left', sortable: true },
            ]];
            function LoadLeaseRoomCostStanList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '���ݼ�����,���Ժ�...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    title: '�����շѱ�׼',
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RoomRental", "LeaseRoomCostStanList", "TableContainer", param);
                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    }
                });
                $('#SearchDlg').dialog('close');
            }

            $('#btnReturn').click(function () {
                HDialog.Close();
            });
        </script>
    </form>
</body>
</html>
