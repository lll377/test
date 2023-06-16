<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkContactReportManage.aspx.cs" Inherits="M_Main.OAPublicWorkNew.WorkContactReportManage" %>
<%@ Register TagPrefix="uc1" TagName="WorkFlowNew" Src="../UserControl/WorkFlowNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="WebOffice" Src="../UserControl/WebOffice.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CheckLevelNew" Src="../UserControl/CheckLevelNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DivLine" Src="../UserControl/DivLine.ascx" %>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<title>工作呈报</title>
        <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="../jscript/DateControl.js"></script>
		<script type="text/javascript" src="../jscript/JSClient.js"></script>
		<LINK href="../css/oaeditwindow.css" type="text/css" rel="stylesheet">
		<script type="text/javascript">
			function Win_OnLoad()
			{				
				var strPrintParms = getObject("PrintParms").value;
				if(strPrintParms!="")
				{					
					showOperatWin(strPrintParms);
					
					getObject("PrintParms").value="";					
				}
			}
			
			function NoPrevious() {
			    if (document.all.TxtDealResult.value == "") {
			        window.alert("处理意见不能为空,请填写处理意见");
			        return false;
			    }
			    if (!IsAllowYes("驳回")) {
			        return false;
			    }
			    DisabledBtn();
			    return true;
			}

			function NoPassCheck() {
			    if (document.all.TxtDealResult.value == "") {
			        window.alert("处理意见不能为空,请填写处理意见");
			        return false;
			    }
			    if (!IsAllowYes("审批不通过")) {
			        return false;
			    }
			    DisabledBtn();
			    return true;
			}
			function IsAllowYes(txtstr) {
			    var r = window.confirm("是否确认" + txtstr);
			    if (r == true) {
			        return true;
			    } else {
			        return false;
			    }
			    return false;
			}
			
			function DisabledBtn()
			{
				if(document.all.btnRemind!=null)document.all.btnRemind.style.display='none';
				if(document.all.btnJump!=null)document.all.btnJump.style.display='none';
				if(document.all.btnReturn!=null)document.all.btnReturn.style.display='none';
				if(document.all.BtnReadOver!=null)document.all.BtnReadOver.style.display='none';
				if(document.all.BtnReturnPrevious!=null)document.all.BtnReturnPrevious.style.display='none';
				if(document.all.BtnCheckNoPass!=null)document.all.BtnCheckNoPass.style.display='none';
				if(document.all.BtnCheckPass!=null)document.all.BtnCheckPass.style.display='none';
				if(document.all.BtnIsPrint!=null)document.all.BtnIsPrint.style.display='none';
				if(document.all.BtnSaveStartWorkFlow!=null)document.all.BtnSaveStartWorkFlow.style.display='none';
				if(document.all.BtnCompleteCheckLevel!=null)document.all.BtnCompleteCheckLevel.style.display='none';
                if (document.all.BtnDealInfo != null) document.all.BtnDealInfo.style.display = 'none';
                if (document.all.BtnSaveDraft != null) document.all.BtnSaveDraft.style.display = 'none';
            }


			function btnSelDep_OnClick() {
			    var strPage = "../OAWorkFlowNew/SelOpr.aspx?Cmd=1&WorkInfoId=-1&random=" + Math.random()
			    HDialog.Open('800', '544', strPage, '选择部门', false, function callback(_Data) {

			        if (_Data != '') {

			            var Ret = Cache.GetData("SelOrp.aspx_Return");
			            var obj = JSON.parse(Ret);
			            var TempUserList = "";
			            if (obj != null) {
			                var arrUserList = obj[0].split('|');

			                var arrUser = new Array();

			                arrUser = arrUserList[0].split(',');

			                document.all.UseDepart.value = arrUser[0];
			            }
			        }
			    });
			}

		</script>
		<script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
	</HEAD>
	<body onload="Win_OnLoad()">
		<form id="Form1" method="post" runat="server">
			<INPUT id="PrintParms" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="PrintParms"
				runat="server"> <INPUT id="WorkFlowTypeId" style="WIDTH: 64px; HEIGHT: 17px" type="hidden" size="5" name="WorkFlowTypeId"
				runat="server">
			<br>
			<br>
			<br>
			<table class="TablebackGround" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr vAlign="top">
					<td class="TablebackGroundButton"><INPUT language="javascript" class="button_six" id="btnRemind" style="HEIGHT: 22px" onclick="DisabledBtn();"
							type="button" value="催办" runat="server" NAME="btnRemind"><INPUT language="javascript" class="button_six" id="btnJump" style="HEIGHT: 22px" onclick="DisabledBtn();"
							type="button" value="跳过" runat="server" NAME="btnJump"><INPUT class="button_six" id="btnReturn" style="HEIGHT: 22px" onclick="window.history.back();"
							type="button" value="返回列表" name="btnReturn" runat="server"><INPUT style="Z-INDEX: 0; DISPLAY: none; HEIGHT: 22px" id="BtnDealInfo" class="button_six"
							onclick="DisabledBtn();" value="会签意见" type="button" name="BtnDealInfo" runat="server"><INPUT style="Z-INDEX: 0; DISPLAY: none; HEIGHT: 22px; COLOR: red" id="BtnCompleteCheckLevel"
							class="button_six" onclick="DisabledBtn();" value="批转结束" type="button" name="BtnCompleteCheckLevel" runat="server"><INPUT class="button_six" id="BtnReadOver" style="HEIGHT: 22px; COLOR: red" onclick="DisabledBtn();"
							type="button" value="会签结束" name="BtnReadOver" runat="server"><INPUT class="button_six" id="BtnReturnPrevious" style="HEIGHT: 22px" onclick="return NoPrevious();"
							type="submit" value="驳回" name="BtnReturnPrevious" runat="server"><INPUT class="button_six" id="BtnCheckNoPass" style="HEIGHT: 22px" onclick="return NoPassCheck();"
							type="submit" value="审批不通过" name="BtnCheckNoPass" runat="server"><INPUT class="button_six" id="BtnCheckPass" style="HEIGHT: 22px" onclick="DisabledBtn();"
							type="button" value="审批通过" name="BtnCheckPass" runat="server"><INPUT language="javascript" class="button_six" id="BtnIsPrint" style="HEIGHT: 22px" type="button"
							value="打印" name="BtnIsPrint" runat="server"><INPUT class="button_six" id="BtnSaveStartWorkFlow" style="HEIGHT: 22px" onclick="return checkValue();"
							type="submit" value="呈报" name="btnFilter" runat="server"><INPUT class="button_six" id="BtnSaveDraft" style="HEIGHT: 22px" onclick="return checkValue();"
							type="submit" value="保存草稿" name="BtnSaveDraft" runat="server">
					</td>
				</tr>
			</table>
			<DIV class="ContentButtonDiv" id="DvFrame">
				<DIV class="ContentButtonUp" id="Dv1" onclick="SetStyle(this)">基本信息</DIV>
				<DIV class="ContentButtonUp" id="Dv2" onclick="SetStyle(this)">详细信息</DIV>
				<DIV class="ContentButtonUp" id="Dv4" onclick="SetStyle(this);FileCheckLevelList();"><font color="red">文件批转</font></DIV>
			</DIV>
			<DIV class="ContentWindow" style="height:auto;">
				<DIV id="WorkInfoDv1">
					<table class="TableStyle" id="TableFrame" cellSpacing="1" cellPadding="1" width="95%" align="center"
						bgColor="#cccccc">
						<tr>
							<td class="TableTdContentCenterStyle" colSpan="4">工作呈报单</td>
						</tr>
						<tr>
                            <td class="TableTdStyle"><FONT color="red">流程类别：</FONT>
							</td>
							<td class="TableTdStyle" style="WIDTH: 12%" colspan="3">
                                <table style="WIDTH:100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="90%"><input class="Control_ItemInputNoStyle" id="WorkFlowType" style="HEIGHT: 22px; WIDTH: 100%"
										readOnly maxLength="50" size="30" name="CostName" runat="server">
										</td>
										<td align="right">
                                            <input class="button_sel" id="FileTypeSel" title="选择流程类别" style="HEIGHT: 22px" onclick="SelWorkFlowType();"
										type="button" value=" " name="btnSelCost" runat="server"></td>
									</tr>
								</table>
							</td>

						</tr>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 12%"><FONT color="red">发 起 人：</FONT></td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="UserName" style="WIDTH: 90%; HEIGHT: 19px"
									readOnly maxLength="50" size="22" runat="server" name="UserName">
							</td>
                            <td class="TableTdStyle" style="WIDTH: 12%"><FONT color="red">发起时间：</FONT></td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="WorkStartDate" style="WIDTH: 90%" maxLength="50"
									size="40" name="WorkStartDate" runat="server" readonly><FONT face="宋体" color="red"></FONT></td>
						</tr>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 12%"><FONT color="red">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</FONT></td>
							<td class="TableTdContentStyle" style="HEIGHT: 8px" colspan="3"><INPUT class="Control_ItemInputNoStyle" id="Title" style="WIDTH: 90%" size="85" name="CostName"
									runat="server">
							</td>
						</tr>
						<TR>
							<TD class="TableTdStyle" style="WIDTH: 12%; HEIGHT: 52px"><FONT color="red">工作内容：</FONT>
							</TD>
							<TD class="TableTdContentStyle" colSpan="3" style="HEIGHT: 52px"><TEXTAREA class="Control_ItemInputNoStyle" id="InfoContent" style="WIDTH: 99%; HEIGHT: 70px;font-size:12px;"
									name="InfoContent" rows="4" cols="85" runat="server"></TEXTAREA></TD>
						</TR>
						<TR>
							<TD class="TableTdStyle" style="WIDTH: 12%">呈报说明：
							</TD>
							<TD class="TableTdContentStyle" colSpan="3"><TEXTAREA class="Control_ItemInputNoStyle" id="ReportExplain" style="WIDTH: 99%; HEIGHT: 60px;font-size:12px;"
									type="text" size="85" name="CostName" runat="server"></TEXTAREA>
							</TD>
						</TR>
                        <tr>
							<td class="TableTdStyle" style="WIDTH: 12%"><FONT color="red">呈报部门：</FONT>
							</td>
							<td class="TableTdContentStyle">
                                <INPUT class="Control_ItemInputNoStyle" 
                                    id="UseDepart" style="WIDTH: 70%" 
									size="18" runat="server" name="UseDepart">&nbsp; <INPUT class="button_sel" id="btnSelDep0" 
                                    style="HEIGHT: 22px" onclick="btnSelDep_OnClick();"
										type="button" value=" " name="btnSelDep0" runat="server">
							</td>
							<td class="TableTdStyle" style="WIDTH: 12%;color:Red;">呈报人：</td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle"  id="UseUser" style="WIDTH: 90%" maxLength="50" size="40" name="UseUser" runat="server" readonly></td>
						</tr>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 12%"><FONT color="red">呈报时间：</FONT>
							</td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="ReportDate" style="WIDTH: 90%" onclick="WdatePicker()"
									maxLength="20" size="18" runat="server" NAME="ReportDate">
							</td>
							<td class="TableTdStyle" style="WIDTH: 12%">缓急程度：</td>
							<td class="TableTdContentStyle"><FONT face="宋体" color="red"><asp:dropdownlist id="ContactNervousList" runat="server"></asp:dropdownlist></FONT></td>
						</tr>
						<tr id="Tr1" runat="server">
							<td class="TableTdStyle" style="WIDTH: 12%">相关附件：
							</td>
							<td class="TableTdContentStyle" colSpan="3">
								<table style="WIDTH: 100%" cellSpacing="0" cellPadding="0" border="0">
									<tr>
										<td width="90%">
											<div id="FileList" runat="server"></div>
										</td>
										<td vAlign="top" align="right"><INPUT class="button_sel" id="BtUpFileAdjunct" title="上传附件" style="HEIGHT: 22px" onclick="UpFileAdjunct();"
												type="button" value=" " name="btnSelCost" runat="server"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="SignContent">
							<td class="TableTdStyle" style="WIDTH: 12%">处理意见：
							</td>
							<td class="TableTdContentStyle" colSpan="3">
                                <table style="WIDTH:100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="96%">
                                            <textarea class="Control_ItemInputNoStyle" id="TxtDealResult"  style="HEIGHT: 80px; WIDTH: 100%"
										name="TxtDealResult" runat="server"></textarea>
										</td>
										<td align="right">
                                            <input class="button_sel" id="SelUsualPhase" title="选择常用短语" style="HEIGHT: 22px"
										type="button" value=" " name="SelUsualPhase" onclick="SelUsual();" runat="server"></td>
									</tr>
								</table>
							</td>
						</tr>
                        <tr>
							<td class="TableTdContentCenterStyle" colSpan="4">流程信息</td>
						</tr>
                        <tr>
                            <td colspan="4" style="background-color:#ffffff;padding:4px;"><uc1:WorkFlowNew id="WorkFlowManage" runat="server"></uc1:WorkFlowNew></td>
                        </tr>
						<tr>
							<td class="TableTdContentCenterStyle" colSpan="4">会签/审批信息</td>
						</tr>
						<tr>
							<td class="TableTdContentStyle" colSpan="4">
								<div id="WorkContent">
								<asp:repeater id="WorkFlowRecord" runat="server">
									<ItemTemplate>
										<div>
											<%#DataBinder.Eval(Container.DataItem,"RecordUserName").ToString()%>
											<%#DataBinder.Eval(Container.DataItem,"WorkDate").ToString()%>
											<%#DataBinder.Eval(Container.DataItem,"RecordContent").ToString()%>
										</div>
									</ItemTemplate>
								</asp:repeater>
								</div>
								<asp:label id="TempMsg" runat="server"></asp:label></td>
						</tr>
					</table>
				</DIV>
				<DIV id="WorkInfoDv2"><uc1:weboffice id="WebOfficeManage" runat="server"></uc1:weboffice></DIV>
				<DIV id="WorkInfoDv4"><uc1:CheckLevelNew id="CheckLevelInfo" runat="server"></uc1:CheckLevelNew></DIV>
			</DIV>
			<br>
			<br>
			<br>
			<script language="javascript">
			    function SelUsual() {
			        var strPage = "../DialogNew/SelDictionary.aspx?DictionarySort=UsualShortPhrase&random=" + Math.random();
			        HDialog.Open('500', '500', strPage, '选择常用短语', false, function callback(_Data) {
			            if (_Data != '') {
			                var obj = JSON.parse(_Data);
			                $("#TxtDealResult").val(obj.DictionaryName);
			            }
			        });
			    }
			function GetElements(obj,tag,result)
			{
				if(!result)
				{
					var result = new Array();
				}
				
				if(obj)
				{
					if(obj.tagName==tag)
					{
						result[result.length] = obj;
					}
					if(obj.children)
					{
						for(var i=0;i!=obj.children.length;i++)
						{
							result = GetElements(obj.children[i],tag,result);
						}
					}
				}
				return result;
			}

			function SetStyle(Dv)
			{
			    if (Dv.id == 'Dv2') {
			        OpenWebOffice();
			        return;
			    }

				var elements=GetElements(document.getElementById("DvFrame"),'DIV');
			  
				for(var i=0;i<elements.length;i++)   
				{   
					if(elements[i].id!='DvFrame')
					{
						if(elements[i]==Dv)
						{
							elements[i].className='ContentButtonDown';
							document.getElementById('WorkInfo'+elements[i].id).style.display='';
							
						}
						else
						{
							elements[i].className='ContentButtonUp';
							document.getElementById('WorkInfo'+elements[i].id).style.display='none';
						}
					}
				}
				if(Dv.id=='Dv2')
				{
					window.scrollTo(0,1);
					window.scrollTo(0,0);
				}
			}

			SetStyle(document.getElementById("Dv1"));
			
			function SetReadOnly()
			{
				if(document.all.WorkFlowManage_TxtFlowSort.value!="0" || document.all.WorkFlowManage_TxtWorkFlowIsComplete.value=="2" ||document.all.WorkFlowManage_TxtStartUser.value!=document.all.WorkFlowManage_LoginCode.value)
				{
					var elements=GetElements(document.getElementById("TableFrame"),'INPUT');
					for(var i=0;i<elements.length;i++)   
					{   
					    elements[i].readOnly = 'true';
					}
					$(".button_sel").prop("disabled", "true");
					var elements=GetElements(document.getElementById("TableFrame"),'SELECT');
					for(var i=0;i<elements.length;i++)   
					{   
						elements[i].disabled='true';
					}
					var elements=GetElements(document.getElementById("TableFrame"),'BUTTON');
					for(var i=0;i<elements.length;i++)   
					{   
						elements[i].disabled='true';
					}
					var elements=GetElements(document.getElementById("TableFrame"),'TEXTAREA');
					for(var i=0;i<elements.length;i++)   
                    {   
                        if (i == 2) {
                            //elements[i].readOnly = 'false';
                        } else
                        {
                            elements[i].readOnly = 'true';
                        }
					    
					}
				}
				if(document.all.WorkFlowManage_TxtIsOpr.value=="1" && document.all.WorkFlowManage_TxtBtnCheckPass.value=="1")
				{
				    //document.all.TxtDealResult.readOnly = '';
				    document.all.SelUsualPhase.disabled = '';
				    document.all.WorkFlowManage_btnSelDep.disabled = '';
				}
				else
				{
					document.all.SignContent.style.display='none';
				}
				
				if (document.all.WorkFlowManage_TxtIsOpr.value == "1" || document.all.WorkFlowManage_TxtAdminControl.value == "1")
				{
				    //document.all.TxtDealResult.readOnly = '';
				    document.all.SelUsualPhase.disabled = '';
				    document.all.SignContent.style.display = '';
				    document.all.WorkFlowManage_btnSelDep.disabled = '';
				}
			    //如果是批转的就隐藏审批通过按钮
				if (document.all.WorkFlowManage_TxtCheckLevelIsOpr.value == "1") {
				    document.all.BtnCheckPass.style.display = 'none';
				}
			}

			SetReadOnly();

			function SelWorkFlowType() {
			    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0010&random=" + Math.random();
			    HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
			        if (_Data != '') {
			            var obj = JSON.parse(_Data);
			            LoadTemplateData(obj[0].Trim(), obj[2].Trim());
			            if (obj[3] != '') {
			                var ExtName = GetExtName(obj[3].toString());
			                OpenDoc(obj[3].toString(), ExtName);
			            }
			            document.all.WorkFlowType.value = obj[1].toString();
			            document.all.WorkFlowTypeId.value = obj[0].toString();
			        }
			        SetStyle(document.getElementById("Dv1"));
			    });
			}

			function checkValue()
			{
				if(document.all.WorkFlowTypeId.value=="")
				{
					window.alert("请选择流程类别");
					return false;
				}
				if(document.all.Title.value=="")
				{
					window.alert("标题不能为空");

					return false;
				}
				if(document.all.InfoContent.value=="")
				{
					window.alert("呈报内容不能为空");

					return false;
	            }
	            if (document.all.UseDepart.value == "") {
	                window.alert("呈报部门不能为空");

	                return false;
	            }
	            if (document.all.UseUser.value == "") {
	                window.alert("呈报人不能为空");
	                return false;
	            }
	            
				if(document.all.ReportDate.value=="")
				{
					window.alert("呈报日期不能为空");

					return false;
				}
				if(checkIsValidDate(document.all.ReportDate.value)==false)
				{
					window.alert("呈报日期格式不对");

					return false;
				}

				if(checkSubmit()==false)return false;
				DisabledBtn();
				return true;
			}
			
			function UpFileAdjunct() {
			    var strPage = "../OAWorkFlowNew/FileAdjunct.aspx?Type=0010&KeyId=&AddFile=&random=" + Math.random();
			    var w = $(window).width();
			    var h = $(window).height();
			    HDialog.Open(w, h, strPage, '文件附件', false, function callback(_Data) {
                    if (_Data != '') {
			            document.getElementById("FileList").innerHTML = _Data;
			        }
			    });
			}
			
			</script>
			<uc1:DivLine id="DivLine1" runat="server"></uc1:DivLine>
		</form>
	</body>
</HTML>
