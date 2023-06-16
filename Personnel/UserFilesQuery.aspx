<%@ Page language="c#" Codebehind="UserFilesQuery.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Personnel.UserFilesQuery" %>
<%@ Register TagPrefix="uc1" TagName="OperatTitle" Src="../UserControl/OperatTitle.ascx" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Register TagPrefix="uc1" TagName="OperatMenu" Src="../UserControl/OperatMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>UserFilesQuery</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../jscript/JSClient.js"></script>
		<script language="javascript" src="../jscript/DateControl.js"></script>
		<script language="javascript">
		<!--

			function btnClear_OnClick()
			{
				document.all.ArchiveState.selectedIndex=0;
				UserFilesQuery.UserName.value="";
				UserFilesQuery.EmployeeCode.value="";
				UserFilesQuery.DepName.value="";
				
				document.all.hiDepName.value="";
				document.all.DepCode.value="";
				document.all.OrganCode.value="";
				document.all.DepNameDepart.value="";
				document.all.ClassRole.selectedIndex=0;
				document.all.JobTypeCode.selectedIndex=0;
				//document.all.age1.selectedIndex=0;
				//document.all.age2.selectedIndex=0;
				//document.all.mon1.selectedIndex=0;
				//document.all.day1.selectedIndex=0;
				//document.all.mon2.selectedIndex=0;
				//document.all.day2.selectedIndex=0;
				document.all.Sex.selectedIndex=0;
				document.all.Qualification.selectedIndex=0;
				document.all.MaritalStatus.selectedIndex=0;
				document.all.sign_Stature.selectedIndex=0;
				document.all.Stature.value="";
				document.all.NativePlace.value="";
				document.all.Speciality.value="";
				document.all.TechnicTitle.value="";
				document.all.Skills.value="";
				document.all.GuardCard.value="";
				document.all.Computer.value="";
				document.all.IDCardCode.value="";
				document.all.sign_Avoirdupois.selectedIndex=0;
				document.all.Avoirdupois.value="";
				document.all.WorkFormat.selectedIndex=0;
				document.all.RecruitStartDate.value="";
				document.all.RecruitEndDate.value="";
				document.all.EntryStartDate.value="";
				document.all.EntryEndDate.value="";
				document.all.FormalStartDate.value="";
				document.all.FormalEndDate.value="";
				document.all.ChangeStartDate.value="";
				document.all.ChangeEndDate.value="";
				document.all.DimissionStartDate.value="";
				document.all.DimissionEndDate.value="";
				document.all.ContractSign.selectedIndex=0;
				document.all.IsInsurance.selectedIndex=0;
				
			}
			
			function btnSelDepDepart_OnClick()
			{
				varReturn=showModalDlg("../dialog/DepartmentDlg.aspx","",370,300);
				
				if(varReturn!="")
				{//**��÷��صĲ�����Ϣ
					
					var varObjects=varReturn.split("\t");
					document.all.DepCodeDepart.value=varObjects[0];
					document.all.DepNameDepart.value=varObjects[1];
					document.all.hiDepNameDepart.value=varObjects[1];
				}
			}
			
			function btnSelDep_OnClick()
			{
												
				varReturn=showModalDlg("../dialog/CommCorpDlg.aspx"+"?Ram="+Math.random(),"",600,450);
				
				//alert(varReturn);
				if(varReturn!="")
				{//**��÷��صĲ�����Ϣ
					
					var varObjects=varReturn.split("\t");
					
					UserFilesQuery.DepCode.value=varObjects[0];
					UserFilesQuery.DepName.value=varObjects[1];
					UserFilesQuery.hiDepName.value=varObjects[1];
					if(varObjects[0]==0)
					{
						//alert(varReturn);
						UserFilesQuery.OrganCode.value=varObjects[2];
					}
				}
			}
			
			function btnSelRole_OnClick()
			{
				var strDepCode = getObject("DepCode").value;
				
				if(strDepCode == "")
				{
					alert("��ѡ����!");
					UserFilesQuery.btnSelDep.focus();
					return false;
				}
				
				varReturn=showModalDlg("../dialog/SysRoleDlg.aspx?DepCode="+strDepCode+"&Ram="+Math.random(),"",500,390);
				
				if(varReturn!="")
				{//**��÷��صĲ�����Ϣ
					
					var varObjects=varReturn.split("\t");
					
					UserFilesQuery.RoleCode.value=varObjects[0];
					UserFilesQuery.RoleName.value=varObjects[1];
					UserFilesQuery.hiRoleName.value=varObjects[1];
				}
			}	
		

			

			
			function CheckAll()
			{
				var ArrInput = document.getElementsByTagName("Input");
				var IsCheck=false;
				var IsReverseCheck=false; //�Ƿ���ѡ��
				var BtnCheck=event.srcElement;
				
				if(BtnCheck.title=="ѡ��ȫ��")
				{
					IsCheck=true;
					BtnCheck.value="ȡ��";
					BtnCheck.title="ȡ��ѡ��";
				}else if(BtnCheck.title=="ȡ��ѡ��")
				{
					IsCheck=false;
					BtnCheck.value="ȫѡ";
					BtnCheck.title="ѡ��ȫ��";
				}else if(BtnCheck.title=="����ѡ��")
				{
					IsReverseCheck=true;
				}
				
				for(var i=0;i<ArrInput.length;i++)
				{
					if(ArrInput[i].type=="checkbox")
					{
						if(IsReverseCheck)
						{
							IsCheck=!ArrInput[i].checked;
						}
						ArrInput[i].checked=IsCheck;
					}
				}
			}
			
			function CheckData()
			{
				if(getObject("ckStature").checked)
				{
					if(getObject("Stature").value=="") 
					{
						alert("��������ߣ�");
						getObject("Stature").focus();
						return false;
					}
				}
				
				if(getObject("ckAvoirdupois").checked)
				{
					if(getObject("Avoirdupois").value=="") 
					{
						alert("���������أ�");
						getObject("Avoirdupois").focus();
						return false;
					}
				}
				return true;
			}
		//-->
		</script>
		<script language="javascript">
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
			
			function Win_OnLoad()
			{				
				var strPrintParms = getObject("PrintParms").value;
				if(strPrintParms!="")
				{					
					showOperatWin(strPrintParms);
					
					getObject("PrintParms").value="";					
				}
			}
		</script>
		<script language="javascript" id="clientEventHandlersJS">
