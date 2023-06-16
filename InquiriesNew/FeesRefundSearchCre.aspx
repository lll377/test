<%@ Page language="c#" Codebehind="FeesRefundSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.InquiriesNew.FeesRefundSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesRefundSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesRefundSearchCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="CustName" ReadOnly="True" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="房屋编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" ReadOnly="True" HeaderText="房屋名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="BuildArea" HeaderText="建筑面积"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeDate" ReadOnly="True" HeaderText="收款时间"></asp:BoundColumn>
						<asp:BoundColumn DataField="BillsSign" ReadOnly="True" HeaderText="收据号码"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesDueDate" ReadOnly="True" HeaderText="应收日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesStateDate" ReadOnly="True" HeaderText="开始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesEndDate" ReadOnly="True" HeaderText="结束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" ReadOnly="True" HeaderText="费用名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeAmount" ReadOnly="True" HeaderText="收款金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecAmount" HeaderText="冲抵金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="LateFeeAmount" HeaderText="合同违约金"></asp:BoundColumn>
						<asp:BoundColumn DataField="ChargeUserName" ReadOnly="True" HeaderText="收款人"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundDate" ReadOnly="True" HeaderText="退款时间"></asp:BoundColumn>
						<asp:BoundColumn DataField="UserName" ReadOnly="True" HeaderText="退款人"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundAllAmount" HeaderText="已退金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundBillSNum" HeaderText="退款票号"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundMode" HeaderText="退款方式"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundMemo" ReadOnly="True" HeaderText="备注"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
