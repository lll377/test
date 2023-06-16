<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="ArrearageAgeReportToExcel2.aspx.cs" Inherits="M_Main.StatisReport.ArrearageAgeReportToExcel2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="MultiAlgorithmFeesDebtSearchCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>								
						<asp:BoundColumn DataField="单位" HeaderText="单位"></asp:BoundColumn>
						<asp:BoundColumn DataField="费用项目" HeaderText="费用项目"></asp:BoundColumn>
                        <asp:BoundColumn DataField="欠费总额" HeaderText="欠费总额"></asp:BoundColumn>
						<asp:BoundColumn DataField="前期欠费" HeaderText="前期欠费"></asp:BoundColumn>
                        <asp:BoundColumn DataField="本期欠费" HeaderText="本期欠费"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
