<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HouseholdBrowseOutput.aspx.cs" Inherits="M_Main.HouseNew.HouseholdBrowseOutput" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>出入卡办理导出excel</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
        <font face="宋体">
            <asp:DataGrid ID="DGrid" Style="z-index: 101; position: absolute; top: 8px; left: 8px" runat="server"
                AllowSorting="True" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid" Height="100%">
                <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                <Columns>
                    <asp:BoundColumn DataField="CustName" HeaderText="户主名称"></asp:BoundColumn>
                    <asp:BoundColumn DataField="YzRoomSign" HeaderText="户主房号"></asp:BoundColumn>
                    <asp:BoundColumn DataField="MemberName" HeaderText="成员名称"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CyRoomSign" HeaderText="成员房号"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CyRoomName" HeaderText="成员房屋路址"></asp:BoundColumn>
                    <asp:BoundColumn DataField="RelationshipName" HeaderText="与户主关系"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PaperCode" HeaderText="成员证件号码"></asp:BoundColumn>
                    <asp:BoundColumn DataField="MobilePhone" HeaderText="成员移动电话"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CardDate" HeaderText="办卡日期" DataFormatString="{0:d}"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CardNum1" HeaderText="卡号"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CardState" HeaderText="状态"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CardGet" HeaderText="是否领取"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CardGetDate" HeaderText="领取日期" DataFormatString="{0:d}"></asp:BoundColumn>
                    <asp:BoundColumn DataField="CardGetManagers" HeaderText="领取经办人"></asp:BoundColumn>
                </Columns>
                <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
            </asp:DataGrid>
        </font>
    </form>
</body>
</html>
