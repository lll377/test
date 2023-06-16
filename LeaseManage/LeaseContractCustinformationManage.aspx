<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseContractCustinformationManage.aspx.cs" Inherits="M_Main.LeaseManage.LeaseContractCustinformationManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同-租户信息详细页面</title>
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
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script language="javascript">

        function CheckData() {
            if (CustTempManage.CustName.value == "") {
                HDialog.Info("请输入临时客户名称,此项不能为空!");
                CustTempManage.CustName.focus();
                return false;
            }

            if (CustTempManage.PaperCode.value == "") {
                HDialog.Info("请输入证件号码,此项不能为空!");
                CustTempManage.PaperCode.focus();
                return false;
            }

            if (CustTempManage.Linkman.value == "") {
                HDialog.Info("请输入绑定手机户名,此项不能为空!");
                CustTempManage.Linkman.focus();
                return false;
            }
            if (CustTempManage.LinkmanTel.value == "") {
                HDialog.Info("请输入绑定手机号码,此项不能为空!");
                CustTempManage.LinkmanTel.focus();
                return false;
            }


            if (CustTempManage.BankAccount.value != "") {
                if (CustTempManage.BankAccount.value != CustTempManage.BankAccountTwo.value) {
                    HDialog.Info("两次输入的银行账号不同,请重新输入!");
                    CustTempManage.BankAccount.focus();
                    return false;
                }
            }

            var strPaperCodeResults = getObject("PaperCodeResults").innerHTML;

            if ((strPaperCodeResults != "") && (strPaperCodeResults != "新的号码！")) {
                HDialog.Info(strPaperCodeResults);
                CustTempManage.PaperCode.focus();
                return false;
            }

            var strLinkmanTel = CustTempManage.LinkmanTel.value;

            if (strLinkmanTel.length != 11) {
                HDialog.Info("绑定手机号码位数错误!");
                CustTempManage.LinkmanTel.focus();
                return false;
            }


            return true;
        }

        function CheckPaperCode() {
            var strCustID = CustTempManage.CustID.value;
            var strPaperCode = CustTempManage.PaperCode.value;

            getObject("results").innerHTML = "";
            //alert(strLoginCode);

            Request.sendPOST("../House/CheckPaperCode.aspx", "CustID=" + strCustID + "&PaperCode=" + strPaperCode + "&Ram=" + Math.random(), callbackPaperCode);

        }
        function callbackPaperCode(xmlHttp) {
            //alert(xmlHttp.responseText);
            //var varReturn = xmlHttp.responseText;
            //getObject("PaperCodeResults").innerHTML = varReturn;
            var varReturn = xmlHttp.responseText;
            var res = varReturn.split('|');

            getObject("PaperCodeResults").innerHTML = res[1];
            if (res[0] == "false") {
                HDialog.Info(res[1]);
            }
        }

        function btnFileUp_Onclick() {
            if (CustTempManage.AdjunctName.value == "") {
                alert("请输入文件附件名称,此项不能为空!");
                CustTempManage.AdjunctName.focus();
                return false;
            }

            if (CustTempManage.btnFile.value == "") {
                alert("请选择要上传的本地文件!");
                CustTempManage.btnFile.focus();
                return false;
            }

            return true;
        }

        function btnChangeName_Onclick() {
            var strCustID = CustTempManage.CustID.value;

            var varReturn = showModalDlg("../dialog/CustChangeNameDlg.aspx?CustID=" + strCustID + "&Ram=" + Math.random(), "", 500, 300);

            //alert(varReturn);
            if (varReturn != "") {//**获得返回的参数信息

                var varObjects = varReturn.split("\t");

                CustTempManage.CustName.value = varObjects[0];
            }
        }

        function showIsUnit(expid1, expid2) {
            if (getObject(expid1).style.display == "none") {
                $("#" + expid1 + "").show();
                $("#" + expid2 + "").hide();
                //getObject(expid1).style.display = "inline";
                //getObject(expid2).style.display = "none";
            }
            else {
                $("#" + expid1 + "").hide();
                $("#" + expid2 + "").show();
                //getObject(expid1).style.display = "none";
                //getObject(expid2).style.display = "inline";
            }
        }

        function OnFormload() {

            if (CustTempManage.IsUnit1.checked) {
                $("#Table2").show();
                $("#Table3").hide();
            }
            else {
                $("#Table2").hide();
                $("#Table3").show();
            }
        }
        function onLinkmanTel() {

            var strMobilePhone = CustTempManage.MobilePhone.value;
            if (strMobilePhone.length > 11) {
                CustTempManage.LinkmanTel.value = strMobilePhone.substr(0, 11);
            }
            else {
                CustTempManage.LinkmanTel.value = strMobilePhone;
            }
        }
        function onLinkman() {


            CustTempManage.Linkman.value = CustTempManage.CustName.value;

        }

        function WriteLinkman() {
            $("#Linkman").val($("#CustName").val());
            $("#Recipient").val($("#CustName").val());
        }

        function WriteLinkmanTel() {
            var tempTel = $("#MobilePhone").val();
            if (tempTel.length > 11) {
                tempTel = tempTel.substr(0, 11);
            }
            $("#LinkmanTel").val(tempTel);
        }


    </script>
