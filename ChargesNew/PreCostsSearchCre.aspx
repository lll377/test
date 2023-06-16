<%@ Page language="c#" Codebehind="PreCostsSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.PreCostsSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>PreCostsSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid"
					Height="100%">
					<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
					<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
					<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
					<Columns>
						<asp:BoundColumn Visible="False" DataField="PrecID" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="PrecAmount" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" ReadOnly="True" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="房屋编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" ReadOnly="True" HeaderText="房屋名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="ParkNames" ReadOnly="True" HeaderText="车位"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkName" ReadOnly="True" HeaderText="车位编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="FixedTel" HeaderText="联系电话"></asp:BoundColumn>
						<asp:BoundColumn DataField="MobilePhone" HeaderText="移动电话"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecAmount" ReadOnly="True" HeaderText="预交余额"></asp:BoundColumn>
						<asp:BoundColumn DataField="IsPrecName" ReadOnly="True" HeaderText="是否参与冲抵"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostNames" HeaderText="冲抵费用项目"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecMemo" ReadOnly="True" HeaderText="备注"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="余额提示">
							<ItemTemplate>
								<asp:Label id="LBHint" runat="server"></asp:Label>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid>
			</FONT>
		</form>
	</body>
</HTML>
