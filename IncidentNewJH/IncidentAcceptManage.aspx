<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAcceptManage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentAcceptManage" %>

<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>报事受理</title>
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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <link href="../Jscript-Ui/jquery-ui-1.10.2/css/ui-lightness/jquery-ui-1.10.2.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.position.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.menu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-ui-1.10.2/development-bundle/ui/jquery.ui.autocomplete.js"></script>

    <script type="text/javascript">
        var IsSubmitFlag = true;
        function CheckData(type) {
            if (IsSubmitFlag == false) { return; }
            if ($("#hirbplace").val() == 1 && $("#RoomID").val() == '') {
                HDialog.Info('请先选择房屋编号');
                IncidentAcceptManage.TypeName.focus();
                return false;
            }
            if (IncidentAcceptManage.IncidentNum.value == "") {
                HDialog.Info("请输入报事编号,此项不能为空!");
                IncidentAcceptManage.IncidentNum.focus();
                return false;
            }
            if ($('#hirbplace').val() == "2") {
                if ($('#RegionalPlace').val() == "0" || $('#RegionalPlace').val() == "") {
                    HDialog.Info("请选择公区名称,此项不能为空!");
                    return false;
                }
                if ($("#LocalePositionNameIsMustFill").val() == "1") {
                    if ($('#LocalePositionCode').val() == "0" || $('#LocalePositionCode').val() == "") {
                        HDialog.Info("请选择公区方位,此项不能为空!");
                        return false;
                    }
                }
                if ($("#LocaleFunctionNameIsMustFile").val() == "1") {
                    if ($('#LocaleFunctionCode').val() == "0" || $('#LocaleFunctionCode').val() == "") {
                        HDialog.Info("请选择公区功能,此项不能为空!");
                        return false;
                    }
                }
            }
            if ($("#TypeName").searchbox('getValue') == "") {
                HDialog.Info("请选择报事类别,此项不能为空!");
                IncidentAcceptManage.TypeName.focus();
                return false;
            }
            if ($('#hirbplace').val() == "1") {
                if ($('#CustID').val() == "") {
                    HDialog.Info("请选择客户名称,此项不能为空!");
                    IncidentAcceptManage.CustName.focus();
                    return false;
                }
            }

            //公区报事，报事来源如果是业主报事，强制选择房号
            if ($("#IncidentSource").val() == "客户报事" && $("#hirbplace").val() == 2 && $("#RoomID").val() == '') {
                HDialog.Info('请先选择房屋编号');
                IncidentAcceptManage.TypeName.focus();
                return false;
            }

            if (IncidentAcceptManage.IncidentMan.value == "") {
                HDialog.Info("请输入报事人,此项不能为空!");
                IncidentAcceptManage.IncidentMan.focus();
                return false;
            }

            if ($('#IncidentContent').val() == "") {
                HDialog.Info("请输入报事内容,此项不能为空!");
                IncidentAcceptManage.IncidentContent.focus();
                return false;
            }

            if (IncidentAcceptManage.Phone.value == "") {
                HDialog.Info("请输入报事电话,此项不能为空!");
                IncidentAcceptManage.Phone.focus();
                return false;
            }


            if ($('#DrClass').val() == '2') {
                if ($("#UserCodes").val() == '') {
                    HDialog.Info('口头报事请选择处理人');
                    return false;
                }
            }

            if ($('#DrClass').val() == '2') {
                if ($("#FineTypeName").val() == '') {
                    HDialog.Info('口头报事须选择细类!');
                    return false;
                }
            }

            if ($("#InfoSource").find("option:selected").text() == "") {
                HDialog.Info("请选择报事方式，此项不能为空！");
                IncidentAcceptManage.InfoSource.focus();
                return false;
            }

            if ($('#ReserveDate').val() == '') {
                HDialog.Info('请选择预约处理时间，此项不能为空!');
                return false;
            }

            if (type == "1") {
                $("#hidbuttonType").val("1");
            } else {
                $("#hidbuttonType").val("2");
            }
            IsSubmitFlag = false;
            setTimeout('IsSubmitFlag=true', 20000);
            $("#btnSave").click();


            return true;
        }
    </script>

    <script type="text/javascript">
        function max(img) {
            window.open(img.src, "新窗口", "height=400;width=800");
        }
        function deleteImg(obj) {
            var value = $(obj).parent()[0].children[1].value;
            $("#hiIncidentImgs").val($("#hiIncidentImgs").val().replace(value + ",", ""));
            $(obj).parent().remove();

        }
        function Win_OnLoad() {
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                //alert(strPrintParms);			
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
                if ($('#IsPrint').val() == "1") {
                    HDialog.Info('保存成功');
                    HDialog.Close(1);
                }
            }
        }

    </script>

