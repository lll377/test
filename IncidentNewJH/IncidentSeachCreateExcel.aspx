<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentSeachCreateExcel.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentSeachCreateExcel" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>IncidentSeachCreExcel</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:DataGrid ID="DGrid" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundColumn DataField="IncidentDealStateName" HeaderText="工单状态"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentNum" HeaderText="报事编号"></asp:BoundColumn>
                <asp:BoundColumn DataField="CoordinateNum" HeaderText="派工单号"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentContent" HeaderText="报事内容"></asp:BoundColumn>
                <asp:BoundColumn DataField="Duty" HeaderText="报事责任"></asp:BoundColumn>
                <asp:BoundColumn DataField="BigTypeName" HeaderText="报事类别"></asp:BoundColumn>
                <asp:BoundColumn DataField="FineTypeName" HeaderText="原因细类"></asp:BoundColumn>
                <asp:BoundColumn DataField="DealLimit" HeaderText="处理时限(小时)"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentMode" HeaderText="报事方式"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentSource" HeaderText="报事来源"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentPlace" HeaderText="报事位置"></asp:BoundColumn>
                <asp:BoundColumn DataField="RegionalPlace" HeaderText="公区名称"></asp:BoundColumn>
                <asp:BoundColumn DataField="LocalePositionName" HeaderText="公区方位"></asp:BoundColumn>
                <asp:BoundColumn DataField="LocaleFunctionName" HeaderText="公区功能"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号"></asp:BoundColumn>
                <asp:BoundColumn DataField="RoomName" HeaderText="房屋名称"></asp:BoundColumn>
                <asp:BoundColumn DataField="CustName" HeaderText="客户名称"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentMan" HeaderText="报事人"></asp:BoundColumn>
                <asp:BoundColumn DataField="Phone" HeaderText="报事电话"></asp:BoundColumn>
                <asp:BoundColumn DataField="DealMan" HeaderText="责任人"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentMan" HeaderText="管家"></asp:BoundColumn>
                <asp:BoundColumn DataField="AdmiMan" HeaderText="受理人"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncidentDate" HeaderText="受理时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="ReserveDate" HeaderText="预约处理时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="DispDate" HeaderText="分派时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="DispMan" HeaderText="分派人"></asp:BoundColumn>
                <asp:BoundColumn DataField="ReceivingDate" HeaderText="接单时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="ArriveData" HeaderText="到场时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="MainEndDate" HeaderText="完成时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="FinishUser" HeaderText="完成人"></asp:BoundColumn>
                <asp:BoundColumn DataField="DealSituation" HeaderText="处理情况"></asp:BoundColumn>
                <asp:BoundColumn DataField="RatedWorkHour" HeaderText="额定工时"></asp:BoundColumn>
                <asp:BoundColumn DataField="KPIRatio" HeaderText="绩效系数"></asp:BoundColumn>
                <asp:BoundColumn DataField="RatedWorkHourNumber" HeaderText="完成数量"></asp:BoundColumn>
                <asp:BoundColumn DataField="IsTousu" HeaderText="是否投诉"></asp:BoundColumn>
                <asp:BoundColumn DataField="DueAmount" HeaderText="是否收费"></asp:BoundColumn>
                <asp:BoundColumn DataField="EquipmentName" HeaderText="设备名称"></asp:BoundColumn>
                <asp:BoundColumn DataField="CloseTime" HeaderText="关闭时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="CloseUser" HeaderText="关闭人"></asp:BoundColumn>
                <asp:BoundColumn DataField="CloseSituation" HeaderText="关闭情况"></asp:BoundColumn>
                <asp:BoundColumn DataField="CloseType" HeaderText="关闭类型"></asp:BoundColumn>
                <asp:BoundColumn DataField="NoNormalCloseReasons" HeaderText="非正常关闭原因"></asp:BoundColumn>
                <asp:BoundColumn DataField="IsBeoverdue" HeaderText="是否逾期"></asp:BoundColumn>
                <asp:BoundColumn DataField="IsBeoverdueHour" HeaderText="处理逾期小时"></asp:BoundColumn>
                <asp:BoundColumn DataField="OverdueReason" HeaderText="逾期原因"></asp:BoundColumn>
                <asp:BoundColumn DataField="reminderCount" HeaderText="催办"></asp:BoundColumn>
                <asp:BoundColumn DataField="ReplyContent" HeaderText="回访情况"></asp:BoundColumn>
                <asp:BoundColumn DataField="ReplyResult" HeaderText="回访结果"></asp:BoundColumn>
                <asp:BoundColumn DataField="ServiceQuality" HeaderText="回访评价"></asp:BoundColumn>
                <asp:BoundColumn DataField="ReplyDate" HeaderText="回访时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="ReplyMan" HeaderText="回访人"></asp:BoundColumn>
                <asp:BoundColumn DataField="CloseGoBackTime" HeaderText="取消完成"></asp:BoundColumn>
                <asp:BoundColumn DataField="ReplyGoBackTime" HeaderText="取消关闭"></asp:BoundColumn>
                <asp:BoundColumn DataField="DeleteDate" HeaderText="废弃时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
                <asp:BoundColumn DataField="DeleteMan" HeaderText="废弃人"></asp:BoundColumn>
                <asp:BoundColumn DataField="DeleteReasons" HeaderText="废弃原因"></asp:BoundColumn>

                
            </Columns>
            <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>

        </asp:DataGrid>&nbsp;
    </form>
</body>
</html>
