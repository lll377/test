<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesPaymentCre.aspx.cs" Inherits="M_Main.NoticesNew.FeesPaymentCre" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>NewFeesPaymentManageCreExcel</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
            <input id="CommID" name="CommID" type="hidden" runat="server"/>

			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
                        <asp:BoundColumn DataField="CorpCostName" ReadOnly="True" HeaderText="费用大项"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CostName" ReadOnly="True" HeaderText="费用名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TotalAmount" ReadOnly="True" HeaderText="合计"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ChargeAmount" ReadOnly="True" HeaderText="实收"></asp:BoundColumn>
                         <asp:BoundColumn DataField="OffsetPrecAmount" ReadOnly="True" HeaderText="预交冲抵"></asp:BoundColumn>
                         <asp:BoundColumn DataField="RefundAmount" ReadOnly="True" HeaderText="退款"></asp:BoundColumn>
                          <asp:BoundColumn DataField="BeforePrecAmount" ReadOnly="True" HeaderText="前期预交余额"></asp:BoundColumn>
                          <asp:BoundColumn DataField="CurrPrecAmount" ReadOnly="True" HeaderText="本期预交收款"></asp:BoundColumn>
                          <asp:BoundColumn DataField="RefundPrecAmount" ReadOnly="True" HeaderText="本期预交退款"></asp:BoundColumn>
						<asp:BoundColumn DataField="OffsetPrecTotalAmount" ReadOnly="True" HeaderText="本期预交冲抵" ></asp:BoundColumn>
						<asp:BoundColumn DataField="AfterPrecAmount" ReadOnly="True" HeaderText="期末预交余额"></asp:BoundColumn>
						<asp:BoundColumn DataField="PerSurplusAmount" ReadOnly="True" HeaderText="本期零头结转"> </asp:BoundColumn>
						<asp:BoundColumn DataField="ExpenseAmount" ReadOnly="True" HeaderText="本期付款" ></asp:BoundColumn>
						<%--<asp:BoundColumn DataField="AccountDate" ReadOnly="True" HeaderText="记账时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>--%>
						
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
