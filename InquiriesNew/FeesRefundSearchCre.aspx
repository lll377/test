<%@ Page language="c#" Codebehind="FeesRefundSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.InquiriesNew.FeesRefundSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesRefundSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesRefundSearchCre" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="CustName" ReadOnly="True" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="���ݱ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" ReadOnly="True" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="BuildArea" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDate" ReadOnly="True" HeaderText="�տ�ʱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="BillsSign" ReadOnly="True" HeaderText="�վݺ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesDueDate" ReadOnly="True" HeaderText="Ӧ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesStateDate" ReadOnly="True" HeaderText="��ʼ����" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesEndDate" ReadOnly="True" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" ReadOnly="True" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeAmount" ReadOnly="True" HeaderText="�տ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecAmount" HeaderText="��ֽ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="LateFeeAmount" HeaderText="��ͬΥԼ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeUserName" ReadOnly="True" HeaderText="�տ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundDate" ReadOnly="True" HeaderText="�˿�ʱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="UserName" ReadOnly="True" HeaderText="�˿���"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundAllAmount" HeaderText="���˽��"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundBillSNum" HeaderText="�˿�Ʊ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundMode" HeaderText="�˿ʽ"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundMemo" ReadOnly="True" HeaderText="��ע"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
