<%@ Page language="c#" Codebehind="HouseholdCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.HouseholdCreExcel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>HouseholdCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="����">
				<asp:datagrid id="DGrid" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
					AllowSorting="True" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid" Height="100%">
					<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
					<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
					<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="MemberName" HeaderText="��Ա����"></asp:BoundColumn>
						<asp:BoundColumn DataField="CyRoomSign" HeaderText="��Ա���ݱ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CyRoomName" HeaderText="��Ա��������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CustName" HeaderText="ҵ������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="yzRoomSign" HeaderText="ҵ�����ݱ��"></asp:BoundColumn>
						<asp:BoundColumn DataField="RelationshipName" HeaderText="�뻧����ϵ"></asp:BoundColumn>
						<asp:BoundColumn DataField="MobilePhone" HeaderText="�绰����"></asp:BoundColumn>
						<asp:BoundColumn DataField="PaperCode" HeaderText="֤������"></asp:BoundColumn>
						<asp:BoundColumn DataField="Memo" HeaderText="��ע"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
