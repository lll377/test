<%@ Page language="c#" Codebehind="MeterSearchCre.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.MeterSearchCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>MeterSearchCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="MeterSearchCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn DataField="BuildName" HeaderText="楼宇名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="LiveTypeName" HeaderText="业主/租户"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="MeterSign" HeaderText="表计编号">
							<HeaderStyle Width="80px"></HeaderStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="MeterName" HeaderText="表计名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="MeterTypeName" HeaderText="表计类型"></asp:BoundColumn>
						<asp:BoundColumn DataField="ListDate" HeaderText="抄表日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
						<asp:BoundColumn DataField="StartDegree" HeaderText="起数"></asp:BoundColumn>
						<asp:BoundColumn DataField="EndDegree" HeaderText="止数"></asp:BoundColumn>
						<asp:BoundColumn DataField="Ratio" HeaderText="变比"></asp:BoundColumn>
						<asp:BoundColumn DataField="Dosage" HeaderText="用量"></asp:BoundColumn>
						<asp:BoundColumn DataField="OldDosage" HeaderText="旧表用量"></asp:BoundColumn>
						<asp:BoundColumn DataField="ExtraDosage" HeaderText="损耗"></asp:BoundColumn>
						<asp:BoundColumn DataField="TotalDosage" HeaderText="合计用量"></asp:BoundColumn>
						<asp:BoundColumn DataField="Price" FooterText="noarr" HeaderText="单价"></asp:BoundColumn>
						<asp:BoundColumn DataField="Amount" HeaderText="金额"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
