<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>

<%@ Page Language="c#" CodeBehind="ModifyPreCostsManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.ModifyPreCostsManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>ModifyPreCostsManage</title>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script language="javascript">
<!--
	function CheckData() 
    {
		if (ModifyPreCostsManage.ChargeMode.value == "") {
			if (ModifyPreCostsManage.hiChargeModes.value == "") {
			    HDialog.Info("��ѡ���տʽ,�����Ϊ��!");
			    ModifyPreCostsManage.ChargeMode.focus();
			    return false;
			}
		}
			    	
		return true;
    }


    function CheckChargeMode() {
        //var varChargeMode = ModifyPreCostsManage.ChargeMode[ModifyPreCostsManage.ChargeMode.selectedIndex].innerText;

        var varChargeMode = $('#ChargeMode').find("option:selected").text();
        if (varChargeMode == "�����տʽ") {
            var strRenderType = getObject("RenderType").value;

            if (strRenderType == "1") {
                btnSelChargeMode_OnClick();
            }
            else {
                ModifyPreCostsManage.ChargeModes.value = "";
                ModifyPreCostsManage.hiChargeModes.value = "";
                ModifyPreCostsManage.ChargeModeAmount.value = "";

                ModifyPreCostsManage.ChargeMode.value = "";
                HDialog.Info("��ѡ�������տʽ!");
            }
        }
        else {
            if (varChargeMode != "") {
                ModifyPreCostsManage.ChargeModes.value = "";
                ModifyPreCostsManage.hiChargeModes.value = "";
                ModifyPreCostsManage.ChargeModeAmount.value = "";
            }
        }

    }


    function btnSelChargeMode_OnClick() {
        getObject("ChargeMode").value = "�����տʽ";

        var iTotalAmount = 0;
        var varTotalSumAmount = getObject("TotalSumAmount").value
        if (varTotalSumAmount != "") {
            iTotalAmount = parseFloat(varTotalSumAmount);
        }

        HDialog.Open(600, 480, '../dialogNew/ChargeModeDlg.aspx?TotalAmount=' + iTotalAmount + '&Rdm=' + Math.random(), 'ѡ������տʽ', false, function callback(_Data) {
            if (_Data != "") {
                var varReturn = _Data;
                var varObjects = varReturn.split("\t");
                $('#ChargeModes').val(varObjects[0]);
                $('#hiChargeModes').val(varObjects[1]);
                $('#ChargeModeAmount').val(varObjects[2]);
            }
            else { getObject("ChargeMode").value = ""; }
        });

        //var varReturn;

        //varReturn = showModalDlg("../dialog/ChargeModeDlg.aspx?TotalAmount=" + iTotalAmount + "&Rdm=" + Math.random(), "", 650, 430);

        ////alert("["+varReturn+"]");
        //if (varReturn != "") {//**��÷��� ˢ��
        //    var varObjects = varReturn.split("\t");

        //    ModifyPreCostsManage.ChargeModes.value = varObjects[0];
        //    ModifyPreCostsManage.hiChargeModes.value = varObjects[1];
        //    ModifyPreCostsManage.ChargeModeAmount.value = varObjects[2];

        //    return true;
        //}
        //else {
        //    getObject("ChargeMode").value = "";
        //}

        return false;
    }
		
		//-->
    </script>
