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
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="FeesID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="CustID"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="CostID"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="BuildArea" HeaderText="建筑面积"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="费用名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChangeDate" HeaderText="修改日期"></asp:BoundColumn>
						<asp:BoundColumn DataField="UserName" HeaderText="操作人"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChangeTypeName" HeaderText="操作类别"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldFeesDueDate" ReadOnly="True" HeaderText="原费用日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewFeesDueDate" ReadOnly="True" HeaderText="现费用日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldAccountsDueDate" ReadOnly="True" HeaderText="原应收日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewAccountsDueDate" ReadOnly="True" HeaderText="现应收日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldFeesStateDate" ReadOnly="True" HeaderText="原开始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewFeesStateDate" ReadOnly="True" HeaderText="现开始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldFeesEndDate" ReadOnly="True" HeaderText="原结束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewFeesEndDate" ReadOnly="True" HeaderText="现结束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldDueAmount" ReadOnly="True" HeaderText="原应收金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="NewDueAmount" ReadOnly="True" HeaderText="现应收金额"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
