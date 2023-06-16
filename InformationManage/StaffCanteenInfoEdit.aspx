<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffCanteenInfoEdit.aspx.cs" Inherits="M_Main.InformationManage.StaffCanteenInfoEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工食堂信息_编辑页面</title>
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
    <style type="text/css">
        .DialogTable .TdTitle {
            width: 15%;
        }

        .TdContentSearch input {
            width: 80%;
            border: 1px solid #CCC;
        }
    </style>
</head>
<body style="margin: 0px; padding: 5px; overflow-x: hidden;">
    <form id="StaffCanteenInfoEditForm" method="post" runat="server">
        <table class="DialogTable" id="Table1" style="table-layout: fixed;">
            <tr>
                <td class="TdTitle">是否开设员工食堂</td>
                <td class="TdContentSearch">
                    <select id="IsOpen" name="IsOpen" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',onSelect:IsOpenChange" style="width: 40px" runat="server">
                        <option value="0" selected>是</option>
                        <option value="1">否</option>
                    </select>
                    <input type="hidden" id="hidIsOpen" name="hidIsOpen" runat="server" />
                </td>
                <td class="TdTitle">食材采购费用支付方名称</td>
                <td class="TdContentSearch">
                    <input type="text" id="PayName" name="PayName" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">是否办理食堂经营资质</td>
                <td class="TdContentSearch">
                    <select id="IsBusiness" name="IsBusiness" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" style="width: 40px" runat="server">
                        <option value="" selected> </option>
                        <option value="2">是</option>
                        <option value="3">否</option>
                    </select>
                </td>
                <td class="TdTitle">资质证书名称</td>
                <td class="TdContentSearch">
                    <input type="text" id="BusinessName" name="BusinessName" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">许可证编号</td>
                <td class="TdContentSearch">
                    <input type="text" id="LicenseNumber" name="LicenseNumber" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
                <td class="TdTitle">经营者名称</td>
                <td class="TdContentSearch">
                    <input type="text" id="OperatorName" name="OperatorName" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">社会信用代码（身份证号码）</td>
                <td class="TdContentSearch">
                    <input type="text" id="PaperCode" name="PaperCode" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
                <td class="TdTitle">法定代表人（负责人）</td>
                <td class="TdContentSearch">
                    <input type="text" id="ChargeName" name="ChargeName" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">住所</td>
                <td class="TdContentSearch" colspan="3">
                    <input type="text" id="Address" name="Address" maxlength="200" style="width: 93%" class="easyui-validatebox" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">经营场所</td>
                <td class="TdContentSearch" colspan="3">
                    <input type="text" id="BusinessPlace" name="BusinessPlace" maxlength="200" style="width: 93%" class="easyui-validatebox" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">主体业态</td>
                <td class="TdContentSearch">
                    <input type="text" id="SubjectForm" name="SubjectForm" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
                <td class="TdTitle">经营项目</td>
                <td class="TdContentSearch">
                    <input type="text" id="BusinessProject" name="BusinessProject" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">日常监督管理机构</td>
                <td class="TdContentSearch">
                    <input type="text" id="DailyManagement" name="DailyManagement" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
                <td class="TdTitle">日常监督管理人员</td>
                <td class="TdContentSearch">
                    <input type="text" id="DailySupervisor" name="DailySupervisor" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">发证机关</td>
                <td class="TdContentSearch">
                    <input type="text" id="IssuingOrgan" name="IssuingOrgan" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
                <td class="TdTitle">签发人</td>
                <td class="TdContentSearch">
                    <input type="text" id="IssuerName" name="IssuerName" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">签发日期</td>
                <td class="TdContentSearch">
                    <input type="text" id="IssueDate" name="IssueDate" style="width: 160px;" data-options="editable:false" class="easyui-datebox" maxlength="50" runat="server" />
                </td>
                <td class="TdTitle">有效期至</td>
                <td class="TdContentSearch">
                    <input type="text" id="ValidityDate" name="ValidityDate" style="width: 160px;" data-options="editable:false" class="easyui-datebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">食材专责采购文员姓名</td>
                <td class="TdContentSearch">
                    <input type="text" id="BuyerName" name="BuyerName" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
                <td class="TdTitle">仓管员姓名</td>
                <td class="TdContentSearch">
                    <input type="text" id="StorekeeperName" name="StorekeeperName" class="easyui-validatebox" maxlength="50" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">资质证书</td>
                 <td colspan="3">
                    <span style="float: left">文件说明：
                            <input id="FileRemark" name="FileRemark" runat="server" style="width: 190px" />
                    </span>
                    <input style="float: left; width: 240px" id="btnFile" tabindex="1" type="file" name="btnFile" runat="server" />
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
        </table>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnSave" type="button" onclick="javascript: if (Save() == false) return false;" value="保存" name="btnSave" runat="server" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="HidStaffCanteenID" name="HidStaffCanteenID" runat="server" />
    </form>
</body>
</html>

<script type="text/javascript">

    $("#btnReturn").click(function () {
        close("1");
    })
    //是否开设食堂
    function IsOpenChange(record) {
        if (record.value == "1") {
            $('.easyui-validatebox').attr("disabled", "disabled");
            $('.easyui-validatebox').val("");
            $('#IsBusiness').combobox({ disabled: true });
            $('#IsBusiness').combobox("setValue","");
            $('.easyui-datebox').datebox({ disabled: true });
            $('.easyui-datebox').datebox("setValue","");
        } else {
            $('.easyui-validatebox').removeAttr("disabled");
            $('#IsBusiness').combobox({ disabled: false });
            $('#IsBusiness').combobox("setValue", "");
            $('.easyui-datebox').datebox({ disabled: false });
        }
    }
    function InitPage() {
        if ($('#hidIsOpen').val() == "1") {
            $('.easyui-validatebox').attr("disabled", "disabled");
            $('.easyui-validatebox').val("");
            $('#IsBusiness').combobox({ disabled: true });
            $('#IsBusiness').combobox("setValue", "");
            $('.easyui-datebox').datebox({ disabled: true });
            $('.easyui-datebox').datebox("setValue", "");
        }
    }
    InitPage();
    function Save() {
        if ($('#IsOpen').combobox("getValue")=="0"&& $('#IsBusiness').combobox("getValue") == "") {
            HDialog.Info("请选择是否办理食堂经营资质!");
            return false;
        }
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

    function close(callparm) {
        HDialog.Close(callparm);
    }
</script>
