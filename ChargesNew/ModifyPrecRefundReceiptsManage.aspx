<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Page language="c#" Codebehind="ModifyPrecRefundReceiptsManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.ModifyPrecRefundReceiptsManage" %>
<!DOCTYPE HTML>
<HTML>
	<HEAD>
		<title>ModifyPrecRefundReceiptsManage</title>
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
				return true;
			}
		
		//-->
		</script>
	</HEAD>
	<body>
		<form id="ModifyPrecRefundReceiptsManage" method="post" runat="server">
            <INPUT id="hiOPType" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="hiOPType"
							runat="server"> <INPUT id="ReceID" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="ReceID"
							runat="server"> <INPUT id="hiUseRepID" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="hiUseRepID"
							runat="server"> <INPUT id="hiBillsDate" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="hiBillsDate"
							runat="server"><INPUT id="IsDelete" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IsDelete"
							runat="server"><INPUT id="IsAudit" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IsAudit"
							runat="server"><INPUT id="IsRefer" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IsRefer"
							runat="server"><INPUT id="hiChargeMode" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="hiChargeMode"
							runat="server"><INPUT style="Z-INDEX: 0; WIDTH: 32px; HEIGHT: 22px" id="ModifyType" size="1" type="hidden"
							name="ModifyType" runat="server">
				<TABLE class="DialogTable" style="width: 100%">
							<TR>
								<TD vAlign="top">
									<TABLE class="DialogTable" style="width: 100%">
										
										<TR>
											<TD class="TdTitle">�ͻ�����</TD>
											<TD class="TdContent"><asp:label id="CustName" runat="server"></asp:label></TD>
											<TD class="TdTitle">���ݱ��</TD>
											<TD class="TdContent"><asp:label id="RoomSign" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD class="TdTitle">�վݺ���</TD>
											<TD class="TdContent"><asp:label id="BillsSign" runat="server"></asp:label></TD>
											<TD class="TdTitle">�շ�����</TD>
											<TD class="TdContent"><SELECT id="nYear1" name="nYear1" runat="server">
															<OPTION selected></OPTION>
														</SELECT>��<SELECT id="nMonth1" name="nMonth1" runat="server">
															<OPTION selected></OPTION>
														</SELECT>��<SELECT id="nDay1" name="nDay1" runat="server">
															<OPTION selected></OPTION>
														</SELECT>��<SELECT id="nHour1" name="nHour1" runat="server">
															<OPTION selected></OPTION>
														</SELECT>ʱ<SELECT id="nMinute1" name="nMinute1" runat="server">
															<OPTION selected></OPTION>
														</SELECT>��</TD>
										</TR>
										<TR>
											<TD class="TdTitle">�շѺϼ�</TD>
											<TD class="TdContent"><asp:label id="PrecAmount" runat="server"></asp:label></TD>
											<TD class="TdTitle"><FONT style="BACKGROUND-COLOR: #eeeeee">�տʽ</TD>
											<TD class="TdContent"><SELECT id="ChargeMode" onchange="CheckChargeMode();" name="ChargeMode" runat="server">
														<OPTION selected></OPTION>
													</SELECT></TD>
										</TR>
										<TR>
											<TD class="TdTitle">�տ���</TD>
											<TD class="TdContent"><asp:label id="UserName" runat="server"></asp:label></TD>
											<TD class="TdTitle"></TD>
											<TD class="TdContent"></TD>
										</TR>
										<TR>
											<TD class="TdTitle">���ñ�ע</TD>
											<TD class="TdContent"><asp:label id="ReceMemo" runat="server"></asp:label></TD>
											<TD class="TdTitle">��ӡ����</TD>
											<TD class="TdContent">
												<asp:label id="PrintTimes" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD colSpan="4"></TD>
										</TR>
										<TR>
											<TD class="formTable_Footer" align="center" colSpan="4"><INPUT class="button" id="btnSave"  onclick="javascript:if(CheckData()==false) return false;"
													type="button" value="����" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp; <INPUT class="button" id="btnReturn"  type="button" value="�ر�" name="btnFilter"
													runat="server"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD class="formTable_Header" style="HEIGHT: 22px" align="center" colSpan="4">����ȡ�ķ���</TD>
							</TR>
							<tr>
								<td vAlign="top" width="100%"><asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
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
									</asp:datagrid></td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" width="100%" border="0" height="38">
										<tr>
											<td width="20" class="formTable_Footer_left" height="38">&nbsp;</td>
											<td height="38" CLASS="formTable_Footer_center" ALIGN="center">
												<webdiyer:aspnetpager id="ANPCut" runat="server" HorizontalAlign="Right" SubmitButtonClass="inputbott"
													InputBoxClass="inputline" PageSize="15" CustomInfoSectionWidth="30%" FirstPageText=""
													LastPageText="" NextPageText="��һҳ"
													PrevPageText="��һҳ" NumericButtonCount="5" ShowBoxThreshold="1"
													ShowInputBox="Always" TextBeforeInputBox="ת��" TextAfterInputBox="ҳ" ShowCustomInfoSection="Left" AlwaysShow="True"
													SubmitButtonText="ȷ��" CustomInfoTextAlign="Right" Font-Bold="True" InputBoxStyle="width:30px;"></webdiyer:aspnetpager></td>
											<td width="20" class="formTable_Footer_right" height="38">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
						</TABLE>
		</form>
	</body>
</HTML>
