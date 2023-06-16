<%@ Page language="c#" Codebehind="LeaseRoomThdContractManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.RentalNew.LeaseRoomThdContractManage" %>
<%--<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>--%>

<!DOCTYPE html>
<html>
 <head> 
  <title>LeaseRoomThdContractManage</title> 
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
      .textbox-icon searchbox-button {
        width:18px;
        height:18px;
      }
  </style>
    <script type="text/javascript">
        function lickDeductFs(DeductFs) {
            //var hreff=location.href+"&DeductType="+DeductFs+"#autoAnchorPoint";
            var parstr = location.href.split('&DeductType');
            location.href = parstr[0] + "&DeductType=" + DeductFs + "&IsLoad=1#autoAnchorPoint";
        }

        function btnClear_Onclick() {
            LeaseRoomThdContractManage.NewCustName2.value = "";
            LeaseRoomThdContractManage.NewCustID2.value = "";
            LeaseRoomThdContractManage.SelRoomID2.value = "";
            LeaseRoomThdContractManage.NewRoomID2.value = "";
            LeaseRoomThdContractManage.CostID2.value = "";
            LeaseRoomThdContractManage.CostName2.value = "";
            LeaseRoomThdContractManage.PaulEndAmount.value = "";
            LeaseRoomThdContractManage.DeductType.value = "";
            LeaseRoomThdContractManage.DeductRate.value = "";
            LeaseRoomThdContractManage.Memo.value = "";
        }

        function CheckData() {
            if (LeaseRoomThdContractManage.ContSign.value == "") {
                HDialog.Info("请输入合同编号,此项不能为空!");
                LeaseRoomThdContractManage.ContSign.focus();
                return false;
            }

            var results = getObject("ContSignResults").innerHTML
            if (results != "" && results != "新的合同编号！") {
                HDialog.Info(results);
                LeaseRoomThdContractManage.ContSign.focus();
                return false;
            }

            if (LeaseRoomThdContractManage.LeaseBeginDate.value == "") {
                HDialog.Info("请输入计租日期,此项不能为空!");
                LeaseRoomThdContractManage.LeaseBeginDate.focus();
                return false;
            }

            if (LeaseRoomThdContractManage.LeaseEndDate.value == "") {
                HDialog.Info("请输入截止日期,此项不能为空!");
                LeaseRoomThdContractManage.LeaseEndDate.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.PayPeriod.value == "") {
                HDialog.Info("请选择缴费周期,此项不能为空!");
                LeaseRoomThdContractManage.PayPeriod.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.Leaser.value == "") {
                HDialog.Info("请选择出租方名称,此项不能为空!");
                LeaseRoomThdContractManage.Leaser.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.Renter.value == "") {
                HDialog.Info("请选择承租方名称,此项不能为空!");
                LeaseRoomThdContractManage.Renter.focus();
                return false;
            }
            if (getObject("IsCondition").value == "1" && getObject("ConditionCount").value == "0") {
                HDialog.Info("请输入条件标准!");
                LeaseRoomThdContractManage.StartCondition.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.ContRoomObject.value == "") {
                HDialog.Info("房屋、物资不能为空");
                LeaseRoomThdContractManage.ContRoomObject.focus();
                return false;
            }
            return true;
        }

        function btnOK_Onclick() {
            if (LeaseRoomThdContractManage.BeginDate.value == "") {
                HDialog.Info("请输入开始日期,此项不能为空!");
                LeaseRoomThdContractManage.BeginDate.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.EndDate.value == "") {
                HDialog.Info("请输入结束日期,此项不能为空!");
                LeaseRoomThdContractManage.EndDate.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.DueDate.value == "") {
                HDialog.Info("请输入应收日期,此项不能为空!");
                LeaseRoomThdContractManage.DueDate.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.CostID.value == "") {
                HDialog.Info("请选择费用项目,此项不能为空!");
                LeaseRoomThdContractManage.btnSelCost.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.ContPrice.value == "") {
                HDialog.Info("请输入单价,此项不能为空!");
                LeaseRoomThdContractManage.ContPrice.focus();
                return false;
            }

            if (LeaseRoomThdContractManage.CalcType1.checked) {
                if (LeaseRoomThdContractManage.ContNum.value == "") {
                    HDialog.Info("请输入面积,此项不能为空!");
                    LeaseRoomThdContractManage.ContNum.focus();
                    return false;
                }
            }

            if (LeaseRoomThdContractManage.IncrePeriod.value != "") {
                var varIncrePeriod = parseInt(LeaseRoomThdContractManage.IncrePeriod.value, 10);
                var varPayPeriod = parseInt(LeaseRoomThdContractManage.PayPeriod.value, 10);

                var varMultiple = parseInt(varIncrePeriod / varPayPeriod) + 1;
                var varMod = varIncrePeriod % varPayPeriod;

                var varNewPeriod = varMultiple * varPayPeriod;

                //HDialog.Info(varPayPeriod + "sss" + varIncrePeriod + "sss" + varMultiple + "sss" + varNewPeriod) 

                if (varMod != 0) {
                    HDialog.Info("请输入递增周期,此项应为缴费周期的倍数!");
                    LeaseRoomThdContractManage.IncrePeriod.value = varNewPeriod;
                    LeaseRoomThdContractManage.IncrePeriod.focus();
                    return false;
                }
            }

            return true;
        }

        function btnDeductSet_Onclick() {
            //if(LeaseRoomThdContractManage.SelRoomID2.value=="")
            //{
            //	HDialog.Info("请选择房屋编号,此项不能为空!");
            //	LeaseRoomThdContractManage.SelRoomID2.focus();
            //	return false;
            //}

            if (LeaseRoomThdContractManage.DeductBeginDate.value == "") {
                HDialog.Info("请输入开始时间,此项不能为空!");
                LeaseRoomThdContractManage.DeductBeginDate.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.DeductEndDate.value == "") {
                HDialog.Info("请输入结束时间,此项不能为空!");
                LeaseRoomThdContractManage.DeductEndDate.focus();
                return false;
            }
            if (LeaseRoomThdContractManage.DeductRate.value == "") {
                HDialog.Info("请输入提成比例,此项不能为空!");
                LeaseRoomThdContractManage.DeductRate.focus();
                return false;
            }

            return true;
        }

        function btnSelNewCust_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
            //HDialog.Info("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                LeaseRoomThdContractManage.NewCustID.value = varObjects[0];
                LeaseRoomThdContractManage.NewCustName.value = varObjects[1];
                LeaseRoomThdContractManage.hiNewCustName.value = varObjects[1];

                return true;
            }

            return false;
        }

        function btnSelNewCust2_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
            //HDialog.Info("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                LeaseRoomThdContractManage.NewCustID2.value = varObjects[0];
                LeaseRoomThdContractManage.NewCustName2.value = varObjects[1];
                LeaseRoomThdContractManage.hiNewCustName2.value = varObjects[1];

                Request.sendPOST("LeaseEngageGetRoomSign.aspx", "CustID=" + varObjects[0] + "&rdm=" + Math.random(), callbackGetRoomSign)

                return true;
            }

            return false;


        }

        function callbackGetRoomSign(xmlHttp) {
            var varSelRoomID2 = document.getElementById("SelRoomID2");
            varSelRoomID2.options.length = 0;

            var varReturn = xmlHttp.responseText;
            var varObjects = varReturn.split("\t");
            for (var i = 0; i < varObjects.length; i++) {
                var varOption = varObjects[i].split(',')
                varSelRoomID2.options.add(new Option(varOption[1], varOption[0]));
            }
            //HDialog.Info(xmlHttp.responseText);
        }

        function rdoIncreType_OnClick() {
            if (LeaseRoomThdContractManage.IncreType1.checked) {
                getObject("LabelIncreRate").innerHTML = "递增率(%)"
            }
            else {
                if (LeaseRoomThdContractManage.IncreType2.checked) {
                    getObject("LabelIncreRate").innerHTML = "递增金额(元)";
                }
            }
        }

        function rdoCalcType_OnClick() {
            if (LeaseRoomThdContractManage.CalcType1.checked) {
                getObject("labelCalcType").innerHTML = "单价(元/月)";
                getObject("ContNum").disabled = false;

                getObject("IncreType2").disabled = false;

            }
            else {
                if (LeaseRoomThdContractManage.CalcType2.checked) {
                    getObject("labelCalcType").innerHTML = "总额(元)";
                    getObject("ContNum").text = "";
                    getObject("ContNum").disabled = true;

                    getObject("IncreType1").checked = true;
                    getObject("IncreType2").checked = false;
                    getObject("IncreType2").disabled = true;
                }
                else {
                    if (LeaseRoomThdContractManage.CalcType3.checked) {
                        getObject("labelCalcType").innerHTML = "总金额(元)";
                        getObject("ContNum").text = "";
                        getObject("ContNum").disabled = true;
                        getObject("IncreType1").checked = true;
                        getObject("IncreType2").checked = false;
                        getObject("IncreType2").disabled = true;
                    }
                }
            }
        }

        function btnSelCost_OnClick() {
            //var tmpCostGeneType = FeesMonthStatist.CostGeneType.value;
            var varReturn;
            varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
            //HDialog.Info("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                LeaseRoomThdContractManage.CostID.value = varObjects[0];
                LeaseRoomThdContractManage.CostName.value = varObjects[2];
                LeaseRoomThdContractManage.hiCostName.value = varObjects[2];

                return true;
            }

            return false;
        }

        function btnSelCost2_OnClick() {
            //var tmpCostGeneType = FeesMonthStatist.CostGeneType.value;
            var varReturn;
            varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
            //HDialog.Info("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                LeaseRoomThdContractManage.CostID2.value = varObjects[0];
                LeaseRoomThdContractManage.CostName2.value = varObjects[2];
                LeaseRoomThdContractManage.hiCostName2.value = varObjects[2];

                return true;
            }

            return false;
        }

        function CheckContSign() {
            var strContID = LeaseRoomThdContractManage.ContID.value
            var strContSign = LeaseRoomThdContractManage.ContSign.value;

            getObject("ContSignResults").innerHTML = "";

            Request.sendPOST("CheckContractSign.aspx", "ContID=" + strContID + "&ContSign=" + strContSign + "&Rnd=" + Math.random(), callbackContSign);

        }

        function callbackContSign(xmlHttp) {
            var varReturn = xmlHttp.responseText;
            getObject("ContSignResults").innerHTML = varReturn;
        }

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }

        function ShowDivs(DeductSetID) {
            var varDeductType = document.getElementById("DeductType").value;
            var varReturn = window.showModalDialog("../dialog/LeaseContractDeductSettingDlg.aspx?DeductSetID=" + DeductSetID + "&ContID=" + document.getElementById('ContID').value + "", "window", "dialogWidth=700px;dialogHeight=300px;status:no;help:no;resizable:no;scroll:no");
            var parstr = location.href.split('&DeductType');
            //HDialog.Info(parstr[0]+"&DeductType="+varDeductType+"&IsLoad=1#autoAnchorPoint");
            location.href = parstr[0] + "&DeductType=" + varDeductType + "&IsLoad=1&Ram=" + Math.random() + "#autoAnchorPoint";

        }

        function btnFileUp_Onclick() {
            if (LeaseRoomThdContractManage.AdjunctName.value == "") {
                HDialog.Info("请输入文件附件名称,此项不能为空!");
                LeaseRoomThdContractManage.AdjunctName.focus();
                return false;
            }

            if (LeaseRoomThdContractManage.btnFile.value == "") {
                HDialog.Info("请选择要上传的本地文件!");
                LeaseRoomThdContractManage.btnFile.focus();
                return false;
            }

            return true;
        }

        function btnFile_Onclick() {
            var filename = LeaseRoomThdContractManage.btnFile.value;
            var realname = filename.substring(filename.lastIndexOf("\\") + 1, filename.lastIndexOf("."));

            //HDialog.Info(realname);
            LeaseRoomThdContractManage.AdjunctName.value = realname;

        }
    </script>
 </head>
 <body onload="Win_OnLoad()" style="overflow-y:auto"> 
  <form id="LeaseRoomThdContractManage" method="post" runat="server"> 
   <input id="hiOPType" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="hiOPType" runat="server" /> 
   <input id="RoomID" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="RoomID" runat="server" /> 
   <input id="ContID" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="ContID" runat="server" /> 
   <input id="PrintParms" style="HEIGHT: 21px; WIDTH: 8px" size="1" type="hidden" name="PrintParms" runat="server" />
   <input id="CustID" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="CustID" runat="server" /> 
   <input id="LastContID" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="LastContID" runat="server" />
   <input id="IsDelete" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="IsDelete" runat="server" /> 
   <input id="LiveID" style="HEIGHT: 21px; WIDTH: 8px" size="1" type="hidden" name="LiveID" runat="server" /> 
   <input id="MasterID" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="MasterID" runat="server" /> 
   <input id="NoEdit" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="NoEdit" runat="server" /> 
   <input id="IsAuditing" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="IsAuditing" runat="server" /> 
   <input id="IsLoad" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="IsLoad" runat="server" /> 
   <input id="CommID" style="HEIGHT: 22px; WIDTH: 8px; Z-INDEX: 0" size="1" type="hidden" name="CommID" runat="server" /> 
   <input id="DGridContIID" name="DGridContIID" type="hidden" runat="server" /> 
   <input id="DGridDeductIID" name="DGridDeductIID" type="hidden" runat="server" /> 
   <input id="btnDridContUpdate" name="btnDridContUpdate" type="button" runat="server" /> 
   <input id="btnDGridDeductDel" name="btnDGridDeductDel" type="button" runat="server" /> 
   <input id="btnDGridDeductSetting" name="btnDGridDeductSetting" type="button" runat="server" /> 
   <input id="btnDGridDeductSettingDelete" name="btnDGridDeductSettingDelete" type="button" runat="server" /> 
   <table id="Table1" class="DialogTable" cellspacing="0" cellpadding="0" align="center"> 
    <tbody>
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc;    background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同基本信息</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">合同类型</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;">
       <asp:dropdownlist id="ContSort" runat="server" autopostback="True"> 
        <asp:listitem value="1">
         收款合同
        </asp:listitem> 
        <asp:listitem value="2">
         付款合同
        </asp:listitem> 
        <asp:listitem value="3" selected="True">
         租赁合同
        </asp:listitem> 
        <asp:listitem value="4">
         其它合同
        </asp:listitem> 
       </asp:dropdownlist></td> 
      <td class="TdTitle" style="width:13%; height:26px;">合同类别</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;">
       <asp:dropdownlist id="ContModel" runat="server"> 
        <asp:listitem value="" selected="True"></asp:listitem> 
        <asp:listitem value="范本">
         范本
        </asp:listitem> 
        <asp:listitem value="非范本">
         非范本
        </asp:listitem> 
       </asp:dropdownlist></td> 
      <td class="TdTitle" style="width:13%; height:26px;">业务类别</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;">
       <asp:dropdownlist id="ContTypeCode" runat="server"></asp:dropdownlist><font color="red">*</font></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">合同来源</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="ContSource" class="easyui-validatebox" name="ContSource" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">合同编号</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onblur="javascript:CheckContSign();" id="ContSign" class="easyui-validatebox" name="ContSign" runat="server" />* 
       <div id="ContSignResults" class="font_red"></div> </td> 
      <td class="TdTitle" style="width:13%; height:26px;">合同名称</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="LeaseContName" class="easyui-validatebox" name="LeaseRegSign" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">当前状态</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;">
       <asp:label id="IsEffect" runat="server"></asp:label></td> 
      <td class="TdTitle" style="width:13%; height:26px;">审核状态</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;">
       <asp:label id="lbAudit" runat="server" forecolor="Red"></asp:label></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc;    background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同签约信息</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">审批起时</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="ApprovalStartDate" class="Wdate" name="ApprovalStartDate" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">审批止时</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="ApprovalEndDate" class="Wdate" name="ApprovalEndDate" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">签约状态</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;">
       <asp:dropdownlist id="SignStatus" runat="server"></asp:dropdownlist></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">签约进度</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="SignSchedule" class="easyui-validatebox" name="SignSchedule" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">签定日期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="SignDate" class="Wdate" name="SignDate" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">签定地址</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="SignAddress" class="easyui-validatebox" name="SignAddress" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">登记时间</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="EnterDate" class="Wdate" name="EnterDate" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">登记人</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="EnterMan" class="easyui-validatebox" name="EnterMan" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc;    background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">出租方信息</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">出租方名称</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="Leaser" class="easyui-validatebox" name="Leaser" runat="server" />*</td> 
      <td class="TdTitle" style="width:13%; height:26px;">出租方注册地址</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="LeaseRegAddr" class="easyui-validatebox" name="LeaseRegAddr" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">出租方证件名称</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><select id="LeaserPaperName" runat="server"> <option selected=""></option> </select></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">出租方证件号码</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="LeaserCode" class="easyui-validatebox" name="LeaseRegAddr" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">管理方信息</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">管理方名称</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="Leaser2" class="easyui-validatebox" name="Leaser" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">管理方注册地址</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="LeaseRegAddr2" class="easyui-validatebox" name="LeaseRegAddr" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">管理方证件名称</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><select id="LeaserPaperName2" runat="server"> <option selected=""></option> </select></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">管理方证件号码</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="LeaserCode2" class="easyui-validatebox" name="LeaseRegAddr" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">承租方信息</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">承租方名称</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="Renter" class="easyui-validatebox" name="Renter" runat="server" />*</td> 
      <td class="TdTitle" style="width:13%; height:26px;">承租方注册地址</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="RenterRegAddr" class="easyui-validatebox" name="RenterRegAddr" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">承租方证件名称</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><select id="RentPaperName" name="RentPaperName" runat="server"> <option selected=""></option> </select></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">承租方证件号码</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="RentPaperCode" class="easyui-validatebox" name="RentPaperCode" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">联系人</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="RentLinkMan" class="easyui-validatebox" name="RentLinkMan" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">联系电话</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="RentLinkTel" class="easyui-validatebox" name="RentLinkTel" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">户籍地</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="RentDoorPlace" class="easyui-validatebox" name="RentDoorPlace" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">居住地</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="RentDwellPlace" class="easyui-validatebox" name="RentDwellPlace" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">经营业态</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="DealPromise" class="easyui-validatebox" name="DealPromise" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">经营品牌</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="DealBrand" class="easyui-validatebox" name="DealBrand" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">经营级别</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="DealLevel" class="easyui-validatebox" name="DealLevel" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">租赁年限</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="YearHold" class="easyui-validatebox" name="YearHold" runat="server" />(月)</td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">优惠政策</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><select id="PreferentialPolicy" name="PreferentialPolicy" runat="server"> <option selected=""></option> </select></td> 
      <td class="TdTitle" style="width:13%; height:26px;">优惠证件</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="PrefPolicyPaperName" class="easyui-validatebox" name="PrefPolicyPaperName" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">入住日期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="StayTime" class="Wdate" name="StayTime" runat="server" /></td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc;    background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同计费信息</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">开始日期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="LeaseBeginDate" class="Wdate" name="LeaseBeginDate" runat="server" />*</td> 
      <td class="TdTitle" style="width:13%; height:26px;">结束日期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="LeaseEndDate" class="Wdate" name="LeaseEndDate" runat="server" />*</td> 
      <td class="TdTitle" style="width:13%; height:26px;">优惠免租期开始日期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="FavBeginDate" class="Wdate" name="FavBeginDate" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">优惠免租期结束日期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="FavEndDate" class="Wdate" name="FavEndDate" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">顺延起租日期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="PostponeDate" class="Wdate" name="PostponeDate" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">顺延原因</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="PostponeReason" class="easyui-validatebox" name="PostponeReason" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">房屋/物资</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="ContRoomObject" class="easyui-validatebox" name="ContRoomObject" runat="server" />* </td> 
      <td class="TdTitle" style="width:13%; height:26px;">房屋/物资单位</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="ContRoomUnit" class="easyui-validatebox" name="ContRoomUnit" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">合同单价</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="LeasePrice" class="easyui-validatebox" name="LeasePrice" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">单价单位</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="PriceUnit" class="easyui-validatebox" name="PriceUnit" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">垃圾清运费单价</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="GarbageFeePrice" class="easyui-validatebox" name="GarbageFeePrice" runat="server" /> </td> 
      <td class="TdTitle" style="width:13%; height:26px;">垃圾清运费单价单位</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="GarbageFeeUnit" class="easyui-validatebox" name="GarbageFeeUnit" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">合同数量</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="ContBuildArea" class="easyui-validatebox" name="ContBuildArea" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">数量单位</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="ContNumUnit" class="easyui-validatebox" name="ContNumUnit" runat="server" /></td> 
      <td class="TdTitle" style="width:13%; height:26px;">合同总价</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="ContTotalAmount" class="easyui-validatebox" name="ContTotalAmount" runat="server" />(元)</td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">合同保证金</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="ContDepositAmount" class="easyui-validatebox" name="ContDepositAmount" runat="server" />(元)</td> 
      <td class="TdTitle" style="width:13%; height:26px;">计费周期(月)</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><select id="PayPeriod" name="PayPeriod" runat="server"> <option selected=""></option> </select>*</td> 
      <td class="TdTitle" style="width:13%; height:26px;">计算方式</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><select id="PayType" name="PayType" runat="server"> <option selected=""></option> </select></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">合同违约金延期</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="DelinDelay" class="easyui-validatebox" name="DelinDelay" runat="server" />(天)</td> 
      <td class="TdTitle" style="width:13%; height:26px;">合同违约金比率</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="DelinRates" class="easyui-validatebox" name="DelinRates" runat="server" />(小数/天)</td> 
      <td class="TdTitle" style="width:13%; height:26px;"><input id="ContBail" style="HEIGHT: 22px; WIDTH: 16px" size="1" type="hidden" name="ContBail" runat="server" /></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><input id="IsContinueTime" checked="" type="checkbox" value="" name="IsContinueTime" runat="server" />按对时按每月单价计算时,多个期间不同单价,是否连续计费</td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">是否对接财务系统</td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"><select id="IsFinance" name="IsFinance" runat="server"> <option selected=""></option> </select></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
      <td class="TdTitle" style="width:13%; height:26px;"></td> 
      <td class="TdContentSearch" style="width:20%; height:26px;"></td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc;    background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同其他信息</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">合同内容</td> 
      <td class="TdContentSearch" style="width:33%;" colspan="5"><textarea id="OtherPromise" style="HEIGHT: 108px; width:90% " rows="6" cols="60" name="OtherPromise" runat="server"></textarea></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">支付详情</td> 
      <td class="TdContentSearch" colspan="5"><textarea id="PaymentDetails" style="HEIGHT: 108px; width:90%" rows="6" cols="60" name="PaymentDetails" runat="server"></textarea></td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">备注</td> 
      <td class="TdContentSearch" colspan="5"><textarea id="ContMemo" style="HEIGHT: 108px; width:90% " rows="5" cols="60" name="ContMemo" runat="server"></textarea></td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc;    background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px"><a name="autoAnchorPoint"></a>合同计费设置</span> </td> 
     </tr> 
     <tr> 
      <td colspan="6" align="left"> 
       <div>
        <input onclick="lickDeductFs(0)" id="DeductType0" checked="" type="radio" name="DeductFs" runat="server" />定额方式
        <input onclick="lickDeductFs(1)" id="DeductType1" type="radio" value="Radio1" name="DeductFs" runat="server" />提成方式
        <input onclick="lickDeductFs(2)" id="DeductType2" type="radio" value="Radio1" name="DeductFs" runat="server" />保底+提成方式
        <input onclick="lickDeductFs(3)" id="DeductType3" type="radio" value="Radio1" name="DeductFs" runat="server" />保底、提成就高方式
        <input id="DeductType" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="DeductType" runat="server" /> 
       </div> 
      </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">收费设置</td> 
      <td id="tds" class="TdContentSearch" colspan="5" align="left"> 
       <div id="tddefs" runat="server"> 
        <table id="Tables1" class="DialogTable" cellspacing="0" cellpadding="0" align="center"> 
         <tbody>
          <tr> 
           <td class="TdTitle" style="height:26px">*费用承担对象</td> 
           <td class="TdContentSearch" style="height:26px">
               <input id="NewCustName" class="easyui-searchbox" style="width:150px" searcher="SelNewCust" data-options="editable:false" maxlength="50" name="NewCustName" runat="server" />
               <input id="btnSelNewCust" class="button_sel" type="button" value=" " name="btnSelNewCust" runat="server" />
               <input id="NewCustID" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="NewCustID" runat="server" />
               <input id="hiNewCustName" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="hiNewCustName" runat="server" />
           </td> 
           <td class="TdTitle" style="height:26px">*房屋编号</td> 
           <td class="TdContentSearch" style="height:26px"><select id="SelRoomID" name="SelRoomID" runat="server"> <option selected=""></option> </select></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">*开始日期</td> 
           <td class="TdContentSearch" style="height:26px"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="BeginDate" class="Wdate" name="BeginDate" runat="server" /></td> 
           <td class="TdTitle" style="height:26px">*结束日期</td> 
           <td class="TdContentSearch" style="height:26px"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="EndDate" class="Wdate" name="EndDate" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">*应收日期</td> 
           <td class="TdContentSearch" style="height:26px"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="DueDate" class="Wdate" name="DueDate" runat="server" /></td> 
           <td class="TdTitle" style="height:26px">*费用项目</td> 
           <td class="TdContentSearch" style="height:26px"><input id="CostName" class="easyui-searchbox" style="width:150px" searcher="SelCost" data-options="editable:false" name="CostName" runat="server" /><input id="btnSelCost" class="button_sel" type="button" value=" " name="btnSelCost" runat="server" /><input id="hiCostName" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="hiCostName" runat="server" /><input id="CostID" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="CostID" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">计算方式</td> 
           <td class="TdContentSearch" style="height:26px"> <input onclick="rdoCalcType_OnClick();" id="CalcType1" checked="" type="radio" value="0" name="CalcType" runat="server" />按每月单价 <input onclick="rdoCalcType_OnClick();" id="CalcType2" type="radio" value="1" name="CalcType" runat="server" />按缴费周期总额 <input onclick="rdoCalcType_OnClick();" id="CalcType3" type="radio" value="2" name="CalcType" runat="server" />按缴费总额 </td> 
           <td class="TdTitle" style="height:26px"></td> 
           <td class="TdContentSearch" style="height:26px"></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">计费周期(月)</td> 
           <td class="TdContentSearch" style="height:26px"><select id="ContPeriod" name="ContPeriod" runat="server"> <option selected=""></option> </select></td> 
           <td class="TdTitle" style="height:26px"> 
            <div id="labelCalcType">
             *单价(元/月)
            </div> </td> 
           <td class="TdContentSearch" style="height:26px"><input onkeypress="CheckNumeric();" id="ContPrice" class="easyui-validatebox" name="ContPrice" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">*面积</td> 
           <td class="TdContentSearch" style="height:26px"><input onkeypress="CheckNumeric();" id="ContNum" class="easyui-validatebox" name="ContNum" runat="server" /></td> 
           <td class="TdTitle" style="height:26px">递增方式</td> 
           <td class="TdContentSearch" style="height:26px"><input onclick="rdoIncreType_OnClick();" id="IncreType1" checked="" type="radio" value="0" name="IncreType" runat="server" />按总额递增<input onclick="rdoIncreType_OnClick();" id="IncreType2" type="radio" value="1" name="IncreType" runat="server" />按单价递增</td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px"> 
            <div id="LabelIncreRate">
             递增率(%)
            </div> </td> 
           <td class="TdContentSearch" style="height:26px"><input onkeypress="CheckNumeric();" id="IncreRate" class="easyui-validatebox" name="IncreRate" runat="server" /></td> 
           <td class="TdTitle" style="height:26px">递增周期(月)</td> 
           <td class="TdContentSearch" style="height:26px"><input onkeypress="CheckNumeric();" id="IncrePeriod" class="easyui-validatebox" name="IncrePeriod" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px"><input id="IsWaiv" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px; Z-INDEX: 0" size="1" type="hidden" name="IsWaiv" runat="server" />减免开始日期</td> 
           <td class="TdContentSearch" style="height:26px"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="WaivBeginDate" class="Wdate" name="WaivBeginDate" runat="server" /></td> 
           <td class="TdTitle" style="height:26px">减免结束日期</td> 
           <td class="TdContentSearch" style="height:26px"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="WaivEndDate" class="Wdate" name="WaivEndDate" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">合同违约金延期</td> 
           <td class="TdContentSearch" style="height:26px"><input id="SetDelinDelay" class="easyui-validatebox" name="SetDelinDelay" runat="server" /></td> 
           <td class="TdTitle" style="height:26px">合同违约金比率</td> 
           <td class="TdContentSearch" style="height:26px"><input id="SetDelinRates" class="easyui-validatebox" name="SetDelinRates" runat="server" /></td> 
          </tr> 
          <tr> 
           <td colspan="4" align="center"><input onclick="javascript:if(btnOK_Onclick()==false) return false;" tabindex="1" id="btnOK" class="button" type="button" value="确定" name="btnOK" runat="server" /><input id="btnUpdate" tabindex="1" type="button" value="修改" style="display:none" name="btnUpdate" runat="server" /> <input id="btnDridContDel" value="删除" name="btnDridContDel" type="button" runat="server" /> </td> 
          </tr> 
         </tbody>
        </table> 
       </div> 
       <div id="tdtcfs" runat="server"> 
        <table class="DialogTable" cellspacing="0" cellpadding="0" align="center"> 
         <tbody>
          <tr> 
           <td class="TdTitle" style="height:26px">*费用承担对象</td> 
           <td class="TdContentSearch" style="height:30px;vertical-align:middle"><input id="NewCustName2" style="width:150px" class="easyui-searchbox" searcher="SelNewCust2" data-options="editable:false" name="NewCustName2" runat="server" /><input id="btnSelNewCust2" class="button_sel" type="button" value=" " name="btnSelNewCust2" runat="server" /><input id="NewCustID2" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="NewCustID2" runat="server" /><input id="hiNewCustName2" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="hiNewCustName2" runat="server" />&nbsp;<input onclick="javascript:if(btnClear_Onclick()==false) return false;" style="height:26px;width: 45px" id="btnClear" class="button" type="button" value="清除" /></td> 
           <td class="TdTitle" style="height:26px">*房屋编号</td> 
           <td class="TdContentSearch" style="height:26px"><select id="SelRoomID2" name="SelRoomID2" runat="server"> <option selected=""></option> </select></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:30px">*开始日期</td> 
           <td class="TdContentSearch" style="height:30px"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="DeductBeginDate" class="Wdate" name="DeductBeginDate" runat="server" /></td> 
           <td class="TdTitle" style="height:30px">*结束日期</td> 
           <td class="TdContentSearch" style="height:30px"><input onclick="WdatePicker()" onkeypress="CheckDate();" id="DeductEndDate" class="Wdate" name="DeductEndDate" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">*费用项目</td> 
           <td class="TdContentSearch" style="height:26px"><input id="CostName2" class="easyui-searchbox" style="width:150px" searcher="SelCost2" data-options="editable:false" name="CostName2" runat="server" /><input id="btnSelCost2" class="button_sel" type="button" value=" " name="btnSelCost2" runat="server" /><input id="hiCostName2" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="hiCostName2" runat="server" /><input id="CostID2" class="easyui-validatebox" style="HEIGHT: 22px; WIDTH: 8px" size="1" type="hidden" name="CostID2" runat="server" /></td> 
           <td class="TdTitle" style="height:26px"><span id="PaulEndTitle" runat="server"><span id="PaulEndFh" style="COLOR: red">*</span>月保底额</span></td> 
           <td class="TdContentSearch" style="height:26px"><input onkeypress="CheckNumeric();" id="PaulEndAmount" class="easyui-validatebox" name="IncreRate" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">*提成比例</td> 
           <td class="TdContentSearch" style="height:26px"><input onkeypress="CheckNumeric();" id="DeductRate" class="easyui-validatebox" name="DeductRate" runat="server" />（小数）</td> 
           <td class="TdTitle" style="height:26px">备注</td> 
           <td class="TdContentSearch" style="height:26px"> <input onkeypress="CheckNumeric();" id="Memo" class="easyui-validatebox" name="Memo" runat="server" /></td> 
          </tr> 
          <tr> 
           <td class="TdTitle" style="height:26px">按条件计算</td> 
           <td class="TdContentSearch" style="height:26px" colspan="3"><select id="IsCondition" name="IsCondition" runat="server"> <option selected=""></option> </select> （条件判断规则：大于等于“开始条件”，小于“结束条件”）</td> 
          </tr> 
          <tr> 
           <td colspan="4" align="center"><input onclick="javascript:if(btnDeductSet_Onclick()==false) return false;" tabindex="1" id="btnDeductSet" class="button" type="button" value="确定" name="btnDeductSet" runat="server" /> </td> 
          </tr> 
         </tbody>
        </table> 
       </div> </td> 
     </tr> 
     <tr> 
      <td colspan="6" style="height:5px">&nbsp;</td> 
     </tr> 
     <tr> 
      <td colspan="6"> <input id="hiDGridCont" runat="server" type="hidden" name="hiDGridCont" /> <input id="hiDGridDeduct" runat="server" type="hidden" name="hiDGridDeduct" /> 
       <div id="Deductdegrid" runat="server"> 
        <div class="SearchContainer" id="DGridCont" style="height:200px">
         1
        </div> 
       </div> 
       <div id="Deducttcgrid" runat="server"> 
        <div class="SearchContainer" id="DGridDeduct" style="height:200px">
         2
        </div> 
       </div> </td> 
     </tr> 
     <tr> 
      <td colspan="6" style="border: 1px solid #cccccc;    background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同附件</span> </td> 
     </tr> 
     <tr> 
      <td class="TdTitle" style="width:13%; height:26px;">文件上传</td> 
      <td class="formTable_ItemInput" colspan="5">文件说明：<input style="WIDTH: 300px" id="AdjunctName" class="easyui-validatebox" maxlength="200" name="AdjunctName" runat="server" /><input style="width:61px" id="btnFile" tabindex="1" size="1" type="file" name="btnFile" runat="server" onpropertychange="javascript:btnFile_Onclick();" /><input id="btnFileUp" class="button" tabindex="1" onclick="javascript:if(btnFileUp_Onclick()==false) return false;" value="上传" style="height:26px;width: 45px;margin-left:2px" type="button" name="btnFileUp" runat="server" /></td> 
     </tr> 
     <tr> 
      <td class="formTable_ItemInput" colspan="6">
       <asp:datagrid style="FONT-SIZE: 12px" id="DGrid" runat="server" autogeneratecolumns="False" width="100%" cssclass="DataGrid"> 
        <alternatingitemstyle cssclass="DataGrid_AltItem"></alternatingitemstyle> 
        <itemstyle cssclass="DataGrid_Item"></itemstyle> 
        <headerstyle cssclass="DataGrid_Header"></headerstyle> 
        <columns> 
         <asp:boundcolumn visible="False" datafield="AdjunctCode"> 
          <headerstyle width="0px"></headerstyle> 
         </asp:boundcolumn> 
         <asp:boundcolumn datafield="AdjunctName" headertext="文件说明"> 
          <headerstyle horizontalalign="Center"></headerstyle> 
         </asp:boundcolumn> 
         <asp:boundcolumn datafield="FileSize" headertext="大小(KB)" dataformatstring="{0:N2}"> 
          <headerstyle horizontalalign="Center" width="150px"></headerstyle> 
          <itemstyle horizontalalign="Right"></itemstyle> 
         </asp:boundcolumn> 
         <asp:templatecolumn headertext="[下载]"> 
          <headerstyle horizontalalign="Center" width="40px"></headerstyle> 
          <itemstyle horizontalalign="Center"></itemstyle> 
          <itemtemplate> 
           <asp:linkbutton runat="server" text="&lt;img src=../images/icons/Download.gif border=0 align=absmiddle alt='下载'  &gt;" commandname="DownLoad" causesvalidation="false" tabindex="1" id="btnDownLoad"></asp:linkbutton> 
          </itemtemplate> 
         </asp:templatecolumn> 
         <asp:templatecolumn headertext="[删除]"> 
          <headerstyle horizontalalign="Center" width="40px"></headerstyle> 
          <itemstyle horizontalalign="Center"></itemstyle> 
          <itemtemplate> 
           <asp:linkbutton id="btnDelete" tabindex="1" runat="server" causesvalidation="false" commandname="Delete" text="&lt;img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' &gt;"></asp:linkbutton> 
          </itemtemplate> 
         </asp:templatecolumn> 
        </columns> 
       </asp:datagrid></td> 
     </tr> 
     <tr> 
      <td class="formTable_Footer" colspan="6" style="height:4px"> </td> 
     </tr> 
     <tr> 
      <td class="formTable_Footer" colspan="6" align="center"> <input id="BtnPrint1" class="button" type="button" value="打印物管协议通知" name="BtnPrint1" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;<input id="BtnPrint2" class="button" type="button" value="打印场地租凭合同" name="BtnPrint2" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="javascript:if(CheckData()==false) return false;" id="btnSave" class="button" type="button" value="保存合同" name="btnSave" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td> 
     </tr> 
     <tr> 
      <td colspan="6" style="height:26px">&nbsp;</td> 
     </tr> 
    </tbody>
   </table> 
  </form> 
 </body>
