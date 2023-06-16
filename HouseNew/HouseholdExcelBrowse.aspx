<%@ Page Language="c#" CodeBehind="HouseholdExcelBrowse.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.HouseholdExcelBrowse" %>

<%@ Register TagPrefix="dslbc" Namespace="DualSelectListBoxControl" Assembly="DualSelectListBoxControl" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>InputCustManage</title>
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
    <script language="javascript">
		<!--
    function btnFileUp_Onclick() {

        if (InputCustManage.btnFile.value == "" && InputCustManage.PostedFileName.value == "") {
            alert("请选择要读取的本地文件!");
            InputCustManage.btnFile.focus();
            return false;
        }
        if (InputCustManage.TableName.value == "") {
            alert("请输入Excel表的工作表名!");
            InputCustManage.TableName.focus();
            return false;
        }

        return true;
    }
    function btnFile_OnClick() {
        InputCustManage.FilePhysics.value = "";
    }
    function btnOK_Onclick() {
        if (btnFileUp_Onclick() == false) {
            return false;
        }

        if (InputCustManage.StartNum.value == "") {
            alert("请输入起始行数!");
            InputCustManage.StartNum.focus();
            return false;
        }

        if (InputCustManage.DualListField_RightBox.options.length <= 0) {
            alert("请选择Excel列名对应的项目!");
            return false;
        }

        return true;

    }

    //-->
    </script>
</head>
<body style="overflow-y: auto;">

    <form id="InputCustManage" method="post" runat="server">
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">第一步：生成格式</span></td>
            </tr>
            <tr>
                <td align="center">
                    <input class="button" id="btnCreExcel" style="width: 100px" type="button" value="生成格式文件"
                        name="btnCreExcel" runat="server"></td>
            </tr>
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">第二步：上传文件</span></td>
            </tr>
            <tr>
                <td valign="top">

                    <input id="btnFile" style="width: 264px; height: 22px" onclick="javascript: btnFile_OnClick();"
                        tabindex="1" type="file" size="24" name="btnFile" runat="server">
                    <input id="FilePhysics" style="width: 35px; height: 22px" type="hidden" size="1" name="FilePhysics"
                        runat="server"><input id="PostedFileName" style="width: 35px; height: 22px" type="hidden" size="1" name="PostedFileName"
                            runat="server">Excel工作表名<input class="Control_ItemInput" id="TableName" style="width: 112px; height: 19px" type="text"
                                maxlength="50" size="13" value="Sheet1$" name="TableName" runat="server">
                    <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        type="button" value="读取" name="btnFileUp" runat="server"></td>

            </tr>
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">第三步：格式设置</span></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table class="formTable" id="Table1" cellspacing="1" cellpadding="4" align="center">
                        <tr>
                            <td valign="top" align="right" width="40%">
                                <table id="Table2" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td width="170">可选项目：</td>
                                        <td width="140">与列名相对应的项目：</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dslbc:DualSelectListBox ID="DualListField" runat="server">
                                                <LeftListStyle Width="120px" Height="160px"></LeftListStyle>
                                                <RightListStyle Width="120px" Height="160px"></RightListStyle>
                                            </dslbc:DualSelectListBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
                                <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td width="120"><font face="宋体">列名：</font></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td width="120">
                                            <asp:ListBox ID="ListBox1" runat="server" Height="160px" Width="120px"></asp:ListBox></td>
                                        <td width="40">
                                            <input class="button" id="btnRemove" type="button" value="去除" name="btnRemove" runat="server"></td>
                                        <td valign="top" nowrap align="center">
                                            <div id="div_send" runat="server">
                                                <table id="Table3" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                    <tr>
                                                        <td><font face="宋体"></font></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" height="22" style="height: 22px">起始行数：<input class="Control_ItemInput" id="StartNum" style="width: 34px; height: 19px" type="text"
                                                            maxlength="10" size="1" value="1" name="StartNum" runat="server"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="50"></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="div_load" runat="server">
                                                <table class="font" style="filter: Alpha(opacity=80); width: 200px; height: 20px" bordercolor="#cccccc"
                                                    height="20" cellspacing="1" cellpadding="1" width="320" border="1">
                                                    <tr>
                                                        <td align="center">
                                                            <table width="100%" border="0">
                                                                <tr>
                                                                    <td align="right" width="25%">
                                                                        <img height="25" alt="请等待" src="../images/clocks.gif" width="25" border="0">
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:Label ID="lab_state" runat="server"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <asp:Label ID="lab_jg" runat="server" Visible="false"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">第四步：确定导入</span></td>
            </tr>
            <tr>
                <td valign="top">
                    <table class="SchTable" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td align="center">
                                <input class="button" id="btnOK" onclick="javascript: if (btnOK_Onclick() == false) return false;"
                                    type="button" value="确定导入" name="btnOK" runat="server">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="height: 22px; background-color: #e6e6e6"><span style="font-size: 16px">前10行数据</span></td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" CssClass="DataGrid" Width="100%">
                        <AlternatingItemStyle CssClass="DataGrid_AltItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DataGrid_Item"></ItemStyle>
                        <HeaderStyle CssClass="DataGrid_Header"></HeaderStyle>
                    </asp:DataGrid></td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">

    $('#btnReturn').click(function () {
        HDialog.Close("true");
    });
    
</script>
