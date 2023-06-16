<%@ Page language="c#" Codebehind="FeesTransferDailyDetailCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Inquiries.FeesTransferDailyDetailCreExcel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesTransferDailyDetailCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesTransferDailyDetailCreExcel" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="CustName" ReadOnly="True" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="���ݱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDate" ReadOnly="True" HeaderText="�տ�ʱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="BillsSign" ReadOnly="True" HeaderText="Ʊ�ݺ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesDueDate" ReadOnly="True" HeaderText="Ӧ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostSNum" ReadOnly="True" HeaderText="���ñ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" ReadOnly="True" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeAmount" ReadOnly="True" HeaderText="�տ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="LateFeeAmount" ReadOnly="True" HeaderText="���ɽ�"></asp:BoundColumn>
						<asp:BoundColumn DataField="UserName" ReadOnly="True" HeaderText="�տ���"></asp:BoundColumn>
<%--                        <asp:BoundColumn DataField="NotaxAmount" ReadOnly="True" HeaderText="����˰���"></asp:BoundColumn>
						<asp:BoundColumn DataField="taxAmount" ReadOnly="True" HeaderText="˰��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TaxRate" ReadOnly="True" HeaderText="˰��"></asp:BoundColumn>--%>
						<asp:BoundColumn DataField="FeesMemo" ReadOnly="True" HeaderText="��ע"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
