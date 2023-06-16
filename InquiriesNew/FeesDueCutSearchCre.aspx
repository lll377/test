<%@ Page language="c#" Codebehind="FeesDueCutSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.InquiriesNew.FeesDueCutSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesDueCutSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesDueCutSearchCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="FeesID"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" HeaderText="房屋名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PropertyRights" HeaderText="产权性质"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NowStateName" HeaderText="交房状态"></asp:BoundColumn>
						<asp:BoundColumn DataField="ParkName" HeaderText="车位编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="BuildArea" HeaderText="建筑面积"></asp:BoundColumn>
						<asp:BoundColumn DataField="CostName" HeaderText="费用名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="StanName" HeaderText="标准名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeeDueYearMonth" ReadOnly="True" HeaderText="费用日期"></asp:BoundColumn>
						<asp:BoundColumn DataField="AccountsDueDate" ReadOnly="True" HeaderText="应收日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesStateDate" ReadOnly="True" HeaderText="开始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesEndDate" ReadOnly="True" HeaderText="结束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="StartDegree" HeaderText="起度"></asp:BoundColumn>
						<asp:BoundColumn DataField="EndDegree" HeaderText="止度"></asp:BoundColumn>
						<asp:BoundColumn DataField="CalcAmount" HeaderText="数量1"></asp:BoundColumn>
						<asp:BoundColumn DataField="CalcAmount2" HeaderText="数量2"></asp:BoundColumn>
						<asp:BoundColumn DataField="DueAmount" ReadOnly="True" HeaderText="应收金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="PaidAmount" ReadOnly="True" HeaderText="实收金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecAmount" ReadOnly="True" HeaderText="预交冲抵"></asp:BoundColumn>
						<asp:BoundColumn DataField="WaivAmount" ReadOnly="True" HeaderText="减免冲销"></asp:BoundColumn>
						<asp:BoundColumn DataField="RefundAmount" ReadOnly="True" HeaderText="退款金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="DebtsAmount" ReadOnly="True" HeaderText="欠收金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="IsPrecName" ReadOnly="True" HeaderText="是否预收"></asp:BoundColumn>
						<asp:BoundColumn DataField="FeesMemo" HeaderText="备注"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
