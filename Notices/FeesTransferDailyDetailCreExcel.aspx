<%@ Page language="c#" Codebehind="FeesTransferDailyDetailCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Inquiries.FeesTransferDailyDetailCreExcel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesTransferDailyDetailCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesTransferDailyDetailCreExcel" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="CustName" ReadOnly="True" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="房屋编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDate" ReadOnly="True" HeaderText="收款时间"></asp:BoundColumn>
						<asp:BoundColumn DataField="BillsSign" ReadOnly="True" HeaderText="票据号码"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesDueDate" ReadOnly="True" HeaderText="应收日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostSNum" ReadOnly="True" HeaderText="费用编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" ReadOnly="True" HeaderText="费用名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeAmount" ReadOnly="True" HeaderText="收款金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="LateFeeAmount" ReadOnly="True" HeaderText="滞纳金"></asp:BoundColumn>
						<asp:BoundColumn DataField="UserName" ReadOnly="True" HeaderText="收款人"></asp:BoundColumn>
<%--                        <asp:BoundColumn DataField="NotaxAmount" ReadOnly="True" HeaderText="不含税金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="taxAmount" ReadOnly="True" HeaderText="税额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TaxRate" ReadOnly="True" HeaderText="税率"></asp:BoundColumn>--%>
						<asp:BoundColumn DataField="FeesMemo" ReadOnly="True" HeaderText="备注"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
