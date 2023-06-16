<%@ Page Language="c#" CodeBehind="ContractManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ContractNew.ContractManage" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>ContractManage</title>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
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

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }

        #FeesSettingDialog input[type=radio] {
            height: 16px;
        }

        #FeesSettingDialog label {
            font-weight: normal;
        }

        .DialogTable tr {
            height: 26px;
        }
    </style>
    <script type="text/javascript">
        function CheckData() {
            if (ContractManage.CommID.value == "" || ContractManage.CommID.value == "0") {
                HDialog.Info("请选择项目名称,此项不能为空!");
                ContractManage.btnSelComm.focus();
                return false;
            }
            if (ContractManage.NewContTypeCode.value == "") {
                HDialog.Info("请选择合同类别,此项不能为空!");
                ContractManage.NewContType.focus();
                return false;
            }
            if (ContractManage.CustName.value == "") {
                HDialog.Info("请选择费用对应的客户,此项不能为空!");
                ContractManage.CustName.focus();
                return false;
            }
            if (ContractManage.ContSign.value == "") {
                HDialog.Info("请输入合同编号,此项不能为空!");
                ContractManage.ContSign.focus();
                return false;
            }
            if (ContractManage.ContStartDate.value == "") {
                HDialog.Info("请输入开始时间,此项不能为空!");
                ContractManage.ContStartDate.focus();
                return false;
            }
            //if(ContractManage.ContEndDate.value=="")
            //{
            //	HDialog.Info("请输入结束时间,此项不能为空!");
            //	ContractManage.ContEndDate.focus();
            //	return false;
            //}
            var vPayPeriod = $('#PayPeriod').val();
            if (vPayPeriod <= 0 || vPayPeriod > 200) {
                alert("计费周期需要在1-200内！");
                return false;
            }

            return true;
        }

        function btnSelEquipmentDevice_OnClick() {
            if (CheckData(1) == false) {
                return false;
            }
            else {
                var varReturn;
                varReturn = showModalDlg("../dialog/EquipmentSPDeviceDlg.aspx" + "?Ram=" + Math.random(), "", 650, 550);

                if (varReturn != "") {//获得返回 刷新

                    var varObjects = varReturn.split("\t");

                    ContractManage.DeviceIDs.value = varObjects[0];

                    return true;
                }

                return false;
            }
        }

        function btnClear1_OnClick() {
            ContractManage.DutyUserCode.value = "";
            ContractManage.DutyDepCode.value = "";
            ContractManage.DutyDepUserName.value = "";
            ContractManage.hiDutyDepUserName.value = "";
        }

        //多项目合同复制客户
        function btnAddNewCustomer_Click() {
            if ($('#IsAuditing').text() == "已审核" || $('#IsAuditing').text() == "审核中") {
                return;
            }
            //ContractAddNewCustomer
            if ($('#CustID').val() == "") {
                HDialog.Info("请选择客户");
                return;
            }
            //判断客户是否是 临时客户
            $.tool.DataGet('Contract', 'ValidateCustomerIsTemporary', 'CustID=' + $('#CustID').val(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != "" && _Data == "true") {
                        HDialog.Open(700, 400, '../ContractNew/ContractAddNewCustomer.aspx?CustomerID=' + $('#CustID').val(), "多项目合同复制客户", false, function callback(_Data) {
                            if (_Data != "") {
                                HDialog.Info(_Data);
                            }
                        });
                    } else {
                        HDialog.Info("该客户不是临时客户不能够复制！");
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        }

        function btnOK_Onclick() {

            if ($('#ChargeType').val() == "根据合同标准计费") {
                if (ContractManage.BeginDate.value == "") {
                    HDialog.Info("请输入开始日期,此项不能为空!");
                    ContractManage.BeginDate.focus();
                    return false;
                }
                if (ContractManage.EndDate.value == "") {
                    HDialog.Info("请输入结束日期,此项不能为空!");
                    ContractManage.EndDate.focus();
                    return false;
                }

                if (ContractManage.DueDate.value == "") {
                    HDialog.Info("请输入应收日期,此项不能为空!");
                    ContractManage.DueDate.focus();
                    return false;
                }
                if (ContractManage.CalcType1.checked) {
                    if (ContractManage.ContNum.value == "") {
                        HDialog.Info("请输入数量,此项不能为空!");
                        ContractManage.ContNum.focus();
                        return false;
                    }
                }

                if (ContractManage.IncrePeriod.value != "") {
                    var varIncrePeriod = parseInt(ContractManage.IncrePeriod.value, 10);
                    var varPayPeriod = parseInt(ContractManage.PayPeriod.value, 10);
                    var varMultiple = parseInt(varIncrePeriod / varPayPeriod) + 1;
                    var varMod = varIncrePeriod % varPayPeriod;
                    var varNewPeriod = varMultiple * varPayPeriod;
                    if (varMod != 0) {
                        HDialog.Info("请输入递增周期,此项应为缴费周期的倍数!");
                        ContractManage.IncrePeriod.value = varNewPeriod;
                        ContractManage.IncrePeriod.focus();
                        return false;
                    }
                }
            }

            if (ContractManage.CostID.value == "" || ContractManage.CostID.value == "0") {
                HDialog.Info("请选择费用项目,此项不能为空!");
                ContractManage.CostName.focus();
                return false;
            }

            if (ContractManage.StandCustID.value == "" || ContractManage.StandCustID.value == "0") {
                HDialog.Info("请选择客户,此项不能为空!");
                ContractManage.CostName.focus();
                return false;
            }
            if (ContractManage.CalcType5.checked == false) {
                if (ContractManage.ContPrice.value == "") {
                    HDialog.Info("请输入单价,此项不能为空!");
                    ContractManage.ContPrice.focus();
                    return false;
                }
            }

            return true;
        }

        function btnUpdate_Onclick() {
            var Result = btnOK_Onclick();
            if (!Result) {
                return false;
            }
            return true;
        }

        function btnIsDeviceCont_OnClick() {
            var varIsDeviceCont = document.getElementById("IsDeviceCont").value;
            var varBtnSelEquipmentDevice = document.getElementById("BtnSelEquipmentDevice");
            //HDialog.Info(varIsDeviceCont);
            if (varIsDeviceCont == "1") {
                varBtnSelEquipmentDevice.disabled = false;
            }
            else {
                varBtnSelEquipmentDevice.disabled = true;
            }

        }
        function btnFileUp_Onclick() {
            if (ContractManage.AdjunctName.value == "") {
                HDialog.Info("请输入文件附件名称,此项不能为空!");
                ContractManage.AdjunctName.focus();
                return false;
            }

            if (ContractManage.btnFile.value == "") {
                HDialog.Info("请选择要上传的本地文件!");
                ContractManage.btnFile.focus();
                return false;
            }

            return true;
        }



        function fnInit() {

            Win_OnLoad();
        }

        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }

        function rdoIncreType_OnClick() {
            if (ContractManage.IncreType1.checked) {
                getObject("LabelIncreRate").innerHTML = "递增率(%)"

            }
            else {
                if (ContractManage.IncreType2.checked) {
                    getObject("LabelIncreRate").innerHTML = "递增金额(元)";
                }
            }
        }

        function rdoCalcType_OnClick() {
            if (ContractManage.CalcType1.checked) {
                getObject("labelCalcType").innerHTML = "单价(元/月)";
                getObject("ContNum").disabled = false;
                getObject("IncreType2").disabled = false;
                $('#ContPrice').css("display", "");
            }
            else {
                if (ContractManage.CalcType2.checked) {
                    getObject("labelCalcType").innerHTML = "周期总额(元)";
                    getObject("ContNum").value = "";
                    getObject("ContNum").disabled = true;
                    getObject("IncreType1").checked = true;
                    getObject("IncreType2").checked = false;
                    getObject("IncreType2").disabled = true;
                    $('#ContPrice').css("display", "");
                }
                else {
                    if (ContractManage.CalcType3.checked) {
                        getObject("labelCalcType").innerHTML = "总金额(元)";
                        getObject("ContNum").value = "";
                        getObject("ContNum").disabled = true;
                        getObject("IncreType1").checked = true;
                        getObject("IncreType2").checked = false;
                        getObject("IncreType2").disabled = true;
                        $('#ContPrice').css("display", "");
                    } else {
                        if (ContractManage.CalcType4.checked) {
                            getObject("labelCalcType").innerHTML = "单价(元/月)";
                            $('#ContPrice').css("display", "");

                        } else {
                            getObject("labelCalcType").innerHTML = "";
                            getObject("ContPrice").value = "";
                            $('#ContPrice').css("display", "none");
                        }
                    }
                }
            }

        }
        //-->
    </script>
</head>
<body onload="fnInit()" style="padding: 0px; margin: 0px;">
    <form id="ContractManage" method="post" runat="server">
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server">
        <input id="ContID" type="hidden" name="ContID" runat="server" />
        <input id="PrintParms" type="hidden" name="PrintParms" runat="server">
        <input id="IsDelete" type="hidden" name="IsDelete" runat="server">
        <input id="InfoIDOa" type="hidden" name="InfoIDOa" runat="server">
        <input id="IsCorp" type="hidden" name="IsCorp" runat="server">
        <input id="IsClose" type="hidden" name="IsClose" runat="server" />
        <input id="btnDridContDel" name="btnDridContDel" type="button" style="display: none" runat="server" />
        <input id="DGridContIID" name="DGridContIID" type="hidden" runat="server" />
        <input id="AdvertisingIDs" type="hidden" name="AdvertisingIDs" runat="server" />
        <input id="ChangeType" type="hidden" name="ChangeType" runat="server" />

        <div id="DivBottom" style="width: 100%; overflow-y: auto">
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" id="htdj" name="htdj" refpage="htdj" refsel="1"><a data-toggle="tab" href="#tab-11" aria-expanded="true">合同登记</a>
                    </li>
                    <%--<li class="" name="htfy" id="htfy" refpage="htfy" style="display: none;" refsel="0"><a data-toggle="tab" href="#tab-12" aria-expanded="false">合同费用</a>
                    </li>--%>
                    <li class="" id="htbg" name="htbg" refpage="htbg" refsel="0"><a data-toggle="tab" href="#tab-13" aria-expanded="true">合同变更</a>
                    </li>
                    <li class="" id="htzx" name="htzx" refpage="htzx" refsel="0"><a data-toggle="tab" href="#tab-14" aria-expanded="true">合同执行</a>
                    </li>
                    <li class="" id="gfzl" name="gfzl" refpage="gfzl" refsel="0"><a data-toggle="tab" href="#tab-15" aria-expanded="true">供方资料</a>
                    </li>
                    <li class="" id="gfht" name="gfht" refpage="gfht" refsel="0"><a data-toggle="tab" href="#tab-16" aria-expanded="true">供方合同</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-11" class="tab-pane active">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <table class="DialogTable" width="100%">

                                    <tr>
                                        <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同基本信息</span> </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">项目名称</td>
                                        <td class="TdContentSearch">
                                            <input id="CommName" class="easyui-searchbox" searcher="SelCommInfo" data-options="editable:false"
                                                name="CommName" runat="server" /><input id="hiCommName" style="width: 8px; height: 22px" type="hidden"
                                                    size="1" name="hiCommName" runat="server" /><input id="CommID" style="width: 8px; height: 22px" type="hidden"
                                                        size="1" name="CommID" runat="server" /></td>
                                        <td class="TdTitle">审核状态</td>
                                        <td class="TdContent">
                                            <asp:Label ID="IsAuditing" runat="server" ForeColor="Red"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同类型</td>
                                        <td class="TdContent">
                                            <asp:DropDownList ID="ContSort" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="1" Selected="True">收款合同</asp:ListItem>
                                                <%--<asp:ListItem Value="2">付款合同</asp:ListItem>
                                                <asp:ListItem Value="3">租赁合同</asp:ListItem>
                                                <asp:ListItem Value="4">其它合同</asp:ListItem>--%>
                                            </asp:DropDownList></td>
                                        <td class="TdTitle">合同类别</td>
                                        <td class="TdContentSearch">
                                            <input id="NewContType" class="easyui-searchbox" searcher="SelNewContType" data-options="required:true, editable:false"
                                                name="NewContType" runat="server" /><input id="NewContTypeCode" style="width: 8px; height: 22px" type="hidden"
                                                    size="1" name="NewContTypeCode" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">签约类型</td>
                                        <td class="TdContent">
                                            <select id="ContractType" name="ContractType" runat="server">
                                                <option value="新签" select>新签</option>
                                                <option value="续签">续签</option>
                                            </select>
                                            <span style="color: red; cursor: pointer; display: none;" id="BtnSignTypeHistory">查看历史</span></td>
                                        <td class="TdTitle">合同编号</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" data-options="required:true" id="ContSign"
                                                name="ContSign" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同名称</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" data-options="required:true" id="ContName" name="ContName" runat="server"></td>
                                        <td class="TdTitle">客户名称</td>
                                        <td class="TdContentSearch">
                                            <input id="CustName" class="easyui-searchbox" searcher="SelCust" data-options="required:true, editable:false"
                                                name="CustName" runat="server" />
                                            <input class="button" id="btnAddNewCustomer" style="height: 26px; width: 118px;" onclick="btnAddNewCustomer_Click();"
                                                type="button" value="多项目合同复制客户" name="btnAddNewCustomer" runat="server">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">可选房号</td>
                                        <td class="TdContentSearch">
                                            <input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                                    size="1" name="hiCustName" runat="server" />
                                            <select id="SelRoomID" style="width: 150px" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelRoomID" runat="server">
                                                <option selected></option>
                                            </select></td>
                                        <td class="TdTitle">房屋编号</td>
                                        <td class="TdContentSearch">
                                            <input id="RoomSign" searcher="SelRoom"
                                                name="RoomSign" class="easyui-searchbox" data-options="editable:false" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">客户地址</td>
                                        <td class="TdContent">
                                            <input id="RoomID" style="width: 8px; height: 22px" type="hidden"
                                                size="1" name="RoomID" runat="server" /><input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden"
                                                    size="1" name="hiRoomSign" runat="server" /><input class="easyui-validatebox" id="UnitName" data-options="required:true"
                                                        name="UnitName" runat="server"></td>
                                        <td class="TdTitle">联系人</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="Vender" name="Vender" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">联系电话</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="VenderTel" name="VenderTel"
                                                runat="server"></td>
                                        <td class="TdTitle">三方单位</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="ThreeUnits" name="ThreeUnits" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">开始时间</td>
                                        <td class="TdContentSearch">
                                            <input class="easyui-datebox" data-options="required:true,editable:false" onkeypress="CheckDate();" id="ContStartDate"
                                                onclick="WdatePicker()" name="ContStartDate" runat="server"></td>
                                        <td class="TdTitle">结束时间</td>
                                        <td class="TdContentSearch">
                                            <input class="easyui-datebox" data-options="required:true,editable:false,onHidePanel:ContEndDateHidePanel" onkeypress="CheckDate();" id="ContEndDate"
                                                onclick="WdatePicker()" name="ContEndDate" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同期限</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="ContractPeriod" name="ContractPeriod" runat="server"></td>
                                        <td class="TdTitle">合同到期提醒</td>
                                        <td class="TdContentSearch">
                                            <input class="easyui-datebox" data-options="required:false,editable:false" id="EarlyWarningDate"
                                                onclick="WdatePicker()" name="EarlyWarningDate" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同内容</td>
                                        <td class="TdContentSearch">
                                            <input class="easyui-searchbox" searcher="SelNewContContent" id="NewContContent" data-options="editable:false" name="NewContContent" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同描述</td>
                                        <td class="TdContent" colspan="3">
                                            <textarea id="ContContent" name="ContContent" rows="6" cols="60" runat="server"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同范本来源</td>
                                        <td class="TdContent" colspan="3">
                                            <select id="ContractSource" isdctype="true" dctype="合同范本来源" clientidmode="Static" onchange="ContractSourceChange()" name="ContractSource" runat="server"></select>
                                            <input id="hiContractSource" name="hiContractSource" runat="server" type="hidden" /></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">范本修改内容</td>
                                        <td class="TdContent" colspan="3">
                                            <input class="easyui-validatebox" id="SourceEditContent" style="width: 90%" name="SourceEditContent" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">上次合同金额</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="LastContractAmount" name="LastContractAmount"
                                                runat="server"></td>
                                        <td class="TdTitle">本次合同金额</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" data-options="required:true" id="ContAmount" name="ContAmount"
                                                runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同保证金</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" data-options="required:true" id="Margin" name="Margin" runat="server"></td>
                                        <td class="TdTitle">合同违约金</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="PenaltyMoney" name="PenaltyMoney"
                                                runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">付款方式</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="NewPayType" name="NewPayType"
                                                runat="server"></td>
                                        <td class="TdTitle">合同份数</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="ContractNum" name="ContractNum"
                                                runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">每份页数</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="ContractPages" name="ContractPages"
                                                runat="server"></td>
                                        <td class="TdTitle">附件数量</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" id="FilesNum" name="FilesNum"
                                                runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">机构部门/负责人</td>
                                        <td class="TdContentSearch">
                                            <input class="easyui-searchbox" searcher="SelDutyDepUserName" id="DutyDepUserName" style="width: 75%" data-options="editable:false"
                                                name="DutyDepUserName" runat="server">
                                            <input class="button" id="btnClear1" style="height: 24px; width: 48px;" onclick="javascript: btnClear1_OnClick();"
                                                type="button" value="清空" name="btnClear1" runat="server">
                                        </td>
                                        <td class="TdTitle">签约时间</td>
                                        <td class="TdContent">
                                            <input class="Wdate" onkeypress="CheckDate();" id="SignDate" onclick="WdatePicker()"
                                                name="SignDate" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">登记时间</td>
                                        <td class="TdContent">
                                            <%--  <input class="Wdate" onkeypress="CheckDate();" readonly="readonly" id="RegDate" onclick="WdatePicker()"
                                                name="RegDate" runat="server">--%>
                                            <input class="easyui-validatebox" id="RegDate" readonly="readonly" name="RegDate" runat="server">
                                        </td>
                                        <td class="TdTitle">登记人</td>
                                        <td class="TdContent">
                                            <input id="DutyUserCode" type="hidden" size="1" name="DutyUserCode"
                                                runat="server"><input id="DutyDepCode" type="hidden" size="1" name="DutyDepCode"
                                                    runat="server"><input id="hiDutyDepUserName" type="hidden" name="hiDutyDepUserName"
                                                        runat="server"><input class="easyui-validatebox" id="RegUserName" name="RegUserName"
                                                            runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">备注</td>
                                        <td class="TdContent" colspan="3">
                                            <textarea id="Memo" name="Memo" rows="5" cols="60" runat="server"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">对应广告位</td>
                                        <td class="TdContentSearch" colspan="3">
                                            <input class="easyui-searchbox" searcher="SelAdvertising" id="AdvertisingNames" data-options="editable:false"
                                                name="AdvertisingNames" runat="server">
                                        </td>
                                    </tr>
                                    <asp:Panel ID="ClosePanel" runat="server">
                                        <tr>
                                            <td class="TdTitle">关闭人</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" id="CloseUserName" readonly name="CloseUserName" runat="server"></td>
                                            <td class="TdTitle">关闭时间</td>
                                            <td class="TdContent">
                                                <input class="Wdate" id="CloseDate" onkeypress="CheckDate();" onclick="WdatePicker()" name="CloseDate" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">关闭原因</td>
                                            <td class="TdContent" colspan="3">
                                                <input class="easyui-validatebox" style="width: 90%" id="CloseMemo" name="CloseMemo" runat="server"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="ShowPanel" runat="server">
                                        <tr>
                                            <td class="TdTitle">停车卡号</td>
                                            <td class="TdContent">
                                                <input id="ParkingCarSign" class="easyui-validatebox" name="ParkingCarSign"
                                                    runat="server"></td>
                                            <td class="TdTitle">车牌号码</td>
                                            <td class="TdContent">
                                                <input id="CarSign" class="easyui-validatebox" size="33" name="CarSign" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">排气量(升)</td>
                                            <td class="TdContent">
                                                <input id="Displacement" class="easyui-validatebox" name="Displacement"
                                                    runat="server"></td>
                                            <td class="TdTitle">车位编号</td>
                                            <td class="TdContent">
                                                <input id="ParkName" class="easyui-validatebox" name="ParkName"
                                                    runat="server"></td>
                                        </tr>
                                    </asp:Panel>
                                    <tr style="display: none">
                                        <td class="TdTitle">是否维保合同</td>
                                        <td class="TdContent">
                                            <select style="z-index: 0" id="IsDeviceCont" onchange="btnIsDeviceCont_OnClick();" name="IsDeviceCont"
                                                runat="server">
                                                <option selected></option>
                                            </select>（选择维保设备设置是否维保合同）</td>
                                        <td class="TdTitle">维保设备名称</td>
                                        <td class="TdContent">
                                            <input id="DeviceName" class="easyui-validatebox"
                                                readonly size="40" name="DeviceName" runat="server"><input style="z-index: 0" id="BtnSelEquipmentDevice" class="button_sel" onclick="javascript: if (btnSelEquipmentDevice_OnClick() == false) return false;"
                                                    value=" " type="button" name="BtnSelEquipmentDevice" runat="server"><input style="height: 22px; width: 8px; z-index: 0" id="DeviceIDs" class="easyui-validatebox"
                                                        size="1" type="hidden" name="DeviceID" runat="server"></td>
                                    </tr>
                                    <tr style="display: none">
                                        <td class="TdContent" colspan="4">
                                            <asp:DataGrid Style="font-size: 12px" ID="DGridDevice" runat="server" AutoGenerateColumns="False"
                                                Width="100%" CssClass="DataGrid">
                                                <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                                                <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                                                <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                                                <Columns>
                                                    <asp:BoundColumn Visible="False" DataField="ContJoinID" ReadOnly="True"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="TypeName" SortExpression="TypeName" ReadOnly="True" HeaderText="设备类别"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DeviceSign" SortExpression="DeviceSign" HeaderText="设备编号"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DeviceName" SortExpression="DeviceSign" ReadOnly="True" HeaderText="设备名称"></asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="[删除]">
                                                        <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"
                                                                CommandName="Delete" CausesValidation="false" TabIndex="1" ID="Linkbutton1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                </Columns>
                                            </asp:DataGrid></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同计费信息</span> </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">计费周期</td>
                                        <td class="TdContent">
                                            <input onkeypress="CheckNumeric();" id="PayPeriod" style="height: 22px;" class="easyui-validatebox" onblur="javascript:GetPayPeriod();"
                                                name="PayPeriod" runat="server">
                                        </td>
                                        <td class="TdTitle">计费方式</td>
                                        <td class="TdContent">
                                            <select id="PayType" name="PayType" runat="server">
                                                <option selected></option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同违约金延期</td>
                                        <td class="TdContent">
                                            <input style="z-index: 0" id="DelinType1" name="DelinType" value="0" checked type="radio"
                                                runat="server">按<input class="easyui-validatebox" id="DelinDelay" onblur='valuevalidatebox(this.id)' name="DelinDelay" runat="server"
                                                    style="height: 22px; width: 40px; z-index: 0">天之后;</td>
                                        <td class="TdContent" colspan="2">
                                            <input style="z-index: 0" id="DelinType2" name="DelinType" value="1" type="radio" runat="server">推迟<input id="DelinMonth" class="easyui-validatebox" style="height: 22px; width: 40px; z-index: 0"
                                                name="DelinMonth" onblur='valuevalidatebox(this.id)' runat="server">月按<input style="height: 22px; width: 40px; z-index: 0" id="DelinDay" class="easyui-validatebox"
                                                    name="DelinDay" onblur='valuevalidatebox(this.id)' runat="server">号开始(日期超过的,从次月计算)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">合同违约金比率</td>
                                        <td class="TdContent">
                                            <input class="easyui-validatebox" style="height: 22px;" id="DelinRates" name="DelinRates" runat="server">(小数/天)</td>
                                        <td class="TdTitle"></td>
                                        <td class="TdContent"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">合同计费设置</span> </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="padding-bottom: 5px;">
                                            <div class="tabs-container">
                                                <ul class="nav nav-tabs">
                                                    <li class="active" id="htbz" name="htbz" refpage="htbz" refsel="1"><a data-toggle="tab" href="#tab-20" aria-expanded="true">合同标准</a>
                                                    </li>
                                                    <li class="" name="htfy" id="htfy" refpage="htfy" refsel="0"><a data-toggle="tab" href="#tab-21" aria-expanded="false">合同费用</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div id="tab-20" class="tab-pane active">
                                                        <div class="panel-body" style="padding: 0px;">
                                                            <input id="hiDGridCont" runat="server" type="hidden" name="hiDGridCont" />
                                                            <div class="SearchContainer" id="DGridCont" style="height: 300px"></div>
                                                        </div>
                                                    </div>
                                                    <div id="tab-21" class="tab-pane">
                                                        <div class="panel-body" style="padding: 0px;">
                                                            <div class="datagrid-toolbar" id="divtt">
                                                                <table style="width: 100%" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td style="float: right">
                                                                            <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="CaluFees();">计算费用</a>
                                                                            &nbsp;
                                                                            <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="AddFees();">新增费用</a>
                                                                            &nbsp;
                                                                            <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="DeleteFeesSingle();">删除费用</a>
                                                                            &nbsp;
                                                                            <a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="DeleteFees();">批量删除</a>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div style="width: 100%; background-color: #cccccc;" id="TableContainerGridFee"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="TdTitle">文件上传</td>
                                        <td colspan="3"><span style="float: left">文件说明：<input id="AdjunctName"
                                            name="AdjunctName" runat="server"></span><input style="float: left" id="btnFile" tabindex="1" type="file"
                                                name="btnFile" runat="server"><input style="float: left; height: 24px; width: 45px;" id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                                                    value="上传" type="button" name="btnFileUp" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                                                AutoGenerateColumns="False" OnItemCommand="DGrid_ItemCommand1">
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
                                                    <asp:TemplateColumn HeaderText="[删除]">
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
                                    <tr>
                                        <td colspan="4" style="height: 5px"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <!-- 流程内容 -->
                                            <div id="OAFlow" style="height: auto; margin: 0px auto;">
                                                <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                                                <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formTable_Footer" align="center" colspan="4">
                                            <input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;" type="submit" value="保存" name="btnFilter" runat="server">
                                            <input class="button" id="btnStart" onclick="javascript: if (CheckData() == false) return false;"
                                                type="submit" value="送审" name="btnStart" runat="server">
                                            <input class="button" id="btnCheckPass" type="button" value="审批通过" name="btnCheckPass" runat="server">
                                            <input class="button" id="btnCheckNoPass" type="button" value="审批不通过" name="btnCheckNoPass" runat="server">
                                            <input class="button" id="btnReadOver" type="button" value="会签结束" name="btnReadOver" runat="server">
                                            <input class="button" id="btnReturnPrevious" type="button" value="驳回" name="btnReturnPrevious" runat="server">
                                            <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="height: 15px"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div id="tab-13" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div style="width: 100%; background-color: #cccccc;" id="TableContainerHTBG"></div>
                        </div>
                    </div>
                    <div id="tab-14" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div style="width: 100%; background-color: #cccccc;" id="TableContainerHTZX"></div>
                        </div>
                    </div>
                    <div id="tab-15" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <table class="DialogTable" id="Table1" style="line-height: 25px; background-color: #FFFFFF; text-align: left; font-family: 微软雅黑;">
                                <tr>
                                    <td colspan="4" style="padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                        <span style="font-size: 16px">客户基本信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">名  称</td>
                                    <td class="TdContent">
                                        <a class="HrefStyle" href='#' onclick="ViewDetailInfo('Customer','1');">
                                            <asp:Label ID="CustNameGF" runat="server"></asp:Label>
                                        </a>
                                    </td>
                                    <td class="TdTitle">出入证号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="PassSign" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">证件名称</td>
                                    <td class="TdContent">
                                        <asp:Label ID="PaperName" runat="server"></asp:Label></td>
                                    <td class="TdTitle">证件号码</td>
                                    <td class="TdContent">
                                        <asp:Label ID="PaperCode" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">客户类别</td>
                                    <td class="TdContentSearch">
                                        <asp:Label ID="CustTypeName" runat="server" Visible="false"></asp:Label>
                                        <select id="CustTypeID" name="CustTypeID" disabled="disabled" runat="server">
                                            <option selected></option>
                                        </select></td>
                                    <td class="TdTitle">固定电话</td>
                                    <td class="TdContent">
                                        <asp:Label ID="FixedTel" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">移动电话</td>
                                    <td class="TdContent">
                                        <asp:Label ID="MobilePhone" runat="server"></asp:Label></td>
                                    <td class="TdTitle">传真电话</td>
                                    <td class="TdContent">
                                        <asp:Label ID="FaxTel" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">联系地址</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Address" runat="server"></asp:Label></td>
                                    <td class="TdTitle">邮政编码</td>
                                    <td class="TdContent">
                                        <asp:Label ID="PostCode" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">收 件 人</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Recipient" runat="server"></asp:Label></td>
                                    <td class="TdTitle">电子邮件</td>
                                    <td class="TdContent">
                                        <asp:Label ID="EMail" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">绑定手机户名</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Linkman" runat="server"></asp:Label></td>
                                    <td class="TdTitle">绑定手机号码</td>
                                    <td class="TdContent">
                                        <asp:Label ID="LinkmanTel" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">账号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="UnCustID" runat="server"></asp:Label></td>
                                    <td class="TdTitle">卡号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="InquireAccount" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">当前欠费</td>
                                    <td class="TdContent">
                                        <asp:Label ID="DueAmount" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td class="TdTitle"></td>
                                    <td class="TdContent"></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                        <span style="font-size: 16px">个人客户信息</span>
                                    </td>
                                </tr>
                                <asp:Panel ID="PanelName" runat="server" Visible="False">
                                    <tr>
                                        <td class="TdTitle" width="15%" align="right">姓</td>
                                        <td class="TdContent" width="10%" align="right">
                                            <asp:Label ID="Surname" runat="server"></asp:Label></td>
                                        <td class="TdTitle" width="15%" align="right">名</td>
                                        <td class="TdContent" width="10%">
                                            <asp:Label ID="Name" runat="server"></asp:Label></td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="TdTitle">性 别</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Sex" runat="server"></asp:Label></td>
                                    <td class="TdTitle">出生日期</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Birthday" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">国 籍</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Nationality" runat="server"></asp:Label></td>
                                    <td class="TdTitle">职 业</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Job" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">工作单位</td>
                                    <td class="TdContent" colspan="3">
                                        <asp:Label ID="WorkUnit" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">兴趣爱好</td>
                                    <td class="TdContentSearch" colspan="3">
                                        <asp:Label ID="ChkList" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <%--  </table>
        <table class="DialogTable" id="Table3" align="center">--%>
                                <tr>
                                    <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                        <span style="font-size: 16px">单位客户信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">法定代表人</td>
                                    <td class="TdContent">
                                        <asp:Label ID="LegalRepr" runat="server"></asp:Label></td>
                                    <td class="TdTitle">法定代表人电话</td>
                                    <td class="TdContent">
                                        <asp:Label ID="LegalReprTel" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">负 责 人</td>
                                    <td class="TdContent">
                                        <asp:Label ID="Charge" runat="server"></asp:Label></td>
                                    <td class="TdTitle">负责人电话</td>
                                    <td class="TdContent">
                                        <asp:Label ID="ChargeTel" runat="server"></asp:Label></td>
                                </tr>

                                <tr>
                                    <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                        <span style="font-size: 16px">纳税主体信息</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">名称</td>
                                    <td class="TdContent">
                                        <input id="VATCode" name="VATCode" runat="server" type="hidden" class="easyui-validatebox">
                                        <asp:Label ID="VATName" name="VATName" runat="server"></asp:Label></td>
                                    <td class="TdTitle">纳税人识别号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="VATNumber" name="VATNumber" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">地址、电话</td>
                                    <td class="TdContent">
                                        <asp:Label ID="VATAddLinkTel" name="VATAddLinkTel" runat="server"></asp:Label></td>
                                    <td class="TdTitle">开户行及帐号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server"></asp:Label></td>
                                </tr>

                                <%--  </table>
        <table class="DialogTable" id="Table4" align="center">--%>
                                <tr>
                                    <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                                        <span style="font-size: 16px">银行代收信息</span>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="TdTitle">托收类别</td>
                                    <td class="TdContent">
                                        <asp:Label ID="BankName" runat="server"></asp:Label></td>
                                    <td class="TdTitle">银行行别</td>
                                    <td class="TdContent">
                                        <asp:Label ID="BankCode" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">开户行行号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="BankNo" runat="server"></asp:Label></td>
                                    <td class="TdTitle">银行户名</td>
                                    <td class="TdContent">
                                        <asp:Label ID="BankIDs" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">银行账号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="BankAccount" runat="server"></asp:Label></td>
                                    <td class="TdTitle">代收协议编号</td>
                                    <td class="TdContent">
                                        <asp:Label ID="BankAgreement" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="TdTitle">备 注</td>
                                    <td class="TdContent" colspan="3">
                                        <asp:Label ID="YHMemo" runat="server"></asp:Label></td>
                                </tr>
                                <tr style="height: 40px;">
                                    <td class="TdTitle"></td>
                                    <td class="TdContent" colspan="3"></td>
                                </tr>
                                <%--                                        <tr>
                                            <td style="text-align: center;" colspan="4" class="DialogTdSubmit">
                                                <input type="button" class="button" value="保 存" id="btnSave" runat="server" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="button" class="button" value="关 闭" id="btnReturn" />
                                            </td>
                                        </tr>--%>
                            </table>
                        </div>
                    </div>
                    <div id="tab-16" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div style="width: 100%; background-color: #cccccc;" id="TableContainerGFHT"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="FeesSettingDialog" class="easyui-dialog" title="合同计费设置" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 900px; height: 260px;">
            <table width="100%">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCostNameByStand" data-options="editable:false" id="StandCommName" name="StandCommName" runat="server">
                        <input type="hidden" id="StandCommID" name="StandCommID" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="StandCustName" maxlength="50" name="StandCustName" class="easyui-searchbox" searcher="SelCustByStand" data-options="editable:false" runat="server" />
                        <input id="StandCustID" style="width: 8px; height: 19px" type="hidden" size="1" name="StandCustID" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">计费类型</td>
                    <td class="TdContent">
                        <select id="ChargeType" name="ChargeType" onchange="FeesSettingDialogChargeTypeChange(this)" runat="server">
                            <option value="根据合同标准计费">根据合同标准计费</option>
                            <option value="根据合同执行计费">根据合同执行计费</option>
                        </select></td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始日期</td>
                    <td class="TdContent">
                        <input class="Wdate" onkeypress="CheckDate();" id="BeginDate" onclick="WdatePicker()"
                            name="BeginDate" runat="server"></td>
                    <td class="TdTitle">结束日期</td>
                    <td class="TdContent">
                        <input class="Wdate" onkeypress="CheckDate();" id="EndDate" onclick="WdatePicker()"
                            name="EndDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelCostName" data-options="required:true, editable:false" id="CostName" name="CostName" runat="server">
                        <input class="easyui-validatebox" id="hiCostName" style="height: 22px; width: 8px" type="hidden"
                            size="1" name="hiCostName" runat="server"><input class="easyui-validatebox" id="CostID" style="height: 22px; width: 8px" type="hidden"
                                size="1" name="CostID" runat="server"></td>
                    <td class="TdTitle">
                        <asp:Label ID="ShowName2" runat="server">应收日期</asp:Label></td>
                    <td class="TdContent">
                        <input class="Wdate" onkeypress="CheckDate();" id="DueDate" onclick="WdatePicker()"
                            name="DueDate" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">计算方式</td>
                    <td class="TdContent" id="tdJSFS1">
                        <input id="CalcType1" onclick="rdoCalcType_OnClick();" type="radio" checked value="0" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按每月单价</label>
                        <input id="CalcType2" onclick="rdoCalcType_OnClick();" type="radio" value="1" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按缴费周期总额</label>
                        <input id="CalcType3" onclick="rdoCalcType_OnClick();" type="radio" value="2" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按缴费总额</label>
                    </td>
                    <td class="TdContent" id="tdJSFS2" style="display: none;">
                        <input id="CalcType4" onclick="rdoCalcType_OnClick();" type="radio" value="3" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按数量单价</label>
                        <input id="CalcType5" onclick="rdoCalcType_OnClick();" type="radio" value="4" name="CalcType"
                            runat="server"><label style="vertical-align: middle">按实际发生额</label>
                    </td>
                    <td class="TdTitle">
                        <div id="labelCalcType">单价(元/月)</div>
                    </td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="ContPrice" onblur='valuevalidatebox(this.id)'
                            name="ContPrice" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">数量</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" id="ContNum" onblur='valuevalidatebox(this.id)'
                            name="ContNum" runat="server"></td>
                    <td class="TdTitle">递增方式</td>
                    <td class="TdContent">
                        <input id="IncreType1" onclick="rdoIncreType_OnClick();" type="radio" checked value="0"
                            name="IncreType" runat="server"><label style="vertical-align: middle">按总额递增</label>
                        <input id="IncreType2" onclick="rdoIncreType_OnClick();" type="radio" value="1" name="IncreType"
                            runat="server"><label style="vertical-align: middle">按单价递增</label></td>
                </tr>
                <tr>
                    <td class="TdTitle">
                        <div id="LabelIncreRate">递增率(%)</div>
                    </td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" onblur='valuevalidatebox(this.id)' id="IncreRate" name="IncreRate"
                            runat="server"></td>
                    <td class="TdTitle">递增周期(月)</td>
                    <td class="TdContent">
                        <input class="easyui-validatebox" onblur='valuevalidatebox(this.id)' id="IncrePeriod" name="IncrePeriod"
                            runat="server"></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <input class="button" id="btnOK" onclick="javascript: if (btnOK_Onclick() == false) return false;"
                            tabindex="1" type="button" value="确定" name="btnOK" runat="server" style="height: 30px" />
                        <input class="button" id="btnUpdate"
                            tabindex="1" type="button" value="修改" style="display: none; height: 30px"
                            onclick="javascript: if (btnUpdate_Onclick() == false) return false;"
                            name="btnUpdate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 5px"></td>
                </tr>
            </table>
        </div>
        <input type="hidden" name="FeesRow" id="FeesRow" runat="server" />
        <input type="hidden" name="OperatorType" id="OperatorType" runat="server" />
        <script type="text/javascript">
            function valuevalidatebox(obj) {
                if (isNaN($('#' + obj).val()) > 0) {
                    HDialog.Info("请输入大于的数字");
                    $('#' + obj).val('');
                    return false;
                }
            }

            function GetPayPeriod() {
                var vPayPeriod = $('#PayPeriod').val();
                if (vPayPeriod <= 0 || vPayPeriod > 200) {
                    alert("计费周期需要在1-200内！");
                    return false;
                }
            }
            //关闭合同结束时间选择
            function ContEndDateHidePanel() {
                var EndTime = $("#ContEndDate").datebox("getValue");
                if ($("#ContStartDate").datebox("getValue") == "") {
                    $('#EarlyWarningDate').datebox("setValue", EndTime);
                } else {
                    var BeginTime = $("#ContStartDate").datebox("getValue");
                    var dateSpan,
                        iDays;
                    sDate1 = Date.parse(EndTime);
                    sDate2 = Date.parse(BeginTime);
                    dateSpan = sDate2 - sDate1;
                    dateSpan = Math.abs(dateSpan);
                    iDays = Math.floor(dateSpan / (24 * 3600 * 1000));
                    if (iDays > 31) {
                        var DDDD = new Date(EndTime);
                        DDDD.setMonth(DDDD.getMonth());
                        var datestr = DDDD.getFullYear() + "-" + DDDD.getMonth() + "-" + DDDD.getDate();
                        $('#EarlyWarningDate').datebox("setValue", datestr);
                    } else {
                        $('#EarlyWarningDate').datebox("setValue", EndTime);
                    }
                }
            }

            //加载字典设置
            function LoadDictionary() {
                $("select[isdctype='true']").each(function (i) {
                    var nId = $(this).attr("id");
                    var varObjects;
                    $.tool.DataPostAsync('CsCost', 'BindDictionary', 'DcTypeName=' + $(this).attr("dctype"),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            var option = "<option value=''></option>";
                            $("#" + nId).append(option);
                            for (var i = 0; i < varObjects.length; i++) {
                                option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                                $("#" + nId).append(option);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                });
            }
            LoadDictionary();

            function InitDiv() {
                var H = $(window).height();

                $('#DivBottom').css('height', H + 'px');

                if ($('#hiContractSource').val() != '') {
                    $("#ContractSource").val($('#hiContractSource').val());
                }

                var h1 = H - 70;
                h1 = h1 / 2;
                $('#TableContainerGridFee').css('height', h1 + 'px');
                //$('#DGridAuditFee').css('height', h1 + 'px');

                $('#TableContainerHTBG').css('height', H - $('.nav-tabs').height() + 'px');
                $('#TableContainerHTZX').css('height', H - $('.nav-tabs').height() + 'px');
                $('#TableContainerGFHT').css('height', H - $('.nav-tabs').height() + 'px');

                if ($('#hiOPType').val() == "Insert") {
                    //$('#htfy').hide();
                    //$('#tab-12').hide();

                }
                if ($('#hiOPType').val() == "Detail") {
                    $('#divtt').hide();
                }

                if ($('#IsAuditing').text() == "已审核" || $('#IsAuditing').text() == "审核中") {
                    $('#divtt').hide();
                    $("#ContractManage textarea").attr("disabled", "disabled");
                    $("#ContractManage .easyui-numberbox").numberbox({ disabled: true });
                    $("#ContractManage .easyui-searchbox").searchbox({ disabled: true });
                    $("#ContractManage .easyui-combobox").combobox({ disabled: true });
                    $("#ContractManage .easyui-datebox").datebox({ disabled: true });
                    $("#ContractManage input[type='submit']").removeAttr("disabled");
                    if ($('#IsAuditing').text() == "审核中") {
                        $("#WorkFlowManage_TxtDealResult").prop("disabled", "");
                    }
                }
            }
            InitDiv();

            function SelDutyDepUserName() {
                var conent = "../DialogNew/ContractUserDlg.aspx";
                var w = 600;
                var h = 450;
                HDialog.Open(w, h, conent, '用户选择', false, function callback(_Data) {
                    if (_Data != "") {
                        var data = JSON.parse(_Data);
                        $('#DutyUserCode').val(data.UserCode);
                        $('#DutyDepCode').val(data.DepCode);
                        $('#DutyDepUserName').searchbox("setValue", data.DepName + "-" + data.UserName);
                        $('#hiDutyDepUserName').val(data.DepName + "-" + data.UserName);
                    }
                });
            }

            function SelCostName() {
                if ($('#StandCommID').val() == "") {
                    HDialog.Info("请选择标准项目");
                    return false;
                }
                //conent = "../dialogNew/CorpCommCostDlg.aspx" + "?CommID=" + vCommID + "&CostGeneType=" + tmpCostGeneType + "&IncidentID=" + $('#IncidentID').val() + "&Ram=" + Math.random();
                //var conent = "../DialogNew/CostDlg.aspx?CommID=" + $('#StandCommID').val();
                var conent = "../dialogNew/CorpCommCostDlg.aspx?CommID=" + $('#StandCommID').val() + "&Ram=" + Math.random();
                var w = 700;
                var h = 400;
                HDialog.Open(w, h, conent, '收费项目选择', false, function callback(_Data) {
                    if (_Data != "") {
                        var data = JSON.parse(_Data);
                        $('#CostID').val(data.CostID);
                        $('#CostName').searchbox("setValue", data.CostName);
                        $('#hiCostName').val(data.CostName);
                    }
                });
            }
            // 合同计费信息设置 选择标准项目
            function SelCostNameByStand() {
                HDialog.Open(700, 400, '../DialogNew/CommDlg.aspx', "选择管理项目", false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var data = JSON.parse(_Data);
                        $('#StandCommName').searchbox("setValue", data.text);
                        $('#StandCommID').val(data.attributes.InPopedom);
                        //选择项目要把客户 费用项目设置为空
                        $('#StandCustName').searchbox("setValue", "");
                        $('#StandCustID').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#hiCostName').val("");
                        $('#CostID').val("");
                    }
                });
            }

            function SelCustByStand() {
                if ($('#StandCommID').val() == "") {
                    HDialog.Info("请选择标准项目");
                    return false;
                }
                var conent = "../DialogNew/CustDlg.aspx?CommID=" + $('#StandCommID').val();
                HDialog.Open('700', '400', conent, '客户选择', false, function callback(_Data) {
                    if (_Data != "") {
                        var data = JSON.parse(_Data);
                        $('#StandCustName').searchbox("setValue", data.CustName);
                        $('#StandCustID').val(data.CustID);
                    }
                });


            }

            // 合同计费信息设置  计费类型改变
            function FeesSettingDialogChargeTypeChange(obj) {
                switch ($(obj).val()) {
                    case "根据合同标准计费":
                        $('#tdJSFS1').css("display", "");
                        $('#tdJSFS2').css("display", "none");
                        //$('#StandCustName').searchbox("setValue", "");
                        //$('#StandCustID').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#hiCostName').val("");
                        $('#CostID').val("");
                        getObject("CalcType1").checked = true;
                        $('#FeesSettingDialog table tr').each(function (index) {
                            $(this).css("display", "");
                            if (index == 3) {
                                $(this).children("td").eq(2).show();
                                $(this).children("td").eq(3).show();
                            }
                        });
                        $('#ContPrice').css("display", "");
                        getObject("labelCalcType").innerHTML = "单价(元/月)";
                        break;
                    case "根据合同执行计费":
                        $('#tdJSFS1').css("display", "none");
                        $('#tdJSFS2').css("display", "");
                        //$('#StandCustName').searchbox("setValue", "");
                        //$('#StandCustID').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#hiCostName').val("");
                        $('#CostID').val("");
                        getObject("CalcType4").checked = true;
                        $('#FeesSettingDialog table tr').each(function (index) {
                            if (index == 2 || index == 5 || index == 6) {
                                $(this).css("display", "none");
                            }
                            if (index == 3) {
                                $(this).children("td").eq(2).hide();
                                $(this).children("td").eq(3).hide();
                            }
                        });
                        getObject("labelCalcType").innerHTML = "单价(元/月)";
                        break;
                }
            }

            function SelNewContType() {
                HDialog.Open('400', '350', '../DialogNew/CostContractType.aspx', '选择合同类型', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#NewContTypeCode").val(varObjects[0]);
                        $("#NewContType").searchbox("setValue", varObjects[1]);
                    }
                });
            }
            function SelNewContContent() {
                var val = $("#NewContTypeCode").val();
                if (val == null || val == "" || val == undefined) {
                    HDialog.Info("请先选择合同类别");
                    return;
                }
                HDialog.Open('500', '400', '../DialogNew/CostContractContent.aspx?CtId=' + val, '选择合同内容', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.replace(/-/g, ';');
                        varObjects = varObjects.substr(1, varObjects.length);
                        $("#NewContContent").searchbox("setValue", varObjects);
                    }
                });
            }
            function SelContractSource() { }
            function SelCommInfo() {

                if ($('#CommID').val() != '') {
                    return;
                }
                else {
                    HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                        if (_Data != "") {
                            var arrRet = JSON.parse(_Data);
                            $("#CommID").val(arrRet.id);
                            $("#CommName").searchbox("setText", arrRet.name);
                        }
                    });
                }
            }
            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelRoomID').combobox('clear');

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
                                $('#SelRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {


                                        var data = $('#SelRoomID').combobox('getData');
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
            function ContractSourceChange() {
                $('#hiContractSource').val($('#ContractSource').val());
            }
            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelRoomID').combobox('clear');

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    $('#SelRoomID').combobox({
                        data: '',
                        valueField: 'RoomID',
                        textField: 'RoomText'
                    });

                });
            }

            function SelAdvertising() {

                HDialog.Open('700', '400', "../DialogNew/MultiAdvertisingDlg.aspx", '选择广告位', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新

                        var data = _Data.split('|');

                        if (data.length > 0) {
                            var vAdvertisingIDs = "";
                            var vAdvertisingNames = "";

                            for (var i = 0; i < data.length; i++) {
                                if (data[i] != "") {
                                    var obj = JSON.parse(data[i]);

                                    if (obj.AdvertisingID != 0) {
                                        vAdvertisingIDs = vAdvertisingIDs + "," + obj.AdvertisingID;
                                        vAdvertisingNames = vAdvertisingNames + ',' + obj.AdvertisingName;
                                    }
                                }
                            }

                            if (vAdvertisingIDs != "") {
                                $('#AdvertisingIDs').val(vAdvertisingIDs.substring(1, vAdvertisingIDs.length));
                                $('#AdvertisingNames').searchbox("setValue", vAdvertisingNames.substring(1, vAdvertisingNames.length));

                            }
                            else {
                                $('#AdvertisingIDs').val("");
                                $('#AdvertisingNames').searchbox("setValue", "");
                            }
                        }

                    }
                });
            }

            $('#btnReturn').click(function () {
                HDialog.Close();
            })

            $(".tabs-container li").click(function () {
                switch ($(this).attr("name")) {
                    case "htfy":
                        //合同费用
                        setTimeout("LoadFeesList()", 10);
                        break;
                    case "htbg":
                        //合同变更
                        setTimeout("LoadChangeGrid()", 10);
                        break;
                    case "htzx":
                        //合同执行
                        setTimeout("LoadImplementGrid()", 10);
                        break;
                    case "gfzl":
                        //供方资料
                        setTimeout("LoadSupplierDetail()", 10);
                        break;
                    case "gfht":
                        //供方合同
                        setTimeout("LoadSupplierGrid()", 10);
                        break;
                }
            });
            //合同变更
            var ChangeColumn = [[
                { field: 'CommName', title: '项目名称', width: '100', align: 'left', sortable: true },
                { field: 'NewContTypeName', title: '合同类别', width: '80', align: 'left', sortable: true },
                { field: 'ContSign', title: '合同编号', width: '160', align: 'left', sortable: true },
                {
                    field: 'ContName', title: '合同名称', width: '220', align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ChangeDetail('edit','" + row.IID + "');\">" + row.ContName + "</a>";
                        return str;
                    }
                },
                { field: 'CustName', title: '客户名称', width: '220', align: 'left', sortable: true },
                { field: 'Vender', title: '联系人', width: '150', align: 'left', sortable: true },
                { field: 'InitiateTime', title: '发起时间', width: '150', align: 'left', sortable: true },
                { field: 'InitiateUserName', title: '发起人', width: '100', align: 'left', sortable: true },
                { field: 'AuditState', title: '审批状态', width: '80', align: 'left', sortable: true }
            ]];
            //合同执行
            var ImplementeColumn = [[
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                { field: 'ContractType', title: '合同类型', align: 'left', sortable: true, width: 80 },
                {
                    field: 'ContSign', title: '合同编号', align: 'left', sortable: true, width: 160, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ImplementDetail('detail','" + row.IID + "');\">" + row.ContSign + "</a>";
                        return str;
                    }
                },
                { field: 'ContName', title: '合同名称', width: 220, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 220, align: 'left', sortable: true },
                { field: 'Vender', title: '联系人', width: 100, align: 'left', sortable: true },
                { field: 'InitiateTime', title: '发起时间', width: 140, align: 'left', sortable: true },
                { field: 'InittiateUserName', title: '发起人', width: 100, align: 'left', sortable: true },
                { field: 'AuditState', title: '审批状态', width: 80, align: 'left', sortable: true }
            ]];

            //供方合同
            var SupplierColumn = [[
                { field: 'CommName', title: '项目名称', width: '100', align: 'left', sortable: true },
                { field: 'NewContTypeName', title: '合同类别', width: '100', align: 'left', sortable: true },
                { field: 'ContSign', title: '合同编号', width: '100', align: 'left', sortable: true },
                { field: 'ContName', title: '合同名称', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'Vender', title: '联系人', width: 100, align: 'left', sortable: true },
                { field: 'VenderTel', title: '联系电话', width: 100, align: 'left', sortable: true },
                {
                    field: 'ContStartDate', title: '合同开始时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ContStartDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ContEndDate', title: '合同结束时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ContEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'ContractPeriod', title: '合同期限', width: 100, align: 'left', sortable: true },
                { field: 'ContAmount', title: '合同金额', width: 100, align: 'left', sortable: true },
                { field: 'DutyDepName', title: '机构部门', width: 100, align: 'left', sortable: true },
                { field: 'DutyUserName', title: '负责人', width: 100, align: 'left', sortable: true },
                {
                    field: 'SignDate', title: '签约时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.SignDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'IsExpire', title: '是否到期', width: 100, align: 'left', sortable: true },
                { field: 'RegUserName', title: '发起人', width: 100, align: 'left', sortable: true },
                { field: 'RegDate', title: '发起时间', width: 100, align: 'left', sortable: true },
                { field: 'IsAuditing', title: '审批状态', width: 100, align: 'left', sortable: true },
                { field: 'ChangeType', title: '变更类型', width: 100, align: 'left', sortable: true }
            ]];
            //合同变更工具栏
            var ChangeToolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($('#ContID').val() == "" || $('#ContID').val() == "0") {
                            HDialog.Info('合同还未保存，不允许变更!');
                            return false;
                        }
                        $.tool.DataGet('Contract', 'GetContractChangeIsAudit', 'ContID=' + $('#ContID').val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data == "false") {
                                    HDialog.Info("还有发起的合同变更未完成！");
                                }
                                else {
                                    ChangeDetail("insert", "");
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });


                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var selectedRow = $('#TableContainerHTBG').datagrid("getSelected");
                        if (selectedRow == null) {
                            HDialog.Info("请选择需要删除的合同变更数据");
                            return;
                        }
                        $.messager.confirm('确定', '是否删除该项', function (r) {
                            if (r) {
                                if (selectedRow.AuditState != "" && (selectedRow.AuditState == "已驳回" || selectedRow.AuditState == "未启动")) {
                                    $.tool.DataGet('Contract', 'DeleteContractChange', 'IID=' + selectedRow.IID,
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            if (_Data == "false") {
                                                HDialog.Info("删除失败");
                                            }
                                            else {
                                                HDialog.Info("删除成功");
                                                LoadChangeGrid();
                                            }
                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        });
                                }
                                else {
                                    HDialog.Info("无法删除");
                                }
                            }
                        });
                    }
                }
            ];
            function ChangeDetail(optype, IID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, "../ContractNew/ContractChangeManage.aspx?OpType=" + optype + "&IID=" + IID + "&ContID=" + $('#ContID').val(), "合同变更", false, function callback(_Data) {
                    if (_Data != "") {
                        LoadChangeGrid();
                    }
                });
            }
            function ImplementDetail(OpType, IID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, "../ContractNew/ContractImplementManageDetail.aspx?OpType=" + OpType + "&IID=" + IID, '合同执行', false, function callback(_Data) {
                    if (_Data != "") {
                        LoadImplementGrid();
                    }
                });
            }

            //供方合同查看 合同信息
            function SupplierDetail(ContID) {
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, "../ContractNew/ContractManage.aspx?OpType=Detail&ContID=" + ContID, '合同详情', false, function callback(_Data) {
                });
            }

            //加载合同变更
            function LoadChangeGrid() {
                if ($('#IsAuditing').text() != "已审核" || $('#ChangeType').val() == "终止" || $('#ChangeType').val() == "关闭") {
                    ChangeToolbar = [];
                }

                $("#TableContainerHTBG").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    columns: ChangeColumn,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: ChangeToolbar,
                    sortOrder: "asc",
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Contract", "GetContractChangeManageList", "TableContainerHTBG", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }

            //加载合同执行
            function LoadImplementGrid() {
                $("#TableContainerHTZX").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    columns: ImplementeColumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    sortOrder: "asc",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Contract", "GetContractImplementManageList", "TableContainerHTZX", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }

            //加载供方资料
            function LoadSupplierDetail() {
                //获取信息
                $.tool.DataPost('Contract', 'GetCustInformation', 'CustID=' + $('#CustID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            ReturnJson = eval("(" + _Data.replace(/\\/g, "/") + ")");
                            if (ReturnJson != null) {
                                var obj = ReturnJson.CustMer[0];   //基础信息
                                if (obj != null) {
                                    $("#CustTypeName").text(obj.CustTypeName);
                                    $("#CustTypeID").val(obj.CustTypeID);
                                    $("#CustNameGF").text(obj.CustName);
                                    $("#FixedTel").text(obj.FixedTel);
                                    $("#MobilePhone").text(obj.MobilePhone);
                                    $("#FaxTel").text(obj.FaxTel);
                                    $("#EMail").text(obj.EMail);
                                    $("#Surname").text(obj.Surname);
                                    $("#Name").text(obj.Name);
                                    $("#Sex").text(obj.Sex);
                                    $("#Birthday").text(obj.Birthday);
                                    $("#Nationality").text(obj.Nationality);
                                    $("#WorkUnit").text(obj.WorkUnit);
                                    $("#PaperName").text(obj.PaperName);
                                    $("#PaperCode").text(obj.PaperCode);
                                    $("#PassSign").text(obj.PassSign);
                                    $("#LegalRepr").text(obj.LegalRepr);
                                    $("#LegalReprTel").text(obj.LegalReprTel);
                                    $("#Charge").text(obj.Charge);
                                    $("#ChargeTel").text(obj.ChargeTel);
                                    $("#Linkman").text(obj.Linkman);
                                    $("#LinkmanTel").text(obj.LinkmanTel);
                                    $("#BankCode").text(obj.BankCode);
                                    $("#BankNo").text(obj.BankNo);
                                    $("#BankName").text(obj.BankName);
                                    $("#BankIDs").text(obj.BankIDs);
                                    $("#BankAccount").text(obj.BankAccount);
                                    $("#BankAgreement").text(obj.BankAgreement);
                                    $("#UnCustID").text(obj.UnCustID);
                                    $("#InquireAccount").text(obj.InquireAccount);
                                    $("#YHMemo").text(obj.Memo);
                                    $("#IsUnit").text(obj.IsUnit);
                                    $("#Address").text(obj.Address);
                                    $("#PostCode").text(obj.PostCode);
                                    $("#Recipient").text(obj.Recipient);
                                    $("#Job").text(obj.Job);
                                }
                                var objInterests = ReturnJson.CustInterests[0];   //兴趣爱好查询
                                var CustInterestsList = objInterests.CustInterestsList;
                                if (CustInterestsList != undefined) {
                                    $("#ChkList").text(CustInterestsList);
                                    //var CustInterestsItem = CustInterestsList.split(',');
                                    //for (var i = 0; i < CustInterestsItem.length; i++) {
                                    //    $("input[name^='ChkList']").each(function () {
                                    //        if ($(this).attr("name").indexOf(CustInterestsItem[i]) > 0) {
                                    //            $(this).attr("checked", true);
                                    //        }
                                    //    }
                                    //);
                                    //}
                                }
                                var objDebtsAmount = ReturnJson.DebtsAmount[0];   //查询业主欠费
                                if (objDebtsAmount != null) {
                                    var DebtsAmount = objDebtsAmount.DebtsAmount;
                                    $("#DueAmount").text(DebtsAmount);
                                }
                                var objVATSetting = ReturnJson.VATSetting[0];   //纳税信息
                                if (objVATSetting != null) {
                                    $("#VATCode").val(objVATSetting.VATCode);
                                    $("#VATName").text(objVATSetting.VATName);
                                    $("#VATNumber").text(objVATSetting.VATNumber);
                                    $("#VATAddLinkTel").text(objVATSetting.VATAddLinkTel);
                                    $("#VATBankAccoutNumber").text(objVATSetting.VATBankAccoutNumber);
                                }
                            }

                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //加载供方合同
            function LoadSupplierGrid() {
                $("#TableContainerGFHT").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    columns: SupplierColumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    sortOrder: "asc",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Contract", "LoadSupplierContract", "TableContainerGFHT", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }

            var DGridContcolumn = [[
                { field: 'StandCommName', title: '项目名称', width: '150', align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: '150', align: 'left', sortable: true },
                { field: 'ChargeType', title: '计费类型', width: '150', align: 'left', sortable: true },
                { field: 'DueDate', title: '应收日期', width: '150', align: 'left', sortable: true },
                { field: 'BeginDate', title: '开始日期', width: '150', align: 'left', sortable: true },
                { field: 'EndDate', title: '结束日期', width: '150', align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: '150', align: 'left', sortable: true },
                { field: 'ContNum', title: '数量', width: '150', align: 'left', sortable: true },
                { field: 'CalcTypeName', title: '计算方式', width: '150', align: 'left', sortable: true },
                { field: 'ContPrice', title: '单价', width: '150', align: 'left', sortable: true },
                { field: 'IncreTypeName', title: '递增方式', width: '150', align: 'left', sortable: true },
                { field: 'IncreRate', title: '递增率/金额', width: '150', align: 'left', sortable: true },
                { field: 'IncrePeriod', title: '递增周期', width: '150', align: 'left', sortable: true }
            ]];

            var DGridConttoolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        //默认设置当前项目
                        //设置默认值
                        $('#StandCommName').searchbox("setValue", $('#CommName').searchbox("getValue"));
                        $('#StandCommID').val($('#CommID').val());
                        $("#ChargeType").find("option:contains('根据合同标准计费')").attr("selected", true);
                        $('#BeginDate').val("");
                        $('#EndDate').val("");
                        $('#CostName').searchbox("setValue", "");
                        $('#CostID').val("");
                        $('#DueDate').val("");
                        if ($('#CustName').searchbox("getValue") != "") {
                            $('#StandCustID').val($('#CustID').val());
                            $('#StandCustName').searchbox("setValue", $('#CustName').searchbox("getValue"));
                        } else {
                            $('#StandCustID').val("");
                            $('#StandCustName').searchbox("setValue", "");
                        }

                        getObject("CalcType1").checked = true;
                        getObject("labelCalcType").innerHTML = "单价(元/月)";
                        $('#ContNum').val("");
                        getObject("IncreType1").checked = true;
                        $('#IncrePeriod').val("");
                        $('#IncreRate').val("");
                        $('#ContPrice').val("");
                        //新增标准时默认 开始时间  结束时间 应收时间是合同的时间
                        if ($('#ContStartDate').datebox("getValue") != "") {
                            $('#BeginDate').val($('#ContStartDate').datebox("getValue"));
                            $('#DueDate').val($('#ContStartDate').datebox("getValue"));
                        }
                        if ($('#ContEndDate').datebox("getValue") != "") {
                            $('#EndDate').val($('#ContEndDate').datebox("getValue"));
                        }

                        $('#btnOK').show();
                        $('#btnUpdate').hide();
                        $('#tdJSFS1').css("display", "");
                        $('#tdJSFS2').css("display", "none");

                        $('#FeesSettingDialog table tr').each(function (index) {
                            $(this).css("display", "");
                            if (index == 3) {
                                $(this).children("td").eq(2).show();
                                $(this).children("td").eq(3).show();
                            }
                        });
                        $('#FeesSettingDialog').parent().appendTo($("form:first"))
                        $('#FeesSettingDialog').dialog('open');
                    }
                }, '-',
                {
                    text: '修改',
                    iconCls: 'icon-save',
                    handler: function () {
                        var selectedRow = $('#DGridCont').datagrid('getSelected');
                        if (selectedRow == null) {
                            HDialog.Info("请选择需要修改的标准");
                            return;
                        }
                        if (selectedRow.ChargeType == "根据合同标准计费") {
                            $('#tdJSFS1').css("display", "");
                            $('#tdJSFS2').css("display", "none");
                            $('#FeesSettingDialog table tr').each(function (index) {
                                $(this).css("display", "");
                                if (index == 3) {
                                    $(this).children("td").eq(2).show();
                                    $(this).children("td").eq(3).show();
                                }
                            });
                        } else {
                            $('#tdJSFS1').css("display", "none");
                            $('#tdJSFS2').css("display", "");
                            $('#FeesSettingDialog table tr').each(function (index) {
                                if (index == 2 || index == 5 || index == 6) {
                                    $(this).css("display", "none");
                                }
                                if (index == 3) {
                                    $(this).children("td").eq(2).hide();
                                    $(this).children("td").eq(3).hide();
                                }
                            });
                        }
                        var TempCommID = $('#CommID').val();
                        $.JQForm._Data = JSON.stringify(selectedRow);
                        $.JQForm.FillForm();
                        $('#CommID').val(TempCommID);
                        switch (selectedRow.CalcType) {
                            case "0":
                                getObject("CalcType1").checked = true;
                                getObject("labelCalcType").innerHTML = "单价(元/月)";
                                break;
                            case "1":
                                getObject("CalcType2").checked = true;
                                getObject("labelCalcType").innerHTML = "周期总额(元)";
                                break;
                            case "2":
                                getObject("CalcType3").checked = true;
                                getObject("labelCalcType").innerHTML = "总金额(元)";
                                break;
                            case "3":
                                getObject("CalcType4").checked = true;
                                getObject("labelCalcType").innerHTML = "单价(元/月)";
                                $('#ContPrice').css("display", "");
                                break;
                            case "4":
                                getObject("CalcType5").checked = true;
                                getObject("labelCalcType").innerHTML = "";
                                $('#ContPrice').css("display", "none");
                                break;
                        }
                        $('#DGridContIID').val(selectedRow.IID);
                        $('#CostName').searchbox("setValue", selectedRow.CostName);
                        $('#CostID').val(selectedRow.CostID);
                        $('#StandCommName').searchbox("setValue", selectedRow.StandCommName);
                        $('#StandCommID').val(selectedRow.StandCommID);

                        $('#StandCustName').searchbox("setValue", selectedRow.CustName);
                        $('#StandCustID').val(selectedRow.CustID);

                        $('#btnOK').hide();
                        $('#btnUpdate').show();
                        $('#FeesSettingDialog').parent().appendTo($("form:first"))
                        $('#FeesSettingDialog').dialog('open');
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
                }, '-',
                {
                    text: '<div style="color:blue;">(说明：新增、修改合同标准后，必须先保存合同信息才能计算合同费用。)</div>'
                }
            ];

            var editIndex = undefined;
            function LoadDGridCont() {
                var Data = $('#hiDGridCont').val();
                var obj = JSON.parse(Data);
                if ($('#IsAuditing').text() == "已审核" || $('#IsAuditing').text() == "审核中") {
                    DGridConttoolbar = [];
                }
                $("#DGridCont").datagrid({
                    data: obj.rows,
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
                    //onDblClickRow: function (rowIndex, rowData) {
                    //    if (editIndex != undefined) {
                    //        $(this).datagrid('endEdit', editIndex);
                    //    }
                    //    $(this).datagrid('beginEdit', rowIndex);
                    //    var ed = $(this).datagrid('getEditor', { index: rowIndex, field: 'DueDate' });
                    //    $(ed.target).focus();
                    //    editIndex = rowIndex;

                    //},
                    onLoadSuccess: function (data) {

                    }
                });
            }
            LoadDGridCont();

            var FeesColumn = [[
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                //{ field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },
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
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true }, // 添加退款
                { field: 'FeesType', title: '费用状态', width: 100, align: 'left', sortable: true }
            ]];



            //费用情况
            function LoadFeesList() {
                LoadContractFeesList();
                //LoadAuditingConFeesDetailList();
            }

            function LoadContractFeesList() {
                $("#TableContainerGridFee").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    columns: FeesColumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    pagination: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Contract", "ContractFeesListEx", "TableContainerGridFee", param);
                    },
                    onLoadSuccess: function (data) {
                        var DueAmount = 0.00;
                        var PaidAmount = 0.00;
                        var PrecAmount = 0.00;
                        var WaivAmount = 0.00;
                        var DebtsAmount = 0.00;
                        var RefundAmount = 0.00;
                        //循环 计算合计内容
                        $.each(data.rows, function (i, item) {
                            DueAmount = DueAmount + parseFloat(ToDecimal(item.DueAmount, 2));
                            PaidAmount = PaidAmount + parseFloat(ToDecimal(item.PaidAmount, 2));
                            PrecAmount = PrecAmount + parseFloat(ToDecimal(item.PrecAmount, 2));
                            WaivAmount = WaivAmount + parseFloat(ToDecimal(item.WaivAmount, 2));
                            DebtsAmount = DebtsAmount + parseFloat(item.DebtsAmount);
                            RefundAmount = RefundAmount + parseFloat(item.RefundAmount);
                        });

                        //计算合计内容
                        $('#TableContainerGridFee').datagrid('reloadFooter', [
                            {
                                CommName: "合计",
                                DueAmount: ToDecimal(DueAmount, 2),
                                PaidAmount: ToDecimal(PaidAmount, 2),
                                PrecAmount: ToDecimal(PrecAmount, 2),
                                WaivAmount: ToDecimal(WaivAmount, 2),
                                DebtsAmount: ToDecimal(DebtsAmount, 2),
                                RefundAmount: ToDecimal(RefundAmount, 2)
                            }
                        ]);
                    }
                });
            }
            //LoadFeesList();
            function CaluFees() {
                if ($('#IsAuditing').text() == "已审核" || $('#IsAuditing').text() == "审核中") {
                    HDialog.Info('合同处于审核中或者合同已审核!');
                    return false;
                }
                //计算费用
                $.tool.DataPost('Contract', 'ConFeesCalc', 'ContID=' + $('#ContID').val(),
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
            function AddFees() {
                if ($('#IsAuditing').text() == "已审核" || $('#IsAuditing').text() == "审核中") {
                    HDialog.Info('合同处于审核中或者合同已审核!');
                    return false;
                }
                var w = 900;
                var h = 450;
                HDialog.Open(w, h, '../ContractNew/FeesSporadicManageByContract.aspx?OPType=Insert&ContID=' + $('#ContID').val(), '新增费用', false, function (_Data) {
                    if (_Data != '') {
                        HDialog.Info(_Data);
                        LoadFeesList();
                    }
                });
            }
            //删除费用  删除未审核和已审核费用 单条
            function DeleteFeesSingle() {
                DeleteFees();
            }
            //批量删除费用
            function DeleteFees() {
                var rows = $('#TableContainerGridFee').datagrid("getSelections");
                var IDList = "";
                var FeesID = "";
                if (rows.length == 0) {
                    HDialog.Info("请选择需要删除的费用！");
                    return false;
                }
                if ($('#IsAuditing').text() == "已审核" || $('#IsAuditing').text() == "审核中") {
                    HDialog.Info('合同处于审核中或者合同已审核!');
                    return false;
                }
                var FeesTypeStr = "未审核费用";
                var Items = rows.filter(function (e) {
                    return e.FeesType == "已审核费用";
                });
                var ItemsNo = rows.filter(function (e) {
                    return e.FeesType == "未审核费用";
                });
                if (Items.length > 1) {
                    HDialog.Info('已审核费用不允许批量删除!');
                    return false;
                }
                if (ItemsNo.length > 0 && Items.length > 0) {
                    HDialog.Info('已审核费用和未审核费用不允许同时删除!');
                    return false;
                }
                //只有一条已审核费用  或者  有多条未审核费用
                for (var i = 0; i < rows.length; i++) {

                    if (rows[i].FeesType == "未审核费用") {
                        if (IDList.length > 0) {
                            IDList += "," + rows[i].IID;
                        }
                        else {
                            IDList = rows[i].IID;
                        }
                    }
                    if (rows[i].FeesType == "已审核费用") {
                        FeesTypeStr = "已审核费用";
                        FeesID = rows[i].IID;
                    }
                }
                if (FeesTypeStr == "已审核费用") {
                    //合同签订是没有已审核费用的  在审核通过后 不允许操作费用  所以这个功能是没有必要的 
                    return;
                    //HDialog.Prompt("是否确认删除此费用", function () {
                    //    FeesOperator(rows[0], "delete");
                    //});
                } else {
                    //删除未审核费用
                    $.tool.DataPost('Contract', 'AuditingConFeesDelAndSingle', 'IDList=' + IDList + "&ContID=" + $('#ContID').val(),
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
            }

            $("#ContractType").change(function () {
                var Type = $(this).val();
                if (Type == "新签") {
                    if ($("#BtnSignTypeHistory").css("display", "none"));
                }
                if (Type == "续签") {
                    if ($("#BtnSignTypeHistory").css("display", ""));
                }
            });

            function GetLastContract(ContSort, NewContTypeCode) {
                //查询上一次ContSort和NewContTypeCode的实体
                $.tool.DataPost('Contract', 'GetLastContract', 'ContSort=' + ContSort + '&NewContTypeCode=' + NewContTypeCode,
                    function Init() {
                    },
                    function callback(_Data) {
                        $.JQForm._Data = _Data;
                        $.JQForm.FillForm();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }


            $("#BtnSignTypeHistory").click(function () {
                //var ContSort = $("#ContSort").val();
                //var NewContTypeCode = $("#NewContTypeCode").val();
                //if (ContSort != '' && NewContTypeCode != '') {
                // $('#CustID').val(data.CustID);
                if ($('#CommID').val() == "") {
                    HDialog.Info("请选择项目");
                    return;
                }
                if ($('#CustID').val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                //查看历史
                var conent = "../DialogNew/ContractRelationBrowse.aspx?CustID=" + $('#CustID').val() + "&CommID=" + $('#CommID').val();
                var w = 1024;
                var h = 500;
                HDialog.Open(w, h, conent, '合同历史', false, function callback(_Data) {
                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        GetLastContract(Obj.ContSort, Obj.NewContTypeCode);
                    }
                });

                //}
            });

            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                //debugger;
                if (IsSubmitFlag == false) {
                    HDialog.Info("10秒内不要重复点击");
                    return false;
                }

                if (ClientClick($(this).attr("id"))) {
                    IsSubmitFlag = false;
                    setTimeout('IsSubmitFlag=true', 10000);
                    var isValid = $("#ContractManage").form('validate');
                    //alert(isValid);
                    if (isValid == true) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                            HDialog.Info("请选择审批流程");
                            return false;
                        }
                        return true;
                    }
                    else {
                        return false;
                    }
                } else {
                    return false;
                }
            });

            function ClientClick(id) {
                if (id == "btnStart") {
                    //判断    本次合同金额+合同保证金≠合同费用明细金额之和
                    if ($('#ContAmount').val() != "" && $('#Margin').val() != "") {
                        var FooterRows = $('#TableContainerGridFee').datagrid("getFooterRows");
                        if (FooterRows == null) {
                            HDialog.Info("请加载合同费用列表");
                            return false;
                        }
                        var TotalDecimal = parseFloat($('#ContAmount').val()) + parseFloat($('#Margin').val()); // 合同费用之和
                        if (FooterRows[0].DueAmount != ToDecimal(TotalDecimal, 2)) {
                            HDialog.Info("本次合同金额+合同保证金≠合同费用明细金额之和，请确认；");
                            return false;
                        }
                    }
                }
                return true;
            }

            // 单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if ($('#NewContType').val() == "") {
                    HDialog.Info("请输入选择合同类别");
                    return;
                }
                //获取审批流程
                $.tool.DataPostAsync('AuditCorpCostItemContract', 'List', 'AuditType=5&page=1&rows=10000&ContractType=' + $('#NewContType').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            var Items = eval("(" + _Data + ")");
                            if (Items.rows.length == 0) {
                                HDialog.Info("请设置合同签订流程后再进行操作!");
                                return;
                            }
                            var FlowId = "";
                            for (var i = 0; i < Items.rows.length; i++) {
                                if (FlowId == "") {
                                    FlowId = Items.rows[i].WorkFlowID;
                                } else {
                                    FlowId += "," + Items.rows[i].WorkFlowID;
                                }
                            }
                            if ($("#IsAuditing").text() == "未启动" || $("#IsAuditing").text() == "已驳回") {
                                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=1201&biaoshi=1&FlowId=" + FlowId + "&random=" + Math.random();
                                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                                    if (_Data != '') {
                                        var obj = JSON.parse(_Data);
                                        LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                                        document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                                        document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                                    }
                                });
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }

        </script>
    </form>
</body>
</html>
