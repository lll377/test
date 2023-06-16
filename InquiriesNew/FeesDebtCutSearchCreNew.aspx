<%@ Page language="c#" Codebehind="FeesDebtCutSearchCreNew.aspx.cs" AutoEventWireup="false" Inherits="M_Main.InquiriesNew.FeesDebtCutSearchCreNew" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FeesDebtCutSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="FeesDebtCutSearchCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
                        <asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" HeaderText="房屋名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomPropertyRights" HeaderText="房屋产权性质"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomPropertyUses" HeaderText="房屋使用性质"></asp:BoundColumn>
                        <asp:BoundColumn DataField="StateName" ReadOnly="True" HeaderText="房屋状态"></asp:BoundColumn>
                        <asp:BoundColumn DataField="BuildName" HeaderText="楼宇名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RegionName" HeaderText="组团区域"></asp:BoundColumn>
						<asp:BoundColumn DataField="ParkName" HeaderText="车位编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkingPropertyUses" HeaderText="车位产权性质"></asp:BoundColumn>
						<asp:BoundColumn DataField="BuildArea" HeaderText="建筑面积"></asp:BoundColumn>
						<asp:BoundColumn DataField="MobilePhone" HeaderText="联系电话"></asp:BoundColumn>
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
						<asp:BoundColumn Visible="False" DataField="RefundAmount" ReadOnly="True" HeaderText="退款金额"></asp:BoundColumn>
						<asp:BoundColumn DataField="DebtsAmount" ReadOnly="True" HeaderText="欠收金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="LateFeeAmount" ReadOnly="True" HeaderText="合同违约金"></asp:BoundColumn>
						<asp:BoundColumn DataField="PrecBalance" ReadOnly="True" HeaderText="截止预交余额"></asp:BoundColumn>
						<asp:BoundColumn DataField="StatMemo" ReadOnly="True" HeaderText="代扣返回信息"></asp:BoundColumn>
						<asp:BoundColumn DataField="IsPropertyName" ReadOnly="True" HeaderText="是否垫付"></asp:BoundColumn>
						<asp:BoundColumn DataField="IsPrecName" ReadOnly="True" HeaderText="是否预收"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesMemo" ReadOnly="True" HeaderText="费用备注"></asp:BoundColumn>
						<asp:BoundColumn DataField="ArrearsTypeName" ReadOnly="True" HeaderText="欠费原因"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
