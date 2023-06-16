<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractManage.aspx.cs" Inherits="M_Main.OAPublicWorkNew.ContractManage" %>

<%@ Register TagPrefix="uc1" TagName="WebOffice" Src="../UserControl/WebOffice.ascx" %>
<%@ Register TagPrefix="uc1" TagName="WorkFlowNew" Src="../UserControl/WorkFlowNew.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DivLine" Src="../UserControl/DivLine.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CheckLevelNew" Src="../UserControl/CheckLevelNew.ascx" %>
<!DOCTYPE html>
<html>
<head>
    <title>合同审批</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JsCodeFun.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <link href="../css/oaeditwindow.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        #Dv5 {
            background-color: #ffffff;
            /*color: black;*/
            color: black;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border: 1px solid #808080;
            border-radius: 2px;
        }

            #Dv5:hover {
                background-color: #808080;
                color: white;
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
            var strPage = "../OAWorkFlowNew/WorkFlowSelOpr.aspx?Cmd=1&WorkInfoId=-1&random=" + Math.random();
            // var strPage = "../OAWorkFlowNew/SelOpr.aspx?Cmd=1&WorkInfoId=-1&random=" + Math.random();
            ///
            HDialog.Open('800', '580', strPage, '上级部门选择', false, function callback(_Data) {
                var arrUser = _Data.split(',');
                document.all.WorkDepart.value = arrUser[0];
                //var obj = JSON.parse(_Data);
                //var TempUserList = "";
                //if (obj != null) {
                //    var arrUserList = obj[0].split('|');
                //    var arrUser = new Array();
                //    arrUser = arrUserList[0].split(',');
                //    document.all.WorkDepart.value = arrUser[0];
                //}
            });
            ///

        }
    </script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body onload="Win_OnLoad()">
    <form id="Form1" method="post" runat="server">
        <font face="宋体"></font>
        <input id="PrintParms" style="height: 21px; width: 24px" type="hidden" size="1" name="PrintParms"
            runat="server">
        <input id="HiddenUserCode" style="height: 21px; width: 24px" type="hidden" size="1" runat="server"
            name="HiddenUserCode"><input id="WorkFlowTypeId" style="height: 17px; width: 64px" type="hidden" size="5" name="WorkFlowTypeId"
                runat="server">
        <br>
        <br>
        <br>
        <table class="TablebackGround" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td class="TablebackGroundButton">
                    <input language="javascript" class="button_six" id="btnRemind" style="height: 22px" type="button"
                        value="催办" runat="server" onclick="DisabledBtn();" name="btnRemind"><input language="javascript" class="button_six" id="btnJump" style="height: 22px" type="button"
                            value="跳过" runat="server" onclick="DisabledBtn();" name="btnJump"><input class="button_six" id="btnReturn" style="height: 22px" onclick="window.history.back();"
                                type="button" value="返回列表" runat="server" name="btnReturn"><input style="height: 22px; z-index: 0; display: none" id="BtnDealInfo" class="button_six"
                                    onclick="DisabledBtn();" value="会签意见" type="button" name="BtnReadOver" runat="server"><input style="height: 22px; color: red; display: none" id="BtnCompleteCheckLevel" class="button_six"
                                        onclick="DisabledBtn();" value="批转结束" type="button" name="BtnCompleteCheckLevel" runat="server"><input class="button_six" id="BtnReadOver" style="height: 22px; color: red" type="button"
                                            value="会签结束" runat="server" name="BtnReadOver" onclick="DisabledBtn();"><input class="button_six" id="BtnReturnPrevious" style="height: 22px" type="submit" value="驳回"
                                                runat="server" name="BtnReturnPrevious" onclick="return NoPrevious();"><input class="button_six" id="BtnCheckNoPass" style="height: 22px" type="submit" value="审批不通过"
                                                    onclick="return NoPassCheck();" runat="server" name="BtnCheckNoPass"><input class="button_six" id="BtnCheckPass" style="height: 22px" type="button" value="审批通过"
                                                        runat="server" name="BtnCheckPass" onclick="DisabledBtn();"><input language="javascript" class="button_six" id="BtnIsPrint" style="height: 22px" type="button"
                                                            value="打印" runat="server" name="BtnIsPrint"><input class="button_six" id="BtnSaveStartWorkFlow" style="height: 22px" onclick="return checkValue();"
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
                        <td class="TableTdContentCenterStyle" colspan="4">合同评审表</td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">流程类别：</font>
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
                        <td class="TableTdStyle" style="width: 12%"><font color="red">合同类别：</font>
                        </td>
                        <td class="TableTdContentStyle">
                            <select id="ContractType" name="ContractType" runat="server">
                                <option value="支付合同" selected>支付合同</option>
                                <option value="收款合同">收款合同</option>
                            </select>
                        </td>
                        <td class="TableTdStyle"></td>
                        <td class="TableTdContentStyle"></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">发 起 人：</font>
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
                        <td class="TableTdStyle" style="width: 12%"><font color="red">合同名称：</font>
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%">
                            <input class="Control_ItemInputNoStyle" id="ContractName" style="width: 90%" size="45"
                                name="CostName" runat="server"><font face="宋体" color="red"></font></td>
                        <td class="TableTdStyle" style="width: 12%">合同编号：
                        </td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle" id="ContractCode" style="width: 90%" maxlength="50"
                                size="45" name="CostName" runat="server"><font face="宋体" color="red"></font>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">对方单位：</font>
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="CompanyName" style="width: 90%" maxlength="50"
                                size="45" name="CostName" runat="server"></font>
                        </td>
                        <td class="TableTdStyle" style="width: 12%">合同金额：
                        </td>
                        <td class="TableTdContentStyle"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="ContractMoney" style="width: 90%" maxlength="50"
                                size="45" name="CostName" runat="server" value="0.00"></font>
                        </td>
                    </tr>

                    <tr>
                        <td class="TableTdStyle" style="width: 12%">合同期限：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="ContractLimit" style="width: 90%" maxlength="50"
                                size="45" name="ContractLimit" runat="server"></font>
                        </td>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">主办部门：</font>
                        </td>
                        <td class="TableTdContentStyle"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="WorkDepart" style="width: 90%" maxlength="50"
                                size="45" name="WorkDepart" runat="server" value="  "></font> <font face="宋体">
                                    <input class="button_sel" id="btnSelDep0"
                                        style="height: 22px" onclick="btnSelDep_OnClick();"
                                        type="button" value=" " name="btnSelDep0" runat="server"></font></td>
                    </tr>

                    <tr>
                        <td class="TableTdStyle" style="width: 12%"><font style="color: red">经&nbsp;办&nbsp;人：</font>
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="Writer" style="width: 90%"
                                maxlength="50" size="45"
                                name="Writer" runat="server"></font>
                        </td>
                        <td class="TableTdStyle" style="width: 12%"><font color="red">办理时间：</font>
                        </td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle" id="WriteDate" style="width: 90%" onclick="WdatePicker()"
                                maxlength="20" size="18" name="WriteDate" runat="server"><font face="宋体" color="red"></font></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle"><font color="red">合同开始日期：</font></td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle" id="ContStartDate" style="width: 90%" onclick="WdatePicker()"
                                maxlength="20" size="18" name="ContStartDate" runat="server"><font face="宋体" color="red"></font></td>
                        <td class="TableTdStyle"><font color="red">合同截止日期：</font></td>
                        <td class="TableTdContentStyle">
                            <input class="Control_ItemInputNoStyle" id="ContEndDate" style="width: 90%" onclick="WdatePicker()"
                                maxlength="20" size="18" name="ContEndDate" runat="server"><font face="宋体" color="red"></font></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">履约保证金：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="Margin" style="width: 90%" maxlength="50"
                                size="45" name="Margin" runat="server"></font>
                        </td>
                        <td class="TableTdStyle" style="width: 12%">付款方式：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%">
                            <select id="NewPayType" name="NewPayType" runat="server">
                                <option selected></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">评审期限：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="OverDate" style="width: 90%" onclick="WdatePicker()"
                                maxlength="20" size="18" name="OverDate" runat="server"><font face="宋体" color="red"></font></font></td>
                        <td class="TableTdStyle" style="width: 12%">签订期限：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="ContractDate" style="width: 90%" onclick="WdatePicker()"
                                maxlength="20" size="18" name="ContractDate" runat="server"><font face="宋体" color="red"></font></font></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">上期合同金额：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="LastMoney" style="width: 90%" maxlength="20"
                                size="18" name="LastMoney" runat="server" value="0.00"></font></td>
                        <td class="TableTdStyle" style="width: 12%">上期合同期限：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="LastDate" style="width: 90%" maxlength="20"
                                size="18" name="LastDate" runat="server" value="0.00"><font face="宋体" color="red"></font></font></td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">租赁合同建筑面积：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="BuildingArea" style="width: 90%" maxlength="50"
                                size="45" name="BuildingArea" runat="server"></font>
                        </td>
                        <td class="TableTdStyle" style="width: 12%">单价(元/平方米)：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="UnitPrice" style="width: 90%" maxlength="50"
                                size="45" name="UnitPrice" runat="server"></font>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">电费：
                        </td>
                        <td class="TableTdContentStyle" style="width: 33%"><font face="宋体">
                            <input class="Control_ItemInputNoStyle" id="Electricity" style="width: 90%" maxlength="50"
                                size="45" name="Electricity" runat="server"></font>
                        </td>
                        <td class="TableTdStyle" style="width: 12%">盖章数量：</td>
                        <td class="TableTdContentStyle" style="width: 33%">
                            <select id="StampQuantity" name="StampQuantity" runat="server">
                                <%--<option value=""></option>--%>
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
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">合同内容：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <button id="Dv5" onclick="SetStyle(this)">正文编辑</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle" style="width: 12%">合同说明：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <textarea class="Control_IteminputNoStyle" style="height: 80px; width: 99%; border: 1px #ffffff solid;" id="ProcessDescription" name="ProcessDescription" runat="server"></textarea>
                        </td>
                    </tr>

                    <tr id="Tr1" runat="server">
                        <td class="TableTdStyle" style="width: 12%">相关附件：
                        </td>
                        <td class="TableTdContentStyle" colspan="3">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="90%">
                                        <div id="FileList" runat="server"><font face="宋体"></font></div>
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
            <div id="WorkInfoDv2">
                <uc1:WebOffice ID="WebOfficeManage" runat="server"></uc1:WebOffice>
            </div>
            <div id="WorkInfoDv4">
                <uc1:CheckLevelNew ID="CheckLevelInfo" runat="server"></uc1:CheckLevelNew>
            </div>
        </div>
        <br>
        <br>
        <br>
        <input type="hidden" id="CorpID" name="CorpID" runat="server" />
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

                if (Dv.id == 'Dv2' || Dv.id == 'Dv5') {
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
                if (Dv.id == 'Dv2') {
                    window.scrollTo(0, 1);
                    window.scrollTo(0, 0);
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
                }
                $("#Dv5").attr("disabled", false);
                if (document.all.WorkFlowManage_TxtIsOpr.value == "1" && document.all.WorkFlowManage_TxtBtnCheckPass.value == "1") {
                    document.all.ContractCode.readOnly = '';
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
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0004&random=" + Math.random();
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
                if (document.all.ContractName.value == "") {
                    window.alert("合同名称不能为空");

                    return false;
                }
                if (document.all.CompanyName.value == "") {
                    window.alert("对方单位不能为空");

                    return false;
                }
                if (document.all.ContractMoney.value == "") {
                    window.alert("合同金额不能为空");

                    return false;
                }
                if (document.all.WorkDepart.value == "") {
                    window.alert("主办部门不能为空");
                    return false;
                }
                if (document.all.Writer.value == "") {
                    window.alert("经办人不能为空");
                    return false;
                }

                if (CheckMoneyValue(document.all.ContractMoney.value) == false) {
                    window.alert("合同金额格式错误");

                    return false;
                }

                if (checkIsValidDate(document.all.WriteDate.value) == false) {
                    window.alert("起草时间不能为空");

                    return false;
                }
                //2020 电信三 需要合同开始和结束日期不能为空
                if ($("#CorpID").val() != "2020") {
                    if (checkIsValidDate(document.all.ContStartDate.value) == false) {
                        window.alert("合同开始日期不能为空");
                        return false;
                    }
                    if (checkIsValidDate(document.all.ContEndDate.value) == false) {
                        window.alert("合同截止日期不能为空");
                        return false;
                    }
                }


                if (checkSubmit() == false) return false;
                DisabledBtn();
                return true;
            }

            function UpFileAdjunct() {
                var strPage = "../OAWorkFlowNew/FileAdjunct.aspx?Type=0004&KeyId=&AddFile=&random=" + Math.random();
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
