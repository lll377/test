<%@ Page language="c#" Codebehind="FeesTransferDailyPrecDetailCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.Inquiries.FeesTransferDailyPrecDetailCreExcel" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesTransferDailyPrecDetailCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesTransferDailyPrecDetailCreExcel" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="RecdID" ReadOnly="True"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" ReadOnly="True" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="房屋编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDate" ReadOnly="True" HeaderText="预交登记时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="BillsSign" ReadOnly="True" HeaderText="票据号码"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" ReadOnly="True" HeaderText="冲抵费用项目"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeAmount" ReadOnly="True" HeaderText="预交金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="UserName" ReadOnly="True" HeaderText="预交操作人"></asp:BoundColumn>
                         <asp:BoundColumn DataField="NotaxAmount" ReadOnly="True" HeaderText="不含税金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="taxAmount" ReadOnly="True" HeaderText="税额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TaxRate" ReadOnly="True" HeaderText="税率"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesMemo" ReadOnly="True" HeaderText="备注"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
