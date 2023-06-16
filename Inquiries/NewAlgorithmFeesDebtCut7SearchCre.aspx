<%@ Page language="c#" Codebehind="NewAlgorithmFeesDebtCut7SearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.CostStatist.NewAlgorithmFeesDebtCut7SearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>NewAlgorithmFeesDebtCut7SearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="NewAlgorithmFeesDebtCut7SearchCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>										
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RegionName" HeaderText="组团区域"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RegionName" HeaderText="楼宇名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>

                        <asp:BoundColumn DataField="BuildArea" HeaderText="建筑面积"></asp:BoundColumn>
                        <asp:BoundColumn DataField="StateName" HeaderText="房屋状态"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkName" HeaderText="车位编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="MobilePhone" HeaderText="联系电话"></asp:BoundColumn>

                        <asp:BoundColumn DataField="CostName" HeaderText="费用项目"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TotalAmount" HeaderText="欠费金额"></asp:BoundColumn>
                        
						
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