</html>
<script type="text/javascript">
    function Init() {
        $('#btnSelNewCust').hide();
        $('#btnSelNewCust2').hide();

        $('#btnSelCost').hide();
        $('#btnSelCost2').hide();

        $('#btnDridContUpdate').hide();
        $('#btnDridContDel').hide();
        $('#btnDGridDeductDel').hide();
        $('#btnDGridDeductSetting').hide();
        $('#btnDGridDeductSettingDelete').hide();

        if ($('#hiOPType').val() == "His") {
            $('#BtnPrint1').hide();
            $('#BtnPrint2').hide();
            $('#btnSave').hide();
            $('#btnDeductSet').hide();
            $('#btnOK').hide();
        }
    }
    Init();
    function SelNewCust() {
        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#NewCustName').searchbox("setValue", data.CustName);
            $('#NewCustID').val(data.CustID);
            $('#hiNewCustName').val(data.CustName);

            document.getElementById('btnSelNewCust').click();

        });
    }

    function SelNewCust2() {
        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#NewCustName2').searchbox("setValue", data.CustName);
            $('#NewCustID2').val(data.CustID);
            $('#hiNewCustName2').val(data.CustName);

            Request.sendPOST("LeaseEngageGetRoomSign.aspx", "CustID=" + data.CustID + "&rdm=" + Math.random(), callbackGetRoomSign)

        });
    }
    function SelCost() {
        var conent = "../dialogNew/CorpCommCostDlg.aspx";

        HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新

                var data = JSON.parse(_Data);
                $('#CostName').searchbox("setValue", data.CostName);
                $('#CostID').val(data.CostID);
                $('#hiCostName').val(data.CostName);


            }
        });
    }
    function SelCost2() {
        var conent = "../dialogNew/CorpCommCostDlg.aspx";

        HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


            if (_Data != "") {//**获得返回 刷新

                var data = JSON.parse(_Data);
                $('#CostName2').searchbox("setValue", data.CostName);
                $('#CostID2').val(data.CostID);
                $('#hiCostName2').val(data.CostName);

            }
        });
    }

    var DGridContcolumn = [[
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

    var DGridContcolumn = [[
        { field: 'CustName', title: '费用承担对象', width: '100', align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: '100', align: 'left', sortable: true },
        {
            field: 'DueDate', title: '应收日期', width: '100', align: 'left', sortable: true, editor: { type: 'text' }
        },
        {
            field: 'BeginDate', title: '开始日期', width: '100', align: 'left', sortable: true, editor: { type: 'text' }
        },
        {
            field: 'EndDate', title: '结束日期', width: '100', align: 'left', sortable: true, editor: { type: 'text' }
        },
        { field: 'CostName', title: '费用名称', width: '100', align: 'left', sortable: true },
        {
            field: 'ContNum', title: '面积', width: '70', align: 'left', sortable: true, editor: { type: 'text' }
        },
        { field: 'CalcTypeName', title: '计算方式', width: '100', align: 'left', sortable: true },
        {
            field: 'ContPeriod', title: '计费周期(月)', width: '100', align: 'left', sortable: true, editor: { type: 'text' }
        },
        {
            field: 'ContPrice', title: '单价', width: '70', align: 'left', sortable: true, editor: { type: 'text' }
        },
        { field: 'IncreTypeName', title: '递增方式', width: '100', align: 'left', sortable: true },
        { field: 'IncreRate', title: '递增率/金额', width: '100', align: 'left', sortable: true },
        { field: 'IncrePeriod', title: '递增周期', width: '100', align: 'left', sortable: true },
        {
            field: 'WaivBeginDate', title: '减免开始日期', width: '100', align: 'left', sortable: true, editor: { type: 'text' }
        },
        {
            field: 'WaivEndDate', title: '减免结束日期', width: '100', align: 'left', sortable: true, editor: { type: 'text' }
        },
        {
            field: 'DelinDelay', title: '合同违约金延期', width: '120', align: 'left', sortable: true, editor: { type: 'text' }
        },
        {
            field: 'DelinRates', title: '合同违约金比率', width: '120', align: 'left', sortable: true, editor: { type: 'text' }
        }

    ]];

    var Cont = [{ "value": "1", "text": "是" }, { "value": "0", "text": "否" }];

    var DGridDeductcolumn = [[
        { field: 'CustName', title: '费用承担对象', width: '100', align: 'left', sortable: true },
        { field: 'RoomSign', title: '房屋编号', width: '100', align: 'left', sortable: true },
        {
            field: 'BeginDate', title: '开始日期', width: '100', align: 'left', sortable: true, editor: { type: 'datebox' }
        },
        {
            field: 'EndDate', title: '结束日期', width: '100', align: 'left', sortable: true, editor: { type: 'datebox' }
        },
        { field: 'DeductTypeName', title: '提成方式', width: '100', align: 'left', sortable: true },
        { field: 'DeductRate', title: '提成比例', width: '100', align: 'left', sortable: true, editor: { type: 'text' } },
        { field: 'PaulEndAmount', title: '月保底金额', width: '100', align: 'left', sortable: true },
        {
            field: 'IsConditionName', title: '是否条件', width: '100', align: 'left', sortable: true
            , editor: { type: 'combobox', options: { data: Cont, valueField: "value", textField: "text" } }
        },
        {
            field: 'DeductSetting', title: '<div style=\"text-align:center;height:26px;line-height:26px;border-bottom:1px #cccccc dotted\">提成条件</div><div><div style=\"width:151px\;text-align:center;float:left;border-right:1px #cccccc dotted;height:26px;line-height:26px">开始条件</div><div style=\"width:151px\;text-align:center;float:left;border-right:1px #cccccc dotted;height:26px;line-height:26px">结束条件</div><div style=\"width:151px\;text-align:center;float:left;height:26px;line-height:26px">提成比例</div></div>', width: 'auto', align: 'left'
        }
    ]];

    var DGridConttoolbar = [
        {
            text: '修改标准',
            iconCls: 'icon-save',
            handler: function () {
                $('#DGridCont').datagrid('acceptChanges');

                var rows = $("#DGridCont").datagrid("getData").rows;

                $('#hiDGridCont').val(JSON.stringify(rows));

                //$('#DGridContIID').val(rows.IID);

                $('#btnUpdate').click();


            }


        }, '-',
        {
            text: '更新为连续日期',
            iconCls: 'icon-save',
            handler: function () {
                $('#btnDridContUpdate').click();


            }
        }, '-',
        {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#DGridCont").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择删除项！');
                    return;
                }
                else {


                    $('#DGridContIID').val(row.IID);

                    $('#btnDridContDel').click();

                }

            }
        }];


    var DGridDeducttoolbar = [

        {
            text: '删除标准',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#DGridDeduct").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择删除项！');
                    return;
                }
                else {

                    $('#DGridDeductIID').val(row.IID);
                    $('#btnDGridDeductDel').click();
                }

            }
        }, '-', {
            text: '新增条件',
            iconCls: 'icon-add',
            handler: function () {
                var row = $("#DGridDeduct").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择要新增条件的项！');
                    return;
                }
                else {

                    if (row.IsCondition == '1') {
                        var w = 700;
                        var h = 300;

                        HDialog.Open(w, h, "../dialogNew/LeaseContractDeductSettingDlg.aspx?DeductSetID=" + row.DeductSetID + "&ContID=" + $('#ContID').val() + "", '新增合同提成标准条件', false, function callback(_Data) {

                            if (_Data == "1") {
                                $('#btnDGridDeductSetting').click();
                            }
                        });
                    }
                    else {
                        HDialog.Info('请选择按条件计算的项！');
                    }
                }

            }

        }, '-', {
            text: '删除条件',
            iconCls: 'icon-cancel',
            handler: function () {
                var row = $("#DGridDeduct").datagrid("getSelected");
                if (row == null) {
                    HDialog.Info('请选择删除项！');
                    return;
                }
                else {

                    $('#DGridDeductIID').val(row.IID);
                    $('#btnDGridDeductSettingDelete').click();
                }
            }
        }
    ];
    var editIndex = undefined;
    var editIndex2 = undefined;
    function LoadDGridCont() {
        var Data = $('#hiDGridCont').val();
        var obj = JSON.parse(Data);
        $("#DGridCont").datagrid({
            data: obj.rows,
            title: '合同标准',
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: DGridContcolumn,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: false,
            width: "100%",
            toolbar: DGridConttoolbar,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onDblClickRow: function (rowIndex, rowData) {


                editIndex = rowIndex;


                //开始编辑
                $("#DGridCont").datagrid('beginEdit', rowIndex);

                //格式化时间
                //var eddate = $('#TableContainer').datagrid('getSelected');
                //alert(formatDate(eddate.PayMonth, 'yyyy-MM'));
                // alert(formatDate(rowData.PayMonth, 'yyyy-MM'));
                //rowData.PayMonth = formatDate(rowData.PayMonth, 'yyyy-MM');
                //$('#TableContainer').datagrid('acceptChanges');

                //绑定JS事件
                var ed = $('#DGridCont').datagrid('getEditors', rowIndex);
                for (var i = 0; i < ed.length; i++) {
                    var e = ed[i];


                    if (e.field == "DueDate" || e.field == "BeginDate" || e.field == "EndDate" || e.field == "WaivBeginDate" || e.field == "WaivEndDate") {
                        $(e.target).bind("click", function () {
                            var dateObj = WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' });

                        });
                    }
                }

            },
            onLoadSuccess: function (data) {

            }
        });
    }


    function LoadDGridDeduct() {
        var Data = $('#hiDGridDeduct').val();

        var obj = JSON.parse(Data);


        $("#DGridDeduct").datagrid({
            data: obj.rows,
            title: '合同标准',
            loadMsg: '数据加载中,请稍候...',
            nowrap: false,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: DGridDeductcolumn,
            fitColumns: true,
            remoteSort: false,
            singleSelect: true,
            pagination: false,
            width: "100%",
            toolbar: DGridDeducttoolbar,
            sortOrder: "asc",
            singleSelect: true,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: true,
            onDblClickRow: function (rowIndex, rowData) {
                //if (editIndex2 != undefined) {
                //    $(this).datagrid('endEdit', editIndex2);
                //}
                //$(this).datagrid('beginEdit', rowIndex);
                //var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'DueDate' });
                //$(ed.target).focus();
                //editIndex2 = rowIndex;

            },
            onLoadSuccess: function (data) {
                // $.tool.MergeEasyUiGrid("DGridDeduct", "CustName,RoomSign,BeginDate,EndDate,DeductTypeName,DeductRate,PaulEndAmount,IsConditionName");
            }
        });
    }
    LoadDGridCont();
    LoadDGridDeduct();


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

    LoadFeesList();
</script>
