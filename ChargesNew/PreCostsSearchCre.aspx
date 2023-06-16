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
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid"
					Height="100%">
					<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
					<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
					<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
					<Columns>
						<asp:BoundColumn Visible="False" DataField="PrecID" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="PrecAmount" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" ReadOnly="True" HeaderText="�ͻ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="���ݱ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" ReadOnly="True" HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="ParkNames" ReadOnly="True" HeaderText="��λ"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkName" ReadOnly="True" HeaderText="��λ���"></asp:BoundColumn>
						<asp:BoundColumn DataField="FixedTel" HeaderText="��ϵ�绰"></asp:BoundColumn>
						<asp:BoundColumn DataField="MobilePhone" HeaderText="�ƶ��绰"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecAmount" ReadOnly="True" HeaderText="Ԥ�����"></asp:BoundColumn>
						<asp:BoundColumn DataField="IsPrecName" ReadOnly="True" HeaderText="�Ƿ������"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostNames" HeaderText="��ַ�����Ŀ"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecMemo" ReadOnly="True" HeaderText="��ע"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="�����ʾ">
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
