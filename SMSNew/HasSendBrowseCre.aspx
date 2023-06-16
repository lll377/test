<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="HasSendBrowseCre.aspx.cs" Inherits="M_Main.SMSNew.HasSendBrowseCre" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>HasSendBrowseCre</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="HasSendBrowseCre" method="post" runat="server">
			<FONT face="宋体">
				<asp:datagrid id="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False">
					<Columns>
						<asp:BoundColumn Visible="False" DataField="SiSMSID"></asp:BoundColumn>
						<asp:BoundColumn DataField="CommName" HeaderText="项目名称"></asp:BoundColumn>
                        <asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="RoomSigns" HeaderText="房屋编号"></asp:BoundColumn>
						<asp:BoundColumn DataField="Mobile" HeaderText="手机号码"></asp:BoundColumn>
						<asp:BoundColumn DataField="Message" HeaderText="消息内容"></asp:BoundColumn>
						<asp:BoundColumn DataField="SendDate" HeaderText="发送时间"></asp:BoundColumn>			
						<asp:BoundColumn DataField="UserName" HeaderText="发送人"></asp:BoundColumn>
					</Columns>
					<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
				</asp:datagrid></FONT>
		</form>
	</body>
</HTML>

