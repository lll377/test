<%@ Page language="c#" Codebehind="AuditingRBCreBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Budget.AuditingRBCreBrowse" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Register TagPrefix="uc1" TagName="OperatTitle" Src="../UserControl/OperatTitle.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AuditingBCreBrowse</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../jscript/DateControl.js"></script>
		<script language="javascript" src="../jscript/JSClient.js"></script>
		<script language="javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
		<script language="javascript">
		<!--
			function btnClear_OnClick()
			{
				AuditingBCreBrowse.StartBCreDate.value="";
				AuditingBCreBrowse.EndBCreDate.value="";
			}
			function btnClearHis_OnClick()
			{
				if(confirm('��ȷ���Ƿ������ʷ��')==false)
				{
					return false;
				}
				else
				{
					return true;
				}
			}
		
			//��ѯ�Ի���
			function btnFilterMore_OnClick()
			{
				var TableSign = getObject("TableSign").value;			
				if (TableSign != ""&&TableSign!=null)
				{					
					var strTemplateCode = TableSign;
					var strSearchData = escape(getObject("hiSearchData").value);
					varReturn=showModalDlg("../dialog/SearchDlg.aspx?TemplateCode="+strTemplateCode+"&SearchData="+strSearchData,"",420,400);
					
					//alert(varReturn);
					
					if (varReturn!="")
					{
						var Search = eval('('+varReturn+')');								
						getObject("hiSearchSql").value = Search.SqlData.Sql;
						
						//**�ع�����(���ݽṹΪJSON)					
						var SearchData = Search.SqlData.Data;
						//alert(Search.SqlData.Sql);
						var val = "";
						for(var i=0; i<SearchData.length; i++)
						{
								if (val !="")
								{						
									val = val +",{name:\""+ SearchData[i].name +"\",val:\""+SearchData[i].val+"\"} ";
								}
								else
								{
									val = "{name:\""+ SearchData[i].name +"\",val:\""+SearchData[i].val+"\"} ";
								}												
						}
						getObject("hiSearchData").value = "{Data:["+val+"]}";
					}
					
					//alert(getObject("hiSearchData").value);
				}
			}
		//-->
		</script>
		<script language="javascript">
		<!--
			function Win_OnLoad()
			{				
				var strPrintParms = getObject("PrintParms").value;
				if(strPrintParms!="")
				{					
					showOperatWin(strPrintParms);
					
					getObject("PrintParms").value="";					
				}
			}
		//-->
		</script>
		<script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
	</HEAD>
	<body onload="Win_OnLoad()">
	
		<form id="AuditingBCreBrowse" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td vAlign="top" height="30"><uc1:operattitle id="mOperatTitle" runat="server"></uc1:operattitle><INPUT id="PageIndex" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="PageIndex"
							runat="server"></td>
				</tr>
				<tr>
					<td vAlign="top" bgColor="#ffffff">
						<table cellSpacing="2" cellPadding="2" width="100%">
							<TBODY>
								<tr>
									<td style="HEIGHT: 32px" height="32">
										<table style="FONT-SIZE: 12px" cellSpacing="0" cellPadding="0" width="100%" class="SchTable">
											<tr>
												<td align="left">Ԥ��ʱ�䣺 ��<INPUT class="Control_ItemInput" onkeypress="CheckSmallDate();" id="StartBCreDate" style="WIDTH: 100px; HEIGHT: 19px"
														onclick="WdatePicker()" type="text" maxLength="50" size="26" name="StartBCreDate"
														runat="server">&nbsp;��&nbsp;<INPUT class="Control_ItemInput" onkeypress="CheckSmallDate();" id="EndBCreDate" style="WIDTH: 100px; HEIGHT: 19px"
														onclick="WdatePicker()" type="text" maxLength="50" size="26" name="EndBCreDate" runat="server">&nbsp;<INPUT class="button" id="btnFilter" type="button" value="��ѯ" name="btnFilter" runat="server"><FONT face="����"><INPUT class="button" id="btnClear" onclick="javascript:btnClear_OnClick();" type="button"
															value="���" name="btnClear"></FONT> </FONT>
												</td>
												<td align="right">
													<!--*********************��ѯ����********************--><INPUT id="TableSign" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="TableSign"
														runat="server"> <INPUT id="hiSearchData" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="hiSearchData"
														runat="server"><INPUT id="hiSearchSql" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="hiSearchSql"
														runat="server"><INPUT class="button_Four" id="btnClearHis" onclick="javascript:if(btnClearHis_OnClick()==false) return false;"
														type="button" style="HEIGHT:22px" value="�����ʷ" name="btnClearHis" runat="server"><INPUT id="PrintParms" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="PrintParms"
														runat="server"> 
													<!--*********************��ѯ����********************-->
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td style="BACKGROUND-IMAGE: url(../images/main_sp_h.jpg); BACKGROUND-REPEAT: repeat-x"
										height="3"></td>
								</tr>
								<TR>
									<TD class="formTable_Header" align="center" colSpan="4">����Ԥ���¼</TD>
								</TR>
								<tr>
									<td vAlign="top" width="100%"><asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
											<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
											<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
											<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
											<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="AuditID" ReadOnly="True"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="IsAuditing" ReadOnly="True"></asp:BoundColumn>
												<asp:BoundColumn DataField="AuditTypeName" ReadOnly="True" HeaderText="Ԥ�����"></asp:BoundColumn>
												<asp:BoundColumn DataField="BCreUserName" ReadOnly="True" HeaderText="Ԥ����"></asp:BoundColumn>
												<asp:BoundColumn DataField="BCreDate" ReadOnly="True" HeaderText="Ԥ��ʱ��"></asp:BoundColumn>
												<asp:BoundColumn DataField="BCreRange" ReadOnly="True" HeaderText="Ԥ�㷶Χ"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="CreYear" HeaderText="Ԥ�����"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="CreMonth" ReadOnly="True" HeaderText="Ԥ���·�"></asp:BoundColumn>
												<asp:BoundColumn DataField="CostName" HeaderText="��������"></asp:BoundColumn>
												<asp:BoundColumn DataField="AuditUserName" HeaderText="�����"></asp:BoundColumn>
												<asp:BoundColumn DataField="AuditDate" HeaderText="���ʱ��" DataFormatString="{0:d}"></asp:BoundColumn>
												<asp:BoundColumn DataField="IsAuditingName" HeaderText="״̬"></asp:BoundColumn>
												<asp:ButtonColumn Text="&lt;img src=../images/icons/Edit.gif border=0 align=absmiddle alt='�༭'&gt;"
													HeaderText="[���]" CommandName="Edit">
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
							</TBODY>
						</table>
					</td>
				</tr>
			</table>
		</form>
		</TD></TR></TBODY></TABLE>
	</body>
</HTML>