</head>
<body style="overflow-y: auto;">
    <form id="CustTempManage" method="post" runat="server">
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="CustID" type="hidden" size="1" name="CustID" runat="server">
        <table class="DialogTable" id="Table1">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">租户基本信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">租户名称</td>
                <td class="TdContent">
                    <input id="CustName" onblur="javascript:WriteLinkman();" class="easyui-validatebox" data-options="required:true" style="width: 58%;" maxlength="50" name="CustName" runat="server">
                    <input class="button" style="width: 45px;" id="btnChangeName" onclick="SelbtnChangeName()" type="button" value="更名" name="btnChangeName" runat="server">
                </td>
                <td class="TdTitle">出入证号</td>
                <td class="TdContent">
                    <input id="PassSign" maxlength="50" name="PassSign" runat="server">
                </td>
                <td class="TdTitle">证件名称</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="PaperName" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList></td>
                <td class="TdTitle">证件号码</td>
                <td class="TdContent">
                    <input id="PaperCode" class="easyui-validatebox" data-options="required:true" onblur="javascript:CheckPaperCode();" maxlength="50" name="PaperCode" runat="server">
                    <div class="font_red" id="PaperCodeResults"></div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户类别</td>
                <td class="TdContentSearch">
                    <select id="CustTypeID" style="width: 82%;" name="CustTypeID" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">固定电话</td>
                <td class="TdContent">
                    <input id="FixedTel" maxlength="50" name="FixedTel" runat="server"></td>
                <td class="TdTitle">移动电话</td>
                <td class="TdContent">
                    <input id="MobilePhone" onblur="javascript:WriteLinkmanTel();" name="MobilePhone" runat="server"></td>
                <td class="TdTitle">传真电话</td>
                <td class="TdContent">
                    <input id="FaxTel" maxlength="50" name="FaxTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">联系地址</td>
                <td class="TdContent">
                    <input id="Address" maxlength="50" name="Address" runat="server"></td>
                <td class="TdTitle">邮政编码</td>
                <td class="TdContent">
                    <input id="PostCode" maxlength="50" name="PostCode" runat="server"></td>
                <td class="TdTitle">收 件 人</td>
                <td class="TdContent">
                    <input id="Recipient" maxlength="50" name="Recipient" runat="server"></td>
                <td class="TdTitle">电子邮件</td>
                <td class="TdContent">
                    <input id="EMail" maxlength="50" name="EMail" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">绑定手机户名</td>
                <td class="TdContent">
                    <input id="Linkman" name="Linkman" runat="server"></td>
                <td class="TdTitle">绑定手机号码</td>
                <td class="TdContent">
                    <input id="LinkmanTel" maxlength="11" name="LinkmanTel" runat="server">
                </td>
                <td class="TdTitle">个人/单位</td>
                <td class="TdContent">
                    <input id="IsUnit1" onclick="javascript: showIsUnit('Table2', 'Table3');" type="radio" checked
                        value="0" name="IsUnit" runat="server">个人业主<input id="IsUnit2" onclick="javascript: showIsUnit('Table2', 'Table3');" type="radio" value="1"
                            name="IsUnit" runat="server">单位业主</td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
        </table>
        <table class="DialogTable" id="Table2">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">个人客户信息</span>
                </td>
            </tr>
            <asp:Panel ID="PanelName" runat="server" Visible="False">
                <tr>
                    <td class="TdTitle">姓</td>
                    <td class="TdContent">
                        <input style="width: 45%" id="Surname" maxlength="50" name="Surname"
                            runat="server">名
                        <input style="width: 45%" id="Name" maxlength="50" name="Name"
                            runat="server">
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
            </asp:Panel>
            <tr>
                <td class="TdTitle">性别</td>
                <td class="TdContentSearch">
                    <select id="Sex" style="width: 82%;" name="Sex" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">出生日期</td>
                <td class="TdContentSearch">
                    <select id="nYear" style="width: 80px" name="nYear" runat="server" class="easyui-combobox">
                        <option selected></option>
                    </select>年<select id="nMonth" style="width: 40px" name="nMonth" runat="server" class="easyui-combobox">
                        <option selected></option>
                    </select>月<select id="nDay" style="width: 40px" name="nDay" runat="server" class="easyui-combobox">
                        <option selected></option>
                    </select>日<input id="Birthday" style="width: 20px; height: 19px" type="hidden"
                        maxlength="10" size="10" name="Birthday" runat="server">
                </td>
                <td class="TdTitle">国籍</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="Nationality" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                </td>
                <td class="TdTitle">职业</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="DrJob" Width="82%" runat="server" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">工作单位</td>
                <td class="TdContent">
                    <input id="WorkUnit" maxlength="50" name="WorkUnit" runat="server"></td>
                <td class="TdTitle">兴趣爱好</td>
                <td class="TdContentSearch" colspan="5">
                    <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
            </tr>
        </table>
        <table class="DialogTable" id="Table3">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">单位客户信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">法定代表人</td>
                <td class="TdContent">
                    <input id="LegalRepr" maxlength="50" name="LegalRepr" runat="server"></td>
                <td class="TdTitle">法定代表人电话</td>
                <td class="TdContent">
                    <input id="LegalReprTel" maxlength="50" name="LegalReprTel" runat="server"></td>
                <td class="TdTitle">负责人</td>
                <td class="TdContent">
                    <input id="Charge" maxlength="50" name="Charge" runat="server"></td>
                <td class="TdTitle">负责人电话</td>
                <td class="TdContent">
                    <input id="ChargeTel" maxlength="50" name="ChargeTel" runat="server"></td>
            </tr>
        </table>
        <table class="DialogTable" id="Table7">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">纳税主体信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">名称</td>
                <td class="TdContent">
                    <input id="VATCode" name="VATCode" runat="server" type="hidden" class="easyui-validatebox">
                    <input id="VATName" name="VATName" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle">纳税人识别号</td>
                <td class="TdContent">
                    <input id="VATNumber" name="VATNumber" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle">地址、电话</td>
                <td class="TdContent">
                    <input id="VATAddLinkTel" name="VATAddLinkTel" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle">开户行及帐号</td>
                <td class="TdContent">
                    <input id="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server" class="easyui-validatebox"></td>
            </tr>
        </table>
        <table class="DialogTable" id="Table4">
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">银行代收信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">银行名称</td>
                <td class="TdContent">
                    <input id="BankName" maxlength="50" name="BankName" runat="server"></td>
                <td class="TdTitle">银行户名</td>
                <td class="TdContent">
                    <input id="BankIDs" maxlength="50" name="BankIDs" runat="server"></td>
                <td class="TdTitle">银行账号</td>
                <td class="TdContent">
                    <input id="BankAccount" maxlength="50" name="BankAccount" runat="server"></td>
                <td class="TdTitle">确认银行账号</td>
                <td class="TdContent">
                    <input id="BankAccountTwo" maxlength="50" name="BankAccountTwo" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">代收协议编号</td>
                <td class="TdContent">
                    <input id="BankAgreement" maxlength="50" name="BankAgreement"
                        runat="server"></td>
                <td class="TdTitle">备注</td>
                <td class="TdContent">
                    <input id="Memo" maxlength="50" name="Linkman" runat="server">
                </td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td colspan="8" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">其它附件信息</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">文件上传</td>
                <td class="TdContentSearch" colspan="7">
                    <input id="AdjunctName" style="width: 40%; height: 22px" maxlength="200"
                        name="AdjunctName" runat="server">
                    <input id="btnFile" style="width: 20%; height: 22px" tabindex="1" type="file" size="1"
                        name="btnFile" runat="server">&nbsp;
                    <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        tabindex="1" type="button" value="上传" name="btnFileUp" runat="server"></td>
            </tr>
            <tr>
                <td class="TdContent" colspan="8">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                        AutoGenerateColumns="False">
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
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Download.gif border=0 align=absmiddle alt='下载'  >"
                                        CommandName="DownLoad" CausesValidation="false" TabIndex="1" ID="btnDownLoad"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="[删除]">
                                <HeaderStyle HorizontalAlign="Center" Width="40px"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"
                                        CommandName="Delete" CausesValidation="false" TabIndex="1" ID="btnDelete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid></td>
            </tr>
            <tr>
                <td colspan="8"></td>
            </tr>
            <tr>
                <td class="DialogTdSubmit" align="center" colspan="8">
                    <input class="button" id="save" onclick="BtnSave()"
                        type="button" value="保存" name="btnFilter" runat="server">
                    <input class="button" style="display: none;" id="btnSave"
                        type="button" value="保存" name="btnFilter" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="放弃返回" name="btnFilter" runat="server"></td>
            </tr>
        </table>

    </form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        OnFormload();
    });
    function SelbtnChangeName() {
        var strCustID = $('#CustID').val();
        var conent = "../DialogNew/CustChangeNameDlg.aspx?CustID=" + strCustID + "&Rnd=" + Math.random();
        HDialog.Open('450', '300', conent, '客户更名', false, function callback(_Data) {
            if (_Data != "") {
                $('#CustName').val(_Data);
            }
        });
    }

    function BtnSave() {
        if (CheckData() == false)
            return false;
        document.getElementById('btnSave').click();
    }

    $("#btnReturn").click(function () {
        pageClose("false");
    });

    function pageClose(callparm) {
        HDialog.Close(callparm);
    }
</script>
