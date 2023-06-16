<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaleRoomCreBatchManage.aspx.cs" Inherits="M_Main.HouseNew.SaleRoomCreBatchManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>SaleRoomCreManage</title>
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
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">

        function CheckData() {
            if ($("#CustIDs").val() == "") {
                HDialog.Info("请选择业主,此项不能为空!");
                return false;
            }
            if ($("#RoomIDs").val() == "") {
                HDialog.Info("请选择房屋,此项不能为空!");
                return false;
            }
            if ($("#hiNewCustName").val() == "") {
                HDialog.Info("请输入新的业主,此项不能为空!");
                return false;
            }

            if ($("#PaperCode").val() == "") {
                HDialog.Info("请输入证件号码,此项不能为空!");
                return false;
            }
            if ($("#CustTypeID").val() == "") {
                HDialog.Info("请输入业主类别,此项不能为空!");
                return false;
            }
            ajaxLoading();
            return true;
        }

        function btnFileUp_Onclick() {
            if ($("#AdjunctName").val() == "") {
                HDialog.Info("请输入文件附件名称,此项不能为空!");
                return false;
            }

            if ($("#btnFile").val() == "") {
                HDialog.Info("请选择要上传的本地文件!");
                return false;
            }
            return true;
        }

        $(function () {
            $("#btnFile").change(function () {
                $("#AdjunctName").val(this.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi, "$1"));
            });
        });


        function showIsUnit(expid1, expid2) {
            if (getObject(expid1).style.display == "none") {
                getObject(expid1).style.display = "";
                getObject(expid2).style.display = "none";
            }
            else {
                getObject(expid1).style.display = "none";
                getObject(expid2).style.display = "";
            }
        }

        function OnFormload() {

            if (SaleRoomCreBatchManage.IsUnit1.checked) {
                getObject('Table2').style.display = "";
                getObject('Table3').style.display = "none";
            }
            else {
                getObject('Table2').style.display = "none";
                getObject('Table3').style.display = "";
            }
        }

        function ajaxLoading() {
            var id = "#SaleRoomCreBatchManage";
            var left = ($(window).outerWidth(true) - 190) / 2;
            var top = ($(window).height());
            var height = $(window).height() * 2;
            $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: height }).appendTo(id);
            $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理,请稍候...").appendTo(id).css({ display: "block", left: left, top: top });
        }
        function ajaxLoadEnd() {
            $(".datagrid-mask").remove();
            $(".datagrid-mask-msg").remove();
        }
		//-->
    </script>
