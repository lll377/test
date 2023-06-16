<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreCostsInsManage.aspx.cs" Inherits="M_Main.ChargesNew.PreCostsInsManage" %>

<!DOCTYPE html>
<html>
<head>
    <title>预存收款</title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>

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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        .panel {
            text-align: center;
        }

        .button_sel {
            font-size: 12px;
            width: 25px;
            height: 20px;
            border-style: none;
            background-color: transparent;
            background-image: url('../images/Button_Select.jpg');
            background-repeat: no-repeat;
        }
    </style>
    <script type="text/javascript">
		<!--
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }


        $.fn.combobox.defaults.filter = function (q, row) {
            var opts = $(this).combobox('options');
            return row[opts.textField].indexOf(q) >= 0;
        }
        $(document).ready(function () {
            if (GetQueryString("ShowType") == "1") {
                $('body').pagewalkthrough({
                    name: 'introduction3',
                    steps: [{
                        wrapper: '#btnOK',
                        popup: {
                            content: '<span style=\'font-size:30px\'>设置预存费用后点击添加</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    },
                    {
                        wrapper: '#btnOverOK',
                        popup: {
                            content: '<span style=\'font-size:30px\'>添加完所有费用后点击完成添加</span>',
                            type: 'tooltip',
                            position: 'top'
                        }
                    }, {
                        wrapper: '#BillType',
                        popup: {
                            content: '<span style=\'font-size:30px\'>选择收据类别</span>',
                            type: 'tooltip',
                            position: 'top'
                        }
                    },
                    {
                        wrapper: '#Bills',
                        popup: {
                            content: '<span style=\'font-size:30px\'>选择收据号并勾选开据发票</span>',
                            type: 'tooltip',
                            position: 'left'
                        }
                    },
                   
                    {
                        wrapper: '#btnSave',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击预存确认</span>',
                            type: 'tooltip',
                            position: 'top'
                        },
                        onLeave: function (e) {
                            if (e) {
                                window.parent.Close();
                            }
                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '结束 &#10004;'

                        }
                    },
                    onClose: function () {
                        window.parent.Close();
                    }
                })
             
                $('body').pagewalkthrough('show');
            }
        }

        )
			//获得预交金额
			function GetPrecAmount() 
			{ 						
				var strCustID = getObject("CustID").value;
				var strRoomID = getObject("RoomID").value;
				var strHandID = getObject("HandID").value;
				var strCostIDs = getObject("CostIDs").value;
				var strMonthNum = getObject("MonthNum").value;												
								
				if ((strCustID!="")&&(strCostIDs!="")&&(strMonthNum!=""))
				{				
					Request.sendPOST("../Charges/GetPrecAmount.aspx","CustID="+strCustID+"&RoomID="+strRoomID+"&HandID="+strHandID+"&CostIDs="+strCostIDs+"&MonthNum="+strMonthNum,callbackGetPrecAmount)
				}
				
			} 
			function callbackGetPrecAmount(xmlHttp) 
			{	
				var varReturn = xmlHttp.responseText;
				
				var varObjects=varReturn.split("\t");
				

				if (varObjects[0]!="")
				{
					getObject("results").innerHTML = varObjects[0];	
					//HDialog.Info();
				}
				if (varObjects[1]!="") 
				{
					getObject("PrecAmount").value = varObjects[1];
				}
				
				//HDialog.Info(xmlHttp.responseText);
			}
			
			function CheckChargeMode()
			{
			   
			    var varChargeMode = $("#ChargeMode").find("option:selected").text();
				

			    if (varChargeMode == "扫码支付") {
			        $('#btnSave').hide();
			        $('#btnPayment').show();
			        $('#CustPaymentID').removeAttr("disabled");
			        $('#CustPaymentID').focus();// 135724404116692165


			    }
			    else {
			        $('#btnSave').show();
			        $('#btnPayment').hide();
			        $('#CustPaymentID').val('');
			        $('#CustPaymentID').attr("disabled", "disabled");
			    }

				if(varChargeMode == "现金")
				{
					PreCostsInsManage.RemitterUnit.readOnly = true;
					PreCostsInsManage.BankName.disabled = true;
					PreCostsInsManage.BankAccount.readOnly = true;
					PreCostsInsManage.ChequeBill.readOnly = true;
					PreCostsInsManage.btnSelRemitterUnit.disabled = true;					
					
					PreCostsInsManage.RemitterUnit.value = "";
					PreCostsInsManage.BankName.value = "";
					PreCostsInsManage.BankAccount.value = "";
					PreCostsInsManage.ChequeBill.value = "";
				}
				else
				{
					PreCostsInsManage.RemitterUnit.readOnly = false;
					PreCostsInsManage.BankName.disabled = false;
					PreCostsInsManage.BankAccount.readOnly = false;
					PreCostsInsManage.ChequeBill.readOnly = false;
					PreCostsInsManage.btnSelRemitterUnit.disabled = false;

					if(varChargeMode == "多种收款方式")
					{						
						btnSelChargeMode_OnClick();						
					}
					else
					{
						if(varChargeMode != "")
						{
							PreCostsInsManage.ChargeModes.value = "";
							PreCostsInsManage.hiChargeModes.value = "";
							PreCostsInsManage.ChargeModeAmount.value = "";
						}
					}
				}				
			}
			
			function btnSelChargeMode_OnClick()
			{
			   
				getObject("ChargeMode").value = "多种收款方式";
				
				
				var iTotalAmount = 0;
				var varTotalSumAmount = getObject("TotalSumAmount").value
				if(varTotalSumAmount != "")
				{
					iTotalAmount = parseFloat(varTotalSumAmount);
				}
				
				var varReturn;
				
				HDialog.Open(650, 430, "../dialogNew/ChargeModeDlg.aspx?TotalAmount=" + iTotalAmount + "&Rdm=" + Math.random(), '选择多种收款方式', false, function callback(_Data) {

				    if (_Data != '') {
				        var varObjects = _Data.split("\t");
				        $('#ChargeModes').val(varObjects[0]);
				        $('#hiChargeModes').val(varObjects[1]);
				        $('#ChargeModeAmount').val(varObjects[2]);
				    }
				    else {
				        getObject("ChargeMode").value = "";
				    }

				    ////HDialog.Info("["+varReturn+"]");
				    //if (varReturn != "") {//**获得返回 刷新
				    //    var varObjects = varReturn.split("\t");

				    //    PreCostsInsManage.ChargeModes.value = varObjects[0];
				    //    PreCostsInsManage.hiChargeModes.value = varObjects[1];
				    //    PreCostsInsManage.ChargeModeAmount.value = varObjects[2];

				    //    return true;
				    //}
				    //else {
				    //    getObject("ChargeMode").value = "";
				    //}

				});

				//varReturn=showModalDlg("../dialogNew/ChargeModeDlg.aspx?TotalAmount="+iTotalAmount+"&Rdm="+Math.random(),"",650,430);
										
				////HDialog.Info("["+varReturn+"]");
				//if(varReturn!="")
				//{//**获得返回 刷新
				//	var varObjects=varReturn.split("\t");
											
				//	PreCostsInsManage.ChargeModes.value=varObjects[0];
				//	PreCostsInsManage.hiChargeModes.value=varObjects[1];
				//	PreCostsInsManage.ChargeModeAmount.value=varObjects[2];
										
				//	return true;
				//}
				//else
				//{
				//	getObject("ChargeMode").value = "";
				//}
								
				return false;
			}
			//$('#HandID').combobox({
			//    valueField: 'HandID',
			//    editable: true,
			//    required: true,
			//    filter: function (q, row) {
			//        var opts = $(this).combobox('options');
			//        return row[opts.textField].indexOf(q) >= 0;//这里改成>=即可在任意地方匹配  
			//    },
			//    data: d.rows,
			//});
			function CheckData()
			{
				if(PreCostsInsManage.CustID.value=="0")	
				{
					PreCostsInsManage.CustID.value="";
				}

				if(PreCostsInsManage.CustID.value=="")
				{
					HDialog.Info("请选择客户,此项不能为空!");
					PreCostsInsManage.btnSelCust.focus();
					return false;
				}

				if (getObject("IsInvoice").checked == false)
				{
				    if (getObject("BillType").value == "") {
				        HDialog.Info("请选择收据类别!");
				        return false;
				    }

					if (PreCostsInsManage.BillType.value != "系统票号") {
					    if (PreCostsInsManage.BillsSign.value == "") {
					        HDialog.Info("请选择收据号!");
					        PreCostsInsManage.btnSelBill.focus();
					        return false;
					    }
					}
				}
				
				if (getObject("IsInvoice").checked == true)
				{

				    if (getObject("InvoiceType").value == "") {
				        HDialog.Info("请选择发票类别!");
				        return false;
				    }

					if (getObject("InvoiceBill").value == "")
					{
						HDialog.Info("请选择发票号!");
						PreCostsInsManage.btnSelInvoiceBill.focus();
						return false;
					}
				}	
				
				if(PreCostsInsManage.ChargeMode.value=="")
				{
					if(PreCostsInsManage.hiChargeModes.value=="")
					{
						HDialog.Info("请选择收款方式,此项不能为空!");
						PreCostsInsManage.ChargeMode.focus();
						return false;
					}
				}	
				
								
				var varChargeMode = PreCostsInsManage.ChargeMode[PreCostsInsManage.ChargeMode.selectedIndex].innerText;
				
				var varhiChargeModes = PreCostsInsManage.hiChargeModes.value;
				
				if( (PreCostsInsManage.RemitterUnit.value != "") || (PreCostsInsManage.BankAccount.value != "")
					|| (PreCostsInsManage.BankName.value != "") || (PreCostsInsManage.ChequeBill.value != ""))
				{
					if(varChargeMode == "现金")
					{
						HDialog.Info("请选择其它收款方式！");
						PreCostsInsManage.ChargeMode.focus();
						return false;
					}
				}
								
				//定额发票
				var strIsFixed = getObject("IsFixed").value;
				
				var iTotalAmount = 0;
				var iInvoiceAmount = 0;				
				
				if(strIsFixed == "1")
				{	
					if(getObject("TotalSumAmount").value != "")
					{					    
					    iTotalAmount = parseFloat(parseFloat(getObject("TotalSumAmount").value).toFixed(2));
					}					
					if(getObject("InvoiceAmount").value != "")
					{
					    iInvoiceAmount = parseFloat(parseFloat(getObject("InvoiceAmount").value).toFixed(2));						
					}					
					
					if(iTotalAmount > 0)
					{
						if(iTotalAmount != iInvoiceAmount)
						{
							HDialog.Info("定额发票金额与收款金额不相等!");
							PreCostsInsManage.btnSelInvoiceBill.focus();
							return false;
						}
					}
				}
				
				var iChargeModeAmount = 0;
				
				if((varChargeMode != "") && (varhiChargeModes != ""))
				{
					if(getObject("TotalSumAmount").value != "")
					{					    
					    iTotalAmount = parseFloat(parseFloat(getObject("TotalSumAmount").value).toFixed(2));
					}
					
					if(getObject("ChargeModeAmount").value != "")
					{
					    iChargeModeAmount = parseFloat(parseFloat(getObject("ChargeModeAmount").value).toFixed(2));						
					}
					
					if(iTotalAmount > 0)
					{
						if(iTotalAmount != iChargeModeAmount)
						{
							HDialog.Info("收款方式金额与收款金额不相等!");							
							return false;
						}
					}
				}
				$("#btnSave").attr("disabled", "disabled");
				return true;
			}
			
			function btnOK_Onclick()
            {

				if(PreCostsInsManage.CustID.value=="0")	
				{
					PreCostsInsManage.CustID.value="";
                }

				if(PreCostsInsManage.CustID.value=="")
				{
					HDialog.Info("请选择客户,此项不能为空!");
					PreCostsInsManage.btnSelCust.focus();
					return false;
                }

                if(PreCostsInsManage.CostIDs.value=="")
				{
					HDialog.Info("请选择冲抵项目,此项不能为空!");
					return false;
				}
							
				if(PreCostsInsManage.PrecAmount.value=="")
				{					
					HDialog.Info("请输入预交金额,此项不能为空!");
					PreCostsInsManage.PrecAmount.focus();
					return false;
				}
				if (parseFloat(PreCostsInsManage.PrecAmount.value)<=0)
				{
					HDialog.Info("预交金额应大于零!");
					PreCostsInsManage.PrecAmount.focus();
					return false;
				}							
				
				return true;
			}
			
			function btnSelRoom_OnClick()
			{
				var varReturn;
				varReturn=showModalDlg("../dialog/RoomDlg.aspx"+"?Ram="+Math.random(),"",650,450);
				
				if(varReturn!="")
				{//**获得返回 刷新
					var varObjects=varReturn.split("\t");
					
					PreCostsInsManage.RoomID.value=varObjects[0];
					PreCostsInsManage.RoomSign.value=varObjects[2];
					PreCostsInsManage.hiRoomSign.value=varObjects[2];
					
					PreCostsInsManage.CustID.value=varObjects[1];
					PreCostsInsManage.CustName.value=varObjects[3];
					PreCostsInsManage.hiCustName.value = PreCostsInsManage.CustName.value;
					//HDialog.Info(varReturn);
					GetPrecAmount();
					
					return true;
				}
				
				return false;
			}
			
			function btnSelCust_OnClick()
			{
				var varReturn;
				varReturn=showModalDlg("../dialog/CustDlg.aspx"+"?Ram="+Math.random(),"",650,450);
				//HDialog.Info("["+varReturn+"]");
				if(varReturn!="")
				{//**获得返回 刷新
					var varObjects=varReturn.split("\t");
					
					PreCostsInsManage.CustID.value=varObjects[0];
					PreCostsInsManage.CustName.value=varObjects[1];
					PreCostsInsManage.hiCustName.value=varObjects[1];
					
					PreCostsInsManage.RoomSign.value = "";
					PreCostsInsManage.RoomID.value = "";
					PreCostsInsManage.hiRoomSign.value = "";
					
					GetPrecAmount();
				
					return true;
				}
				
				return false;
			}
			
			
			//function SelRoomID_OnChange()
			//{
			//	PreCostsInsManage.RoomID.value = PreCostsInsManage.SelRoomID.options[PreCostsInsManage.SelRoomID.selectedIndex].value;
			//	PreCostsInsManage.RoomSign.value = PreCostsInsManage.SelRoomID.options[PreCostsInsManage.SelRoomID.selectedIndex].text;
			//	PreCostsInsManage.hiRoomSign.value = PreCostsInsManage.RoomSign.value;
			//	
			//	GetPrecAmount();
			//	
			//}
			
			function btnSelCostIDs_OnClick()
			{
				var strCostIDs = PreCostsInsManage.CostIDs.value;
				var strCostNames = escape(PreCostsInsManage.hiCostNames.value);
				//HDialog.Info(PreCostsInsManage.hiCostNames.value);
				
				varReturn=showModalDlg("../dialog/MultiCostDlg.aspx?CostIDs="+strCostIDs+"&CostNames="+strCostNames+"&Ram="+Math.random(),"",650,430);
				
				//HDialog.Info(varReturn);
				//**获得返回的参数信息				
				if(varReturn!="")
				{
					var varObjects=varReturn.split("\t");
					
					PreCostsInsManage.CostIDs.value=varObjects[0];
					PreCostsInsManage.CostNames.value=varObjects[1];
					PreCostsInsManage.hiCostNames.value=varObjects[1];			
															
					//HDialog.Info(PreCostsInsManage.CostIDs.value);
					//return true;
				}
				else
				{
					PreCostsInsManage.CostIDs.value="";
					PreCostsInsManage.CostNames.value="";
					PreCostsInsManage.hiCostNames.value="";
					
				}

				GetPrecAmount();

				return true;								
				
			}
			function btnMemo()
			{
				
				if(PreCostsInsManage.BeginDate.value==""&&PreCostsInsManage.EndDate.value=="")
				{
					PreCostsInsManage.PrecMemo.value="";
				}
				if(PreCostsInsManage.BeginDate.value==""&&PreCostsInsManage.EndDate.value!="")
				{
					PreCostsInsManage.PrecMemo.value="预交期间"+"  "+"至"+PreCostsInsManage.EndDate.value;
			
				}
				if(PreCostsInsManage.BeginDate.value!=""&&PreCostsInsManage.EndDate.value=="")
				{
					PreCostsInsManage.PrecMemo.value="预交期间"+PreCostsInsManage.BeginDate.value+"至";
			
				}
				if(PreCostsInsManage.BeginDate.value!=""&&PreCostsInsManage.EndDate.value!="")
				{
					PreCostsInsManage.PrecMemo.value="预交期间"+PreCostsInsManage.BeginDate.value+"至"+PreCostsInsManage.EndDate.value;
			
				}
			}
			
			//收据类别
			function onchangeBillType()
			{
				var strBillType = getObject("BillType").value;
				var strBillsSign = getObject("BillsSign").value;
				
				Request.sendPOST("GetFirstBillsSign.aspx","InvoiceType="+strBillType+"&BillsSign="+strBillsSign+"&Rdm="+Math.random() ,callbackBillType);				
			}
			
			function callbackBillType(xmlHttp)
			{
				var varReturn = xmlHttp.responseText;				
				
				if (varReturn!="")
				{
					var Search = eval('('+varReturn+')');					
					
					var SearchData = Search.SelData.Data;
					
					//getObject("BillsSign").value = "";
					//getObject("hiBillsSign").value = "";	
					
					//for(var i=0; i<SearchData.length; i++)
					//{
					//	getObject(SearchData[i].Name).value = SearchData[i].Val;
				    //}				
					$('#BillsSign').searchbox("setValue", SearchData[0].Val);
					$('#hiBillsSign').val(SearchData[0].Val);
				}
				else
				{
				    $('#BillsSign').searchbox("setValue", '');
				    $('#hiBillsSign').val('');
				}
			}
			
			
			//发票类别
			function onchangeInvoiceType()
			{
				var strInvoiceType = getObject("InvoiceType").value;
				var strBillsSign = getObject("InvoiceBill").value;
				
				Request.sendPOST("GetFirstBillsSign.aspx","InvoiceType="+strInvoiceType+"&BillsSign="+strBillsSign+"&Rdm="+Math.random() ,callbackInvoiceType);				
			}
			
			function callbackInvoiceType(xmlHttp)
			{
				var varReturn = xmlHttp.responseText;				
				
				if (varReturn!="")
				{
					var Search = eval('('+varReturn+')');					
					
					var SearchData = Search.SelData.Data;
					
					getObject("InvoiceBill").value = "";
					getObject("ReceMemo").value = "";
					getObject("IsFixed").value = "";
					getObject("FixedAmount").value = "";
					getObject("hiInvoiceBill").value = "";
					getObject("hiInvoiceBills").value = "";
					
					for(var i=0; i<SearchData.length; i++)
					{
						getObject(SearchData[i].Name).value = SearchData[i].Val;
					}
					
					//定额发票
					var strIsFixed = getObject("IsFixed").value;
					if(strIsFixed == "1")
					{
						getObject("InvoiceAmount").value = getObject("FixedAmount").value;
					}
					else
					{
						getObject("InvoiceAmount").value = getObject("TotalSumAmount").value;
					}
				}
				else
				{
					getObject("InvoiceBill").value = "";
					getObject("ReceMemo").value = "";
					getObject("IsFixed").value = "";
					getObject("FixedAmount").value = "";
					getObject("hiInvoiceBill").value = "";
					getObject("hiInvoiceBills").value = "";
				}
			}
			
			
		
			
			function btnSelBill_OnClick()
			{
				var strBillTypeID = getObject("BillType").value;
				
				if((strBillTypeID == "0")||(strBillTypeID == ""))
				{
					HDialog.Info("请选择收据类别,此项不能为空!");
					PreCostsInsManage.BillType.focus();	
					return false;
				}
				
				var varReturn;
				
				varReturn=showModalDlg("../dialog/BillsSignDlg.aspx?BillTypeID="+strBillTypeID+"&Rdm="+Math.random(),"",650,430);
					
					
				//HDialog.Info("["+varReturn+"]");
				if(varReturn!="")
				{//**获得返回 刷新
					var varObjects=varReturn.split("\t");
											
					PreCostsInsManage.BillsSign.value=varObjects[0];
					PreCostsInsManage.hiBillsSign.value=varObjects[0];
					return true;
				}
				
			}
			
			function SelInvoiceBill ()
			{
				var strBillTypeID = getObject("InvoiceType").value;
				var strIsFixed = getObject("IsFixed").value;
				var strBillsSigns;
				var iFixedAmount = 0;
				
				if((strBillTypeID == "0")||(strBillTypeID == ""))
				{
					HDialog.Info("请选择发票类别,此项不能为空!");
					PreCostsInsManage.InvoiceType.focus();	
					return false;
				}
				
				var varReturn;
								
				//定额发票
				if(strIsFixed == "1")
				{
					//strBillsSigns = getObject("hiInvoiceBills").value;
												
					varReturn=showModalDlg("../dialog/MultiBillsSignMoreDlg.aspx?BillTypeID="+strBillTypeID+"&BillsSigns="+strBillsSigns+"&Rdm="+Math.random(),"",650,430);
					
					//HDialog.Info("["+varReturn+"]");
					if(varReturn!="")
					{//**获得返回 刷新
						var varObjects=varReturn.split("\t");
						
						PreCostsInsManage.InvoiceBill.value=varObjects[0];														
						PreCostsInsManage.hiInvoiceBills.value=varObjects[1];												
						PreCostsInsManage.InvoiceAmount.value = varObjects[2];
						PreCostsInsManage.ReceMemo.value = varObjects[3];
						return true;
					}
					else
					{
						PreCostsInsManage.InvoiceBill.value="";
						PreCostsInsManage.hiInvoiceBills.value="";
						PreCostsInsManage.InvoiceAmount.value="";
						PreCostsInsManage.ReceMemo.value="";
						return true;
					}
				}
				else
				{
					varReturn=showModalDlg("../dialog/BillsSignDlg.aspx?BillTypeID="+strBillTypeID+"&Rdm="+Math.random(),"",650,430);
					
					
					//HDialog.Info("["+varReturn+"]");
					if(varReturn!="")
					{//**获得返回 刷新
						var varObjects=varReturn.split("\t");
												
						PreCostsInsManage.InvoiceBill.value=varObjects[0];														
						PreCostsInsManage.hiInvoiceBill.value=varObjects[0];												
						PreCostsInsManage.InvoiceAmount.value=PreCostsInsManage.TotalSumAmount.value;
						PreCostsInsManage.ReceMemo.value=varObjects[0];
						return true;
					}
					else
					{
						PreCostsInsManage.InvoiceBill.value="";
						PreCostsInsManage.hiInvoiceBills.value="";
						PreCostsInsManage.InvoiceAmount.value="";
						PreCostsInsManage.ReceMemo.value="";
						return true;
					}
				}
				
				return false;
			}
			
			//function btnSelRemitterUnit_OnClick()
			//{
			//	var strCustID = getObject("CustID").value;
			//	var strRoomID = getObject("RoomID").value;
			//	var strSourceType = 2;
				
			//	if((strCustID == "0")||(strCustID == ""))
			//	{
			//		return false;
			//	}
				
			//	var varReturn;
			//	varReturn=showModalDlg("../dialog/RemitterUnitDlg.aspx?CustID="+strCustID+"&RoomID="+strRoomID+"&SourceType="+strSourceType+"&Rdm="+Math.random(),"",400,360);
			//	//HDialog.Info("["+varReturn+"]");
			//	if(varReturn!="")
			//	{//**获得返回 刷新
			//		var varObjects=varReturn.split("\t");
					
			//		PreCostsInsManage.RemitterUnit.value=varObjects[0];														
			//		PreCostsInsManage.hiRemitterUnit.value=varObjects[0];
			//		return true;
			//	}
				
			//	return false;
			//}
			
			function onclickIsInvoice()
			{				
				if(getObject("IsInvoice").checked == true)
				{
				    $('#table41').show();
					//getObject("TrInvoice").style.display = "block";
					getObject("BillType").disabled = true;
					getObject("BillsSign").disabled = true;
					getObject("btnSelBill").disabled = true;
				}
				else
				{					
				    //getObject("TrInvoice").style.display = "none";
				    $('#table41').hide();
					getObject("BillType").disabled = false;					
					getObject("BillsSign").disabled = false;
					getObject("btnSelBill").disabled = false;
				}
				
				getObject("BillType").value = "";
				getObject("BillsSign").value = "";
				getObject("hiBillsSign").value = "";
			}
			
			function btnOverOK_OnClick()
			{
				
				return true;
			}
			
			function btnFileUp_Onclick()
			{
				if(PreCostsInsManage.AdjunctName.value=="")
				{
					HDialog.Info("请输入文件附件名称,此项不能为空!");
					PreCostsInsManage.AdjunctName.focus();
					return false;
				}
				
				if(PreCostsInsManage.btnFile.value=="")
				{
					HDialog.Info("请选择要上传的本地文件!");
					PreCostsInsManage.btnFile.focus();
					return false;
				}
				
				return true;
			}
			
			
		//-->
    </script>
    <script  type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="overflow-y: auto">
    <form id="PreCostsInsManage" method="post" runat="server">
        <input id="hiOPType" style="width: 32px; height: 22px" type="hidden" size="1" name="hiOPType"
            runat="server">
        <input id="PrecID" style="width: 24px; height: 22px" type="hidden" size="1" name="PrecID"
            runat="server">
         <input id="BusinessTradeNo" type="hidden" name="BusinessTradeNo" runat="server" />
        <input id="hiTotalAmount" style="width: 24px; height: 22px" type="hidden" size="1" name="hiTotalAmount"
            runat="server"><input id="HaveSelCount" style="width: 16px; height: 22px" type="hidden" size="1" name="HaveSelCount"
                runat="server"><input id="HiHandID" style="width: 8px; height: 22px" type="hidden" size="1" name="HiHandID"
                    runat="server">
        <input id="hiPreFeesDetail" style="width: 8px; height: 22px" type="hidden" size="1" name="hiPreFeesDetail"
            runat="server">
        <input id="btnDelTable" name="btnDelTable" runat="server" type="button" onserverclick="btnDelTable_ServerClick" />
        <input id="DGridDetailIID" name="DGridDetailIID" runat="server" type="hidden" />
        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 580px; height: 150px; padding: 10px;">
            <table id="tabtishi" cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red; display: none;text-align:left;'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、只选择一个费项的预存为单项预存，选择两个及多个冲抵费项时为综合预存。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、不选择房号、车位、费项时可冲抵该客户名下所有房号、所有车位、所有费用，</br>否则只能按照指定的房号、车位、费项冲抵。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、一次预存多笔费用时可反复添加。
                    </td>
                </tr>
            </table>
        </div>
        <table class="DialogTable" id="table3" cellspacing="0" cellpadding="0">

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第一步:选择客户</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px"></td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input id="CustName" searcher="SelCust" style="width: 300px;" name="CustName" readonly class="easyui-searchbox" runat="server" />
                    <%-- <INPUT class="button_sel" id="btnSelCust"  onclick="javascript:if(btnSelCust_OnClick()==false) return false;"
														type="button" value=" " name="btnSelCust" runat="server">--%>
                    <input class="Control_ItemInput" id="CustID" style="width: 8px; height: 19px" type="hidden"
                        size="1" name="CustID" runat="server"><input class="Control_ItemInput" id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                            size="1" name="hiCustName" runat="server"><font color="red">*<asp:linkbutton id="LinkbtnCust" runat="server">客户资料</asp:linkbutton></td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="SelRoomID" runat="server" AutoPostBack="True"></asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px"></td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" searcher="SelRoom" style="width: 300px;" readonly name="RoomSign" class="easyui-searchbox" runat="server" />
                    <%-- <INPUT class="button_sel" id="btnSelRoom"  onclick="javascript:if(btnSelRoom_OnClick()==false) return false;"
										type="button" value=" " name="btnSelRoom" runat="server">--%>
                    <input class="Control_ItemInput" id="RoomID" style="width: 8px; height: 22px" type="hidden"
                        size="1" name="RoomID" runat="server"><input class="Control_ItemInput" id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                            size="1" name="hiRoomSign" runat="server"></td>
                <td class="TdTitle">交费周期</td>
                <td class="TdContentSearch">
                    <asp:Label ID="ChargeCycle" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px"></td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第二步：添加费用（单项预存/综合预存）</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">预存费用</td>
                <td class="TdContentSearch" width="85%" colspan="3" style="padding-top: 5px; padding-right: 5px; padding-bottom: 5px">

                    <table style="border: 1px solid #cccccc;" class="DialogTable" id="Tables1">
                        <tr>
                            <td class="TdTitle">
                                <input class="easyui-validatebox" id="CostID" type="hidden"
                                    size="1" name="CostID" runat="server"><input id="hiCostNames" style="width: 16px; height: 22px" type="hidden" size="1" name="hiCostNames"
                                        runat="server"><input id="CostIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="CostIDs"
                                            runat="server"><input id="hiCostIDs" style="width: 16px; height: 22px" type="hidden" size="1" name="hiCostIDs"
                                                runat="server">冲抵项目</td>
                            <td class="TdContentSearch">
                                <input class="easyui-searchbox" id="CostNames" data-options="editable:false" style="width: 87%; height: 24px; text-align: left" name="CostNames" searcher="SelCost" runat="server" /><input class="button_sel" id="btnSelCostIDs" onclick="javascript:if(btnSelCostIDs_OnClick()==false) return false;"
                                    type="button" name="btnSelCostIDs" runat="server"></td>
                            <td class="TdTitle">车位</td>
                            <td class="TdContent">
                                <select id="HandID" name="HandID" runat="server" onchange="HandIDChange();"  class="easyui-combobox"
                             style=" height: 24px; text-align: left">
                        </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">预存月数</td>
                            <td class="TdContent">
                                <select id="MonthNum"  onchange="javascript:GetPrecAmount();" name="MonthNum" runat="server">
                                    <option selected></option>
                                </select>个月</td>
                            <td class="TdTitle">预存金额</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox"  onblur = 'valuevalidatebox(this.id)' id="PrecAmount" name="PrecAmount" runat="server"><font face="宋体" color="red">*</td>
                        </tr>
                        <tr>
                            <td class="TdTitle">开始时间</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="BeginDate" onclick="WdatePicker()"
                                    maxlength="20" size="52" name="BeginDate" runat="server"></td>
                            <td class="TdTitle">结束时间</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="EndDate" onclick="WdatePicker()"
                                    name="EndDate" runat="server"></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">费用摘要</td>
                            <td class="TdContent" colspan="3">
                                <input class="easyui-validatebox" id="PrecMemo" style="width: 90%"
                                    onclick="javascript:btnMemo();" name="PrecMemo" runat="server"></td>
                        </tr>
                        <tr>
                            <td class="TdTitle"></td>
                            <td class="TdContent" colspan="3">
                                <div class="font_red" id="results">
                                    <asp:Label ID="SelHint" runat="server" ForeColor="Red"></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-top:-5px;" align="center" width="55%" colspan="4">
                                <input class="button" id="btnOK" onclick="javascript:if(btnOK_Onclick()==false) return false;"
                                    tabindex="1" type="button" value="添加" name="btnOK" runat="server">
                                <a href="#" style="border: 1px solid #95B8E7;height:32px;width:100px;" id="ins" class="easyui-linkbutton" iconcls="icon-help" plain="true" onclick=" JavaScript:TiShi(); ">备注</a>
                            </td>
                            <%--<td align="right" width="45%" colspan="2">（一次预存多笔费用时可反复添加。）</td>--%>
                        </tr>
<%--                        <tr>
                            <td align="left" style="border-top: 1px solid #cccccc;" colspan="4">备注：1、只选择一个费项的预存为单项预存，选择两个及多个冲抵费项时为综合预存。2、不选择房号、车位、费项时可冲抵该客户名下所有房号、所有车位、所有费用，否则只能按照指定的房号、车位、费项冲抵。</td>
                        </tr>--%>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" width="100%" colspan="4">
                    <div class="SearchContainer" id="DGridDetail" style="height: 250px"></div>

                    <%-- <asp:datagrid id="DGridDetail" runat="server" ShowFooter="True" Height="100%" CssClass="DataGrid"
													Width="100%" AutoGenerateColumns="False">
													<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
													<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
													<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
													<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
													<Columns>
														<asp:BoundColumn Visible="False" DataField="RecdID" ReadOnly="True"></asp:BoundColumn>
														<asp:BoundColumn DataField="RoomSign" ReadOnly="True" HeaderText="房屋编号"></asp:BoundColumn>
														<asp:BoundColumn DataField="ParkNames" ReadOnly="True" HeaderText="车位"></asp:BoundColumn>
														<asp:BoundColumn DataField="PrecDate" ReadOnly="True" HeaderText="预交收款时间" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
														<asp:BoundColumn DataField="BillsSign" ReadOnly="True" HeaderText="收据号码"></asp:BoundColumn>
														<asp:BoundColumn DataField="CostNames" ReadOnly="True" HeaderText="冲抵费用项目"></asp:BoundColumn>
														<asp:BoundColumn DataField="PrecAmount" ReadOnly="True" HeaderText="预交金额"></asp:BoundColumn>
														<asp:BoundColumn DataField="UserName" ReadOnly="True" HeaderText="预交操作人"></asp:BoundColumn>
														<asp:BoundColumn DataField="PrecMemo" ReadOnly="True" HeaderText="摘要"></asp:BoundColumn>
														<asp:TemplateColumn HeaderText="[删除]">
															<HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
															<ItemStyle HorizontalAlign="Center"></ItemStyle>
															<ItemTemplate>
																<asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"
																	CommandName="Delete" CausesValidation="false" TabIndex="1" ID="Linkbutton2"></asp:LinkButton>
															</ItemTemplate>
														</asp:TemplateColumn>
													</Columns>
													<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
												</asp:datagrid>--%>

                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px"></td>
            </tr>
            <tr>
                <td class="TdTitle" style="width: 25%;"></td>
                <td colspan="2" style="width: 50%; text-align: center;" class="TdTitle">
                    <input class="button" id="btnOverOK" onclick="javascript:if(btnOverOK_OnClick()==false) return false;"
                        tabindex="1" type="button" value="完成添加" name="btnOverOK" runat="server">
                    <input id="TotalSumAmount" style="width: 20px" readonly type="hidden" name="TotalSumAmount"
                        runat="server">
                </td>
                <td class="TdTitle" style="width: 25%; text-align: right;">（费用登记完毕点击“完成添加”。）</td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px"></td>
            </tr>
        </table>

        <table class="DialogTable" id="table4" border="0">

            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第三步：确定收费</span> </td>
            </tr>
            <tr>
                <td colspan="8" style="height: 4px"></td>
            </tr>
            <tr >
                <td style="text-align: center; width: 8%;">收款方式</td>
                <td style="text-align: left; width: 17%;">
                    <select id="ChargeMode" onchange="CheckChargeMode();" style="width: 50%" name="ChargeMode" runat="server">
                        <option selected></option>
                    </select>
                    <input style="z-index: 0; width: 8px; height: 19px" id="hiChargeModes" class="Control_ItemInput" size="1" type="hidden" name="hiChargeModes" runat="server">
                    <input style="z-index: 0; width: 8px; height: 19px" id="ChargeModeAmount" class="Control_ItemInput" size="1" type="hidden" name="ChargeModeAmount" runat="server">
                </td>
                <td style="text-align: center; width: 8%;">多种方式</td>
                <td style="text-align: left; width: 17%;">
                    <input id="ChargeModes" class="Control_ItemInput" style="width: 50%" readonly name="ChargeModes" runat="server">
                </td>
                <td style="text-align: center; width: 8%;">收据类别</td>
                <td style="text-align: left; width: 17%;">
                    <asp:DropDownList ID="BillType" Style="width: 50%" runat="server"></asp:DropDownList>
                </td>
                <td style="text-align: center; width: 8%;">收据号</td>
                <td style="text-align: left; width: 17%;" id="Bills">
                    <input id="BillsSign" data-options="editable:false" searcher="SelBillsSign" style="width: 60%" data-option="" name="BillsSign" runat="server" class="easyui-searchbox" />
                    <input class="Control_ItemInput" id="hiBillsSign" type="hidden" size="1" name="hiBillsSign" runat="server">
                    <asp:CheckBox ID="IsInvoice" runat="server" Text="开据发票"></asp:CheckBox>
                </td>
            </tr>

            <tr style="display:none;">
                <td colspan="8" style="height: 4px"></td>
            </tr>

            <tr id="TrInvoice">
                <td colspan="8">
                    <table id="table41" name="table41" style="width: 100%" cellspacing="0" cellpadding="0">
                        <tr>
                            <td style="text-align: center; width: 10%;">发票类别</td>
                            <td style="text-align: left; width: 15%;">
                                <asp:DropDownList ID="InvoiceType" name="InvoiceType" Style="width: 50%" runat="server"></asp:DropDownList><input id="IsFixed" style="width: 16px; height: 22px" type="hidden" size="1" name="IsFixed"
                                    runat="server"><input id="FixedAmount" style="width: 16px; height: 22px" type="hidden" size="1" name="FixedAmount"
                                        runat="server"></td>
                            <td style="text-align: center; width: 10%;">发票号</td>
                            <td style="text-align: left; width: 15%;">
                                <input id="InvoiceBill" style="width: 50%" readonly name="InvoiceBill"
                                    runat="server">&nbsp;<input class="button_sel" id="btnSelInvoiceBill" onclick="javascript:if(btnSelInvoiceBill_OnClick()==false) return false;"
                                        type="button" value=" " name="btnSelInvoiceBill" runat="server"><input class="Control_ItemInput" id="hiInvoiceBill" style="width: 8px; height: 19px" type="hidden"
                                            size="1" name="hiInvoiceBill" runat="server"><input class="Control_ItemInput" id="hiInvoiceBills" style="width: 8px; height: 19px" type="hidden"
                                                size="1" name="hiInvoiceBills" runat="server"></td>
                            <td style="text-align: center; width: 10%;">发票抬头</td>
                            <td style="text-align: left; width: 15%;">
                                <input id="InvoiceUnit" name="InvoiceUnit" style="width: 50%" placeholder="输入或双击选择"
                                    runat="server"></td>
                            <td style="text-align: center; width: 10%;">发票金额</td>
                            <td style="text-align: left; width: 15%;">
                                <input id="InvoiceAmount" style="width: 50%" readonly
                                    name="InvoiceAmount" runat="server"></td>
                        </tr>
                    </table>
                </td>


            </tr>

            <tr style="display:none;">
                <td colspan="8" style="height: 4px"></td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="text-align: center">支票抬头</td>
                <td class="DialogTdContent">
                    <input id="RemitterUnit" readonly style="width: 50%"
                        name="RemitterUnit" runat="server">&nbsp;<input class="button_sel" id="btnSelRemitterUnit" disabled onclick="javascript:if(btnSelRemitterUnit_OnClick()==false) return false;"
                            type="button" value=" " name="btnSelRemitterUnit" runat="server"><input class="Control_ItemInput" id="hiRemitterUnit" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="hiRemitterUnit" runat="server"></td>
                <td class="DialogTdTitle" style="text-align: center">银行名称</td>
                <td class="DialogTdContent">
                    <select id="BankName" disabled name="BankName" style="width: 50%" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="DialogTdTitle" style="text-align: center">银行帐号</td>
                <td class="DialogTdContent">
                    <input class="Control_ItemInput" id="BankAccount" style="width: 50%" readonly
                        name="BankAccount" runat="server"></td>
                <td class="DialogTdTitle" style="text-align: center">支票号</td>
                <td class="DialofgTdContent">
                    <input class="Control_ItemInput" id="ChequeBill" style="width: 50%" readonly
                        name="ChequeBill" runat="server"></td>
            </tr>
            <tr>
                <td colspan="8" style="height: 4px"></td>
            </tr>
            <tr>
                 <td class="DialogTdTitle" style="text-align: center; width: 10%;" >交款人</td>
                 <td style="text-align: left; width: 15%;" class="DialogTdContent">
                    <input id="Payer" style="width: 50%" name="Payer" runat="server">
                 </td>
                    <td class="DialogTdTitle" style="text-align: center">入账银行</td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-searchbox" searcher="SelBankSel" id="BankNameSelbox" />
                        <input type="hidden" id="BankNameSel" runat="server" />
                    </td>
                    <td class="DialogTdTitle" style="text-align: center">入账账号</td>
                    <td class="DialogTdContent">
                        <input type="text" class="easyui-searchbox" searcher="SelBankSel" id="BankAccountSelbox" />
                        <input type="hidden" id="BankAccountSel" runat="server" />
                    </td>
                <td class="DialogTdTitle" style="text-align: center">付款码</td>
                <td class="DialogTdContent"> <input id="CustPaymentID"  name="CustPaymentID" runat="server" />
                          <input id="CustPaymentKey"  name="CustPaymentKey" type="hidden" runat="server" />
                         <input id="OrderResult"  name="OrderResult" type="hidden" runat="server" /></td>
            </tr>

             <tr>
                <td colspan="8" style="height: 4px"></td>
            </tr>
           
            <tr>
                <td colspan="8" style="height: 4px"></td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="text-align: center">备注</td>
                <td class="DialogTdContent" align="left" colspan="7">
                    <input class="Control_ItemInput" id="ReceMemo" style="width: 92%" name="ReceMemo" runat="server"></td>
                
                <%--	<TD class="DialogTdTitle" >文件上传</TD>
											<TD  colSpan="3"><INPUT class="Control_ItemInput" id="AdjunctName"
													name="AdjunctName" runat="server"><INPUT id="btnFile" style="WIDTH: 60px;" tabIndex="1" type="file" size="1"
													name="btnFile" runat="server"><INPUT class="Button" id="btnFileUp"  onclick="javascript:if(btnFileUp_Onclick()==false) return false;"
													tabIndex="1" type="button" value="上传" name="btnFileUp" runat="server"></TD>--%>
            </tr>
            <%--<tr>
											<td class="formTable_ItemInput" colSpan="8">
                                                <asp:datagrid id="DGrid" style="FONT-SIZE: 12px" runat="server" CssClass="DataGrid" Width="100%"
													AutoGenerateColumns="False">
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
															<ItemStyle ></ItemStyle>
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
										</tr>--%>

            <tr>
                <td colspan="8" style="height: 8px"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="8">
                    <input class="button" id="btnSave" onclick="javascript:if(CheckData()==false) return false;"
                        type="button" value="预存确认" name="btnSave" runat="server" /> <input type="button" class="button" value="扫码确认" id="btnPayment" runat="server"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="关闭"
                        name="btnReturn" runat="server" onclick="ExitDialog();" /></td>
            </tr>
            <tr>
                <td style="height: 10px" colspan="8"></td>
            </tr>
        </table>


        <script type="text/javascript">

            function HandIDChange()
            {
                $("#HiHandID").val($("#HandID").val());
            }
            function valuevalidatebox(obj) {

               
                if (isNaN($('#' + obj).val())) {
                    HDialog.Info("请输入大于等于0的数字");
                    $('#' + obj).val(0);
                    return false;
                }


            }
            //

              function ClostLayer() {
               
                top.layer.closeAll();
                 $.tool.pageUnLoading();
            }

            $('#btnPayment').click(function (e) {

                CheckAuthority('1020', function callback(_Data) {
                    if (_Data != 'false') {
                        HDialog.Prompt("是否确认收款?", function a() {
                            if ($('#CustPaymentID').val() == '') {
                                HDialog.Info("请扫码!");
                                $('#CustPaymentID').focus();
                            }
                            else {
                                var  TotalPayAmount = 0
                                var PCostRows = $("#DGridDetail").datagrid("getRows");
                                if (PCostRows.length > 0)
                                {
                                    for (var i = 0; i < PCostRows.length; i++) {
                                        TotalPayAmount = TotalPayAmount+ parseFloat(PCostRows[i].PrecAmount);
                                    }
                                }
                                if (TotalPayAmount > 0) {

                                    if (TotalPayAmount > 10000.00) {
                                        HDialog.Info("单次扫码金额不能超过10000!");
                                    }
                                    else {
                                        $.tool.DataPostInfo('ReceFees', "PayMentFees", $('#frmForm').serialize() + "&TotalPayAmount=" + TotalPayAmount,
                                         function Init() {
                                         },
                                         function callback(_Data) {
                                             if (_Data != '') {
                                                 var d = _Data.split('|');
                                                 if (d[0] == 'true') {
                                                     $('#CustPaymentKey').val(d[1]);
                                                     
                                                   $.tool.pageLoadInfo("　");
                                                    top.layer.msg('获取订单中，请稍后', {
                                                          icon: 1,
                                                          time: 0 //2秒关闭（如果不配置，默认是3秒）
                                                        }, function(){
                                                          //关闭后执行
                                                    } );
                                                     SearchQueryOrder = setInterval(QueryOrder, 1000);

                                                 }
                                                 else {
                                                     HDialog.Info(d[1]);
                                                 }

                                             }
                                             else {
                                                 HDialog.Info("扫码支付失败!");
                                             }

                                         },
                                         function completeCallback() {
                                         },
                                         function errorCallback() {

                                         });
                                    }
                                }
                                else {

                                    HDialog.Info("请输入预存金额！");
                                }

                            }

                        });
                    }
                    else {
                        alert("你没有收款权限，请联系管理员开通！");
                    }
                });
            });


            //定时器扫码支付结果
            var SearchQueryOrder;
            var iCount = 0;
            //定时器扫码支付结果
            function QueryOrder() {
                   $.tool.pageUnLoading();
                $.tool.pageLoadInfo("　");
                $.tool.DataPostInfo('ReceFees', "QueryOrder", $('#frmForm').serialize(),
                      function Init() {
                      },
                      function callback(_Data) {
                          if (_Data != '') {
                              var d = _Data;
                              if (d != '') {
                                  $('#BusinessTradeNo').val(d);
                                  clearInterval(SearchQueryOrder);

                                  $('#btnSave').click();
                              }
                              else {
                                  iCount++;
                              }
                          }
                          else {
                              HDialog.Info("扫码支付失败!");
                          }

                      },
                      function completeCallback() {
                      },
                      function errorCallback() {

                      });
                
                if (iCount > 20) {
                    clearInterval(SearchQueryOrder);

                     ClostLayer();   
                    HDialog.MessageBoxThird("获取订单超时,请确认支付状态，支付成功手动确认收款", "确认", '取消', "关闭", function () {
                        $('#btnSave').show();
                        $('#btnPayment').hide();
                        getObject("btnSave").disabled = false;
                    }, function () {


                    }, function () { });




                    //HDialog.Prompt('获取订单超时,请确认支付状态，若支付成功是否需要手动处理!', function () {

                    //});


                    $('#CustPaymentID').val('');
                }
            }

           



            //指定列求和
            function compute(colName) {
                var rows = $('#DGridDetail').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }



            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

                function InitTable()
                {
                    $('#btnSelCostIDs').hide();
                    $('#table41').hide();
                    $('#btnDelTable').hide();
                    $('#CustPaymentID').attr("disabled", "disabled");
                    $('#btnPayment').hide();

                }
                InitTable();

                function TiShi() {
                    $('#tishi').parent().appendTo($("form:first"))
                    $('#tishi').dialog('open');
                    $("#tabtishi").show();
                }

                var column = [[
               
                   { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                   { field: 'ParkNames', title: '车位', width: 100, align: 'left', sortable: true },
                   {
                       field: 'PrecDate', title: '预交收款时间', width: 180, align: 'left', sortable: true, formatter: function (value, row, index) {

                           var str = formatDate(row.PrecDate, "yyyy-MM-dd HH:mm:ss");
                           return str;
                       }
                   },
                   { field: 'BillsSign', title: '收据号码', width: 100, align: 'left', sortable: true },
                   { field: 'CostNames', title: '冲抵费用项目', width: 100, align: 'left', sortable: true },
                   {field: 'PrecAmount', title: '预交金额', width: 100, align: 'left', sortable: true},
                   { field: 'UserName', title: '预交操作人', width: 100, align: 'left', sortable: true },
                   { field: 'PrecMemo', title: '摘要', width: 300, align: 'left', sortable: true }

                ]];
                var toolbar = [
                 {
                     text: '删除',
                     iconCls: 'icon-cancel',
                     handler: function () {
                         var row = $("#DGridDetail").datagrid("getSelected");
                         if (row == null) {
                             HDialog.Info('请选择删除项！');
                             return;
                         }
                         else {

                             $('#DGridDetailIID').val(row.IID);
                             
                             $('#btnDelTable').click();
                         }
                         
                     }
                 }];

                function BindDataGrid()
                {
                    var Data = $('#hiPreFeesDetail').val();

                    var obj = JSON.parse(Data);
                  

                    $("#DGridDetail").datagrid({
                        data: obj.rows,
                        title: '预存费用明细',
                        loadMsg: '数据加载中,请稍候...',
                        nowrap: false,
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: column,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: false,
                        width: "100%", 
                        toolbar: toolbar,
                        sortOrder: "asc",
                        singleSelect: true,
                        view: myview,
                        showFooter: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: true,
                        rowStyler: function (index, row) {
                            if (row.IID == 'footer') {
                                return 'background-color:#F4F4F4;border:none;'; // return inline style
                            }

                        },
                        onLoadSuccess: function (data) {
                            //加载页脚
                            $('#DGridDetail').datagrid('reloadFooter', [
                                        {
                                            IID: 'footer',
                                            ParkNames: "<span style='color:red'>合计</span>",
                                            PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>"

                                        }
                            ]);
                        }
                    });
                   

                }
                BindDataGrid();


                function SelCust() {

                    $('#CustName').searchbox("setValue", '');
                    $('#CustID').val('');
                    $('#RoomSign').searchbox("setValue", '');
                    $('#RoomID').val('');
                      $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });


                    var w = $(window).width();
                    var h = $(window).height();

                    var conent = "../DialogNew/CustDlg.aspx";

                    HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                        var data = JSON.parse(_Data);
                        $('#CustName').searchbox("setValue", data.CustName);
                        $('#CustID').val(data.CustID);




                        $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                            function Init() {
                            },
                            function callback(_Data) {

                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                if (varObjects.length > 0) {

                                    var RoomData = [];
                                    for (var i = 0; i < varObjects.length; i++) {

                                        var vIsDelLive = varObjects[i].IsDelLive;
                                        var strTmp = "";

                                        if (vIsDelLive == 1) {
                                            strTmp = "(历史)";
                                        }
                                        var RoomID = varObjects[i].RoomID;
                                        var RoomSign = varObjects[i].RoomSign;
                                        var Buildarea = varObjects[i].BuildArea;

                                        var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                        RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                                    }
                                    $('#SelectRoomID').combobox({
                                        data: RoomData,
                                        valueField: 'RoomID',
                                        textField: 'RoomText',
                                        onChange: function (n, o) {


                                            var data = $('#SelectRoomID').combobox('getData');
                                            if (data.length > 0) {
                                                for (var i = 0; i < data.length; i++) {
                                                    if (n == data[i].RoomID) {

                                                        $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                        $('#RoomID').val(data[i].RoomID.split('|')[0]);



                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                    });
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });

                    });
                }

                function SelRoom() {
                    $('#CustName').searchbox("setValue", '');
                    $('#CustID').val('');
                    $('#RoomSign').searchbox("setValue", '');
                    $('#RoomID').val('');
                      $('#SelectRoomID').combobox({data: [], valueField: 'RoomID', textField: 'RoomText' });

                    var conent = "../DialogNew/RoomDlg.aspx";

                    var w = $(window).width();
                    var h = $(window).height();

                    HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                        var data = JSON.parse(_Data);
                        $('#RoomSign').searchbox("setValue", data.RoomSign);
                        $('#CustName').searchbox("setValue", data.CustName);
                        $('#CustID').val(data.CustID);
                        $('#RoomID').val(data.RoomID);



                        $('#SelectRoomID').combobox({
                            data: '',
                            valueField: 'RoomID',
                            textField: 'RoomText'
                        });

                    });
                }
              
                function SelCost() {
                    var varReturn;

                    HDialog.Open('700', '400', "../dialogNew/CorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {


                        if (_Data != "") {//**获得返回 刷新
                            var data = JSON.parse(_Data);
                            $('#CostIDs').val(data.CostID);
                            $('#CostNames').searchbox('setValue', data.CostName);
                            $('#hiCostNames').val(data.CostName);
                        }
                    });

                }

                function ExitDialog() {

                    HDialog.CloseWindow("1", parent.window.name);
                }
                function ExitDialogComplete() {
                    HDialog.Info("预存收款成功");
                    HDialog.CloseWindow("1", parent.window.name);
                }
                function OpenCustDetail(CustID)
                {
                    var w = $(window).width();
                    var h = $(window).height();
                    HDialog.Open(w, h, '../HouseNew/CustomerDetail.aspx?CustID=' + CustID, '客户资料', false, function callback(_Data) {

                    });
                }


                function SelBillsSign() {

                    var strBillTypeID = $('#BillType').val();
                    var strBillsSigns;
                    var iFixedAmount = 0;

                    if (strBillTypeID == '系统票号') return;

                    if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                        HDialog.Info("请选择票据类别,此项不能为空!");
                        BillsEditManage.BillTypeID.focus();
                        return;
                    }

                    var conent = "../dialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();

                    var w = 650;
                    var h = 430;

                    HDialog.Open(w, h, conent, '票据号选择', false, function callback(_Data) {

                        var varObjects = _Data;
                        if (varObjects == "" && $('#BillsSign').searchbox("getValue") != "") {

                        }
                        else {

                            $('#BillsSign').searchbox("setValue", varObjects);

                            $('#hiBillsSign').val(varObjects);
                        }

                    });

                }
                

                //选择发票
                function btnSelInvoiceBill_OnClick() {
                    var strBillTypeID = getObject("InvoiceType").value;
                    var strIsFixed = getObject("IsFixed").value;
                    var strBillsSigns;
                    var iFixedAmount = 0;

                    if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                        HDialog.Info("请选择发票类别,此项不能为空!");
                        InvoiceType.focus();
                        return false;
                    }
                    else {
                        var w = '680';
                        var h = '430';

                        var varReturn;
                        //定额发票
                        if (strIsFixed == "1") {

                            HDialog.Open(w, h, "../DialogNew/MultiBillsSignMoreDlg.aspx?BillTypeID=" + strBillTypeID + "&BillsSigns=" + strBillsSigns + "&Rdm=" + Math.random(), '定额发票号选择', true, function callback(_Data) {
                                if (_Data != '') {
                                    var varObjects = _Data.split("\t");
                                    $('#InvoiceBill').val(varObjects[0]);
                                    $('#hiInvoiceBills').val( varObjects[1]);
                                    $('#InvoiceAmount').val(varObjects[2]);
                                    $('#ReceMemo').val( varObjects[3]);
                                    return true;
                                }
                                else {
                                    $('#InvoiceBill').val("");
                                    $('#hiInvoiceBills').val("");
                                    $('#InvoiceAmount').val("");
                                    $('#ReceMemo').val("");
                                    return true;
                                }
                            });

                        }
                        else {

                            HDialog.Open(w, h, "../DialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random(), '发票号选择', true, function callback(_Data) {
                                if (_Data != '') {
                                    $('#InvoiceBill').val( _Data);
                                    $('#hiInvoiceBill').val(_Data);
                                    $('#InvoiceAmount').val("");
                                    $('#ReceMemo').val(_Data);
                                    return true;
                                }
                                else {
                                    $('#InvoiceBill').val("");
                                    $('#hiInvoiceBills').val( "");
                                    $('#InvoiceAmount').val("");
                                    $('#ReceMemo').val("");
                                    return true;
                                }
                            });

                        }
                        return false;
                    }
                }

                $('#InvoiceUnit').dblclick(function (e) {
                    var conent = "../DialogNew/CustDlg.aspx";
                    HDialog.Open('1000', '600', conent, '客户选择', false, function callback(_Data) {
                        var data = JSON.parse(_Data);
                        $('#InvoiceUnit').val(data.CustName);
                    });
                })

                //支票抬头选择
                function btnSelRemitterUnit_OnClick() {

                    var strCustID = getObject("CustID").value;
                    var strRoomID = getObject("RoomID").value;
                    var strSourceType = 2;

                    if ((strCustID == "0") || (strCustID == "")) {
                        return false;
                    }

                    var w = '650';
                    var h = '430';
                    var conent = "../dialogNew/RemitterUnitDlg.aspx?CustID=" + strCustID + "&RoomID=" + strRoomID + "&SourceType=" + strSourceType + "&Rdm=" + Math.random();
                    HDialog.Open(w, h, conent, '支票抬头选择', true, function callback(_Data) {
                        if (_Data != '') {
                            var varObjects = JSON.parse(_Data);
                            PreCostsInsManage.RemitterUnit.value = varObjects.RemitterUnit;
                            PreCostsInsManage.hiRemitterUnit.value = varObjects.RemitterUnit;
                        }
                    });

                }
                function SelBankSel() {
                    var conent = "../DialogNew/SelBankInfoSet.aspx";
                    HDialog.Open('1000', '600', conent, '入账银行选择', false, function callback(_Data) {
                        var data = JSON.parse(_Data);
                        $('#BankNameSel').val(data.BankName);
                        $('#BankAccountSel').val(data.BankAccount);
                        $('#BankNameSelbox').searchbox("setValue", data.BankName);
                        $('#BankAccountSelbox').searchbox("setValue", data.BankAccount);
                    });
                }
               
        </script>
    </form>
</body>
</html>