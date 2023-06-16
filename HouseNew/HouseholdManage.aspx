<%@ Page Language="c#" CodeBehind="HouseholdManage.aspx.cs" EnableEventValidation="false" AutoEventWireup="false" Inherits="M_Main.HouseNew.HouseholdManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>HouseholdManage</title>

    <%--  <script language="javascript" src="../jscript/DateControl.js"></script>
   
    <script language="javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>--%>
    <script language="javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script language="javascript">
        function CheckData() {


            if (HouseholdManage.CustName.value == "") {
                HDialog.Info("请输入客户名称,此项不能为空!");
                return false;
            }
            if (HouseholdManage.RoomSign.value == "") {
                alert("请输入房屋编号,此项不能为空!");
                HouseholdManage.RoomSign.focus();
                return false;
            }

            if (HouseholdManage.MemberName.value == "") {
                HDialog.Info("请输入居住成员名称,此项不能为空!");
                return false;
            }

            //if(HouseholdManage.PaperCode.value=="")
            //{
            //	alert("请输入证件号码,此项不能为空!");
            //	HouseholdManage.PaperCode.focus();
            //	return false;
            //}

            //证件号码
            var strPaperCodeResults = getObject("PaperCodeResults").innerHTML;

            if ((strPaperCodeResults != "") && (strPaperCodeResults != "新的号码！")) {
                HDialog.Info(strPaperCodeResults);
                HouseholdManage.PaperCode.focus();
                return false;
            }

            //if (HouseholdManage.Linkman.value == "") {
            //    HDialog.Info("请输入绑定手机户名,此项不能为空!");
            //    HouseholdManage.Linkman.focus();
            //    return false;
            //}
            //if (HouseholdManage.LinkmanTel.value == "") {
            //    HDialog.Info("请输入绑定手机号码,此项不能为空!");
            //    HouseholdManage.LinkmanTel.focus();
            //    return false;
            //}
            //var strLinkmanTel = HouseholdManage.LinkmanTel.value;

            //if (strLinkmanTel.length != 11) {
            //    HDialog.Info("绑定手机号码位数错误!");
            //    HouseholdManage.LinkmanTel.focus();
            //    return false;
            //}


            /*	var strresults = getObject("results").innerHTML;
        
                if((strresults!="")&&(strresults!="新的登录账号！"))
                {
                    //alert(strresults);
                    HouseholdManage.InquireAccount.focus();
                    return false;
                }*/

            return true;
        }
        function CheckAccount() {
            var strInquireAccount = HouseholdManage.InquireAccount.value;
            var strOldAccount = HouseholdManage.OldAccount.value;
            getObject("results").innerHTML = "";
            //alert(strLoginCode);
            document.getElementById("headImg")
            Request.sendPOST("CheckAccount.aspx", "InquireAccount=" + strInquireAccount + "&OldAccount=" + strOldAccount, callbackAccount)

        }
        function callbackAccount(xmlHttp) {
            //alert(xmlHttp.responseText);
            var varReturn = xmlHttp.responseText;
            getObject("results").innerHTML = varReturn;
        }

        function CheckPaperCode() {
            var strHoldID = HouseholdManage.HoldID.value;
            var strPaperCode = HouseholdManage.PaperCode.value;

            getObject("results").innerHTML = "";
            //alert(strLoginCode);

            Request.sendPOST("../House/CheckPaperCode.aspx", "HoldID=" + strHoldID + "&PaperCode=" + strPaperCode + "&Rnd=" + Math.random(), callbackPaperCode);

        }
        function callbackPaperCode(xmlHttp) {
            //alert(xmlHttp.responseText);
            //var varReturn = xmlHttp.responseText;
            //getObject("PaperCodeResults").innerHTML = varReturn;
            var varReturn = xmlHttp.responseText;
            var res = varReturn.split('|');

            //getObject("PaperCodeResults").innerHTML = res[1];
            if (res[0] == "false") {
                HDialog.Info(res[1]);
            }
        }

        function btnFileUp_Onclick() {
            if (HouseholdManage.AdjunctName.value == "") {
                alert("请输入文件附件名称,此项不能为空!");
                HouseholdManage.AdjunctName.focus();
                return false;
            }

            if (HouseholdManage.btnFile.value == "") {
                alert("请选择要上传的本地文件!");
                HouseholdManage.btnFile.focus();
                return false;
            }

            return true;
        }

        function btnPicFileUp_Onclick() {
            if (HouseholdManage.PicName.value == "") {
                alert("请输入文件附件名称,此项不能为空!");
                HouseholdManage.PicName.focus();
                return false;
            }

            if (HouseholdManage.btnPicFile.value == "") {
                alert("请选择要上传的本地文件!");
                HouseholdManage.btnPicFile.focus();

                return false;

            }

            return true;
        }

        function changeImgSrc(src) {
            $("#headImg").attr("src", src);
        }
        function btnFile_Onclick() {
            var filename = HouseholdManage.btnFile.value;
            var realname = filename.substring(filename.lastIndexOf("\\") + 1, filename.lastIndexOf("."));
            HouseholdManage.AdjunctName.value = realname;
            $("#AdjunctName").val(realname);
        }

        function btnPicFile_Onclick() {
            var filename = HouseholdManage.btnPicFile.value;
            var realname = filename.substring(filename.lastIndexOf("\\") + 1, filename.lastIndexOf("."));
            HouseholdManage.PicName.value = realname;
            $("#PicName").val(realname);
        }

        function btnSelRoom_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                HouseholdManage.RoomID.value = varObjects[0];
                HouseholdManage.RoomSign.value = varObjects[2];
                HouseholdManage.hiRoomSign.value = varObjects[2];

                HouseholdManage.CustID.value = varObjects[1];
                HouseholdManage.CustName.value = varObjects[3];
                HouseholdManage.hiCustName.value = HouseholdManage.CustName.value;
                //alert(varReturn);


                return true;
            }

            return false;
        }

        function btnSelCust_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                HouseholdManage.CustID.value = varObjects[0];
                HouseholdManage.CustName.value = varObjects[1];
                HouseholdManage.Linkman.value = varObjects[1];
                HouseholdManage.hiCustName.value = varObjects[1];

                HouseholdManage.RoomSign.value = "";
                HouseholdManage.RoomID.value = "";
                HouseholdManage.hiRoomSign.value = "";


                return true;
            }

            return false;
        }

        function btnSelCustt_OnClick() {
            var varReturn;
            varReturn = showModalDlg("../dialog/CustSuperDlg.aspx" + "?Ram=" + Math.random(), "", 750, 530);
            //alert("["+varReturn+"]");
            if (varReturn != "") {//**获得返回 刷新
                var varObjects = varReturn.split("\t");

                HouseholdManage.MemberCode.value = varObjects[0];
                HouseholdManage.MemberName.value = varObjects[1];
                HouseholdManage.Linkman.value = varObjects[1];

                return true;
            }

            return false;
        }

        function SelRoomID_OnChange() {
            HouseholdManage.RoomID.value = HouseholdManage.SelRoomID.options[HouseholdManage.SelRoomID.selectedIndex].value;
            HouseholdManage.RoomSign.value = HouseholdManage.SelRoomID.options[HouseholdManage.SelRoomID.selectedIndex].text;
            HouseholdManage.hiRoomSign.value = HouseholdManage.RoomSign.value;
        }
        function onLinkmanTel() {

            var strMobilePhone = HouseholdManage.MobilePhone.value;
            if (strMobilePhone.length > 11) {
                HouseholdManage.LinkmanTel.value = strMobilePhone.substr(0, 11);
            }
            else {
                HouseholdManage.LinkmanTel.value = strMobilePhone;
            }
        }

        //function WriteLinkMan()
        //{
        //    $("#Linkman").val($("#MemberName").val());
        //}

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        function CheckUpdate() {

            if (GetQueryString("IsLock") == "1") {
                $("#btnSave").attr('disabled', false)
                $("#btnSave").removeAttr("onclick");
                $("#btnSave").css("background-color", "#B8B8B8");

                $("#btnSaveAdd").attr('disabled', false)
                $("#btnSaveAdd").removeAttr("onclick");
                $("#btnSaveAdd").css("background-color", "#B8B8B8");

                $("#btnSaveClose").attr('disabled', false)
                $("#btnSaveClose").removeAttr("onclick");
                $("#btnSaveClose").css("background-color", "#B8B8B8");
            }
        }


        $(document).ready(
            function () {
                CheckUpdate();
            }
        )
    </script>
