<%@ Page language="c#" Codebehind="FeesChargeRateDetailCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.CorpCostStatistNew.FeesChargeRateDetailCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesChargeRateDetailCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="ParkName" HeaderText="��λ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeeDueYearMonth" ReadOnly="True" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="AccountsDueDate" ReadOnly="True" HeaderText="Ӧ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesStateDate" ReadOnly="True" HeaderText="��ʼ����" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesEndDate" ReadOnly="True" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesAmount" ReadOnly="True" HeaderText="���"></asp:BoundColumn>
						<asp:BoundColumn DataField="DueAmount" ReadOnly="True" HeaderText="Ӧ�ս��"></asp:BoundColumn>
						<asp:BoundColumn DataField="PaidAmount" ReadOnly="True" HeaderText="ʵ�ս��"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecAmount" ReadOnly="True" HeaderText="Ԥ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="WaivAmount" ReadOnly="True" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundAmount" ReadOnly="True" HeaderText="�˿���"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesMemo" HeaderText="��ע" Visible="false"></asp:BoundColumn>                        
						<asp:BoundColumn DataField="IsCommisionName" HeaderText="�Ƿ�Ӷ��"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