</head>
<body onload="javascript:OnFormload();" style="overflow-y: auto">

    <form id="SaleRoomCreBatchManage" method="post" runat="server">
        <input id="LiveType" style="width: 32px; height: 22px" type="hidden" size="1" name="LiveType" runat="server">
        <table class="DialogTable" style="width: 100%" id="Table1">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">原业主信息
                    </span>
                </td>
            </tr>

            <tr>
                <td class="TdTitle" style="width: 15%">房屋编号</td>
                <td class="TdContentSearch" colspan="3">
                    <input id="RoomSigns" name="RoomSigns" style="width: 90%" searcher="SelRooms" class="easyui-searchbox" data-options="editable:false" runat="server" />
                    <input type="hidden" id="SelAll" name="SelAll" runat="server" />
                    <input type="hidden" id="RoomList" name="RoomList" value="" runat="server" />
                    <input type="hidden" id="CustIDs" name="CustIDs" value="" runat="server" />
                    <input type="hidden" id="CustNames" name="CustNames" value="" runat="server" />
                    <input type="hidden" id="RoomIDs" name="RoomIDs" value="" runat="server" />
                    <input type="hidden" id="hiRoomSigns" name="hiRoomSigns" value="" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContentSearch">除了车位标准外，下列收费标准将自动转给新业主</td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>

            <tr>
                <td colspan="4">
                    <div style="width: 100%; height: 200px" id="TableContainer"></div>
                </td>
            </tr>

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">新业主信息
                    </span>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">新业主名称</td>
                <td class="TdContentSearch">
                    <input id="NewCustName"
                        maxlength="50" name="NewCustName" class="easyui-searchbox" searcher="SelNewCust" data-options="editable:false" runat="server" />

                    <input id="hiNewCustName" size="1"
                        type="hidden" name="hiNewCustName" runat="server"><input style="width: 8px; height: 22px" id="NewCustID" size="1"
                            type="hidden" name="NewCustID" runat="server">
                    <input class="button_sel" id="btnSelNewCust"
                        type="button" value=" " name="btnSelNewCust" runat="server">
                </td>
                <td class="TdTitle">购房合同号</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="ContractSign" maxlength="50" name="ContractSign" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">产权证号</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="RightsSign" maxlength="50" name="RightsSign" runat="server"></td>
                <td class="TdTitle">交房时间</td>
                <td class="TdContentSearch">
                    <input onkeypress="CheckSmallDate();" id="SubmitTime" onclick="WdatePicker()" class="Wdate"
                        maxlength="50" name="SubmitTime" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">装修时间</td>
                <td class="TdContentSearch">
                    <input onkeypress="CheckSmallDate();" id="FittingTime" onclick="WdatePicker()" class="Wdate"
                        maxlength="50" name="FittingTime" runat="server"></td>
                <td class="TdTitle">入住时间</td>
                <td class="TdContentSearch">
                    <input onkeypress="CheckSmallDate();" id="StayTime" onclick="WdatePicker()" class="Wdate"
                        maxlength="50" name="StayTime" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">变更时间</td>
                <td class="TdContentSearch">
                    <asp:Label ID="ChargeTime" runat="server"></asp:Label></td>
                <td class="TdTitle">出入证号</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="PassSign" maxlength="50" name="PassSign" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">证件名称</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="PaperName" runat="server"></asp:DropDownList></td>
                <td class="TdTitle">证件号码</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="PaperCode" maxlength="50" name="PaperCode" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">业主类别</td>
                <td class="TdContentSearch">
                    <select id="CustTypeID" name="CustTypeID" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">固定电话</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="FixedTel" maxlength="50" name="FixedTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">移动电话</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="MobilePhone" maxlength="50" name="MobilePhone" runat="server"></td>
                <td class="TdTitle">传真电话</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="FaxTel" maxlength="50" name="FaxTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">联系地址</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="Address" maxlength="50" name="Address" runat="server"></td>
                <td class="TdTitle">邮政编码</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="PostCode" maxlength="50" name="PostCode" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">收 件 人</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="Recipient" maxlength="50" name="Recipient" runat="server"></td>
                <td class="TdTitle">电子邮件</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="EMail" maxlength="50" name="EMail" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">联系人</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="Linkman" maxlength="50" name="Linkman" runat="server"></td>
                <td class="TdTitle">联系人电话</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="LinkmanTel" maxlength="50" name="LinkmanTel" runat="server"></td>
            </tr>
            <tr>
               
                <td class="TdTitle"></td>
                <td class="TdContentSearch">
                    <input id="IsUnit1" onclick="javascript: showIsUnit('Table2', 'Table3');" type="radio" checked
                        value="0" name="IsUnit" runat="server">个人业主<input id="IsUnit2" onclick="javascript: showIsUnit('Table2', 'Table3');" type="radio" value="1"
                            name="IsUnit" runat="server">单位业主</td>
            </tr>
            <tr style="display:none;">
                 <td class="TdTitle">登录账号</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="InquireAccount" maxlength="50" name="InquireAccount"
                        runat="server"><div class="font_red" id="results"></div>
                </td>
            </tr>
        </table>
        <table class="DialogTable" style="width: 100%" id="Table2">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">个人业主信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">姓</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="Surname" maxlength="50" name="Surname" runat="server"
                        style="width: 45%">名<input class="Control_ItemInput" id="Name" style="width: 45%" maxlength="50" name="Name"
                            runat="server"></td>
                <td class="TdTitle">性别</td>
                <td class="TdContentSearch">
                    <select id="Sex" name="Sex" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">国籍</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="Nationality" runat="server"></asp:DropDownList></td>
                <td class="TdTitle">出生日期</td>
                <td class="TdContentSearch">
                    <select id="nYear" name="nYear" runat="server">
                        <option selected></option>
                    </select>年<select id="nMonth" name="nMonth" runat="server">
                        <option selected></option>
                    </select>月<select id="nDay" name="nDay" runat="server">
                        <option selected></option>
                    </select>日<input class="Control_ItemInput" id="Birthday" style="width: 20px; height: 19px" type="hidden"
                        maxlength="10" size="10" name="Birthday" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">工作单位</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="WorkUnit" maxlength="50" name="WorkUnit" runat="server"></td>
                <td class="TdTitle">职业</td>
                <td class="TdContentSearch">
                    <asp:DropDownList ID="DrJob" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="TdTitle">兴趣爱好</td>
                <td class="TdContentSearch" colspan="1">
                    <asp:CheckBoxList ID="ChkList" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
                     <td class="TdTitle">房产证出证日期</td>
                <td class="TdContentSearch">
                    <input onkeypress="CheckSmallDate();" id="HousePropertyDate" onclick="WdatePicker()" class="Wdate"
                        maxlength="50" name="HousePropertyDate" runat="server"></td>
            </tr>
        </table>
        <table class="DialogTable" style="width: 100%" id="Table3">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">单位业主信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">法定代表人</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="LegalRepr" maxlength="50" name="LegalRepr" runat="server"></td>
                <td class="TdTitle">法定代表人电话</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="LegalReprTel" maxlength="50" name="LegalReprTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">负责人</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="Charge" maxlength="50" name="Charge" runat="server"></td>
                <td class="TdTitle">负责人电话</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="ChargeTel" maxlength="50" name="ChargeTel" runat="server"></td>
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
            </tr>
            <tr>
                <td class="TdTitle">地址、电话</td>
                <td class="TdContent">
                    <input id="VATAddLinkTel" name="VATAddLinkTel" runat="server" class="easyui-validatebox"></td>
                <td class="TdTitle">开户行及帐号</td>
                <td class="TdContent">
                    <input id="VATBankAccoutNumber" name="VATBankAccoutNumber" runat="server" class="easyui-validatebox"></td>
            </tr>
        </table>
        <table class="DialogTable" style="width: 100%" id="Table4">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">银行代收信息</span> </td>
            </tr>
            <tr>
                <td class="TdTitle">银行名称</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="BankName" maxlength="50" name="BankName" runat="server"></td>
                <td class="TdTitle">银行户名</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="BankIDs" maxlength="50" name="BankIDs" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">银行账号</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="BankAccount" maxlength="50" name="BankAccount" runat="server"></td>
                <td class="TdTitle">确认银行账号</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="BankAccountTwo" maxlength="50" name="BankAccountTwo" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">代收协议编号</td>
                <td class="TdContentSearch">
                    <input class="Control_ItemInput" id="BankAgreement" maxlength="50" name="BankAgreement" runat="server"></td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContentSearch" colspan="3">
                    <textarea id="Memo" name="Memo" rows="3" cols="50" runat="server"></textarea></td>
            </tr>
            <tr>
                <td class="TdTitle" style="text-align: right">文件上传</td>
                <td class="TdContentSearch" colspan="3">文件说明：
                    <input style="width: 300px" id="AdjunctName" maxlength="200" name="AdjunctName" runat="server">
                    <input style="width: 170px" id="btnFile" tabindex="1" type="file" name="btnFile" runat="server" />
                    <input id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        value="上传" style="height: 26px; width: 45px; margin-left: 2px" type="button" name="btnFileUp" runat="server">
                </td>
            </tr>
            <tr>
                <td colspan="4">
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
                    </asp:DataGrid>

                </td>
            </tr>
            <tr>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input class="button" id="btnOK" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnOK" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server"></td>
            </tr>
        </table>
        <script type="text/javascript">

            function Init() {
                $('#TableContainer').css("height", '200px');
                $('#btnSelCust').hide();
                $('#btnSelRoom').hide();
                $('#btnSelNewCust').hide();
            }
            Init();

            function SelRooms() {
                var varReturn;
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, "../dialogNew/RoomMultiDlg.aspx", '房屋选择', false, function callback(_Data) {
                    if (_Data.length > 0) {//**获得返回 刷新
                        var data = JSON.parse(_Data);
                        if (data.length > 0) {
                            var RoomSigns = '';
                            var RoomIDs = '';
                            var CustIDs = '';
                            for (var k = 0; k < data.length; k++) {
                                RoomSigns = RoomSigns + ',' + data[k].RoomSign;
                                RoomIDs = RoomIDs + ',' + data[k].RoomID;
                                CustIDs = CustIDs + ',' + data[k].CustID;
                            }
                            if (RoomSigns.length > 0) {
                                $('#RoomSigns').searchbox('setValue', RoomSigns.substr(1, RoomSigns.length - 1));
                                $('#hiRoomSigns').val(RoomSigns.substr(1, RoomSigns.length - 1));
                                $('#RoomIDs').val(RoomIDs.substr(1, RoomIDs.length - 1));
                                $('#CustIDs').val(CustIDs.substr(1, CustIDs.length - 1));
                                LoadSaleRoomCostStanList();
                            }
                        }
                        return true;
                    }
                });

                return false;
            }

            function SelNewCust() {
                if ($("#RoomIDs").val() == "") {
                    HDialog.Info("请选择房屋,此项不能为空!");
                    return false;
                }
                var strLiveType = 0;
                var w = $(window).width();
                var h = $(window).height();
                var conent = "../DialogNew/CustSingleDlg.aspx?LiveType=" + strLiveType + "&CustID=";
                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    $('#NewCustName').searchbox("setValue", '');
                    $('#NewCustID').val('');
                    $('#hiNewCustName').val('');
                    var data = JSON.parse(_Data);
                    $('#NewCustName').searchbox("setValue", data.CustName);
                    $('#NewCustID').val(data.CustID);
                    $('#hiNewCustName').val(data.CustName);
                    $('#PaperName').val(data.PaperName);
                    $('#btnSelNewCust').click();
                });
            }

            var column = [[
                { field: 'ParkName', title: '车位编号', width: 180, align: 'left', sortable: true },
                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'StanName', title: '标准名称', width: 180, align: 'left', sortable: true },
                { field: 'StanAmount', title: '通用收费标准', width: 100, align: 'left', sortable: true },
                { field: 'ChargeCycleName', title: '计费周期', width: 100, align: 'left', sortable: true },
                { field: 'StanEndHit', title: '标准状态', width: 100, align: 'left', sortable: true },
                { field: 'IsInheritName', title: '出租时自动转移给租户', width: 100, align: 'left', sortable: true },
                {
                    field: 'CalcBeginDate', title: '计费开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.CalcBeginDate.ToCustomizeDate();
                        return str;
                    }
                }

            ]];

            var frozenColumns = [[
                { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 250, align: 'left', sortable: true },
                { field: 'StateName', title: '交房状态', width: 100, align: 'left', sortable: true },
            ]];

            $('#btnReturn').click(function () {
                HDialog.Close();
            });

            function LoadSaleRoomCostStanList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    title: '房屋收费标准',
                    columns: column,
                    frozenColumns: frozenColumns,
                    fitColumns: false,
                    singleSelect: true,
                    remoteSort: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("RoomRental", "SaleRoomCostStanLists", "TableContainer", param);
                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadSaleRoomCostStanList();
        </script>
    </form>
</body>
</html>

