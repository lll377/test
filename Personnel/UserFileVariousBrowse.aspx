<%@ Page language="c#" Codebehind="UserFileVariousBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Personnel.UserFileVariousBrowse" %>
<%@ Register TagPrefix="uc1" TagName="OperatTitle" Src="../UserControl/OperatTitle.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OperatMenu" Src="../UserControl/OperatMenu.ascx" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>UserFilesRecruitBrowse</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK rel="stylesheet" type="text/css" href="../css/style.css">
		<script language="javascript" src="../jscript/JSClient.js"></script>
		<script language="javascript">
		<!--
			function btnClear_OnClick()
			{
				UserFilesRecruitBrowse.UserName.value="";
			}
			
			function btnSelDep_OnClick()
			{
				varReturn=showModalDlg("../dialog/DepartmentDlg.aspx","",370,300);
				
				if(varReturn!="")
				{//**获得返回的参数信息
					
					var varObjects=varReturn.split("\t");
					
					UserFilesRecruitBrowse.DepCode.value=varObjects[0];
					UserFilesRecruitBrowse.DepName.value=varObjects[1];
					UserFilesRecruitBrowse.hiDepName.value=varObjects[1];
				}
			}
			
			function btnSelComm_OnClick()
			{					
				varReturn=showModalDlg("../dialog/CommCorpDlg.aspx"+"?Ram="+Math.random(),"",600,450);
				
				//alert(varReturn);
				if(varReturn!="")
				{//**获得返回的参数信息
					
					var varObjects=varReturn.split("\t");
					
					UserFilesRecruitBrowse.CommID.value=varObjects[0];
					UserFilesRecruitBrowse.CommName.value=varObjects[1];
					UserFilesRecruitBrowse.hiCommName.value=varObjects[1];
					
					if(varObjects[0]==0)
					{
					
						UserFilesRecruitBrowse.OrganCode.value=varObjects[2];
					}
				}
			}
			//查询对话框
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
						
						//**重构数据(数据结构为JSON)					
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
			
			function Win_OnLoad()
			{
				if(UserFilesRecruitBrowse.PrintParms.value!="")
				{
					showOperatWin(UserFilesRecruitBrowse.PrintParms.value);
					
					UserFilesRecruitBrowse.PrintParms.value="";
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
		<form id="UserFilesRecruitBrowse" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="100%" height="100%">
				<TBODY>
					<tr>
						<td height="32" vAlign="top"><uc1:operattitle id="mOperatTitle" runat="server"></uc1:operattitle><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="TableSign" size="1" type="hidden" name="TableSign"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="hiSearchData" size="1" type="hidden" name="hiSearchData"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="hiSearchSql" size="1" type="hidden" name="hiSearchSql"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="CommID" size="1" type="hidden" name="CommID"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="PageIndex" size="1" type="hidden" name="PageIndex"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="PrintParms" size="1" type="hidden" name="PageIndex"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="hiCommName" size="1" type="hidden" name="hiCommName"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="OrganCode" size="1" type="hidden" name="OrganCode"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="DepCodeDepart" type="hidden" name="DepCode"
								runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="hiDepNameDepart" type="hidden" name="hiDepName"
								runat="server"></td>
					</tr>
					<tr>
						<td bgColor="#ffffff" vAlign="top">
							<table cellSpacing="2" cellPadding="2" width="100%">
								<tr>
									<td style="HEIGHT: 32px" height="32">
										<table cellSpacing="2" cellPadding="2" width="100%">
											<tr>
												<td style="HEIGHT: 32px" height="32">
													<TABLE class="formTable" cellSpacing="2" cellPadding="2" width="100%">
														<TR>
															<TD class="formTable_Header" colSpan="4" align="center"><span id="lbl_WorkflowName">人事档案</span></TD>
														</TR>
														<tr>
															<td>
																<table style="FONT-SIZE: 12px" cellSpacing="0" cellPadding="0" width="100%">
																	<tr>
																		<td style="HEIGHT: 31px" align="right">
																			<P>机构名称：</P>
																		</td>
																		<td style="HEIGHT: 31px"><FONT face="宋体"><INPUT style="WIDTH: 150px" id="CommName" class="Control_ItemInput" readOnly maxLength="50"
																					size="10" name="DepName" runat="server"><INPUT id="btnSelComm" class="Button_sel" onclick="btnSelComm_OnClick();" type="button"
																					name="btnSelComm" runat="server">
																				<asp:checkbox id="IsInclude" runat="server" Text="不包含下级机构"></asp:checkbox></FONT></td>
																		<td style="HEIGHT: 31px" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 名：</td>
																		<td style="HEIGHT: 31px"><INPUT style="WIDTH: 150px; HEIGHT: 22px" id="UserName" class="Control_ItemInput" size="17"
																				name="UserName" runat="server" DESIGNTIMEDRAGDROP="173"></td>
																	</tr>
																	<tr>
																		<td style="HEIGHT: 29px" align="right">部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 门：</td>
																		<td style="HEIGHT: 29px"><INPUT style="WIDTH: 150px" id="DepNameDepart" class="Control_ItemInput" maxLength="50"
																				size="9" name="RoleName" runat="server"><INPUT id="Button2" class="Button_sel" onclick="btnSelDepDepart_OnClick();" type="button"
																				name="btnSelDep" runat="server"></td>
																		<td style="HEIGHT: 29px" align="right">工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 号：</td>
																		<td style="HEIGHT: 29px"><INPUT style="WIDTH: 150px; HEIGHT: 22px" id="WorkerSign" class="Control_ItemInput" size="17"
																				name="WorkerSign" runat="server"></td>
																	</tr>
																	<tr>
																		<td style="HEIGHT: 30px" align="right">定编岗位：</td>
																		<td style="HEIGHT: 30px"><FONT face="宋体"><SELECT style="WIDTH: 174px" id="ClassRole" name="ClassRole" runat="server">
																					<OPTION selected></OPTION>
																				</SELECT></FONT></td>
																		<td style="HEIGHT: 30px" align="right"><FONT face="宋体">档案状态：</FONT></td>
																		<td style="HEIGHT: 30px">
																			<asp:CheckBox style="Z-INDEX: 0" id="Chk7" runat="server" Text="见习期不合格"></asp:CheckBox>
																			<asp:CheckBox style="Z-INDEX: 0" id="Chk6" runat="server" Text="见习期考查"></asp:CheckBox>
																			<asp:CheckBox style="Z-INDEX: 0" id="Chk1" runat="server" Text="储备"></asp:CheckBox>
																			<asp:CheckBox style="Z-INDEX: 0" id="Chk2" runat="server" Text="已录用未入职"></asp:CheckBox>
																			<br>
																			<asp:CheckBox style="Z-INDEX: 0" id="Chk3" runat="server" Text="已入职未转正"></asp:CheckBox>
																			<asp:CheckBox style="Z-INDEX: 0" id="Chk4" runat="server" Text="已转正" Checked="True"></asp:CheckBox>
																			<asp:CheckBox style="Z-INDEX: 0" id="Chk5" runat="server" Text="已离职"></asp:CheckBox></td>
																			
																	</tr>
																	<tr>
																		<td class="SchTable" colSpan="4" align="center"><INPUT style="HEIGHT: 22px" id="btnFilter" class="button" value="查询" type="button" name="btnFilter"
																				runat="server"></td>
																	</tr>
																</table>
															</td>
														</tr>
													</TABLE>
												</td>
											</tr>
											<tr>
												<td style="BACKGROUND-IMAGE: url(../images/main_sp_h.jpg); BACKGROUND-REPEAT: repeat-x"
													height="3"></td>
											</tr>
										</table>
										<table id="UserInfo" cellSpacing="2" cellPadding="2" width="100%">
											<tr>
												<td vAlign="top" width="100%"><asp:datagrid id="DGrid" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid"
														Height="100%">
														<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
														<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
														<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
														<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
														<Columns>
															<asp:BoundColumn Visible="False" DataField="UserFilesCode" SortExpression="UserFilesCode"></asp:BoundColumn>
															<asp:BoundColumn DataField="WorkerSign" HeaderText="工号"></asp:BoundColumn>
															<asp:BoundColumn DataField="UserName" SortExpression="UserName" HeaderText="姓名"></asp:BoundColumn>
															<asp:BoundColumn DataField="Sex" SortExpression="Sex" HeaderText="性别"></asp:BoundColumn>
															<asp:BoundColumn DataField="OrganName" HeaderText="公司名称"></asp:BoundColumn>
															<asp:BoundColumn DataField="CommName" HeaderText="项目名称"></asp:BoundColumn>
															<asp:BoundColumn DataField="RoleClassDName" SortExpression="age" HeaderText="岗位"></asp:BoundColumn>
															<asp:BoundColumn DataField="age" HeaderText="年龄"></asp:BoundColumn>
															<asp:BoundColumn DataField="Qualification" HeaderText="学历"></asp:BoundColumn>
															<asp:BoundColumn DataField="EntryDate" SortExpression="EntryDate" HeaderText="入职时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
															<asp:BoundColumn DataField="FormalDate" HeaderText="转正日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
															<asp:BoundColumn DataField="ArchiveStateName" HeaderText="人员状态"></asp:BoundColumn>
															<asp:HyperLinkColumn Text="物资领用" DataNavigateUrlField="UserFilesCode" DataNavigateUrlFormatString="MaterialBrowse.aspx?UserFilesCode={0}"
																HeaderText="物资领用">
																<HeaderStyle HorizontalAlign="Center" Width="60px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</asp:HyperLinkColumn>
															<asp:HyperLinkColumn Text="奖惩考核" DataNavigateUrlField="UserFilesCode" DataNavigateUrlFormatString="UserFileRecordBrowse.aspx?UserFilesCode={0}"
																HeaderText="奖惩考核">
																<HeaderStyle HorizontalAlign="Center" Width="60px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</asp:HyperLinkColumn>
															<asp:ButtonColumn Text="&lt;img src=../images/icons/Edit.gif border=0 align=absmiddle alt='编辑'&gt;"
																HeaderText="[编辑]" CommandName="Edit">
																<HeaderStyle Width="40px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</asp:ButtonColumn>
															<asp:ButtonColumn Text="&lt;img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除'&gt;"
																HeaderText="[删除]" CommandName="Delete">
																<HeaderStyle Width="40px"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</asp:ButtonColumn>
														</Columns>
														<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
													</asp:datagrid></td>
											</tr>
											<tr>
												<td>
													<table border="0" cellSpacing="0" cellPadding="0" width="100%" height="38">
														<tr>
															<td class="formTable_Footer_left" height="38" width="20">&nbsp;</td>
															<td class="formTable_Footer_center" height="38" align="center"><webdiyer:aspnetpager id="ANPCut" runat="server" InputBoxStyle="width:30px;" Font-Bold="True" CustomInfoTextAlign="Right"
																	SubmitButtonText="确定" AlwaysShow="True" ShowCustomInfoSection="Left" TextAfterInputBox="页" TextBeforeInputBox="转到" ShowInputBox="Always" ShowBoxThreshold="1"
																	NumericButtonCount="5" PrevPageText="上一页" NextPageText="下一页" LastPageText=""
																	FirstPageText="" CustomInfoSectionWidth="30%" PageSize="15" InputBoxClass="inputline" SubmitButtonClass="inputbott"
																	HorizontalAlign="Right"></webdiyer:aspnetpager></td>
															<td class="formTable_Footer_right" height="38" width="20">&nbsp;</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
		</form>
		</TD></TR></TBODY></TABLE>
	</body>
</HTML>
