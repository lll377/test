<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiCustCanRoomDlg_ListJH.aspx.cs" Inherits="M_Main.DialogNew.MultiCustCanRoomDlg_ListJH" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript">
		<!--
    function btnClear_OnClick() {
        $("#CustName").val("");
        $("#RoomSign").val("");
    }

    function btnFilter_OnClick() {
        var hiCustCanType = $("#CustCanType").combobox('getValues');
        $("#hiCustCanType").val(hiCustCanType);

    }

    function checkFormAll(chk) {
        var val = $("#SelReturn", window.parent.document).val();
        var form = $("#MultiCustList")[0];
        var chkval;
        for (var i = 0; i < form.elements.length; i++) {
            chkval = "|" + form.elements[i].value;
            //选择
            if (form.elements[i].type == "checkbox") {
                var tmpName = form.elements[i].name;
                if (tmpName.substr(1, 4) == "Grid") {
                    form.elements[i].checked = chk.checked

                    //付值
                    if (form.elements[i].value != "on") {
                        if (form.elements[i].checked) {
                            if (val.indexOf(chkval) < 0) {
                                val = val + chkval
                            }
                        }
                        else {
                            val = val.replace(chkval, "")

                        }
                    }
                }
            }
        }
        $("#SelReturn", window.parent.document).val(val);

        //alert(getParentObject("SelReturn").value)
    }

    function checkFormOne(chk) {
        var val = $("#SelReturn", window.parent.document).val();
        var chkval = "|" + chk.value;
        if (chk.checked) {
            if (val.indexOf(chkval) < 0) {
                val = val + chkval;
            }

        }
        else {
            val = val.replace(chkval, "")

        }

        $("#SelReturn", window.parent.document).val(val);
        setcheckForm();
        //alert(getParentObject("SelReturn").value)
    }
    function setcheckForm() {
        var vala = $("#SelReturn", window.parent.document).val();
        form = $("#MultiCustList")[0];
        var chkvala = "";
        debugger;
        for (var i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type == "checkbox") {
                chkvala = "|" + form.elements[i].value
                if (form.elements[i].value != "on") {

                    if (vala.indexOf(chkvala) < 0) {
                        form.elements[i].checked = false
                    }
                    else {
                        form.elements[i].checked = true
                    }
                }
            }
        }

        $("#SelSQLEx", window.parent.document).val($("#mSQLEx").val());
    }

    //-->
    </script>
