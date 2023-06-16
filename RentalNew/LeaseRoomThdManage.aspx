<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Page language="c#" Codebehind="LeaseRoomThdManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.RentalNew.LeaseRoomThdManage" %>
<!DOCTYPE HTML >
<HTML>
	<HEAD>
		<title></title>
        <script src="../jscript/jquery-1.11.3.min.js"></script>
        <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
        <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
        <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
        <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
        <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
        <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
        <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
        <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
        <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
        <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

        <script type="text/javascript" src="../jscript/DateControl.js"></script>
        <script type="text/javascript" src="../jscript/JSClient.js"></script>
        <script type="text/javascript" src="../jscript/ajax.js"></script>
        <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

        <script src="../jscript/Dialog.js" type="text/javascript"></script>
        <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
        <link href="../css/button.css" rel="stylesheet" />
        <script src="../jscript/DateFormat.js" type="text/javascript"></script>
        <script src="../jscript/format.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
        <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
        <style type="text/css">
        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }

        .tabs-container .tabs-left .panel-body {
            margin-left: 0px;
        }

        .panel-body2 {
            margin-left: 20%;
            width: 80%;
        }

    </style>
		<script language="javascript">
		<!--
					
			function CheckData()
			{
				if(LeaseRoomThdManage.CustName.value=="")
				{
					HDialog.Info("请输入客户名称,此项不能为空!");
					LeaseRoomThdManage.CustName.focus();
					return false;
				}
							
					var strresults = getObject("results").innerHTML;
		
				if((strresults!="")&&(strresults!="新的登录账号！"))
				{
					HDialog.Info(strresults);
					LeaseRoomThdManage.InquireAccount.focus();
					return false;
				}	
				
				if(LeaseRoomThdManage.Linkman.value=="")
				{
					HDialog.Info("请输入联系人,此项不能为空!");
					LeaseRoomThdManage.Linkman.focus();
					return false;
				}
				if(LeaseRoomThdManage.LinkmanTel.value=="")
				{
					HDialog.Info("请输入联系人电话,此项不能为空!");
					LeaseRoomThdManage.LinkmanTel.focus();
					return false;
				}
				
				return true;
			}
			
			function CheckAccount()
			{ 						
				var strInquireAccount = LeaseRoomThdManage.InquireAccount.value;
				var strOldAccount = LeaseRoomThdManage.OldAccount.value;
				getObject("results").innerHTML = "";
				//HDialog.Info(strLoginCode);
				
				Request.sendPOST("../House/CheckAccount.aspx","InquireAccount="+strInquireAccount+"&OldAccount="+strOldAccount,callbackAccount)
				
			}
			function callbackAccount(xmlHttp) 
			{
				//HDialog.Info(xmlHttp.responseText);
				var varReturn = xmlHttp.responseText;
				getObject("results").innerHTML = varReturn;
			}
			
			
			function btnFileUp_Onclick()
			{
				if(LeaseRoomThdManage.AdjunctName.value=="")
				{
					HDialog.Info("请输入文件附件名称,此项不能为空!");
					LeaseRoomThdManage.AdjunctName.focus();
					return false;
				}
				
				if(LeaseRoomThdManage.btnFile.value=="")
				{
					HDialog.Info("请选择要上传的本地文件!");
					LeaseRoomThdManage.btnFile.focus();
					return false;
				}
				
				return true;
			}
			
			function btnSelMultiRoom_OnClick()			
			{				

				varReturn=showModalDlg("../dialog/MultiRoomLeaseDlg.aspx?IsRental=1&Ram="+Math.random(),"",750,600);
				//HDialog.Info(varReturn);
				if(varReturn!="")
				{//**获得返回的参数信息
					
					var varObjects=varReturn.split("\t");
					
					LeaseRoomThdManage.RoomIDs.value=varObjects[0];
					LeaseRoomThdManage.RoomSigns.value=varObjects[1];
					LeaseRoomThdManage.hiRoomSigns.value=varObjects[1];
					
					return true;
				}

			}
			
			
			function btnChangeName_Onclick()
			{
			    debugger;
				var strCustID = LeaseRoomThdManage.CustID.value;
				
				//var varReturn=showModalDlg("../dialog/CustChangeNameDlg.aspx?CustID="+strCustID,"",500,300);
				
				////HDialog.Info(varReturn);
				//if(varReturn!="")
				//{//**获得返回的参数信息
					
				//	var varObjects=varReturn.split("\t");
											
				//	LeaseRoomThdManage.CustName.value=varObjects[0];
				//}

				HDialog.Open('650', '430', '../DialogNew/CustChangeNameDlg.aspx?CustID=' + strCustID, '更名', false, function callback(_Data) {
				    if (_Data != "") {
				        var varObjects = _Data.split("\t");
				        LeaseRoomThdManage.CustName.value = varObjects[0];
				    }
				});



			}
			
			
			function showIsUnit(expid1,expid2)
			{				
				if(getObject(expid1).style.display=="none")
				{
					getObject(expid1).style.display="";
					getObject(expid2).style.display="none";
				}
				else
				{
					getObject(expid1).style.display="none";
					getObject(expid2).style.display="";
				}
			}
			
			function OnFormload()
			{
				
				if (LeaseRoomThdManage.IsUnit1.checked)
				{					
					getObject('Table2').style.display="";
					getObject('Table3').style.display="none";
				}
				else
				{
					getObject('Table2').style.display="none";
					getObject('Table3').style.display="";
				}
			}
			
			function btnFile_Onclick()
			{
				var filename = LeaseRoomThdManage.btnFile.value;
				var realname = filename.substring(filename.lastIndexOf("\\")+1,filename.lastIndexOf("."));
				
				//HDialog.Info(realname);
				LeaseRoomThdManage.AdjunctName.value=realname;
				
			}
		//-->
		</script>
		<script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
	</HEAD>
	<body >
		<form id="LeaseRoomThdManage" method="post" runat="server">
            <INPUT style="WIDTH: 25px; HEIGHT: 22px" id="hiOPType" size="1" type="hidden" name="hiOPType"
							runat="server"><INPUT style="WIDTH: 25px; HEIGHT: 22px" id="CustID" size="1" type="hidden" name="CustID"
							runat="server"><INPUT style="WIDTH: 25px; HEIGHT: 22px" id="RoomCount" size="1" type="hidden" name="RoomCount"
							runat="server"><INPUT style="WIDTH: 25px; HEIGHT: 22px" id="RoomID" size="1" type="hidden" name="RoomID"
							runat="server"><INPUT style="WIDTH: 25px; HEIGHT: 22px" id="LiveID" size="1" type="hidden" name="LiveID"
							runat="server"><INPUT style="WIDTH: 32px; HEIGHT: 22px" id="hitype" size="1" type="hidden" name="hitype"
							runat="server"><INPUT style="WIDTH: 25px; HEIGHT: 22px" id="ContID" size="1" type="hidden" name="ContID"
							runat="server"><INPUT style="WIDTH: 16px; HEIGHT: 22px" id="IsAuditing" size="1" type="hidden" name="IsAuditing"
							runat="server"><INPUT style="Z-INDEX: 0; WIDTH: 16px; HEIGHT: 22px" id="IsCheck" size="1" type="hidden"
							name="IsCheck" runat="server"><INPUT style="Z-INDEX: 0; WIDTH: 16px; HEIGHT: 22px" id="ContSign" size="1" type="hidden"
							name="ContSign" runat="server">
            <input id="IsDelLive" name="IsDelLive" type="hidden" />
            <input id="AllData" name="AllData" type="hidden" />
           <INPUT style="WIDTH: 10px; HEIGHT: 22px" id="RoomIDs" size="1" type="hidden" name="RoomIDs"
											                    runat="server">
            <input id="hAuditing" name="hAuditing" type="hidden" runat="server" />
           
            <div id="DivTop" style="width:100%;">
                
               <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active" id="zhxx" name="zhxx" refpage="zhxx" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">租户信息</a>
                        </li>

                        <li class="" name="fwxx" id="fwxx" refpage="fwxx" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false" onclick="LoadRoomList()">房屋信息</a>
                        </li>
                       <li class="" name="htdj" id="htdj" refpage="htdj" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false" >合同登记</a>
                        </li>
                        <li class="" name="htfy" id="htfy" refpage="htfy" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false" >合同费用</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                    <div id="DivTopCustInfo" style="width:100%;overflow-y:auto">
                                        <TABLE id="Table1" class="DialogTable"  align="center">
							                <TR>
								             <td colspan="8" style="border: 1px solid #cccccc; border-top:0px;   background-color: #F5F5F5; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">租户信息</span> </td>
                                          </TR>
							                <TR>
								                <TD class="TdTitle" style="width:10%; height:26px;">租户名称</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="CustName" class="easyui-validatebox" style="width:60%" readOnly 
										                name="CustName" runat="server"> <INPUT id="btnChangeName" class="button" tabIndex="1" onclick="javascript:if(btnChangeName_Onclick()==false) return false;"
										                value="更名" style="width:48px;height:22px" type="button" name="btnChangeName" runat="server">
								                </TD>
								                <TD class="TdTitle" style="width:10%; height:26px;">出入证号</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="PassSign" class="easyui-validatebox" 
										                name="PassSign" runat="server"></TD>
							               
								                <TD class="TdTitle" style="width:10%; height:26px;">证件名称</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><asp:dropdownlist id="PaperName" runat="server"></asp:dropdownlist></TD>
								                <TD class="TdTitle" style="width:10%; height:26px;">证件号码</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="PaperCode" class="easyui-validatebox"  name="PaperCode" runat="server"></TD>
							                </TR>
							                <TR>
								                <TD class="TdTitle" style="width:10%; height:26px;">客户类别</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><SELECT id="CustTypeID" name="CustTypeID" runat="server">
										                <OPTION selected></OPTION>
									                </SELECT></TD>
								                <TD class="TdTitle" style="width:10%; height:26px;">固定电话</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="FixedTel" class="easyui-validatebox"  name="FixedTel" runat="server"></TD>
							                
								                <TD class="TdTitle" style="width:10%; height:26px;">移动电话</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="MobilePhone" class="easyui-validatebox"  name="MobilePhone" runat="server"></TD>
								                <TD class="TdTitle" style="width:10%; height:26px;">传真电话</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="FaxTel" class="easyui-validatebox"  name="FaxTel" runat="server"></TD>
							                </TR>
							                <TR>
								                <TD class="TdTitle" style="width:10%; height:26px;">联系地址</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="Address" class="easyui-validatebox"  name="Address" runat="server"></TD>
								                <TD class="TdTitle" style="width:10%; height:26px;">邮政编码</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="PostCode" class="easyui-validatebox"  name="PostCode" runat="server"></TD>
							                
								                <TD class="TdTitle" style="width:10%; height:26px;">收 件 人</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="Recipient" class="easyui-validatebox"  name="Recipient" runat="server"></TD>
								                <TD class="TdTitle" style="width:10%; height:26px;">电子邮件</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="EMail" class="easyui-validatebox"  name="EMail" runat="server">
								                </TD>
							                </TR>
							                <TR>
								                <TD class="TdTitle" style="width:10%; height:26px;">联系人</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="Linkman" class="easyui-validatebox" 
										                name="Linkman" runat="server"><FONT color="red" face="宋体">*</TD>
								                <TD class="TdTitle" style="width:10%; height:26px;">联系人电话</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="LinkmanTel" class="easyui-validatebox" maxLength="11"
											                name="LinkmanTel" runat="server"><FONT color="red" face="宋体">*</TD>
							              
								                <TD class="TdTitle" style="width:10%; height:26px;"><INPUT  id="OldAccount" size="1" type="hidden" name="OldAccount"
										                runat="server">登录账号</TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT onblur="javascript:CheckAccount();" id="InquireAccount" class="easyui-validatebox"
										                 name="InquireAccount" runat="server">
									                <div id="results" class="font_red"></div>
								                </TD>
								                <TD class="TdTitle" style="width:10%; height:26px;"></TD>
								                <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="IsUnit1" onclick="javascript:showIsUnit('Table2','Table3');" value="0" CHECKED
										                type="radio" name="IsUnit" runat="server">个人客户<INPUT id="IsUnit2" onclick="javascript:showIsUnit('Table2','Table3');" value="1" type="radio"
											                name="IsUnit" runat="server">单位客户</TD>
							                </TR>
						                </TABLE>
						                    <TABLE id="Table2" class="DialogTable"  align="center">
							                     <TR>
								             <td colspan="8" style="border: 1px solid #cccccc;  background-color: #F5F5F5; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">个人客户信息</span> </td>
                                          </TR>
							                    <TR>
								                    <TD class="TdTitle" style="width:10%; height:26px;">姓</TD>
								                    <TD class="TdContentSearch"  style="width:15%; height:26px;"><INPUT id="Surname" class="easyui-validatebox"  name="Surname" runat="server"></TD>
								                    <TD class="TdTitle" style="width:10%; height:26px;">名字</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="Name" class="easyui-validatebox"  name="Name" runat="server"></TD>
							                   
								                    <TD class="TdTitle" style="width:10%; height:26px;">性别</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><SELECT id="Sex" name="Sex" runat="server">
											                    <OPTION selected></OPTION>
										                    </SELECT></TD>
								                    <TD class="TdTitle" style="width:10%; height:26px;">国籍</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><asp:dropdownlist id="Nationality" runat="server"></asp:dropdownlist></TD>
							                    </TR>
							                    <TR>
								                    <TD class="TdTitle" style="width:10%; height:26px;">出生日期</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><SELECT id="nYear" name="nYear" runat="server">
										                    <OPTION selected></OPTION>
									                    </SELECT>年<SELECT id="nMonth" name="nMonth" runat="server">
										                    <OPTION selected></OPTION>
									                    </SELECT>月<SELECT id="nDay" name="nDay" runat="server">
										                    <OPTION selected></OPTION>
									                    </SELECT>日<INPUT style="WIDTH: 20px; HEIGHT: 19px" id="Birthday" class="easyui-validatebox" maxLength="10"
										                    size="10" type="hidden" name="Birthday" runat="server"></TD>
								                    <TD class="TdTitle" style="width:10%; height:26px;">工作单位</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="WorkUnit" class="easyui-validatebox"  name="WorkUnit" runat="server"></TD>
							                   
								                    <TD class="TdTitle" style="width:10%; height:26px;">兴趣爱好</TD>
								                    <TD class="TdContent" colSpan="3"><asp:checkboxlist id="ChkList" runat="server" RepeatColumns="6"></asp:checkboxlist></TD>
							                    </TR>
						                    </TABLE>

						                    <TABLE id="Table3" class="DialogTable"  align="center">
							                       <TR>
								             <td colspan="8" style="border: 1px solid #cccccc;  background-color: #F5F5F5; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">单位客户信息</span> </td>
                                          </TR>
							                    <TR>
								                    <TD class="TdTitle" style="width:10%; height:26px;">法定代表人</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="LegalRepr" class="easyui-validatebox"  name="LegalRepr" runat="server"></TD>
								                    <TD class="TdTitle" style="width:10%; height:26px;">法定代表人电话</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="LegalReprTel" class="easyui-validatebox"  name="LegalReprTel" runat="server"></TD>
							                  
								                    <TD class="TdTitle" style="width:10%; height:26px;">负责人</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="Text1" class="easyui-validatebox"  name="Charge" runat="server"></TD>
								                    <TD class="TdTitle" style="width:10%; height:26px;">负责人电话</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT id="Text2" class="easyui-validatebox"  name="ChargeTel" runat="server"></TD>
							                    </TR>
							                    <TR>
								                    <TD class="TdTitle" style="width:10%; height:26px;">负责人</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="Charge" class="easyui-validatebox" 
										                    name="Charge" runat="server"></TD>
								                    <TD class="TdTitle" style="width:10%; height:26px;">负责人电话</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="ChargeTel" class="easyui-validatebox" 
											                    name="ChargeTel" runat="server"></TD>
                                                     <TD class="TdTitle" style="width:10%; height:26px;"></TD>
                                                     <TD class="TdContentSearch" style="width:15%; height:26px;"></TD>
                                                     <TD class="TdTitle" style="width:10%; height:26px;"></TD>
                                                     <TD class="TdContentSearch" style="width:15%; height:26px;"></TD>
							                    </TR>
						                    </TABLE>
                                         <table class="DialogTable" id="Table7" align="center">
                                             <tr>
                                                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                                    <span style="font-size: 16px">纳税主体信息</span>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td class="TdTitle" style="width:10%; height:26px;">名称</td>
                                                <td class="TdContent" style="width:15%; height:26px;">
                                                      <input id="VATCode" name="VATCode" runat="server" type="hidden" class="easyui-validatebox">
                                                    <input id="VATName" name="VATName" runat="server" class="easyui-validatebox"></td>
                                                <td class="TdTitle" style="width:10%; height:26px;">纳税人识别号</td>
                                                <td class="TdContent" style="width:15%; height:26px;">
                                                     <input id="VATNumber" name="VATNumber" runat="server" class="easyui-validatebox"></td>
                                                <td class="TdTitle" style="width:10%; height:26px;">地址、电话</td>
                                                <td class="TdContent" style="width:15%; height:26px;">
                                                     <input id="VATAddLinkTel" name="VATAddLinkTel" runat="server" class="easyui-validatebox"></td>
                                                <td class="TdTitle" style="width:10%; height:26px;">开户行及帐号</td>
                                                <td class="TdContent" style="width:15%; height:26px;">
                                                   <input id="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server" class="easyui-validatebox"></td>
                                            </tr>
                                        </table>
						                    <TABLE id="Table4" class="DialogTable"   align="center">
							                     <TR>
								             <td colspan="8" style="border: 1px solid #cccccc;  background-color: #F5F5F5; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">银行代收信息</span> </td>
                                          </TR>
							                    <TR>
								                    <TD class="TdTitle" style="width:10%; height:26px;">银行名称</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="BankName" class="easyui-validatebox" 
										                    name="BankName" runat="server"></TD>
								                    <TD class="TdTitle"  style="width:10%; height:26px;">银行户名</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="BankIDs" class="easyui-validatebox" 
										                    name="BankIDs" runat="server"></TD>
							                  
								                    <TD class="TdTitle"  style="width:10%; height:26px;">银行账号</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="BankAccount" class="easyui-validatebox" 
										                    name="BankAccount" runat="server"></TD>
								                    <TD class="TdTitle"  style="width:10%; height:26px;">确认银行账号</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="BankAccountTwo" class="easyui-validatebox" 
											                    name="BankAccountTwo" runat="server"></TD>
							                    </TR>
							                    <TR>
								                    <TD class="TdTitle"  style="width:10%; height:26px;">代收协议编号</TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"><INPUT  id="BankAgreement" class="easyui-validatebox" 
										                    name="BankAgreement" runat="server"></TD>
								                    <TD class="TdTitle"  style="width:10%; height:26px;"></TD>
								                    <TD class="TdContentSearch" style="width:15%; height:26px;"></TD>
							                            <TD class="TdTitle"  style="width:10%; height:26px;"></TD>
                                                     <TD class="TdContentSearch"  style="width:15%; height:26px;"></TD>
                                                       <TD class="TdTitle"  style="width:10%; height:26px;"></TD>
                                                     <TD class="TdContentSearch"  style="width:15%; height:26px;"></TD>
								                      </TR>
                                                 <TR>
                                                      <TD class="TdTitle"  style="width:10%; height:26px;">备注</TD>
								                    <TD class="TdContentSearch" colSpan="7"><TEXTAREA id="Memo" rows="3" cols="55" name="Memo" runat="server"></TEXTAREA></TD>
							                 
                                                 </TR>
							                    <TR>
								                    <TD class="TdTitle"  style="width:10%; height:26px;">文件上传</TD>
								                    <TD class="TdContentSearch" colSpan="7"  style=" width:90%">
                                                       <span style="float:left">文件说明：</span> <INPUT  id="AdjunctName"  class="easyui-validatebox" style="float:left"
											                    name="AdjunctName" runat="server"><INPUT  id="btnFile" tabIndex="1" size="1" type="file" style="float:left"
										                    name="btnFile" runat="server" onpropertychange="javascript:btnFile_Onclick();"><INPUT id="btnFileUp" style="float:left;height:24px;width: 45px;" class="button" tabIndex="1" onclick="javascript:if(btnFileUp_Onclick()==false) return false;"
										                    value="上传" type="button" name="btnFileUp" runat="server"> </TD>
							                    </TR>
							                    <tr>
								                    <td class="formTable_ItemInput" colSpan="8"><asp:datagrid style="FONT-SIZE: 12px" id="DGrid" runat="server" Width="100%" AutoGenerateColumns="False"
										                    CssClass="DataGrid">
										                    <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
										                    <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
										                    <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
										                    <Columns>
											                    <asp:BoundColumn Visible="False" DataField="AdjunctCode">
												                    <HeaderStyle Width="0px"></HeaderStyle>
											                    </asp:BoundColumn>
											                    <asp:BoundColumn DataField="AdjunctName" HeaderText="文件说明">
												                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
											                    </asp:BoundColumn>
											                    <asp:BoundColumn DataField="FileSize" HeaderText="大小(KB)" DataFormatString="{0:N2}">
												                    <HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
												                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
											                    </asp:BoundColumn>
											                    <asp:TemplateColumn HeaderText="[下载]">
												                    <ItemTemplate>
													                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='下载'  >"
														                    CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
												                    </ItemTemplate>
												                    <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
												                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
											                    </asp:TemplateColumn>
											                    <asp:TemplateColumn HeaderText="[删除]">
												                    <ItemTemplate>
													                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"
														                    CommandName="Delete" CausesValidation="false" TabIndex="1" ID="btnDelete"></asp:LinkButton>
												                    </ItemTemplate>
												                    <HeaderStyle Width="40px" HorizontalAlign="Center"></HeaderStyle>
												                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
											                    </asp:TemplateColumn>
										                    </Columns>
									                    </asp:datagrid></td>
							                    </tr>
                                                </table>
                                  
                                        </div>
                                </div>

                            </div>
                        </div>

                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">

                                    <div id="DivTopRoom" style="width:100%;">
                                        <div class="tabs-container">
                                            <div class="tabs-left" style="margin:0px;">
                                                <ul class="nav nav-tabs">
                                                    <li class="active" refsel="1" refid="Tab1" refpage="RoomInfo" reftype="" onclick="LoadRoomList();">
                                                        <a data-toggle="tab" href="#tab-21"> <i class="fa fa-cogs "></i>当前房屋信息</a>
                                                    </li>
                                                    <li class="" refsel="0" refid="Tab2" refpage="RoomHisInfo" reftype="历史房屋信息" onclick="LoadRoomHisList();">
                                                        <a data-toggle="tab" href="#tab-22"><i class="fa fa-cogs "></i>历史房屋信息</a>
                                                    </li>
                           
                                                </ul>
                                                <div class="tab-content">
                                                    <div id="tab-21" class="tab-pane active">
                                                        <div class="panel-body2"  style="padding:0px;position:absolute;">
                                                           
                                                                    <div class="SearchContainer" id="RoomInfoList"></div>
                                                            
                                                        </div>
                                                    </div>
                                                    <div id="tab-22" class="tab-pane">
                                                        <div class="panel-body2" style="padding:0px;position:absolute;">
                                                             <div class="SearchContainer" id="RoomHisInfoList"></div>
                                                        </div>
                                                    </div>
                           
                                                </div>
                                            </div>
                                        </div>

                                      </div>
                     



                                </div>
                            </div>
                        </div>
                       
                        <div id="tab-3" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                      <%--<div class="SearchContainer" id="TableContainer1">1</div>--%>
                                    <iframe id="LeaseContact" style="width:100%;border:none;" class="Frm"></iframe>
                                    </div>
                                </div>
                            </div>

                           <div id="tab-4" class="tab-pane">
                            <div class="panel-body" style="padding: 0px;">
                                <div class="Frm">
                                      <div class="datagrid-toolbar" id="divtt">
                                        <table style="width:100%" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="float:right">
                                                     <a href="#" class="easyui-linkbutton" id="jszj" data-options="iconCls:'icon-save'" onclick="CaluFees();">计算租金</a>
                                                    &nbsp;
                                                       <a href="#" class="easyui-linkbutton" id="fydj" data-options="iconCls:'icon-add'" onclick="AddFees();">费用登记</a>
                                                    &nbsp;
                                                   <a href="#" class="easyui-linkbutton" id="plsc" data-options="iconCls:'icon-cancel'" onclick="DeleteFees();">批量删除</a>
                                               
                                              
                                                
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="SearchContainer" id="DGridFee">3</div>
                                    <div class="SearchContainer" id="DGridAuditFee">3</div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

            </div>

            <div id="DivMiddle" style="width:100%;height:35px;">
                <table style="width:100%;height:35px" border="0" >
                    <TR>
								                    <TD style="border: 1px solid #cccccc; border-bottom:0px; text-align: center; font-family: 微软雅黑;"><INPUT  id="btnSave" class="button" onclick="javascript:if(CheckData()==false) return false;"
										                    value="保存" type="button" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									                    &nbsp;&nbsp;&nbsp; <INPUT id="btnReturn" class="button" value="关闭" type="button"
										                    name="btnReturn" runat="server">
								                    </TD>
							                    </TR>
                </table>
              
            </div>
       

               <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 700px; height: 430px;">
                    <table class="DialogTable">
                        <tr>
                               <td class="TdTitle">房屋编号</td>
                             <td class="TdContentSearch"><INPUT id="RoomSign" class="easyui-validatebox"  name="RoomSign"
											runat="Server"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                            </td>
                        </tr>
                    </table>
                </div>


            <script  type="text/javascript" >

                var toolbar = [
                   {
                       text: '更新房屋信息',
                       iconCls: 'icon-save',
                       handler: function () {

                           $('#RoomInfoList').datagrid('acceptChanges');

                           var rows = $("#RoomInfoList").datagrid("getData").rows;
                           //alert(rows);
                           if (rows == "") {
                               HDialog.Info("请选择需要更新的数据");
                           }
                           else
                           {
                               $('#AllData').val(JSON.stringify(rows));

                               $.tool.DataPostChk('LeaseRoomThdManage', 'RoomRental', 'LeaseRoomUpdate', $('#LeaseRoomThdManage').serialize(),
                                   function Init() {
                                   },
                                   function callback(_Data) {
                                       var r = _Data.split('|');
                                       HDialog.Info(r[1]);
                                       if (r[0] == "true") {

                                           LoadRoomList();
                                       }
                                   },
                                   function completeCallback() {
                                   },
                                   function errorCallback() {
                                   });
                           }
                       }
                   }, '-',
                   {
                       text: '扩租',
                       iconCls: 'icon-add',
                       handler: function () {

                           SelRooms();

                       }
                   }, '-',
                   {
                       text: '筛选',
                       iconCls: 'icon-search',
                       handler: function () {

                           $('#SearchDlg').parent().appendTo($("form:first"))
                           $('#SearchDlg').dialog('open');
                       }
                   }
                ];


                function InitDiv()
                {
                    var H = $(window).height()-35;
                    var DivH = H;
                    $('#DivTop').css('height', DivH + 'px');
                    
                

                    var TableHeadH = $('#TableHead').height();
                   
                    var H2 = DivH - TableHeadH-49;
                    $('#DivTopCustInfo').css('height', H2 + 'px');

                    $('#DivTopRoom').css('height', H2 + 'px');
                    
                    var HR = H2;
                  
                    $('#RoomInfoList').css('height', HR + 'px');
                    
                    $('#RoomHisInfoList').css('height', HR + 'px');
                    getObject('Table2').style.display = "";
                    getObject('Table3').style.display = "none";
                    


                    var w = $(window).width() * 0.8 -2;
                    $('#RoomInfoList').css('width', w + 'px');
                    $('#RoomHisInfoList').css('width', w + 'px');

                    var HR2 = HR +10;
                    $('#TableContainer1').css('height', HR2 + 'px');
                    $('#LeaseContact').css('height', HR2-5 + 'px');

                    var src = 'LeaseRoomThdContractManage.aspx?OPType=Edit&ContID=' + $('#ContID').val();
                    $('#LeaseContact').attr("src", src);
                    $('#TableContainer2').css('height', HR2 + 'px');
                   

                    var HR3 = (HR2-30) / 2;
                    $('#DGridFee').css('height',   HR3+'px');
                    $('#DGridAuditFee').css('height', HR3 + 'px');

                
                    if ($('#hiOPType').val() == "His")
                    {
                        $('#jszj').hide();
                        $('#fydj').hide();
                        $('#plsc').hide();
                        $('#btnSave').hide();
                        $('#btnChangeName').hide();
                         src = 'LeaseRoomThdContractManage.aspx?OPType=His&ContID=' + $('#ContID').val();
                         $('#LeaseContact').attr("src", src);
                         toolbar = [[]];
                    }

                }
                InitDiv();


                $(".tabs-container li").click(function () {


                    switch ($(this).attr("name")) {

                        case "htdj":
                            LoadLeaseContractNewList();
                            break;
                        case "jfbz":
                            setTimeout("LoadLeaseContractSettingList()", 100)
                            //LoadLeaseContractSettingList();
                            break;
                        case "htfy":
                            setTimeout("LoadFeesList()", 10);
                            break;

                    }


                });
                var column = [[
                    { field: 'RoomSign', title: '房屋编号', width: '160', align: 'left', sortable: true },
                    { field: 'BuildArea', title: '建筑面积', width: '100', align: 'left', sortable: true },
                    {
                        field: 'StartDate', title: '开始时间', width: '120', align: 'left', sortable: true, sortable: true, editor: { type: 'datebox' }
                    },
                    {
                        field: 'EndDate', title: '结束时间', width: '120', align: 'left', sortable: true, sortable: true, editor: { type: 'datebox' }
                    },
                    {
                        field: 'ReletDate', title: '续约时间至', width: '120', align: 'left', sortable: true, sortable: true, editor: { type: 'datebox' }
                    }

                ]];

                var column2 = [[
                  { field: 'RoomSign', title: '房屋编号', width: '160', align: 'left', sortable: true },
                  { field: 'BuildArea', title: '建筑面积', width: '100', align: 'left', sortable: true },
                  {
                      field: 'StartDate', title: '开始时间', width: '100', align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                          var str = formatDate(row.StartDate, "yyyy-MM-dd");
                          return str;
                      }
                  },
                  {
                      field: 'EndDate', title: '结束时间', width: '100', align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                          var str = formatDate(row.EndDate, "yyyy-MM-dd");
                          return str;
                      }
                  },
                  {
                      field: 'ReletDate', title: '续约时间至', width: '100', align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                          var str = formatDate(row.ReletDate, "yyyy-MM-dd");
                          return str;
                      }
                  }

                ]];
               

                function SelRooms() {
                    var varReturn;

                    var w = $(window).width();;
                    var h = $(window).height();;

                    HDialog.Open(w, h, "../dialogNew/MultiRoomLeaseDlg.aspx", '房屋选择', false, function callback(_Data) {


                        if (_Data != "") {//**获得返回 刷新

                           


                            _Data = "[" + _Data + "]";
                            var data = JSON.parse(_Data);


                            if (data.length > 0) {

                                var RoomIDs = '';
                                for (var k = 0; k < data.length; k++) {

                                    RoomIDs = RoomIDs + ',' + data[k].RoomID;


                                }
                                if (RoomIDs.length > 0) {
                                    $('#RoomIDs').val(RoomIDs.substr(1, RoomIDs.length - 1));
                                 
                                }


                                $.tool.DataPostChk('LeaseRoomThdManage', 'RoomRental', 'LeaseRoomReletDetailInsert', $('#LeaseRoomThdManage').serialize(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data.split('|');
                                        HDialog.Info(r[1]);
                                        if (r[0] == "true") {
                                             LoadRoomList();
                                        }


                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }

                        }
                    });

                }
                var editIndex = undefined;
                function LoadRoomList()
                {


                    column = [[
                      { field: 'RoomSign', title: '房屋编号', width: '160', align: 'left', sortable: true },
                      { field: 'BuildArea', title: '建筑面积', width: '100', align: 'left', sortable: true },
                      {
                          field: 'StartDate', title: '开始时间', width: '120', align: 'left', sortable: true, sortable: true, editor: { type: 'datebox' }
                      },
                      {
                          field: 'EndDate', title: '结束时间', width: '120', align: 'left', sortable: true, sortable: true, editor: { type: 'datebox' }
                      },
                      {
                          field: 'ReletDate', title: '续约时间至', width: '120', align: 'left', sortable: true, sortable: true, editor: { type: 'datebox' }
                      }

                    ]];


                    $('#IsDelLive').val(0);

                    $("#RoomInfoList").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: column,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: true,
                        toolbar: toolbar,
                        sortOrder: "asc",
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        onDblClickRow: function (rowIndex, rowData) {
                            if (editIndex != undefined) {
                                $(this).datagrid('endEdit', editIndex);
                            }
                            $(this).datagrid('beginEdit', rowIndex);
                            var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'StartDate' });
                            $(ed.target).focus();
                            editIndex = rowIndex;

                        },
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("RoomRental", "LeaseCustomerLive", "RoomInfoList", param);
                           
                        },
                        onLoadSuccess: function (data) {
                          
                        }
                    });
                    $('#SearchDlg').dialog('close');
                }

                function LoadRoomHisList() {
                    $('#IsDelLive').val(1);


                    column2 = [[
                     { field: 'RoomSign', title: '房屋编号', width: '160', align: 'left', sortable: true },
                     { field: 'BuildArea', title: '建筑面积', width: '100', align: 'left', sortable: true },
                     {
                         field: 'StartDate', title: '开始时间', width: '100', align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.StartDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'EndDate', title: '结束时间', width: '100', align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.EndDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'ReletDate', title: '续约时间至', width: '100', align: 'left', sortable: true, sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.ReletDate, "yyyy-MM-dd");
                             return str;
                         }
                     }

                    ]];

                    $("#RoomHisInfoList").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: column2,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: true,
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("RoomRental", "LeaseCustomerLive", "RoomHisInfoList", param);
                        },
                        onLoadSuccess: function (data) {

                        }
                    });
                    $('#SearchDlg').dialog('close');
                }
             
                $('#btnReturn').click(function () {
                    HDialog.Close();
                });

                var Contcolumn = [[
                      {
                          field: 'ContSign', title: '合同编号', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {
                              var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewContDetail('修改合同信息','" + row.ContID + "');\">" + row.ContSign + "</a>";
                              return str;
                          }
                      },
                      { field: 'Leaser', title: '出租方', width: '100', align: 'left', sortable: true },
                      { field: 'Renter', title: '承租方', width: '100', align: 'left', sortable: true },
                      {
                          field: 'SignDate', title: '签定时间', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.SignDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      { field: 'YearHold', title: '租赁年限', width: '100', align: 'left', sortable: true },
                      {
                          field: 'LeaseBeginDate', title: '计租开始日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.LeaseBeginDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'LeaseEndDate', title: '计租结束日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.LeaseEndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'FavBeginDate', title: '优惠开始日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.FavBeginDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'FavEndDate', title: '优惠结束日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.FavEndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'PostponeDate', title: '顺延起租日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.PostponeDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      { field: 'PayPeriod', title: '缴费周期(月)', width: '100', align: 'left', sortable: true },
                      { field: 'IsEffect', title: '状态', width: '100', align: 'left', sortable: true }

                ]];

                function ViewContDetail(title,ContID)
                {
                    var w = $(window).width();
                    var h = $(window).height();

                    HDialog.Open(w, h, '../RentalNew/LeaseRoomThdContractManage.aspx?OPType=Edit&ContID=' + ContID, title, true, function (_Data) {

                       

                        if (_Data == '1') {
                            HDialog.Info('合同录入成功!');
                            LoadLeaseContractNewList();
                        }

                    });
                }

                var Conttoolbar = [
                  {
                      text: '合同登记',
                      iconCls: 'icon-add',
                      handler: function () {


                          var w = $(window).width();
                          var h = $(window).height();

                          HDialog.Open(w, h, '../RentalNew/LeaseRoomThdContractManage.aspx?OPType=Insert&ContID=' + $('#ContID').val(), '合同登记', true, function (_Data) {

                              if (_Data == '1') {
                                  HDialog.Info('合同录入成功!');
                                  LoadLeaseContractNewList();
                              }

                          });
                      }

                  }
                  //, '-',
                  //{
                  //    text: '删除',
                  //    iconCls: 'icon-cancel',
                  //    handler: function () {

                  //        var rows = $("#TableContainer1").datagrid("getSelected");

                  //        if (rows != null || rows != "") {

                  //            $.tool.DataPostChk('LeaseRoomThdManage', 'RoomRental', 'LeaseContractDelete', 'ContID='+rows.ContID,
                  //                  function Init() {
                  //                  },
                  //                  function callback(_Data) {
                  //                      var r = _Data.split('|');
                  //                      HDialog.Info(r[1]);
                  //                      if (r[0] == "true") {
                  //                          LoadLeaseContractNewList();
                  //                      }


                  //                  },
                  //                  function completeCallback() {
                  //                  },
                  //                  function errorCallback() {
                  //                  });
                  //        }
                  //        else {
                  //            HDialog.Info('请选择合同');
                  //        }
                  //    }
                  //}
                ];


                var ContSettingcolumn = [[
                     { field: 'CustName', title: '费用承担对象', width: '100', align: 'left', sortable: true },
                     { field: 'RoomSign', title: '房屋编号', width: '100', align: 'left', sortable: true },
                     {
                         field: 'DueDate', title: '应收日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.DueDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'BeginDate', title: '开始日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.BeginDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'EndDate', title: '结束日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.EndDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     { field: 'CostName', title: '费用名称', width: '100', align: 'left', sortable: true },
                     { field: 'ContNum', title: '面积', width: '100', align: 'left', sortable: true },
                     { field: 'CalcTypeName', title: '计算方式', width: '100', align: 'left', sortable: true },
                     { field: 'ContPrice', title: '单价', width: '100', align: 'left', sortable: true },
                     { field: 'IncreTypeName', title: '递增方式', width: '100', align: 'left', sortable: true },
                     { field: 'IncreRate', title: '递增率/金额', width: '100', align: 'left', sortable: true },
                     { field: 'IncrePeriod', title: '递增周期', width: '100', align: 'left', sortable: true }

                ]];

                var DeductSettingcolumn = [[
                     { field: 'CustName', title: '费用承担对象', width: '100', align: 'left', sortable: true },
                     { field: 'RoomSign', title: '房屋编号', width: '100', align: 'left', sortable: true },
                     {
                         field: 'DueDate', title: '应收日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.DueDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'BeginDate', title: '开始日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.BeginDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'EndDate', title: '结束日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.EndDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     { field: 'DeductTypeName', title: '提成方式', width: '100', align: 'left', sortable: true },
                     { field: 'DeductRate', title: '提成比例', width: '100', align: 'left', sortable: true },
                     { field: 'PaulEndAmount', title: '月保底金额', width: '100', align: 'left', sortable: true },
                     { field: 'IsConditionName', title: '是否条件', width: '100', align: 'left', sortable: true }
                     
                ]];
             

                //开始条件 StartCondition
                //结束条件 EndCondition
                //提成比例 CondStanAmount


                var FeesColumn = [[
                       { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                        { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },

                        { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                        {
                            field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
                        },
                        {
                            field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
                        { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                        { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                        { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
                        { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true }


                ]];



                var AuditingFeesColumn = [[
                       { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                        { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },

                        { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                        {
                            field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
                        },
                        {
                            field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true }


                ]];

                //合同列表
                function LoadLeaseContractNewList()
                {

                    Contcolumn = [[
                      {
                          field: 'ContSign', title: '合同编号', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {
                              var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewContDetail('修改合同信息','" + row.ContID + "');\">" + row.ContSign + "</a>";
                              return str;
                          }
                      },
                      { field: 'Leaser', title: '出租方', width: '100', align: 'left', sortable: true },
                      { field: 'Renter', title: '承租方', width: '100', align: 'left', sortable: true },
                      {
                          field: 'SignDate', title: '签定时间', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.SignDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      { field: 'YearHold', title: '租赁年限', width: '100', align: 'left', sortable: true },
                      {
                          field: 'LeaseBeginDate', title: '计租开始日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.LeaseBeginDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'LeaseEndDate', title: '计租结束日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.LeaseEndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'FavBeginDate', title: '优惠开始日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.FavBeginDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'FavEndDate', title: '优惠结束日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.FavEndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'PostponeDate', title: '顺延起租日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.PostponeDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      { field: 'PayPeriod', title: '缴费周期(月)', width: '100', align: 'left', sortable: true },
                      { field: 'IsEffect', title: '状态', width: '100', align: 'left', sortable: true }

                    ]];

                    $.tool.DataPost('RoomRental', 'LeaseContractNewList', "page=1&rows=100&" + $("#LeaseRoomThdManage").serialize(),
                      function Init() {
                      },
                      function callback(_Data) {
                          var Data = eval("(" + _Data + ")"); //转换为json对象

                          if (Data.total > 0) {
                              $("#TableContainer1").datagrid({
                                  url: '/HM/M_Main/HC/DataPostControl.aspx',
                                  method: "post",
                                  nowrap: false,
                                  pageSize: top.ListPageSize,
                                  pageList: top.ListPageList,
                                  columns: Contcolumn,
                                  fitColumns: false,
                                  remoteSort: false,
                                  singleSelect: true,
                                  pagination: true,
                                  singleSelect: true,
                                  selectOnCheck: false,
                                  checkOnSelect: false,
                                  rownumbers: true,
                                  border: false,
                                  onBeforeLoad: function (param) {
                                      param = $.JQForm.GetParam("RoomRental", "LeaseContractNewList", "TableContainer1", param);
                                  },
                                  onLoadSuccess: function (data) {

                                  }
                              });
                          }
                          else {
                              $("#TableContainer1").datagrid({
                                  url: '/HM/M_Main/HC/DataPostControl.aspx',
                                  method: "post",
                                  nowrap: false,
                                  pageSize: top.ListPageSize,
                                  pageList: top.ListPageList,
                                  columns: Contcolumn,
                                  fitColumns: false,
                                  toolbar: Conttoolbar,
                                  remoteSort: false,
                                  singleSelect: true,
                                  pagination: true,
                                  singleSelect: true,
                                  selectOnCheck: false,
                                  checkOnSelect: false,
                                  rownumbers: true,
                                  border: false,
                                  onBeforeLoad: function (param) {
                                      param = $.JQForm.GetParam("RoomRental", "LeaseContractNewList", "TableContainer1", param);
                                  },
                                  onLoadSuccess: function (data) {

                                  }
                              });
                          }

                          //SetCheckboxValue();
                      },
                      function completeCallback() {
                      },
                      function errorCallback() {
                      });

                  
                }

                //合同标准
                function LoadLeaseContractSettingList() {

                    ContSettingcolumn = [[
                     { field: 'CustName', title: '费用承担对象', width: '100', align: 'left', sortable: true },
                     { field: 'RoomSign', title: '房屋编号', width: '100', align: 'left', sortable: true },
                     {
                         field: 'DueDate', title: '应收日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.DueDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'BeginDate', title: '开始日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.BeginDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'EndDate', title: '结束日期', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.EndDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     { field: 'CostName', title: '费用名称', width: '100', align: 'left', sortable: true },
                     { field: 'ContNum', title: '面积', width: '100', align: 'left', sortable: true },
                     { field: 'CalcTypeName', title: '计算方式', width: '100', align: 'left', sortable: true },
                     { field: 'ContPrice', title: '单价', width: '100', align: 'left', sortable: true },
                     { field: 'IncreTypeName', title: '递增方式', width: '100', align: 'left', sortable: true },
                     { field: 'IncreRate', title: '递增率/金额', width: '100', align: 'left', sortable: true },
                     { field: 'IncrePeriod', title: '递增周期', width: '100', align: 'left', sortable: true }

                    ]];

                    $("#TableContainer2").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: ContSettingcolumn,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: true,
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("RoomRental", "LeaseContractSettingList", "TableContainer2", param);
                        },
                        onLoadSuccess: function (data) {

                        }
                    });
                }

                //经营标准
                function LoadLeaseDeductSettingList() {

                }


                //费用情况
                function LoadFeesList() {
                    LoadLeaseContractFeesList();
                    LoadAuditingLeaseConFeesDetailList();
                }

                function LoadLeaseContractFeesList() {
                    $("#DGridFee").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        nowrap: false,
                        title:'已审核/处理费用',
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: FeesColumn,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: true,
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("RoomRental", "LeaseContractFeesList", "DGridFee", param);
                        },
                        onLoadSuccess: function (data) {

                        }
                    });
                }
                function LoadAuditingLeaseConFeesDetailList() {
                    $("#DGridAuditFee").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        nowrap: false,
                        title: '未审核费用',
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: AuditingFeesColumn,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: true,
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("RoomRental", "AuditingLeaseConFeesDetailList", "DGridAuditFee", param);
                        },
                        onLoadSuccess: function (data) {

                        }
                    });
                }

                LoadLeaseContractNewList();
                LoadLeaseContractSettingList();

                function CaluFees()
                {
                    if ($('#hAuditing').val() != "true")
                    {
                        //计算费用
                        $.tool.DataPostChk('LeaseRoomThdManage', 'RoomRental', 'LeaseConFeesCalc', 'ContID=' + $('#ContID').val(),
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data.split('|');
                                        HDialog.Info(r[1]);
                                        if (r[0] == "true") {
                                            LoadFeesList();
                                        }


                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                    }
                    else
                    {
                        HDialog.Info('合同处于审核中或者合同已审核!');
                    }
                }
                function AddFees() {
                    if ($('#hAuditing').val() != "true")
                    {

                        var w = 900;
                        var h = 450;

                        HDialog.Open(w, h, '../ChargesNew/FeesSporadicManage.aspx?OPType=Insert&LeaseContID=' + $('#ContID').val(), '新增费用', false, function (_Data) {

                            if (_Data != '') {
                                HDialog.Info(_Data);
                                LoadFeesList();
                            }

                        });
                    }
                    else
                    {
                        HDialog.Info('合同处于审核中或者合同已审核!');
                    }
                }
                function DeleteFees() {
                    if ($('#hAuditing').val() != "true")
                    {
                        //计算费用
                        $.tool.DataPostChk('LeaseRoomThdManage', 'RoomRental', 'AuditingLeaseConFeesDel', 'ContID=' + $('#ContID').val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                var r = _Data.split('|');
                                HDialog.Info(r[1]);
                                if (r[0] == "true") {
                                    LoadFeesList();
                                }


                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                    else
                    {
                        HDialog.Info('合同处于审核中或者合同已审核!');
                    }
                }
            </script>

		</form>
	</body>
</HTML>