</head>
<body style="overflow-y: auto;">
    <form id="HouseholdManage" name="HouseholdManage" method="post" runat="server">
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="HoldID" type="hidden" size="1" name="HoldID" runat="server">
        <input id="OldAccount" type="hidden" size="1" name="OldAccount" runat="server">
        <input id="hiCustName" type="hidden" size="1" name="hiCustName" runat="server">
        <input id="hiRoomSign" type="hidden" size="1" name="hiRoomSign" runat="server">
        <input id="Option" name="Option" type="hidden" runat="server">
        <input id="OptionName" name="OptionName" type="hidden" runat="server">

        <input id="FixedTelHistory" type="hidden" name="FixedTelHistory" runat="server" />
        <input id="MobilePhoneHistory" type="hidden" name="MobilePhoneHistory" runat="server" />
        <input id="PaperCodeHistory" type="hidden" name="PaperCodeHistory" runat="server" />

        <table class="DialogTable" id="Table1">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">选择户主信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 82%;" data-options="editable:false,required:true" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" style="width: 82%;" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 82%;" data-options="editable:false,required:true" id="RoomSign" maxlength="50" name="RoomSign" searcher="SelRoom" runat="server" />
                    <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent">
                    <div class="font_red" id="results"></div>
                </td>
            </tr>
        </table>
        <table class="DialogTable">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">居住成员信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">与户主关系</td>
                <td class="TdContentSearch">
                    <select id="Relationships" style="width: 82%;" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox" name="Relationships" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">成员名称</td>
                <td class="TdContentSearch">
                    <input id="MemberName" style="width: 82%;" data-options="editable:true" class="easyui-searchbox" name="MemberName" searcher="SelCustSuper" runat="server">
                    <input class="button_sel" style="display: none;" id="btnSelCustt" type="button" value=" " name="btnSelCustt" runat="server">
                    <input id="MemberCode" type="hidden" value="0" name="MemberCode" runat="server">
                </td>
                <td class="TdTitle">出入卡号</td>
                <td class="TdContent">
                    <input id="PassSign" name="PassSign" runat="server">
                    <span id="InOutWork" style="cursor: pointer; color: red; font-weight: bold;" title="出入卡办理">办理</span></td>
                <td class="TdTitle">证件名称</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="PaperName" Style="width: 82%;" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'"></asp:DropDownList></td>

            </tr>
            <tr>
                <td class="TdTitle">证件号码</td>
                <td class="TdContent">
                    <input id="PaperCode" name="PaperCode" runat="server"
                        onblur="javascript:CheckPaperCode();"><div class="font_red" id="PaperCodeResults"></div>
                </td>
                <td class="TdTitle">证件地址</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="PaperCodeAddress" style="width: 92%;" name="PaperCodeAddress" runat="server" /></td>
                <td class="TdTitle">性别</td>
                <td class="TdContentSearch">
                    <select id="Sex" style="width: 82%;" class="easyui-combobox" name="Sex" runat="server" data-options="editable:false,panelHeight: 'auto'">
                        <option selected></option>
                    </select></td>
               
            </tr>
            <tr>
                 <td class="TdTitle">出生日期</td>
                <td class="TdContent">
                    <input id="Birthday" type="text" name="Birthday" onclick="WdatePicker()" runat="server"></td>
                <td class="TdTitle">国籍</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="Nationality" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox" Style="width: 82%;" runat="server"></asp:DropDownList></td>
                 <td class="TdTitle">工作单位</td>
                <td class="TdContent">
                    <input id="WorkUnit" name="WorkUnit" runat="server">
                </td>

                <td class="TdTitle">固定电话</td>
                <td class="TdContent">
                    <input id="FixedTel" name="FixedTel" runat="server">
                </td>
            </tr>
            <asp:Panel ID="PanelName" runat="server" Visible="False">
                <tr>
                    <td class="TdTitle">职业</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="DrJob" data-options="editable:false,panelHeight: 'auto'" Style="width: 82%;" runat="server" class="easyui-combobox"></asp:DropDownList>
                    </td>
                    <td class="TdTitle">姓</td>
                    <td class="TdContent">
                        <input style="width: 45%" id="Surname" maxlength="20" size="44"
                            name="Surname" runat="server">名<input style="width: 45%" id="Name" maxlength="50" name="Name"
                                runat="server"></td>
                    <td class="TdTitle">入住时间</td>
                    <td class="TdContent">
                        <input id="StayTime" onkeypress="CheckSmallDate();" onclick="WdatePicker()"
                            maxlength="50" name="StayTime" runat="server"></td>
                </tr>
            </asp:Panel>
             <tr style="display: none">
                <td class="TdTitle">登录帐号</td>
                <td class="TdContent" colspan="3">
                    <input id="InquireAccount" onblur="javascript:CheckAccount();" name="InquireAccount" runat="server"></td>

            </tr>
            <tr>
               
                <td class="TdTitle">移动电话</td>
                <td class="TdContent">
                    <input onblur="javascript:onLinkmanTel();" id="MobilePhone" name="MobilePhone" runat="server"></td>
                <td class="TdTitle">绑定手机户名</td>
                <td class="TdContent">
                    <input id="Linkman" maxlength="50" data-options="required:true" name="Linkman" runat="server"></td>
                <td class="TdTitle">绑定手机号码</td>
                <td class="TdContent">
                    <input id="LinkmanTel" maxlength="11" data-options="required:true" name="LinkmanTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">兴趣爱好</td>
                <td class="TdContentSearch" colspan="7">
                    <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="4"></asp:CheckBoxList></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">是否委托人</td>
                <td class="TdContent">
                    <input id="IsEntrust" name="IsEntrust" type="checkbox" runat="server">
                </td>
                <td class="TdTitle">委托开始时间</td>
                <td class="TdContent">
                    <input id="EntrustStartTime" type="text" name="EntrustStartTime" onclick="WdatePicker()" runat="server">
                </td>
                <td class="TdTitle">委托结束时间</td>
                <td class="TdContent">
                    <input id="EntrustEndTime" type="text" name="EntrustEndTime" onclick="WdatePicker()" runat="server">
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">委托权限</td>
                <td class="TdContentSearch" colspan="7">
                    <input id="txtOption" name="txtOption" class="easyui-combobox" tbname="ClientAuthority" dictionary="true" bindid="DictionaryCode" bindname="DictionaryMemo" multiple="true" multiline="true" style="width: 95%; height: 40px" data-options="editable:false,required:false,
                        icons:[{iconCls:'icon-clear',
                        handler: function(e){
                            $(e.data.target).combobox('clear');
                        }}],
                        onChange:function(newValue, oldValue){
                            $('#Option').val($('#txtOption').combobox('getValues'));
                        }" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContentSearch" colspan="7">
                    <textarea id="Memo" name="Memo" rows="3" cols="50" runat="server" style="width: 95%"></textarea></td>
            </tr>
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">其它附件信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">家庭成员照片</td>
                <td class="TdContentSearch" colspan="7">
                    <img id="headImg" name="headImg" src="" runat="server" style="width: 100px; height: 100px" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle"></td>
                <td class="TdContentSearch" colspan="7">
                    <input id="PicName" style="width: 0px; height: 0px; display: none" maxlength="200"
                        name="PicName" runat="server">
                    <input id="btnPicFile" style="width: 20%; height: 22px" tabindex="1" type="file" size="1"
                        name="btnPicFile" onpropertychange="javascript:btnPicFile_Onclick();" onchange="btnPicFile_Onclick();" runat="server">&nbsp;
                    <input class="button" id="btnPicFileUp" onclick="javascript: if (btnPicFileUp_Onclick() == false) return false;"
                        tabindex="1" type="button" value="上传" name="btnPicFileUp" runat="server"></td>
            </tr>

            <tr>
                <td class="TdTitle">文件上传</td>
                <td class="TdContentSearch" colspan="7">文件说明：<input id="AdjunctName" style="width: 40%; height: 22px" maxlength="200"
                    name="AdjunctName" runat="server">
                    <input id="btnFile" style="width: 20%; height: 22px" tabindex="1" type="file" size="1"
                        name="btnFile" onpropertychange="javascript:btnFile_Onclick();" onchange="btnFile_Onclick();" runat="server">&nbsp;
                    <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        tabindex="1" type="button" value="上传" name="btnFileUp" runat="server"></td>
            </tr>
            <tr>
                <td colspan="8">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" AutoGenerateColumns="False" Width="95%"
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
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td colspan="8"></td>
            </tr>
            <tr>
                <td class="DialogTdSubmit" align="center" colspan="8">
                    <input class="button" id="btnSave" type="button" value="保存" name="btnSave" onclick="javascript: if (validate() == false) return false;" runat="server">
                    <input class="button" id="btnSaveAdd" type="button" value="保存并新增" name="btnSaveAdd" onclick="javascript: if (validate() == false) return false;" runat="server">
                    <input class="button" id="btnSaveClose" type="button" value="保存并关闭" name="btnSaveClose" onclick="javascript: if (validate() == false) return false;" runat="server">
                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server"></td>
            </tr>
        </table>

    </form>
