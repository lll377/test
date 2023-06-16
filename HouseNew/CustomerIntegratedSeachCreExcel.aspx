<%@ Page language="c#" Codebehind="CustomerIntegratedSeachCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.CustomerIntegratedSeachCreExcel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>CustomerIntegratedSeachCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:datagrid style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 8px" id="DGrid" runat="server"
				Width="100%" AllowSorting="True" AutoGenerateColumns="False" CssClass="DataGrid" Height="100%">
				<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
				<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
				<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
				<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
				<Columns>
					<asp:BoundColumn Visible="False" DataField="CustID"></asp:BoundColumn>
                   
			
                    <asp:BoundColumn DataField="CommName" HeaderText="项目名称"></asp:BoundColumn>
                     <asp:BoundColumn DataField="LiveTypeName" HeaderText="客户类型"></asp:BoundColumn>
                     <asp:BoundColumn DataField="CustTypeName" HeaderText="客户类别"></asp:BoundColumn>
                     <asp:BoundColumn DataField="CustID" HeaderText="业主ID"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CustName" HeaderText="业主名称"></asp:BoundColumn>
				<%--	<asp:TemplateColumn HeaderText="业主名称">
						<ItemTemplate>
							<%# DataBinder.Eval(Container, "DataItem.CustName") %>'(<%# DataBinder.Eval(Container.DataItem,"RoomCount")%>)
						</ItemTemplate>
					</asp:TemplateColumn>--%>
					<asp:TemplateColumn HeaderText="房屋编号">
						<ItemStyle HorizontalAlign="Left" Width="15%"></ItemStyle>
						<ItemTemplate>
							<div id="wins" style="OVERFLOW:auto;HEIGHT:50px;width:100%"><%# DataBinder.Eval(Container.DataItem,"RoomSigns") %></div>
						</ItemTemplate>
					</asp:TemplateColumn>
                     <asp:BoundColumn DataField="NewRoomNames" HeaderText="房屋名称"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PaperNameName" HeaderText="证件类型"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="证件号码">
						<ItemTemplate>
							<%# DataBinder.Eval(Container, "DataItem.PaperCode") %>'
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="FixedTel" HeaderText="固定电话"></asp:BoundColumn>
					<asp:BoundColumn DataField="MobilePhone" HeaderText="移动电话"></asp:BoundColumn>
					<asp:BoundColumn DataField="FaxTel" HeaderText="传真电话"></asp:BoundColumn>
					<asp:BoundColumn DataField="PostCode" HeaderText="邮政编码"></asp:BoundColumn>
					<asp:BoundColumn DataField="Address" HeaderText="联系地址"></asp:BoundColumn>
					<asp:BoundColumn DataField="Recipient" HeaderText="收件人"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Job" HeaderText="工作单位"></asp:BoundColumn>
                    <asp:BoundColumn DataField="SupplierTypeName" HeaderText="供应商类别"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="信用等级">
						<ItemTemplate>
							<%# DataBinder.Eval(Container, "DataItem.MGradeSign") %>'
						</ItemTemplate>
					</asp:TemplateColumn>
                    <asp:BoundColumn DataField="Memo" HeaderText="备注"></asp:BoundColumn>
				</Columns>
				<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
			</asp:datagrid>
		</form>
	</body>
</HTML>
