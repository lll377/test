<%@ Page language="c#" Codebehind="FeesDueSearchForSerial_NewCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.CostStatist.FeesDueSearchForSerial_NewCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>NewFeesDueSecCutSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <meta http-equiv="content-type" content="application/ms-excel; charset=gb2312"/>

	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="NewFeesDueSecCutSearchCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>		
                        
                        <asp:BoundColumn DataField="RegionName"  HeaderText="组团区域"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" HeaderText="房屋名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="UserName" HeaderText="管家"></asp:BoundColumn>
                         <asp:BoundColumn DataField="OldStateName"  HeaderText="当时房屋状态" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomPropertyRights" HeaderText="房屋产权性质"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomPropertyUses" HeaderText="房屋使用性质"></asp:BoundColumn>
                      <asp:BoundColumn DataField="ActualSubDate" HeaderText="实际交房时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkName" HeaderText="车位编号"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkingPropertyUses" HeaderText="车位产权性质"></asp:BoundColumn>
                     <asp:BoundColumn DataField="ParkingActualSubDate" HeaderText="车位交付时间对方" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="BuildArea" HeaderText="建筑面积"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CostName" HeaderText="费用项目"></asp:BoundColumn>
                        <asp:BoundColumn DataField="StanName" HeaderText="标准名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesDueDate" HeaderText="费用日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="AccountsDueDate" HeaderText="应收日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesStateDate" HeaderText="开始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesEndDate" HeaderText="结束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>

                        <asp:BoundColumn DataField="StartDegree" HeaderText="起度"></asp:BoundColumn>
                        <asp:BoundColumn DataField="EndDegree" HeaderText="止度"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CalcAmount" HeaderText="数量1"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CalcAmount2" HeaderText="数量2"></asp:BoundColumn>

                        
                        <asp:BoundColumn DataField="DueAmount" HeaderText="应收金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="佣金费用" HeaderText="佣金费用"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PaidAmount" HeaderText="实收金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecPaidAmount" HeaderText="预收金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecOffset1Amount" HeaderText="预收冲抵"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecOffset2Amount" HeaderText="预存冲抵"></asp:BoundColumn>
                        <asp:BoundColumn DataField="WaivAmount" HeaderText="减免冲销"></asp:BoundColumn>

                        <asp:BoundColumn DataField="LateFeeAmount" HeaderText="实收合同违约金"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DebtsCutAmount" HeaderText="截点欠收金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="LateFeeCutAmount" HeaderText="截点合同违约金"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DebtsAmount" HeaderText="实际欠费金额"></asp:BoundColumn>

                        <asp:BoundColumn DataField="RefundAmount" HeaderText="退款金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RefundNoAmount" HeaderText="未退金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesMemo" HeaderText="备注"></asp:BoundColumn>

						
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
