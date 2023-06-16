<%@ Page language="c#" Codebehind="FeesDailyCommissCrePaid.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Charges.FeesDailyCommissCrePaid" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesDailyCommissCrePaid</title>
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
						<asp:BoundColumn DataField="FlagTypeName" HeaderText="����˵��"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeeDueYearMonth" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesStateDate" HeaderText="��ʼʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesEndDate" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						
						<asp:BoundColumn DataField="PaidAmount" HeaderText="���" DataFormatString="{0:n}"></asp:BoundColumn>						
						<asp:BoundColumn DataField="LateFeeAmount" HeaderText="��ͬΥԼ��" DataFormatString="{0:n}"></asp:BoundColumn>
						
						<asp:BoundColumn DataField="UserName" HeaderText="�տ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeMode" HeaderText="�տʽ"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDate" HeaderText="ʱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="BillsSign" HeaderText="�վݺ�"></asp:BoundColumn>
						<asp:BoundColumn DataField="InvoiceBill" HeaderText="��Ʊ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="ReceMemo" HeaderText="��ע"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
