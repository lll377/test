<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsuranceCheckManage.aspx.cs" Inherits="M_Main.OAPublicWorkNew.InsuranceCheckManage" %>
<%@ Register TagPrefix="uc1" TagName="WebOffice" Src="../UserControl/WebOffice.ascx" %>
<%@ Register TagPrefix="uc1" TagName="WorkFlowNew" Src="../UserControl/WorkFlowNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CheckLevelNew" Src="../UserControl/CheckLevelNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DivLine" Src="../UserControl/DivLine.ascx" %>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<title>人事审批</title>
        <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="../jscript/DateControl.js"></script>
		<script language="javascript" src="../jscript/JSClient.js"></script>
		<LINK href="../css/oaeditwindow.css" type="text/css" rel="stylesheet">
        <script language="javascript" src="../jscript/jquery-1.4.4.min.js" type="text/javascript"></script>
		<script language="javascript">
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

			function btnSelUserCode_OnClick()
			{
			    HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?Cmd=3&MultiLine=1&WorkInfoId=-1&random=' + Math.random(), '选择人员', false, function callback(_Data) {

			        if (_Data != '') {

			            var Ret = Cache.GetData("SelOrp.aspx_Return");
			            var obj = JSON.parse(Ret);
			            var TempUserList = "";
			            if (obj != null) {
			                var arrUserList = obj[0].split('|');
			                var arrUser = new Array();
			                for (var i = 0; i < arrUserList.length; i++) {
			                    arrUser = arrUserList[i].split(',');
			                    TempUserList = TempUserList + arrUser[1] + ",";
			                }
			                TempUserList = TempUserList.substring(0, TempUserList.length - 1);
			                document.all.AgentUserCode.value = obj[1];
			            }
			        }
			    });
            }


			function btnSelBeforeDep_OnClick() {

			    HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
			        if (_Data != '')
			        {
			            var arrRet = _Data.split(',');
			            document.all.BeforeDepart.value = arrRet[1];
			        }

			    });
			}

            function btnSelAfterDep_OnClick() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        document.all.AfterDepart.value = arrRet[1];
                    }
                });
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
		<script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
	</HEAD>
	<body onload="Win_OnLoad()">
		<form id="Form1" method="post" runat="server">
			<INPUT id="PrintParms" style="WIDTH: 24px; HEIGHT: 21px" type="hidden" size="1" name="PrintParms"
				runat="server"> <INPUT id="WorkFlowTypeId" style="WIDTH: 64px; HEIGHT: 17px" type="hidden" size="5" name="WorkFlowTypeId"
				runat="server">&nbsp;
			<br>
			<br>
			<br>
			<table class="TablebackGround" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr vAlign="top">
					<td class="TablebackGroundButton"><INPUT language="javascript" class="button_six" id="btnRemind" style="HEIGHT: 22px" onclick="DisabledBtn();"
							type="button" value="催办" runat="server" NAME="btnRemind"><INPUT language="javascript" class="button_six" id="btnJump" style="HEIGHT: 22px" onclick="DisabledBtn();"
							type="button" value="跳过" runat="server" NAME="btnJump"><INPUT class="button_six" id="btnReturn" style="HEIGHT: 22px" onclick="window.history.back();"
							type="button" value="返回列表" name="btnReturn" runat="server"><INPUT style="Z-INDEX: 0; DISPLAY: none; HEIGHT: 22px" id="BtnDealInfo" class="button_six"
							onclick="DisabledBtn();" value="会签意见" type="button" name="BtnReadOver" runat="server"><INPUT style="Z-INDEX: 0; DISPLAY: none; HEIGHT: 22px; COLOR: red" id="BtnCompleteCheckLevel"
							class="button_six" onclick="DisabledBtn();" value="批转结束" type="button" name="BtnCompleteCheckLevel" runat="server"><INPUT class="button_six" id="BtnReadOver" style="HEIGHT: 22px; COLOR: red" onclick="DisabledBtn();"
							type="button" value="会签结束" name="BtnReadOver" runat="server"><INPUT class="button_six" id="BtnReturnPrevious" style="HEIGHT: 22px" onclick="return NoPrevious();"
							type="submit" value="驳回" name="BtnReturnPrevious" runat="server"><INPUT class="button_six" id="BtnCheckNoPass" style="HEIGHT: 22px" onclick="return NoPassCheck();"
							type="submit" value="审批不通过" name="BtnCheckNoPass" runat="server"><INPUT class="button_six" id="BtnCheckPass" style="HEIGHT: 22px" onclick="DisabledBtn();"
							type="button" value="审批通过" name="BtnCheckPass" runat="server"><INPUT language="javascript" class="button_six" id="BtnIsPrint" style="HEIGHT: 22px" type="button"
							value="打印" name="BtnIsPrint" runat="server"><INPUT class="button_six" id="BtnSaveStartWorkFlow" style="HEIGHT: 22px" onclick="return checkValue();"
							type="submit" value="送审" name="btnFilter" runat="server"><INPUT class="button_six" id="BtnSaveDraft" style="HEIGHT: 22px" onclick="return checkValue();"
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
							<td class="TableTdContentCenterStyle" colSpan="4">人事审批单</td>
						</tr>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 15%"><FONT color="red">流程类别：</FONT>
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 90%" colspan="3">
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
							<td class="TableTdStyle" style="WIDTH: 15%"><FONT color="red">发&nbsp;起 人：</FONT></td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="UserName" style="WIDTH: 90%; HEIGHT: 19px"
									readOnly maxLength="50" size="22" runat="server" NAME="UserName">
							</td>
                            <td class="TableTdStyle"><FONT color="red">发起时间：</FONT></td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="WorkStartDate" style="WIDTH: 90%" maxLength="50"
									size="40" name="WorkStartDate" runat="server" readonly><FONT face="宋体" color="red"></FONT></td>
						</tr>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 15%"><FONT color="red">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</FONT></td>
							<td class="TableTdContentStyle" colSpan="3" style="HEIGHT: 8px"><INPUT class="Control_ItemInputNoStyle" id="Title" style="WIDTH: 90%" size="85" name="Title"
									runat="server">
							</td>
						</tr>
						<TR>
							<TD class="TableTdStyle" style="WIDTH: 15%"><FONT color="red">办理内容：</FONT>
							</TD>
							<TD class="TableTdContentStyle" colSpan="3"><TEXTAREA class="Control_ItemInputNoStyle" id="InfoContent" style="WIDTH: 99%; HEIGHT: 60px;font-size:12px;"
									name="InfoContent" rows="3" cols="14" runat="server"></TEXTAREA></TD>
						</TR>
						<tr>
                        <td class="TableTdStyle" style="WIDTH: 15%;color:Red;">办理部门：
							</td>
							<td class="TableTdContentStyle">
                                <INPUT class="Control_ItemInputNoStyle" 
                                    id="UseDepart" style="WIDTH: 80%; HEIGHT: 19px"
									maxLength="50" size="37" name="UseDepart" runat="server"> <INPUT class="button_sel" id="btnSelDep" style="HEIGHT: 22px" onclick="btnSelDep_OnClick();"
										type="button" value=" " name="btnSelDep" runat="server"></td>
							<td class="TableTdStyle" style="WIDTH: 15%;color:Red;">办理对象：
							</td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" 
                                    id="AgentUserCode" style="WIDTH: 80%; HEIGHT: 19px"
									maxLength="50" size="37" name="AgentUserCode" runat="server"><INPUT style="Z-INDEX: 0; HEIGHT: 22px" id="Button1" class="button_sel" onclick="btnSelUserCode_OnClick();"
									value=" " type="button" name="btnSelCost" runat="server">
							</td>
						</tr>
                       <%-- <tr>
							<td class="TableTdStyle" style="WIDTH: 15%">办理类别：
							</td>
							<td class="TableTdContentStyle" colspan="3">
                            <select runat="server" id="HandleType">
                            <option value="">请选择</option>
                            <option value="入职">入职</option>
                            <option value="转正">转正</option>
                            <option value="异动">异动</option>
                            <option value="离职">离职</option>
                            <option value="调薪">调薪</option>
                            <option value="奖励">奖励</option>
                            <option value="处罚">处罚</option>
                            <option value="加班">加班</option>
                            <option value="竞升">晋升</option>
                            <option value="降级">降级</option>
                            </select>
							</td>
						</tr>
                        <tr>
							<td class="TableTdStyle" style="WIDTH: 15%">变动前部门：
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%">
                                <INPUT class="Control_ItemInputNoStyle" id="BeforeDepart" style="WIDTH: 90%" size="89"
									name="BeforeDepart" runat="server" onclick="btnSelBeforeDep_OnClick();"></td>
							<td class="TableTdStyle" style="WIDTH: 15%">变动后部门：</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%">
                                <INPUT class="Control_ItemInputNoStyle" id="AfterDepart" 
                                    style="WIDTH: 90%" size="89"
									name="AfterDepart" runat="server" onclick="btnSelAfterDep_OnClick();"></td>
						</tr>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 15%">变动前岗位(调动填)：
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%">
                                <INPUT class="Control_ItemInputNoStyle" id="BeforeClassRole" 
                                    style="WIDTH: 90%" size="89"
									name="BeforeClassRole" runat="server">
                                    
							</td>
							<td class="TableTdStyle" style="WIDTH: 15%">变动后岗位(调动填)：</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%">
                                
                                <INPUT class="Control_ItemInputNoStyle" id="AfterClassRole" 
                                    style="WIDTH: 90%" size="89"
									name="AfterClassRole" runat="server">

							</td>
						</tr>
                        <tr>
							<td class="TableTdStyle" style="WIDTH: 15%">变动前工资：
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%">
                                <INPUT class="Control_ItemInputNoStyle" id="BeforeSalary" 
                                    style="WIDTH: 90%" size="89"
									name="BeforeSalary" runat="server"></td>
							<td class="TableTdStyle" style="WIDTH: 15%">
                                变动后工资：</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%">
                                <INPUT class="Control_ItemInputNoStyle" id="AfterSalary" 
                                    style="WIDTH: 90%" size="89"
									name="AfterSalary" runat="server"></td>
						</tr>
                       
						<tr>
							<td class="TableTdStyle" style="WIDTH: 15%">奖励性质/处罚性质/加班性质/请假性质：
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%"><SELECT id="Reward" 
                                    name="Reward" runat="server">
									<OPTION selected></OPTION>
								</SELECT><SELECT id="Punishment" name="Punishment" runat="server">
									<OPTION selected></OPTION>
								</SELECT><SELECT id="WorkOvertime" name="WorkOvertime" runat="server">
									<OPTION selected></OPTION>
								</SELECT><SELECT id="NatureList" name="NatureList" runat="server">
									<OPTION selected></OPTION>
								</SELECT></td>
							<td class="TableTdStyle" style="WIDTH: 15%">奖励金额/处罚金额/加班天数/请假天数：
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%"><INPUT class="Control_ItemInputNoStyle" id="LeaveDays" style="WIDTH: 90%" maxLength="50"
										size="45" name="LeaveDays" runat="server">
							</td>
						</tr>--%>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 15%">开始时间：
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%"><FONT face="宋体"><INPUT class="Control_ItemInputNoStyle" id="StartDate" style="WIDTH: 90%" maxLength="50"
										size="45" name="CostName" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></FONT>
							</td>
							<td class="TableTdStyle" style="WIDTH: 15%">结束时间：&nbsp;
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 30%"><INPUT class="Control_ItemInputNoStyle" id="EndDate" style="WIDTH: 90%" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
									maxLength="20" size="18" name="IssueDate" runat="server"></td>
						</tr>
						<tr>
							<td class="TableTdStyle" style="WIDTH: 15%;color:Red;">办理日期：
							</td>
							<td class="TableTdContentStyle" colspan="3"><FONT face="宋体"><INPUT class="Control_ItemInputNoStyle" id="HandleDate" style="WIDTH: 120px; HEIGHT: 19px"
										onclick="WdatePicker()" maxLength="20" size="15" name="HandleDate" runat="server"></FONT>
							</td>
						</tr>
						<tr id="Tr1" runat="server">
							<td class="TableTdStyle" style="WIDTH: 15%">相关附件：
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
							<td class="TableTdStyle" style="WIDTH: 15%">处理意见：
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
			<script type="text/javascript">
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
					$(".button_sel").attr("disabled", "true");
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
                        if (i==1)
                        {
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
			    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0012&random=" + Math.random();
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
	            if (document.all.UseDepart.value == "") {
	                window.alert("办理部门不能为空");
	                return false;
	            }
	            if (document.all.AgentUserCode.value == "") {
	                window.alert("办理对象不能为空");
	                return false;
	            }
				if(document.all.InfoContent.value=="")
				{
					window.alert("办理内容不能为空");

					return false;
				}
				if(document.all.HandleDate.value=="")
				{
					window.alert("办理日期不能为空");

					return false;
				}
				if(checkIsValidDate(document.all.HandleDate.value)==false)
				{
					window.alert("办理日期格式不对");

					return false;
				}

				if(checkSubmit()==false)return false;
				DisabledBtn();
				return true;
			}
			
			function UpFileAdjunct() {
			    var strPage = "../OAWorkFlowNew/FileAdjunct.aspx?Type=0012&KeyId=&AddFile=&random=" + Math.random();
			    var w = $(window).width();
			    var h = $(window).height();
			    HDialog.Open(w, h, strPage, '文件附件', false, function callback(_Data) {
			        if (_Data != '') {
			            document.getElementById("FileList").innerHTML = _Data;
			        }
			    });
			}

			function InsuranceChange()
			{
			    $("#Reward").css("display", "none");
			    $("#NatureList").css("display", "none");
			    $("#Punishment").css("display", "none");
			    $("#WorkOvertime").css("display", "none");

			    if ($("#HandleType").val() == "入职" || $("#HandleType").val() == "转正" || $("#HandleType").val() == "异动" || $("#HandleType").val() == "离职" || $("#HandleType").val() == "调薪") {

			        $("#LeaveDays").attr("disabled", "disabled");
			        $("#BeforeClassRole").attr("disabled", "");
			        $("#AfterClassRole").attr("disabled", "");
			        $("#BeforeDepart").attr("disabled", "");
			        $("#AfterDepart").attr("disabled", "");
			        $("#BeforeSalary").attr("disabled", "");
			        $("#AfterSalary").attr("disabled", "");
			    }
			    else {

			        $("#LeaveDays").attr("disabled", "");
			        $("#BeforeClassRole").attr("disabled", "disabled");
			        $("#AfterClassRole").attr("disabled", "disabled");
			        $("#BeforeDepart").attr("disabled", "disabled");
			        $("#AfterDepart").attr("disabled", "disabled");
			        $("#BeforeSalary").attr("disabled", "disabled");
			        $("#AfterSalary").attr("disabled", "disabled");
			    }
			    $("#Reward").css("display", "none");
			    $("#NatureList").css("display", "none");
			    $("#Punishment").css("display", "none");
			    $("#WorkOvertime").css("display", "none");

			    if ($("#HandleType").val() == "奖励") {
			        $("#Reward").css("display", "");
			    } else {
			        $("#Reward").css("display", "none");
			    }
			    if ($("#HandleType").val() == "处罚") {
			        $("#Punishment").css("display", "");
			    } else {
			        $("#Punishment").css("display", "none");
			    }
			    if ($("#HandleType").val() == "加班") {
			        $("#WorkOvertime").css("display", "");
			    } else {
			        $("#WorkOvertime").css("display", "none");
			    }
			    if ($("#HandleType").val() == "请假") {
			        $("#NatureList").css("display", "");
			    } else {
			        $("#NatureList").css("display", "none");
			    }
			}

			InsuranceChange();

			$(document).ready(function () {
			    $("#LeaveDays").attr("disabled", "disabled");
			    $("#BeforeClassRole").attr("disabled", "disabled");
			    $("#AfterClassRole").attr("disabled", "disabled");
			    $("#BeforeDepart").attr("disabled", "disabled");
			    $("#AfterDepart").attr("disabled", "disabled");
			    $("#BeforeSalary").attr("disabled", "disabled");
			    $("#AfterSalary").attr("disabled", "disabled");

			    $("#Reward").css("display", "none");
			    $("#NatureList").css("display", "none");
			    $("#Punishment").css("display", "none");
			    $("#WorkOvertime").css("display", "none");


			    $("#HandleType").change(function () {
			        if ($("#HandleType").val() == "入职" || $("#HandleType").val() == "转正" || $("#HandleType").val() == "异动" || $("#HandleType").val() == "离职" || $("#HandleType").val() == "调薪") {

			            $("#LeaveDays").attr("disabled", "disabled");
			            $("#BeforeClassRole").attr("disabled", "");
			            $("#AfterClassRole").attr("disabled", "");
			            $("#BeforeDepart").attr("disabled", "");
			            $("#AfterDepart").attr("disabled", "");
			            $("#BeforeSalary").attr("disabled", "");
			            $("#AfterSalary").attr("disabled", "");
			        }
			        else {

			            $("#LeaveDays").attr("disabled", "");
			            $("#BeforeClassRole").attr("disabled", "disabled");
			            $("#AfterClassRole").attr("disabled", "disabled");
			            $("#BeforeDepart").attr("disabled", "disabled");
			            $("#AfterDepart").attr("disabled", "disabled");
			            $("#BeforeSalary").attr("disabled", "disabled");
			            $("#AfterSalary").attr("disabled", "disabled");
			        }

			        $("#Reward").css("display", "none");
			        $("#NatureList").css("display", "none");
			        $("#Punishment").css("display", "none");
			        $("#WorkOvertime").css("display", "none");
			        
			        if ($("#HandleType").val() == "奖励") {
			            $("#Reward").css("display", "");
			        } else {

			            $("#Reward").css("display", "none");
			        }
			        if ($("#HandleType").val() == "处罚") {
			            $("#Punishment").css("display", "");
			        } else {
			            $("#Punishment").css("display", "none");
			        }
			        if ($("#HandleType").val() == "加班") {
			            $("#WorkOvertime").css("display", "");
			        } else {
			            $("#WorkOvertime").css("display", "none");
			        }
			        if ($("#HandleType").val() == "请假") {
			            $("#NatureList").css("display", "");
			        } else {
			            $("#NatureList").css("display", "none");
			        }
			    });
			});
		</script>
			<uc1:DivLine id="DivLine1" runat="server"></uc1:DivLine>
		</form>
	</body>
</HTML>