</head>
<body onload="setcheckForm()" style="overflow-y: auto;">
    <form id="MultiCustList" runat="server">
        <input type="hidden" name="hiCustCanType" id="hiCustCanType" runat="server" />
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="left">
                    <table class="DialogTable" cellspacing="1" cellpadding="4" align="center">
                        <tr>
                            <td class="TdTitle">客户类别</td>
                            <td class="TdContentSearch">
                                <%-- <asp:DropDownList ID="CustCanType" runat="server" AutoPostBack="True"></asp:DropDownList>--%>

                                <select id="CustCanType" name="CustCanType" class="easyui-combobox"
                                    data-options=" multiple: true " style="width: 140px;" runat="server">
                                </select>
                            </td>
                        </tr>
                        <%--<tr>
                            <td class="TdTitle">客户名称</td>
                            <td class="TdContent">
                                <input id="CustName" name="CustName" runat="server" maxlength="100" class="easyui-validatebox"></td>
                            <td class="TdTitle">房屋编号</td>
                            <td class="TdContent">
                                <input class="easyui-validatebox" id="RoomSign" maxlength="100" name="RoomSign" runat="server"></td>
                        </tr>
                        <tr runat="server" id="TRList">
                            <td class="TdTitle">兴趣爱好</td>
                            <td class="TdContent">
                                <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
                        </tr>--%>
                    </table>
                    <table class="SchTable" style="font-size: 12px; padding-bottom: 5px;" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td align="center">
                                <%--<input id="btnCre" class="button" value="生成" type="submit" name="btnCre" runat="server">--%>
                                <input class="button" id="btnFilter" type="submit" value="查询" name="btnFilter" runat="server" onclick="javascript: btnFilter_OnClick();">
                                <%--<input class="button" id="btnClear" onclick="javascript: btnClear_OnClick();" type="button" value="清空" name="btnClear">--%>
                                <input id="SelReturn" style="width: 20px; height: 22px" type="hidden" size="1" name="SelReturn"
                                    runat="server"><input id="IsHis" style="width: 32px; height: 22px" type="hidden" size="1" name="IsHis"
                                        runat="server"><input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
                                            runat="server"><input style="width: 32px; height: 22px" id="CommID" size="1" type="hidden" name="CommID"
                                                runat="server">
                                <input id="BuildSNum" style="width: 32px; height: 22px" type="hidden" size="1" name="BuildSNum"
                                    runat="server"><input id="UnitSNum" style="width: 32px; height: 22px" type="hidden" size="1" name="UnitSNum"
                                        runat="server"><input id="FloorSNum" style="width: 32px; height: 22px" type="hidden" size="1" name="FloorSNum"
                                            runat="server">
                                <input style="z-index: 0; width: 32px; height: 22px" id="RegionSNum" size="1" type="hidden"
                                    name="RegionSNum" runat="server"><input style="z-index: 0; width: 32px; height: 22px" id="RoomState" size="1" type="hidden"
                                        name="RoomState" runat="server">
                                <input id="mSQLEx" type="hidden" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" width="100%" bgcolor="#ffffff">
                    <asp:DataGrid ID="DGrid" runat="server" Height="100%" CssClass="DataGrid" Width="100%" AutoGenerateColumns="False"
                        AllowSorting="True">
                        <SelectedItemStyle CssClass="DataGrid_Select"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn Visible="False" DataField="RoomID"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CustName" HeaderText="客户名称">
                                <HeaderStyle Width="40%"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="RoomSign" HeaderText="房屋编号">
                                <HeaderStyle Width="30%"></HeaderStyle>
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="MobilePhone" HeaderText="手机号码"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="[选择]">
                                <HeaderStyle Width="60px"></HeaderStyle>
                                <HeaderTemplate>
                                    <input onclick=" checkFormAll(this)" type="checkbox" runat="server" value="on" id="Checkbox1"
                                        name="Checkbox1">全选
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input id="ck" type="checkbox" value='<%# DataBinder.Eval(Container.DataItem,"RoomID") + "\t" +  DataBinder.Eval(Container.DataItem,"RoomSign") + "\t" +  DataBinder.Eval(Container.DataItem,"MobilePhone") %>' name="ck" runat="server" onclick="checkFormOne(this)">
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle CssClass="DataGrid_Pager"></PagerStyle>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0" height="38">
                        <tr>
                            <td width="20" class="formTable_Footer_left" height="38">&nbsp;</td>
                            <td height="38" class="formTable_Footer_center" align="center">
                                <webdiyer:AspNetPager ID="ANPCut" runat="server" HorizontalAlign="Right" SubmitButtonClass="inputbott"
                                    InputBoxClass="inputline" PageSize="10" CustomInfoSectionWidth="30%" FirstPageText=""
                                    LastPageText="" NextPageText="下一页"
                                    PrevPageText="上一页" NumericButtonCount="5" ShowBoxThreshold="1"
                                    ShowInputBox="Always" TextBeforeInputBox="转到" TextAfterInputBox="页" ShowCustomInfoSection="Left" AlwaysShow="True"
                                    SubmitButtonText="确定" CustomInfoTextAlign="Right" Font-Bold="True" InputBoxStyle="width:30px;">
                                </webdiyer:AspNetPager>
                            </td>
                            <td width="20" class="formTable_Footer_right" height="38">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

