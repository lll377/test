<%@ Page language="c#" Codebehind="PublicMeterManageCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.PublicMeterManageCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>PublicMeterManageCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="PublicMeterManageCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="ScopID" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称" ReadOnly="True"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="分摊权重">
							<ItemTemplate>
								<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ShareRate") %>'>
								</asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox id="TbShareRate" runat="server" Width="120px" Text='<%# DataBinder.Eval(Container, "DataItem.ShareRate") %>'>
								</asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
