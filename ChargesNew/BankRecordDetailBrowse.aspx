<%@ Page language="c#" Codebehind="BankRecordDetailBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.BankRecordDetailBrowse" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
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
        <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
		<script language="javascript">
		<!--
			
			
			function CheckData()
			{
				if(BankRecordDetailBrowse.BillsSign.value=="")
				{
					alert("请选择票据号码!");
					BankRecordDetailBrowse.btnSelBill.focus();
					return false;
				}
				
				return true;
			}
			
			function btnSelBill_OnClick()
			{
				var strBillTypeID = getObject("BillType").value;
				
				if((strBillTypeID == "0")||(strBillTypeID == ""))
				{
					alert("请选择票据类别,此项不能为空!");
					BankRecordDetailBrowse.BillType.focus();	
					return false;
				}
				
				var varReturn;
				
				varReturn=showModalDlg("../dialog/BillsSignDlg.aspx?BillTypeID="+strBillTypeID+"&Rdm="+Math.random(),"",650,430);
					
					
				//alert("["+varReturn+"]");
				if(varReturn!="")
				{//**获得返回 刷新
					var varObjects=varReturn.split("\t");
											
					BankRecordDetailBrowse.BillsSign.value=varObjects[0];
					BankRecordDetailBrowse.hiBillsSign.value=varObjects[0];
					return true;
				}
				
			}
			//收据类别
			function onchangeBillType()
			{
				var strBillType = getObject("BillType").value;
				
				Request.sendPOST("GetFirstBillsSign.aspx","InvoiceType="+strBillType+"&Rdm="+Math.random() ,callbackBillType);				
			}
			
			function callbackBillType(xmlHttp)
			{
				var varReturn = xmlHttp.responseText;
								
				if (varReturn!="")
				{
					var Search = eval('('+varReturn+')');
					
					var SearchData = Search.SelData.Data;
					
					getObject("BillsSign").value = "";
					getObject("hiBillsSign").value = "";
					
					getObject("InvoiceBill").value = "";
					getObject("hiInvoiceBill").value = "";
					
					for(var i=0; i<SearchData.length; i++)
					{
						getObject(SearchData[i].Name).value = SearchData[i].Val;
					}
					
					if(getObject("InvoiceBill").value != "")
					{
						getObject("BillsSign").value = getObject("InvoiceBill").value;
						getObject("hiBillsSign").value  = getObject("InvoiceBill").value;
					}
					
				}
				else
				{
					getObject("BillsSign").value = "";
					getObject("hiBillsSign").value = "";
				}
			}
			
		//-->
		</script>
	</HEAD>
	<body>
		<form id="BankRecordDetailBrowse" method="post" runat="server">
                     <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
            <INPUT id="PageIndex" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="PageIndex"
							runat="server"><INPUT id="IID" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IID" runat="server"><INPUT id="SurrID" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="SurrID"
							runat="server"><INPUT id="CustID" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="CustID"
							runat="server"><INPUT id="RoomID" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="RoomID"
							runat="server"><INPUT id="ReceID" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="ReceID"
							runat="server"><INPUT id="IsSucc" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="IsSucc"
							runat="server"><INPUT id="ReturnUrl" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="ReturnUrl"
							runat="server"><INPUT id="BankAccount" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="BankAccount"
							runat="server"><INPUT id="BankIDs" style="WIDTH: 32px; HEIGHT: 22px" type="hidden" size="1" name="BankIDs"
							runat="server">

			<TABLE class="DialogTable">
										    <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">银行代收记录</span> </td>
            </tr>			
										<TR>
											<TD class="TdTitle">客户名称</TD>
											<TD class="TdContent">
												<asp:Label id="CustName" runat="server"></asp:Label></TD>
											<TD class="TdTitle">银行账号(略)</TD>
											<TD class="TdContent">
												<asp:Label id="BankAccountOmit" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD class="TdTitle">代收金额小计</TD>
											<TD class="TdContent">
												<asp:Label id="ActAllDueAmount" runat="server"></asp:Label></TD>
											<TD class="TdTitle">已代收金额</TD>
											<TD class="TdContent">
												<asp:Label id="ActPaidAmount" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD class="TdTitle">是否成功</TD>
											<TD class="TdContent">
												<asp:Label id="IsSuccName" runat="server"></asp:Label></TD>
											<TD class="TdTitle">银行返回信息</TD>
											<TD class="TdContent">
												<asp:Label id="ErrMsg" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD class="TdTitle">票据号码</TD>
											<TD class="TdContent">
												<asp:Label id="lbBillsSign" runat="server"></asp:Label></TD>
											<TD class="TdTitle"></TD>
											<TD class="TdContent"></TD>
										</TR>
										 <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">设置票据号码</span> </td>

            </tr>		
									<TR>
					<TD class="TdTitle">票据类别</TD>
					<TD class="TdContent">
						<asp:dropdownlist id="BillType" runat="server" OnSelectedIndexChanged="BillType_SelectedIndexChanged"></asp:dropdownlist></TD>
					<TD class="TdTitle">
							票据号码</TD>
					<TD class="TdContentSearch"><input id="BillsSign"  searcher="SelBillsSign" data-options="editable:false"
                                                                        name="BillsSign" runat="server"  class="easyui-searchbox"  /><%--<input class="button_sel" id="btnSelBillsSign" onclick="javascript: if (btnSelBillsSign_OnClick() == false) return false;"
                                                                            type="button" value=" " name="btnSelBillsSign" runat="server">--%><input id="hiBillsSigns" type="hidden"
                                                                                size="1" name="hiBillsSigns" runat="server" /><input id="hiBillsSign" type="hidden"
                                                                                    size="1" name="hiBillsSign" runat="server" /></TD>
				</TR>
										<TR>
											<TD class="formTable_Footer" align="center" colSpan="4"><INPUT  id="btnSave" class="button" onclick="javascript:if(CheckData()==false) return false;"
													value="确认设置" type="button" name="btnSave" runat="server">&nbsp;
												<INPUT id="btnReturn" type="button" value="返回" name="btnReturn" runat="server"
													class="button"></TD>
										</TR>
									</TABLE>

               <div class="SearchContainer" style="height:400px" id="TableContainer">1111111111
            </div>
             <script type="text/javascript">
                function Init()
                {

                   
                    
                }

                Init();

                function SelBillsSign() {



                    var strBillTypeID = getObject("BillTypeID").value;
                    var strBillsSigns;
                    var iFixedAmount = 0;

                    if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                        HDialog.Info("请选择票据类别,此项不能为空!");
                        BillsEditManage.BillTypeID.focus();
                        return;
                    }

                    var conent = "../dialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();

                    var w = 850;
                    var h = 430;

                    HDialog.Open(w, h, conent, '票据号选择', false, function callback(_Data) {

                        var varObjects = _Data;

                        $('#BillsSign').searchbox("setValue", varObjects);

                        $('#hiBillsSign').val(varObjects);

                    });

                }

                var column = [[


                { field: 'CustName', title: '客户名称', width: 140, align: 'left', sortable: true, sortable: true},
                { field: 'RoomSign', title: '房屋编号', width: 140, align: 'left', sortable: true },
                { field: 'CostSNum', title: '费用序号', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'FeesDueDate', title: '应收日期', width: 100, align: 'left', sortable: true },
                { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true, sortable: true },
                { field: 'BankName', title: '银行名称', width: 100, align: 'left', sortable: true },
                { field: 'BankAccountOmit', title: '银行账号(略)', width: 100, align: 'left', sortable: true },
                { field: 'ActDueAmount', title: '应代收金额', width: 100, align: 'left', sortable: true },
                { field: 'ActLateFeeAmount', title: '应代合同违约金', width: 100, align: 'left', sortable: true },
                { field: 'ActPaidAmount', title: '已代收金额', width: 100, align: 'left', sortable: true }
               

                ]];

                

                function LoadList() {


                    $("#TableContainer").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        nowrap: false,
                        title:'应代收费用(按客户)',
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: column,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: true,
                        width: "100%",
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        sortOrder: "asc",
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("CustBank", "BankRecordDetailList", "TableContainer", param);
                        },
                        onLoadSuccess: function (data) {
                        }
                    });
                    
                }
                LoadList();
              </script>
		</form>
	</body>
</HTML>
