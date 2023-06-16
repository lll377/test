<%@ Page language="c#" Codebehind="CostStanSettingBatchManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.CostStanSettingBatchManage" %>
<%@ Register TagPrefix="dslbc" NameSpace="DualSelectListBoxControl" Assembly="DualSelectListBoxControl" %>
<!DOCTYPE HTML >
<HTML>
	<HEAD>
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
        <script language="javascript">
		<!--
			function btnClear_OnClick()
			{
				CostStanSettingBatchManage.StanID.value="";
				CostStanSettingBatchManage.CostID.value="";
				CostStanSettingBatchManage.CostName.value="";
				CostStanSettingBatchManage.StanName.value="";
				CostStanSettingBatchManage.hiCostName.value="";
				CostStanSettingBatchManage.hiStanName.value="";
				
				CostStanSettingBatchManage.CarparkID.value="";
				CostStanSettingBatchManage.CarparkName.value="";
			}
			function CheckData()
			{

				if(CostStanSettingBatchManage.CostID.value=="")
				{
					HDialog.Info("请选择费用项目,此项不能为空!");
					CostStanSettingBatchManage.btnSelCost.focus();
					return false;
				}
				if(CostStanSettingBatchManage.StanID.value=="")
				{
				    HDialog.Info("请选择费用标准,此项不能为空!");
					CostStanSettingBatchManage.btnSelStan.focus();
					return false;
				}
			
								
				return true;
			}
			
			function btnSelCost_OnClick()
			{
				var varReturn;
				varReturn=showModalDlg("../dialog/CorpCommCostDlg.aspx"+"?Ram="+Math.random(),"",500,400);
				//alert("["+varReturn+"]");
				if(varReturn!="")
				{//**获得返回 刷新
					var varObjects=varReturn.split("\t");
					
					CostStanSettingBatchManage.CostID.value=varObjects[0];
					CostStanSettingBatchManage.CostName.value=varObjects[2];
					CostStanSettingBatchManage.hiCostName.value=varObjects[2];
				
					return true;
				}
				
				return false;
			}
			
			function btnSelStan_OnClick()
			{
				var tmpCostID = CostStanSettingBatchManage.CostID.value;
				if (tmpCostID =="")
				{
				    HDialog.Info("请选择费用项目,此项不能为空!");
					CostStanSettingBatchManage.btnSelCost.focus();
					return false;	
				}
				
				var varReturn;
				varReturn=showModalDlg("../dialog/StanDlg.aspx?CostID="+tmpCostID,"",650,400);
				//alert("["+varReturn+"]");
				if(varReturn!="")
				{//**获得返回 刷新
					var varObjects=varReturn.split("\t");
					
					CostStanSettingBatchManage.StanID.value=varObjects[0];
					CostStanSettingBatchManage.StanName.value=varObjects[4];
					CostStanSettingBatchManage.hiStanName.value=varObjects[4];
					
					CostStanSettingBatchManage.StanFormula.value=varObjects[5];
					CostStanSettingBatchManage.hiChargeCycle.value=varObjects[8];
				
					return true;
				}
				
				return false;
			}
			
			function btnSelCarpark_OnClick()
			{
				var varReturn;
				varReturn=showModalDlg("../dialog/CarparkDlg.aspx"+"?Ram="+Math.random(),"",650,400);
				//alert("["+varReturn+"]");
				if(varReturn!="")
				{//**获得返回 刷新
					var varObjects=varReturn.split("\t");
					
					CostStanSettingBatchManage.CarparkID.value=varObjects[0];
					CostStanSettingBatchManage.CarparkName.value=varObjects[1];
				
					return true;
				}
				
				return false;
			}	
			
		//-->
		</script>
	</HEAD>
	<body style="overflow-y:auto">
		<form id="CostStanSettingBatchManage" method="post" runat="server">
            <INPUT id="PageIndex" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="PageIndex"
							runat="server"><INPUT id="SysCostSign" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="SysCostSign"
							runat="server">
           <INPUT id="tmpSQL1" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="tmpSQL1"
							runat="server"> 
              <INPUT id="HiLiveType" value="0" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="HiLiveType"
							runat="server"> 
			<TABLE class="DialogTable" style="width: 100%">
									<tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">标准选择</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContentSearch">
                <input id="CostName"
                        name="CostName" class="easyui-searchbox" searcher="SelCost" data-options="editable:false" runat="server"><input class="button_sel" id="btnSelCost" 
                        type="button" value=" " name="btnSelCost" runat="server"><input id="hiCostName" style="width: 8px; height: 22px" type="hidden"
                        size="1" name="hiCostName" runat="server"><input id="CostID" style="width: 8px; height: 22px" type="hidden"
                        size="1" name="CostID" runat="server"></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContentSearch">
                    <input id="StanName" class="easyui-searchbox"
                    name="StanName" searcher="SelStan" data-options="editable:false" runat="server"><input class="button_sel" id="btnSelStan"
                    type="button" value=" " name="btnSelStan" runat="server"><input id="StanID" style="width: 8px; height: 22px" type="hidden"
                    size="1" name="StanID" runat="server"><input id="hiStanName" style="width: 8px; height: 22px" type="hidden"
                    size="1" name="hiStanName" runat="server">
                    <input id="StanFormula" style="width: 8px; height: 22px" type="hidden"
                    size="1" name="StanFormula" runat="server">
                    
                </td>
            </tr>
										<TR>
											<TD class="TdTitle">计费周期</TD>
											<TD class="TdContent"><SELECT id="ChargeCycle" name="ChargeCycle" runat="server">
													<OPTION selected></OPTION>
												</SELECT><INPUT id="hiChargeCycle" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="hiChargeCycle"
													runat="server"></TD>
                                               <td class="TdTitle">计费方式</td>
                                                <td class="TdContent"><SELECT id="PayType" name="PayType" runat="server">
													<OPTION selected></OPTION>
												</SELECT></td>
											
										</TR>
										<TR>
                                           <TD class="TdTitle">出租时自动转给租户</TD>
											<TD class="TdContent"><SELECT id="IsInherit" name="IsInherit" runat="server">
													<OPTION selected></OPTION>
												</SELECT></TD>
											<TD class="TdTitle">
												<asp:Label id="lbMeterSign" runat="server">表　　计</asp:Label></TD>
											<TD class="TdContent">
												<asp:dropdownlist id="MeterSign" runat="server"></asp:dropdownlist></TD>
										</TR>
																	<tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">房号选择</span> </td>
            </tr>
										<TR>
											<TD CLASS="TdTitle" >房屋范围</TD>
											<TD class="TdContent" align="center" COLSPAN="3">
												<TABLE WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="1">
													<TR>
														<TD width="30%"></TD>
														<TD>
															<asp:DropDownList id="DListRange" runat="server" AutoPostBack="True">
                                                                <asp:ListItem Value="0">按组团</asp:ListItem>
																<asp:ListItem Value="1">按楼宇</asp:ListItem>
																<asp:ListItem Value="2">按单元</asp:ListItem>
																<asp:ListItem Value="3">按楼层</asp:ListItem>
															</asp:DropDownList></TD>
														<TD width="30%"></TD>
													</TR>
                                                    
												</TABLE>
                                                <table WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="1">
                                                    <tr>
                                                        <TD width="15%"></TD>
                                                        <TD>
                                                            	<dslbc:DualSelectListBox runat="server" Id="DualListField">
													            <LeftListStyle Width="300px" Height="250px"></LeftListStyle>
													            <RightListStyle Width="300px" Height="250px"></RightListStyle>
												            </dslbc:DualSelectListBox>
                                                        </TD>
                                                    </tr>
                                                </table>
											
											</TD>
										</TR>
										<TR>
											<TD class="TdTitle">收费类型</TD>
											<TD class="TdContent"><SELECT id="ChargeTypeID" name="ChargeTypeID" runat="server">
													<OPTION selected></OPTION>
												</SELECT></TD>
											<TD class="TdTitle"></TD>
											<TD class="TdContent"><INPUT class="Control_ItemInput" id="CarparkName" style="WIDTH: 45%; HEIGHT: 19px" readOnly
														maxLength="50" size="2" name="CarparkName" runat="server"><INPUT class="button_sel" id="btnSelCarpark" style="HEIGHT: 22px" onclick="javascript:if(btnSelCarpark_OnClick()==false) return false;"
														type="button" value=" " name="btnSelCarpark" runat="server"><INPUT class="Control_ItemInput" id="CarparkID" style="WIDTH: 8px; HEIGHT: 22px" type="hidden"
														size="1" name="CarparkID" runat="server">
													<asp:dropdownlist id="ParkType" runat="server" Width="54px"></asp:dropdownlist></TD>
										</TR>
																		<tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">客户选择</span> </td>
            </tr>
										<TR>
											<TD class="TdTitle">客户类别</TD>
											<TD class="TdContent"><SELECT id="CustTypeID" name="CustTypeID" runat="server">
													<OPTION selected></OPTION>
												</SELECT></TD>
											<TD class="TdTitle">设置对象</TD>
											<TD class="TdContent"><INPUT id="CkLiveType0" type="radio" CHECKED value="on" name="CkLiveType" onclick="RadioCheck(0);" runat="server">当前住户<INPUT id="CkLiveType1" type="radio" name="CkLiveType" onclick="RadioCheck(1);" runat="server" VALUE="CkLiveType1">房屋业主<INPUT id="CkLiveType2" type="radio" name="CkLiveType" onclick="RadioCheck(2);" runat="server" VALUE="CkLiveType2">房屋租户<INPUT id="CkLiveType3" type="radio" value="Radio1" onclick="RadioCheck(3);" name="CkLiveType" runat="server" DESIGNTIMEDRAGDROP="110"><INPUT id="CkLiveType4" type="radio" value="Radio2" onclick="RadioCheck(4);" name="CkLiveType" runat="server"></TD>
										</TR>
										<TR>
											<TD align="left" colSpan="4"></TD>
										</TR>
                                        <TR>
					                        <TD align="center" colspan="4"><INPUT class="button" id="btnSet"  onclick="javascript:if(CheckData()==false) return false;"
							                        type="button" value="设置" name="btnSet" runat="server">
						                      </TD>
				                        </TR>
			</TABLE>
            <script type="text/javascript">
                $('#btnSelCost').hide();
                $('#btnSelStan').hide();
                $('#ChargeCycle').val('');

                function RadioCheck(LiveType)
                {
                    $('#HiLiveType').val(LiveType);
                }

                function SelCost() {

                   
                    var vCommID = $('#CommID').val();
                    var tmpCostGeneType = $('#CostGeneType').val();
                    var  conent = "../dialogNew/CorpCommCostDlg.aspx" + "?Ram=" + Math.random();
                    


                    HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


                        if (_Data != "") {//**获得返回 刷新
                            //var varObjects = _Data.split("\t");

                            var data = JSON.parse(_Data);
                            $('#CostName').searchbox("setValue", data.CostName);
                            $('#CostID').val(data.CostID);
                            $('#hiCostName').val(data.CostName);
                          
                            document.getElementById('btnSelCost').click();
                        }
                    });

                }
                function SelStan() {
                
                    var tmpCostID = $('#CostID').val();

                    if (tmpCostID == "") {
                        HDialog.Info("请选择费用项目,此项不能为空!");


                    }
                    else {
                        var conent = "../dialogNew/NewStanDlg.aspx?CostID=" + tmpCostID;


                        HDialog.Open('700', '400', conent, '收费标准选择', false, function callback(_Data) {


                            if (_Data != "") {//**获得返回 刷新


                                var data = JSON.parse(_Data);

                                $('#StanID').val(data.StanID);
                                $('#StanName').searchbox('setValue', data.StanName);
                                $('#hiStanName').val(data.hiStanName);

                                $('#StanFormula').val(data.StanFormula);
                                $('#StanFormulaName').val(data.StanFormulaName);
                                $('#StanAmount').val(data.StanAmount);
                                $('#ChargeCycle').val(data.ChargeCycle);
                                $('#CorpStanID').val(data.CorpStanID);

                                document.getElementById('btnSelStan').click();
                            }
                        });

                    }
                }
                $('#btnSet').click(function () {


                    if ($('#CostID').val() == "") {
                        HDialog.Info("请选择费用项目,此项不能为空!");
                      
                       
                    }
                    else if ($('#StanID').val() == "") {
                        HDialog.Info("请选择费用标准,此项不能为空!");


                    }
                    else {

                        var SelAll = document.getElementById("DualListField_RightBox").length;
                        var tmpSQL1 = "";

                        for (var i = 0; i < SelAll; i++) {
                            var strval = document.getElementById("DualListField_RightBox").options[i].value//参数值
                            if (strval != "") {
                                
                                var arrval = strval.split(',');
                             
                                if ($('#DListRange').val() != '0') {
                                    
                                    //按楼宇						
                                    tmpSQL1 = tmpSQL1 + " or (a.BuildSNum=\"" + arrval[1] + "\"";

                                    //**按单元
                                    if (arrval[2] != "0" && arrval[2] != "") {
                                        tmpSQL1 = tmpSQL1 + " and a.UnitSNum=\"" + arrval[2] + "\"";
                                    }

                                    //**按楼层
                                    if (arrval[3] != "0" && arrval[3] != "") {
                                        tmpSQL1 = tmpSQL1 + " and a.FloorSNum=\"" + arrval[3] + "\"";
                                    }

                                    tmpSQL1 = tmpSQL1 + ")";
                                }
                                else {
                                    //按组团						
                                    tmpSQL1 = tmpSQL1 + " or (a.RegionSNum=\"" + arrval[0] + "\" )";
                                }
                            }
                        }
                        $('#tmpSQL1').val(tmpSQL1);
                        //alert($('#tmpSQL1').val())

                        $.tool.DataPost('CostStanSetting', "BatchSetting", $('#CostStanSettingBatchManage').serialize(),
                               function Init() {
                           
                               },
                               function callback(_Data) {
                                   if (_Data != "")
                                   {
                                       HDialog.Info(_Data.split('|')[1]);
                                   }
                        
                               },
                               function completeCallback() {

                               },
                               function errorCallback() {
                          
                               });
                        }

                });
            </script>
		</form>
	</body>
</HTML>
