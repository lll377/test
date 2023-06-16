<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReimbursementManage.aspx.cs" Inherits="M_Main.OAPublicWorkNew.ReimbursementManage" %>

<%@ Register TagPrefix="uc1" TagName="WorkFlowNew" Src="../UserControl/WorkFlowNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="WebOffice" Src="../UserControl/WebOffice.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CheckLevelNew" Src="../UserControl/CheckLevelNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DivLine" Src="../UserControl/DivLine.ascx" %>
<!DOCTYPE html>

<html>
<head>
    <title>报账申请</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <link href="../css/oaeditwindow.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <style type="text/css">
        .HrefStyle {
            color: darkblue;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }

        function NoPrevious() {
            if (document.all.TxtDealResult.value == "") {
                window.alert("处理意见不能为空,请填写处理意见");
                return false;
            }
            if (!IsAllowYes("驳回")) {
                return false;
            }
            DisabledBtn();
            return true;
        }

        function NoPassCheck() {
            if (document.all.TxtDealResult.value == "") {
                window.alert("处理意见不能为空,请填写处理意见");
                return false;
            }
            if (!IsAllowYes("审批不通过")) {
                return false;
            }
            DisabledBtn();
            return true;
        }
        function IsAllowYes(txtstr) {
            var r = window.confirm("是否确认" + txtstr);
            if (r == true) {
                return true;
            } else {
                return false;
            }
            return false;
        }
        var IsSubmitFlag = true;
        function DisabledBtn() {
            if (document.all.btnRemind != null) document.all.btnRemind.style.display = 'none';
            if (document.all.btnJump != null) document.all.btnJump.style.display = 'none';
            if (document.all.btnReturn != null) document.all.btnReturn.style.display = 'none';
            if (document.all.BtnReadOver != null) document.all.BtnReadOver.style.display = 'none';
            if (document.all.BtnReturnPrevious != null) document.all.BtnReturnPrevious.style.display = 'none';
            if (document.all.BtnCheckNoPass != null) document.all.BtnCheckNoPass.style.display = 'none';
            if (document.all.BtnCheckPass != null) document.all.BtnCheckPass.style.display = 'none';
            if (document.all.BtnIsPrint != null) document.all.BtnIsPrint.style.display = 'none';
            if (document.all.BtnSaveStartWorkFlow != null) document.all.BtnSaveStartWorkFlow.style.display = 'none';
            if (document.all.BtnCompleteCheckLevel != null) document.all.BtnCompleteCheckLevel.style.display = 'none';
            if (document.all.BtnDealInfo != null) document.all.BtnDealInfo.style.display = 'none';
            if (document.all.BtnSaveDraft != null) document.all.BtnSaveDraft.style.display = 'none';
            if (checkIsNullWorkNode() == false) {
                return false;
            }

            if (IsSubmitFlag == false) {
                ShowInfo("30秒内不要重复点击");
                return;
            }
            IsSubmitFlag = false;
            setTimeout('IsSubmitFlag=true', 30000);

            return true;
        }

        function btnSelDep_OnClick() {

            var strPage = "../OAWorkFlowNew/SelOpr.aspx?Cmd=1&WorkInfoId=-1&random=" + Math.random()
            HDialog.Open('800', '544', strPage, '选择部门', false, function callback(_Data) {

                if (_Data != '') {

                    var Ret = Cache.GetData("SelOrp.aspx_Return");
                    var obj = JSON.parse(Ret);
                    var TempUserList = "";
                    if (obj != null) {
                        var arrUserList = obj[0].split('|');

                        var arrUser = new Array();

                        arrUser = arrUserList[0].split(',');

                        document.all.UseDepart.value = arrUser[0];
                    }
                }
            });
        }

    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <input id="PrintParms" style="width: 24px; height: 21px" type="hidden" size="1" name="PrintParms"
            runat="server"><input id="HiddenUserCode" style="width: 24px; height: 21px" type="hidden" size="1" name="PrintParms"
                runat="server"><input id="WorkFlowTypeId" style="width: 64px; height: 17px" type="hidden" size="5" name="InfoId"
                    runat="server">
        <input id="HiddenRealUserCode" style="width: 64px; height: 17px" type="hidden" size="5"
            name="InfoId" runat="server"><br>
        <br>
        <br>
        <table class="TablebackGround" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td class="TablebackGroundButton">
                    <input language="javascript" class="button_six" id="btnRemind" style="height: 22px" type="submit"
                        value="催办" runat="server" onclick="return DisabledBtn();" name="btnRemind"><input language="javascript" class="button_six" id="btnJump" style="height: 22px" type="submit"
                            value="跳过" runat="server" onclick="return DisabledBtn();" name="btnJump"><input class="button_six" id="btnReturn" style="height: 22px" onclick="window.history.back();"
                                type="button" value="返回列表" name="btnReturn" runat="server"><input style="z-index: 0; display: none; height: 22px" id="BtnDealInfo" class="button_six"
                                    onclick="DisabledBtn();" value="会签意见" type="button" name="BtnReadOver" runat="server"><input style="z-index: 0; display: none; height: 22px; color: red" id="BtnCompleteCheckLevel"
                                        class="button_six" onclick="DisabledBtn();" value="批转结束" type="button" name="BtnCompleteCheckLevel" runat="server"><input class="button_six" id="BtnReadOver" style="height: 22px; color: red" type="submit"
                                            value="会签结束" name="BtnReadOver" runat="server" onclick="return DisabledBtn();"><input class="button_six" id="BtnReturnPrevious" style="height: 22px" type="submit" value="驳回"
                                                name="BtnReturnPrevious" runat="server" onclick="return NoPrevious();"><input class="button_six" id="BtnCheckNoPass" style="height: 22px" type="submit" value="审批不通过"
                                                    onclick="return NoPassCheck();" name="BtnCheckNoPass" runat="server"><input class="button_six" id="BtnCheckPass" style="height: 22px" type="submit" value="审批通过"
                                                        name="BtnCheckPass" runat="server" onclick="return DisabledBtn();"><input language="javascript" class="button_six" id="BtnIsPrint" style="height: 22px" type="button"
                                                            value="打印" name="BtnIsPrint" runat="server"><input class="button_six" id="BtnSaveStartWorkFlow" style="height: 22px" onclick="return checkValue();"
                                                                type="submit" value="送审" name="btnFilter" runat="server"><input class="button_six" id="BtnSaveDraft" style="height: 22px" onclick="return checkValue();"
                                                                    type="submit" value="保存草稿" name="BtnSaveDraft" runat="server">
                </td>
            </tr>
        </table>
        <div class="ContentButtonDiv" id="DvFrame">
            <div class="ContentButtonUp" id="Dv1" onclick="SetStyle(this)">基本信息</div>
            <div class="ContentButtonUp" id="Dv2" onclick="SetStyle(this)">详细信息</div>
            <div class="ContentButtonUp" id="Dv4" onclick="SetStyle(this);FileCheckLevelList();"><font color="red">文件批转</font></div>
        </div>
        <div class="ContentWindow" style="height: auto;">
            <div id="WorkInfoDv1">
                <table class="TableStyle" id="TableFrame" cellspacing="1" cellpadding="1" width="95%" align="center"
                    bgcolor="#cccccc">
                    <tr>
                        <td class="TableTdContentCenterStyle" colspan="4">报销单</td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">报账类别：</font>
                        </td>
                        <td class="TableTdContentStyle" style="width: 90%" colspan="3">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="90%">
                                        <input class="Control_ItemInputNoStyle" id="WorkFlowType" style="height: 22px; width: 100%"
                                            readonly maxlength="50" size="30" name="CostName" runat="server">
                                    </td>
                                    <td align="right">
                                        <input class="button_sel" id="FileTypeSel" title="选择流程类别" style="height: 22px" onclick="SelWorkFlowType();"
                                            type="button" value=" " name="btnSelCost" runat="server"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font style="color: Red">&nbsp;发&nbsp;起&nbsp;人： </font>
                        </td>
                        <td class="TableTdContentStyle"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="UserName" style="width: 90%" readonly maxlength="50"
                                size="45" name="CostName" runat="server"></font>
                        </td>
                        <td class="TableTdStyle"><font color="red">发起时间：</font></td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle" id="WorkStartDate" style="width: 90%" maxlength="50"
                                size="40" name="WorkStartDate" runat="server" readonly><font face="宋体" color="red"></font></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">报账主题：</font>
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <input class="Control_ItemInputNoStyle" id="Title" style="width: 90%" size="45" name="CostName"
                                runat="server"></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">报账部门：</font>
                        </td>
                        <td class="TableTdContentStyle" style="width: 38%">
                            <input class="Control_ItemInputNoStyle" id="UseDepart" style="width: 90%"
                                size="45" name="UseDepart"
                                runat="server"><font face="宋体"><input class="button_sel" id="btnSelDep0"
                                    style="height: 22px" onclick="btnSelDep_OnClick();"
                                    type="button" value=" " name="btnSelDep0" runat="server"></font></td>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">报账人：</font>
                        </td>
                        <td class="TableTdContentStyle" style="width: 38%">
                            <input class="Control_ItemInputNoStyle" id="RealUserCode" style="width: 232px; height: 19px"
                                maxlength="50" size="33" name="CostName" runat="server"><input class="button_sel" id="Button1" style="height: 22px" onclick="btnSelUserCode_OnClick();"
                                    type="button" value=" " name="btnSelCost" runat="server"><font face="宋体" color="red">&nbsp;
                                    </font>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">报账时间：</font>
                        </td>
                        <td class="TableTdContentStyle" style="width: 38%">
                            <input class="Control_ItemInputNoStyle" id="ReimbursementDate" style="width: 90%" onclick="WdatePicker()"
                                maxlength="20" size="18" runat="server" name="ReimbursementDate">
                        </td>
                        <td class="TableTdStyle" style="width: 12%">报账金额：
                        </td>
                        <td class="TableTdContentStyle" style="width: 38%">
                            <input class="Control_ItemInputNoStyle" id="RealMoney" style="width: 90%" maxlength="20"
                                size="18" name="RealMoney" runat="server">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">报账说明：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <textarea class="Control_ItemInputNoStyle" id="InfoContent" style="width: 99%; height: 150px; font-size: 12px;"
                                name="InfoContent" runat="server" rows="5" cols="76"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdContentStyle" colspan="4">
                            <table width="100%">
                                <tr>
                                    <td align="right"><font face="宋体">
                                        <input class="button" id="DetailAdd" style="height: 22px" onclick="OpenDetail('-1');" type="button"
                                            value="新增" name="btnFilter" runat="server"></font></td>
                                </tr>
                            </table>
                            <div id="DetailContent">
                                <%WriteDetailInfo();%>
                            </div>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">关联流程：</td>
                        <td class="TableTdContentStyle" colspan="3">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="90%">
                                        <a id="AssociatedProcessA" class="HrefStyle" href="javascript:void(0)" onclick="AssociatedProcess_Click()" runat="server"></a>
                                        <input type="hidden" id="AssociatedProcessHref" name="AssociatedProcessHref" runat="server" />
                                        <input type="hidden" id="AssociatedProcess" name="AssociatedProcess" runat="server" />
                                    </td>
                                    <td align="right">
                                        <input class="button_sel" id="SelAssociatedProcess" style="height: 22px" onclick="SelAssociatedProcess_OnClick();"
                                            type="button" value=" " name="SelAssociatedProcess" runat="server"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr1" runat="server">
                        <td class="TableTdStyle" style="width: 12%">相关附件：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="90%">
                                        <div id="FileList" runat="server"></div>
                                    </td>
                                    <td align="right" valign="top">
                                        <input class="button_sel" id="BtUpFileAdjunct" title="上传附件" style="height: 22px" onclick="UpFileAdjunct();"
                                            type="button" value=" " name="btnSelCost" runat="server"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="SignContent">
                        <td class="TableTdStyle" style="width: 12%">处理意见：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="96%">
                                        <textarea class="Control_ItemInputNoStyle" id="TxtDealResult" style="height: 80px; width: 100%"
                                            name="TxtDealResult" runat="server"></textarea>
                                    </td>
                                    <td align="right">
                                        <input class="button_sel" id="SelUsualPhase" title="选择常用短语" style="height: 22px"
                                            type="button" value=" " name="SelUsualPhase" onclick="SelUsual();" runat="server"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdContentCenterStyle" colspan="4">流程信息</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="background-color: #ffffff; padding: 4px;">
                            <uc1:WorkFlowNew ID="WorkFlowManage" runat="server"></uc1:WorkFlowNew>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdContentCenterStyle" colspan="4">会签/审批信息</td>
                    </tr>
                    <tr>
                        <td class="TableTdContentStyle" colspan="4">
                            <div id="WorkContent">
                                <asp:Repeater ID="WorkFlowRecord" runat="server">
                                    <ItemTemplate>
                                        <div>
                                            <%#DataBinder.Eval(Container.DataItem,"RecordUserName").ToString()%>
                                            <%#DataBinder.Eval(Container.DataItem,"WorkDate").ToString()%>
                                            <%#DataBinder.Eval(Container.DataItem,"RecordContent").ToString()%>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <asp:Label ID="TempMsg" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </div>
            <div id="WorkInfoDv2" style="height: auto; width: auto;">
                <uc1:WebOffice ID="WebOfficeManage" runat="server"></uc1:WebOffice>
            </div>
            <div id="WorkInfoDv4">
                <uc1:CheckLevelNew ID="CheckLevelInfo" runat="server"></uc1:CheckLevelNew>
            </div>
        </div>
        <br>
        <br>
        <br>
        <script type="text/javascript">
            function SelUsual() {
                var strPage = "../DialogNew/SelDictionary.aspx?DictionarySort=UsualShortPhrase&random=" + Math.random();
                HDialog.Open('500', '500', strPage, '选择常用短语', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        $("#TxtDealResult").val(obj.DictionaryName);
                    }
                });
            }
            function GetElements(obj, tag, result) {
                if (!result) {
                    var result = new Array();
                }

                if (obj) {
                    if (obj.tagName == tag) {
                        result[result.length] = obj;
                    }
                    if (obj.children) {
                        for (var i = 0; i != obj.children.length; i++) {
                            result = GetElements(obj.children[i], tag, result);
                        }
                    }
                }
                return result;
            }

            function SetStyle(Dv) {
                if (Dv.id == 'Dv2') {
                    OpenWebOffice();
                    return;
                }

                var elements = GetElements(document.getElementById("DvFrame"), 'DIV');

                for (var i = 0; i < elements.length; i++) {
                    if (elements[i].id != 'DvFrame') {
                        if (elements[i] == Dv) {
                            elements[i].className = 'ContentButtonDown';
                            document.getElementById('WorkInfo' + elements[i].id).style.display = '';

                        }
                        else {
                            elements[i].className = 'ContentButtonUp';
                            document.getElementById('WorkInfo' + elements[i].id).style.display = 'none';
                        }
                    }
                }
            }

            SetStyle(document.getElementById("Dv1"));

            function SetReadOnly() {
                if (document.all.WorkFlowManage_TxtFlowSort.value != "0" || document.all.WorkFlowManage_TxtWorkFlowIsComplete.value == "2" || document.all.WorkFlowManage_TxtStartUser.value != document.all.WorkFlowManage_LoginCode.value) {
                    var elements = GetElements(document.getElementById("TableFrame"), 'INPUT');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].readOnly = 'true';
                    }
                    $(".button_sel").prop("disabled", "true");
                    var elements = GetElements(document.getElementById("TableFrame"), 'SELECT');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].disabled = 'true';
                    }
                    var elements = GetElements(document.getElementById("TableFrame"), 'BUTTON');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].disabled = 'true';
                    }
                    var elements = GetElements(document.getElementById("TableFrame"), 'IMG');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].disabled = 'true';
                        if (elements[i].className == 'DD') {
                            elements[i].disabled = false;
                        }
                    }
                    var elements = GetElements(document.getElementById("TableFrame"), 'TEXTAREA');
                    for (var i = 0; i < elements.length; i++) {
                        if (i == 1) {
                            //elements[i].readOnly = 'false';
                        } else {
                            elements[i].readOnly = 'true';
                        }
                    }
                }

                if (document.all.WorkFlowManage_TxtIsOpr.value == "1" && document.all.WorkFlowManage_TxtBtnCheckPass.value == "1") {
                    //document.all.TxtDealResult.readOnly = '';
                    document.all.SelUsualPhase.disabled = '';
                    document.all.WorkFlowManage_btnSelDep.disabled = '';
                }
                else {
                    document.all.SignContent.style.display = 'none';
                }

                if (document.all.WorkFlowManage_TxtIsOpr.value == "1" || document.all.WorkFlowManage_TxtAdminControl.value == "1") {
                    //document.all.TxtDealResult.readOnly = '';
                    document.all.SelUsualPhase.disabled = '';
                    document.all.SignContent.style.display = '';
                    document.all.WorkFlowManage_btnSelDep.disabled = '';
                }
                //如果是批转的就隐藏审批通过按钮
                if (document.all.WorkFlowManage_TxtCheckLevelIsOpr.value == "1") {
                    document.all.BtnCheckPass.style.display = 'none';
                }
            }

            SetReadOnly();

            function SelWorkFlowType() {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0005&random=" + Math.random();
                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                        if (obj[3] != '') {
                            var ExtName = GetExtName(obj[3].toString());
                            OpenDoc(obj[3].toString(), ExtName);
                        }
                        document.all.WorkFlowType.value = obj[1].toString();
                        document.all.WorkFlowTypeId.value = obj[0].toString();
                    }
                    SetStyle(document.getElementById("Dv1"));
                });
            }

            function OpenDetail(KeyId) {
                if ($("#WorkFlowManage_WorkStateTxtLable").html() != '已完结') {
                    var strPage = "../OAPublicWorkNew/ReimbursementManageDetail.aspx?InfoId=" + KeyId + "&RandCode=" + Math.random();
                    HDialog.Open(600, 430, strPage, '报账详细', false, function callback(_Data) {
                        if (_Data != '') {
                            var obj = JSON.parse(_Data);
                            window.document.all.DetailContent.innerHTML = obj[0];
                            window.document.all.RealMoney.value = obj[1];
                        }
                    });
                }

            }

            function checkValue() {
                if (document.all.WorkFlowTypeId.value == "") {
                    window.alert("请选择流程类别");
                    return false;
                }
                if (document.all.Title.value == "") {
                    window.alert("报账主题不能为空");

                    return false;
                }
                if (document.all.ReimbursementDate.value == "") {
                    window.alert("报账日期不能为空");

                    return false;
                }

                if (checkIsValidDate(document.all.ReimbursementDate.value) == false) {
                    window.alert("报账日期格式不正确");

                    return false;
                }

                if (document.all.RealMoney.value == "" || document.all.RealMoney.value == 0) {
                    window.alert("报账金额有误");
                    return false;
                }

                if (checkSubmit() == false) return false;
                return DisabledBtn();
            }

            function btnSelUserCode_OnClick() {
                var strPage = "../OAWorkFlowNew/SelOpr.aspx?Cmd=3&WorkInfoId=-1&random=" + Math.random()
                HDialog.Open('800', '544', strPage, '选择人员', false, function callback(_Data) {

                    if (_Data != '') {

                        var Ret = Cache.GetData("SelOrp.aspx_Return");
                        var obj = JSON.parse(Ret);
                        var TempUserList = "";
                        if (obj != null) {
                            var arrUserList = obj[0].split('|');

                            var arrUser = new Array();

                            arrUser = arrUserList[0].split(',');

                            document.all.HiddenRealUserCode.value = arrUser[1];

                            document.all.RealUserCode.value = arrUser[0];
                        }
                    }
                });

            }

            //点击关联的流程
            function AssociatedProcess_Click() {
                if ($("#WorkFlowManage_WorkStateTxtLable").html() == '办理中' || $("#WorkFlowManage_WorkStateTxtLable").html() == '已完结') {
                    if ($('#AssociatedProcessHref').val() == "") {
                        HDialog.Info("流程连接存在问题，请联系管理员！");
                        return;
                    }
                    var AssociatedProcessHref = $('#AssociatedProcessHref').val();
                    AssociatedProcessHref = AssociatedProcessHref.replace("../", "/HM/M_Main/");
                    AssociatedProcessHref = AssociatedProcessHref.replace("../../", "/HM/M_Main/");
                    var w = $(window).width() - 100;
                    var h = $(window).height();
                    HDialog.Open(w, h, AssociatedProcessHref, '关联流程查看', false, function callback(_Data) {
                        window.location.reload();
                    });
                } else {
                    HDialog.Info("编辑流程时不允许点击查看流程，请见谅！");
                }
            }
            //选择关联流程
            function SelAssociatedProcess_OnClick() {
                HDialog.Open("800", "600", "/HM/M_Main/OAPublicWorkNew/SelAssociatedProcess.aspx", '选择关联流程', false, function callback(_Data) {
                    if (_Data != '') {
                        if (_Data == "Cancel") {
                            $('#AssociatedProcessA').text("");
                            $('#AssociatedProcess').val("");
                            $('#AssociatedProcessHref').val("");
                        }
                        else {
                            var data = $.parseJSON(_Data);
                            $('#AssociatedProcessA').text(data.Title);
                            $('#AssociatedProcess').val(data.Title);
                            if (data.Url != "") {
                                var UrlSplit = data.Url.split('\'');
                                if (UrlSplit.length > 1) {
                                    $('#AssociatedProcessHref').val(UrlSplit[1]);
                                }
                            }
                        }
                    }
                });
            }

            function UpFileAdjunct() {
                if ($("#WorkFlowManage_WorkStateTxtLable").html() != '已完结') {
                    var strPage = "../OAWorkFlowNew/FileAdjunct.aspx?Type=0005&KeyId=&AddFile=&random=" + Math.random();
                    var w = $(window).width();
                    var h = $(window).height();
                    HDialog.Open(w, h, strPage, '文件附件', false, function callback(_Data) {
                        if (_Data != '') {
                            document.getElementById("FileList").innerHTML = _Data;
                        }
                    });
                }
            }

            $(function () {
                if ($("#WorkFlowManage_WorkStateTxtLable").html() == '办理中' || $("#WorkFlowManage_WorkStateTxtLable").html() == '已完结') {
                    $('#SelAssociatedProcess').hide();
                }
            })


        </script>
        <uc1:DivLine ID="DivLine1" runat="server"></uc1:DivLine>
    </form>
</body>
</html>
