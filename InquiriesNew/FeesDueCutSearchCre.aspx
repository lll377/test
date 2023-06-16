<%@ Page language="c#" Codebehind="FeesDueCutSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.InquiriesNew.FeesDueCutSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesDueCutSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesDueCutSearchCre" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="FeesID"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" HeaderText="��������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PropertyRights" HeaderText="��Ȩ����"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NowStateName" HeaderText="����״̬"></asp:BoundColumn>
						<asp:BoundColumn DataField="ParkName" HeaderText="��λ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="BuildArea" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="StanName" HeaderText="��׼����"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeeDueYearMonth" ReadOnly="True" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="AccountsDueDate" ReadOnly="True" HeaderText="Ӧ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesStateDate" ReadOnly="True" HeaderText="��ʼ����" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesEndDate" ReadOnly="True" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="StartDegree" HeaderText="���"></asp:BoundColumn>
						<asp:BoundColumn DataField="EndDegree" HeaderText="ֹ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="CalcAmount" HeaderText="����1"></asp:BoundColumn>
						<asp:BoundColumn DataField="CalcAmount2" HeaderText="����2"></asp:BoundColumn>
						<asp:BoundColumn DataField="DueAmount" ReadOnly="True" HeaderText="Ӧ�ս��"></asp:BoundColumn>
						<asp:BoundColumn DataField="PaidAmount" ReadOnly="True" HeaderText="ʵ�ս��"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecAmount" ReadOnly="True" HeaderText="Ԥ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="WaivAmount" ReadOnly="True" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundAmount" ReadOnly="True" HeaderText="�˿���"></asp:BoundColumn>
						<asp:BoundColumn DataField="DebtsAmount" ReadOnly="True" HeaderText="Ƿ�ս��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="IsPrecName" ReadOnly="True" HeaderText="�Ƿ�Ԥ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesMemo" HeaderText="��ע"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
