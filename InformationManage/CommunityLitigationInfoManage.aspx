<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommunityLitigationInfoManage.aspx.cs" Inherits="M_Main.InformationManage.CommunityLitigationInfoManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body>
    <form id="LitigationForm" runat="server">
        <input type="hidden" id="LitigationID" name="LitigationID" runat="server" />
        <input type="hidden" id="RoomIds" name="RoomIds" runat="server" />
        <input type="hidden" id="CommIds" name="CommIds" runat="server" />
        <table class="DialogTable" id="Table1">
            <tr>
                <td class="TdTitle">客户名称：</td>
                <td class="TdContentSearch">
                    <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" data-options="editable:false,required:true" runat="server" />
                    <input id="CustID" type="hidden" name="CustID" runat="server" />
                    <input id="hiCustName" type="hidden" name="hiCustName" runat="server" />
                </td>
                <td class="TdTitle">可选房号：</td>
                <td class="TdContentSearch">
                    <select id="SelRoomID" onchange="javascript:SelRoomID_OnChange();" class="easyui-combobox" style="width: 150px" name="SelRoomID" runat="server">
                        <option selected="selected"></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">房屋名称：</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" class="easyui-searchbox" data-options="editable:false,required:true" searcher="SelRoom" name="RoomSign" runat="server" />
                    <input id="RoomID" style="width: 8px; height: 22px" type="hidden" name="RoomID" runat="server" />
                    <input id="hiRoomSign" style="width: 8px; height: 22px" type="hidden" name="hiRoomSign" runat="server" />
                </td>
                <td class="TdTitle" style="text-align: center;">结案时间：</td>
                <td class="TdContentSearch">
                    <input type="text" id="ClosingTime" name="ClosingTime" class="Wdate" runat="server" onclick="WdatePicker()" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">受理机构：</td>
                <td class="TdContentSearch">
                    <input type="text" id="AcceptingAgency" class="easyui-textbox" data-options="required:true" name="AcceptingAgency" runat="server" />
                </td>
                <td class="TdTitle">原告：</td>
                <td class="TdContentSearch">
                    <input type="text" id="Plaintiff"  class="easyui-textbox" data-options="required:true" name="Plaintiff" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">被告：</td>
                <td class="TdContentSearch">
                    <input type="text" id="Defendant" name="Defendant" class="easyui-textbox" runat="server" />
                </td>
                <td class="TdTitle">立案时间：</td>
                <td class="TdContentSearch">
                    <input type="text" id="FilingTime" name="FilingTime" class="Wdate" onclick="WdatePicker()" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">案号：</td>
                <td class="TdContentSearch">
                    <input type="text" id="CaseNo" name="CaseNo" class="easyui-textbox" runat="server" />
                </td>
                <td class="TdTitle">承办人：</td>
                <td class="TdContentSearch">
                    <input type="text" id="Undertaker" name="Undertaker" class="easyui-textbox" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle" style="text-align: center;">案由：</td>
                <td class="TdContentSearch">
                    <select name="ActionCause" id="ActionCause" paneimaxheight="100px" class="easyui-combobox" 
                            data-options="editable:false,panelHeight:'auto'"  style="width: 145px" runat="server">
                        <option value="物业服务合同纠纷欠费">物业服务合同纠纷欠费</option>
                        <option value="物业服务合同纠纷其他">物业服务合同纠纷其他</option>
                        <option value="劳动合同纠纷">劳动合同纠纷</option>
                        <option value="租赁合同纠纷">租赁合同纠纷</option>
                        <option value="人身财产">人身财产</option>
                        <option value="其他">其他</option>
                    </select>
                </td>
                <td class="TdTitle" style="text-align: center;">诉讼结果：</td>
                <td class="TdContentSearch">
                    <select name="LawsuitResult" id="LawsuitResult" paneimaxheight="100px" class="easyui-combobox" 
                            data-options="editable:false,panelHeight:'auto'"  style="width: 145px" runat="server">
<%--                        <option value="物业公司胜诉">物业公司胜诉</option>
                        <option value="物业公司败诉">物业公司败诉</option>
                        <option value="调解">调解</option>
                        <option value="自行撤诉">自行撤诉</option>
                        <option value="法院要求撤诉">法院要求撤诉</option>
                        <option value="驳回诉讼">驳回诉讼</option>
                        <option value="其他">其他</option>--%>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">案件进度：</td>
                <td class="TdContentSearch">
                    <select name="CaseProgress" id="CaseProgress" paneimaxheight="100px" class="easyui-combobox" 
                            data-options="editable:false,panelHeight:'170px'"  style="width: 145px" runat="server">
