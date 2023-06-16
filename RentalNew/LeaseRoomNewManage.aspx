<%@ Page Language="c#" CodeBehind="LeaseRoomNewManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.RentalNew.LeaseRoomNewManage" %>

<!DOCTYPE HTML>
<html>
<head>
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
        td,th {
            font-family: 微软雅黑;
        }
        .tabs-container ul {
            background-color: #F6F6F6;
        }
        
    </style>
    <script language="javascript">
		<!--

    function CheckData() {
        if (LeaseRoomManage.CustName.value == "") {
            HDialog.Info("请输入客户名称,此项不能为空!");
            LeaseRoomManage.CustName.focus();
            return false;
        }

        var strresults = getObject("results").innerHTML;

        if ((strresults != "") && (strresults != "新的登录账号！")) {
            HDialog.Info(strresults);
            LeaseRoomManage.InquireAccount.focus();
            return false;
        }

        if (LeaseRoomManage.Linkman.value == "") {
            HDialog.Info("请输入联系人,此项不能为空!");
            LeaseRoomManage.Linkman.focus();
            return false;
        }
        if (LeaseRoomManage.LinkmanTel.value == "") {
            HDialog.Info("请输入联系人电话,此项不能为空!");
            LeaseRoomManage.LinkmanTel.focus();
            return false;
        }

        return true;
    }

    function CheckAccount() {
        var strInquireAccount = LeaseRoomManage.InquireAccount.value;
        var strOldAccount = LeaseRoomManage.OldAccount.value;
        getObject("results").innerHTML = "";
        //HDialog.Info(strLoginCode);

        Request.sendPOST("../House/CheckAccount.aspx", "InquireAccount=" + strInquireAccount + "&OldAccount=" + strOldAccount, callbackAccount)

    }
    function callbackAccount(xmlHttp) {
        //HDialog.Info(xmlHttp.responseText);
        var varReturn = xmlHttp.responseText;
        getObject("results").innerHTML = varReturn;
    }


    function btnFileUp_Onclick() {
        if (LeaseRoomManage.AdjunctName.value == "") {
            HDialog.Info("请输入文件附件名称,此项不能为空!");
            LeaseRoomManage.AdjunctName.focus();
            return false;
        }

        if (LeaseRoomManage.btnFile.value == "") {
            HDialog.Info("请选择要上传的本地文件!");
            LeaseRoomManage.btnFile.focus();
            return false;
        }

        return true;
    }

    function btnChangeName_Onclick() {
        var strCustID = LeaseRoomManage.CustID.value;

        var varReturn = showModalDlg("../dialog/CustChangeNameDlg.aspx?CustID=" + strCustID, "", 500, 300);

        //HDialog.Info(varReturn);
        if (varReturn != "") {//**获得返回的参数信息

            var varObjects = varReturn.split("\t");

            LeaseRoomManage.CustName.value = varObjects[0];
        }
    }


    function showIsUnit(expid1, expid2) {
        if (getObject(expid1).style.display == "none") {
            getObject(expid1).style.display = "";
            getObject(expid2).style.display = "none";
        }
        else {
            getObject(expid1).style.display = "none";
            getObject(expid2).style.display = "";
        }
    }

    function OnFormload() {

        if (LeaseRoomManage.IsUnit1.checked) {
            getObject('Table2').style.display = "";
            getObject('Table3').style.display = "none";
        }
        else {
            getObject('Table2').style.display = "none";
            getObject('Table3').style.display = "";
        }
    }





    function btnDel_onclick() {
        var strContID = getObject("ContID").value;

        window.showModalDialog("../dialog/FeesAmendContDelDlg.aspx?ContID=" + strContID + "", "window", "dialogWidth=400px;dialogHeight=220px;status:no;help:no;resizable:no;scroll:no");

        fnInit();
        return true;
    }

    function Win_OnLoad() {
        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }
    //-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body onload="OnFormload();" style="overflow-y: auto;">
    <form id="LeaseRoomManage" method="post" runat="server">
        <input style="width: 25px; height: 22px" id="hiOPType" size="1" type="hidden" name="hiOPType" runat="server">
        <input style="width: 25px; height: 22px" id="CustID" size="1" type="hidden" name="CustID" runat="server">
        <input style="width: 25px; height: 22px" id="RoomCount" size="1" type="hidden" name="RoomCount" runat="server">
        <input style="width: 25px; height: 22px" id="RoomID" size="1" type="hidden" name="RoomID" runat="server">
        <input style="width: 25px; height: 22px" id="LiveID" size="1" type="hidden" name="LiveID" runat="server">
        <input style="width: 32px; height: 22px" id="hitype" size="1" type="hidden" name="hitype" runat="server">
        <input style="width: 24px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server">
        <input style="width: 25px; height: 22px" id="ContID" size="1" type="hidden" name="ContID" runat="server">
        <input style="width: 16px; height: 22px" id="NoEdit" size="1" type="hidden" name="NoEdit"
            runat="server">
        <input style="width: 16px; height: 22px" id="IsAuditing" size="1" type="hidden" name="IsAuditing"
            runat="server">
        <input style="z-index: 0; width: 16px; height: 22px" id="IsCheck" size="1" type="hidden"
            name="IsCheck" runat="server">


        <div id="DivBottom" style="width: 100%; overflow-y: auto">
            <div class="tabs-container">
                <ul class="nav nav-tabs">
                    <li class="active" id="fwxx" name="fwxx" refpage="fwxx" refsel="1"><a data-toggle="tab" href="#tab-14" aria-expanded="true">房屋租赁信息</a>
                    </li>
                    <li class="" id="htdj" name="htdj" refpage="htdj" refsel="0"><a data-toggle="tab" href="#tab-11" aria-expanded="true">进场验房情况</a>
                    </li>

                    <li class="" name="jfbz" id="jfbz" refpage="jfbz" refsel="0"><a data-toggle="tab" href="#tab-12" aria-expanded="false">房屋装修情况</a>
                    </li>
                    <li class="" name="htfy" id="htfy" refpage="htfy" refsel="0"><a data-toggle="tab" href="#tab-13" aria-expanded="false">撤场验收情况</a>
                    </li>

                </ul>
                <div class="tab-content">
                    <div id="tab-14" class="tab-pane active">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div id="DivTop" style="width: 100%; overflow-y: auto">
                                    <table id="Table1" class="DialogTable">
                                        <tr>
                                            <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">房屋信息</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">房屋编号</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <div style="border: 1px solid #cccccc;">
                                                    <asp:Label ID="RoomSign" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">房屋名称</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="RoomName" class="easyui-validatebox" name="MobilePhone"
                                                    runat="server"></td>

                                            <td class="TdTitle" style="width: 10%; height: 26px;">开始时间</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="StartDate" class="Wdate" onkeypress="CheckSmallDate();" onclick="WdatePicker()"
                                                    name="StartDate" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">结束时间</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="EndDate" class="Wdate" onkeypress="CheckSmallDate();" onclick="WdatePicker()"
                                                    name="EndDate" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">续约时间至</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="ReletDate" class="Wdate" onkeypress="CheckSmallDate();" readonly
                                                    name="ReletDate" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">退租时间</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="ChargeTime" onkeypress="CheckSmallDate();" readonly
                                                    name="ReletDate" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">退租原因</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="ChargeCause" onkeypress="CheckSmallDate();" readonly
                                                    name="ReletDate" runat="server"></td>

                                        </tr>
                                        <tr>
                                            <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">客户基本信息</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">租户名称</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">&nbsp;&nbsp;&nbsp;
                                                <input id="CustName" class="easyui-validatebox" readonly style="float: left; width: 50%" name="CustName" runat="server">
                                                <input id="btnChangeName" class="button" tabindex="1" onclick="javascript: if (btnChangeName_Onclick() == false) return false;" value="更名" type="button" name="btnChangeName" style="width: 48px; height: 24px" runat="server">
                                            </td>

                                            <td class="TdTitle" style="width: 10%; height: 26px;">出入证号</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="PassSign" class="easyui-validatebox" name="PassSign"
                                                    runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">证件名称</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <asp:DropDownList ID="PaperName" runat="server"></asp:DropDownList></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">证件号码</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="PaperCode" class="easyui-validatebox" name="PaperCode" runat="server"></td>

                                        </tr>

                                        <tr>


                                            <td class="TdTitle" style="width: 10%; height: 26px;">客户类别</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <select id="CustTypeID" name="CustTypeID" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">固定电话</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="FixedTel" class="easyui-validatebox" name="FixedTel" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">移动电话</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="MobilePhone" class="easyui-validatebox" name="MobilePhone" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">传真电话</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="FaxTel" class="easyui-validatebox" name="FaxTel" runat="server"></td>
                                        </tr>
                                        <tr>


                                            <td class="TdTitle" style="width: 10%; height: 26px;">联系地址</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="Address" class="easyui-validatebox" name="Address" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">邮政编码</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="PostCode" class="easyui-validatebox" name="PostCode" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">收 件 人</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="Recipient" class="easyui-validatebox" name="Recipient" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">电子邮件</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="EMail" class="easyui-validatebox" name="EMail" runat="server">
                                            </td>
                                        </tr>
                                        <tr>


                                            <td class="TdTitle" style="width: 10%; height: 26px;">联系人</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="Linkman" class="easyui-validatebox" data-options="required:true" name="Linkman" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">联系人电话</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="LinkmanTel" maxlength="11"
                                                    name="LinkmanTel" runat="server" class="easyui-validatebox" data-options="required:true"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">
                                                <input style="width: 31px; height: 22px" id="OldAccount" size="1" type="hidden" name="OldAccount"
                                                    runat="server">登录账号</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input onblur="javascript:CheckAccount();" id="InquireAccount" class="Control_ItemInput"
                                                    name="InquireAccount" runat="server">
                                                <div id="results" class="font_red"></div>
                                            </td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;"></td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="IsUnit1" onclick="javascript: showIsUnit('Table2', 'Table3');" value="0" checked
                                                    type="radio" name="IsUnit" runat="server">个人客户<input id="IsUnit2" onclick="javascript: showIsUnit('Table2', 'Table3');" value="1" type="radio" name="IsUnit" runat="server">单位客户</td>
                                        </tr>

                                    </table>

                                    <table id="Table2" class="DialogTable">
                                        <tr>
                                            <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">个人客户信息</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">姓</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="Surname" class="Control_ItemInput" name="Surname" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">名字</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="Name" class="Control_ItemInput" name="Name" runat="server"></td>

                                            <td class="TdTitle" style="width: 10%; height: 26px;">性别</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <select id="Sex" name="Sex" runat="server">
                                                    <option selected></option>
                                                </select></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">国籍</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <asp:DropDownList ID="Nationality" runat="server"></asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">出生日期</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <select id="nYear" name="nYear" runat="server">
                                                    <option selected></option>
                                                </select>年<select id="nMonth" name="nMonth" runat="server">
                                                    <option selected></option>
                                                </select>月<select id="nDay" name="nDay" runat="server">
                                                    <option selected></option>
                                                </select>日<input style="width: 20px; height: 19px" id="Birthday" class="Control_ItemInput" maxlength="10"
                                                    size="10" type="hidden" name="Birthday" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">工作单位</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="WorkUnit" class="Control_ItemInput" name="WorkUnit" runat="server"></td>

                                            <td class="TdTitle" style="width: 10%; height: 26px;">兴趣爱好</td>
                                            <td class="TdContentSearch" style="width: 15%; height: 26px;" colspan="3">
                                                <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
                                        </tr>
                                    </table>

                                    <table id="Table3" class="DialogTable">
                                        <tr>
                                            <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">单位客户信息</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">法定代表人</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="LegalRepr" class="Control_ItemInput" name="LegalRepr" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">法定代表人电话</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="LegalReprTel" class="Control_ItemInput" name="LegalReprTel" runat="server"></td>

                                            <td class="TdTitle" style="width: 10%; height: 26px;">负责人</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="Charge" class="Control_ItemInput" name="Charge" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">负责人电话</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="ChargeTel" class="Control_ItemInput" name="ChargeTel" runat="server"></td>
                                        </tr>
                                    </table>
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
                                    <table id="Table4" class="DialogTable">
                                        <tr>
                                            <td colspan="8" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">银行代扣信息</span> </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">银行名称</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="BankName" class="Control_ItemInput" name="BankName" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">银行户名</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="BankIDs" class="Control_ItemInput" name="BankIDs" runat="server"></td>

                                            <td class="TdTitle" style="width: 10%; height: 26px;">银行账号</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="BankAccount" class="Control_ItemInput" name="BankAccount" runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">确认银行账号</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="BankAccountTwo" class="Control_ItemInput" name="BankAccountTwo"
                                                    runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">代收协议编号</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;">
                                                <input id="BankAgreement" class="Control_ItemInput" name="BankAgreement"
                                                    runat="server"></td>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">备注</td>
                                            <td class="TdContent" style="width: 15%; height: 26px;" colspan="5">
                                                <textarea id="Memo" rows="3" cols="50" name="Memo" runat="server"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle" style="width: 10%; height: 26px;">文件上传</td>
                                            <td class="TdContent" colspan="7" style="width: 90%;"> <span style="float:left">文件说明：</span> <INPUT  id="AdjunctName"  class="easyui-validatebox" style="float:left;width:300px;"
											                    name="AdjunctName" runat="server"><input style="float: left" id="btnFile" tabindex="1" type="file"
                                                name="btnFile" runat="server"><input style="float: left; height: 24px; width: 45px;" id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                                                    value="上传" type="button" name="btnFileUp" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="formTable_ItemInput" colspan="8">
                                                <asp:DataGrid Style="font-size: 12px" ID="DGrid" runat="server" Width="100%" AutoGenerateColumns="False"
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
                                                </asp:DataGrid>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" style="height: 6px"></td>
                                        </tr>
                                        <tr>
                                            <td class="formTable_Footer" colspan="8" align="center">
                                                <input id="btnSave" class="button" onclick="javascript: if (CheckData() == false) return false;"
                                                    value="保存" type="button" name="btnFilter" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												                        &nbsp;&nbsp;&nbsp;
                                                <input id="btnReturn" class="button" value="关闭" type="button"
                                                    name="btnFilter" runat="server"></td>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-11" class="tab-pane ">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer1">1</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-12" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer2">2</div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-13" class="tab-pane">
                        <div class="panel-body" style="padding: 0px;">
                            <div class="Frm">
                                <div class="SearchContainer" id="TableContainer3">3</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">


            var toolbar1 = [
                   {
                       text: '新增',
                       iconCls: 'icon-add',
                       handler: function () {
                           var w = 700;
                           var h = 450;
                           var Params = "";
                           Params = Params + "&CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').val();
                           Params = Params + "&RoomID=" + $('#RoomID').val() + "&RoomSign=" + $('#RoomSign').html();
                           Params = Params + "&LiveID=" + $('#LiveID').val();
                           HDialog.Open(w, h, '../HouseNew/HousingInspManage.aspx?OPType=Insert' + Params, '新增验房纪录', false, function (_Data) {
                               if (_Data == '1') {
                                   LoadHousingInspList();
                               }
                           });
                       }
                   }, '-', {
                       text: '修改',
                       iconCls: 'icon-save',
                       handler: function () {
                           var row = $("#TableContainer1").datagrid("getSelected");
                           if (row != null) {
                               if (row.InspID != 0) {
                                   var w = 700;
                                   var h = 450;
                                   HDialog.Open(w, h, '../HouseNew/HousingInspManage.aspx?OPType=Edit&InspID=' + row.InspID + '&LiveID=' + $('#LiveID').val(), '修改验房纪录', false, function (_Data) {
                                       if (_Data == '1') {
                                           LoadHousingInspList();
                                       }
                                   });
                               }
                               else {
                                   HDialog.Info('请选择要编辑的信息');
                               }
                           } else {
                               HDialog.Info('请选择要编辑的信息');

                           }

                       }
                   }, '-', {
                       text: '删除',
                       iconCls: 'icon-cancel',
                       handler: function () {

                           var row = $("#TableContainer1").datagrid("getSelected");
                           if (row != null) {
                               if (row.InspID != 0) {

                                   $.tool.DataPostChk('LeaseRoomManage', 'RoomRental', 'HousingInspDelete', 'InspID=' + row.InspID,
                                       function Init() {
                                       },
                                       function callback(_Data) {
                                           var r = _Data.split('|');
                                           HDialog.Info(r[1]);
                                           if (r[0] == "true") {
                                               LoadHousingInspList();
                                           }


                                       },
                                       function completeCallback() {
                                       },
                                       function errorCallback() {
                                       });
                               }
                               else {
                                   HDialog.Info('请选择要删除的信息');
                               }
                           } else {


                           }

                       }
                   }, '-', {
                       text: '进场验收明细',
                       iconCls: 'icon-edit',
                       handler: function () {
                           var w = 700;
                           var h = 450;
                           var row = $("#TableContainer1").datagrid("getSelected");
                           if (row != null) {
                               //alert(row.RoomID);
                               if (row.InspID != "") {
                                   HDialog.Open(w, h, '../HouseNew/HousingProjBatMagage.aspx?InspID=' + row.InspID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '进场验收明细', false, function (_Data) {
                                       if (_Data == '1') {
                                           LoadHousingInspList();
                                       }
                                   });
                               } else {
                                   HDialog.Info('请选择数据');
                               }
                           } else {
                               HDialog.Info('请选择数据');
                           }

                       }
                   }, '-', {
                       text: '进场交接明细',
                       iconCls: 'icon-edit',
                       handler: function () {
                           var w = 700;
                           var h = 450;
                           var row = $("#TableContainer1").datagrid("getSelected");
                           if (row != null) {
                               //alert(row.RoomID);
                               if (row.InspID != "") {
                                   HDialog.Open(w, h, '../HouseNew/DataTransferBatMagage.aspx?InspID=' + row.InspID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '进场交接明细', false, function (_Data) {
                                       if (_Data == '1') {
                                           LoadHousingInspList();
                                       }
                                   });
                               } else {
                                   HDialog.Info('请选择数据');
                               }
                           } else {
                               HDialog.Info('请选择数据');
                           }

                       }
                   }
            ];

            var toolbar2 = [
             {
                 text: '新增',
                 iconCls: 'icon-add',
                 handler: function () {
                     var w = 850;
                     var h = 550;

                     var Params = "";
                     Params = Params + "&CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').val();
                     Params = Params + "&RoomID=" + $('#RoomID').val() + "&RoomSign=" + $('#RoomSign').html();
                     Params = Params + "&LiveID=" + $('#LiveID').val();


                     HDialog.Open(w, h, '../RenovationNew/RenoCustManage.aspx?OPType=Insert' + Params, '装修登记', false, function (_Data) {
                         if (_Data == '1') {
                             LoadRenoCustList();
                         }

                     });


                 }
             }, '-', {
                 text: '修改',
                 iconCls: 'icon-save',
                 handler: function () {
                     var row = $("#TableContainer2").datagrid("getSelected");
                     if (row != null) {
                         if (row.InspID != 0) {
                             var w = 850;
                             var h = 550;

                             HDialog.Open(w, h, '../RenovationNew/RenoCustManage.aspx?OPType=Edit&RenoID=' + row.RenoID + '&LiveID=' + row.LiveID, '修改装修登记', false, function (_Data) {
                                 if (_Data == '1') {
                                     LoadRenoCustList();
                                 }
                             });
                         }
                         else {
                             HDialog.Info('请选择要编辑的信息');
                         }
                     } else {
                         HDialog.Info('请选择要编辑的信息');

                     }

                 }
             }, '-', {
                 text: '删除',
                 iconCls: 'icon-cancel',
                 handler: function () {
                     var row = $("#TableContainer2").datagrid("getSelected");
                     if (row != null) {
                         if (row.InspID != 0) {

                             $.tool.DataPostChk('LeaseRoomManage', 'RoomRental', 'RenoCustDelete', 'RoomID=' + row.RenoID,
                                 function Init() {
                                 },
                                 function callback(_Data) {
                                     var r = _Data.split('|');
                                     HDialog.Info(r[1]);
                                     if (r[0] == "true") {
                                         LoadRenoCustList();
                                     }
                                 },
                                 function completeCallback() {
                                 },
                                 function errorCallback() {
                                 });
                         }
                         else {
                             HDialog.Info('请选择要删除的信息');
                         }
                     } else {

                     }
                 }
             }
            ];
            var toolbar3 = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        var w = 850;
                        var h = 450;

                        var Params = "";
                        Params = Params + "&CustID=" + $('#CustID').val() + "&CustName=" + $('#CustName').val();
                        Params = Params + "&RoomID=" + $('#RoomID').val() + "&RoomSign=" + $('#RoomSign').html();
                        Params = Params + "&LiveID=" + $('#LiveID').val();


                        HDialog.Open(w, h, '../HouseNew/HousingDismantlingManage.aspx?OPType=Insert' + Params, '撤场记录', false, function (_Data) {
                            if (_Data == '1') {
                                LoadDismantlingList();
                            }

                        });
                    }
                }, '-', {
                    text: '修改',
                    iconCls: 'icon-save',
                    handler: function () {
                        //M_Main/House/HousingDismantlingManage.aspx?OPType=Edit&DismantlingID=100001000000001&LiveID=201605191421185104
                        var row = $("#TableContainer3").datagrid("getSelected");
                        if (row != null) {
                            if (row.InspID != 0) {
                                var w = 850;
                                var h = 450;
                                HDialog.Open(w, h, '../HouseNew/HousingDismantlingManage.aspx?OPType=Edit&DismantlingID=' + row.DismantlingID + '&LiveID=' + $('#LiveID').val(), '修改撤场记录', false, function (_Data) {
                                    if (_Data == '1') {
                                        LoadDismantlingList();
                                    }
                                });
                            }
                            else {
                                HDialog.Info('请选择要编辑的信息');
                            }
                        } else {
                            HDialog.Info('请选择要编辑的信息');
                        }
                    }
                }, '-', {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer3").datagrid("getSelected");
                        if (row != null) {
                            if (row.InspID != 0) {
                                $.tool.DataPostChk('LeaseRoomManage', 'RoomRental', 'DismantlingDelete', 'DismantlingID=' + row.DismantlingID,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        var r = _Data.split('|');
                                        HDialog.Info(r[1]);
                                        if (r[0] == "true") {
                                            LoadDismantlingList();
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                            else {
                                HDialog.Info('请选择要删除的信息');
                            }
                        } else {
                        }
                    }
                }, '-', {
                    text: '撤场验收明细',
                    iconCls: 'icon-edit',
                    handler: function () {
                        //M_Main/House/HousingDismantlingDetailManage.aspx?DismantlingID=100001000000001&LiveID=201605191421185104&CustID=10000100000001&RoomID=10000100001082
                        var w = 850;
                        var h = 450;
                        var row = $("#TableContainer3").datagrid("getSelected");
                        if (row != null) {
                            //alert(row.RoomID);
                            if (row.InspID != "") {
                                HDialog.Open(w, h, '../HouseNew/HousingDismantlingDetailManage.aspx?DismantlingID=' + row.DismantlingID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '撤场验收明细', false, function (_Data) {
                                    if (_Data == '1') {
                                        LoadDismantlingList();
                                    }
                                });
                            } else {
                                HDialog.Info('请选择数据');
                            }
                        } else {
                            HDialog.Info('请选择数据');
                        }

                    }
                }, '-', {
                    text: '撤场交接明细',
                    iconCls: 'icon-edit',
                    handler: function () {
                        ///M_Main/House/HousingDismantlingHandoverDetailManage.aspx?DismantlingID=100001000000001&LiveID=201605191421185104&CustID=10000100000001&RoomID=10000100001082
                        var w = 850;
                        var h = 450;
                        var row = $("#TableContainer3").datagrid("getSelected");
                        if (row != null) {
                            //alert(row.RoomID);
                            if (row.InspID != "") {
                                HDialog.Open(w, h, '../HouseNew/HousingDismantlingHandoverDetailManage.aspx?DismantlingID=' + row.InspID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '撤场交接明细', false, function (_Data) {
                                    if (_Data == '1') {
                                        LoadDismantlingList();
                                    }
                                });
                            } else {
                                HDialog.Info('请选择数据');
                            }
                        } else {
                            HDialog.Info('请选择数据');
                        }

                    }
                }
            ];


            function InitDiv() {
                var H = $(window).height();

                //$('#DivTop').css('height', DivH + 'px');

                $('#DivBottom').css('height', H + 'px');
                H = H - 42;
                $('#DivTop').css('height', H + 'px');

                H = H + 4;
                $('#TableContainer1').css('height', H + 'px');
                $('#TableContainer2').css('height', H + 'px');
                $('#TableContainer3').css('height', H + 'px');

                if ($('#hiOPType').val() == 'Detail') {
                    $('#btnSave').hide();
                    $('#btnChangeName').hide();


                toolbar1 = [
               
                  {
                   text: '进场验收明细',
                   iconCls: 'icon-edit',
                   handler: function () {
                       var w = 700;
                       var h = 450;
                       var row = $("#TableContainer1").datagrid("getSelected");
                       if (row != null) {
                           //alert(row.RoomID);
                           if (row.InspID != "") {
                               HDialog.Open(w, h, '../HouseNew/HousingProjBatMagage.aspx?InspID=' + row.InspID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '进场验收明细', false, function (_Data) {
                                   if (_Data == '1') {
                                       LoadHousingInspList();
                                   }
                               });
                           } else {
                               HDialog.Info('请选择数据');
                           }
                       } else {
                           HDialog.Info('请选择数据');
                       }

                   }
               }, '-', {
                   text: '进场交接明细',
                   iconCls: 'icon-edit',
                   handler: function () {
                       var w = 700;
                       var h = 450;
                       var row = $("#TableContainer1").datagrid("getSelected");
                       if (row != null) {
                           //alert(row.RoomID);
                           if (row.InspID != "") {
                               HDialog.Open(w, h, '../HouseNew/DataTransferBatMagage.aspx?InspID=' + row.InspID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '进场交接明细', false, function (_Data) {
                                   if (_Data == '1') {
                                       LoadHousingInspList();
                                   }
                               });
                           } else {
                               HDialog.Info('请选择数据');
                           }
                       } else {
                           HDialog.Info('请选择数据');
                       }

                   }
               }];

                     toolbar2 = [
                     
                    ];
                     toolbar3 = [
                       {
                            text: '撤场验收明细',
                            iconCls: 'icon-edit',
                            handler: function () {
                                //M_Main/House/HousingDismantlingDetailManage.aspx?DismantlingID=100001000000001&LiveID=201605191421185104&CustID=10000100000001&RoomID=10000100001082
                                var w = 850;
                                var h = 450;
                                var row = $("#TableContainer3").datagrid("getSelected");
                                if (row != null) {
                                    //alert(row.RoomID);
                                    if (row.InspID != "") {
                                        HDialog.Open(w, h, '../HouseNew/HousingDismantlingDetailManage.aspx?DismantlingID=' + row.DismantlingID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '撤场验收明细', false, function (_Data) {
                                            if (_Data == '1') {
                                                LoadDismantlingList();
                                            }
                                        });
                                    } else {
                                        HDialog.Info('请选择数据');
                                    }
                                } else {
                                    HDialog.Info('请选择数据');
                                }

                            }
                        }, '-', {
                            text: '撤场交接明细',
                            iconCls: 'icon-edit',
                            handler: function () {
                                ///M_Main/House/HousingDismantlingHandoverDetailManage.aspx?DismantlingID=100001000000001&LiveID=201605191421185104&CustID=10000100000001&RoomID=10000100001082
                                var w = 850;
                                var h = 450;
                                var row = $("#TableContainer3").datagrid("getSelected");
                                if (row != null) {
                                    //alert(row.RoomID);
                                    if (row.InspID != "") {
                                        HDialog.Open(w, h, '../HouseNew/HousingDismantlingHandoverDetailManage.aspx?DismantlingID=' + row.InspID + '&&LiveID=' + row.LiveID + '&&CustID=' + row.CustID + '&&RoomID=' + row.RoomID, '撤场交接明细', false, function (_Data) {
                                            if (_Data == '1') {
                                                LoadDismantlingList();
                                            }
                                        });
                                    } else {
                                        HDialog.Info('请选择数据');
                                    }
                                } else {
                                    HDialog.Info('请选择数据');
                                }

                            }
                        }
                    ];


                }
            }
            InitDiv();

            $('#btnReturn').click(function () {
                HDialog.Close();
            })


            $(".tabs-container li").click(function () {

                switch ($(this).attr("name")) {

                    case "htdj":
                        setTimeout("LoadHousingInspList()", 10);
                        break;
                    case "jfbz":
                        setTimeout("LoadRenoCustList()", 10)
                        break;
                    case "htfy":
                        setTimeout("LoadDismantlingList()", 10);
                        break;

                }


            });

            var Housingcolumn = [[
                { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                {
                    field: 'InspDate', title: '验房日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.InspDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'InspRepr', title: '验房代表', width: 100, align: 'left', sortable: true },
                { field: 'AccoRepr', title: '陪同代表', width: 100, align: 'left', sortable: true },
                { field: 'RectificationState', title: '整改状态', width: 100, align: 'left', sortable: true }
            ]];
            var RenoCustcolumn = [[
                { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'RenoPermitSign', title: '许可证号', width: 100, align: 'left', sortable: true },
                { field: 'ConsUnit', title: '施工单位', width: 180, align: 'left', sortable: true },
                {
                    field: 'ApplyDate', title: '开工时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ApplyDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'ActRenoEndDate', title: '完工时间', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ActRenoEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'RuleCount', title: '违章次数', width: 100, align: 'left', sortable: true }
            ]];
            var Dismantlingcolumn = [[
                 { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                {
                    field: 'DismantlingDate', title: '撤场日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.DismantlingDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'InspRepr', title: '验房代表', width: 100, align: 'left', sortable: true },
                { field: 'AccoRepr', title: '陪同代表', width: 100, align: 'left', sortable: true },
                { field: 'RectificationState', title: '整改状态', width: 100, align: 'left', sortable: true }
            ]];


            function LoadHousingInspList() {

                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Housingcolumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar1,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RoomRental", "HousingInspList", "TableContainer1", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }

            function LoadRenoCustList() {

                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: RenoCustcolumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar2,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RoomRental", "RenoCustList", "TableContainer2", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });
            }

            function LoadDismantlingList() {

                $("#TableContainer3").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Dismantlingcolumn,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar3,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RoomRental", "DismantlingList", "TableContainer3", param);
                    },
                    onLoadSuccess: function (data) {

                    }
                });

            }

            LoadHousingInspList();

        </script>
    </form>

</body>
</html>
