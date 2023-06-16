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
			<FONT face="宋体">
				<asp:datagrid id="DGrid" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" runat="server"
					AllowSorting="True" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid" Height="100%">
					<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
					<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
					<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="MemberName" HeaderText="成员名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="CyRoomSign" HeaderText="成员房屋编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CyRoomName" HeaderText="成员房屋名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CustName" HeaderText="业主名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="yzRoomSign" HeaderText="业主房屋编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="RelationshipName" HeaderText="与户主关系"></asp:BoundColumn>
						<asp:BoundColumn DataField="MobilePhone" HeaderText="电话号码"></asp:BoundColumn>
						<asp:BoundColumn DataField="PaperCode" HeaderText="证件号码"></asp:BoundColumn>
						<asp:BoundColumn DataField="Memo" HeaderText="备注"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
