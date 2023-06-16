<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowNodeManage.aspx.cs" Inherits="M_Main.OAWorkFlowNew.WorkFlowNodeManage" %>
<!DOCTYPE html>
<html>
	<HEAD>
		<title>节点编辑</title>
		<LINK href="../css/workflow.css" type="text/css" rel="stylesheet">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="../jscript/JsCodeFun.js"></script>
		<script type="text/javascript" src="../jscript/XMLHttpRequest.js"></script>
        <script src="../jscript/Dialog.js" type="text/javascript"></script>
        <script type="text/javascript" src="../jscript/Cache.js"></script>
		<style type="text/css">
		.CustFont { COLOR: blue; FONT-WEIGHT: bold }
		.CustFontNo { COLOR: #000000;font-weight:normal;}
		</style>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
            <input id="InstanceType" type="hidden" name="InstanceType" runat="server" />
            <input id="TxtStartUser" type="hidden" name="TxtStartUser" runat="server" />
            <input id="EditState" value="Browse" name="EditState" runat="server" type="hidden" />
            <input id="InstanceId"  value="-1" name="InfoId" runat="server" type="hidden" />
            <input id="InfoId"  value="-1" name="InfoId" runat ="server" type="hidden" />
            <input id="OperatorTxt" name="InfoId" runat="server" type ="hidden"/>
            <input id="NowFlowSort" type="hidden" name="NowFlowSort" runat="server" />
			<table style="WIDTH: 568px; HEIGHT: 168px" width="568" align="center" id="TableFrame">
				<tr>
					<td style="HEIGHT: 21px" align="center" colSpan="2">
                        节点 <asp:label id="FlowSort" runat="server" Font-Bold="True" ForeColor="Red"></asp:label>
					</td>
				</tr>
				<tr>
					<td style="WIDTH: 396px" class="CustFont">01、节点名称：<INPUT class="Control_WorkFlowItemInputLeft" id="FlowSortName" style="WIDTH: 160px; HEIGHT: 22px"
								maxLength="50" name="FlowSortName" runat="server"></td>
					<td align="right"></td>
				</tr>
				<tr>
					<td colSpan="2" class="CustFont">02、处理人员：</td>
				</tr>
				<tr>
					<td colSpan="2" style="PADDING-LEFT:20px">发起人<INPUT id="IsStartUser" type="checkbox" runat="server" NAME="IsStartUser"></td>
				</tr>
				<tr>
					<td colSpan="2" style="PADDING-LEFT:16px"><INPUT class="Control_WorkFlowItemInputLeft" id="Operator" style="WIDTH: 90%; HEIGHT: 22px"
								readOnly maxLength="50" size="62" name="FlowSortName" runat="server"><img title="请选择处理人员" style="cursor: pointer" onclick="WorkFlowSelOpr();" src="../images/OAWorkFlow/add.gif"></td>
				</tr>
				<tr>
					<td style="WIDTH: 396px; HEIGHT: 25px" class="CustFont">03、处理方式：</td>
					<td style="HEIGHT: 25px" align="right"></td>
				</tr>
				<tr>
					<td colSpan="2" style="PADDING-LEFT: 18px; HEIGHT: 26px"><asp:radiobutton id="oprMethod1" runat="server" Text="串行：多人处理时，一人通过即可" GroupName="OprMethod"></asp:radiobutton></td>
				</tr>
				<tr>
					<td colSpan="2" style="PADDING-LEFT: 18px; HEIGHT: 26px"><asp:radiobutton id="oprMethod2" runat="server" Text="并行：多人处理时，每人通过方可" GroupName="OprMethod" Checked="True"></asp:radiobutton></td>
				</tr>
				<tr>
					<td colSpan="2" style="HEIGHT: 27px" class="CustFont">04、处理权限：<asp:dropdownlist id="NodeOprType" runat="server">
								<asp:ListItem Value="0001">会签</asp:ListItem>
								<asp:ListItem Value="0002" Selected>审批</asp:ListItem>
							</asp:dropdownlist></td>
				</tr>
				<tr>
					<td style="HEIGHT: 27px" class="CustFont">05、批转权限：<asp:dropdownlist id="CheckLevel" runat="server">
								<asp:ListItem Value="0">不能批转给他人</asp:ListItem>
								<asp:ListItem Value="1">批转给他人会签</asp:ListItem>
								<asp:ListItem Value="2" Selected>批转给他人审批</asp:ListItem>
							</asp:dropdownlist></td>
					<td style="HEIGHT: 26px"></td>
				<tr>
					<td style="WIDTH: 396px"><font class="CustFont">06、修改权限：</font><asp:checkbox id="IsUpdateFlow" runat="server" Text="可修改流程" style="Z-INDEX: 0"></asp:checkbox>
					</td>
					<td></td>
				</tr>
				<tr>
					<td style="WIDTH: 396px"><font class="CustFont">07、打印权限：</font><asp:checkbox id="IsPrint" runat="server" Text="可打印内容" Checked="True"></asp:checkbox></td>
					<td></td>
				</tr>
				<tr>
					<td colSpan="2" style="HEIGHT: 26px" class="CustFont">08、跳转节点：<asp:dropdownlist id="JumpFlowSort" runat="server">
								<asp:ListItem Value="0">不跳转</asp:ListItem>
							</asp:dropdownlist></td>
				</tr>
				<tr>
					<td colSpan="2" style="HEIGHT: 26px" class="CustFont">09、驳回节点：<asp:dropdownlist id="ReturnBackNode" runat="server">
								<asp:ListItem Value="0">起始点</asp:ListItem>
							</asp:dropdownlist></td>
				</tr>
				<tr>
					<td colSpan="2" style="HEIGHT: 26px" class="CustFont">10、处理时限：</td>
				</tr>
				<tr>
					<td colSpan="2" style="padding-left: 20px; height: 26px"><input class="Control_WorkFlowItemInputCenter" id="TimeOutDay" style="width: 32px; height: 22px"
							maxLength="50" size="1" name="FlowSortName" runat="server" value="0">小时没有处理则催办</td>
				</tr>
				<tr>
					<td colSpan="2" style="PADDING-LEFT: 20px; HEIGHT: 26px"><INPUT class="Control_WorkFlowItemInputCenter" id="TimeOutDays" style="WIDTH: 32px; HEIGHT: 22px"
							maxLength="50" size="1" name="FlowSortName" runat="server" value="0">小时没有处理则跳过</td>
				</tr>
				<tr>
					<td align="center" colSpan="2">
                        <input class="button" id="BtSave" style="HEIGHT: 22px" onclick="javascript:if(BtSave_Click()==false) return false;"
							type="button" value="保存" name="btnEdit" onserverclick="BtSave_ServerClick" runat="server" />
                        <input class="button_six" type="button" id="BtnSaveAdd" name="BtnSaveAdd" onserverclick="BtnSaveAdd_ServerClick" onclick="javascript:if(BtSave_Click()==false) return false;"  value="保存并新增"  runat="server"/>
					</td>
				</tr>
			</table>
			<script type="text/javascript">
			if(document.all.InstanceType.value!="0001")
			{
				document.all.IsStartUser.disabled=true;
			}
			
			function WorkFlowSelOpr()
			{
			    HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?WorkInfoId='+document.all.InfoId.value+'&random=' + Math.random(), '选择人员', false, function callback(_Data) {
			        if (_Data != '') {
			            var Ret = Cache.GetData("SelOrp.aspx_Return");
			            var obj = JSON.parse(Ret);
			            if (obj != null) {
			                document.all.OperatorTxt.value = obj;
			                document.all.Operator.value = obj[1];
			            }
			        }
			    });
			}

			function InitData()
			{
				var OprState=document.all.EditState.value;
				switch(OprState)
				{
					case "NewRecord":
					break;
					case "EditRecord":
					RequestData('GetWorkFlowNode',document.all.InfoId.value,'');
					break;
				}
			}

			function AddListBox(Lb,Txt,Value)
			{
				var NewOption=document.createElement("OPTION");
				NewOption.text=Txt;
				NewOption.value=Value;
				Lb.add(NewOption)
			}

			function RequestData(Type,InstanceId,DictionaryCode)
			{
				var ajaxObject = new Ajax();
				ajaxObject.method="POST";
				ajaxObject.url="../OAWorkFlowNew/ResponseWorkFlowInfo.aspx";
				ajaxObject.content="OprType="+Type+"&Data=&InstanceId="+InstanceId+"&DictionaryCode="+DictionaryCode;
				ajaxObject.callBack = function(xmlObject) 
				{
				    var RetStr = xmlObject.responseText;
					if(RetStr!=null && RetStr!='')
					{
						switch(Type)
						{
						    case "GetWorkFlowNode":
							var obj = JSON.parse(RetStr);
							if (document.all.EditState.value == 'EditRecord') {
							    document.all.FlowSort.innerText = obj.FlowSort;
							}
							document.all.FlowSortName.value = obj.FlowNodeName;
							document.all.TimeOutDay.value = obj.TimeOutDay;
							document.all.IsUpdateFlow.checked = obj.IsUpdateFlow == 1 ? true : false;
							document.all.IsPrint.checked = obj.IsPrint == 1 ? true : false;
							
							if (obj.Tb_Dictionary_NodeOprMethod_DictionaryCode == '0001') document.all.oprMethod1.checked = true; else document.all.oprMethod2.checked = true;
							
							document.all.TimeOutDays.value = obj.TimeOutDays;
							
							BindDrpList(document.all.NodeOprType, obj.Tb_Dictionary_NodeOprType_DictionaryCode);
							
							BindDrpList(document.all.JumpFlowSort, obj.JumpFlowSort);
							
							document.all.IsStartUser.checked = obj.IsStartUser == 1 ? true : false;//是否发起人 13：流程开始日期  16 串行 17：审批 18：RandCode
							
							BindDrpList(document.all.ReturnBackNode, obj.ReturnNode);//驳回节点
							
							BindDrpList(document.all.CheckLevel, obj.CheckLevel);//批转功能

							document.all.Operator.value = obj.DealUserList;//处理人员名称
							SetReadOnly('true');
							break;
							default:
							break;
						}
					}
				}
				ajaxObject.send();
			}

			function BindDrpList(Drp,Value)
			{
				for(var j=0;j<Drp.options.length;j++)
				{
					if(Drp.options[j].value==Value)
					{
						Drp.selectedIndex=j;
					}
				}
			}
			
			function BtSave_Click()
			{
				SetReadOnly('');
				if(document.all.FlowSortName.value=='')
				{
					window.alert('节点名称不能为空');
					return false;
				}
				if(document.all.TimeOutDay.value=='')
				{
					window.alert('催办小时不能为空,默认为0');
					return false;
				}
				if(document.all.TimeOutDays.value=='')
				{
					window.alert('超时小时不能为空,默认为0');
					return false;
				}
				if(isDigit(document.all.TimeOutDay.value)==false)
				{
					window.alert('催办小时只能为数字');
					return false;
				}
				if(isDigit(document.all.TimeOutDays.value)==false)
				{
					window.alert('超时小时只能为数字');
					return false;
				}
				if(document.all.Operator.value=='' && document.all.IsStartUser.checked==false)
				{
					window.alert('请选择处理人员');
					return false;
				}
				if(document.all.oprMethod2.checked==true)
				{
					if(document.all.JumpFlowSort.selectedIndex>0)
					{
						window.alert('处理方式为并行，则不能设置跳转节点');
						return false;
					}
				}	
				return true;
			}
			InitData();
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
			
			function SetReadOnly(OpStateControl)
			{	
				if(document.all.NowFlowSort.value==document.all.FlowSort.innerText)
				{
					var elements=GetElements(document.getElementById("TableFrame"),'INPUT');
					for(var i=0;i<elements.length;i++)   
					{   
						if(elements[i].id!='BtSave')
						{
							elements[i].disabled=OpStateControl;
						}
					}
					var elements=GetElements(document.getElementById("TableFrame"),'SELECT');
					for(var i=0;i<elements.length;i++)   
					{   
						if(elements[i].id!='JumpFlowSort' && elements[i].id!='ReturnBackNode')
						{
							elements[i].disabled=OpStateControl;
						}

					}
					var elements=GetElements(document.getElementById("TableFrame"),'CHECKBOX');
					for(var i=0;i<elements.length;i++)   
					{   
						elements[i].disabled=OpStateControl;
					}
					var elements=GetElements(document.getElementById("TableFrame"),'IMG');
					for(var i=0;i<elements.length;i++)   
					{   
						elements[i].disabled=OpStateControl;
					}
				}
			}
			
			</script>
		</form>
	</body>
</HTML>
