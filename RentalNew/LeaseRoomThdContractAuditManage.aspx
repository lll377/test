<%@ Page Language="c#" CodeBehind="LeaseRoomThdContractAuditManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.RentalNew.LeaseRoomThdContractAuditManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>���޺�ͬ���</title>
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
			
			function rdoIncreType_OnClick()
			{
				if(LeaseRoomThdContractAuditManage.IncreType1.checked)
				{
					getObject("lbIncreRate").innerHTML = "������(%)"
						
				}
				else
				{
					if(LeaseRoomThdContractAuditManage.IncreType2.checked)
					{
						getObject("lbIncreRate").innerHTML = "�������(Ԫ)";
					}
				}
			}
			
			function CheckNoData()
			{
				if(LeaseRoomThdContractAuditManage.AuditReasons.value=="")
				{
					HDialog.Info("��������˲�ͨ��ԭ��,�����Ϊ��!");
					LeaseRoomThdContractAuditManage.AuditReasons.focus();
					return false;
				}
				return true;
			}
			
			function CheckCancelData()
			{
				if(LeaseRoomThdContractAuditManage.AuditReasons.value=="")
				{
				    HDialog.Info("���������ȡ��ԭ��,�����Ϊ��!");
					LeaseRoomThdContractAuditManage.AuditReasons.focus();
					return false;
				}				
				return true;
			}
			
			
		//-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="LeaseRoomThdContractAuditManage" method="post" runat="server">
        <input id="hiOPType" size="1" type="hidden" name="hiOPType" runat="server">
        <input id="RoomID" size="1" type="hidden" name="RoomID" runat="server">
        <input id="ContID" size="1" type="hidden" name="ContID" runat="server"><input style="height: 21px; width: 24px" id="PrintParms" size="1" type="hidden" name="PrintParms"
            runat="server"><input style="height: 28px; width: 0.54%" id="CustID" size="1" type="hidden" name="CustID"
                runat="server"><input style="height: 22px; width: 16px" id="IsAuditing" size="1" type="hidden" name="IsAuditing"
                    runat="server"><input id="IsAuditCancal" style="height: 22px; z-index: 0; width: 16px" size="1" type="hidden"
                        name="IsAuditCancal" runat="server">

        <div id="DivTop" style="width: 100%; overflow-y: auto">
            <table class="DialogTable">

                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">�ͻ���������</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="CustName" class="Control_ItemInput" readonly
                            name="ContSign" runat="server">
                    </td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">����֤��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PassSign" class="Control_ItemInput" readonly
                            name="ContSign" runat="server">
                    </td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">֤������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PaperName" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">֤������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PaperCode" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�ͻ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="CustTypeName" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�̶��绰</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="FixedTel" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">�ƶ��绰</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="MobilePhone" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">����绰</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="FaxTel" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ϵ��ַ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="AddRess" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PostCode" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>

                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">��ͬ������Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="ContSort" runat="server" Enabled="False">
                            <asp:ListItem Value="1" Selected="True">����</asp:ListItem>
                            <asp:ListItem Value="2">֧��</asp:ListItem>
                            <asp:ListItem Value="3">����</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ���</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="ContModel" runat="server">
                            <asp:ListItem Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="����">����</asp:ListItem>
                            <asp:ListItem Value="�Ƿ���">�Ƿ���</asp:ListItem>
                        </asp:DropDownList></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">ҵ�����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="ContTypeCode" runat="server"></asp:DropDownList></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ��Դ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContSource" class="Control_ItemInput" 
                            name="ContSource" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ���</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onblur="javascript:CheckContSign();" id="ContSign" class="Control_ItemInput"
                            name="ContSign" runat="server">*
						<div id="ContSignResults" class="font_red"></div>
                    </td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaseContName" class="Control_ItemInput"
                            name="LeaseRegSign" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">��ǰ״̬</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:Label ID="IsEffect" runat="server"></asp:Label></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">��ͬǩԼ��Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">������ʱ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="ApprovalStartDate" class="Wdate"
                            name="ApprovalStartDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">����ֹʱ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="ApprovalEndDate" class="Wdate"
                            name="ApprovalEndDate" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">ǩԼ״̬</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="SignStatus" runat="server"></asp:DropDownList></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">ǩԼ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="SignSchedule" class="Control_ItemInput"
                            name="SignSchedule" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">ǩ������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="SignDate" class="Wdate"
                            name="SignDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">ǩ����ַ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="SignAddress" class="Control_ItemInput"
                            name="SignAddress" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ǽ�ʱ��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="EnterDate" class="Wdate"
                            name="EnterDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ǽ���</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="EnterMan" class="Control_ItemInput"
                            name="EnterMan" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">���ⷽ��Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���ⷽ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="Leaser" class="Control_ItemInput"
                            name="Leaser" runat="server">*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���ⷽע���ַ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaseRegAddr" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">���֤ⷽ������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="LeaserPaperName" runat="server" name="LeaserPaperName">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���֤ⷽ������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaserCode" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">������Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="Leaser2" class="Control_ItemInput"
                            name="Leaser" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">����ע���ַ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaseRegAddr2" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">����֤������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="LeaserPaperName2" runat="server" name="LeaserPaperName2">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">����֤������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaserCode2" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">���ⷽ��Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���ⷽ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="Renter" class="Control_ItemInput"
                            name="Renter" runat="server">*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���ⷽע���ַ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RenterRegAddr" class="Control_ItemInput"
                            name="RenterRegAddr" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">���֤ⷽ������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="RentPaperName" name="RentPaperName" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���֤ⷽ������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentPaperCode" class="Control_ItemInput"
                            name="RentPaperCode" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ϵ��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentLinkMan" class="Control_ItemInput"
                            name="RentLinkMan" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ϵ�绰</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentLinkTel" class="Control_ItemInput"
                            name="RentLinkTel" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentDoorPlace" class="Control_ItemInput"
                            name="RentDoorPlace" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ס��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentDwellPlace" class="Control_ItemInput"
                            name="RentDwellPlace" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��Ӫҵ̬</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DealPromise" class="Control_ItemInput"
                            name="DealPromise" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ӪƷ��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DealBrand" class="Control_ItemInput"
                            name="DealBrand" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">��Ӫ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DealLevel" class="Control_ItemInput"
                            name="DealLevel" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="YearHold" class="Control_ItemInput"
                            name="YearHold" runat="server">(��)</td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ż�����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="PreferentialPolicy" name="PreferentialPolicy" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ż�֤��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PrefPolicyPaperName" class="Control_ItemInput"
                            name="PrefPolicyPaperName" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">��ס����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="StayTime" class="Wdate"
                            name="StayTime" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">��ͬ�Ʒ���Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ʼ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="LeaseBeginDate" class="Wdate"
                            name="LeaseBeginDate" runat="server">*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="LeaseEndDate" class="Wdate"
                            name="LeaseEndDate" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ż������ڿ�ʼ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="FavBeginDate" class="Wdate"
                            name="FavBeginDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ż������ڽ�������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="FavEndDate" class="Wdate"
                            name="FavEndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">˳����������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="PostponeDate" class="Control_ItemInput"
                            name="PostponeDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">˳��ԭ��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PostponeReason" class="Wdate"
                            name="PostponeReason" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">����/����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContRoomObject" class="Control_ItemInput"
                            name="ContRoomObject" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">����/���ʵ�λ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContRoomUnit" class="Control_ItemInput"
                            name="ContRoomUnit" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeasePrice" class="Control_ItemInput"
                            name="LeasePrice" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���۵�λ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PriceUnit" class="Control_ItemInput"
                            name="PriceUnit" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">�������˷ѵ���</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="GarbageFeePrice" class="Control_ItemInput"
                            name="GarbageFeePrice" runat="server">
                    </td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�������˷ѵ��۵�λ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="GarbageFeeUnit" class="Control_ItemInput"
                            name="GarbageFeeUnit" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContBuildArea" class="Control_ItemInput"
                            name="ContBuildArea" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">������λ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContNumUnit" class="Control_ItemInput"
                            name="ContNumUnit" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ�ܼ�</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContTotalAmount" class="Control_ItemInput"
                            name="ContTotalAmount" runat="server">(Ԫ)</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ��֤��</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContDepositAmount" class="Control_ItemInput"
                            name="ContDepositAmount" runat="server">(Ԫ)</td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ʒ�����(��)</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="PayPeriod" name="PayPeriod" runat="server">
                            <option selected></option>
                        </select>*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���㷽ʽ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="PayType" name="PayType" runat="server">
                            <option selected></option>
                        </select></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬΥԼ������</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DelinDelay" class="Control_ItemInput" name="DelinDelay"
                            runat="server">(��)</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬΥԼ�����</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DelinRates" class="Control_ItemInput"
                             name="DelinRates" runat="server">(С��/��)</td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">
                        <input id="ContBail" style="height: 22px; width: 16px" size="1" type="hidden" name="ContBail"
                            runat="server"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="IsContinueTime" checked type="checkbox" value="" name="IsContinueTime" runat="server">����ʱ��ÿ�µ��ۼ���ʱ,���ʱ���ڼ䲻ͬ����,�Ƿ������Ʒ�</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">�Ƿ�ԽӲ���ϵͳ</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="IsFinance" style="z-index: 0" name="IsFinance" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">��ͬ������Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ͬ����</td>
                    <td class="TdContentSearch" colspan="3" >
                        <textarea id="OtherPromise" style="height: 108px; width: 90%;" rows="6" cols="60" name="OtherPromise"
                            runat="server"></textarea></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">֧������</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="PaymentDetails" style="height: 108px; width: 90%;" rows="6" cols="60" name="PaymentDetails"
                            runat="server"></textarea></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">��ע</td>
                    <td class="TdContentSearch" colspan="7" >
                        <textarea id="ContMemo" style="height: 108px; width: 90%;" rows="5" cols="60" name="ContMemo"
                            runat="server"></textarea></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">�����Ϣ</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">���ԭ��</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="AuditReasons" name="AuditReasons" rows="5" cols="60" runat="server" style="height: 108px; width: 90%;"></textarea><br>
                        <asp:Label ID="AuditContent" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="formTable_Footer" colspan="8" align="center">
                        <input id="btnOk" class="button" value="���ͨ��" type="button" name="btnOk"
                            runat="server">&nbsp;<input id="btnNo" class="button" value="��˲�ͨ��" type="button"
                                onclick="javascript:if(CheckNoData()==false) return false;" name="btnNo" runat="server">&nbsp;<input id="btnCancel" class="button" value="ȡ�����" type="button"
                                    onclick="javascript:if(CheckCancelData()==false) return false;" name="btnCancel" runat="server">&nbsp;<input id="btnReturn" class="button" value="�ر�" type="button" name="btnReturn"
                                        runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: ΢���ź�;"><span style="font-size: 16px">��ͬ����</span> </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <asp:DataGrid Style="font-size: 12px" ID="DGrid" runat="server" AutoGenerateColumns="False" Width="100%"
                            CssClass="DataGrid">
                            <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                            <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                            <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                            <Columns>
                                <asp:BoundColumn Visible="False" DataField="AdjunctCode">
                                    <HeaderStyle Width="0px"></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="AdjunctName" HeaderText="�ļ�˵��">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="FileSize" HeaderText="��С(KB)" DataFormatString="{0:N2}">
                                    <HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="[����]">
                                    <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='����'  >"
                                            CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="[ɾ��]">
                                    <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" TabIndex="1" runat="server" CausesValidation="false" CommandName="Delete"
                                            Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('��ȷ���Ƿ�ɾ���ü�¼')==false) return false;&quot; alt='ɾ��' >"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid></td>
                </tr>
                <%--	<TR>
					<TD  class="formTable_Header" colSpan="4" align="center">��˼�¼</TD>
				</TR>--%>
                <tr>
                    <td valign="top" width="100%" colspan="8">
                        <input id="AuditData" name="AuditData" type="hidden" runat="server" />
                         <div class="SearchContainer" id="DGridAudit" style="height:200px"></div>

                        <%--    <asp:datagrid id="DGridAudit" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="DataGrid"
							Height="100%">
							<SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
							<AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
							<ItemStyle CssClass="DataGrid_Item"></ItemStyle>
							<HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
							<Columns>
								<asp:BoundColumn Visible="False" DataField="IID" ReadOnly="True"></asp:BoundColumn>
								<asp:BoundColumn DataField="OrganName" ReadOnly="True" HeaderText="��˻���"></asp:BoundColumn>
								<asp:BoundColumn DataField="RoleName" ReadOnly="True" HeaderText="��˸�λ"></asp:BoundColumn>
								<asp:BoundColumn DataField="AuditUserName" ReadOnly="True" HeaderText="�����"></asp:BoundColumn>
								<asp:BoundColumn DataField="AuditDate" ReadOnly="True" HeaderText="���ʱ��"></asp:BoundColumn>
								<asp:BoundColumn DataField="IsAuditName" ReadOnly="True" HeaderText="���״̬"></asp:BoundColumn>
								<asp:BoundColumn DataField="AuditReasons" ReadOnly="True" HeaderText="���ԭ��"></asp:BoundColumn>
							</Columns>
							<PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
						</asp:datagrid>--%>

                    </td>
                </tr>
            </table>
        </div>
        <div id="DivBottom" style="width: 100%; overflow-y: auto">
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" id="htdj" name="htdj" refpage="htdj" refsel="1"><a data-toggle="tab" href="#tab-11" aria-expanded="true">�������</a>
                    </li>

                    <li class="" name="jfbz" id="jfbz" refpage="jfbz" refsel="0"><a data-toggle="tab" href="#tab-12" aria-expanded="false">��׼���</a>
                    </li>
                    <li class="" name="htfy" id="htfy" refpage="htfy" refsel="0"><a data-toggle="tab" href="#tab-13" aria-expanded="false">��ͬ����</a>
                    </li>

                </ul>
                <div class="tab-content">
                    <div id="tab-11" class="tab-pane active">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer1">1</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-12" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div id="TableContainer2">2</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-13" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="DGridFee">3</div>
                                <div class="SearchContainer" id="DGridAuditFee">3</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script type="text/javascript">

                function InitDiv() {
                    var H = $(window).height();
                    var DivH = H * 0.65;
                    var DivH2 = H * 0.35;
                    $('#DivTop').css('height', DivH + 'px');

                    $('#DivBottom').css('height', DivH2 + 'px');


                    var HR2 = DivH2 - 39;
                    $('#TableContainer1').css('height', HR2 + 'px');
                    $('#TableContainer2').css('height', HR2 + 'px');

                    var HR3 = HR2 / 2;
                    $('#DGridFee').css('height', '250px');
                    $('#DGridAuditFee').css('height', '250px');
                }
                InitDiv();
                $('#btnReturn').click(function () {
                    HDialog.Close();
                })
                var DGridAuditcolumn = [[
                    { field: 'OrganName', title: '��˻���', width: '160', align: 'left', sortable: true },
                    { field: 'RoleName', title: '��˸�λ', width: '160', align: 'left', sortable: true },
                    { field: 'AuditUserName', title: '�����', width: '160', align: 'left', sortable: true },
                    { field: 'AuditDate', title: '���ʱ��', width: '160', align: 'left', sortable: true },
                    { field: 'IsAuditName', title: '���״̬', width: '160', align: 'left', sortable: true },
                    { field: 'AuditReasons', title: '���ԭ��', width: '160', align: 'left', sortable: true }
                ]];


                var column = [[
                      { field: 'RoomSign', title: '���ݱ��', width: '160', align: 'left', sortable: true },
                      { field: 'BuildArea', title: '�������', width: '100', align: 'left', sortable: true },
                      {
                          field: 'StartDate', title: '��ʼʱ��', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.StartDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'EndDate', title: '����ʱ��', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.EndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'ReletDate', title: '��Լʱ����', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.ReletDate, "yyyy-MM-dd");
                              return str;
                          }
                      }

                ]];


                var ContSettingcolumn = [[
                   { field: 'CustName', title: '���óе�����', width: '100', align: 'left', sortable: true },
                   { field: 'RoomSign', title: '���ݱ��', width: '100', align: 'left', sortable: true },
                   {
                       field: 'DueDate', title: 'Ӧ������', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                           var str = formatDate(row.DueDate, "yyyy-MM-dd");
                           return str;
                       }
                   },
                   {
                       field: 'BeginDate', title: '��ʼ����', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                           var str = formatDate(row.BeginDate, "yyyy-MM-dd");
                           return str;
                       }
                   },
                   {
                       field: 'EndDate', title: '��������', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                           var str = formatDate(row.EndDate, "yyyy-MM-dd");
                           return str;
                       }
                   },
                   { field: 'CostName', title: '��������', width: '100', align: 'left', sortable: true },
                   { field: 'ContNum', title: '���', width: '100', align: 'left', sortable: true },
                   { field: 'CalcTypeName', title: '���㷽ʽ', width: '100', align: 'left', sortable: true },
                   { field: 'ContPrice', title: '����', width: '100', align: 'left', sortable: true },
                   { field: 'IncreTypeName', title: '������ʽ', width: '100', align: 'left', sortable: true },
                   { field: 'IncreRate', title: '������/���', width: '100', align: 'left', sortable: true },
                   { field: 'IncrePeriod', title: '��������', width: '100', align: 'left', sortable: true }

                ]];

                $(".tabs-container li").click(function () {


                    switch ($(this).attr("name")) {

                        case "htdj":
                            setTimeout("LoadRoomList()", 10);
                            break;
                        case "jfbz":
                            setTimeout("LoadLeaseContractSettingList()", 10)
                            //LoadLeaseContractSettingList();
                            break;
                        case "htfy":
                            setTimeout("LoadFeesList()", 10);
                            break;

                    }


                });



                var FeesColumn = [[
                       { field: 'CustName', title: '�ͻ�����', width: 100, align: 'left', sortable: true },
                        { field: 'RoomSign', title: '���ݱ��', width: 180, align: 'left', sortable: true },

                        { field: 'CostName', title: '��������', width: 100, align: 'left', sortable: true },
                        {
                            field: 'FeeDueYearMonth', title: '��������', width: 100, align: 'left', sortable: true
                        },
                        {
                            field: 'AccountsDueDate', title: 'Ӧ������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesStateDate', title: '��ʼ����', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesEndDate', title: '��������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        { field: 'DueAmount', title: 'Ӧ�ս��', width: 100, align: 'left', sortable: true },
                        { field: 'PaidAmount', title: 'ʵ�ս��', width: 100, align: 'left', sortable: true },
                        { field: 'PrecAmount', title: 'Ԥ�����', width: 100, align: 'left', sortable: true },
                        { field: 'WaivAmount', title: '�������', width: 100, align: 'left', sortable: true },
                        { field: 'DebtsAmount', title: 'Ƿ�ս��', width: 100, align: 'left', sortable: true }


                ]];



                var AuditingFeesColumn = [[
                       { field: 'CustName', title: '�ͻ�����', width: 100, align: 'left', sortable: true },
                        { field: 'RoomSign', title: '���ݱ��', width: 180, align: 'left', sortable: true },

                        { field: 'CostName', title: '��������', width: 100, align: 'left', sortable: true },
                        {
                            field: 'FeeDueYearMonth', title: '��������', width: 100, align: 'left', sortable: true
                        },
                        {
                            field: 'AccountsDueDate', title: 'Ӧ������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesStateDate', title: '��ʼ����', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        {
                            field: 'FeesEndDate', title: '��������', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                                var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                                return str;
                            }
                        },
                        { field: 'DueAmount', title: 'Ӧ�ս��', width: 100, align: 'left', sortable: true }


                ]];


                function LoadRoomList()
                {

                    column = [[
                     { field: 'RoomSign', title: '���ݱ��', width: '160', align: 'left', sortable: true },
                     { field: 'BuildArea', title: '�������', width: '100', align: 'left', sortable: true },
                     {
                         field: 'StartDate', title: '��ʼʱ��', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.StartDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                      {
                          field: 'EndDate', title: '����ʱ��', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.EndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'ReletDate', title: '��Լʱ����', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.ReletDate, "yyyy-MM-dd");
                              return str;
                          }
                      }

                    ]];


                    $("#TableContainer1").datagrid({
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
                        sortOrder: "asc",
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false,
                        
                        onBeforeLoad: function (param) {
                            param = $.JQForm.GetParam("RoomRental", "LeaseCustomerLive", "TableContainer1", param);

                        },
                        onLoadSuccess: function (data) {

                        }
                    });

                }

                //��ͬ��׼
                function LoadLeaseContractSettingList() {

                    ContSettingcolumn = [[
                     { field: 'CustName', title: '���óе�����', width: '100', align: 'left', sortable: true },
                     { field: 'RoomSign', title: '���ݱ��', width: '100', align: 'left', sortable: true },
                     {
                         field: 'DueDate', title: 'Ӧ������', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.DueDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'BeginDate', title: '��ʼ����', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.BeginDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     {
                         field: 'EndDate', title: '��������', width: '100', align: 'left', sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.EndDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                     { field: 'CostName', title: '��������', width: '100', align: 'left', sortable: true },
                     { field: 'ContNum', title: '���', width: '100', align: 'left', sortable: true },
                     { field: 'CalcTypeName', title: '���㷽ʽ', width: '100', align: 'left', sortable: true },
                     { field: 'ContPrice', title: '����', width: '100', align: 'left', sortable: true },
                     { field: 'IncreTypeName', title: '������ʽ', width: '100', align: 'left', sortable: true },
                     { field: 'IncreRate', title: '������/���', width: '100', align: 'left', sortable: true },
                     { field: 'IncrePeriod', title: '��������', width: '100', align: 'left', sortable: true }

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
                LoadRoomList();


                //�������
                function LoadFeesList() {
                    LoadLeaseContractFeesList();
                    LoadAuditingLeaseConFeesDetailList();
                }

                function LoadLeaseContractFeesList() {
                    $("#DGridFee").datagrid({
                        url: '/HM/M_Main/HC/DataPostControl.aspx',
                        method: "post",
                        nowrap: false,
                        title: '�����/�������',
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
                        title: 'δ��˷���',
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

                function LoadAuditData()
                {
                    DGridAuditcolumn = [[
                    { field: 'OrganName', title: '��˻���', width: '160', align: 'left', sortable: true },
                    { field: 'RoleName', title: '��˸�λ', width: '160', align: 'left', sortable: true },
                    { field: 'AuditUserName', title: '�����', width: '160', align: 'left', sortable: true },
                    { field: 'AuditDate', title: '���ʱ��', width: '160', align: 'left', sortable: true },
                    { field: 'IsAuditName', title: '���״̬', width: '160', align: 'left', sortable: true },
                    { field: 'AuditReasons', title: '���ԭ��', width: '160', align: 'left', sortable: true }
                    ]];

                    var data = $('#AuditData').val();
                    var obj = JSON.parse(data);
                    $("#DGridAudit").datagrid({
                        data: obj,
                        nowrap: false,
                        title: '��˼�¼',
                        pageSize: top.ListPageSize,
                        pageList: top.ListPageList,
                        columns: DGridAuditcolumn,
                        fitColumns: true,
                        remoteSort: false,
                        singleSelect: true,
                        pagination: true,
                        singleSelect: true,
                        selectOnCheck: false,
                        checkOnSelect: false,
                        rownumbers: true,
                        border: false
                    });
                }
                LoadAuditData();

                $('#btnReturn').click(function () {
                    HDialog.Close();
                });

        </script>
    </form>

</body>
</html>
