<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAssignedManage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentAssignedManage" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>报事分派详情</title>

    <script type="text/javascript" src="../jscript/DateControl.js"></script>

    <script type="text/javascript" src="../jscript/ajax.js"></script>

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
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../editor/kindeditor.js" type="text/javascript"></script>
    <script src="../editor/lang/zh_CN.js" type="text/javascript"></script>
    <script src="../editor/plugins/code/prettify.js" type="text/javascript"></script>
    <link href="../editor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <link href="../editor/themes/default/default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

</head>

<script type="text/javascript">
    function CheckData() {

        if ($("#DealMan").val() == "") {

            HDialog.Info("请选择责任人!");
            DealMan.focus();
            return false;
        }


        if ($("#IncidentAcceptManage").form('validate')) {

            if ($("#TypeName").searchbox('getValue') == "") {
                HDialog.Info("请选择报事类别,此项不能为空!");

                TypeName.focus();
                return false;
            }

            var duty = $("input[name='Duty']:checked").val();
            $("#hiDuty").val(duty);

            var IsTouSu = $("input[name='IsTouSu']:checked").val();
            $("#hidenIsTouSu").val(IsTouSu);
            //alert($("#hidenIsTouSu").val());

            $("#btnSave").click();
            $("#btnSave").attr("disabled", "disabled");
            $("#BtnSapt").attr("disabled", "disabled");
            return true;
        }
        return false;
    }

    function printCheckData() {

        var IsTouSu = $("input[name='IsTouSu']:checked").val();
        $("#hidenIsTouSu").val(IsTouSu);
        //alert($("#hidenIsTouSu").val());

        if ($("#DealMan").val() == "") {
            HDialog.Info("请选择责任人!");
            DealMan.focus();
            return false;
        }

        if ($("#IncidentAcceptManage").form('validate')) {
            if (DispDate.value == "") {
                HDialog.Info("请输入派工时间,此项不能为空!");
                DispDate.focus();
                return false;
            }
            if (TypeID.value == "") {
                HDialog.Info("请选择报事类别,此项不能为空!");
                TypeName.focus();
                return false;
            }
            $("#BtnSapt").click();
            $("#btnSave").attr("disabled", "disabled");
            $("#BtnSapt").attr("disabled", "disabled");
            return true;
        }
        return false;
    }

