<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentControlManage.aspx.cs" Inherits="M_Main.IncidentNew.IncidentControlManage" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
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
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script type="text/javascript">
        function CheckData() {
            if (IncidentAcceptManage.IncidentNum.value == "") {
                HDialog.Info("请输入报事编号,此项不能为空!");
                IncidentAcceptManage.IncidentNum.focus();
                return false;
            }

            $("#btnSave").click();
        }
        function btnSelRoom_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/RoomDlg.aspx", "", 650, 430);

            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAcceptManage.RoomID.value = varObjects[0];
                IncidentAcceptManage.RoomSign.value = varObjects[2];
                IncidentAcceptManage.hiRoomSign.value = varObjects[2];
                //	IncidentAcceptManage.MobilePhone.value=varObjects[4];

                IncidentAcceptManage.CustID.value = varObjects[1];
                IncidentAcceptManage.CustName.value = varObjects[3];
                IncidentAcceptManage.hiCustName.value = varObjects[3];
                //alert(varReturn);

                return true;
            }

            return false;
        }

        function btnSelCust_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx", "", 650, 430);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAcceptManage.CustID.value = varObjects[0];
                IncidentAcceptManage.CustName.value = varObjects[1];
                IncidentAcceptManage.hiCustName.value = varObjects[1];
                //IncidentAcceptManage.MobilePhone.value=varObjects[3];

                IncidentAcceptManage.RoomSign.value = "";
                IncidentAcceptManage.RoomID.value = "";

                return true;
            }

            return false;
        }

        function SelRoomID_OnChange() {
            IncidentAcceptManage.RoomID.value = IncidentAcceptManage.SelRoomID.options[IncidentAcceptManage.SelRoomID.selectedIndex].value;
            IncidentAcceptManage.RoomSign.value = IncidentAcceptManage.SelRoomID.options[IncidentAcceptManage.SelRoomID.selectedIndex].text;

        }

        function btnSelCost_OnClick() {
            //var tmpCostGeneType = FeesSporadicManage.CostGeneType.value;?CostGeneType="+tmpCostGeneType
            var iClassID = IncidentAcceptManage.hiClassID.value;

            var varReturn;
            varReturn = showModalDlg("../dialog/CorpIncidentTypeDlg.aspx" + "?Ram=" + Math.random() + "&ClassID=" + iClassID, "", 500, 400);

            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAcceptManage.TypeID.value = varObjects[0];
                IncidentAcceptManage.TypeName.value = varObjects[2];
                IncidentAcceptManage.hiTypeName.value = varObjects[2];



                return true;
            }

            return false;
        }
        function btnSelIncidentContent_OnClick() {
            //var tmpCostGeneType = FeesSporadicManage.CostGeneType.value;?CostGeneType="+tmpCostGeneType

            var varReturn;
            varReturn = showModalDlg("../dialog/IncidentContentDlg.aspx?PhTypeID=1", "", 650, 400);

            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAcceptManage.IncidentContent.value = varObjects[1];

                return true;
            }

            return false;
        }
        function btnSelDealSituation_OnClick() {
            //var tmpCostGeneType = FeesSporadicManage.CostGeneType.value;?CostGeneType="+tmpCostGeneType

            var varReturn;
            varReturn = showModalDlg("../dialog/IncidentContentDlg.aspx?PhTypeID=2", "", 650, 400);

            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAcceptManage.DealSituation.value = varObjects[1];

                return true;
            }

            return false;
        }
        function btnSelCustComments_OnClick() {
            //var tmpCostGeneType = FeesSporadicManage.CostGeneType.value;?CostGeneType="+tmpCostGeneType

            var varReturn;
            varReturn = showModalDlg("../dialog/IncidentContentDlg.aspx?PhTypeID=3", "", 650, 400);

            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                IncidentAcceptManage.CustComments.value = varObjects[1];

                return true;
            }

            return false;
        }
        function btnSelUsers_OnClick() {
            var strUserCodes = IncidentAcceptManage.UserCodes.value;
            var strUserNames = escape(IncidentAcceptManage.hiUserNames.value);
            //alert(BillDataManage.hiBillCanUserNames.value);
            //alert(BillDataManage.BillCanUserCodes.value);

            varReturn = showModalDlg("../dialog/IncidentCrewDlg.aspx", "", 650, 430);

            //alert(varReturn);
            //**获得返回的参数信息				
            if (varReturn != "") {
                var varObjects = varReturn.split("\t");

                IncidentAcceptManage.UserCodes.value = varObjects[0];
                IncidentAcceptManage.DealMan.value = varObjects[1];
                IncidentAcceptManage.hiUserNames.value = varObjects[1];

                return true;
            }
            else {
                IncidentAcceptManage.UserCodes.value = "";
                IncidentAcceptManage.DealMan.value = "";
                IncidentAcceptManage.hiUserNames.value = "";

            }


            return true;

        }
        function btnFileUp_Onclick() {
            if (IncidentAcceptManage.AdjunctName.value == "") {
                HDialog.Info("请输入文件附件名称,此项不能为空!");
                IncidentAcceptManage.AdjunctName.focus();
                return false;
            }

            if (IncidentAcceptManage.btnFile.value == "") {
                HDialog.Info("请选择要上传的本地文件!");
                IncidentAcceptManage.btnFile.focus();
                return false;
            }

            return true;
        }
        function Win_OnLoad() {
            document.getElementById("btnReply").style.display = "";
            document.getElementById("BtnFees").style.display = "none";
            document.getElementById("A1").style.color = "#0000FF";
            document.getElementById("A3").style.color = ""

        }

        function Showbtn_OnClick(type) {
            var IsReply = IncidentAcceptManage.IsReply.value;
            var IIncidentPlace = IncidentAcceptManage.IncidentPlace.value;
            if (type == "hfdj") {


                /*document.getElementById("btnReply").style.display = "";
                document.getElementById("btnMaterial").style.display = "none";
                if(IIncidentPlace == 1)
                {
                    document.getElementById("btnFees").style.display = "none";
                }*/
                document.getElementById("A1").style.color = "#0000FF";
                document.getElementById("A2").style.color = ""
                document.getElementById("A3").style.color = ""
                /*if(IsReply == "1")
                {
                    document.getElementById("btnReply").style.display = "none";
                    if(IIncidentPlace == 1)
                    {
                        document.getElementById("btnFees").style.display = "none";
                    }
                }
                else
                {
                    document.getElementById("btnReply").style.display = "";
                    if(IIncidentPlace == 1)
                    {
                        document.getElementById("btnFees").style.display = "none";
                    }
                }*/

            }
            if (type == "sfqk") {
                /*document.getElementById("btnReply").style.display = "none";
                document.getElementById("btnMaterial").style.display = "none";
                document.getElementById("btnFees").style.display =  "";*/
                document.getElementById("A1").style.color = "";
                document.getElementById("A2").style.color = ""
                document.getElementById("A3").style.color = "#0000FF";
                /*if(IsReply == "1")
                {
                    document.getElementById("btnReply").style.display = "none";
                    document.getElementById("btnFees").style.display = "";
                }
                else
                {
                    document.getElementById("btnReply").style.display = "none";
                    document.getElementById("btnFees").style.display = "none";
                }*/
            }
            if (type == "wzqk") {


                /*document.getElementById("btnReply").style.display = "none";
                document.getElementById("btnMaterial").style.display = "";
                document.getElementById("btnFees").style.display =  "none";*/
                document.getElementById("A1").style.color = "";
                document.getElementById("A2").style.color = "#0000FF"
                document.getElementById("A3").style.color = "";

                /*if(IsReply == "1")
                {
                    document.getElementById("btnReply").style.display = "none";
                    document.getElementById("btnFees").style.display = "none";
                    document.getElementById("btnMaterial").style.display = "";
                }
                else
                {
                    document.getElementById("btnReply").style.display = "none";
                    document.getElementById("btnFees").style.display = "none";
                    document.getElementById("btnMaterial").style.display = "none";
                }*/

            }



        }

        function Win_OnLoad() {
            var IsReply = IncidentAcceptManage.IsReply.value;
            if (IsReply == "1") {
                Showbtn_OnClick("sfqk");
            }
            else {
                Showbtn_OnClick("hfdj");
            }
            var strPrintParms = getObject("PrintParms").value;
            if (strPrintParms != "") {
                showOperatWin(strPrintParms);

                getObject("PrintParms").value = "";
            }
        }

    </script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body style="overflow-y: scroll;">
    <form id="IncidentAcceptManage" method="post" runat="server">
        <table id="Table2" class="DialogTable">
            <tr>
                <td valign="top">
                    <input type="hidden" id="hiIncidentImgs" name="hiIncidentImgs" runat="server" />
                    <input type="hidden" id="hiProcessIncidentImgs" name="hiProcessIncidentImgs" runat="server" />
                    <input type="hidden" id="CommID" name="CommID" runat="server" />
                    <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
                         <input id="IsAuditing22" size="1" type="hidden" name="IsAuditing22" runat="server">
                    <input id="IncidentID" type="hidden" size="1" name="MainID" runat="server">
                    <input id="IsReply" type="hidden" size="1" name="hiOPType" runat="server">
                    <input id="hiState" type="hidden" size="1" name="hiOPType" runat="server">
                    <input id="hiDispType" type="hidden" size="1" name="hiOPType" runat="server">
                    <input id="PageIndex" style="width: 24px; height: 22px" type="hidden" size="1" name="PageIndex" runat="server">
                    <input id="IncidentPlace" style="width: 24px; height: 22px" type="hidden" size="1" name="PageIndex" runat="server">
                    <input id="hiClassID" type="hidden" size="1" name="hiOPType" runat="server">
                    <input style="z-index: 0; width: 16px; height: 22px" id="DeviceTypeName" size="1" type="hidden" name="DeviceTypeName" runat="server" designtimedragdrop="207">
                    <input style="z-index: 0; width: 16px; height: 22px" id="DeviceID" size="1" type="hidden" name="DeviceID" runat="server" designtimedragdrop="207"></td>
            </tr>
            <tr>
                <td valign="top" bgcolor="#ffffff">
                    <table id="Header_TableMain" class="DialogTable">
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <table class="DialogTable" id="Table1">
                                        <tbody>
                                            <tr>
                                                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">报事信息</td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事类型</td>
                                                <td class="TdContent">
                                                    <asp:DropDownList ID="DrClass" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                                                <td class="TdTitle"></td>
                                                <td class="TdContent"></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事编号</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="IncidentNum" maxlength="50" name="IncidentNum" runat="server"></td>
                                                <td class="TdTitle">报事区域</td>
                                                <td class="TdContent">
                                                    <asp:RadioButton ID="rbplace1" runat="server" AutoPostBack="True" Text="业主权属" GroupName="rbplace"
                                                        Checked="True"></asp:RadioButton>
                                                    <asp:RadioButton ID="rbplace2" runat="server" AutoPostBack="True" Text="公共区域" GroupName="rbplace"></asp:RadioButton></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">
                                                    <asp:Label ID="LUserName" runat="server">客户名称</asp:Label></td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="CustName" readonly maxlength="50"
                                                        name="CustName" runat="server">
                                                    <asp:DropDownList ID="RegionalPlace" runat="server"></asp:DropDownList>
                                                    <input class="button_sel" style="display: none;" id="btnSelCust" onclick="javascript: if (btnSelCust_OnClick() == false) return false;"
                                                        type="button" value=" " name="btnSelCust" runat="server"><input id="CustID" style="width: 12px; height: 19px" type="hidden" size="1" name="CustID"
                                                            runat="server"><input id="hiCustName" style="width: 12px; height: 19px" type="hidden" size="1" name="hiCustName"
                                                                runat="server"><input class="button_sel" id="BtnSel" style="height: 20px; display: none;" disabled onclick="javascript: if (btnSelRegional_OnClick() == false) return false;"
                                                                    type="button" name="btnFilter" runat="server"></td>
                                                <td class="TdTitle">
                                                    <asp:Label ID="LbRoomSigns" runat="server">可选房号</asp:Label></td>
                                                <td class="TdContentSearch">
                                                    <select id="SelRoomID" class="easyui-combobox" data-options="editable:false" name="SelRoomID" runat="server">
                                                        <option selected></option>
                                                    </select><input id="DeviceName" class="easyui-searchbox"
                                                        readonly maxlength="50" size="10" name="DeviceName" runat="server"><asp:DropDownList ID="LocationName" runat="server"></asp:DropDownList>
                                                    <input style="z-index: 0; height: 22px; display: none;" id="BtnEquipmentDevice" class="button_sel" onclick="javascript: if (btnSelEquipmentDevice_OnClick() == false) return false;"
                                                        type="button" name="btnFilter" runat="server" designtimedragdrop="82"></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">
                                                    <asp:Label ID="LRoomSign" runat="server">房屋编号</asp:Label></td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" data-options="editable:false" id="RoomSign" readonly maxlength="50"
                                                        name="RoomSign" runat="server"><input class="button_sel" style="display: none;" id="btnSelRoom" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;"
                                                            type="button" value=" " name="btnSelRoom" runat="server"><input id="RoomID" style="width: 12px; height: 19px" type="hidden" size="1" name="RoomID"
                                                                runat="server"><input id="hiRoomSign" style="width: 12px; height: 19px" type="hidden" size="1" name="hiRoomSign"
                                                                    runat="server"><input id="RegionalID" style="width: 12px; height: 19px" type="hidden" size="1" name="hiRoomSign"
                                                                        runat="server">
                                                    <input class="easyui-validatebox" id="ObjectNameList" maxlength="50" name="ObjectNameList" readonly
                                                        runat="server"><input class="button_sel" id="SecObject" style="height: 20px; display: none;" onclick="javascript: if (btnSelObject_OnClick() == false) return false;"
                                                            type="button" name="SecObject" runat="server"><input type="hidden" id="ObjectIDList" name="ObjectIDList" runat="server"></td>
                                                <td class="TdTitle">报 事 人</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="IncidentMan" maxlength="50" name="IncidentMan" runat="server"></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事时间</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="IncidentDate"
                                                        maxlength="10" size="10" name="IncidentDate" runat="server"></td>
                                                <td class="TdTitle">报事方式</td>
                                                <td class="TdContent">
                                                    <asp:DropDownList ID="InfoSource" runat="server"></asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事类别</td>
                                                <td class="TdContentSearch">
                                                    <input class="easyui-searchbox" id="TypeName" data-options="editable:false" style="width: 76%" readonly name="CostName" runat="server">
                                                    <input class="button_sel" style="display: none;" id="btnSelCost" onclick="javascript: if (btnSelCost_OnClick() == false) return false;" type="button" value=" " name="btnSelCost" runat="server">
                                                    <input class="Control_ItemInput" id="hiTypeName" style="width: 32px; height: 22px" type="hidden" size="1" name="hiCostName" runat="server">
                                                    <input class="Control_ItemInput" id="TypeID" style="width: 32px; height: 22px" type="hidden" size="1" name="CostID" runat="server"></td>
                                                <td class="TdTitle">处理时限(小时)</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="DealLimit" disabled maxlength="50" name="DealLimit" runat="server"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                      <div class="SearchContainer" id="TableContainer2" style="width:99%"></div>
                                                    
                                                </td>
                                            </tr>
                                            <tr style="display:none">
                                                <td class="TdTitle">额定工时（分钟）</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="RatedWorkHour" readonly name="RatedWorkHour" runat="server" /></td>
                                                <td class="TdTitle">绩效系数</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="KPIRatio" readonly name="KPIRatio" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">紧急程度</td>
                                                <td class="TdContentSearch">
                                                    <select id="EmergencyDegree" name="EmergencyDegree" runat="server">
                                                        <option value="1">一般</option>
                                                        <option value="2">紧急</option>
                                                        <option value="3">非常紧急</option>
                                                    </select></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">
                                                    <input id="Hidden1" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
                                                        runat="server"><input id="PhTypeID" style="width: 32px; height: 22px" type="hidden" size="1" name="CostID"
                                                            runat="server">报事内容</td>
                                                <td class="TdContent" colspan="3">
                                                    <table cellspacing="0" cellpadding="0" width="100%">
                                                        <tr>
                                                            <td width="45%">
                                                                <textarea id="IncidentContent" style="width: 98%; height: 208px" name="IncidentContent" rows="13"
                                                                    cols="83" runat="server"></textarea>
                                                            </td>
                                                            <td valign="top" width="55%">
                                                                <table cellspacing="0" cellpadding="0" width="100%">
                                                                    <tr>
                                                                        <td style="height: 3px" align="left">常用短语：<input class="Control_ItemInput" id="PhrasesCom" style="width: 100px; height: 22px" maxlength="100" size="18" name="StanName" runat="server">&nbsp;
                                                                            <input class="button" id="btnFilter" disabled="disabled" type="submit" value="查询" name="btnFilter" runat="server">&nbsp;
                                                                            <input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();" type="button" value="清空" name="btnClear">&nbsp;
                                                                            <input class="button" id="BtnAdd" onclick="javascript: if (btnSelIncidentContent_OnClick() == false) return false;" type="submit" value="添加" name="btnFilter" runat="server">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div id="wins" style="overflow: auto; height: 178px; padding-top: 3px;">
                                                                                <asp:DataGrid ID="DGridContent" BorderColor="#cccccc" runat="server" CssClass="DataGrid" AllowSorting="True" AutoGenerateColumns="False"
                                                                                    Width="100%">
                                                                                    <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                                                                                    <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                                                                                    <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                                                                                    <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                                                                                    <Columns>
                                                                                        <asp:BoundColumn Visible="False" DataField="PhID"></asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="PhrasesCom" HeaderText="常用信息"></asp:BoundColumn>
                                                                                        <asp:ButtonColumn Text="&lt;img src=../images/icons/Select.gif  border=0 align=absmiddle  alt='选择'  &gt; "
                                                                                            HeaderText="[选择]" CommandName="sel">
                                                                                            <HeaderStyle Width="40px"></HeaderStyle>
                                                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                                        </asp:ButtonColumn>
                                                                                    </Columns>
                                                                                    <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                                                                                </asp:DataGrid>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">预约时间</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="ReserveDate" maxlength="10" size="10" name="ReserveDate" runat="server">
                                                </td>
                                                <td class="TdTitle">所需人数</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="ReserveLimit"
                                                        disabled maxlength="10" size="10" name="ReserveLimit" runat="server"></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">联系电话</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="Phone" maxlength="50" name="Phone" runat="server"></td>
                                                <td class="TdTitle">受 理 人</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="AdmiMan" disabled maxlength="10"
                                                        size="10" name="AdmiMan" runat="server"></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">报事图片</td>
                                                <td class="TdContent" colspan="3">
                                                    <span id="imgSpan"><%=ImgList%></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">分派信息</td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">
                                                    <asp:Label ID="LblDispType" runat="server"></asp:Label></td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="CoordinateNum" maxlength="50" name="Phone" runat="server"></td>
                                                <td class="TdTitle"></td>
                                                <td class="TdContent"></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">派工类别</td>
                                                <td class="TdContent">
                                                    <asp:RadioButton ID="rbDispType1" Enabled="false" runat="server" AutoPostBack="True" Text="派工单" GroupName="rbDispType"></asp:RadioButton>
                                                    <asp:RadioButton ID="rbDispType2" Enabled="false" runat="server" AutoPostBack="True" Text="协调单" GroupName="rbDispType"></asp:RadioButton></td>
                                                <td class="TdTitle">派 工 人</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" disabled id="DispMan" maxlength="50" name="Phone" runat="server"></td>
                                            </tr>
                                            <tr>
                                                <td class="TdTitle">派工时间</td>
                                                <td class="TdContent">
                                                    <input class="easyui-validatebox" id="DispDate" maxlength="50" name="Phone" runat="server"></td>
                                                <td class="TdTitle">处 理 人</td>
                                                <td class="TdContentSearch">
                                                    <input id="hiUserCodes" style="width: 16px; height: 22px" type="hidden" size="1" name="hiUserCodes" runat="server">
                                                    <input id="hiUserNames" style="width: 16px; height: 22px" type="hidden" size="1" name="hiUserNames" runat="server">
                                                    <input id="UserCodes" style="width: 16px; height: 22px" type="hidden" size="1" name="UserCodes" runat="server">
                                                    <input class="easyui-searchbox" searcher="SelDealMan" disabled style="width: 76%" data-options="editable:false" id="DealMan" maxlength="100" name="DealMan" runat="server">
                                                    <input class="button_sel" style="display: none;" id="btnSelUsers" onclick="javascript: if (btnSelUsers_OnClick() == false) return false;" type="button" name="btnSelUsers" runat="server"></td>
                                            </tr>
                                            <asp:Panel ID="Panel1" runat="server">
                                                <tr>
                                                    <td class="TdTitle">派工转协调原因</td>
                                                    <td class="TdContent" colspan="3">
                                                        <table cellspacing="0" cellpadding="0" width="100%">
                                                            <tr>
                                                                <td width="45%">
                                                                    <textarea class="easyui-validatebox" style="width: 98%; height: 208px" disabled="disabled" id="Reasons" name="IncidentContent"
                                                                        runat="server"></textarea></td>
                                                                <td width="55%"></td>
                                                            </tr>
                                                        </table>
                                                    </td>

                                                    <td class="TdTitle"></td>
                                                    <td class="TdContent"></td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">处理信息</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="DialogTable" id="xdj2" align="center" runat="server">
                                        <tr>
                                            <td colspan="4" style="width: 100%;">
                                                <div id="Container" runat="server">
                                                    <div id="TableContainer"></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="formTable" id="xdj" cellspacing="1" cellpadding="4" align="center" runat="server">
                                        <tr>
                                            <td class="formTable_Item" align="center" width="15%" colspan="4">
                                                <input class="button" id="BtnCoordinate" type="button" value="跟进登记" onclick="AddCoordinationReg();" name="btnFilter" runat="server" disabled readonly></td>
                                        </tr>
                                    </table>
                                    <table class="DialogTable" cellspacing="1" cellpadding="4" align="center">
                                                                          <tr>
                                                <td class="TdTitle">接单时间</td>
                                                <td class="TdContent">
                                                    <input  id="ReceivingDate"  class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss'})"  name="ReceivingDate" runat="server" disabled readonly></td>
                                                <td class="TdTitle">到场时间</td>
                                                <td class="TdContent">
                                                    <input id="ArriveData" disabled readonly class="Wdate"  onclick="WdatePicker({  dateFmt: 'yyyy-MM-dd HH:mm:ss'})"  name="ArriveData" runat="server"></td>
                                            </tr>
                                        <tr>
                                            <td class="TdTitle">完结时间</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" id="MainEndDate" disabled readonly maxlength="50" name="Phone" runat="server"></td>
                                            <td class="TdTitle">
                                                <asp:Label ID="lbSignatory" runat="server">实 签 人</asp:Label></td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" disabled id="Signatory" maxlength="50" name="Phone" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">处理情况</td>
                                            <td class="TdContent" colspan="3">
                                                <table cellspacing="0" cellpadding="0" width="100%">
                                                    <tr>
                                                        <td width="45%">
                                                            <textarea id="DealSituation" disabled readonly style="width: 98%; height: 135px" name="DealSituation" rows="8"
                                                                cols="53" runat="server"></textarea></td>
                                                        <td valign="top" width="55%">
                                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                                <tr>
                                                                    <td style="height: 3px" align="left">常用短语：<input disabled readonly class="Control_ItemInput" id="PhrasesCom2" style="width: 100px; height: 22px" maxlength="100" size="18" name="StanName" runat="server">&nbsp;
                                                                        <input class="button" id="btnFilterDS" type="submit" disabled="disabled" value="查询" name="btnFilter" runat="server">&nbsp;
                                                                        <input class="button" id="btnClearDS" onclick="javascript: btnClear_OnClick();" type="button" value="清空" name="btnClear">&nbsp;
                                                                        <input class="button" id="BtnAddDS" onclick="javascript: if (btnSelDealSituation_OnClick() == false) return false;" type="submit" value="添加" name="btnFilter" runat="server">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div id="wins2" style="height: 105px; overflow: auto; padding-top: 3px;">
                                                                            <asp:DataGrid ID="DGridDS" runat="server" BorderColor="#cccccc" CssClass="DataGrid" AllowSorting="True" AutoGenerateColumns="False"
                                                                                Width="100%">
                                                                                <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                                                                                <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                                                                                <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                                                                                <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                                                                                <Columns>
                                                                                    <asp:BoundColumn Visible="False" DataField="PhID"></asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PhrasesCom" HeaderText="常用信息"></asp:BoundColumn>
                                                                                    <asp:ButtonColumn Text="&lt;img src=../images/icons/Select.gif  border=0 align=absmiddle  alt='选择'  &gt; "
                                                                                        HeaderText="[选择]" CommandName="sel">
                                                                                        <HeaderStyle Width="40px"></HeaderStyle>
                                                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                                    </asp:ButtonColumn>
                                                                                </Columns>
                                                                                <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                                                                            </asp:DataGrid><font face="宋体"></font>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">客户意见</td>
                                            <td class="TdContent" colspan="3">
                                                <table cellspacing="0" cellpadding="0" width="100%">
                                                    <tr>
                                                        <td width="45%">
                                                            <textarea id="CustComments" disabled readonly style="width: 98%; height: 135px" name="Textarea1" rows="8" cols="53"
                                                                runat="server"></textarea>
                                                        </td>
                                                        <td valign="top" width="55%">
                                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                                <tr>
                                                                    <td style="height: 3px" align="left">常用短语：<input disabled readonly class="Control_ItemInput" id="PhrasesCom3" style="width: 100px; height: 22px" maxlength="100" size="18" name="StanName" runat="server">&nbsp;
                                                                        <input class="button" id="btnFilterCC" disabled="disabled" type="submit" value="查询" name="btnFilter" runat="server">&nbsp;
                                                                        <input class="button" id="btnClearCC" onclick="javascript: btnClear_OnClick();" type="button" value="清空" name="btnClear">&nbsp;
                                                                        <input class="button" id="BtnAddCC" onclick="javascript: if (btnSelCustComments_OnClick() == false) return false;" type="submit" value="添加" name="btnFilter" runat="server">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div id="wins3" style="height: 105px; overflow: auto; padding-top: 3px;">
                                                                            <asp:DataGrid ID="DGridCC" runat="server" BorderColor="#cccccc" CssClass="DataGrid" AllowSorting="True" AutoGenerateColumns="False"
                                                                                Width="100%">
                                                                                <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                                                                                <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                                                                                <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                                                                                <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                                                                                <Columns>
                                                                                    <asp:BoundColumn Visible="False" DataField="PhID"></asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PhrasesCom" HeaderText="常用信息"></asp:BoundColumn>
                                                                                    <asp:ButtonColumn Text="&lt;img src=../images/icons/Select.gif  border=0 align=absmiddle  alt='选择'  &gt; "
                                                                                        HeaderText="[选择]" CommandName="sel">
                                                                                        <HeaderStyle Width="40px"></HeaderStyle>
                                                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                                    </asp:ButtonColumn>
                                                                                </Columns>
                                                                                <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                                                                            </asp:DataGrid><font face="宋体"></font>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">服务质量评价</td>
                                            <td class="TdContent">
                                                <asp:DropDownList ID="ServiceQuality" Enabled="false" runat="server">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="非常满意">非常满意</asp:ListItem>
                                                        <asp:ListItem Value="满意">满意</asp:ListItem>
                                                        <asp:ListItem Value="一般">一般</asp:ListItem>
                                                        <asp:ListItem Value="不满意">不满意</asp:ListItem>
                                                        <asp:ListItem Value="很不满意">很不满意</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td class="TdTitle">物品设施评价</td>
                                            <td class="TdContent">
                                                <asp:DropDownList ID="ArticlesFacilities" Enabled="false" runat="server">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="完好">完好</asp:ListItem>
                                                        <asp:ListItem Value="尚可使用">尚可使用</asp:ListItem>
                                                        <asp:ListItem Value="丢失">丢失</asp:ListItem>
                                                        <asp:ListItem Value="报废">报废</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">处理状态</td>
                                            <td class="TdContent">
                                                <asp:RadioButton ID="rbState1" runat="server" Text="已完结" GroupName="rbState"></asp:RadioButton>
                                                <asp:RadioButton ID="rbState2" runat="server" Text="未完结" GroupName="rbState"></asp:RadioButton></td>
                                            <td class="TdTitle">备&nbsp;&nbsp;&nbsp; 注</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" disabled id="IncidentMemo" maxlength="50" name="Phone" runat="server"></td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">文件上传</td>
                                            <td class="TdContent">
                                                <input id="btnFile" type="file" disabled readonly="readonly" name="btnFile" runat="server">
                                                <input class="button" id="btnFileUp" disabled readonly="readonly" onclick="javascript: if (btnFileUp_Onclick() == false) return false;" type="button" value="上传" name="btnFileUp" runat="server"></td>
                                            <td class="TdTitle">文件说明</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" disabled id="AdjunctName" name="AdjunctName" runat="server">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">处理图片</td>
                                            <td class="TdContent" colspan="3">
                                                <span id="imgSpanNew"><%=ImgListNew%></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formTable_ItemInput" colspan="4">
                                                <asp:DataGrid ID="DGrid" BorderColor="#cccccc" runat="server" CssClass="DataGrid" AutoGenerateColumns="False"
                                                    Width="100%">
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
                                                </asp:DataGrid></td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">回访信息</td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">是否回访</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" disabled id="IsReplyStatus" runat="server" />
                                            </td>
                                            <td class="TdTitle">回访结果</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" disabled id="ReplyResult" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">首次回访时间</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" disabled id="FirstReplyDate" runat="server" />
                                            </td>
                                            <td class="TdTitle">回访内容</td>
                                                <td class="TdContent">
                                                    <textarea disabled id="ReplyContent" style="width: 100%" name="ReplyContent" rows="6" runat="server"></textarea>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">返工信息</td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">是否返工</td>
                                            <td class="TdContentSearch">
                                                <select id="IsReWork" name="IsReWork" runat="server">
                                                    <option value="0">否</option>
                                                    <option value="1">是</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">有无返工</td>
                                            <td class="TdContent">
                                                <input type="text" id="ReWorkStatus" name="ReWorkStatus" disabled runat="server" />
                                            </td>
                                            <td class="TdTitle">返工时间</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" id="ReWorkDate" name="ReWorkDate" disabled runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="TdTitle">操作人</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" id="ReWorkCreater" name="ReWorkCreater" runat="server" />
                                            </td>
                                            <td class="TdTitle">返工原因</td>
                                            <td class="TdContent">
                                                <input class="easyui-validatebox" id="ReWorkContent" name="ReWorkContent" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formTable_Footer" align="center" colspan="4">
                                                <input id="btnNewSave" class="button" type="button" value="保存" onclick="javascript: CheckData();" runat="server" /> <input class="button" id="btnSave" style="display:none" type="button" value="保存" name="btnSave" runat="server"/>
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server"></td>
                                        </tr>
                                    </table>
                                     
                                    <div style="height: 300px;">
                                        <iframe id="IncidentFrame" src="ProcessingManageFooter.aspx?type=1&amp;IncidentID=<%=IncidentID.Value%>&amp;State=<%=hiState.Value%>&amp;Reply=<%=IsReply.Value%>&amp;CoordinateNum=<%=CoordinateNum.Value%>&amp;IncidentDate=<%=IncidentDate.Value%>&amp;CustName=<%=CustName.Value %>" style="width: 100%; height: 100%; border: none;" class="Frm"></iframe>
                                    </div>
                                    <div id="hidpanel" style="display: none;" runat="server">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                    </table>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            column = [[
            { field: 'CoordinateMan', title: '跟进人', width: 200, align: 'left', sortable: true },
            { field: 'CoordinateDate', title: '跟进时间', width: 100, align: 'left', sortable: true },
            { field: 'CoordinateContent', title: '跟进内容', width: 400, align: 'left', sortable: true }
            ]];


            function InitFunction() {

                $("#TableContainer2").css("height", "150px");
            }
            InitFunction();


            var column2 = [[

                 { field: 'TypeName', title: '报事类别', rowspan: 2, width: 150, align: 'left', sortable: true },
                 { colspan: 2, title: '额定工时' },
                 { field: 'KPIRatio', title: '绩效系数', rowspan: 2, width: 150, align: 'left', sortable: true },


            ], [
                { field: 'RatedWorkHour', title: '工时（分钟）', width: 150, align: 'left', sortable: true },
                 {
                     field: 'RatedWorkHourNumber', title: '数量', width: 150, align: 'left', sortable: true
                 }
            ]];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSCustInfo&Command=SelectCoordinateList&IsDelete=0' + '&IncidentID=' + $('#IncidentID').val() + '&CommID=' + $('#CommID').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 30, 60],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    sortOrder: "asc"
                });
            }
            LoadList();

            function AddCoordinationReg() {
                HDialog.Open('720', '300', '../IncidentNew/CoordinationReg.aspx?IncidentID=' + $("#IncidentID").val() + '&CommID=' + $("#CommID").val(), "跟进登记", false, function callback(_Data) {
                    if (_Data == 1) {
                        LoadList();
                    }
                });
            }

            function LoadList2() {
                $("#TableContainer2").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSCustInfo&Command=IncidentRatedWorkHour&IncidentID=' + $('#IncidentID').val(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column2,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: true,
                    width: "100%",
                    sortOrder: "asc"
                });
            }
            LoadList2();

            function SelDealMan() {
                if ($("#TypeName").searchbox('getValue') == "") {
                    HDialog.Info('请选择报事类别');
                }
                else {
                    var TypeID = $("#TypeID").val();
                    TypeID = TypeID.substring(1, TypeID.length - 1);
                    HDialog.Open('640', '480', '../DialogNew/IncidentDealMan.aspx?TypeID=' + TypeID, '选择处理人员', false, function callback(_Data) {
                        var arrRet = _Data.split('\t');
                        $("#DealMan").searchbox("setValue", arrRet[1]);
                        $("#UserCodes").val(arrRet[0]);
                    });
                }
            }

            function max(img) {
                window.open(img.src, "新窗口", "height=400;width=800");
            }

            $("#btnReturn").click(function () {
                HDialog.Close();
            })
        </script>
    </form>
</body>
</html>
