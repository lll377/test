<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Page language="c#" Codebehind="ModifyRefundReceiptsManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.ModifyRefundReceiptsManage" %>
<!DOCTYPE HTML >
<HTML>
	<HEAD>
		<title>ModifyRefundReceiptsManage</title>
		<script type="text/javascript" src="../jscript/DateControl.js"></script>
        <script type="text/javascript" src="../jscript/JSClient.js"></script>
        <script type="text/javascript" src="../jscript/ajax.js"></script>
        <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="documesssnt"></script>

        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
        <script src="../jscript/JSClient.js" type="text/javascript"></script>
        <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
        <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
        <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

        <script src="../jscript/Dialog.js" type="text/javascript"></script>
        <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
        <link href="../css/button.css" rel="stylesheet" />
        <script src="../jscript/DateFormat.js" type="text/javascript"></script>
        <script src="../jscript/format.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
		<script language="javascript">
		<!--
			function CheckData()
			{								
				return true;
			}
			
			
		//-->
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="ModifyRefundReceiptsManage" method="post" runat="server">
            <INPUT id="hiOPType" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="hiOPType"
							runat="server"> <INPUT id="RefundID" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="RefundID"
							runat="server"> <INPUT id="hiRefundDate" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="hiRefundDate"
							runat="server"><INPUT id="IsAudit" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IsAudit"
							runat="server"><INPUT id="IsDelete" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IsDelete"
							runat="server"><INPUT id="hiChargeMode" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="hiChargeMode"
							runat="server"><INPUT style="Z-INDEX: 0; WIDTH: 32px; HEIGHT: 22px" id="ModifyType" size="1" type="hidden"
							name="ModifyType" runat="server"><INPUT style="Z-INDEX: 0; WIDTH: 24px; HEIGHT: 21px" id="ReceID" size="1" type="hidden"
							name="hiRefundDate" runat="server">
			<TABLE class="DialogTable" style="width: 100%">
							<TR>
								<TD vAlign="top">
									<TABLE class="DialogTable" style="width: 100%">
										
										<TR>
											<TD class="TdTitle">客户名称</TD>
											<TD class="TdContent"><asp:label id="CustName" runat="server"></asp:label></TD>
											<TD class="TdTitle">房屋编号</TD>
											<TD class="TdContent"><asp:label id="RoomSign" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD class="TdTitle">退款凭据</TD>
											<TD class="TdContent"><asp:label id="RefundBillSNum" runat="server"></asp:label></TD>
											<TD class="TdTitle">退款日期</TD>
											<TD class="TdContent"><SELECT id="nYear1" name="nYear1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>年<SELECT id="nMonth1" name="nMonth1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>月<SELECT id="nDay1" name="nDay1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>日<SELECT id="nHour1" name="nHour1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>时<SELECT id="nMinute1" name="nMinute1" runat="server">
														<OPTION selected></OPTION>
													</SELECT>分</TD>
										</TR>
										<TR>
											<TD class="TdTitle">退款金额</TD>
											<TD class="TdContent"><asp:label id="RefundAmount" runat="server"></asp:label></TD>
											<TD class="TdTitle"><FONT style="BACKGROUND-COLOR: #eeeeee">收款方式</TD>
											<TD class="TdContent"><SELECT id="ChargeMode" onchange="CheckChargeMode();" name="ChargeMode" runat="server">
														<OPTION selected></OPTION>
													</SELECT></TD>
										</TR>
										<TR>
											<TD class="TdTitle">退 款 人</TD>
											<TD class="TdContent"><asp:label id="UserName" runat="server"></asp:label></TD>
											<TD class="TdTitle">备&nbsp;&nbsp;&nbsp; 
													注</TD>
											<TD class="TdContent">
													<asp:label id="RefundMemo" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD class="TdTitle">打印次数</TD>
											<TD class="TdContent">
												<asp:label id="PrintTimes" runat="server"></asp:label></TD>
											<TD class="TdTitle"></TD>
											<TD class="TdContent"></TD>
										</TR>
										<TR>
											<TD colSpan="4"></TD>
										</TR>
										<TR>
											<TD class="formTable_Footer" align="center" colSpan="4"><INPUT class="button" id="btnSave"  onclick="javascript:if(CheckData()==false) return false;"
													type="button" value="保存" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp; <INPUT class="button" id="btnReturn"  type="button" value="关闭" name="btnFilter"
													runat="server"></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
		</form>
	</body>
</HTML>