<%--                        <option value="已立案待开庭">已立案待开庭</option>
                        <option value="已开庭待判决">已开庭待判决</option>
                        <option value="诉讼公告送达中">诉讼公告送达中</option>
                        <option value="一审已判决业主未缴费">一审已判决业主未缴费</option>
                        <option value="一审已判决业主已交费">一审已判决业主已交费</option>
                        <option value="判决结果公告中">判决结果公告中</option>
                        <option value="一审已判决申请强制执行中">一审已判决申请强制执行中</option>
                        <option value="财产分配完成">财产分配完成</option>
                        <option value="一审已判决">一审已判决</option>
                        <option value="上诉中">上诉中</option>
                        <option value="二审待开庭">二审待开庭</option>
                        <option value="二审待判决">二审待判决</option>
                        <option value="二审已判决业主未缴费">二审已判决业主未缴费</option>
                        <option value="二审已判决业主已交费">二审已判决业主已交费</option>
                        <option value="二审判已判决">二审判已判决</option>
                        <option value="申请强制执行中">申请强制执行中</option>
                        <option value="其他">其他</option>--%>
                    </select>
                </td>
                <td class="TdTitle">标的：</td>
                <td class="TdContentSearch">
                    <input type="text" name="TheSubject" id="TheSubject" class="easyui-numberbox" precision="2" runat="server" /> 元
                </td>
            </tr>

            <tr>
                <td class="TdTitle">诉讼请求：</td>
                <td class="TdContentSearch" colspan="3">
                    <input name="LitigationRequest" id="LitigationRequest" class="easyui-textbox" data-options="multiline:true"  style="height:50px;width:80%" runat="server"/>
                </td>
            </tr>

            <tr>
                <td class="TdTitle">诉讼备注：</td>
                <td class="TdContentSearch" colspan="3">
                    <input name="Remarks" id="Remarks" class="easyui-textbox" data-options="multiline:true"  style="height:50px;width:77%"  runat="server"/>
                </td>
            </tr>

            <tr>
                <td class="TdTitle" style="height: 26px;">文件上传</td>
                <td colspan="3">
                    <span style="float: left">文件说明：
                            <input id="FileRemark" name="FileRemark" runat="server" type="text" class="textbox_two" />
                    </span>
                    <input style="float: left; width: 300px" id="btnFile" tabindex="1" type="file" name="btnFile" runat="server" />
                    <input style="float: left; height: 24px; width: 45px;" id="btnFileUp" class="button" tabindex="1" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        value="上传" type="button" name="btnFileUp" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%"
                        AutoGenerateColumns="False" OnItemCommand="DGrid_ItemCommand">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                        <Columns>
                            <asp:BoundColumn DataField="FileRemark" HeaderText="文件说明">
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
                                    <asp:LinkButton ID="btnDelete" TabIndex="1" runat="server" CausesValidation="false" CommandName="Delete"
                                        Text="<img src=../images/icons/Delete.gif border=0 align=absmiddle onclick=&quot;javascript:if(confirm('请确认是否删除该记录')==false) return false;&quot; alt='删除' >"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </td>
            </tr>

            <tr>
                <td style="height: 60px;"></td>
            </tr>
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnSave" type="button" value="保存" name="btnSave" onclick="javascript: if (CheckAllData() == false) return false;" runat="server" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script>
    $(function () {

        $("#btnReturn").click(function () {
            close("1");
        })

        //保存
        //$("#btnSave").click(function () {
        //    $.tool.DataPostChk('LitigationForm', 'LitigationInfo', 'Insert', $('#LitigationForm').serialize(),
        //        function Init() {
        //        },
        //        function callback(_Data) {
        //            var data = _Data.split("|");
        //            if (data[0] == "true") {
        //                HDialog.Info(data[1]);
        //                close("1");
        //            }
        //            else {
        //                HDialog.Info(data[1]);
        //            }
        //        },
        //        function completeCallback() {
        //        },
        //        function errorCallback() {

        //        })
        //});
    })

    $('#RoomSign').dblclick(function (e) {
        var conent = "../DialogNew/RoomDlg.aspx";
        HDialog.Open('1000', '600', conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').val(data.RoomSign);
            $('#RoomIds').val(data.RoomID);
            $('#CustName').val("");
            $("#BtnSearch").click();
        });
    })

    function close(callparm) {
        HDialog.Close(callparm);
    }

    function SelRoomID_OnChange() {
        LettersInfoManage.RoomID.value = LettersInfoManage.SelRoomID.options[LettersInfoManage.SelRoomID.selectedIndex].value;
        LettersInfoManage.RoomSign.value = LettersInfoManage.SelRoomID.options[LettersInfoManage.SelRoomID.selectedIndex].text;
    }

    function SelCust() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var w = 800;
        var h = 400;
        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#EntrustMobile').val(data.MobilePhone);
            $('#EntrustCustID').val(data.CustName);

            $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
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
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });
                        }

                        $('#SelRoomID').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {
                                var data = $('#SelRoomID').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                            var buildArea = data[i].RoomID.split("|")[1];
                                            $('#BuildArea').val(buildArea);
                                            $('#RoomID').val(data[i].RoomID.split("|")[0]);
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

    function SelSigong() {
        $('#ConsUnit').searchbox("setValue", '');
        $('#UnitID').val('');
        var w = 700;
        var h = 400;
        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#ConsUnit').searchbox("setValue", data.CustName);
            $('#UnitID').val(data.CustID);
        });
    }

    function SelRoom() {
        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });
        var conent = "../DialogNew/RoomDlg.aspx";
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w , h , conent, '房屋选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#RoomSign').searchbox("setValue", data.RoomName);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);
            $('#RoomID').val(data.RoomID);
            $('#BuildArea').val(data.BuildArea);
            $('#CalcArea').val(data.BuildArea);
        });

    }

    function btnFileUp_Onclick() {

        if ($('#FileRemark').val() == "" || $('#FileRemark').val() == null) {
            HDialog.Info("请输入文件附件名称,此项不能为空!");
            return false;
        }

        if ($('#btnFile').val() == "" || $('#btnFile').val() == null) {
            HDialog.Info("请选择要上传的本地文件!");
            return false;
        }

        return true;
    }

    $("#btnFile").change(function () {
        $("#FileRemark").val(this.value.replace(/^.+?\\([^\\]+?)(\.[^\.\\]*?)?$/gi, "$1"));
    });

    function CheckAllData() {
        return $("#LitigationForm").form('validate');
    }
</script>
