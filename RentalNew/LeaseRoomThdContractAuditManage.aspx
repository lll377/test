<%@ Page Language="c#" CodeBehind="LeaseRoomThdContractAuditManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.RentalNew.LeaseRoomThdContractAuditManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>租赁合同审核</title>
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
					getObject("lbIncreRate").innerHTML = "递增率(%)"
						
				}
				else
				{
					if(LeaseRoomThdContractAuditManage.IncreType2.checked)
					{
						getObject("lbIncreRate").innerHTML = "递增金额(元)";
					}
				}
			}
			
			function CheckNoData()
			{
				if(LeaseRoomThdContractAuditManage.AuditReasons.value=="")
				{
					HDialog.Info("请输入审核不通过原因,此项不能为空!");
					LeaseRoomThdContractAuditManage.AuditReasons.focus();
					return false;
				}
				return true;
			}
			
			function CheckCancelData()
			{
				if(LeaseRoomThdContractAuditManage.AuditReasons.value=="")
				{
				    HDialog.Info("请输入审核取消原因,此项不能为空!");
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
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">客户基本资料</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">姓名</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="CustName" class="Control_ItemInput" readonly
                            name="ContSign" runat="server">
                    </td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">出入证号</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PassSign" class="Control_ItemInput" readonly
                            name="ContSign" runat="server">
                    </td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">证件名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PaperName" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">证件号码</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PaperCode" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">客户类别</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="CustTypeName" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">固定电话</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="FixedTel" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">移动电话</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="MobilePhone" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">传真电话</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="FaxTel" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">联系地址</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="AddRess" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">邮政编码</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PostCode" class="Control_ItemInput" readonly
                            name="ContSign" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>

                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同基本信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同类型</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="ContSort" runat="server" Enabled="False">
                            <asp:ListItem Value="1" Selected="True">收入</asp:ListItem>
                            <asp:ListItem Value="2">支出</asp:ListItem>
                            <asp:ListItem Value="3">其它</asp:ListItem>
                        </asp:DropDownList></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同类别</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="ContModel" runat="server">
                            <asp:ListItem Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="范本">范本</asp:ListItem>
                            <asp:ListItem Value="非范本">非范本</asp:ListItem>
                        </asp:DropDownList></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">业务类别</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="ContTypeCode" runat="server"></asp:DropDownList></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同来源</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContSource" class="Control_ItemInput" 
                            name="ContSource" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同编号</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onblur="javascript:CheckContSign();" id="ContSign" class="Control_ItemInput"
                            name="ContSign" runat="server">*
						<div id="ContSignResults" class="font_red"></div>
                    </td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaseContName" class="Control_ItemInput"
                            name="LeaseRegSign" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">当前状态</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:Label ID="IsEffect" runat="server"></asp:Label></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同签约信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">审批起时</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="ApprovalStartDate" class="Wdate"
                            name="ApprovalStartDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">审批止时</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="ApprovalEndDate" class="Wdate"
                            name="ApprovalEndDate" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">签约状态</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <asp:DropDownList ID="SignStatus" runat="server"></asp:DropDownList></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">签约进度</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="SignSchedule" class="Control_ItemInput"
                            name="SignSchedule" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">签定日期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="SignDate" class="Wdate"
                            name="SignDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">签定地址</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="SignAddress" class="Control_ItemInput"
                            name="SignAddress" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">登记时间</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="EnterDate" class="Wdate"
                            name="EnterDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">登记人</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="EnterMan" class="Control_ItemInput"
                            name="EnterMan" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">出租方信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">出租方名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="Leaser" class="Control_ItemInput"
                            name="Leaser" runat="server">*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">出租方注册地址</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaseRegAddr" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">出租方证件名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="LeaserPaperName" runat="server" name="LeaserPaperName">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">出租方证件号码</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaserCode" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">管理方信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">管理方名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="Leaser2" class="Control_ItemInput"
                            name="Leaser" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">管理方注册地址</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaseRegAddr2" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">管理方证件名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="LeaserPaperName2" runat="server" name="LeaserPaperName2">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">管理方证件号码</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeaserCode2" class="Control_ItemInput"
                            name="LeaseRegAddr" runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">承租方信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">承租方名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="Renter" class="Control_ItemInput"
                            name="Renter" runat="server">*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">承租方注册地址</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RenterRegAddr" class="Control_ItemInput"
                            name="RenterRegAddr" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">承租方证件名称</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="RentPaperName" name="RentPaperName" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">承租方证件号码</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentPaperCode" class="Control_ItemInput"
                            name="RentPaperCode" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">联系人</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentLinkMan" class="Control_ItemInput"
                            name="RentLinkMan" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">联系电话</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentLinkTel" class="Control_ItemInput"
                            name="RentLinkTel" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">户籍地</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentDoorPlace" class="Control_ItemInput"
                            name="RentDoorPlace" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">居住地</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="RentDwellPlace" class="Control_ItemInput"
                            name="RentDwellPlace" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">经营业态</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DealPromise" class="Control_ItemInput"
                            name="DealPromise" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">经营品牌</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DealBrand" class="Control_ItemInput"
                            name="DealBrand" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">经营级别</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DealLevel" class="Control_ItemInput"
                            name="DealLevel" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">租赁年限</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="YearHold" class="Control_ItemInput"
                            name="YearHold" runat="server">(月)</td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">优惠政策</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="PreferentialPolicy" name="PreferentialPolicy" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">优惠证件</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PrefPolicyPaperName" class="Control_ItemInput"
                            name="PrefPolicyPaperName" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">入住日期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="StayTime" class="Wdate"
                            name="StayTime" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同计费信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">开始日期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="LeaseBeginDate" class="Wdate"
                            name="LeaseBeginDate" runat="server">*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">结束日期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="LeaseEndDate" class="Wdate"
                            name="LeaseEndDate" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">优惠免租期开始日期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="FavBeginDate" class="Wdate"
                            name="FavBeginDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">优惠免租期结束日期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="FavEndDate" class="Wdate"
                            name="FavEndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">顺延起租日期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input onclick="WdatePicker()" onkeypress="CheckDate();" id="PostponeDate" class="Control_ItemInput"
                            name="PostponeDate" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">顺延原因</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PostponeReason" class="Wdate"
                            name="PostponeReason" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">房屋/物资</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContRoomObject" class="Control_ItemInput"
                            name="ContRoomObject" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">房屋/物资单位</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContRoomUnit" class="Control_ItemInput"
                            name="ContRoomUnit" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同单价</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="LeasePrice" class="Control_ItemInput"
                            name="LeasePrice" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">单价单位</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="PriceUnit" class="Control_ItemInput"
                            name="PriceUnit" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">垃圾清运费单价</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="GarbageFeePrice" class="Control_ItemInput"
                            name="GarbageFeePrice" runat="server">
                    </td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">垃圾清运费单价单位</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="GarbageFeeUnit" class="Control_ItemInput"
                            name="GarbageFeeUnit" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同数量</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContBuildArea" class="Control_ItemInput"
                            name="ContBuildArea" runat="server"></td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">数量单位</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContNumUnit" class="Control_ItemInput"
                            name="ContNumUnit" runat="server"></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">合同总价</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContTotalAmount" class="Control_ItemInput"
                            name="ContTotalAmount" runat="server">(元)</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同保证金</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="ContDepositAmount" class="Control_ItemInput"
                            name="ContDepositAmount" runat="server">(元)</td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">计费周期(月)</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="PayPeriod" name="PayPeriod" runat="server">
                            <option selected></option>
                        </select>*</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">计算方式</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="PayType" name="PayType" runat="server">
                            <option selected></option>
                        </select></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">合同违约金延期</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DelinDelay" class="Control_ItemInput" name="DelinDelay"
                            runat="server">(天)</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同违约金比率</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="DelinRates" class="Control_ItemInput"
                             name="DelinRates" runat="server">(小数/天)</td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">
                        <input id="ContBail" style="height: 22px; width: 16px" size="1" type="hidden" name="ContBail"
                            runat="server"></td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <input id="IsContinueTime" checked type="checkbox" value="" name="IsContinueTime" runat="server">按对时按每月单价计算时,多个时间期间不同单价,是否连续计费</td>
                    <td class="TdTitle" style="width: 10%; height: 26px;">是否对接财务系统</td>
                    <td class="TdContentSearch" style="width: 15%; height: 26px;">
                        <select id="IsFinance" style="z-index: 0" name="IsFinance" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同其他信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">合同内容</td>
                    <td class="TdContentSearch" colspan="3" >
                        <textarea id="OtherPromise" style="height: 108px; width: 90%;" rows="6" cols="60" name="OtherPromise"
                            runat="server"></textarea></td>

                    <td class="TdTitle" style="width: 10%; height: 26px;">支付详情</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="PaymentDetails" style="height: 108px; width: 90%;" rows="6" cols="60" name="PaymentDetails"
                            runat="server"></textarea></td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">备注</td>
                    <td class="TdContentSearch" colspan="7" >
                        <textarea id="ContMemo" style="height: 108px; width: 90%;" rows="5" cols="60" name="ContMemo"
                            runat="server"></textarea></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">审核信息</span> </td>
                </tr>
                <tr>
                    <td class="TdTitle" style="width: 10%; height: 26px;">审核原因</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="AuditReasons" name="AuditReasons" rows="5" cols="60" runat="server" style="height: 108px; width: 90%;"></textarea><br>
                        <asp:Label ID="AuditContent" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="formTable_Footer" colspan="8" align="center">
                        <input id="btnOk" class="button" value="审核通过" type="button" name="btnOk"
                            runat="server">&nbsp;<input id="btnNo" class="button" value="审核不通过" type="button"
                                onclick="javascript:if(CheckNoData()==false) return false;" name="btnNo" runat="server">&nbsp;<input id="btnCancel" class="button" value="取消审核" type="button"
                                    onclick="javascript:if(CheckCancelData()==false) return false;" name="btnCancel" runat="server">&nbsp;<input id="btnReturn" class="button" value="关闭" type="button" name="btnReturn"
                                        runat="server"></td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同附件</span> </td>
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
                                <asp:BoundColumn DataField="AdjunctName" HeaderText="文件说明">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="FileSize" HeaderText="大小(KB)" DataFormatString="{0:N2}">
                                    <HeaderStyle HorizontalAlign="Center" Width="150px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="[下载]">
                                    <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='下载'  >"
                                            CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="[删除]">
                                    <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" TabIndex="1" runat="server" CausesValidation="false" CommandName="Delete"
                                            Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid></td>
                </tr>
                <%--	<TR>
					<TD  class="formTable_Header" colSpan="4" align="center">审核记录</TD>
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
								<asp:BoundColumn DataField="OrganName" ReadOnly="True" HeaderText="审核机构"></asp:BoundColumn>
								<asp:BoundColumn DataField="RoleName" ReadOnly="True" HeaderText="审核岗位"></asp:BoundColumn>
								<asp:BoundColumn DataField="AuditUserName" ReadOnly="True" HeaderText="审核人"></asp:BoundColumn>
								<asp:BoundColumn DataField="AuditDate" ReadOnly="True" HeaderText="审核时间"></asp:BoundColumn>
								<asp:BoundColumn DataField="IsAuditName" ReadOnly="True" HeaderText="审核状态"></asp:BoundColumn>
								<asp:BoundColumn DataField="AuditReasons" ReadOnly="True" HeaderText="审核原因"></asp:BoundColumn>
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
                    <li class="active" id="htdj" name="htdj" refpage="htdj" refsel="1"><a data-toggle="tab" href="#tab-11" aria-expanded="true">房屋情况</a>
                    </li>

                    <li class="" name="jfbz" id="jfbz" refpage="jfbz" refsel="0"><a data-toggle="tab" href="#tab-12" aria-expanded="false">标准情况</a>
                    </li>
                    <li class="" name="htfy" id="htfy" refpage="htfy" refsel="0"><a data-toggle="tab" href="#tab-13" aria-expanded="false">合同费用</a>
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
                    { field: 'OrganName', title: '审核机构', width: '160', align: 'left', sortable: true },
                    { field: 'RoleName', title: '审核岗位', width: '160', align: 'left', sortable: true },
                    { field: 'AuditUserName', title: '审核人', width: '160', align: 'left', sortable: true },
                    { field: 'AuditDate', title: '审核时间', width: '160', align: 'left', sortable: true },
                    { field: 'IsAuditName', title: '审核状态', width: '160', align: 'left', sortable: true },
                    { field: 'AuditReasons', title: '审核原因', width: '160', align: 'left', sortable: true }
                ]];


                var column = [[
                      { field: 'RoomSign', title: '房屋编号', width: '160', align: 'left', sortable: true },
                      { field: 'BuildArea', title: '建筑面积', width: '100', align: 'left', sortable: true },
                      {
                          field: 'StartDate', title: '开始时间', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.StartDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'EndDate', title: '结束时间', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.EndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'ReletDate', title: '续约时间至', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.ReletDate, "yyyy-MM-dd");
                              return str;
                          }
                      }

                ]];


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


                function LoadRoomList()
                {

                    column = [[
                     { field: 'RoomSign', title: '房屋编号', width: '160', align: 'left', sortable: true },
                     { field: 'BuildArea', title: '建筑面积', width: '100', align: 'left', sortable: true },
                     {
                         field: 'StartDate', title: '开始时间', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                             var str = formatDate(row.StartDate, "yyyy-MM-dd");
                             return str;
                         }
                     },
                      {
                          field: 'EndDate', title: '结束时间', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

                              var str = formatDate(row.EndDate, "yyyy-MM-dd");
                              return str;
                          }
                      },
                      {
                          field: 'ReletDate', title: '续约时间至', width: '120', align: 'left', sortable: true, sortable: true, sortable: true, formatter: function (value, row, index) {

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
                LoadRoomList();


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
                        title: '已审核/处理费用',
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

                function LoadAuditData()
                {
                    DGridAuditcolumn = [[
                    { field: 'OrganName', title: '审核机构', width: '160', align: 'left', sortable: true },
                    { field: 'RoleName', title: '审核岗位', width: '160', align: 'left', sortable: true },
                    { field: 'AuditUserName', title: '审核人', width: '160', align: 'left', sortable: true },
                    { field: 'AuditDate', title: '审核时间', width: '160', align: 'left', sortable: true },
                    { field: 'IsAuditName', title: '审核状态', width: '160', align: 'left', sortable: true },
                    { field: 'AuditReasons', title: '审核原因', width: '160', align: 'left', sortable: true }
                    ]];

                    var data = $('#AuditData').val();
                    var obj = JSON.parse(data);
                    $("#DGridAudit").datagrid({
                        data: obj,
                        nowrap: false,
                        title: '审核记录',
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
