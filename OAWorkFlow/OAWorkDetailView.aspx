<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OAWorkDetailView.aspx.cs" Inherits="M_Main.OAWorkFlow.OAWorkDetailView" EnableSessionState="ReadOnly"%>

<%@ Register TagPrefix="uc1" TagName="WorkFlowView" Src="../UserControl/WorkFlowView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DivLine" Src="../UserControl/DivLine.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CheckLevel" Src="../UserControl/CheckLevel.ascx" %>
<%@ Register TagPrefix="uc1" TagName="WebOffice" Src="../UserControl/WebOffice.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RelationWorkFlow" Src="../UserControl/RelationWorkFlow.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>流程审批</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <script language="javascript" src="../jscript/JsCodeFun.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <base target="_parent" />
    <link href="../css/oaform.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.8.3.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/PersonDictionary.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script language="javascript" src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
     <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script language="javascript" type="text/javascript">
        function NoPrevious() {
            if (document.all.TxtDealResult.value == "") {
                window.alert("处理意见不能为空,请填写处理意见");
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
            DisabledBtn();
            return true;
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
        }

        function ClosePage() {
            window.returnValue = "true";
            window.close();
        }

        function CloseWebPage() {
            window.opener = null;
            window.close();
            window.history.back();
        }

    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="overflow-x: hidden;">
    <form id="FrmForm" method="post" runat="server">
        <input id="HiddenUserCode" type="hidden" name="PrintParms" runat="server" />
        <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
        <input id="AddFile" type="hidden" name="AddFile" runat="server" />
        <input id="KeyId" type="hidden" name="KeyId" runat="server" />
        <input id="FilterFlow" type="hidden" name="FilterFlow" runat="server" />

        <input id="Description" type="hidden" name="Description" runat="server" />
        <input id="BType" type="hidden" name="BType" runat="server" />
        <br />
        <br />
        <br />
        <table class="TablebackGround" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td class="TablebackGroundButton">
                    <input class="button_six" id="btnReturn" style="height: 22px; z-index: 0" onclick="CloseWebPage();"
                        type="button" value="返回" name="btnReturn" runat="server"><input language="javascript"
                            class="button_six" id="btnRemind" style="height: 22px" onclick="DisabledBtn();"
                            type="button" value="催办" name="btnRemind" runat="server"><input language="javascript"
                                class="button_six" id="btnJump" style="height: 22px" onclick="DisabledBtn();"
                                type="button" value="跳过" name="BtnIsPrint" runat="server"><input style="height: 22px; z-index: 0; display: none"
                                    id="BtnDealInfo" class="button_six" onclick="DisabledBtn();"
                                    value="会签意见" type="button" name="BtnReadOver" runat="server"><input style="height: 22px; color: red; z-index: 0; display: none"
                                        id="BtnCompleteCheckLevel" class="button_six"
                                        onclick="DisabledBtn();" value="批转结束" type="button" name="BtnCompleteCheckLevel"
                                        runat="server"><input class="button_six" id="BtnReadOver" style="height: 22px; color: red; z-index: 0"
                                            onclick="DisabledBtn();" type="button" value="会签结束" name="BtnReadOver"
                                            runat="server"><input class="button_six" id="BtnReturnPrevious" style="height: 22px"
                                                onclick="return NoPrevious();" type="submit" value="驳回" name="BtnReturnPrevious"
                                                runat="server"><input class="button_six" id="BtnCheckNoPass" style="height: 22px"
                                                    onclick="return NoPassCheck();" type="submit" value="审批不通过" name="BtnCheckNoPass"
                                                    runat="server"><input class="button_six" id="BtnCheckPass" style="height: 22px" onclick="DisabledBtn();"
                                                        type="button" value="审批通过" name="BtnCheckPass" runat="server"><input language="javascript"
                                                            class="button_six" id="BtnIsPrint" style="height: 22px" type="button" value="打印"
                                                            name="BtnIsPrint" runat="server"><input class="button_six" id="BtnSaveStartWorkFlow"
                                                                style="height: 22px" onclick="return checkValue();" type="submit" value="送审"
                                                                name="BtnSaveStartWorkFlow" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <div class="ContentButtonDiv" id="DvFrame">
            <div class="ContentButtonUp" id="Dv1" onclick="SetStyle(this)">
                基本信息
            </div>
            <div class="ContentButtonUp" id="Dv2" onclick="SetStyle(this)">
                文件内容
            </div>
            <div class="ContentButtonUp" id="Dv4" onclick="SetStyle(this);FileCheckLevelList();">
                文件批转
            </div>
            <div class="ContentButtonUp" id="Dv3" onclick="SetStyle(this)">
                流程信息
            </div>
            <div class="ContentButtonUp" id="Dv5" onclick="SetStyle(this)">
                关联流程
            </div>
        </div>
        <div class="ContentWindow" style="height: auto;">
            <div id="WorkInfoDv1">
                <input id="ShowKeyId" type="hidden" name="ShowKeyId" runat="server" />
                <input id="ClassName" type="hidden" name="ClassName" runat="server" />
                <input id="BussId" type="hidden" name="BussId" runat="server" />
                <input id="Pid" type="hidden" name="Pid" runat="server" />
                <input id="BussFormView" type="hidden" name="BussFormView" runat="server" />
                <input id="BussFormData" type="hidden" name="BussFormData" runat="server" />
                <input id="LoginUserName" type="hidden" name="LoginUserName" runat="server" />
                <input type="hidden" id="PersonDemandViceTab" runat="server" name="PersonDemandViceTab" />
                <table class="TableStyle" id="TableFrame" cellspacing="1" cellpadding="1" width="95%"
                    align="center" bgcolor="#cccccc">
                    <tr id="DvBuss">
                        <td class="TableTdContentCenterStyle" colspan="6">业务单
                        </td>
                    </tr>
                    <tr id="DvView">
                        <td class="TableTdContentCenterStyle" colspan="6">审批单
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">流程类别
                        </td>
                        <td class="TableTdContentStyle" colspan="5">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="90%">
                                        <input class="Control_ItemInputNoStyle" id="WorkFlowType" style="height: 22px; width: 90%"
                                            readonly size="30" name="WorkFlowType" runat="server">
                                    </td>
                                    <td align="right" valign="top">
                                        <input class="button_sel" id="FileTypeSel" title="选择流程分类" style="height: 22px" onclick="SelWorkFlowType();"
                                            type="button" value=" " name="FileTypeSel" runat="server">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">发 起 人
                        </td>
                        <td class="TableTdContentStyle" colspan="5">
                            <input class="Control_ItemInputNoStyle" id="UserName" style="width: 90%" readonly
                                size="45" name="UserName" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">发起时间
                        </td>
                        <td class="TableTdContentStyle" colspan="5">
                            <input class="Control_ItemInputNoStyle" id="WorkStartDate" style="width: 90%" readonly
                                size="45" name="WorkStartDate" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">
                            <font style="color: Red">主题</font>
                        </td>
                        <td class="TableTdContentStyle" colspan="5">
                            <input class="Control_ItemInputNoStyle" id="TitleName" style="width: 90%" size="86"
                                name="TitleName" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdStyle">流程备注
                        </td>
                        <td class="TableTdContentStyle" colspan="5">
                            <input class="Control_ItemInputNoStyle" id="FlowMemo" style="width: 90%" size="54" name="FlowMemo"
                                runat="server">
                        </td>
                    </tr>
                    <tr id="Tr1" runat="server">
                        <td class="TableTdStyle">相关附件
                        </td>
                        <td class="TableTdContentStyle" colspan="5">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="90%">
                                        <div id="FileList" runat="server">
                                        </div>
                                    </td>
                                    <td align="right" valign="top">
                                        <input class="button_sel" id="BtUpFileAdjunct" title="上传附件" style="height: 22px"
                                            onclick="UpFileAdjunct();" type="button" value=" " name="btnSelCost" runat="server">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="SignContent">
                        <td class="TableTdStyle">处理意见
                        </td>
                        <td class="TableTdContentStyle" colspan="5">
                            <input class="Control_ItemInputNoStyle" id="TxtDealResult" style="width: 90%" size="78"
                                name="TxtDealResult" runat="server">
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdContentCenterStyle" colspan="6">会签/审批信息
                        </td>
                    </tr>
                    <tr>
                        <td class="TableTdContentStyle" colspan="6">
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
                            <asp:Label ID="TempMsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="WorkInfoDv2">
                <uc1:WebOffice ID="WebOfficeManage" runat="server"></uc1:WebOffice>
            </div>
            <div id="WorkInfoDv3">
                <uc1:WorkFlowView ID="WorkFlowManage" runat="server"></uc1:WorkFlowView>
            </div>
            <div id="WorkInfoDv4">
                <uc1:CheckLevel ID="CheckLevelInfo" runat="server"></uc1:CheckLevel>
            </div>
            <div id="WorkInfoDv5">
                <uc1:RelationWorkFlow ID="RelationWorkFlowManage" runat="server"></uc1:RelationWorkFlow>
            </div>
        </div>
        <br />
        <br />
        <br />
        <script language="javascript" type="text/javascript">

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
            var IsOpen = false;
            function SetStyle(Dv) {
                var elements = GetElements(document.getElementById("DvFrame"), 'DIV');

                for (var i = 0; i < elements.length; i++) {
                    if (elements[i].id != 'DvFrame' && elements[i].id != 'DvCheckLevel') {
                        if (elements[i] == Dv) {
                            elements[i].className = 'ContentButtonDown';
                            document.getElementById('WorkInfo' + elements[i].id).style.display = '';
                            if (i == 5) {
                                if (IsOpen == false) {
                                    IsOpen = true;
                                    var IsOp = "0";
                                    if (document.all.WorkFlowManage_InfoId.value == "-1") {
                                        IsOp = 1;
                                    }
                                    if (document.all.WorkFlowManage_TxtIsOpr.value == "1" && document.all.WorkFlowManage_TxtBtnCheckPass.value == "1") {
                                        IsOp = 1;
                                    }
                                    $("#RelationFrame").attr("src", "RelationFrame.aspx?BussId=" + $("#BussId").val() + "&IsOpr=" + IsOp);
                                }
                            }
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

            function SetReadOnly(State) {
                if (document.all.WorkFlowManage_TxtFlowSort.value != "0" || document.all.WorkFlowManage_TxtWorkFlowIsComplete.value == "2" || document.all.WorkFlowManage_TxtStartUser.value != document.all.WorkFlowManage_LoginCode.value) {
                    var elements = GetElements(document.getElementById("TableFrame"), 'INPUT');
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].disabled = State;
                    }
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
                    document.all.TxtDealResult.disabled = '';
                    document.all.BtUpFileAdjunct.disabled = '';
                    document.all.AddFile.value = '1';
                }
                else {
                    document.all.SignContent.style.display = 'none';
                }

                if (document.all.WorkFlowManage_TxtIsOpr.value == "1") {
                    document.all.TxtDealResult.disabled = '';
                    document.all.SignContent.style.display = '';
                    document.all.BtUpFileAdjunct.disabled = '';
                    document.all.AddFile.value = '1';
                }
                //默认允许新增附件，过程中不允许删除附件
                document.all.AddFile.value = '1';
            }

            SetReadOnly('true');

            function SelWorkFlowType() {
                //SetStyle(document.getElementById("Dv2"));
                var strPage = "../OAWorkFlow/FlowSortManageSelFilter.aspx?DirectionaryCode=0015&FilterFlow=" + encodeURI($("#FilterFlow").val()) + "&random=" + Math.random();
                var obj = window.showModalDialog(strPage, obj, 'dialogWidth=300px;dialogHeight=500px');
                if (obj != null) {
                    //var Ret=window.confirm("当前文件内容和流程信息会被覆盖，确定要覆盖当前文件内容和流程信息吗?");
                    //if(Ret==true)
                    //{
                    //加载模板工作流
                    LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                    //如果模板文档不为空,则加载模板文档

                    if (obj[3] != '') {
                        var ExtName = GetExtName(obj[3].toString());
                        OpenDoc(obj[3].toString(), ExtName);
                    }
                    //}

                    document.all.WorkFlowType.value = obj[1].toString();
                    document.all.WorkFlowTypeId.value = obj[0].toString();

                }

                SetStyle(document.getElementById("Dv1"));
                setFlowInfo();
            }

            function checkValue() {
               
                var isValid = $("#FrmForm").form('validate');
                if (isValid != true) return false;
                var FormValue = $("#FrmForm #WorkInfoDv1 input,#FrmForm #WorkInfoDv1 select,#FrmForm #WorkInfoDv1 radio,#FrmForm #WorkInfoDv1 textarea").serialize();
                $("#BussFormData").val(FormValue);
                if (document.all.WorkFlowTypeId.value == "") {
                    window.alert("请选择流程类别");
                    return false;
                }
                if (document.all.TitleName.value == "") {
                    window.alert("审核名称不能为空");
                    return false;
                }
                if (checkSubmit() == false) return false;
                DisabledBtn();
                return true;
            }

            function UpFileAdjunct() {
                var IsInit = "0";
                if (document.all.WorkFlowManage_InfoId.value == "-1") {
                    IsInit = 1;
                }
                else {
                    IsInit = 0;
                }
                var strPage = "../OAPublicWork/OAPublicWorkUpFileAdjunct.aspx?IsInit=" + IsInit + "&Type=0015&KeyId=" + document.all.KeyId.value + "&AddFile=" + document.all.AddFile.value + "&random=" + Math.random();
                var obj = window.showModalDialog(strPage, obj, 'dialogWidth=600px;dialogHeight=300px');

                if (obj != null) {
                    document.getElementById("FileList").innerHTML = obj;
                }
            }

        </script>
        <uc1:DivLine ID="DivLine1" runat="server"></uc1:DivLine>

        <script language="javascript" type="text/javascript">

            var FormView = $("#BussFormView").val();
            //加载业务表单
            $.tool.GetView(FormView,
                    function callback(_Data) {
                        $("#DvView").before(_Data);
                        //加载字典数据
                        _LoadDictionary();
                        //加载业务表单数据
                        $.tool.DataGet('BussFlowControl', 'Edit', 'ClassName=' + $("#ClassName").val() + '&Id=' + $("#BussId").val(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                    if (varObjects.length > 0) {
                                        $.JQForm._Data = _Data;
                                        $.JQForm.FillForm();
                                        //格式化表单数据
                                        FormatBussForm();
                                        //自定义回填数据
                                        FillView(varObjects[0]);
                                        //设置为可写 
                                        SetReadOnly('true');
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {

                                });
                    });

            function FormatBussForm() {
                $("input[format='date']").each(function (i) {
                    var v = $(this).val();
                    v = v.ToCustomizeDate();
                    $(this).val(v);
                });
            }
        </script>

    </form>
</body>
</html>
