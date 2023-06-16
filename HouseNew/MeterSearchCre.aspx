<%@ Page language="c#" Codebehind="MeterSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.MeterSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>MeterSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="MeterSearchCre" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="BuildName" HeaderText="¥������"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="LiveTypeName" HeaderText="ҵ��/�⻧"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="MeterSign" HeaderText="��Ʊ��">
							<HeaderStyle Width="80px"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="MeterName" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="MeterTypeName" HeaderText="�������"></asp:BoundColumn>
						<asp:BoundColumn DataField="ListDate" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="StartDegree" HeaderText="����"></asp:BoundColumn>
						<asp:BoundColumn DataField="EndDegree" HeaderText="ֹ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="Ratio" HeaderText="���"></asp:BoundColumn>
						<asp:BoundColumn DataField="Dosage" HeaderText="����"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldDosage" HeaderText="�ɱ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="ExtraDosage" HeaderText="���"></asp:BoundColumn>
						<asp:BoundColumn DataField="TotalDosage" HeaderText="�ϼ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="Price" FooterText="noarr" HeaderText="����"></asp:BoundColumn>
						<asp:BoundColumn DataField="Amount" HeaderText="���"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
