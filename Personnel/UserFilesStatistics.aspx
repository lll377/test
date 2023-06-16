<%@ Page language="c#" Codebehind="UserFilesStatistics.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Personnel.UserFilesStatistics" %>
<%@ Register TagPrefix="uc1" TagName="OperatMenu" Src="../UserControl/OperatMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OperatTitle" Src="../UserControl/OperatTitle.ascx" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>UserFilesStatistics</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../jscript/JSClient.js"></script>
		<script language="javascript">
		<!--
			function btnClear_OnClick()
			{
				UserFilesStatistics.DepCode.value="";
				UserFilesStatistics.DepName.value="";
				UserFilesStatistics.hiDepName.value="";
				UserFilesStatistics.OrganCode.value="";
				
				UserFilesStatistics.DepNameDepart.value="";
				UserFilesStatistics.WorkerSign.value="";
				UserFilesStatistics.UserName.value="";
				
				UserFilesStatistics.DepCodeDepart.value="";
				UserFilesStatistics.hiDepNameDepart.value="";
			}
			//选择小区
			function btnSelDep_OnClick()
			{
												
				varReturn=showModalDlg("../dialog/CommCorpDlg.aspx"+"?Ram="+Math.random(),"",600,450);
				
				//alert(varReturn);
				if(varReturn!="")
				{//**获得返回的参数信息
					
					var varObjects=varReturn.split("\t");
					
					UserFilesStatistics.DepCode.value=varObjects[0];
					UserFilesStatistics.DepName.value=varObjects[1];
					UserFilesStatistics.hiDepName.value=varObjects[1];
					if(varObjects[0]==0)
					{
						//alert(varReturn);
						UserFilesStatistics.OrganCode.value=varObjects[2];
					}
				}
			}
			function Win_OnLoad()
			{
				if(UserFilesStatistics.PrintParms.value!="")
				{
					showOperatWin(UserFilesStatistics.PrintParms.value);
					
					UserFilesStatistics.PrintParms.value="";
				}
			}
			
			function btnSelDepDepart_OnClick()
			{
				varReturn=showModalDlg("../dialog/DepartmentDlg.aspx","",370,300);
				
				if(varReturn!="")
				{//**获得返回的参数信息
					
					var varObjects=varReturn.split("\t");
					document.all.DepCodeDepart.value=varObjects[0];
					document.all.DepNameDepart.value=varObjects[1];
					document.all.hiDepNameDepart.value=varObjects[1];
				}
			}
		//-->
		</script>
	</HEAD>
	<body onload="Win_OnLoad();">
		<form id="UserFilesStatistics" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="0" width="500%">
				<tr>
					<td vAlign="top" height="32"><uc1:operattitle id="mOperatTitle" runat="server"></uc1:operattitle><INPUT id="PrintParms" type="hidden" name="PrintParms" runat="server"><INPUT id="PageIndex" style="WIDTH: 56px; HEIGHT: 22px" type="hidden" size="4" name="PageIndex"
							runat="server"><INPUT id="DepCodeDepart" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" name="DepCode"
							runat="server"><INPUT id="hiDepNameDepart" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" name="hiDepName"
							runat="server"></td>
				</tr>
				<TR>
					<TD align="left" vAlign="top" height="25"><uc1:operatmenu id="mOperatMenu" runat="server"></uc1:operatmenu></TD>
				</TR>
				<tr>
					<td vAlign="top" bgColor="#ffffff">
						<table cellSpacing="2" cellPadding="2" width="100%">
							<tr>
								<td style="HEIGHT: 32px" height="32">
									<table class="SchTable" style="FONT-SIZE: 12px" cellSpacing="0" cellPadding="0" width="100%">
										<tr>
											<td align="left" width="63" style="WIDTH: 63px">机构名称：</td>
											<td><INPUT class="Control_ItemInput" id="DepName" style="WIDTH: 88px; HEIGHT: 22px" maxLength="50"
													size="9" name="DepName" runat="server" readOnly><FONT face="宋体"></FONT><INPUT class="Button_sel" id="btnSelDep" onclick="btnSelDep_OnClick();" type="button" name="btnSelDep"
													runat="server">
												<asp:CheckBox id="IsInclude" runat="server" Text="不包含下级机构"></asp:CheckBox>&nbsp;</td>
											<td align="right"><FONT face="宋体"></FONT></FONT></td>
										</tr>
										<tr>
											<td align="left" width="63" style="WIDTH: 63px"><FONT face="宋体">所在部门：</FONT></td>
											<td><INPUT style="WIDTH: 88px; HEIGHT: 22px" id="DepNameDepart" class="Control_ItemInput" name="RoleName"
													maxLength="50" size="9" runat="server"><FONT face="宋体"><INPUT id="Button2" class="Button_sel" onclick="btnSelDepDepart_OnClick();" name="btnSelDep"
														type="button" runat="server">&nbsp;工号：<INPUT style="WIDTH: 64px; HEIGHT: 22px" id="WorkerSign" class="Control_ItemInput" name="WorkerSign"
														size="5" runat="server">&nbsp;姓名：<INPUT style="WIDTH: 64px; HEIGHT: 22px" id="UserName" class="Control_ItemInput" name="UserName"
														size="5" runat="server"> </FONT>
												<asp:CheckBox id="Chk1" runat="server" Text="储备"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk2" runat="server" Text="已录用未入职"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk3" runat="server" Text="已入职未转正"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk4" runat="server" Text="已转正"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk5" runat="server" Text="已离职"></asp:CheckBox><FONT face="宋体">&nbsp;</FONT><INPUT class="button" id="btnFilter" style="Z-INDEX: 0; HEIGHT: 22px" type="button" value="查询"
													name="btnFilter" runat="server"><INPUT class="button" id="BtExport" style="Z-INDEX: 0; HEIGHT: 22px" type="button" value="导出"
													name="btnFilter" runat="server"><INPUT class="button" id="btnClear" style="Z-INDEX: 0; HEIGHT: 22px" onclick="javascript:btnClear_OnClick();"
													type="button" value="清空" name="btnClear"><INPUT id="DepCode" style="Z-INDEX: 0; WIDTH: 16px; HEIGHT: 21px" type="hidden" size="1"
													name="DepCode" runat="server"><INPUT id="hiDepName" style="Z-INDEX: 0; WIDTH: 16px; HEIGHT: 21px" type="hidden" name="hiDepName"
													runat="server"><INPUT id="OrganCode" style="Z-INDEX: 0; WIDTH: 16px; HEIGHT: 21px" type="hidden" runat="server"></td>
											<td align="right"><FONT face="宋体"></FONT></FONT></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="BACKGROUND-IMAGE: url(../images/main_sp_h.jpg); BACKGROUND-REPEAT: repeat-x"
									height="3"></td>
							</tr>
							<tr>
								<td vAlign="top" width="500%"><asp:datagrid id="DGrid" runat="server" Width="100%" CssClass="DataGrid" Height="100%">
										<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
										<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
										<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
										<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
										<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0" width="900" border="0" height="38">
										<tr>
											<td width="20" class="formTable_Footer_left" height="38">&nbsp;</td>
											<td height="38" CLASS="formTable_Footer_center" ALIGN="center">
												<webdiyer:aspnetpager id="ANPCut" runat="server" HorizontalAlign="Left" SubmitButtonClass="inputbott"
													InputBoxClass="inputline" PageSize="15" CustomInfoSectionWidth="30%" FirstPageText=""
													LastPageText="" NextPageText="下一页"
													PrevPageText="上一页" NumericButtonCount="5" ShowBoxThreshold="1"
													ShowInputBox="Always" TextBeforeInputBox="转到" TextAfterInputBox="页" ShowCustomInfoSection="Left" AlwaysShow="True"
													SubmitButtonText="确定" Font-Bold="True" InputBoxStyle="width:30px;"></webdiyer:aspnetpager></td>
											<td width="20" class="formTable_Footer_right" height="38">&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