</body>
</html>

<script type="text/javascript">
    $("#IsEntrust").change(function () {

        if ($("#IsEntrust").is(":checked")) {

        } else {
            $("#EntrustStartTime").val("");
            $("#EntrustEndTime").val("");
            $("#EntrustStartTime").val("");
            $("#EntrustEndTime").val("");
            $("#txtOption").combobox('setValues', "");
            $("#Option").val("");
        }
    });

    function validate() {
        var key = "", value = "", innerText = "", cellIndex = -1, result = false;
        $("input[type=text],textarea").each(function () {
            key = $(this).attr("id");
            value = $(this).val();
            if (isValueNull(key) && isValueNull(value)) {
                if (!$(this)[0].attributes["onclick"]) {
                    $(this).val(value.replace(/[\s'"\\]/g, ""));
                }
            }
        });
        if (!isValueNull($("#PaperCode").val())) {
            HDialog.Info("请输入证件号码,此项不能为空!");
            CustTempManage.PaperCode.focus();
            return false;
        } else {
            if ($("#PaperName").combobox("getValue") == "0001" && !idCardCheckfun($("#PaperCode").val())) {
                HDialog.Info("证件号码,不正确!");
                return false;
            } else if (!checkYskh($("#PaperCode").val())) {
                HDialog.Info("证件号码,只能包含数字、英文、半角(括号、反斜杠)!");
                return false;
            }
        }
        if ($("#CustID").val() == "") {
            HDialog.Info("客户名称必须选择!");
            return false;
        }

        if ($("input[name='PaperName']").val() == "") {
            HDialog.Info("证件名称必须填写!");
            return false;
        }
        if ($("#PaperCode").val() == "") {
            HDialog.Info("证件号码必须填写!");
            return false;
        }
        if ($("#MemberName").val() == "") {
            HDialog.Info("成员名称必须填写!");
            return false;
        }


        if ($("#RoomSign").val() == "") {
            alert("请输入房屋编号,此项不能为空!");
            HouseholdManage.RoomSign.focus();
            return false;
        }

        if ($("#IsEntrust").is(":checked")) {
            var EntrustStartTime = $("#EntrustStartTime").val();
            var EntrustEndTime = $("#EntrustEndTime").val();
            var Option = $("#Option").val();

            if (EntrustStartTime == "" || EntrustEndTime == "" || Option == "") {
                HDialog.Info("设置了委托人必须设置委托开始时间、结束时间、委托权限!");
                return false;
            } else {
                var dateEntrustStartTime = new Date(EntrustStartTime);
                var dateEntrustEndTime = new Date(EntrustEndTime);
                var curDate = new Date();
                if (curDate.getDate() < dateEntrustStartTime.getDate()) {
                    HDialog.Info("委托开始时间不能大于当前时间!");
                    return false;
                }
                if (curDate.getDate() > dateEntrustEndTime.getDate()) {
                    HDialog.Info("委托开始结束不能小于当前时间!");
                    return false;
                }
            }
        }
        $.messager.progress({ title: "温馨提示", msg: "正在保存...", interval: 3000 });
        return true;
    }
    $(function () {
        $("input", $("#MemberName").next("span")).blur(function () {
            $("#Linkman").val($("#MemberName").val());
        })



        if ($("#CustID").val() != "" && $("#hiOPType").val() == "SaveInsert") {
            $.tool.DataPost('Choose', 'CustRoomSigns', $('#HouseholdManage').serialize(),
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
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                        }
                        $('#SelectRoomID').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {


                                var data = $('#SelectRoomID').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                            $('#RoomID').val(data[i].RoomID);
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
        }


        //延迟1秒执行赋值
        setTimeout(function () {
            if ($("#Option").val() != "" && $("#Option").val() != null && $("#Option").val() != "undefined") {
                $("#txtOption").combobox("setValues", $("#Option").val());
            }
        }, 1000);


    })
    var w = $(window).width();
    var h = $(window).height();

    var SelCustEntity;

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            //记录选择的主业主资料,如果关系为本人，则直接赋值。
            SelCustEntity = data;

            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


            $.tool.DataPost('Choose', 'CustRoomSigns', $('#HouseholdManage').serialize(),
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
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

                        }
                        $('#SelectRoomID').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {


                                var data = $('#SelectRoomID').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                            $('#RoomID').val(data[i].RoomID);
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


    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/RoomDlg.aspx";

        HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomSign);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);

        });

    }


    function SelCustSuper() {

        $('#MemberName').searchbox("setValue", '');
        $('#MemberCode').val('');
        $('#Linkman').val('');

        var conent = "../DialogNew/CustSuperDlg.aspx";

        HDialog.Open(w, h, conent, '成员选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#MemberName').searchbox("setValue", data.CustName);
            $('#MemberCode').val(data.CustID);
            $('#Linkman').val(data.CustName);

            document.getElementById('btnSelCustt').click();
        });

    }

    $("#btnReturn").click(function () {
        close("false");
    });

    function close(callparm) {
        parent.HDialog.Close(callparm);
    }


    $("#Relationships").combobox({
        onChange: function (n, o) {
            var _Data = SelCustEntity;

            var myOptValue = $("#Relationships").combobox("getText");
            if (myOptValue == "本人") {

                $('#MemberName').searchbox("setValue", _Data.CustName);
                $("#PassSign").val(_Data.PassSign)
                $("#PaperName").combobox("setValue", _Data.PaperName);
                $("#PaperCode").val(_Data.PaperCode);
                $("#Sex").combobox("setValue", _Data.Sex);
                $("#Birthday").val(_Data.Birthday);
                $("#Nationality").combobox("setValue", _Data.Nationality);
                $("#WorkUnit").val(_Data.WorkUnit);
                $("#FixedTel").val(_Data.FixedTel);
                $("#MobilePhone").val(_Data.MobilePhone);
                $("#Linkman").val(_Data.Linkman);
                $("#LinkmanTel").val(_Data.LinkmanTel);
                $("#Memo").val(_Data.Memo);

                //查询兴趣及爱好
                $.tool.DataPost('Customer', 'GetCustomerInterests', 'CustID=' + $("#CustID").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            var Obj = JSON.parse(_Data);
                            for (var i = 0; i < Obj.length; i++) {
                                $("#ChkList label").each(function (i) {
                                    if ($(this).html() == Obj[i].custinterests) {
                                        var Id = $(this).attr("for");
                                        $('#' + Id).prop("checked", 'checked');
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
            /*else {
                $('#MemberName').searchbox("setValue", '');
                $("#PassSign").val('')
                $("#PaperName").combobox("setValue", '');
                $("#PaperCode").val('');
                $("#Sex").combobox("setValue", '');
                $("#Birthday").val('');
                $("#Nationality").combobox("setValue", '');
                $("#WorkUnit").val('');
                $("#FixedTel").val('');
                $("#MobilePhone").val('');
                $("#Linkman").val('');
                $("#LinkmanTel").val('');
                $("#Memo").val('');
            }*/
        }

    });


    $("#BtnSignTypeHistory").click(function () {
        var ContSort = $("#ContSort").val();
        var NewContTypeCode = $("#NewContTypeCode").val();
        if (ContSort != '' && NewContTypeCode != '') {
            //查看历史
            var conent = "../DialogNew/ContractRelationBrowse.aspx?ContSort=" + ContSort + "&NewContTypeCode=" + NewContTypeCode;
            var w = 1024;
            var h = 768;
            HDialog.Open(w, h, conent, '合同历史', false, function callback(_Data) {

                var Obj = JSON.parse(_Data);

                GetLastContract(Obj.ContSort, Obj.NewContTypeCode);
            });

        }
    });

    $("#InOutWork").click(function () {

        var w = $(window).width();
        var h = $(window).height();

        var HID = $("#HoldID").val();
        if (HID != "" && HID != "0") {
            HDialog.Open(w, h, '../HouseNew/AccessCardBrowse.aspx?CustID=' + $("#CustID").val() + "&HoldID=" + $("#HoldID").val(), "出入卡号办理", true, function callback(_Data) {
                $("#PassSign").val(_Data);
            });
        }
    });

</script>
