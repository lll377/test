<%@ Page language="c#" Codebehind="FeesTransferDailyWaivDetailCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Inquiries.FeesTransferDailyWaivDetailCreExcel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesTransferDailySurplusDetailCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesTransferDailySurplusDetailCreExcel" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="IID" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="房屋编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="OffsetDate" ReadOnly="True" HeaderText="减免冲抵日期(或撤销冲抵日期)"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostSNum" HeaderText="费用编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="费用名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesDueDate" HeaderText="费用日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="OffsetAmount" HeaderText="冲抵金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NotaxAmount" ReadOnly="True" HeaderText="不含税金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="taxAmount" ReadOnly="True" HeaderText="税额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TaxRate" ReadOnly="True" HeaderText="税率"></asp:BoundColumn>
						<asp:BoundColumn DataField="WaivMemo" HeaderText="减免备注"></asp:BoundColumn>

					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
