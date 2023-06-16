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
			<FONT face="����">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>		
                        
                        <asp:BoundColumn DataField="RegionName"  HeaderText="��������"></asp:BoundColumn>
						<asp:BoundColumn DataField="CustName" HeaderText="�ͻ�����"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomName" HeaderText="��������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="UserName" HeaderText="�ܼ�"></asp:BoundColumn>
                         <asp:BoundColumn DataField="OldStateName"  HeaderText="��ʱ����״̬" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomPropertyRights" HeaderText="���ݲ�Ȩ����"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RoomPropertyUses" HeaderText="����ʹ������"></asp:BoundColumn>
                      <asp:BoundColumn DataField="ActualSubDate" HeaderText="ʵ�ʽ���ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkName" HeaderText="��λ���"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ParkingPropertyUses" HeaderText="��λ��Ȩ����"></asp:BoundColumn>
                     <asp:BoundColumn DataField="ParkingActualSubDate" HeaderText="��λ����ʱ��Է�" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="BuildArea" HeaderText="�������"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CostName" HeaderText="������Ŀ"></asp:BoundColumn>
                        <asp:BoundColumn DataField="StanName" HeaderText="��׼����"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesDueDate" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="AccountsDueDate" HeaderText="Ӧ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesStateDate" HeaderText="��ʼ����" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesEndDate" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>

                        <asp:BoundColumn DataField="StartDegree" HeaderText="���"></asp:BoundColumn>
                        <asp:BoundColumn DataField="EndDegree" HeaderText="ֹ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CalcAmount" HeaderText="����1"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CalcAmount2" HeaderText="����2"></asp:BoundColumn>

                        
                        <asp:BoundColumn DataField="DueAmount" HeaderText="Ӧ�ս��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Ӷ�����" HeaderText="Ӷ�����"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PaidAmount" HeaderText="ʵ�ս��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecPaidAmount" HeaderText="Ԥ�ս��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecOffset1Amount" HeaderText="Ԥ�ճ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="PrecOffset2Amount" HeaderText="Ԥ����"></asp:BoundColumn>
                        <asp:BoundColumn DataField="WaivAmount" HeaderText="�������"></asp:BoundColumn>

                        <asp:BoundColumn DataField="LateFeeAmount" HeaderText="ʵ�պ�ͬΥԼ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DebtsCutAmount" HeaderText="�ص�Ƿ�ս��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="LateFeeCutAmount" HeaderText="�ص��ͬΥԼ��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DebtsAmount" HeaderText="ʵ��Ƿ�ѽ��"></asp:BoundColumn>

                        <asp:BoundColumn DataField="RefundAmount" HeaderText="�˿���"></asp:BoundColumn>
                        <asp:BoundColumn DataField="RefundNoAmount" HeaderText="δ�˽��"></asp:BoundColumn>
                        <asp:BoundColumn DataField="FeesMemo" HeaderText="��ע"></asp:BoundColumn>

						
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>
