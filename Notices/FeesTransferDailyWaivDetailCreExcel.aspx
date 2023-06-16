<%@ Page language="c#" Codebehind="FeesTransferDailyWaivDetailCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Inquiries.FeesTransferDailyWaivDetailCreExcel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesTransferDailySurplusDetailCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesTransferDailySurplusDetailCreExcel" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="IID" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="���ݱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="OffsetDate" ReadOnly="True" HeaderText="����������(�����������)"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostSNum" HeaderText="���ñ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesDueDate" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OffsetAmount" HeaderText="��ֽ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NotaxAmount" ReadOnly="True" HeaderText="����˰���"></asp:BoundColumn>
						<asp:BoundColumn DataField="taxAmount" ReadOnly="True" HeaderText="˰��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TaxRate" ReadOnly="True" HeaderText="˰��"></asp:BoundColumn>
						<asp:BoundColumn DataField="WaivMemo" HeaderText="���ⱸע"></asp:BoundColumn>

					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>