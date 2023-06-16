<%@ Register TagPrefix="uc1" TagName="OperatTitle" Src="UserControl/OperatTitle.ascx" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysMessageManage.aspx.cs" Inherits="M_Main.SysMessageManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>ServiceInfoIntroBrowse</title>
		<meta content="no-cache" http-equiv="Cache-Control">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		<!--
			function btnClear_OnClick()
			{
				ServiceInfoIntroBrowse.Heading.value="";
			}
		//-->
		</script>
	</HEAD>
	<body>
		<form id="ServiceInfoIntroBrowse" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td vAlign="top" height="30"><uc1:operattitle id="mOperatTitle" runat="server"></uc1:operattitle><INPUT type="hidden" name="TypeCode" runat="server" id="TypeCode" style="WIDTH: 40px; HEIGHT: 22px"
							size="1"><INPUT id="hiType" style="WIDTH: 40px; HEIGHT: 22px" type="hidden" size="1" name="hiType"
							runat="server"><INPUT id="InfoID" style="WIDTH: 40px; HEIGHT: 22px" type="hidden" size="1" name="InfoID"
							runat="server"></td>
				</tr>
				<tr>
					<td vAlign="top" bgColor="#ffffff">
						<table cellSpacing="2" cellPadding="2" width="100%">
							<tr>
								<td style="HEIGHT: 32px" height="32">
									<table style="FONT-SIZE: 12px" cellSpacing="0" cellPadding="0" width="100%" class="SchTable">
										<tr>
											<td align="right"><FONT face="宋体"><INPUT id="btnAdd" class="button" style="HEIGHT: 22px" type="button" value="返回" name="btnAdd" onclick="javascript:history.back();"
														runat="server"></FONT></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="BACKGROUND-IMAGE: url(../images/main_sp_h.jpg); BACKGROUND-REPEAT: repeat-x"
									height="3"><FONT face="宋体"></FONT></td>
							</tr>
							<tr>
								<td colspan="3" height="30" style="COLOR: #0000ff; FONT-SIZE: 14px; FONT-WEIGHT: bold"
									align="center">
									<asp:Label id="Title" runat="server"></asp:Label></td>
							</tr>
							<tr>
								<td colspan="3" align="center">
									<table width="90%" align="center">										
										<tr>
											<td align="left"><FONT face="宋体"></FONT><FONT face="宋体"></FONT><FONT face="宋体"></FONT>
												<DIV id="Content" style="WIDTH: 100%; DISPLAY: inline" runat="server" ms_positioning="FlowLayout"><FONT face="宋体"></FONT></DIV>
											</td>
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
</html>
