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

                <asp:BoundColumn DataField="CommName" HeaderText="项目名称"></asp:BoundColumn>
                <asp:BoundColumn DataField="RegionName" HeaderText="组团区域"></asp:BoundColumn>
                <asp:BoundColumn DataField="BuildName" HeaderText="楼宇名称"></asp:BoundColumn>
                <asp:BoundColumn DataField="UnitSNum" HeaderText="单元"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomName" HeaderText="房屋名称"></asp:BoundColumn>
                <asp:BoundColumn DataField="BuildArea" HeaderText="建筑面积"></asp:BoundColumn>
                <asp:BoundColumn DataField="InteriorArea" HeaderText="套内面积"></asp:BoundColumn>
                <asp:BoundColumn DataField="GardenArea" HeaderText="花园面积"></asp:BoundColumn>
                <asp:BoundColumn DataField="YardArea" HeaderText="地下室面积"></asp:BoundColumn>
                <asp:BoundColumn DataField="StateName" HeaderText="房屋状态"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomTypeName" HeaderText="房屋类型"></asp:BoundColumn>
                <asp:BoundColumn DataField="PropertyRights" HeaderText="产权性质"></asp:BoundColumn>
                <asp:BoundColumn DataField="PropertyUses" HeaderText="使用性质"></asp:BoundColumn>
                <asp:BoundColumn DataField="ContSubDate" HeaderText="合同交房时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="TakeOverDate" HeaderText="物业接管时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="getHouseStartDate" HeaderText="集中交房时间从" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="getHouseEndDate" HeaderText="集中交房时间到" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="ActualSubDate" HeaderText="实际交房时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="FittingTime" HeaderText="装修时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="StayTime" HeaderText="入住时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="PayBeginDate" HeaderText="缴费开始时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="Address" HeaderText="联系地址"></asp:BoundColumn>
                <asp:BoundColumn DataField="CustName1" HeaderText="业主名称"></asp:BoundColumn>
                <%--<asp:BoundColumn DataField="FixedTel" HeaderText="固定电话"></asp:BoundColumn>--%>
                <%--<asp:BoundColumn DataField="MobilePhone" HeaderText="移动电话"></asp:BoundColumn>--%>
                <asp:BoundColumn DataField="CustName2" HeaderText="租户名称"></asp:BoundColumn>
            </Columns>
            <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
        </asp:DataGrid>
    </form>
</body>
</html>
