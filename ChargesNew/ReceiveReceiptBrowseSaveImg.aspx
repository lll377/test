<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiveReceiptBrowseSaveImg.aspx.cs" Inherits="M_Main.ChargesNew.ReceiveReceiptBrowseSaveImg" %>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<title>ReceiveReceiptBrowse</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache,  must-revalidate">
		<META HTTP-EQUIV="Expires" CONTENT="0">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../jscript/JSClient.js"></script>
		<script language="javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
		<SCRIPT language="JAVASCRIPT" src="../jscript/Print_buttons.js"></SCRIPT>
		<!--BUTTON-->
		<SCRIPT language="JavaScript" event="onclick()" for="cbButton">
			return onCbClickEvent(this);
		</SCRIPT>
		<Script language="javascript">
		function win_load(wj)
		{
			//var aw = parent.window.screen.availWidth;
			//var ah = parent.window.screen.availHeight;
			//self.moveTo(0,0);
			//self.resizeTo(aw, ah);
			

			var strXML = EtCell1.HttpGetText(wj);
			//或者采用
			//strXML = EtCell1.HttpPost("GetDB.asp","ID=5&Name=5");	
			EtCell1.ImportXML(strXML);
			
		}

		</Script>
	</HEAD>
	<body onload="win_load('../reports/tmp/<%=tmpwj%>')">
		<table height="100%" cellSpacing="0" cellPadding="0" width="100%">
			<tr>
				<td vAlign="top" bgColor="#ffffff">
					<table cellSpacing="2" cellPadding="2" width="100%" DESIGNTIMEDRAGDROP="19">
						<tr>
							<td vAlign="top" width="100%">
								<TABLE class="formTable" id="Table1" cellSpacing="1" cellPadding="4" align="center">
									<TR>
										<TD align="center" colSpan="4">

											<table width="100%" border="0" cellspacing="0" cellpadding="0" class="text">
												<tr>
													<td valign="top" align="left">
														<OBJECT id="EtCell1" codeBase="../include/EtCell.cab#version=3,5,0,8" height="660" width="100%"
															classid="clsid:20423C49-2276-43D5-BC6D-53829C41AEAD" VIEWASTEXT>
															<PARAM NAME="_Version" VALUE="196611">
															<PARAM NAME="_ExtentX" VALUE="19156">
															<PARAM NAME="_ExtentY" VALUE="17463">
															<PARAM NAME="_StockProps" VALUE="0">
															<PARAM NAME="FileName" VALUE="../reports/<%=tmpet%>">
															<PARAM NAME="Script" VALUE="">
															<PARAM NAME="CanSizeRow" VALUE="-1">
															<PARAM NAME="CanSizeCol" VALUE="-1">
															<PARAM NAME="Ruler" VALUE="0">
															<PARAM NAME="Rows" VALUE="10">
															<PARAM NAME="Cols" VALUE="9">
															<PARAM NAME="NotScrollRows" VALUE="0">
															<PARAM NAME="NotScrollCols" VALUE="0">
															<PARAM NAME="PrintEtCellBackColor" VALUE="0">
															<PARAM NAME="PrintCellBackColor" VALUE="-1">
															<PARAM NAME="FixedCellSelect" VALUE="0">
															<PARAM NAME="MultiSelect" VALUE="0">
															<PARAM NAME="PrintHeaderText" VALUE="">
															<PARAM NAME="PrintFooterText" VALUE="">
															<PARAM NAME="PrintHeaderLine" VALUE="0">
															<PARAM NAME="PrintFooterLine" VALUE="0">
															<PARAM NAME="PrintPageNo" VALUE="0">
															<PARAM NAME="PrintDirectH" VALUE="0">
															<PARAM NAME="PrintFullPage" VALUE="0">
															<PARAM NAME="ConnectionString" VALUE="">
															<PARAM NAME="DatabaseTableName" VALUE="">
															<PARAM NAME="DatabaseActive" VALUE="0">
															<PARAM NAME="Border3D" VALUE="0">
															<PARAM NAME="RunStartScript" VALUE="-1">
															<PARAM NAME="ReadOnly" VALUE="0">
															<PARAM NAME="DefaultLibFileName" VALUE="">
															<PARAM NAME="FocusCellShape" VALUE="0">
														</OBJECT>
													</td>
												</tr>
											</table>
										</TD>
									</TR>
								</TABLE>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>

