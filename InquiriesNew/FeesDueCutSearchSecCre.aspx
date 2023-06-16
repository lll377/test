<%@ Page language="c#" Codebehind="FeesDueCutSearchSecCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.InquiriesNew.FeesDueCutSearchSecCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesDueCutSearchSecCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">										
					<Columns>
						<asp:BoundColumn DataField="CostName" HeaderText="费用名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RegionName" HeaderText="组团名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PropertyRights" HeaderText="产权性质"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
