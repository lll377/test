<%@ Page language="c#" Codebehind="FeesDailyCommissCrePaid.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Charges.FeesDailyCommissCrePaid" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesDailyCommissCrePaid</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>									
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkName" HeaderText="车位编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="费用名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="FlagTypeName" HeaderText="费用说明"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeeDueYearMonth" HeaderText="费用日期"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesStateDate" HeaderText="开始时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesEndDate" HeaderText="结束时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						
						<asp:BoundColumn DataField="PaidAmount" HeaderText="金额" DataFormatString="{0:n}"></asp:BoundColumn>						
						<asp:BoundColumn DataField="LateFeeAmount" HeaderText="合同违约金" DataFormatString="{0:n}"></asp:BoundColumn>
						
						<asp:BoundColumn DataField="UserName" HeaderText="收款人"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeMode" HeaderText="收款方式"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDate" HeaderText="时间"></asp:BoundColumn>
						<asp:BoundColumn DataField="BillsSign" HeaderText="收据号"></asp:BoundColumn>
						<asp:BoundColumn DataField="InvoiceBill" HeaderText="发票号"></asp:BoundColumn>
						<asp:BoundColumn DataField="ReceMemo" HeaderText="备注"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
