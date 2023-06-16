<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendCarManage.aspx.cs" Inherits="M_Main.OAPublicWorkNew.SendCarManage" %>
<%@ Register TagPrefix="uc1" TagName="WorkFlowNew" Src="../UserControl/WorkFlowNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="WebOffice" Src="../UserControl/WebOffice.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DivLine" Src="../UserControl/DivLine.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CheckLevelNew" Src="../UserControl/CheckLevelNew.ascx" %>
<HTML>
	<HEAD>
		<title>派车申请</title>
        <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="../jscript/DateControl.js"></script>
		<script type="text/javascript" src="../jscript/TimeControl.js"></script>
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
		<script  type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
	</HEAD>
	<body onload="Win_OnLoad()">
		<form id="Form1" method="post" runat="server">
			<INPUT id="PrintParms" style="HEIGHT: 21px; WIDTH: 24px" type="hidden" size="1" name="PrintParms"
				runat="server"> <INPUT id="HiddenUserCode" style="HEIGHT: 21px; WIDTH: 24px" type="hidden" size="1" name="PrintParms"
				runat="server"> <INPUT id="WorkFlowTypeId" style="HEIGHT: 17px; WIDTH: 64px" size="5" name="WorkFlowTypeId"
				runat="server" type="hidden">
			<br>
			<br>
			<br>
			<table class="TablebackGround" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr vAlign="top">
					<td class="TablebackGroundButton"><INPUT language="javascript" class="button_six" id="btnRemind" style="HEIGHT: 22px" type="button"
							value="催办" runat="server" onclick="DisabledBtn();" NAME="btnRemind"><INPUT language="javascript" class="button_six" id="btnJump" style="HEIGHT: 22px" type="button"
							value="跳过" runat="server" NAME="btnJump"><INPUT class="button_six" id="btnReturn" style="HEIGHT: 22px" onclick="window.history.back();"
							type="button" value="返回列表" runat="server" NAME="btnReturn"><INPUT style="HEIGHT: 22px; Z-INDEX: 0; DISPLAY: none" id="BtnDealInfo" class="button_six"
							onclick="DisabledBtn();" value="会签意见" type="button" name="BtnReadOver" runat="server"><INPUT style="HEIGHT: 22px; COLOR: red; Z-INDEX: 0; DISPLAY: none" id="BtnCompleteCheckLevel"
							class="button_six" onclick="DisabledBtn();" value="批转结束" type="button" name="BtnCompleteCheckLevel" runat="server"><INPUT class="button_six" id="BtnReadOver" style="HEIGHT: 22px; COLOR: red" type="button"
							value="会签结束" runat="server" NAME="BtnReadOver" onclick="DisabledBtn();"><INPUT class="button_six" id="BtnReturnPrevious" style="HEIGHT: 22px" type="submit" value="驳回"
							runat="server" NAME="BtnReturnPrevious" onclick="return NoPrevious();"><INPUT class="button_six" id="BtnCheckNoPass" style="HEIGHT: 22px" type="button" value="审批不通过"
							onclick="return NoPassCheck();" runat="server" NAME="BtnCheckNoPass"><INPUT class="button_six" id="BtnCheckPass" style="HEIGHT: 22px" type="button" value="审批通过"
							runat="server" NAME="BtnCheckPass" onclick="DisabledBtn();"><INPUT language="javascript" class="button_six" id="BtnIsPrint" style="HEIGHT: 22px" type="button"
							value="打印" runat="server" NAME="BtnIsPrint"><INPUT class="button_six" id="BtnSaveStartWorkFlow" style="HEIGHT: 22px" onclick="return checkValue();"
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
					<table class="TableStyle" id="TableFrame" width="95%" cellSpacing="1" cellPadding="1" align="center"
						bgColor="#cccccc">
						<tr>
							<td class="TableTdContentCenterStyle" colSpan="4">派车审批单</td>
						</tr>
						<tr>
							<td class="TableTdStyle"><font style="color:red">流程类别：</font>
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
							<td class="TableTdStyle"><font style="color:red">发 起 人：</font>
							</td>
							<td class="TableTdContentStyle"><FONT face="宋体"><INPUT class="Control_ItemInputNoStyle" id="UserName" style="WIDTH: 90%" readOnly maxLength="50"
										size="31" name="CostName" runat="server"></FONT>
							</td>
                            <td class="TableTdStyle"><FONT color="red">发起时间：</FONT></td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="WorkStartDate" style="WIDTH: 90%" maxLength="50"
									size="40" name="WorkStartDate" runat="server" readonly><FONT face="宋体" color="red"></FONT></td>
						</tr>
						<tr>
							<td class="TableTdStyle"><FONT color="red">用车说明：</FONT>
							</td>
							<td class="TableTdContentStyle" colspan="3"><FONT face="宋体" color="red">
                                <INPUT class="Control_ItemInputNoStyle" id="UseMark" style="WIDTH: 90%" 
                                    size="31" name="UseMark"
										runat="server"><FONT face="宋体" color="red"></FONT></FONT></FONT></td>
						</tr>

                        <tr>
							<td class="TableTdStyle"><FONT color="red">用车部门：</FONT>
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 263px"><FONT face="宋体">
                                <INPUT class="Control_ItemInputNoStyle" id="UseDepart" style="WIDTH: 90%" maxLength="50"
										size="85" name="CostName" runat="server"><INPUT class="button_sel" id="btnSelDep0" 
                                    style="HEIGHT: 22px" onclick="btnSelDep_OnClick();"
										type="button" value=" " name="btnSelDep0" runat="server"></FONT></td>
							<td class="TableTdStyle">&nbsp;乘员人数：
							</td>
							<td class="TableTdContentStyle"><FONT face="宋体">
                                <INPUT class="Control_ItemInputNoStyle" id="Quantity" style="WIDTH: 90%" 
                                    maxLength="50" size="29"
										name="CostName" runat="server"> </FONT>
							</td>
						</tr>

						<tr>
							<td class="TableTdStyle"><FONT color="red">使&nbsp; 用 人：</FONT>
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 263px"><FONT face="宋体"><INPUT class="Control_ItemInputNoStyle" id="UseCarMan" style="WIDTH: 90%" maxLength="50"
										size="85" name="CostName" runat="server"></FONT></td>
							<td class="TableTdStyle">&nbsp;<FONT color="red">起止地点：</FONT>
							</td>
							<td class="TableTdContentStyle"><FONT face="宋体">
                                <INPUT class="Control_ItemInputNoStyle" id="Place" style="WIDTH: 90%" 
                                    maxLength="50" size="29"
										name="Place" runat="server"> </FONT>
							</td>
						</tr>
						<tr>
							<td class="TableTdStyle"><FONT color="red">开始时间：</FONT>
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 263px"><INPUT class="Control_ItemInputNoStyle" id="StartDate" style="WIDTH: 90%" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
									maxLength="20" size="5" name="StartDate" runat="server" readOnly><FONT face="宋体">&nbsp;</FONT></td>
							<td class="TableTdStyle"><FONT color="red">结束时间：</FONT>
							</td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="EndDate" style="WIDTH: 90%" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
									maxLength="20" size="18" name="EndDate" runat="server" readOnly><FONT face="宋体">&nbsp;</FONT>
							</td>
						</tr>
						<tr>
							<td class="TableTdStyle">驾驶人员：
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 263px"><FONT face="宋体">
                                <INPUT class="Control_ItemInputNoStyle" id="OprUser" style="WIDTH: 90%" maxLength="50"
										size="45" name="OprUser" runat="server"></FONT>
							</td>
							<td class="TableTdStyle"><FONT color="red">车牌号码：</FONT>
							</td>
							<td class="TableTdContentStyle"><INPUT class="Control_ItemInputNoStyle" id="CarNum" 
                                    style="WIDTH: 90%" maxLength="50" size="31"
									name="CarNum" runat="server">
							</td>
						</tr>
						<tr>
							<td class="TableTdStyle"><FONT color="red">里程数：</FONT>
							</td>
							<td class="TableTdContentStyle" style="WIDTH: 263px"><FONT face="宋体">
                                <INPUT class="Control_ItemInputNoStyle" id="Mileage" style="WIDTH: 90%" maxLength="50"
										size="45" name="Mileage" runat="server"></FONT>
							</td>
							<td class="TableTdStyle">
							</td>
						</tr>
						<tr id="Tr1" runat="server">
							<td class="TableTdStyle">相关附件：
							</td>
							<td class="TableTdContentStyle" colSpan="3">
								<table style="WIDTH:100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="90%"><div id="FileList" runat="server"></div>
										</td>
										<td align="right" valign="top"><INPUT class="button_sel" id="BtUpFileAdjunct" title="上传附件" style="HEIGHT: 22px" onclick="UpFileAdjunct();"
												type="button" value=" " name="btnSelCost" runat="server"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="SignContent">
							<td class="TableTdStyle">处理意见：
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
				<DIV id="WorkInfoDv2" style="height:auto;width:auto;"><uc1:weboffice id="WebOfficeManage" runat="server"></uc1:weboffice></DIV>
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
				}
				if(document.all.WorkFlowManage_TxtIsOpr.value=="1" && document.all.WorkFlowManage_TxtBtnCheckPass.value=="1")
				{
				    document.all.OprUser.readOnly = '';
					document.all.CarNum.readOnly = '';
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
			    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0008&random=" + Math.random();
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
				if(document.all.UseMark.value=="")
				{
					window.alert("用车说明不能为空");

					return false;
				}
				if(document.all.UseCarMan.value=="")
				{
					window.alert("使用人不能为空");
					
					return false;
	            }

	            if (document.all.UseDepart.value == "") {
	                window.alert("用车部门不能为空");
	                return false;
	            }

				if(document.all.Place.value=="")
				{
					window.alert("起始地点不能为空");
					
					return false;

				}
				if(document.all.StartDate.value=="")
				{
					window.alert("开始日期不能为空");

					return false;
				}

				if(document.all.EndDate.value=="")
				{
					window.alert("结束日期不能为空");

					return false;
				}
                if (document.all.CarNum.value == "") {
                    window.alert("车牌号不能为空");

                    return false;
				}
                if (document.all.Mileage.value == "") {
                    window.alert("里程数不能为空");

                    return false;
                }
                
                
				if(checkSubmit()==false)return false;
				DisabledBtn();
				return true;
			}
			
			function UpFileAdjunct() {
			    var strPage = "../OAWorkFlowNew/FileAdjunct.aspx?Type=0008&KeyId=&AddFile=&random=" + Math.random();
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