</script>
<body id="bodyContent" onload="Win_OnLoad()" style="overflow-y: auto">
    <form id="IncidentAcceptManage" method="post" runat="server">
        <input id="IncidentID" size="1" type="hidden" name="IncidentID" runat="server">
        <input type="hidden" id="hiIncidentImgs" name="hiIncidentImgs" runat="server" />
        <input id="hiOPType" size="1" type="hidden" name="hiOPType" runat="server">
        <input id="hits" size="1" type="hidden" name="MainID" runat="server">
        <input style="width: 12px; height: 19px" id="CustID" size="1" type="hidden" name="CustID" runat="server">
        <input style="width: 12px; height: 19px" id="RoomID" size="1" type="hidden" name="RoomID" runat="server">
        <input style="width: 8px; height: 21px" id="PrintParms" size="1" type="hidden" name="PrintParms" runat="server">
        <input id="hiClassID" size="1" type="hidden" name="hiClassID" runat="server">

        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
        <input id="BigCorpTypeCode" name="BigCorpTypeCode" type="hidden" runat="server" />
        <input type="hidden" id="InfoId" name="InfoId" value="" runat="server" />
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input id="hiDealMan" name="hiDealMan" runat="server" type="hidden" />

        <input id="hidenIsTouSu" name="hidenIsTouSu" runat="server" type="hidden" />
        <input id="DealLimit" name="DealLimit" runat="server" type="hidden" />

        <input id="CMRProblemGUID" name="CMRProblemGUID" runat="server" type="hidden" />
        <%-- 报事编号跟明源同步时使用--%>
        <input id="CMRIsConsistent" name="CMRIsConsistent" runat="server" type="hidden" />
        <%--同步状态，0/null未同步/无需同步，1已同步，2已同步录入--%>
        <table id="Table2" class="DialogTable">
            <tr>
                <td bgcolor="#ffffff" valign="top">
                    <table id="Table3" class="DialogTable">
                        <tr>
                            <td height="3">
                                <table style="font-size: 12px" id="TablePrint" class="SchTable" cellspacing="0" cellpadding="0"
                                    width="100%" runat="server">
                                    <tr>
                                        <td colspan="4" align="right">
                                            <input id="btnAssignmentPrint" name="btnAssignmentPrint" class="button" value="打印派工单" type="button" runat="server">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table id="Header_TableMain" class="DialogTable">
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <table id="Table1" class="DialogTable" style="height: 100%; line-height: 25px">
                                        <tbody>
                                            <tr>
                                                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事受理</td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事类型</td>
                                                <td class="TdContent">
                                                    <asp:DropDownList ID="DrClass" runat="server" AutoPostBack="True"></asp:DropDownList>
                                                </td>
                                                <td class="TdTitle">报事方式</td>
                                                <td class="TdContent">
                                                    <asp:DropDownList ID="InfoSource" name="InfoSource" data-options="required:true" runat="server">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="呼叫中心" Value="呼叫中心"></asp:ListItem>
                                                        <asp:ListItem Text="项目受理" Value="项目受理"></asp:ListItem>
                                                        <asp:ListItem Text="员工APP" Value="员工APP"></asp:ListItem>
                                                        <asp:ListItem Text="业主APP" Value="业主APP"></asp:ListItem>
                                                        <asp:ListItem Text="IVR导航" Value="IVR导航"></asp:ListItem>
                                                        <asp:ListItem Text="微信报事" Value="微信报事"></asp:ListItem>
                                                        <asp:ListItem Text="其他来源" Value="其他来源"></asp:ListItem>
                                                        <asp:ListItem Text="业主APP/微信" Value="业主APP/微信"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事来源</td>
                                                <td class="TdContentSearch">
                                                    <select id="IncidentSource" name="IncidentSource" runat="server">
                                                        <option value="0">客户报事</option>
                                                        <option value="1">自查报事</option>
                                                    </select>
                                                </td>
                                                <td class="TdTitle">报事位置</td>
                                                <td class="TdContent">
                                                    <asp:RadioButton ID="rbplace1" runat="server" Text="户内" GroupName="rbplace" onclick="return false" AutoPostBack="True"></asp:RadioButton>&nbsp;
										            <asp:RadioButton ID="rbplace2" runat="server" Text="公区" GroupName="rbplace" onclick="return false" AutoPostBack="True"></asp:RadioButton>
                                                    <input id="hiplace" size="1" type="hidden" name="hiplace" runat="server">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事编号</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="IncidentNum" data-options="required:true" readonly
                                                        name="IncidentNum" runat="server"></td>
                                                <td class="TdTitle">是否投诉</td>
                                                <td class="TdContent">
                                                    <input id="IsTouSu1" type="radio" name="IsTouSu" value="1" onclick="return false" />是
                                                    <input id="IsTouSu2" type="radio" name="IsTouSu" value="0" onclick="return false" />否
                                                    <input id="hiIsTouSu" size="1" type="hidden" name="hiIsTouSu" runat="server">
                                                </td>
                                            </tr>
                                            <asp:Panel runat="server" ID="GGQY">
                                                <tr>
                                                    <td class="TdTitle">
                                                        <asp:Label ID="GQLable" runat="server" CssClass="formTable_Item">公区名称</asp:Label>
                                                    </td>
                                                    <td class="TdContentSearch">
                                                        <input style="width: 12px; height: 19px" id="RegionalID" size="1" type="hidden" name="hiRoomSign" runat="server">
                                                        <asp:DropDownList ID="RegionalPlace" Style="width: 15%;" runat="server" AutoPostBack="True" data-options="required:true"></asp:DropDownList>
                                                        &nbsp;&nbsp;公区方位：<input id="LocalePositionName" type="text" style="width: 15%;" runat="server" value="" disabled />
                                                        &nbsp;&nbsp;公区功能：<input id="LocaleFunctionName" type="text" style="width: 15%;" runat="server" value="" disabled />
                                                    </td>
                                                    <td class="TdTitle">
                                                        <asp:Label ID="EQLable" runat="server" CssClass="formTable_Item">设备</asp:Label></td>
                                                    <td class="TdContentSearch">
                                                        <asp:Label ID="lb1" runat="server" ForeColor="Red"></asp:Label>
                                                        <input type="text" class="easyui-searchbox" style="width: 76%;" id="EquipmentName" name="EquipmentName"
                                                            searcher="SelEqment" runat="server" readonly="readonly" />
                                                        <input class="button_sel" id="btnEqId" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                                                            type="button" value=" " name="btnEqId" runat="server">
                                                        <input id="EqId" name="EqId" type="hidden" runat="server" />
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td class="TdTitle">
                                                    <asp:Label ID="LRoomSign" runat="server" CssClass="formTable_Item">房屋编号</asp:Label>
                                                </td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="RoomSign" readonly name="RoomSign" runat="server" />
                                                    <input id="btnSelRoom" class="button_sel" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                                                        value=" " type="button" name="btnSelRoom" runat="server">
                                                    <%--<input style="height: 20px" id="BtnSel" class="button_sel" disabled onclick="javascript: if (btnSelRegional_OnClick() == false) return false;"
                                                        type="button" name="BtnSel" runat="server">--%>
                                                </td>
                                                <td class="TdTitle">
                                                    <asp:Label ID="LUserName" runat="server" CssClass="formTable_Item">客户名称</asp:Label>
                                                </td>
                                                <td class="TdContentSearch">
                                                    <input type="text" class="easyui-searchbox" style="width: 50%;" id="CustName" name="CustName" data-options="required:true, editable:false"
                                                        runat="server" />
                                                    <input class="button_sel" id="btnSelCust" onclick="javascript: if (btnSelCust_OnClick() == false) return false;"
                                                        type="button" value=" " name="btnSelCust" runat="server">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报 事 人:</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="IncidentMan" readonly name="IncidentMan" runat="server" />
                                                </td>
                                                <td class="TdTitle">报事电话:</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="Phone" readonly name="Phone" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle" rowspan="2">
                                                    <input id="PhTypeID" style="height: 22px; width: 32px" type="hidden" size="1" name="PhTypeID" runat="server">报事内容</td>
                                                <td class="TdContent" rowspan="2" colspan="4">
                                                    <textarea style="width: 90%; height: 90px" class="easyui-validatebox" readonly id="IncidentContent" name="IncidentContent"
                                                        runat="server"></textarea>
                                                </td>
                                            </tr>
                                            <tr></tr>

                                            <tr>
                                                <td class="TdTitle">报事责任</td>
                                                <td class="TdContent">
                                                    <input id="IncidentP1" type="radio" value="物业类" name="Duty" runat="server" />物业类
                                                    <input id="IncidentP2" type="radio" value="地产类" name="Duty" runat="server" />地产类
                                                    
                                                    <input id="hiDuty" name="hiDuty" type="hidden" runat="server" />
                                                </td>
                                                <td class="TdTitle">报事类别</td>
                                                <td class="TdContentSearch">
                                                    <input type="text" class="easyui-searchbox" style="width: 76%;" id="TypeName" name="TypeName" data-options="required:true,editable:false"
                                                        searcher="SelTypeName" runat="server" />
                                                    <input id="btnSelType" class="button_sel" value=" " type="button" name="btnSelType" runat="server">
                                                    <input style="width: 8px; height: 22px" id="TypeID" class="easyui-validatebox" size="1" type="hidden" name="TypeID" runat="server">
                                                    <input class="easyui-validatebox" id="hiTypeName" style="height: 22px; width: 8px" type="hidden" size="1" name="hiCostName" runat="server">
                                                    <input id="TypeCode" name="TypeCode" type="hidden" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">预约处理时间</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="ReserveDate" name="AskDealLimit" runat="server" /></td>
                                                <td class="TdTitle">是否收费</td>
                                                <td class="TdContent">
                                                    <input id="IsFees1" type="radio" value="1" name="IsFees" runat="server" disabled="disabled" />是
                                                    <input id="IsFees2" type="radio" value="0" name="IsFees" runat="server" disabled="disabled" />否
                                                    <input type="hidden" id="hiIsFees" name="hiIsFees" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">受理时间:</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="IncidentDate" readonly name="IncidentDate" runat="server" />
                                                </td>
                                                <td class="TdTitle">受 理 人: </td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="Admiman" readonly name="Admiman" runat="server" />
                                                </td>
                                            </tr>
                                            <asp:Panel ID="AutopaClass" runat="server">

                                                <tr class="trCrmBtnKZ">
                                                    <td colspan="4" style="height: 4px;">
                                                </tr>
                                                <tr class="trCrmBtnKZ">
                                                    <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事分派</td>
                                                </tr>
                                                <tr class="trCrmBtnKZ">
                                                    <td colspan="4" style="height: 4px;">
                                                </tr>


                                                <tr class="trCrmBtnKZ">

                                                    <td class="TdTitle">派工单号</td>
                                                    <td class="TdContent">
                                                        <input class="easyui-validatebox" id="CoordinateNum" name="CoordinateNum" runat="server" />
                                                    </td>
                                                    <td class="TdTitle">分 派 人:</td>
                                                    <td class="TdContent">
                                                        <input class="easyui-validatebox" id="DispMan" readonly name="DispMan" runat="server" />
                                                    </td>
                                                </tr>

                                                <tr class="trCrmBtnKZ">
                                                    <td class="TdTitle">分派时间:</td>
                                                    <td class="TdContent">
                                                        <input class="easyui-validatebox" id="DispDate" readonly name="DispDate" runat="server" />
                                                    </td>
                                                    <td class="TdTitle">逾期时间: </td>
                                                    <td class="TdContent">
                                                        <input class="easyui-validatebox" id="ReserveDealDate" readonly name="ReserveDealDate" runat="server" />
                                                    </td>
                                                </tr>

                                                <tr class="trCrmBtnKZ">
                                                    <td class="TdTitle">责任人</td>
                                                    <td class="TdContentSearch">
                                                        <input type="text" class="easyui-searchbox" style="width: 76%;" data-options="required:true, editable:false"
                                                            id="DealMan" name="DealMan" searcher="SelDealMan" runat="server" />
                                                        <input id="btnDealMan" class="button_sel" value="" type="button" name="btnDealMan" runat="server">

                                                        <input style="width: 16px; height: 22px" id="UserCodes" size="1" type="hidden" name="UserCodes" runat="server" />
                                                    </td>
                                                    <td class="TdTitle">协助人</td>
                                                    <td class="TdContentSearch">
                                                        <input id="CoorganizerUserList" name="CoorganizerUserList" runat="server" searcher="ExaCoorganizer" class="easyui-searchbox" options="ditable:false" style="width: 76%;" />
                                                        <input id="DealManCheckedUserLists" type="hidden" name="DealManCheckedUserLists" runat="server" disabled readonly="readonly" runat="server" />
                                                        <input id="CoorganizerUser" type="hidden" name="CoorganizerUser" runat="server" />
                                                        <input id="CoorganizerUserCode" type="hidden" name="CoorganizerUserCode" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr class="trCrmBtnKZ">
                                                    <td class="TdTitle" rowspan="2">分派备注:</td>
                                                    <td class="TdContent" rowspan="2" colspan="4">
                                                        <textarea style="width: 90%; height: 45px" class="easyui-validatebox" id="DispRemarks" name="DispRemarks"
                                                            runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr class="trCrmBtnKZ"></tr>
                                                <tr class="trCrmBtnKZ">
                                                    <td class="TdTitle" id="imageTitle">照片<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage()">(上传)</a> ：
                                                    </td>
                                                    <td id="ImageContent" class="TdContent" colspan="3"></td>

                                                </tr>
                                                <tr class="trCrmBtnKZ">
                                                    <td class="TdTitle">附件<a id="UpFile" style="color: #688aed; cursor: pointer;" onclick="UploadFile()">(上传)</a>：
                                                    </td>
                                                    <td class="TdContent" colspan="3">
                                                        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                                                        </div>
                                                    </td>

                                                </tr>

                                            </asp:Panel>
                                            <tr class="trCrmBtnKZ">
                                                <td class="TdContent" style="width: 400px; height: 60px"></td>
                                            </tr>
                                            <tr class="trCrmBtnKZ">
                                                <td colspan="4" align="center">
                                                    <input class="button" type="button" value="保存" onclick="javascript: CheckData();" runat="server" />
                                                    <input id="btnSave" style="display: none;" class="button" value="保存" type="button" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;
                                    <input class="button" type="button" value="保存并打印" onclick="javascript: printCheckData();" runat="server" />
                                                    <input id="BtnSapt" class="button" visible="true" style="display: none;" value="保存并打印" type="button" name="BtnSapt" runat="server">&nbsp;&nbsp;&nbsp;
                                    <%--<input class="button" id="btnReturn" type="button" value="废弃" name="btnReturn" onclick="DeleteDetail() " runat="server">--%>
                                                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" runat="server">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>

                            </tr>

                        </tbody>
                    </table>

                </td>

            </tr>

        </table>
        <%--<table class="DialogTable">
            <tr valign="top">
                <td class="TdTitle">催办信息</td>
                               <td></td>
            </tr>
        </table>--%>
        <div style="height: 300px;">
            <iframe id="IncidentFrame" src="" style="width: 100%; height: 100%; border: none;" class="Frm"></iframe>
        </div>


        <script type="text/javascript">

            function Win_OnLoad() {
                var strPrintParms = getObject("PrintParms").value;

                if (strPrintParms != "") {
                    //alert(strPrintParms);			
                    showOperatWin(strPrintParms);

                    getObject("PrintParms").value = "";
                }
            }

            $(document).ready(function () {
                if ($("#CMRIsConsistent").val() == "1") {
                    $(".trCrmBtnKZ").hide();
                }
            });

            function Init() {

                var tousu = $("#hiIsTouSu").val();
                $(":radio[name='IsTouSu'][value='" + tousu + "']").prop("checked", "checked");

                var duty = $("#hiDuty").val();
                $(":radio[name='Duty'][value='" + duty + "']").prop("checked", "checked");


                $('#btnSelType').hide();
                $('#btnSelRoom').hide();
                $('#btnSelCust').hide();
                $('#btnEqId').hide();
                $('#btnDealMan').hide();
            }

            Init();

            $(function () {
                $("#DealMan").searchbox("setValue", $("#hiDealMan").val());
                $("#IncidentP1").change(function () {
                    $("#TypeID").val('');
                    $("#hiTypeName").val('');
                    $("#TypeName").searchbox("setValue", '');
                    $('#TypeCode').val('');

                    $("#DealMan").searchbox("setValue", '');
                    $("#UserCodes").val('');
                    $("#hiDealMan").val('');
                });
                $("#IncidentP2").change(function () {
                    $("#TypeID").val('');
                    $("#hiTypeName").val('');
                    $("#TypeName").searchbox("setValue", '');
                    $('#TypeCode').val('');

                    $("#DealMan").searchbox("setValue", '');
                    $("#UserCodes").val('');
                    $("#hiDealMan").val('');
                });

                Picture();
                LoadList();

                $('#IncidentFrame').attr('src', '../IncidentNewJH/ProcessingManageFooter.aspx?IncidentID=' + IncidentID.value + "&OpType=GDC");
            })



            function Picture() {

                //加载受理、跟进图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentAssignedManage.aspx?Method=GetFiles&IncidentID=" + IncidentID.value,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {

                    },
                    success: function (data) {
                        if (data) {
                            $('#imageTitle').css('height', '120px');
                            $('#ImageContent').append(data);
                        }
                    }
                });
                //加载附件
            }

            function add0(m) { return m < 10 ? '0' + m : m }
            function formatDate(needTime) {
                //needTime是整数，否则要parseInt转换
                var time = new Date(needTime);
                var y = time.getFullYear();
                var m = time.getMonth() + 1;
                var d = time.getDate();
                var h = time.getHours();
                var mm = time.getMinutes();
                var s = time.getSeconds();

                return y + '-' + add0(m) + '-' + add0(d) + ' ' + add0(h) + ':' + add0(mm) + ':' + add0(s);
            }
            function SelTypeName() {
                var duty = $("input[name='Duty']:checked").val();
                if ($("#hirbplace").val() == 1 && $("#RoomID").val() == '') {

                    HDialog.Info('请先选择房屋编号');
                }
                else {
                    HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeBigDlg.aspx?ClassID=' + $("#DrClass").val() + '&Duty=' + duty + '&IsCheck=1&IsEdit=true&IncidentPlace=' + $("#hiplace").val(), '选择报事类别', false, function callback(_Data) {
                        var arrRet = JSON.parse(_Data);
                        $("#TypeID").val(arrRet.id);
                        $("#hiTypeName").val(arrRet.TypeName);
                        $("#TypeName").searchbox("setValue", arrRet.TypeName);
                        $('#TypeCode').val(arrRet.code);
                        //$("#RatedWorkHour").val(arrRet.RatedWorkHour);
                        //$("#KPIRatio").val(arrRet.KPIRatio);
                        $("#DealLimit").val(arrRet.DealLimit);
                        if (arrRet.DealLimit != undefined && arrRet.DealLimit != '') {
                            var ReserveDate = new Date($("#ReserveDate").val()); //预约处理时间
                            var Hours = parseFloat(parseFloat(ReserveDate.getHours()) + parseFloat(arrRet.DealLimit));
                            ReserveDate = ReserveDate.setHours(Hours);
                            $("#ReserveDealDate").val(formatDate(ReserveDate));  //逾期时间 
                        } else {
                            $("#ReserveDealDate").val($("#ReserveDate").val());
                        }

                        $("#BigCorpTypeID").val(arrRet.id);
                        $('#BigCorpTypeCode').val(arrRet.code);


                        if (arrRet.IsTouSu == "0") {

                            $(":radio[name='IsTouSu'][value='" + arrRet.IsTouSu + "']").prop("checked", "checked")

                            $("#hiIsTouSu").val(0);
                        } else {

                            $(":radio[name='IsTouSu'][value='" + arrRet.IsTouSu + "']").prop("checked", "checked")

                            $("#hiIsTouSu").val(1);
                        }

                        $("#DealMan").searchbox("setValue", '');
                        $("#UserCodes").val('');
                        $("#hiDealMan").val('');


                    });
                }
            }



            function SelDealMan() {
                if ($("#TypeName").searchbox('getValue') == "") {

                    HDialog.Info('请选择报事类别');
                }
                else {
                    var BigCorpTypeID = $("#BigCorpTypeID").val();
                    if (BigCorpTypeID.indexOf(',') == 0) {
                        BigCorpTypeID = BigCorpTypeID.substring(1, BigCorpTypeID.length);
                    }
                    if (BigCorpTypeID.lastIndexOf(',') == BigCorpTypeID.length - 1) {
                        BigCorpTypeID = BigCorpTypeID.substring(0, BigCorpTypeID.length - 1);
                    }
                    HDialog.Open('640', '480', '../DialogNew/IncidentDealMan.aspx?IsAssignedBatch=1&BigCorpTypeID=' + BigCorpTypeID, '选择责任人', false, function callback(_Data) {
                        var arrRet = _Data.split('\t');
                        $("#DealMan").searchbox("setValue", arrRet[1]);
                        $("#UserCodes").val(arrRet[0]);
                        $("#hiDealMan").val(arrRet[1]);
                        //alert($("#DealMan").val());
                    });
                }
            }

            function ExaCoorganizer() {
                if ($("#TypeName").searchbox('getValue') == "") {
                    HDialog.Info('请选择报事类别');
                }
                else {
                    var BigCorpTypeID = $("#BigCorpTypeID").val();
                    if (BigCorpTypeID.indexOf(',') == 0) {
                        BigCorpTypeID = BigCorpTypeID.substring(1, BigCorpTypeID.length);
                    }
                    if (BigCorpTypeID.lastIndexOf(',') == BigCorpTypeID.length - 1) {
                        BigCorpTypeID = BigCorpTypeID.substring(0, BigCorpTypeID.length - 1);
                    }
                    HDialog.Open('740', '480', '../DialogNew/IncidentDealManChecked.aspx?IsAssignedBatch=1&BigCorpTypeID=' + BigCorpTypeID + '&CheckedUserLists=' + $("#DealManCheckedUserLists").val(), '选择协助人', false,
                        function callback(_Data) {
                            $("#DealManCheckedUserLists").val(_Data);
                            var arrRet = _Data.split(',');
                            var username = "";
                            var usercode = "";
                            for (var i = 0; i < arrRet.length; i++) {
                                if (arrRet[i] != '') {
                                    username += arrRet[i].split('|')[1] + ",";
                                    usercode += arrRet[i].split('|')[0] + ",";
                                }
                            }
                            if (username != "") {
                                username = username.substring(0, username.length - 1);
                                usercode = usercode.substring(0, usercode.length - 1);
                            }
                            $("#CoorganizerUserCode").val(usercode);
                            $("#CoorganizerUser").val(username);
                            //$("#CoorganizerUserList").val(username);
                            $("#CoorganizerUserList").searchbox("setValue", username);
                            return true;
                        });
                }
            }

            $("#btnReturn").click(function () {
                if ($("#InfoId").val() != "") {
                    location.href = "../IncidentNewJH/IncidentAssignedBrowse.aspx";
                } else {
                    HDialog.Close();
                }
            });

            function DeleteDetail() {
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open('650', '280', '../IncidentNewJH/IncidentAssignedDeleteReasons.aspx?IncidentID=' + ID + '&OpType=' + OpType, title, false, function callback(_Data) {
                    //$('#SearchDlg').parent().appendTo($("form:first"));
                    if (_Data == 1) {
                        HDialog.Close();
                    }

                });
            }

            function SelEqment() {
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../DialogNew/EquipmentChoiceDlg.aspx?CommID=' + $("#hiCommID").val(), '选择设备', false, function callback(_Data) {

                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $('#EqId').val(data.Id);
                        $('#EquipmentName').searchbox('setValue', data.EquipmentName);

                    }
                });
            }



            /****图片开始  ****/
            //查看图片
            function ImageBlclick(fAdjunctCode) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + IncidentID.value, '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }

            //查看app上传的图片
            function ImageAppBlclick(imgPath) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + imgPath + "&IncidentID=" + IncidentID.value, '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }

            function UploadImage() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=分派图片", '上传图片', false, function callback(_Data) {
                    if (_Data) {
                        $('#ImageContent').append(CreateSmImg(_Data));
                        $('#imageTitle').css('height', '120px')
                    }
                });
            }
            function CreateSmImg(srcs) {
                var sindex = srcs.lastIndexOf('\\') + 1;
                var eindex = srcs.lastIndexOf('.');
                var fileName = srcs.substring(sindex, eindex);
                var sb = "";
                sb += "<div class=\"addpicdiv\" style=\"width: 71px; height: 71px; float: left; margin-right: 15px; position: relative;text-align:center;\" ondblclick=\"ImageBlclick('" + fileName + "')\">";
                sb += "<img src=\"" + srcs + "\" style=\"width: 71px; height: 71px;\" />";
                sb += "  <div style=\"position: absolute; width: 18px; height: 18px; border-radius: 18px; font-size: 13px; background-color: #e0a70b; color: white; text-align: center; vertical-align: middle; top: -5px; left: 60px; cursor: pointer\" onclick=\"closeImage(this,'" + fileName + "')\">";
                sb += "  ×";
                sb += "   </div>";
                sb += "   <label style=\"font-size:8px;top: -5px;position: relative;\">" + fileName.substring(0, 8) + "(分派)</label>";
                sb += " </div>";
                return sb;
            }
            function closeImage(obj, AdjunctCode) {
                //删除图片
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentAcceptManage.aspx?Method=DeleteFile&IncidentID=" + IncidentID.value + "&FileName=" + AdjunctCode,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {
                        alert('出错');
                    },
                    success: function (data) {
                        $(obj).parent().remove();
                        var imageContent = $.trim($('#ImageContent').html());
                        if (!imageContent) {
                            $('#imageTitle').css('height', '10px')
                        }
                    }
                });
            };
            /****图片结束  ****/
            /* ****附件开始*****/
            var column = [[
                { field: 'IncidentID', title: '报事ID', width: 160, align: 'left', sortable: true },
                {
                    field: 'AdjunctCode', title: '上传日期', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 8);
                    }
                },
                {
                    field: 'AdjunctName', title: '文件分类', width: 80, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        return value.substring(0, 2);
                    }
                },
                { field: 'FileSize', title: '文件尺寸', width: 80, align: 'left', sortable: true },
                {
                    field: 'DeleteOp', title: '删除', width: 80, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='###' onclick=\"PostRequest('DeleteFile', '" + row.AdjunctCode + "');\">删除</a>";
                        return str;
                    }
                },
                {
                    field: 'UpLoadOp', title: '下载', width: 100, align: 'center', sortable: false,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"" + row.FilPath + "\" target=\"_blank\" \">下载</a>";
                        return str;
                    }
                }
            ]];
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
                    columns: column,
                    fitColumns: false,
                    rownumbers: true,
                    pagination: false,
                    border: false,
                    remoteSort: false,
                    width: "100%",
                    onBeforeLoad: function (param) {
                        param = GetParamNoPageKey("IncidentProcessingNew", "GetIncidentFiles", "TableContainer", param, IncidentID.value);
                    }
                });
            }
            function GetParamNoPageKey(Class, Command, GridContainer, Param, incidentID) {
                Param.Method = "DataPost";
                Param.Class = Class;
                Param.Command = Command;
                Param.IncidentID = incidentID;
                return Param;
            };
            //加载附件
            LoadList();
            //上传文件
            function UploadFile() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=分派文件", '上传文件', false, function callback(_Data) {
                    if (_Data) {
                        LoadList();
                    }
                });
            }
            //删除文件
            function PostRequest(method, adjunctCode) {
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentAssignedManage.aspx?Method=" + method + "&IncidentID=" + IncidentID.value + "&FileName=" + adjunctCode,
                    async: true,
                    cache: false,
                    error: function (request) {
                        alert('出错');
                    },
                    success: function (data) {
                        if (method == 'DeleteFile') {
                            LoadList();
                        }
                    }
                });
            }
            function doLoadFile(adjunctCode) {
                //var url = "/HM/M_Main/IncidentNewJH/IncidentAssignedManage.aspx?Method=DoLoadFiles&IncidentID=" + IncidentID.value + "&FileName=" + adjunctCode
                //jQuery('<form action="' + url + '" method="post"></form>').appendTo('body').submit().remove();
            };

            /* ****附件结束*****/


        </script>

    </form>
</body>
</html>