</head>
<body onload="Win_OnLoad()" style="overflow-y: scroll;">
    <form id="IncidentAcceptManage" method="post" runat="server">
        <input id="hiSearchFastKey" type="hidden" runat="server" />
        <input type="hidden" id="LocaleFunctionNameIsMustFile" name="LocaleFunctionNameIsMustFile" value="0" runat="server" />
        <input type="hidden" id="LocalePositionNameIsMustFill" name="LocalePositionNameIsMustFill" value="0" runat="server" />

        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="IncidentID" type="hidden" size="1" name="IncidentID" runat="server">
        <input id="hiClassID" type="hidden" size="1" name="hiClassID" runat="server">
        <input id="hirbplace" name="hirbplace" type="hidden" runat="server" />
        <input id="hiDuty" name="hiDuty" type="hidden" runat="server" />
        <input id="hiIsTouSu" name="hiIsTouSu" type="hidden" runat="server" />
        <input id="DispType" name="DispType" type="hidden" runat="server" />
        <input id="hiCustName" style="height: 19px; width: 12px" type="hidden" size="1" name="hiCustName" runat="server">
        <input id="CustID" style="height: 19px; width: 12px" type="hidden" size="1" name="CustID" runat="server" designtimedragdrop="77">
        <input id="hiIncidentImgs" name="hiIncidentImgs" type="hidden" runat="server" />
        <input type="hidden" id="RequestURLName" name="RequestURLName" runat="server" />

        <input type="hidden" id="PrintParms" name="PrintParms" runat="server" />
        <input id="TaskEqId" name="TaskEqId" type="hidden" runat="server">
        <input type="button" id="btnPrint" name="btnPrint" runat="server" style="display: none" />


        <input type="hidden" id="hidbuttonType" name="hidbuttonType" runat="server" value="0" />

        <input id="ThisLoginUserName" name="ThisLoginUserName" type="hidden" runat="server">
        <input id="ThisLoginUserCode" name="ThisLoginUserCode" type="hidden" runat="server">

        <input id="hiContent" name="hiContent" runat="server" type="hidden" />
        <input id="DispLimit" name="DispLimit" type="hidden" runat="server" />
        <input id="DealLimit" name="DealLimit" type="hidden" runat="server" />
        <input id="DealLimit2" name="DealLimit2" type="hidden" runat="server" />
        <input id="RatedWorkHour" name="RatedWorkHour" type="hidden" runat="server" />
        <input id="RatedWorkHourNumber" name="RatedWorkHourNumber" type="hidden" runat="server" />
        <input id="KPIRatio" name="KPIRatio" type="hidden" runat="server" />
        <input id="ContSubDate" name="ContSubDate" type="hidden" runat="server" />
        <input id="BigCorpTypeID" name="BigCorpTypeID" type="hidden" runat="server" />
        <input id="BigCorpTypeCode" name="BigCorpTypeCode" type="hidden" runat="server" />
        <input id="hiimgIncidentID" name="hiimgIncidentID" type="hidden" runat="server" />

        <input id="hiImgGUID" name="hiImgGUID" type="hidden" runat="server" />
        <input id="ReserveLimit" name="ReserveLimit" type="hidden" runat="server" />
        <input id="IncidentPlace" name="IncidentPlace" type="hidden" runat="server" />

        <input id="hiInfoSource" name="hiInfoSource" type="hidden" runat="server" />
        <input id="AdmiDate" name="AdmiDate" type="hidden" runat="server" />
        <input id="hiTaskId" name="hiTaskId" type="hidden" value="" runat="server" />

        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />

        <input type="hidden" id="ThisUserName" name="ThisUserName" runat="server" />

        <input class="easyui-validatebox" id="FineCorpTypeID" style="height: 22px; width: 8px" type="hidden" size="1" name="FineCorpTypeID" runat="server">
        <input class="easyui-validatebox" id="FineCorpTypeCode" style="height: 22px; width: 8px" type="hidden" size="1" name="FineCorpTypeCode" runat="server">
        <input class="easyui-validatebox" id="FineTypeName" style="height: 22px; width: 8px" type="hidden" size="1" name="FineTypeName" runat="server">
        <input class="easyui-validatebox" id="FinehiCostName" style="height: 22px; width: 8px" type="hidden" size="1" name="FinehiCostName1" runat="server">
        <table id="Header_TableMain" class="DialogTable">
            <tr>
                <td class="TdContent" style="width: 400px; height: 20px;"></td>
            </tr>
            <tr>
                <td valign="top">
                    <table class="DialogTable" id="Table1" align="center">
                        <tr>
                            <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事受理</td>
                        </tr>
                        <tr>
                            <td class="TdTitle">报事类型</td>
                            <td class="TdContent">
                                <asp:DropDownList ID="DrClass" Style="width: 45%;" runat="server" AutoPostBack="True"></asp:DropDownList>
                            </td>
                            <td class="TdTitle">报事方式</td>
                            <td class="TdContentSearch">
                                <select id="InfoSource" style="width: 45%;" name="InfoSource" runat="server"></select>
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">报事来源</td>
                            <td class="TdContentSearch">
                                <select id="IncidentSource" name="IncidentSource" style="width: 45%;" runat="server" onchange="IsChoiceRoom()">
                                    <option value="客户报事">客户报事</option>
                                    <option value="自查报事">自查报事</option>
                                </select>
                            </td>
                            <td class="TdTitle">报事位置</td>
                            <td class="TdContent">
                                <asp:RadioButton ID="rbplace1" runat="server" Text="户内" GroupName="rbplace" onclick="ReseleTypeName();" Checked="True" AutoPostBack="True"></asp:RadioButton>&nbsp;
										     <asp:RadioButton ID="rbplace2" runat="server" Text="公区" GroupName="rbplace" onclick="ReseleTypeName();" AutoPostBack="True"></asp:RadioButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">报事编号</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="IncidentNum" data-options="required:true" style="width: 95%;" readonly
                                    name="IncidentNum" runat="server"></td>
                            <td class="TdTitle">是否投诉</td>
                            <td class="TdContent">
                                <input id="IsTouSu1" disabled="disabled" type="radio" name="IsTouSu" onclick="return true" value="1" />是
                                <input id="IsTouSu2" disabled="disabled" type="radio" name="IsTouSu" onclick="return true" value="0" checked="checked" />否
                            </td>
                        </tr>
                        <asp:Panel runat="server" ID="GGQY">
                            <tr>
                                <td class="TdTitle">
                                    <asp:Label ID="GQLable" runat="server" CssClass="formTable_Item">公区名称</asp:Label>
                                </td>
                                <td class="TdContentSearch">
                                    <%--<asp:DropDownList ID="RegionalPlace" runat="server" AutoPostBack="True" data-options="required:true"></asp:DropDownList>--%>
                                    <input type="text" class="easyui-searchbox" data-options="prompt:'选择公共名称',multiple:true" id="RegionalPlaceName" name="RegionalPlaceName"
                                        style="width: 160px;" searcher="SelRegionalPlace" runat="server" />
                                    <input id="RegionalPlace" type="hidden" name="RegionalPlace" />

                                    <input type="text" class="easyui-searchbox" data-options="prompt:'选择公区方位',multiple:true" id="LocalePositionName" name="LocalePositionName"
                                        style="width: 160px;" searcher="SelLocalePosition" runat="server" />
                                    <input id="LocalePositionCode" type="hidden" name="LocalePositionCode" />

                                    <input type="text" class="easyui-searchbox" data-options="prompt:'选择公区功能',multiple:true" id="LocaleFunctionName" name="LocaleFunctionName"
                                        style="width: 160px;" searcher="SelLocaleFunction" runat="server" />
                                    <input id="LocaleFunctionCode" type="hidden" name="LocaleFunctionCode" />
                                </td>
                                <td class="TdTitle">
                                    <asp:Label ID="EQLable" runat="server" CssClass="formTable_Item">设备</asp:Label></td>
                                <td class="TdContentSearch">
                                    <asp:Label ID="lb1" runat="server" ForeColor="Red"></asp:Label>
                                    <input type="text" class="easyui-searchbox" style="width: 75%;" id="EquipmentName" name="EquipmentName" searcher="SelEqment" runat="server" />
                                    <input class="button_sel" id="btnEqId" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                                        type="button" value=" " name="btnEqId" runat="server">
                                    <input id="EqId" name="EqId" type="hidden" runat="server" />
                                </td>
                            </tr>
                        </asp:Panel>

                        <%--快速检索--%>
                        <tr>
                            <td class="TdTitle">快速检索</td>
                            <td colspan="3" class="TdContent" style="width: 85%;">
                                <input name="FastKey" type="text" id="FastKey" style="width: 90%;" placeholder="房屋编号/客户名称/联系电话" />
                            </td>
                        </tr>
                        <%--快速检索结束--%>

                        <tr>
                            <td class="TdTitle">
                                <asp:Label ID="LRoomSign" runat="server" CssClass="formTable_Item">房屋编号</asp:Label></td>

                            <td class="TdContentSearch">
                                <input type="text" class="easyui-searchbox" style="width: 80%;" id="RoomSign" name="RoomSign" data-options="required:true, editable:false"
                                    searcher="SelRoomSign" runat="server" />
                                <input class="button_sel" id="btnSelRoom" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                                    type="button" value=" " name="btnSelRoom" runat="server">
                                <input id="RoomID" style="height: 19px; width: 12px" type="hidden" size="1" name="RoomID" runat="server">
                                <input id="hiRoomSign" style="height: 19px; width: 12px" type="hidden" size="1" name="hiRoomSign" runat="server">
                                <input type="button" class="button" style="width: 70px;" value="客户资料" id="CustomerDetail" />
                            </td>
                            <td class="TdTitle">
                                <asp:Label ID="LUserName" runat="server" CssClass="formTable_Item">客户名称</asp:Label></td>
                            <td class="TdContentSearch">
                                <input type="text" class="easyui-searchbox" style="width: 76%;" id="CustName" name="CustName" data-options="required:true, editable:false"
                                    searcher="SelCust" runat="server" />

                                <input class="button_sel" id="btnSelCust" onclick="javascript: if (btnSelCust_OnClick() == false) return false;"
                                    type="button" value=" " name="btnSelCust" runat="server">
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">报事人</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="IncidentMan" style="width: 95%;" data-options="required:true" name="IncidentMan"
                                    runat="server">
                            </td>
                            <td class="TdTitle">报事电话</td>
                            <td class="TdContent">
                                <input type="text" class="easyui-validatebox" id="Phone" data-options="required:true" name="Phone" runat="server">
                            </td>
                        </tr>

                        <tr>
                            <td class="TdTitle">
                                <input id="PhTypeID" style="height: 22px; width: 32px" type="hidden" size="1" name="PhTypeID"
                                    runat="server">报事内容</td>
                            <td class="TdContent" colspan="3" style="width: 85%;">
                                <table cellspacing="0" cellpadding="0" class="DialogTable">
                                    <tr>
                                        <td width="45%">
                                            <textarea style="width: 95%; height: 168px; font-size: 14px;" class="easyui-validatebox" data-options="required:true" id="IncidentContent" rows="13" cols="83" name="IncidentContent"
                                                runat="server"></textarea>&nbsp;
                                        </td>
                                        <td valign="top" width="55%">
                                            <table cellspacing="0" cellpadding="0" class="DialogTable">

                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tbody>
                                                                <div style="overflow-y: auto; padding-top: 3px; height: 178px;" id="TableContent"></div>
                                                            </tbody>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td class="TdTitle">报事责任</td>
                            <td class="TdContent">
                                <input id="IncidentP1" type="radio" value="物业类" name="Duty" checked="checked" />物业类
                                <input id="IncidentP2" type="radio" value="地产类" name="Duty" />地产类
                            </td>
                            <%--<td class="TdTitle">预约处理时间</td>
                            <td class="TdContent">
                                <input type="text" class="easyui-validatebox" data-options="required:true" id="ReserveDate" name="ReserveDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" runat="server" />
                            </td>--%>
                            <td class="TdTitle">报事类别</td>
                            <td class="TdContentSearch">
                                <input type="text" class="easyui-searchbox" style="width: 76%;" id="TypeName" name="TypeName" data-options="required:true,editable:false"
                                    searcher="SelTypeName" runat="server" />
                                <input class="button_sel" id="btnSelCost" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                                    type="button" value=" " name="btnSelCost" runat="server">
                                <input class="easyui-validatebox" id="TypeID" style="height: 22px; width: 8px" type="hidden" size="1" name="TypeID" runat="server">
                                <input class="easyui-validatebox" id="hiTypeName" style="height: 22px; width: 8px" type="hidden" size="1" name="hiCostName" runat="server">
                                <input id="TypeCode" name="TypeCode" type="hidden" />
                            </td>
                        </tr>
                        <tr>
                            <%--<td class="TdTitle">报事类别</td>
                            <td class="TdContentSearch">
                                <input type="text" class="easyui-searchbox" style="width: 76%;" id="TypeName" name="TypeName" data-options="required:true,editable:false"
                                    searcher="SelTypeName" runat="server" />
                                <input class="button_sel" id="btnSelCost" onclick="javascript: if (btnSelCost_OnClick() == false) return false;"
                                    type="button" value=" " name="btnSelCost" runat="server">
                                <input class="easyui-validatebox" id="TypeID" style="height: 22px; width: 8px" type="hidden" size="1" name="TypeID" runat="server">
                                <input class="easyui-validatebox" id="hiTypeName" style="height: 22px; width: 8px" type="hidden" size="1" name="hiCostName" runat="server">
                                <input id="TypeCode" name="TypeCode" type="hidden" />
                            </td>--%>
                            <td class="TdTitle">预约处理时间</td>
                            <td class="TdContent">
                                <input type="text" class="easyui-validatebox" data-options="required:true" id="ReserveDate" name="ReserveDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" runat="server" />
                            </td>
                            <td class="TdTitle">是否收费</td>
                            <td class="TdContentSearch">
                                <input id="IsFees1" type="radio" value="1" name="IsFees" />是
                                <input id="IsFees2" type="radio" value="0" name="IsFees" />否
                                <input type="hidden" id="hiIsFees" name="hiIsFees" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="TdTitle">受 理 人</td>
                            <td class="TdContentSearch">
                                <input type="text" class="easyui-searchbox" style="width: 76%;" id="AdmiMan" name="AdmiMan" data-options="editable:false"
                                    searcher="SelAdmiMan" runat="server" />
                                <input id="AdmiManUserCode" type="hidden" name="AdmiManUserCode" runat="server">
                            </td>
                            <td class="TdTitle">受理时间</td>
                            <td class="TdContent">
                                <input id="IncidentDate" name="IncidentDate" class="easyui-validatebox" readonly runat="server" />
                            </td>
                        </tr>


                        <%--报事分派--%>
                        <tr class="Tb_Assigned">
                            <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事分派</td>
                        </tr>
                        <tr class="Tb_Assigned">
                            <td colspan="4" style="height: 4px;">
                                <input type="hidden" id="IsFP" name="IsFP" runat="server" />
                            </td>
                        </tr>
                        <tr class="Tb_Assigned">
                            <td class="TdTitle">派工单号</td>
                            <td class="TdContent">
                                <input id="CoordinateNum" name="CoordinateNum" runat="server" readonly="readonly" />
                            </td>
                            <td class="TdTitle">分 派 人:</td>
                            <td class="TdContent">
                                <input type="text" id="DispManFP" name="DispManFP" runat="server" />
                                <input type="hidden" id="UserCodesFP" name="UserCodesFP" runat="server" />
                            </td>
                        </tr>
                        <tr class="Tb_Assigned">
                            <td class="TdTitle">分派时间:</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="DispDateFP" name="DispDateFP" runat="server" />
                                <input id="DealLimitFP" name="DealLimitFP" type="hidden" runat="server" />
                            </td>
                            <td class="TdTitle">逾期时间: </td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="ReserveDealDate" name="ReserveDealDate" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', skin: 'default' })" />
                            </td>
                        </tr>
                        <tr class="Tb_Assigned">
                            <td class="TdTitle">责任人</td>
                            <td class="TdContent">
                                <input type="text"
                                    id="DealManFP" name="DealManFP" onclick="SelDealMan()" runat="server" readonly="readonly" />
                                <input id="ZRUserCodesFP" size="1" type="hidden" name="ZRUserCodesFP" runat="server" />
                            </td>
                            <td class="TdTitle">协助人</td>
                            <td class="TdContent">
                                <input id="CoorganizerUserList" name="CoorganizerUserList" runat="server" onclick="ExaCoorganizer()" />
                                <input id="DealManCheckedUserLists" type="hidden" name="DealManCheckedUserLists" runat="server" disabled readonly="readonly" runat="server" />
                                <input id="CoorganizerUser" type="hidden" name="CoorganizerUser" runat="server" />
                                <input id="CoorganizerUserCode" type="hidden" name="CoorganizerUserCode" runat="server" />
                            </td>
                        </tr>
                        <tr class="Tb_Assigned">
                            <td class="TdTitle" rowspan="1">分派备注:</td>
                            <td class="TdContent" rowspan="1" colspan="3">
                                <textarea style="width: 90.5%; height: 45px" id="DispRemarks" name="DispRemarks"
                                    runat="server"></textarea>
                            </td>
                        </tr>
                        <%--报事分派结束--%>

                        <tr>
                            <td class="TdTitle" id="imageTitle" colspan="1">照片<a id="UpImage" style="color: #688aed; cursor: pointer;" onclick="UploadImage()">(上传)</a> ：
                            </td>
                            <td id="ImageContent" class="TdContent" colspan="3"></td>
                        </tr>
                        <tr>
                            <td class="TdTitle">附件<a id="UpFile" style="color: #688aed; cursor: pointer;" onclick="UploadFile()">(上传)</a>：
                            </td>
                            <td class="TdContent" colspan="3">
                                <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                                </div>
                            </td>
                        </tr>



                        <tr>
                            <td class="TdContent" style="width: 400px; height: 100px;"></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <input class="button" type="button" onclick="javascript: CheckData(0);" value="保存" runat="server" />
                                <input class="button" type="button" onclick="javascript: CheckData(1);" value="保存并新增" runat="server" />
                                <input class="button" id="btnSave" style="display: none;" type="button" value="保存" name="btnSave" runat="server">&nbsp;&nbsp;&nbsp;
                                            <%--<input class="button" type="button" id="DataPrint"   onclick="javascript: CheckDataPrint();"  value="提交并新增" runat="server" />
                                            
                                            <input id="BtnSapt" class="button" style="display:none"  value="提交并新增" type="button" name="BtnSapt" runat="server">&nbsp;&nbsp;&nbsp;  --%>

                                <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnReturn" style="display: none" runat="server">
                            </td>
                        </tr>

                        <tr>
                            <td valign="top" align="center" colspan="4">
                                <div id="div_load" runat="server">
                                    <table class="font" style="height: 20px; width: 200px; filter: Alpha(opacity=80)" bordercolor="#cccccc"
                                        height="20" cellspacing="1" cellpadding="1" width="320" border="1">
                                        <tr>
                                            <td align="center">
                                                <table width="100%" border="0">
                                                    <tr>
                                                        <td align="right" width="25%">
                                                            <img height="25" alt="请等待" src="../images/clocks.gif" width="25" border="0">
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="lab_state" runat="server" ForeColor="Red"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <asp:Label ID="lab_jg" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>

        <script type="text/javascript">
            var ContDate = '';
            var d = '';
            function SelAdmiMan() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('760', '450', '../DialogNew/SelCommUserList.aspx?CommID=' + CommID + '&IsCheck=1', '选择受理人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varUserName = "";
                        var varUserCode = "";
                        if (_Data.indexOf(']') < 1) {
                            _Data = "[" + _Data + "]";
                        }
                        $.each(JSON.parse(_Data), function (i, obj) {
                            varUserName += "," + obj.UserName;
                            varUserCode += "," + obj.UserCode;
                        });
                        if (varUserName != "") {
                            $("#AdmiMan").searchbox("setValue", varUserName.substring(1, varUserName.lengh));
                            $('#AdmiManUserCode').val(varUserCode.substring(1, varUserCode.length));
                        }
                    }
                });
            }

            function Int() {
                $('#btnSelCust').hide();
                $('#btnSelRoom').hide();
                $('#btnSelCost').hide();
                $('#btnSelUsers').hide();
                $('#btnEqId').hide();

                var strDrClass = $("#DrClass").val();
                //alert(strDrClass);
                var strTypeName = $("#hiTypeName").val();
                //$('#DataPrint').hide();

                //加载未提交的照片(如果已上传照片但没有点击保存按钮，这时页面又刷新了，所以要加载上次没有提交的照片)
                LoadPicture();
                //判断如果是公区客户名称非必填
                if ($("#hirbplace").val() == 2) {
                    $("#RoomSign").searchbox({ required: false });
                    $("#CustName").searchbox({ required: false });
                } else {
                    $("#RoomSign").searchbox({ required: true });
                    $("#CustName").searchbox({ required: true });
                }

                //书面
                if (strDrClass == '1') {
                    $('#IsFees2').attr('checked', 'checked');
                    $('#IsFees1').removeAttr('checked');

                    if ($('#rbplace2').is(':checked')) {
                        $("input[name='IsFees']").attr("disabled", "true");
                    }
                    $('#IsFP').val(1);
                    $('.Tb_Assigned').show();
                }
                else {//口派
                    //$('#IsFees1').removeAttr('checked');
                    $('#IsFees2').attr('checked', 'checked');
                    $("input[name='IsFees']").attr("disabled", "true");
                    $('#IsFP').val(0);
                    $('.Tb_Assigned').hide();
                }

                $('#IsFP').val(0);
                $('.Tb_Assigned').hide();
            }
            Int();
            //报事来源如果是业主报事，强制选择房号
            function IsChoiceRoom() {
                if ($("#IncidentSource").val() != "客户报事" && $("#hirbplace").val() == 2) {
                    $("#RoomSign").searchbox({ required: false });
                } else {
                    $("#RoomSign").searchbox({ required: true });
                }
                //if ($("#IncidentSource").val() == "自查报事")  //自查报事默认报事人为受理人
                //{
                //    $("#IncidentMan").val($("#AdmiMan").val());
                //    $('#AdmiMan').removeAttr("readonly");
                //} else {
                //    $("#IncidentMan").val("");  //报事人清空
                //    $('#AdmiMan').val($("#ThisUserName").val());
                //    $('#AdmiMan').attr("readonly", "readonly");
                //}
                //自查报事  报事人	默认本人，可以修改，保存汉字； 受理人 默认本人，可以修改（单选具有项目权限的员工），保存名字+用户编码；
                //客户报事  报事人	默认客户，可以修改，保存汉字； 受理人 默认本人，可以修改（单选具有项目权限的员工），保存名字+用户编码；
                if ($("#IncidentSource").val() == "自查报事") {
                    $('#IncidentMan').val($("#ThisLoginUserName").val()); //
                }
                //受理人
                $("#AdmiMan").searchbox("setValue", $("#ThisLoginUserName").val());  //默认为本人
                $('#AdmiManUserCode').val($("#ThisLoginUserCode").val());
            }

            function LoadPicture() {

                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentAcceptManage.aspx?Method=GetFiles&IncidentID=" + IncidentID.value,
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {

                    },
                    success: function (data) {
                        if (data) {
                            $('#imageTitle').css('height', '100px');
                            $('#ImageContent').append(data);
                        }
                    }
                });
            }

            //修改报事责任，清空报事类别
            $(function () {
                $("#IncidentP1").change(function () {

                    $("#TypeID").val('');
                    $("#hiTypeName").val('');
                    $("#TypeName").searchbox("setValue", '');
                    $('#TypeCode').val('');

                    $("#FineCorpTypeID").val('');
                    $("#FinehiCostName").val('');
                    $("#FineCorpTypeCode").val('');
                    $("#FineTypeName").searchbox("setValue", '');
                });

                $("#IncidentP2").change(function () {

                    $("#TypeID").val('');
                    $("#hiTypeName").val('');
                    $("#TypeName").searchbox("setValue", '');
                    $('#TypeCode').val('');

                    $("#FineCorpTypeID").val('');
                    $("#FinehiCostName").val('');
                    $("#FineCorpTypeCode").val('');
                    $("#FineTypeName").searchbox("setValue", '');
                });
            })

            function SelTypeName() {
                var duty = $("input[name='Duty']:checked").val();
                if ($("#hirbplace").val() == 1 && $("#RoomID").val() == '') {
                    HDialog.Info('请先选择房屋编号');
                }
                else {
                    var IsBigClass = '1';
                    if ($("#DrClass").val() == 2) {
                        IsBigClass = 0;
                    }
                    var UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlg.aspx";
                    if (duty == "地产类") {
                        UrlNewCorpIncidentTypeBigDlg = "../DialogNew/NewCorpIncidentTypeBigDlgLazyRadioLoad.aspx";
                    }
                    HDialog.Open('800', '500', UrlNewCorpIncidentTypeBigDlg + '?ClassID=' + $("#DrClass").val() + '&Duty=' + duty + '&IsCheck=1&IsEdit=true&IsBigClass=' + IsBigClass + '&IncidentPlace=' + $("#hirbplace").val(), '选择报事类别',
                        false, function callback(_Data) {
                            var arrRet = JSON.parse(_Data);
                            if ($("#DrClass").val() == "1") { //书面报事
                                $("#TypeID").val(arrRet.id);
                                $("#hiTypeName").val(arrRet.TypeName);
                                $("#TypeName").searchbox("setValue", arrRet.TypeName);
                                $('#TypeCode').val(arrRet.code);
                                $("#BigCorpTypeID").val(arrRet.id);
                                $('#BigCorpTypeCode').val(arrRet.code);
                                $(":radio[name='IsTouSu'][value='" + arrRet.IsTouSu + "']").prop("checked", "checked")
                                if (arrRet.IsTouSu == "0") {
                                    $("#hiIsTouSu").val(0);
                                } else {
                                    $("#hiIsTouSu").val(1);
                                }
                                $("#DealLimit").val(arrRet.DealLimit);
                                $("#DealLimit2").val(arrRet.DealLimit2);
                                $("#DispLimit").val(arrRet.DispLimit);
                                $("#DealLimitFP").val(arrRet.DealLimit);
                            } else if ($("#DrClass").val() == "2") //口派报事
                            {
                                $("#FineCorpTypeID").val(arrRet.id);
                                $("#FineCorpTypeCode").val(arrRet.code);
                                $("#FinehiCostName").val(arrRet.TypeName);
                                //$("#FineTypeName").searchbox("setValue", arrRet.TypeName);
                                $("#FineTypeName").val(arrRet.TypeName);
                                $("#RatedWorkHour").val(arrRet.RatedWorkHour1);
                                $("#KPIRatio").val(arrRet.KPIRatio1);

                                $("#TypeID").val(arrRet.id);
                                $("#hiTypeName").val(arrRet.TypeName);
                                $("#TypeName").searchbox("setValue", arrRet.TypeName);
                                $('#TypeCode').val(arrRet.code);
                                //获取大类 GetCorpIncidentType
                                $.tool.DataGet('IncidentChoose', 'GetCorpIncidentType', 'TypeCode=' + arrRet.code,
                                    function Init() {
                                    },
                                    function callback(BigData) {
                                        var BigRet = JSON.parse(BigData);
                                        $("#BigCorpTypeID").val(BigRet.CorpTypeID);
                                        $('#BigCorpTypeCode').val(BigRet.TypeCode);
                                        $(":radio[name='IsTouSu'][value='" + BigRet.IsTouSu + "']").prop("checked", "checked")
                                        if (BigRet.IsTouSu == "0") {
                                            $("#hiIsTouSu").val(0);
                                        } else {
                                            $("#hiIsTouSu").val(1);
                                        }
                                        $("#DealLimit").val(BigRet.DealLimit);
                                        $("#DealLimit2").val(BigRet.DealLimit2);
                                        $("#DispLimit").val(BigRet.DispLimit);
                                        $("#DealLimitFP").val(BigRet.DealLimit);
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                            }
                            //检查是否具有分派权限
                            $.tool.DataGet('IncidentCheckPost', 'CheckIncidentTypeAssignedPost', 'BigCorpTypeID=' + arrRet.id,
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "false") {
                                        $('#IsFP').val(0);
                                        $('.Tb_Assigned').hide();
                                    }
                                    else {
                                        if ($("#DrClass").val() == '1') {
                                            $('#IsFP').val(1);
                                            $('.Tb_Assigned').show();
                                        }
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        });
                }
            }

            function SelFineTypeName() {

                if ($("#DrClass").val() == "2") {
                    if ($("#hirbplace").val() == 1 && $("#RoomID").val() == '') {
                        HDialog.Info('请先选择房屋编号');
                    }
                    else if ($("#TypeName").searchbox("getValue") == "") {
                        HDialog.Info('请先选择报事大类');
                    }
                    else {
                        HDialog.Open('800', '500', '../DialogNew/NewCorpIncidentTypeFineDlg.aspx?TypeCode=' + $("#TypeCode").val() + '&IsCheck=1&IsEdit=true&CommID=' + $("#hiCommID").val(), '选择原因细类', false, function callback(_Data) {
                            var arrRet = JSON.parse(_Data);
                            //alert(arrRet.FullTypeName);
                            $("#FineCorpTypeID").val(arrRet.id);
                            $("#FineCorpTypeCode").val(arrRet.code);
                            $("#FinehiCostName").val(arrRet.TypeName);
                            $("#FineTypeName").searchbox("setValue", arrRet.TypeName);

                            $("#RatedWorkHour").val(arrRet.RatedWorkHour1);
                            //$("#RatedWorkHourNumber").val(arrRet.RatedWorkHourNumber1);
                            $("#KPIRatio").val(arrRet.KPIRatio1);

                            //$("#hiContent").val($("#FineTypeName").val());
                            //if ($("#DrClass").val() == "2") {
                            //    $("#IncidentContent").val('');
                            //    $("#IncidentContent").val($("#FineTypeName").val());
                            //}

                        });
                    }
                }

            }

            function SelEqment() {
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../DialogNew/EquipmentChoiceDlg.aspx?CommID=' + $("#hiCommID").val(), '选择设备', false, function callback(_Data) {

                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $('#EqId').val(data.Id);
                        $('#EquipmentName').searchbox('setValue', data.EquipmentName);
                        $("#IncidentContent").val(data.InstallPosition);
                    }
                });
            }

            function SelRoomSign() {
                var w = $(window).width();
                var h = $(window).height();
                var iCustID = "";

                iCustID = $('#CustID').val();

                HDialog.Open(w, h, '../DialogNew/RoomDlgNew.aspx?Ram=' + Math.random(), '选择房屋编号', false, function callback(_Data) {
                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $('#RoomSign').searchbox("setValue", data.RoomSign);
                        $('#CustName').searchbox("setValue", data.CustName);
                        //$('#SelRoomID').combobox('clear');
                        if ($("#IncidentSource").val() == "自查报事") {
                            $('#IncidentMan').val($("#ThisLoginUserName").val()); //
                        } else {
                            $('#IncidentMan').val(data.CustName);
                        }
                        $('#CustID').val(data.CustID);
                        $('#RoomID').val(data.RoomID);
                        $('#Phone').val(data.MobilePhone);

                        var RoomFirstID = $('#RoomID').val();
                        var hiOriginalDuty = $("#hiDuty").val();
                        if ($("#hirbplace").val() == 1) {
                            /*根据合同交房时间判断属于物业还是地产*/
                            $.post("/HM/M_Main/HC/DataPostControl.aspx", { "Method": "DataPost", "Class": "Room", "Command": "WYorDC", "RoomID": RoomFirstID },
                                function (dataCont) {
                                    if (dataCont != '') {
                                        //alert(dataCont);
                                        ContDate = $("#ContSubDate").val(dataCont);
                                        //当前时间转换
                                        var date = new Date();
                                        var seperator1 = "-";
                                        var seperator2 = ":";
                                        var year = date.getFullYear();
                                        var month = date.getMonth() + 1;
                                        var strDate = date.getDate();
                                        if (month >= 1 && month <= 9) {
                                            month = "0" + month;
                                        }
                                        if (strDate >= 0 && strDate <= 9) {
                                            strDate = "0" + strDate;
                                        }
                                        var DateOne = year + seperator1 + month + seperator1 + strDate;
                                        //+ " " + date.getHours() + seperator2 + date.getMinutes()
                                        //+ seperator2 + date.getSeconds();
                                        if (ContDate == "") {
                                            $("#hiDuty").val("物业类");
                                        }
                                        else {
                                            var OneMonth = DateOne.substring(5, DateOne.lastIndexOf('-'));
                                            var OneDay = DateOne.substring(DateOne.length, DateOne.lastIndexOf('-') + 1);
                                            var OneYear = DateOne.substring(0, DateOne.indexOf('-'));
                                            var TwoMonth = dataCont.substring(5, dataCont.lastIndexOf('-'));
                                            var TwoDay = dataCont.substring(dataCont.length, dataCont.lastIndexOf('-') + 1);
                                            var TwoYear = dataCont.substring(0, dataCont.indexOf('-'));
                                            var cha = ((Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)) / 86400000);
                                            var iDays = Math.abs(cha);
                                            //alert(iDays);
                                            if (iDays - 730 > 0) {
                                                $("#hiDuty").val("物业类");
                                            }
                                            else {
                                                $("#hiDuty").val("地产类");
                                            }
                                        }
                                        var sl = $("#hiDuty").val();
                                        if (sl == "物业类") {
                                            $(":radio[name='Duty'][value='" + sl + "']").prop("checked", "checked")
                                        } else {
                                            $(":radio[name='Duty'][value='" + sl + "']").prop("checked", "checked")
                                        }

                                        if ((hiOriginalDuty == "物业类" && sl == "地产类") || (hiOriginalDuty == "物业类" && sl == "地产类"))  //报事类别换了就清空报事大类
                                        {
                                            $("#TypeID").val("");
                                            $("#hiTypeName").val("");
                                            $("#TypeName").searchbox("setValue", "");
                                            $('#TypeCode').val("");
                                            $("#BigCorpTypeID").val("");
                                            $('#BigCorpTypeCode').val("");
                                        }

                                    }
                                    else {
                                        $("#hiDuty").val("物业类");
                                        $(":radio[name='Duty'][value='" + sl + "']").prop("checked", "checked")
                                    }
                                });
                        }
                    }
                });
            }

            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                //$('#SelRoomID').combobox('clear');

                HDialog.Open('1100', '530', "../DialogNew/CustDlg.aspx", '选择客户名称', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#IncidentMan').val(data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#Phone').val(data.MobilePhone);

                    var roomsign = data.NewRoomSigns;
                    //$('#RoomSign').searchbox("setValue", data.NewRoomSigns);
                    //varM = JSON.parse(roomsign);
                    dataobj = roomsign.split(',');
                    if (dataobj.length > 1) {
                        var roomsign1 = dataobj[0];
                        $('#RoomSign').searchbox("setValue", roomsign1);
                    }
                    else {
                        $('#RoomSign').searchbox("setValue", roomsign);
                    }

                    $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + encodeURI($("#CustID").val()),
                        function Init() {
                        },
                        function callback(RoomSignData) {
                            var RoomFirstID = "";

                            varObjects = JSON.parse(RoomSignData);
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

                                    $('#RoomID').val(RoomID);
                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;
                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                                    RoomFirstID = varObjects[0].RoomID;
                                }
                            }
                            else {
                                $('#SelRoomID').combobox('clear');
                            }

                            /*根据合同交房时间判断属于物业还是地产*/
                            if (RoomFirstID != "") {
                                //alert(RoomFirstID);
                                $.post("/HM/M_Main/HC/DataPostControl.aspx", { "Method": "DataPost", "Class": "Room", "Command": "WYorDC", "RoomID": RoomFirstID },
                                    function (dataCont) {
                                        if (dataCont != '') {
                                            //alert(dataCont);
                                            ContDate = $("#ContSubDate").val(dataCont);

                                            //当前时间转换
                                            var date = new Date();
                                            var seperator1 = "-";
                                            var seperator2 = ":";
                                            var year = date.getFullYear();
                                            var month = date.getMonth() + 1;
                                            var strDate = date.getDate();
                                            if (month >= 1 && month <= 9) {
                                                month = "0" + month;
                                            }
                                            if (strDate >= 0 && strDate <= 9) {
                                                strDate = "0" + strDate;
                                            }
                                            var DateOne = year + seperator1 + month + seperator1 + strDate;
                                            //+ " " + date.getHours() + seperator2 + date.getMinutes()
                                            //+ seperator2 + date.getSeconds();


                                            if (ContDate == "") {

                                                $("#hiDuty").val("物业类");
                                            }
                                            else {

                                                var OneMonth = DateOne.substring(5, DateOne.lastIndexOf('-'));
                                                var OneDay = DateOne.substring(DateOne.length, DateOne.lastIndexOf('-') + 1);
                                                var OneYear = DateOne.substring(0, DateOne.indexOf('-'));

                                                var TwoMonth = dataCont.substring(5, dataCont.lastIndexOf('-'));
                                                var TwoDay = dataCont.substring(dataCont.length, dataCont.lastIndexOf('-') + 1);
                                                var TwoYear = dataCont.substring(0, dataCont.indexOf('-'));

                                                var cha = ((Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)) / 86400000);
                                                var iDays = Math.abs(cha);
                                                //alert(iDays);


                                                if (iDays - 730 > 0) {
                                                    $("#hiDuty").val("物业类");
                                                }
                                                else {
                                                    $("#hiDuty").val("地产类");
                                                }
                                            }


                                            var sl = $("#hiDuty").val();
                                            if (sl == "物业类") {
                                                $(":radio[name='Duty'][value='" + sl + "']").prop("checked", "checked")
                                            } else {
                                                $(":radio[name='Duty'][value='" + sl + "']").prop("checked", "checked")
                                            }

                                        }
                                        else {
                                            $("#hiDuty").val("物业类");
                                            $(":radio[name='Duty'][value='" + sl + "']").prop("checked", "checked")
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

            function btnSelIncidentContent() {
                HDialog.Open('650', '430', '../DialogNew/IncidentContentDlg.aspx?PhTypeID=1', '报事内容', false, function callback(_Data) {
                    if (_Data != "") {
                        $("#IncidentContent").val(_Data);
                        LoadListContent();
                        return true;
                    }
                    LoadListContent();
                });

                return false;
            }

            function SelDealMan() {
                if ($("#TypeName").searchbox('getValue') == "") {
                    HDialog.Info('请选择报事类别');
                }
                else {
                    var TypeID = $("#TypeID").val();
                    //TypeID = TypeID.substring(0, TypeID.length - 1);
                    HDialog.Open('640', '480', '../DialogNew/IncidentDealMan.aspx?IsAssignedBatch=1&BigCorpTypeID=' + TypeID, '选择责任人', false, function callback(_Data) {
                        var arrRet = _Data.split('\t');
                        $("#DealManFP").val(arrRet[1]);
                        $("#ZRUserCodesFP").val(arrRet[0]);
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
                            $("#CoorganizerUserList").val(username);
                            return true;
                        });
                }
            }

            function ReseleTypeName() {
                $("#TypeID").val('');
                $("#hiTypeName").val('');
                $("#TypeName").searchbox("setValue", '');
            }

            $("#btnReturn").click(function () {
                var tousu = $("input[name='IsTouSu']:checked").val();
                $("#hiIsTouSu").val(tousu);

                var duty = $("input[name='Duty']:checked").val();
                $("#hiDuty").val(duty);
                alert($("#hiIsTouSu").val());
                alert($("#hiDuty").val());
            })

            var toolbar = [
                {
                    text: '',
                    iconCls: 'icon-add',
                    handler: function () {
                        btnSelIncidentContent();
                    }
                }]

            var columns = [[

                { field: 'PhrasesCom', title: '内容', width: 560, align: 'left', sorttable: true }
            ]]

            function LoadListContent() {
                $("#TableContent").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: columns,
                    //frozenColumns: frozenColumns,
                    fitColumns: false,
                    rownumbers: true,
                    remoteSort: false,
                    singleSelect: true,
                    //selectOnCheck: false,
                    //checkOnSelect: false,
                    pagination: true,
                    border: false,
                    width: "82%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onBeforeLoad: function (param1) {
                        param1 = $.JQForm.GetParam("Choose", "IncidentContent", "TableContent", param1);
                    },
                    onClickRow: function (rowIndex, rowData) {
                        $("#IncidentContent").val(rowData.PhrasesCom);
                    }

                });

            }

            LoadListContent();

            $("#btnSave").click(function () {
                SaveIncident(0);
            });

            $("#BtnSapt").click(function () {
                SaveIncident(0);
            });

            function SaveIncident(Print) {

                if ($('#DealManFP').val() == '' && $('#ZRUserCodesFP').val() == '') {
                    $('#IsFP').val(0);
                }

                var cmd = $("#hiOPType").val();
                var InfoSource = $("#InfoSource").find("option:selected").text();
                $("#hiInfoSource").val(InfoSource);

                var tousu = $("input[name='IsTouSu']:checked").val();
                //alert(tousu);
                $("#hiIsTouSu").val(tousu);

                var duty = $("input[name='Duty']:checked").val();
                $("#hiDuty").val(duty);

                var IsFees = $("input[name='IsFees']:checked").val();
                $("#hiIsFees").val(IsFees);

                $('#hiIncidentImgs').val('');
                $("input[name='IncidentImgs']").each(function (index, item) {
                    $('#hiIncidentImgs').val($('#hiIncidentImgs').val() + "," + $(item).val());
                });

                $.tool.DataPostNoChk('frmForm', 'IncidentAcceptNew', "IncidentNewAccept", $('#IncidentAcceptManage').serialize() + '&vIsPrint=' + Print,
                    function Init() {
                    },
                    function callback(_Data) {
                        var data = _Data.split('|');
                        if (_Data == "true" || data[0] == "true") {
                            //清空工区选项
                            $("#RegionalPlaceName").searchbox("setValue", "");
                            $("#LocalePositionName").searchbox("setValue", "");
                            $("#LocaleFunctionName").searchbox("setValue", "");
                            HDialog.Info('保存成功');
                            $("#btnPrint").click();
                            $("#hiimgIncidentID").val(data[1]);
                            UPdateImage();
                            IsSubmitFlag = true;

                            HDialog.Close(1);

                        } else { IsSubmitFlag = true; }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            }
            /****图片开始  ****/
            //查看图片
            function ImageBlclick(fAdjunctCode) {
                HDialog.Open('888', '666', '../IncidentNewJH/ViewIncidentImage.aspx?FileName=' + fAdjunctCode + "&IncidentID=" + IncidentID.value + "&ImageType=受理图片" + "&ImgGUID=" + $("#hiImgGUID").val(), '查看图片', false, function callback(_Data) {
                    if (_Data == 1) {
                    }
                });
            }
            ////获取受理图片   受理时还没有图片
            //function GetUploadImage() {
            //    return;
            //    $.tool.DataPostNoChk('frmForm', 'IncidentAcceptNew', "GetIncidentImage", "FileDescr=受理图片&IncidentID=" + IncidentID.value,
            //        function Init() {
            //        },
            //        function callback(_Data) {
            //            $('#ImageContent').append(_Data);
            //        },
            //        function completeCallback() {
            //        },
            //        function errorCallback() {

            //        });
            //}

            //上传受理图片
            function UploadImage() {
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=受理图片&ImgGUID=" + $("#hiImgGUID").val(), '上传图片', false, function callback(_Data) {
                    if (_Data) {
                        $('#ImageContent').append(CreateSmImg(_Data));
                        $('#imageTitle').css('height', '100px');
                        var incid = localStorage.hiIncidentID;
                        $('#IncidentID').val(incid);
                    }
                });
            }
            function CreateSmImg(srcs) {
                var sindex = srcs.lastIndexOf('\\') + 1;
                var eindex = srcs.lastIndexOf('.');
                var fileName = srcs.substring(sindex, eindex);
                var sb = "";
                sb += "<div class=\"addpicdiv\" style=\"width: 71px; height: 85px; float: left; margin-right: 15px; position: relative;text-align:center;\" ondblclick=\"ImageBlclick('" + fileName + "')\">";
                sb += "<img src=\"" + srcs + "\" style=\"width: 71px; height: 71px;\" />";
                sb += "  <div style=\"position: absolute; width: 18px; height: 18px; border-radius: 18px; font-size: 13px; background-color: #e0a70b; color: white; text-align: center; vertical-align: middle; top: -5px; left: 60px; cursor: pointer\" onclick=\"closeImage(this,'" + fileName + "')\">";
                sb += "  ×";
                sb += "   </div>";
                sb += "   <label style=\"font-size:8px;top: -5px;position: relative;\">" + fileName.substring(0, 8) + "(受理)</label>";
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

            function UPdateImage() {
                //修改图片报事ID
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentAcceptManage.aspx?Method=UpdateFile&IncidentID=" + $("#hiimgIncidentID").val() + "&ImgGUID=" + $("#hiImgGUID").val(),
                    async: true,
                    cache: false,
                    dataType: 'text',
                    contentType: false,
                    processData: false,
                    error: function (request) {

                    },
                    success: function (data) {

                    }
                });
            };

            /****图片结束  ****/
            /* ****附件开始*****/
            var column = [[
                { field: 'IncidentID', title: '报事ID', width: 160, align: 'left', sortable: true },
                { field: 'FileName', title: '文件名', width: 160, align: 'left', sortable: true },
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
                }
            ]];
            function LoadList() {
                //alert(IncidentID.value);
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
                HDialog.Open('500', '222', '../IncidentNewJH/UploadFileDialog.aspx?IncidentID=' + IncidentID.value + "&FileDescr=受理文件", '上传文件', false, function callback(_Data) {
                    if (_Data) {
                        LoadList();
                    }
                });
            }
            //删除文件
            function PostRequest(method, adjunctCode) {
                $.ajax({
                    type: "POST",
                    url: "/HM/M_Main/IncidentNewJH/IncidentWrittenDeal.aspx?Method=" + method + "&IncidentID=" + IncidentID.value + "&FileName=" + adjunctCode,
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
            /* ****附件结束*****/

            /* ****公区选择----begin*****/
            function SelRegionalPlace() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../IncidentNewJH/Dialog/IncidentRegionalDlg.aspx?CommId=' + CommID, '选择公区', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var RegionalID = varObjects.RegionalID;
                        var RegionalPlace = varObjects.RegionalPlace;
                        $("#RegionalPlace").val(RegionalID);
                        $("#RegionalPlaceName").searchbox("setValue", RegionalPlace);
                    }
                });
            }

            function SelLocalePosition() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../IncidentNewJH/Dialog/IncidentPublicLocaleDlg.aspx?LocaleType=公区方位&CommId=' + CommID, '选择公区方位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var IID = varObjects.IID;
                        var DictionaryName = varObjects.DictionaryName;
                        $("#LocalePositionCode").val(IID);
                        $("#LocalePositionName").searchbox("setValue", DictionaryName);
                    }
                });
            }

            function SelLocaleFunction() {
                var CommID = $("#hiCommID").val();
                HDialog.Open('600', '450', '../IncidentNewJH/Dialog/IncidentPublicLocaleDlg.aspx?LocaleType=公区功能&CommId=' + CommID, '选择公区功能', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        var IID = varObjects.IID;
                        var DictionaryName = varObjects.DictionaryName;
                        $("#LocaleFunctionCode").val(IID);
                        $("#LocaleFunctionName").searchbox("setValue", DictionaryName);
                    }
                });
            }
            /* ****公区选择----end*****/

            //快速搜索
            var availableTags = [];
            $("#FastKey").autocomplete({
                source: function (request, response) {
                    $.tool.DataPostNoLoading('ReceFees', 'SearchFastKey', $('#IncidentAcceptManage').serialize(),
                        function Init() {
                            $('#CustName').searchbox("setValue", '');
                            $('#CustID').val('');
                            $('#RoomSign').searchbox("setValue", '');
                            $('#RoomID').val('');
                            $('#IncidentMan').val('');
                        },
                        function callback(_Data) {
                            for (var i = 0; i < 20; i++) { availableTags[i] = ''; }
                            $('#hiSearchFastKey').val(_Data);
                            var varObjects = eval("(" + _Data + ")"); //转换为json对象
                            for (var i = 0; i < varObjects.length; i++) {

                                if (varObjects[i].LiveType == '3') {
                                    availableTags[i] = i + '.　' + '\t' + '\t' + varObjects[i].CustName;
                                }
                                else {
                                    availableTags[i] = i + '.　' + '\t' + varObjects[i].RoomSign + "┃" + varObjects[i].RoomName + "┃" + '\t' + varObjects[i].CustName;
                                }
                            }
                            response(availableTags);
                        },
                        function _completeCallBack() {
                        },
                        function errorCallback() {
                        });
                },
                select: function (e, ui) {
                    var arrSel = ui.item.value;
                    var R = arrSel.split('\t');
                    $('#CustID').val('');
                    $('#RoomID').val('');
                    var j = R[0].split('.')[0];
                    var varObjects = eval("(" + $('#hiSearchFastKey').val() + ")"); //转换为json对象
                    $('#CustID').val(varObjects[j].CustID);
                    $('#RoomID').val(varObjects[j].RoomID);

                    $('#CustName').searchbox("setValue", varObjects[j].CustName);
                    $('#RoomSign').searchbox("setValue", varObjects[j].RoomSign);
                    $('#Phone').val(varObjects[j].MobilePhone);
                   
                    $('#IncidentMan').val(varObjects[j].CustName);
                    return false;
                },
                focus: function (event, ui) {
                    var arrSel = ui.item.value;
                    var R = arrSel.split('\t');
                    $("#FastKey").val(arrSel.split('.')[1].replace(/\t/g, '').replace('　', ''));
                    return false;
                },
            });
            $('#FastKey').bind('keypress', function (event) {
                if (event.keyCode == 13) {
                    //$("#BtnSearch").click();
                }

            });

            $("#CustomerDetail").click(function (e) {
                if ($("#CustID").val() == "") {
                    HDialog.Info("请选择客户");
                    return;
                }
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../HouseNew/CustomerDetail.aspx?Back=&CustID=" + $("#CustID").val();
                HDialog.Open(w, h, conent, '客户资料详细', false, function callback(_Data) {
                });
            });

            function ReLoad() {

            }
            ReLoad();
        </script>
    </form>
</body>
</html>
