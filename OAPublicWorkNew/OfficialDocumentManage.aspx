<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OfficialDocumentManage.aspx.cs" Inherits="M_Main.OAPublicWorkNew.OfficialDocumentManage" %>

<%@ Register TagPrefix="uc1" TagName="WorkFlowNew" Src="../UserControl/WorkFlowNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DivLine" Src="../UserControl/DivLine.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CheckLevelNew" Src="../UserControl/CheckLevelNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="WebOffice" Src="../UserControl/WebOffice.ascx" %>
<!DOCTYPE html>
<html>
<head>
    <title>公文管理</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <script src="../jscript/DateControl.js" type="text/javascript"></script>
    <script src="../jscript/JsCodeFun.js" type="text/javascript"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/oaeditwindow.css" type="text/css" rel="stylesheet">
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
                        document.all.DispatchUnits.value = arrUser[0];
                    }
                }
            });
        }
    </script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body onload="Win_OnLoad()" style="background-color: #F3F3F4;">
    <form id="Form2" method="post" runat="server">
        <input id="PrintParms" type="hidden" size="1" name="PrintParms" runat="server" />
        <input id="HiddenUserCode" type="hidden" size="1" name="PrintParms" runat="server" />
        <input id="WorkFlowTypeId" type="hidden" size="1" name="WorkFlowTypeId" runat="server" />
        <input id="AddFile" type="hidden" name="AddFile" runat="server" />
        <input id="KeyId" type="hidden" name="KeyId" runat="server" />
        <br>
        <br>
        <br>
        <table class="TablebackGround" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td class="TablebackGroundButton">
                    <input class="button_six" id="btnReturn" style="height: 22px; z-index: 0" onclick="window.history.back();"
                        type="button" value="返回列表" name="btnReturn" runat="server"><input language="javascript" class="button_six" id="btnRemind" style="height: 22px" onclick="DisabledBtn();"
                            type="button" value="催办" name="btnRemind" runat="server"><input language="javascript" class="button_six" id="btnJump" style="height: 22px" onclick="DisabledBtn();"
                                type="button" value="跳过" name="BtnIsPrint" runat="server"><input style="height: 22px; z-index: 0; display: none" id="BtnDealInfo" class="button_six"
                                    onclick="DisabledBtn();" value="会签意见" type="button" name="BtnReadOver" runat="server"><input style="height: 22px; color: red; z-index: 0; display: none" id="BtnCompleteCheckLevel"
                                        class="button_six" onclick="DisabledBtn();" value="批转结束" type="button" name="BtnCompleteCheckLevel" runat="server"><input class="button_six" id="BtnReadOver" style="height: 22px; color: red; z-index: 0"
                                            onclick="DisabledBtn();" type="button" value="会签结束" name="BtnReadOver" runat="server"><input class="button_six" id="BtnReturnPrevious" style="height: 22px" onclick="    return NoPrevious();"
                                                type="submit" value="驳回" name="BtnReturnPrevious" runat="server"><input class="button_six" id="BtnCheckNoPass" style="height: 22px" onclick="return NoPassCheck();"
                                                    type="submit" value="审批不通过" name="BtnCheckNoPass" runat="server"><input class="button_six" id="BtnCheckPass" style="height: 22px" onclick="DisabledBtn();"
                                                        type="button" value="审批通过" name="BtnCheckPass" runat="server"><input language="javascript" class="button_six" id="BtnIsPrint" style="height: 22px" type="button"
                                                            value="打印" name="BtnIsPrint" runat="server"><input class="button_six" id="BtnSaveStartWorkFlow" style="height: 22px" onclick="return checkValue();"
                                                                type="submit" value="送审" name="BtnSaveStartWorkFlow" runat="server"><input class="button_six" id="BtnSaveDraft" style="height: 22px" onclick="return checkValue();"
                                                                    type="submit" value="保存草稿" name="BtnSaveDraft" runat="server">
                </td>
            </tr>
        </table>
        <div class="ContentButtonDiv" id="DvFrame">
            <div class="ContentButtonUp" id="Dv1" onclick="SetStyle(this)">基本信息</div>
            <div class="ContentButtonUp" id="Dv2" onclick="SetStyle(this)">流程文档</div>
            <div class="ContentButtonUp" id="Dv3" onclick="SetStyle(this);FileCheckLevelList();"><font color="red">文件批转</font></div>
        </div>
        <div class="ContentWindow" style="height: auto;">
            <div id="WorkInfoDv1">
                <table class="TableStyle" id="TableFrame" cellspacing="1" cellpadding="1" width="95%" align="center"
                    bgcolor="#cccccc">
                    <tr>
                        <td class="TableTdContentCenterStyle" colspan="4">文件处理单</td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle"><font color="red">流程类别：</font>
                        </td>
                        <td class="TableTdContentStyle" colspan="3">

                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="90%">
                                        <input class="Control_ItemInputNoStyle" id="WorkFlowType" style="height: 22px; width: 100%"
                                            readonly maxlength="50" size="30" name="WorkFlowType" runat="server">
                                    </td>
                                    <td align="right">
                                        <input class="button_sel" id="FileTypeSel" title="选择流程类别" style="height: 22px" onclick="SelWorkFlowType();"
                                            type="button" value=" " name="btnSelCost" runat="server"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle"><span color="red">发 起 人：</span>
                        </td>
                        <td class="TableTdContentStyle"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="UserName" style="width: 90%" readonly maxlength="50"
                                size="45" name="CostName" runat="server"></font>&nbsp;
                        </td>
                        <td class="TableTdStyle"><span color="red">发起时间：</span></td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle" id="WorkStartDate" style="width: 90%" maxlength="50"
                                size="40" name="WorkStartDate" runat="server" readonly><font face="宋体" color="red"></font></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle"><span color="red">文件标题：</span>
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <textarea id="FileTitle" name="FileTitle" style="width: 99%; height: 50px;" class="Control_ItemInputNoStyle" size="500" runat="server"></textarea>
                            <span face="宋体" color="red"></span></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">内容摘要：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <textarea id="KeyWords" name="KeyWords" style="width: 99%; height: 100px;" class="Control_ItemInputNoStyle" size="500" runat="server"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">文件编号：</td>
                        <td class="TableTdContentStyle" style="width: 244px"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="FileCode" style="width: 90%" maxlength="50"
                                size="26" name="CostName" runat="server"></font></td>
                        <td class="TableTdStyle"><font color="red">发文部门：</font></td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle"
                                id="DispatchUnits" style="width: 70%" maxlength="50"
                                size="40" name="CostName" runat="server"><font face="宋体" color="red"><input class="button_sel" id="btnSelDep" style="height: 22px" onclick="btnSelDep_OnClick();"
                                    type="button" value=" " name="btnSelDep" runat="server"></font></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">拟 稿 人：
                        </td>
                        <td class="TableTdContentStyle" style="width: 244px">
                            <input class="Control_ItemInputNoStyle" id="Writer" style="width: 90%" maxlength="20" size="45"
                                name="CostName" runat="server">
                        </td>
                        <td class="TableTdStyle">拟稿时间：
                        </td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle" id="WriteDate" style="width: 90%" onclick="WdatePicker()"
                                maxlength="20" size="18" name="IssueDate" runat="server"><font face="宋体" color="red"></font>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">文件密级：
                        </td>
                        <td class="TableTdContentStyle" style="width: 244px"><font face="宋体">
                            <asp:DropDownList ID="FileSecret" runat="server"></asp:DropDownList></font></td>
                        <td class="TableTdStyle">缓急程度：
                        </td>
                        <td class="TableTdContentStyle"><font face="宋体">
                            <asp:DropDownList ID="Nervous" runat="server"></asp:DropDownList></font></td>
                    </tr>

                    <tr>
                        <td class="TableTdStyle">收文单位：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <input class="Control_ItemInputNoStyle" id="ReciveUnits" style="width: 90%" maxlength="50"
                                size="86" name="CostName" runat="server"><font face="宋体" color="red"></font></td>
                    </tr>
                    <tr id="dv">
                        <td class="TableTdStyle">流程文档：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <button id="Dv4" onclick="SetStyle(this)">正文编辑</button>
                        </td>
                    </tr>
                    <tr id="Tr1" runat="server">
                        <td class="TableTdStyle">相关附件：
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
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">盖章数量：</td>
                        <td class="TableTdContentStyle" style="width: 33%">
                            <select id="StampQuantity" name="StampQuantity" runat="server" style="height: 22px;">
                                <option value=""></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                            </select>
                        </td>
                        <td class="TableTdStyle" style="width: 12%"></td>
                        <td class="TableTdContentStyle" style="width: 33%"></td>
                    </tr>
                    <tr id="SignContent">
                        <td class="TableTdStyle">处理意见：
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
            <div id="WorkInfoDv2">
                <uc1:WebOffice ID="WebOfficeManage" runat="server"></uc1:WebOffice>
            </div>
            <div id="WorkInfoDv3">
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
                if (Dv.id == 'Dv2' || Dv.id == 'Dv4') {
                    OpenWebOffice();
                    return;
                }

                var elements = GetElements(document.getElementById("DvFrame"), 'DIV');

                for (var i = 0; i < elements.length; i++) {
                    if (elements[i].id != 'DvFrame' && elements[i].id != 'DvCheckLevel') {
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

                if (Dv.id == 'Dv2' || Dv.id == 'Dv4') {
                    window.scrollTo(0, 1);
                    window.scrollTo(0, 0);
                }
            }

            SetStyle(document.getElementById("Dv1"));

            function SetReadOnly(State) {
                if (document.all.WorkFlowManage_TxtFlowSort.value != "0" || document.all.WorkFlowManage_TxtWorkFlowIsComplete.value == "2" || document.all.WorkFlowManage_TxtStartUser.value != document.all.WorkFlowManage_LoginCode.value) {
                    var elements = GetElements(document.getElementById("TableFrame"), 'INPUT');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].readOnly = State;
                    }
                    $(".button_sel").attr("disabled", "true");
                    var elements = GetElements(document.getElementById("TableFrame"), 'SELECT');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].disabled = State;
                    }
                    var elements = GetElements(document.getElementById("TableFrame"), 'BUTTON');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].disabled = State;
                    }
                }

                if (document.all.WorkFlowManage_TxtIsOpr.value == "1" && document.all.WorkFlowManage_TxtBtnCheckPass.value == "1") {
                    document.all.FileCode.readOnly = '';
                    //document.all.TxtDealResult.readOnly = '';
                    document.all.SelUsualPhase.disabled = '';
                    document.all.BtUpFileAdjunct.readOnly = '';
                    document.all.AddFile.value = '1';
                    document.all.WorkFlowManage_btnSelDep.disabled = '';
                    document.all.Dv4.readOnly = '';
                }
                else {
                    document.all.SignContent.style.display = 'none';
                }


                if (document.all.WorkFlowManage_TxtIsOpr.value == "1" || document.all.WorkFlowManage_TxtAdminControl.value == "1") {
                    //document.all.TxtDealResult.readOnly = '';
                    document.all.SelUsualPhase.disabled = '';
                    document.all.SignContent.style.display = '';
                    document.all.BtUpFileAdjunct.disabled = '';
                    document.all.WorkFlowManage_btnSelDep.disabled = '';
                    document.all.AddFile.value = '1';
                    document.all.Dv4.readOnly = '';
                }
                //如果是批转的就隐藏审批通过按钮
                if (document.all.WorkFlowManage_TxtCheckLevelIsOpr.value == "1") {
                    document.all.BtnCheckPass.style.display = 'none';
                }
            }

            SetReadOnly('true');

            function SelWorkFlowType() {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0002&random=" + Math.random();
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

            function checkValue() {
                if (document.all.WorkFlowTypeId.value == "") {
                    window.alert("请选择流程类别");
                    return false;
                }
                if (document.all.FileTitle.value == "") {
                    window.alert("文件标题不能为空");

                    return false;
                }

                if (document.all.DispatchUnits.value == "") {
                    window.alert("发文部门不能为空");

                    return false;
                }

                if (checkSubmit() == false) return false;
                DisabledBtn();
                return true;
            }

            function UpFileAdjunct() {

                var strPage = "../OAWorkFlowNew/FileAdjunct.aspx?Type=0002&KeyId=" + document.all.KeyId.value + "&AddFile=" + document.all.AddFile.value + "&random=" + Math.random();
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, strPage, '文件附件', false, function callback(_Data) {
                    if (_Data != '') {
                        document.getElementById("FileList").innerHTML = _Data;
                    }
                });
            }
        </script>
        <uc1:DivLine ID="DivLine1" runat="server"></uc1:DivLine>
    </form>
</body>
</html>