</head>
<body>
    <form id="ModifyPreCostsManage" method="post" runat="server">
        <input id="hiOPType" style="width: 32px; height: 22px" type="hidden" size="1" name="hiOPType"
            runat="server">
        <input id="ReceID" style="width: 24px; height: 22px" type="hidden" size="1" name="ReceID"
            runat="server">
        <input id="hiUseRepID" style="width: 24px; height: 21px" type="hidden" size="1" name="hiUseRepID"
            runat="server">
        <input id="hiBillsDate" style="width: 24px; height: 21px" type="hidden" size="1" name="hiBillsDate"
            runat="server"><input id="IsDelete" style="width: 32px; height: 22px" type="hidden" size="1" name="IsDelete"
                runat="server"><input id="IsAudit" style="width: 32px; height: 22px" type="hidden" size="1" name="IsAudit"
                    runat="server"><input id="IsRefer" style="width: 32px; height: 22px" type="hidden" size="1" name="IsRefer"
                        runat="server"><input id="hiChargeMode" style="width: 24px; height: 21px" type="hidden" size="1" name="hiChargeMode"
                            runat="server"><input id="TotalSumAmount" style="width: 24px; height: 21px" type="hidden" size="1" name="TotalSumAmount"
                                runat="server"><input id="RenderType" style="width: 24px; height: 21px" type="hidden" size="1" name="RenderType"
                                    runat="server"><input id="hiChargeModes" style="width: 24px; height: 21px" type="hidden" size="1" name="hiChargeModes"
                                        runat="server"><input id="hiOldChargeModes" style="width: 24px; height: 21px" type="hidden" size="1" name="hiOldChargeModes"
                                            runat="server"><input id="ChargeModeAmount" style="width: 24px; height: 21px" type="hidden" size="1" name="ChargeModeAmount"
                                                runat="server"><input style="z-index: 0; width: 32px; height: 22px" id="ModifyType" size="1" type="hidden"
                                                    name="ModifyType" runat="server">

        <table class="DialogTable" style="width: 100%">
            <tr>
                <td valign="top">
                    <table class="DialogTable" style="width: 100%">

                        <tr>
                            <td class="TdTitle">�ͻ�����</td>
                            <td class="TdContent">
                                <asp:Label ID="CustName" runat="server"></asp:Label></td>
                            <td class="TdTitle">���ݱ��</td>
                            <td class="TdContent">
                                <asp:Label ID="RoomSign" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">�վݺ���</td>
                            <td class="TdContent">
                                <asp:Label ID="BillsSign" runat="server"></asp:Label></td>
                            <td class="TdTitle">�շ�����</td>
                            <td class="TdContent">
                                <select id="nYear1" name="nYear1" runat="server">
                                    <option selected></option>
                                </select>��<select id="nMonth1" name="nMonth1" runat="server">
                                    <option selected></option>
                                </select>��<select id="nDay1" name="nDay1" runat="server">
                                    <option selected></option>
                                </select>��<select id="nHour1" name="nHour1" runat="server">
                                    <option selected></option>
                                </select>ʱ<select id="nMinute1" name="nMinute1" runat="server">
                                    <option selected></option>
                                </select>��</td>
                        </tr>
                        <tr>
                            <td class="TdTitle">�շѺϼ�</td>
                            <td class="TdContent">
                                <asp:Label ID="PrecAmount" runat="server"></asp:Label></td>
                            <td class="TdTitle">�տ���</td>
                            <td class="TdContent">
                                <asp:Label ID="UserName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">���ñ�ע</td>
                            <td class="TdContent">
                                <asp:Label ID="ReceMemo" runat="server"></asp:Label></td>
                            <td class="TdTitle">��ӡ����</td>
                            <td class="TdContent">
                                <asp:Label ID="PrintTimes" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">�տʽ</td>
                            <td class="TdContent">
                                <select id="ChargeMode" onchange="CheckChargeMode();" name="ChargeMode" runat="server">
                                    <option selected></option>
                                </select></td>
                            <td class="TdTitle"></td>
                            <td class="TdContent"></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">�����տʽ</td>
                            <td class="TdContent" colspan="3">
                                <input class="Control_ItemInput" id="ChargeModes" style="width: 98%" readonly name="ChargeModes"
                                    runat="server"></td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td class="formTable_Footer" align="center" colspan="4">
                                <input class="button" id="btnSave" onclick="javascript:if(CheckData()==false) return false;"
                                    type="button" value="����" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                                <input class="button" id="btnReturn" type="button" value="�ر�" name="btnFilter"
                                    runat="server"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="formTable_Header" style="height: 22px" align="center" colspan="4">����ȡ�ķ���</td>
            </tr>
            <tr>
                <td valign="top" width="100%">
                    <asp:DataGrid ID="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
                        <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="RecdID" ReadOnly="True"></asp:BoundColumn>
                            <asp:BoundColumn Visible="False" DataField="ReceID" ReadOnly="True"></asp:BoundColumn>
                            <asp:BoundColumn DataField="BillsSign" ReadOnly="True" HeaderText="�վݺ���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="���ݱ��"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PrecDate" ReadOnly="True" HeaderText="�տ�ʱ��"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CostNames" ReadOnly="True" HeaderText="��������"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PrecAmount" ReadOnly="True" HeaderText="�տ���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="UserName" ReadOnly="True" HeaderText="�տ���"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ChargeMode" HeaderText="�տʽ"></asp:BoundColumn>
                            <asp:BoundColumn DataField="PrecMemo" ReadOnly="True" HeaderText="��ע"></asp:BoundColumn>
                            <asp:ButtonColumn Visible="False" Text="&lt;img src='../images/icons/Delete.gif' border='0' align='absmiddle' onclick=&quot;javascript:if(confirm('��ȷ���Ƿ����ü�¼')==false){return false;}&quot; alt='����'&gt;"
                                HeaderText="[����]" CommandName="Cancel">
                                <HeaderStyle Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:ButtonColumn>
                        </Columns>
                        <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0" height="38">
                        <tr>
                            <td width="20" class="formTable_Footer_left" height="38">&nbsp;</td>
                            <td height="38" class="formTable_Footer_center" align="center">
                                <webdiyer:AspNetPager ID="ANPCut" runat="server" HorizontalAlign="Right" SubmitButtonClass="inputbott"
                                    InputBoxClass="inputline" PageSize="15" CustomInfoSectionWidth="30%" FirstPageText=""
                                    LastPageText="" NextPageText="��һҳ"
                                    PrevPageText="��һҳ" NumericButtonCount="5" ShowBoxThreshold="1"
                                    ShowInputBox="Always" TextBeforeInputBox="ת��" TextAfterInputBox="ҳ" ShowCustomInfoSection="Left" AlwaysShow="True"
                                    SubmitButtonText="ȷ��" CustomInfoTextAlign="Right" Font-Bold="True" InputBoxStyle="width:30px;">
                                </webdiyer:AspNetPager>
                            </td>
                            <td width="20" class="formTable_Footer_right" height="38">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