<!--

function WorkFormat_onclick() {

}

//-->
		</script>
	</HEAD>
	<body onload="Win_OnLoad();">
		<form id="UserFilesQuery" method="post" runat="server">
			<div id="overDiv" style="Z-INDEX: 1000; POSITION: absolute; VISIBILITY: hidden"></div>
			<FONT face="����"></FONT><FONT face="����"></FONT><FONT face="����"></FONT><FONT face="����">
			</FONT><FONT face="����"></FONT><FONT face="����"></FONT><FONT face="����"></FONT><FONT face="����">
			</FONT>
			<table height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td vAlign="top" height="32"><uc1:operattitle id="mOperatTitle" runat="server"></uc1:operattitle><INPUT id="PageIndex" style="WIDTH: 72px; HEIGHT: 22px" type="hidden" size="6" name="PageIndex"
							runat="server"><INPUT id="hiDepName" style="WIDTH: 11px; HEIGHT: 21px" type="hidden" size="1" name="hiDepName"
							runat="server"><INPUT id="DepCode" style="WIDTH: 15px; HEIGHT: 21px" type="hidden" size="1" name="DepCode"
							runat="server"><INPUT id="OrganCode" style="WIDTH: 15px; HEIGHT: 21px" type="hidden" size="1" runat="server"></td>
				</tr>
				<TR>
					<TD align="left" vAlign="top" height="25"><uc1:operatmenu id="mOperatMenu" runat="server"></uc1:operatmenu></TD>
				</TR>
				<tr>
					<td vAlign="top" bgColor="#ffffff">
						<table cellSpacing="2" cellPadding="2" width="100%">
							<tr>
								<td>
									<table class="formTable" style="FONT-SIZE: 12px" cellSpacing="0" cellPadding="0" width="100%">
										<TR>
											<TD class="formTable_Header" align="center" colSpan="4"><span id="lbl_WorkflowName">���²�ѯ</span></TD>
										</TR>
										<TR>
											<td colSpan="4" height="5"></td>
										</TR>
										<TR>
											<TD align="right" width="15%"><INPUT id="ckArchiveState" type="checkbox" name="ckArchiveState" runat="server" value=""
													CHECKED>����״̬��</TD>
											<TD colspan="3">
												<asp:CheckBox style="Z-INDEX: 0" id="Chk6" runat="server" Text="��ϰ�ڿ���"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk7" runat="server" Text="��ϰ�ڲ��ϸ�"></asp:CheckBox>
												<asp:CheckBox id="Chk1" runat="server" Text="����"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk2" runat="server" Text="��¼��δ��ְ"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk3" runat="server" Text="����ְδת��"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk4" runat="server" Text="��ת��"></asp:CheckBox>
												<asp:CheckBox style="Z-INDEX: 0" id="Chk5" runat="server" Text="����ְ"></asp:CheckBox></TD>
										</TR>
										<tr>
											<td align="right" width="15%"><INPUT id="ckUserName" type="checkbox" name="ckUserName" runat="server"><FONT face="����">��&nbsp;&nbsp;&nbsp; 
													��</FONT>��</td>
											<td style="WIDTH: 361px" width="361"><INPUT id="UserName" style="WIDTH: 152px; HEIGHT: 22px" name="UserName" runat="server">
												</FONT></td>
											<TD style="WIDTH: 141px" align="right" width="141"><INPUT id="ckEmployeeCode" type="checkbox" name="ckEmployeeCode" runat="server">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												�ţ�</TD>
											<td width="35%"><INPUT id="EmployeeCode" style="WIDTH: 152px; HEIGHT: 22px" size="18" name="EmployeeCode"
													runat="server">
											</td>
										</tr>
										<TR>
											<TD align="right" width="15%"><INPUT id="ckDepCode" type="checkbox" name="ckDepCode" runat="server">�������ƣ�</TD>
											<TD style="WIDTH: 361px" width="361"><INPUT class="Control_ItemInput" id="DepName" style="Z-INDEX: 0; WIDTH: 152px; HEIGHT: 19px"
													maxLength="50" size="16" name="DepName" runat="server"><INPUT class="Button_sel" id="btnSelDep" onclick="btnSelDep_OnClick();" type="button" name="btnSelDep"
													runat="server">
												<asp:checkbox id="IsInclude" runat="server" Text="�������¼�����"></asp:checkbox></TD>
											<TD style="WIDTH: 141px" align="right" width="141"><FONT face="����"><INPUT id="ckDutyCode" type="checkbox" name="ckDutyCode" runat="server">��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�</FONT></TD>
											<TD width="35%"><INPUT class="Control_ItemInput" id="DepNameDepart" style="WIDTH: 150px" maxLength="50"
													size="26" name="RoleName" runat="server"><INPUT class="Button_sel" id="Button2" onclick="btnSelDepDepart_OnClick();" type="button"
													name="btnSelDep" runat="server" style="Z-INDEX: 0"><INPUT id="DepCodeDepart" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" name="DepCode"
													runat="server"><INPUT id="hiDepNameDepart" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" name="hiDepName"
													runat="server"></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 26px" align="right"><INPUT id="ClassRoleCheck" type="checkbox" runat="server">�����λ��</TD>
											<TD style="WIDTH: 361px; HEIGHT: 26px"><FONT face="����"><SELECT id="ClassRole" runat="server">
														<OPTION selected></OPTION>
													</SELECT></FONT></TD>
											<TD style="WIDTH: 141px; HEIGHT: 26px" align="right"><FONT face="����"><INPUT id="JobTypeCheck" type="checkbox" name="JobTypeCheck" runat="server">ְ������</FONT></TD>
											<TD style="HEIGHT: 26px"><FONT face="����"><SELECT id="JobTypeCode" name="JobTypeCode" runat="server"></SELECT></FONT></TD>
										</TR>
										<TR>
											<TD align="right" width="15%"><INPUT id="ckAge" type="checkbox" name="ckAge" runat="server">�����ѯ��</TD>
											<TD style="WIDTH: 361px" width="361">��<SELECT id="age1" name="age1" runat="server">
													<OPTION selected></OPTION>
												</SELECT>��<SELECT id="age2" name="age2" runat="server">
													<OPTION selected></OPTION>
												</SELECT></TD>
											<TD style="WIDTH: 141px" align="right" width="141"><INPUT id="ckBirthday" type="checkbox" name="ckBirthday" runat="server">���ղ�ѯ��</TD>
											<TD width="35%">��
												<SELECT id="mon1" size="1" name="mon1" runat="server">
												</SELECT>
												��
												<SELECT id="day1" size="1" name="day1" runat="server">
												</SELECT>
												�յ�
												<SELECT id="mon2" size="1" name="mon2" runat="server">
												</SELECT>
												��
												<SELECT id="day2" size="1" name="day2" runat="server">
												</SELECT>
												��</FONT></TD>
										</TR>
										<TR>
											<TD align="right" width="15%"><INPUT id="ckSex" type="checkbox" name="ckSex" runat="server">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												��</TD>
											<TD style="WIDTH: 361px" width="361"><SELECT id="Sex" name="Sex" runat="server">
													<OPTION selected></OPTION>
												</SELECT></TD>
											<TD style="WIDTH: 141px" align="right" width="141"><INPUT id="ckQualification" type="checkbox" name="ckQualification" runat="server">ѧ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												����</TD>
											<TD width="35%"><SELECT id="Qualification" name="Qualification" runat="server">
													<OPTION selected></OPTION>
												</SELECT></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 24px" align="right"><INPUT id="ckMaritalStatus" type="checkbox" name="ckMaritalStatus" runat="server">����״����</TD>
											<TD style="WIDTH: 361px; HEIGHT: 24px"><FONT face="����"><SELECT id="MaritalStatus" name="MaritalStatus" runat="server">
														<OPTION selected></OPTION>
													</SELECT></FONT></TD>
											<TD style="WIDTH: 141px; HEIGHT: 24px" align="right"><FONT face="����"><INPUT id="ckStature" type="checkbox" name="ckStature" runat="server">��&nbsp;&nbsp;&nbsp; 
													�ߣ�</FONT></TD>
											<TD style="HEIGHT: 23px"><SELECT id="sign_Stature" name="sign_Stature" runat="server">
													<OPTION value="1" selected>����</OPTION>
													<OPTION value="2">���ڵ���</OPTION>
													<OPTION value="-1">С��</OPTION>
													<OPTION value="-2">С�ڵ���</OPTION>
													<OPTION value="0">����</OPTION>
												</SELECT><INPUT onkeypress="CheckInterger();" id="Stature" style="WIDTH: 74px; HEIGHT: 22px" maxLength="50"
													size="6" name="Stature" runat="server"></TD>
										</TR>
										<TR style="DISPLAY: none">
											<TD style="HEIGHT: 23px" align="right"><INPUT id="ckNativePlace" type="checkbox" name="ckNativePlace" runat="server">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												�᣺</TD>
											<TD style="WIDTH: 361px; HEIGHT: 23px"><INPUT id="NativePlace" style="WIDTH: 152px; HEIGHT: 22px" maxLength="50" name="NativePlace"
													runat="server"></TD>
											<TD style="WIDTH: 141px; HEIGHT: 23px" align="right"><FONT face="����"><INPUT id="ckSpeciality" type="checkbox" name="ckSpeciality" runat="server">ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ��</FONT></TD>
											<TD style="HEIGHT: 23px"><FONT face="����"><INPUT id="Speciality" style="WIDTH: 152px; HEIGHT: 22px" maxLength="50" name="Speciality"
														runat="server"></FONT></TD>
										</TR>
										<TR style="DISPLAY: none">
											<TD align="right"><INPUT id="ckTechnicTitle" type="checkbox" name="ckTechnicTitle" runat="server">����ְ�ƣ�</TD>
											<TD style="WIDTH: 361px"><FONT face="����"><INPUT id="TechnicTitle" style="WIDTH: 152px; HEIGHT: 22px" maxLength="50" name="TechnicTitle"
														runat="server"></FONT></TD>
											<TD style="WIDTH: 141px" align="right"><INPUT id="ckSkills" type="checkbox" name="ckSkills" runat="server">רҵ���ܣ�</TD>
											<TD><INPUT id="Skills" style="WIDTH: 152px; HEIGHT: 22px" maxLength="50" name="Skills" runat="server"></TD>
										</TR>
										<TR style="DISPLAY: none">
											<TD style="HEIGHT: 20px" align="right"><INPUT id="ckGuardCard" type="checkbox" name="ckGuardCard" runat="server">�����ϸڣ�
											</TD>
											<TD style="WIDTH: 361px; HEIGHT: 20px"><INPUT id="GuardCard" style="WIDTH: 152px; HEIGHT: 22px" maxLength="50" name="GuardCard"
													runat="server"></TD>
											<TD style="WIDTH: 141px; HEIGHT: 20px" align="right"><INPUT id="ckComputer" type="checkbox" name="ckComputer" runat="server">�� 
												�� ����</TD>
											<TD style="HEIGHT: 20px"><INPUT id="Computer" style="WIDTH: 152px; HEIGHT: 22px" maxLength="50" name="Computer"
													runat="server"></TD>
										</TR>
										<TR>
											<TD align="right"><FONT face="����"><INPUT id="ckIDCardCode" type="checkbox" name="ckIDCardCode" runat="server"><FONT face="����">���֤��</FONT>��</FONT></TD>
											<TD style="WIDTH: 361px"><INPUT id="IDCardCode" style="WIDTH: 152px; HEIGHT: 22px" maxLength="50" name="IDCardCode"
													runat="server"></TD>
											<TD style="WIDTH: 141px" align="right"><INPUT id="ckAvoirdupois" type="checkbox" name="ckAvoirdupois" runat="server">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												�أ�</TD>
											<TD><FONT face="����"><SELECT id="sign_Avoirdupois" name="sign_Avoirdupois" runat="server">
														<OPTION value="1" selected>����</OPTION>
														<OPTION value="2">���ڵ���</OPTION>
														<OPTION value="-1">С��</OPTION>
														<OPTION value="-2">С�ڵ���</OPTION>
														<OPTION value="0">����</OPTION>
													</SELECT><INPUT onkeypress="CheckInterger();" id="Avoirdupois" style="WIDTH: 74px; HEIGHT: 22px"
														maxLength="50" size="6" name="Avoirdupois" runat="server"></FONT></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 26px" align="right"><INPUT id="ckWorkFormat" type="checkbox" runat="server">�ù���ʽ��</TD>
											<TD style="WIDTH: 361px; HEIGHT: 26px"><SELECT id="WorkFormat" name="sign_Avoirdupois" runat="server"></SELECT></TD>
											<TD style="WIDTH: 141px; HEIGHT: 26px" align="right"><FONT face="����"><INPUT id="RecruitCheck" type="checkbox" name="ckAvoirdupois" runat="server">ӦƸʱ�䣺</FONT></TD>
											<TD style="HEIGHT: 26px"><FONT face="����"><INPUT id="RecruitStartDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.RecruitStartDate');"
														maxLength="50" size="10" name="RecruitStartDate" runat="server">��<INPUT id="RecruitEndDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.RecruitEndDate');"
														maxLength="50" size="8" name="RecruitEndDate" runat="server"></FONT></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 26px" align="right"><INPUT id="EntryCheck" type="checkbox" name="Checkbox1" runat="server">��ְʱ�䣺</TD>
											<TD style="WIDTH: 361px; HEIGHT: 26px"><FONT face="����"><INPUT id="EntryStartDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.EntryStartDate');"
														maxLength="50" size="10" name="EntryStartDate" runat="server">��<INPUT id="EntryEndDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.EntryEndDate');"
														maxLength="50" size="10" name="EntryEndDate" runat="server"></FONT></TD>
											<TD style="WIDTH: 141px; HEIGHT: 26px" align="right"><FONT face="����"><INPUT id="FormalCheck" type="checkbox" name="ckAvoirdupois" runat="server">ת��ʱ�䣺</FONT></TD>
											<TD style="HEIGHT: 26px"><FONT face="����"><INPUT id="FormalStartDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.FormStartDate');"
														maxLength="50" size="10" name="FormStartDate" runat="server">��<INPUT id="FormalEndDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.FormEndDate');"
														maxLength="50" size="8" name="FormEndDate" runat="server"></FONT></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 26px" align="right"><INPUT id="ChangeCheck" type="checkbox" name="Checkbox3" runat="server">�䶯ʱ�䣺</TD>
											<TD style="WIDTH: 361px; HEIGHT: 26px"><FONT face="����"><INPUT id="ChangeStartDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.ChangeStartDate');"
														maxLength="50" size="10" name="ChangeStartDate" runat="server">��<INPUT id="ChangeEndDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.ChangeEndDate');"
														maxLength="50" size="10" name="ChangeEndDate" runat="server"></FONT></TD>
											<TD style="WIDTH: 141px; HEIGHT: 26px" align="right"><FONT face="����"><INPUT id="DimissionCheck" type="checkbox" name="ckAvoirdupois" runat="server">��ְʱ�䣺</FONT></TD>
											<TD style="HEIGHT: 26px"><FONT face="����"><INPUT id="DimissionStartDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.DimissionStartDate');"
														maxLength="50" size="10" name="DimissionStartDate" runat="server">��<INPUT id="DimissionEndDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.DimissionEndDate');"
														maxLength="50" size="8" name="DimissionEndDate" runat="server"></FONT></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 26px" align="right"><INPUT id="CbClassRole" type="checkbox" name="Checkbox3" runat="server">�ڸ�ʱ�䣺</TD>
											<TD style="WIDTH: 361px; HEIGHT: 26px"><FONT face="����"><INPUT id="AtWorkStartDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.AtWorkStartDate');"
														maxLength="50" size="10" name="ChangeStartDate" runat="server">��<INPUT id="AtWorkEndDate" style="WIDTH: 96px; HEIGHT: 22px" onclick="javascript:show_calendar('all.AtWorkEndDate');"
														maxLength="50" size="10" name="ChangeEndDate" runat="server"></FONT></TD>
											<TD style="WIDTH: 141px; HEIGHT: 26px" align="right"><FONT face="����" style="Z-INDEX: 0"><INPUT id="ContractSignCheck" type="checkbox" name="Checkbox3" runat="server" style="Z-INDEX: 0">ǩ����ͬ��</FONT></TD>
											<TD style="HEIGHT: 26px"><FONT face="����"><SELECT id="ContractSign" runat="server" style="Z-INDEX: 0">
														<OPTION selected value=""></OPTION>
														<OPTION value="��">��</OPTION>
														<OPTION value="��">��</OPTION>
													</SELECT></FONT></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 26px" align="right"><FONT style="Z-INDEX: 0" face="����"><INPUT id="CbPackIsEnd" type="checkbox" name="Checkbox3" runat="server" style="Z-INDEX: 0"><FONT face="����">��ͬ���ڣ�</FONT></FONT></TD>
											<TD style="WIDTH: 361px; HEIGHT: 26px"><FONT face="����" style="Z-INDEX: 0"><INPUT style="Z-INDEX: 0; WIDTH: 48px; HEIGHT: 22px" id="WillOutDays" class="Control_ItemInput"
														value="30" size="2" name="WillOutDays" runat="server"><FONT face="����">��</FONT></FONT></TD>
											<TD style="WIDTH: 141px; HEIGHT: 26px" align="right"><FONT face="����"></FONT></TD>
											<TD style="HEIGHT: 26px"><FONT face="����"></FONT></TD>
										</TR>
										<TR>
											<TD style="HEIGHT: 16px" align="right"><FONT face="����">�� �� �� վ��</FONT></TD>
											<TD style="WIDTH: 361px; HEIGHT: 16px"><A href="http://www.chsi.com.cn/xlcx/index.jsp" target="_blank"><FONT face="����" color="#003399">�й��ߵȽ���ѧ����Ϣ��</FONT></A><a href="http://www.chsi.com.cn/xlcx/index.jsp" target="_blank"></a></TD>
											<TD style="WIDTH: 141px; HEIGHT: 16px" align="right"><FONT face="����"></FONT></TD>
											<TD style="HEIGHT: 15px"><FONT face="����"></FONT></TD>
										</TR>
										<TR>
											<TD colSpan="4" height="5"><FONT face="����"></FONT></TD>
										</TR>
									</table>
								</td>
							</tr>
							<tr>
								<td class="SchTable" align="center"><INPUT class="button" id="btnCheck" title="ѡ��ȫ��" style="HEIGHT: 22px" onclick="CheckAll();"
										type="button" value="ȫѡ" name="btnCheckAll"><INPUT class="button" id="Button1" title="����ѡ��" style="HEIGHT: 22px" onclick="CheckAll();"
										type="button" value="��ѡ" name="btnCheckAll"><INPUT class="button" id="btnFilter" style="HEIGHT: 22px" onclick="javascript:if(!CheckData()) return false;"
										type="button" value="��ѯ" name="btnFilter" runat="server"><INPUT class="button" id="btnClear" style="HEIGHT: 22px" onclick="javascript:btnClear_OnClick();"
										type="button" value="���" name="btnClear"><INPUT class="button_Four" id="btnExcel" style="HEIGHT: 22px" type="button" value="Excel���"
										name="btnExcel" runat="server"><INPUT id="PrintParms" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="PrintParms"
										runat="server"><!--*********************��ѯ����********************--><INPUT id="TableSign" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="TableSign"
										runat="server"><INPUT id="hiSearchData" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="hiSearchData"
										runat="server"><INPUT id="hiSearchSql" style="WIDTH: 16px; HEIGHT: 22px" type="hidden" size="1" name="hiSearchSql"
										runat="server"></td>
							</tr>
							<tr>
								<td vAlign="top" width="100%"><asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False"
										AllowSorting="True">
										<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
										<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
										<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
										<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
										<Columns>
											<asp:BoundColumn Visible="False" DataField="UserFilesCode" SortExpression="UserFilesCode"></asp:BoundColumn>
											<asp:BoundColumn Visible="False" DataField="ArchiveState" SortExpression="ArchiveState"></asp:BoundColumn>
											<asp:BoundColumn DataField="WorkerSign" SortExpression="WorkerSign" HeaderText="����"></asp:BoundColumn>
											<asp:BoundColumn DataField="PaperCode" HeaderText="֤������"></asp:BoundColumn>
											<asp:BoundColumn DataField="UserName" SortExpression="UserName" HeaderText="����"></asp:BoundColumn>
											<asp:BoundColumn DataField="Sex" SortExpression="Sex" HeaderText="�Ա�"></asp:BoundColumn>
											<asp:BoundColumn DataField="OrganName" SortExpression="OrganName" HeaderText="��˾����"></asp:BoundColumn>
											<asp:BoundColumn DataField="CommName" SortExpression="CommName" HeaderText="��Ŀ����"></asp:BoundColumn>
											<asp:BoundColumn DataField="DepartmentName" SortExpression="DepartmentName" HeaderText="��������"></asp:BoundColumn>
											<asp:BoundColumn DataField="RoleClassDName" SortExpression="RoleClassDName" HeaderText="��λ"></asp:BoundColumn>
											<asp:BoundColumn DataField="age" SortExpression="age" HeaderText="����"></asp:BoundColumn>
											<asp:BoundColumn DataField="Qualification" SortExpression="Qualification" HeaderText="ѧ��"></asp:BoundColumn>
											<asp:BoundColumn DataField="EntryDate" SortExpression="EntryDate" HeaderText="��˾ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="FormalDate" SortExpression="FormalDate" HeaderText="ת������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
											<asp:BoundColumn DataField="ArchiveStateName" SortExpression="ArchiveStateName" HeaderText="����״̬">
												<HeaderStyle Width="60px"></HeaderStyle>
											</asp:BoundColumn>
											<asp:ButtonColumn Text="&lt;img src=../images/icons/Edit.gif border=0 align=absmiddle alt='��ϸ'&gt;"
												HeaderText="[��ϸ]" CommandName="Detail">
												<HeaderStyle Width="40px"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:ButtonColumn>
										</Columns>
										<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td>
									<table height="38" cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr>
											<td class="formTable_Footer_left" width="20" height="38">&nbsp;</td>
											<td class="formTable_Footer_center" align="center" height="38"><webdiyer:aspnetpager id="ANPCut" runat="server" InputBoxStyle="width:30px;" Font-Bold="True" CustomInfoTextAlign="Right"
													SubmitButtonText="ȷ��" AlwaysShow="True" ShowCustomInfoSection="Left" TextAfterInputBox="ҳ" TextBeforeInputBox="ת��" ShowInputBox="Always" ShowBoxThreshold="1"
													NumericButtonCount="5" PrevPageText="��һҳ" NextPageText="��һҳ" LastPageText=""
													FirstPageText="" CustomInfoSectionWidth="30%" PageSize="15" InputBoxClass="inputline" SubmitButtonClass="inputbott"
													HorizontalAlign="Right"></webdiyer:aspnetpager></td>
											<td class="formTable_Footer_right" width="20" height="38">&nbsp;</td>
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
