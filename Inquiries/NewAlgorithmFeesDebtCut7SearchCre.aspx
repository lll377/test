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
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>										
						<asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RegionName" HeaderText="��������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RegionName" HeaderText="¥������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>

                        <asp:BoundColumn DataField="BuildArea" HeaderText="�������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="StateName" HeaderText="����״̬"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkName" HeaderText="��λ���"></asp:BoundColumn>
                        <asp:BoundColumn DataField="MobilePhone" HeaderText="��ϵ�绰"></asp:BoundColumn>

                        <asp:BoundColumn DataField="CostName" HeaderText="������Ŀ"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TotalAmount" HeaderText="Ƿ�ѽ��"></asp:BoundColumn>
                        
						
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
