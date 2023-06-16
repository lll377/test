<%@ Page Language="c#" CodeBehind="RoomSeachCreExcel.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.RoomSeachCreExcel" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>RoomSeachCreExcel</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
        <asp:DataGrid ID="DGrid" runat="server" Width="100%" Height="100%" CssClass="DataGrid" AutoGenerateColumns="False"
            AllowSorting="True">
            <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
            <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
            <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
            <Columns>

                <asp:BoundColumn DataField="CommName" HeaderText="��Ŀ����"></asp:BoundColumn>
                <asp:BoundColumn DataField="RegionName" HeaderText="��������"></asp:BoundColumn>
                <asp:BoundColumn DataField="BuildName" HeaderText="¥������"></asp:BoundColumn>
                <asp:BoundColumn DataField="UnitSNum" HeaderText="��Ԫ"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomSign" HeaderText="���ݱ��"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomName" HeaderText="��������"></asp:BoundColumn>
                <asp:BoundColumn DataField="BuildArea" HeaderText="�������"></asp:BoundColumn>
                <asp:BoundColumn DataField="InteriorArea" HeaderText="�������"></asp:BoundColumn>
                <asp:BoundColumn DataField="GardenArea" HeaderText="��԰���"></asp:BoundColumn>
                <asp:BoundColumn DataField="YardArea" HeaderText="���������"></asp:BoundColumn>
                <asp:BoundColumn DataField="StateName" HeaderText="����״̬"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomTypeName" HeaderText="��������"></asp:BoundColumn>
                <asp:BoundColumn DataField="PropertyRights" HeaderText="��Ȩ����"></asp:BoundColumn>
                <asp:BoundColumn DataField="PropertyUses" HeaderText="ʹ������"></asp:BoundColumn>
                <asp:BoundColumn DataField="ContSubDate" HeaderText="��ͬ����ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="TakeOverDate" HeaderText="��ҵ�ӹ�ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="getHouseStartDate" HeaderText="���н���ʱ���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="getHouseEndDate" HeaderText="���н���ʱ�䵽" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="ActualSubDate" HeaderText="ʵ�ʽ���ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="FittingTime" HeaderText="װ��ʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="StayTime" HeaderText="��סʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="PayBeginDate" HeaderText="�ɷѿ�ʼʱ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="Address" HeaderText="��ϵ��ַ"></asp:BoundColumn>
                <asp:BoundColumn DataField="CustName1" HeaderText="ҵ������"></asp:BoundColumn>
                <%--<asp:BoundColumn DataField="FixedTel" HeaderText="�̶��绰"></asp:BoundColumn>--%>
                <%--<asp:BoundColumn DataField="MobilePhone" HeaderText="�ƶ��绰"></asp:BoundColumn>--%>
                <asp:BoundColumn DataField="CustName2" HeaderText="�⻧����"></asp:BoundColumn>
            </Columns>
            <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
        </asp:DataGrid>
    </form>
</body>
</html>
