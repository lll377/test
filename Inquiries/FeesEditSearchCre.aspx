<%@ Page language="c#" Codebehind="FeesEditSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Inquiries.FeesEditSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesEditSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesEditSearchCre" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="FeesID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="CustID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="CostID"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="BuildArea" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChangeDate" HeaderText="�޸�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="UserName" HeaderText="������"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChangeTypeName" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldFeesDueDate" ReadOnly="True" HeaderText="ԭ��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewFeesDueDate" ReadOnly="True" HeaderText="�ַ�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldAccountsDueDate" ReadOnly="True" HeaderText="ԭӦ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewAccountsDueDate" ReadOnly="True" HeaderText="��Ӧ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldFeesStateDate" ReadOnly="True" HeaderText="ԭ��ʼ����" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewFeesStateDate" ReadOnly="True" HeaderText="�ֿ�ʼ����" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldFeesEndDate" ReadOnly="True" HeaderText="ԭ��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewFeesEndDate" ReadOnly="True" HeaderText="�ֽ�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldDueAmount" ReadOnly="True" HeaderText="ԭӦ�ս��"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewDueAmount" ReadOnly="True" HeaderText="��Ӧ�ս��"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
