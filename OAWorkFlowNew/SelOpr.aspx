<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelOpr.aspx.cs" Inherits="M_Main.OAWorkFlowNew.SelOpr" %>
<!DOCTYPE html>
<html>
	<HEAD>
		<title>选择人员</title>
		<script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<script src="../jscript/JSClient.js" type="text/javascript"></script>
		<LINK href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet">
		<LINK href="../css/style.css" type="text/css" rel="stylesheet">
		<LINK href="../css/workflow.css" type="text/css" rel="stylesheet">
		<script src="../jscript/XMLHttpRequest.js"></script>
        <script type="text/javascript" src="../jscript/Cache.js"></script>
        <script src="../jscript/Dialog.js" type="text/javascript"></script>
	</HEAD>
	<body style="overflow:hidden;">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" border="0" height="100%">
				<tr>
					<td vAlign="top" width="200" height="600">
						<div class="BtnDown" id="Depart" onclick="SelDiv(this);">部门</div>
						<div class="BtnContentHeight" id="Depart_Info">
									<ul id="DepTree" class="ztree">

									</ul>
						</div>
						<div class="BtnDown" id="Role" onclick="SelDiv(this);">岗位</div>
						<div class="BtnContentHeight" id="Role_Info">
									<ul id="RoleTree" class="ztree">

									</ul>
						</div>
						<div class="BtnDown" id="Man" onclick="SelDiv(this);">人员</div>
						<div class="BtnContentHeight" id="Man_Info">
									<ul id="UserTree" class="ztree">

									</ul>
						</div>
						<div class="BtnDown" id="Level" onclick="SelDiv(this);">级别</div>
						<div class="BtnContentHeight" id="Level_Info">
									<ul id="LevelTree" class="ztree">

									</ul>
						</div>
						<div class="BtnDown" id="Group" onclick="SelDiv(this);">群组</div>
						<div class="BtnContentHeight" id="Group_Info">
									<ul id="GroupTree" class="ztree">

									</ul>
						</div>
					</td>
					<td vAlign="top" width="600">
						<table width="100%" border="0" height="25">
							<tr>
								<td style="PADDING-LEFT: 3px;WIDTH: 62px">快速搜索：</td>
								<td><asp:TextBox id="KeyWords" runat="server" BorderStyle="Groove" Width="456px" MaxLength="40" ></asp:TextBox>&nbsp;<INPUT class="button" id="BtSel" style="HEIGHT: 22px" onclick="btnSel_Click();" type="button"
										value="搜索" name="btnSel" runat="server"></td>
							</tr>
						</table>
						<TABLE style="WIDTH: 584px;" cellSpacing="0" cellPadding="0"  id="TblList">
							<TR>
								<TD style="HEIGHT: 17px" align="center">待选列表</TD>
								<TD style="WIDTH: 59px; HEIGHT: 17px" align="center">操作</TD>
								<TD style="HEIGHT: 17px" align="center">已选列表</TD>
							</TR>
							<TR>
								<TD style="PADDING-TOP: 5px;text-align:center;height:415px;width:45%;">
                                    <SELECT id="WaitSelList" style="WIDTH: 95%; HEIGHT: 100%" size="24" ondblclick="LeftToRight();"></SELECT>
								</TD>
								<TD style="WIDTH: 10%;text-align:center;height:415px;"><INPUT class="button" id="Button1" style="HEIGHT: 22px" onclick="LeftToRight();" type="button"
										value="添加">
									<BR>
									<BR>
									<INPUT class="button" id="Button2" style="HEIGHT: 22px" onclick="RightToLeft();" type="button"
										value="删除">
									<BR>
									<BR>
									<INPUT class="button" id="Button3" style="HEIGHT: 22px" onclick="ALLLeftToRight();" type="button"
										value="全选">
									<BR>
									<BR>
									<INPUT class="button" id="Button4" style="HEIGHT: 22px" onclick="AllRightToLeft();" type="button"
										value="全删">
								</TD>
								<TD style="PADDING-TOP: 5px;height:415px;width:45%;">
                                    <SELECT id="HaveSelList" style="WIDTH: 95%; HEIGHT: 100%" size="24" ondblclick="RightToLeft();"></SELECT>
								</TD>
							</TR>
                            <tr>
                                <td colspan="3" style="text-align:center;">
                                        <INPUT class="button" style="HEIGHT: 22px" onclick="btnSave_Click();" type="button" value="保存"
										name="btnSave"><INPUT id="InfoId" style="WIDTH: 23px; HEIGHT: 17px" size="1" value="-1" name="InfoId"
										runat="server" type="hidden"><INPUT id="SelTxt" style="WIDTH: 23px; HEIGHT: 17px" type="hidden" size="1" value="0" name="InfoId"
										runat="server"><INPUT id="MultiLine" style="WIDTH: 23px; HEIGHT: 17px" type="hidden" size="1" value="0"
										name="InfoId" runat="server"> <INPUT id="HadSelUserList" style="WIDTH: 23px; HEIGHT: 17px" type="hidden" size="1" 
										name="HadSelUserList" runat="server">
                                </td>
                            </tr>
						</TABLE>
					</td>
				</tr>
			</table>

	    <SCRIPT language="javascript">
		
		function SelDiv(Obj)
		{
			document.getElementById("Depart_Info").style.display='none';
			document.getElementById("Role_Info").style.display='none';
			document.getElementById("Man_Info").style.display='none';
			document.getElementById("Level_Info").style.display='none';
			document.getElementById("Group_Info").style.display='none';
			document.getElementById(Obj.id+'_Info').style.display='';			
		}
		

		function TVDepartment_Click(strNodeData)
		{
				if(strNodeData!=null)
				{
					var NodeData=strNodeData
					var DataArray=NodeData.split('\t');
					for(var i=0;i<DataArray.length;i++)
					{
						if(DataArray[i]=="null")
						{
							DataArray[i]="";
						}
					}
					var arrData=DataArray[0];//DepCode
					RequestData("../OAWorkFlowNew/ResponseWorkFlowInfo.aspx","DepartList",arrData);
				}
		}
		
		function TVFlowRole_Click(strNodeData)
		{
			if(strNodeData!=null)
				{
					var NodeData=strNodeData
					var DataArray=NodeData.split('\t');
					for(var i=0;i<DataArray.length;i++)
					{
						if(DataArray[i]=="null")
						{
							DataArray[i]="";
						}
					}
					var arrData=DataArray[0];//DepCode
					RequestData("../OAWorkFlowNew/ResponseWorkFlowInfo.aspx","RoleList",arrData);
				}
		}
		
		function TVFlowMan_Click(strNodeData)
		{
				if(strNodeData!=null)
				{
					var NodeData=strNodeData
					var DataArray=NodeData.split('\t');
					for(var i=0;i<DataArray.length;i++)
					{
						if(DataArray[i]=="null")
						{
							DataArray[i]="";
						}
					}
					var arrData=DataArray[0];//DepCode
					RequestData("../OAWorkFlowNew/ResponseWorkFlowInfo.aspx","UserList",arrData);
				}
		}
		
		function TVFlowLevel_Click(strNodeData)
		{
			if(strNodeData!=null)
			{
					var NodeData=strNodeData
					var DataArray=NodeData.split('\t');
					for(var i=0;i<DataArray.length;i++)
					{
						if(DataArray[i]=="null")
						{
							DataArray[i]="";
						}
					}
					var arrData=DataArray[0];
					var arrText=DataArray[1];
					ClearListBox(document.getElementById("WaitSelList"));
					AddListBox(document.getElementById("WaitSelList"),"["+arrText+"]",arrData+","+"LevelList");
					ClearWaitSelList();
			}
		}
		
		function TVFlowGroup_Click(strNodeData)
		{
				if(strNodeData!=null)
				{
					var NodeData=strNodeData
					var DataArray=NodeData.split('\t');
					for(var i=0;i<DataArray.length;i++)
					{
						if(DataArray[i]=="null")
						{
							DataArray[i]="";
						}
					}
					var arrData=DataArray[0];//DepCode
					RequestData("../OAWorkFlowNew/ResponseWorkFlowInfo.aspx","GroupUserList",arrData);
				}
		}
		
		function btnSel_Click()
		{
			var selKeyWord=document.all.KeyWords.value;
			if(selKeyWord=='')
			{
				window.alert('请输入关键字');
				return;
			}
			RequestData("../OAWorkFlowNew/ResponseWorkFlowInfo.aspx","KeyWordList",selKeyWord);
		}
		
		function RequestData(Url,Type,Data)
		{
			var arrData,DataArray,DataTextArray;
			var ajaxObject = new Ajax();
			ajaxObject.method="POST";
			ajaxObject.url=Url;
			ajaxObject.content="OprType="+Type+"&Data="+Data;
			ajaxObject.callBack = function(xmlObject) 
			{
				ClearListBox(document.getElementById("WaitSelList"));
				var arrData=xmlObject.responseText;

				arrData=arrData.substring(0,arrData.length - 1);
				var DataArray=arrData.split('|');
				for(var i=0;i<DataArray.length;i++)
				{
					DataTextArray=DataArray[i].split(',');
					AddListBox(document.getElementById("WaitSelList"),DataTextArray[0],DataTextArray[1]+","+DataTextArray[2]);
				}
				ClearWaitSelList();
				
				if(Type=='LoadOperatorList')
				{
					ALLLeftToRight();
				}
			}
			ajaxObject.send();
		}

		function AddListBox(Lb,Txt,Value)
		{
			var NewOption=document.createElement("OPTION");
			NewOption.text=Txt;
			NewOption.value=Value;
			Lb.add(NewOption)
		}
		
		function ClearListBox(Lb)
		{
			while(Lb.options.length>0)
			{
				Lb.remove(0);
			}
		}
		
		function LeftToRight()
		{
			var HaveLb=document.all.HaveSelList;
			var WaitLb=document.all.WaitSelList;
			
			for(var i=0;i<WaitLb.options.length;i++)
			{
				if(WaitLb.options[i].selected)
				{
					AddListBox(HaveLb,WaitLb.options[i].text,WaitLb.options[i].value);
					WaitLb.remove(i);
					WaitLb.selectedIndex=i;
				}
			}
		}

		function RightToLeft()
		{
			var HaveLb=document.all.HaveSelList;
			var WaitLb=document.all.WaitSelList;
			
			for(var i=0;i<HaveLb.options.length;i++)
			{
				if(HaveLb.options[i].selected)
				{
					AddListBox(WaitLb,HaveLb.options[i].text,HaveLb.options[i].value);
					HaveLb.remove(i);
					HaveLb.selectedIndex=i;
				}
			}
		}
		
		function ClearWaitSelList()
		{
			var HaveLb=document.all.HaveSelList;
			var WaitLb=document.all.WaitSelList;
			
			for(var i=0;i<HaveLb.options.length;i++)
			{
				for(var j=0;j<WaitLb.options.length;j++)
				{
					if(WaitLb.options[j].value==HaveLb.options[i].value)
					{
						WaitLb.remove(j);
					}
				}
			}
		}
		
		function ALLLeftToRight()
		{
			var HaveLb=document.all.HaveSelList;
			var WaitLb=document.all.WaitSelList;
			
			while(WaitLb.options.length>0)
			{
				AddListBox(HaveLb,WaitLb.options[0].text,WaitLb.options[0].value);
				WaitLb.remove(0);
			}
		}
		
		function AllRightToLeft()
		{
			var HaveLb=document.all.HaveSelList;
			var WaitLb=document.all.WaitSelList;

			while(HaveLb.options.length>0)
			{
				AddListBox(WaitLb,HaveLb.options[0].text,HaveLb.options[0].value);
				HaveLb.remove(0);
			}
		}
		
		function btnSave_Click()
		{
			var PostData='';
			
			var PostDataTxt='';
			
			var RetArray=new Array();
			
			var HaveLb=document.all.HaveSelList;
			
			if(document.all.SelTxt.value!="0")
			{
				if(HaveLb.options.length>1)
				{
					if(document.all.MultiLine.value=="0")
					{
						window.alert("不能选择多个");
						return;
					}
				}
			}

			for(var i=0;i<HaveLb.options.length;i++)
			{
				PostData=PostData+HaveLb.options[i].text+","+HaveLb.options[i].value+"|";
				
				PostDataTxt=PostDataTxt+HaveLb.options[i].text;
			}
			
			PostData=PostData.substring(0,PostData.length - 1);
			RetArray[0]=PostData;
			RetArray[1]=PostDataTxt;
			var Ret=JSON.stringify(RetArray);

			if(PostData!='')
			{
			    Cache.SetData("SelOrp.aspx_Return", Ret);
			    HDialog.Close('1');
			}
			HDialog.Close('');
		}
		
		function LoadData()
		{
			if(document.all.InfoId.value!='-1')
			{
			    RequestData("../OAWorkFlowNew/ResponseWorkFlowInfo.aspx","LoadOperatorList",document.all.InfoId.value);
			}
			
			if(document.all.HadSelUserList.value!='')
			{				
				var arrData=document.all.HadSelUserList.value.split('|');
			
				for(var i=0;i<arrData.length;i++)
				{
					DataTextArray=arrData[i].split(',');
					AddListBox(document.getElementById("WaitSelList"),DataTextArray[0],DataTextArray[1]+","+DataTextArray[2]);
				}
				
				ALLLeftToRight();
			}
		}
		
		</SCRIPT>
		
		<script type="text/javascript">
				var setting = {
						data: {
							simpleData: {
								enable: true,
								idKey:"SortDepCode",
								pIdKey:"PrentDepCode"
							},
							key: {
								name: "DepName"
							}
						},
						view: {
								fontCss: getFont,
								nameIsHTML: true
							}
					};
					
					function getFont(treeId, node) {
						return node.font ? node.font : {};
					}
					
					var n=<%= DepartMentNodes %>
					
					var newDep=[];
					for(var i=0;i<n.length;i++)
					{
					   var strData="";
					   strData=n[i]["DepCode"];
					   newDep[i]={SortDepCode:n[i]["SortDepCode"],PrentDepCode:n[i]["PrentDepCode"],DepName:n[i]["DepName"],click:"TVDepartment_Click('"+strData+"')"};
					}
					treeDep=$.fn.zTree.init($("#DepTree"), setting, newDep);
					treeDep.expandAll(true);
					
					var newRole=[];
					for(var i=0;i<n.length;i++)
					{
					   var strData="";
					   strData=n[i]["DepCode"];
					   newRole[i]={SortDepCode:n[i]["SortDepCode"],PrentDepCode:n[i]["PrentDepCode"],DepName:n[i]["DepName"],click:"TVFlowRole_Click('"+strData+"')"};
					}
					treeRole=$.fn.zTree.init($("#RoleTree"), setting, newRole);
					treeRole.expandAll(true);
					
					var newUser=[];
					for(var i=0;i<n.length;i++)
					{
					   var strData="";
					   strData=n[i]["DepCode"];
					   newUser[i]={SortDepCode:n[i]["SortDepCode"],PrentDepCode:n[i]["PrentDepCode"],DepName:n[i]["DepName"],click:"TVFlowMan_Click('"+strData+"')"};
					}
					treeUser=$.fn.zTree.init($("#UserTree"), setting, newUser);
					treeUser.expandAll(true);

					var settingLevel = {
						data: {
							simpleData: {
								enable: true,
								idKey:"DictionaryCode",
								pIdKey:"DictionaryCode"
							},
							key: {
								name: "DictionaryName"
							}
						},
						view: {
								fontCss: getFont,
								nameIsHTML: true
							}
					};
					
					var n=<%= LevelNodes %>
					
					var newLevel=[];
					for(var i=0;i<n.length;i++)
					{
					   var strData="";
						strData=n[i]["DictionaryCode"]+"\t"+n[i]["DictionaryName"]
						newLevel[i]={DictionaryCode:n[i]["DictionaryCode"],DictionaryCode:n[i]["DictionaryCode"],DictionaryName:n[i]["DictionaryName"],click:"TVFlowLevel_Click('"+strData+"')"};
					}
					treeLevel=$.fn.zTree.init($("#LevelTree"), settingLevel, newLevel);
					treeLevel.expandAll(true);
					
					
					var settingGroup = {
						data: {
							simpleData: {
								enable: true,
								idKey:"GroupCode",
								pIdKey:"GroupCode"
							},
							key: {
								name: "GroupName"
							}
						},
						view: {
								fontCss: getFont,
								nameIsHTML: true
							}
					};
					
					var n=<%= GroupNodes %>
					
					var newGroup=[];
					for(var i=0;i<n.length;i++)
					{
					   var strData="";
						strData=n[i]["GroupCode"]+"\t"+n[i]["GroupName"]
						newGroup[i]={GroupCode:n[i]["GroupCode"],GroupCode:n[i]["GroupCode"],GroupName:n[i]["GroupName"],click:"TVFlowGroup_Click('"+strData+"')"};
					}
					treeGroup=$.fn.zTree.init($("#GroupTree"), settingGroup, newGroup);
					treeGroup.expandAll(true);

					$(document).ready(function(){
					
							function InitFunction()
							{
								LoadData();
								var divHeight=$(window).height();
								document.all.Depart_Info.style.height=divHeight-100;
								document.all.Role_Info.style.height=divHeight-100;
								document.all.Man_Info.style.height=divHeight-100;
								document.all.Group_Info.style.height=divHeight-100;
								document.all.Level_Info.style.height=divHeight-100;
								document.all.TblList.style.height=divHeight-60;
								
								if(document.all.SelTxt.value!="0")
								{
									switch(document.all.SelTxt.value)
									{
										case "1":
										SelDiv(document.all.Depart);
										//document.all.KeyWords.disabled=true;
										//document.all.BtSel.disabled=true;
										document.all.Depart_Info.style.height=divHeight-22+'px';
										document.all.Role.style.display='none';
										document.all.Man.style.display='none';
										document.all.Level.style.display='none';
										document.all.Group.style.display='none';
										break;
										case "2":
										SelDiv(document.all.Role);
										//document.all.KeyWords.disabled=true;
										//document.all.BtSel.disabled=true;
										document.all.Role_Info.style.height=divHeight-20+'px';
										document.all.Depart.style.display='none';
										document.all.Man.style.display='none';
										document.all.Level.style.display='none';
										document.all.Group.style.display='none';
										break;
										case "3":
										SelDiv(document.all.Man);
										//document.all.KeyWords.disabled=true;
										//document.all.BtSel.disabled=true;
										document.all.Man_Info.style.height=divHeight-42+'px';
										document.all.Group_Info.style.height=divHeight-42+'px';
										document.all.Depart.style.display='none';
										document.all.Role.style.display='none';
										document.all.Level.style.display='none';
										break;
										case "4":
										SelDiv(document.all.Level);
										//document.all.KeyWords.disabled=true;
										//document.all.BtSel.disabled=true;
										document.all.Level_Info.style.height=divHeight-20+'px';
										document.all.Man.style.display="none";
										document.all.Depart.style.display='none';
										document.all.Role.style.display='none';
										document.all.Group.style.display='none';
                                        break;
                                        case "5":
                                            SelDiv(document.all.Man);
                                            //document.all.KeyWords.disabled=true;
                                            //document.all.BtSel.disabled=true;
                                            document.all.Man_Info.style.height = divHeight - 22 + 'px';
                                            document.all.Level.style.display = "none";
                                            document.all.Depart.style.display = 'none';
                                            document.all.Role.style.display = 'none';
                                            document.all.Group.style.display = 'none';
                                            break;
										default:
										break;
									}
								}
							}
						
							InitFunction();
							if(document.all.SelTxt.value=="0")
							{
								SelDiv(document.all.Man);
							}
					
					});
			</script>
			
		</form>
	</body>
</HTML>
