<%@ Page Language="c#" CodeBehind="BillIssueAllManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.BillIssueAllManage" %>

<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager" %>
<%@ Register TagPrefix="uc1" TagName="OperatTitle" Src="../UserControl/OperatTitle.ascx" %>
<!DOCTYPE HTML >
<html>
<head>
    <title>BillIssueAllManage</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../css/style.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="../jscript/DateControl.js"></script>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/ajax.js"></script>
    <script language="javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script language="javascript">
		<!--
    function btnClear_OnClick() {

    }
    //-->
    </script>
    <style type="text/css">
        table.tb1 td {
            /*padding: 5px;*/
            /*border: 1px solid green;*/
        }

        #Table1 td {
            border: 1px solid #ffffff;
        }

        #tab5 td {
            /*border: 1px solid #f6f6f6;*/
        }

        #footer .buttons {
            background-color: #3e73ca;
            border: 0 solid #dcdcdc;
            border-radius: 3px;
            box-shadow: 0 0 0 0 #ffffff inset;
            color: #ffffff;
            display: inline-block;
            font-family: 微软雅黑;
            font-size: 12px;
            font-weight: normal;
            height: 30px;
            line-height: 28px;
            text-align: center;
            text-decoration: none;
            width: 103px;
        }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="BillIssueAllManage" method="post" runat="server">
        <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server">
        <input id="BillID" type="hidden" size="1" name="BillID" runat="server">
        <input id="BillTypeID" type="hidden" size="1" name="BillTypeID" runat="server">
        <table id="Table2" height="100%" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td valign="top" bgcolor="#ffffff">
                    <table id="Table3" cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td>
                                <table class="formTable" cellspacing="1" cellpadding="4" align="center">
                                    <tr>
                                        <td class="formTable_Item" align="right" width="12%"><font face="宋体">
                                            <asp:CheckBox Style="z-index: 0" ID="IsUseDate" runat="server" Text="使用时间"></asp:CheckBox></font></td>
                                        <td class="formTable_ItemInput" width="38%"><font face="宋体">
                                            <select id="nYear1" name="nYear1" runat="server">
                                                <option selected></option>
                                            </select>年<select id="nMonth1" name="nMonth1" runat="server">
                                                <option selected></option>
                                            </select>月<select id="nDay1" name="nDay1" runat="server">
                                                <option selected></option>
                                            </select>日</font></td>
                                        <td class="formTable_Item" align="right" width="12%"><font face="宋体">到</font></td>
                                        <td class="formTable_ItemInput" width="38%">
                                            <select id="nYear2" name="nYear2" runat="server">
                                                <option selected></option>
                                            </select>年<select id="nMonth2" name="nMonth2" runat="server">
                                                <option selected></option>
                                            </select>月<select id="nDay2" name="nDay2" runat="server">
                                                <option selected></option>
                                            </select>日</td>
                                    </tr>
                                    <tr>
                                        <td id="footer" class="formTable_Footer" align="center" colspan="4">
                                            <input class="buttons" id="btnFilter" type="button" value="查询" name="btnFilter"
                                                runat="server">&nbsp;
                                            <input class="button" id="btnClear" style="display: none;" onclick="javascript: btnClear_OnClick();"
                                                type="button" value="清空" name="btnClear"><font face="宋体">&nbsp;</font>
                                            <input class="button" id="btnReturn" style="display: none;" type="button" value="返回"
                                                name="btnReturn" runat="server">
                                        </td>
                                    </tr>
                                </table>
                                <table class="formTable" id="Table1" align="center">
                                    <tr>
                                        <td class="formTable_Item" align="center" width="80%" colspan="5"><font face="宋体">
                                            <asp:Label ID="BillTypeName" runat="server"></asp:Label>(从<asp:Label ID="BeginSign" runat="server"></asp:Label>到<asp:Label ID="EndSign" runat="server"></asp:Label>)</font></td>
                                        <td class="formTable_ItemInput" align="center" width="20%"><font face="宋体">总数：
													<asp:Label ID="ShareCount" runat="server"></asp:Label></font></td>
                                    </tr>
                                    <tr>
                                        <td class="formTable_Item" align="center" style="width: 5%;"><font face="宋体">类 型</font></td>
                                        <td class="formTable_Item" align="center" style="width: 19%;"><font face="宋体">有效票号</font></td>
                                        <td class="formTable_Item" align="center" style="width: 19%;"><font face="宋体">换票票号</font></td>
                                        <td class="formTable_Item" align="center" style="width: 19%;"><font face="宋体">作废票号</font></td>
                                        <td class="formTable_Item" align="center" style="width: 19%;"><font face="宋体">其它用途</font></td>
                                        <td class="formTable_Item" align="center" style="width: 19%;"><font face="宋体">未使用票号</font></td>
                                    </tr>
                                    <tr>
                                        <td class="formTable_ItemInput" align="center" style="width: 5%;" valign="top">
                                            <font face="宋体">数量</font>
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="count2" runat="server"></asp:Label>
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="count3" runat="server"></asp:Label>
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="count4" runat="server"></asp:Label>
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="count1" runat="server"></asp:Label>
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="count5" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formTable_ItemInput" align="center" style="width: 5%;" valign="top">
                                            <font face="宋体">金额</font>
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="lbInfo2" runat="server"></asp:Label>
                                            <asp:Label ID="Label1" runat="server"></asp:Label><input id="Hidden1" style="height: 22px; width: 16px" type="hidden" size="1" name="hiPaidAmount2"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="Label2" runat="server"></asp:Label><input id="Hidden2" style="height: 22px; width: 16px" type="hidden" size="1" name="hiPaidAmount3"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="lbInfo3" runat="server"></asp:Label>
                                            <asp:Label ID="Label3" runat="server"></asp:Label><input id="Hidden3" style="height: 22px; width: 16px" type="hidden" size="1" name="hiPaidAmount4"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="Label4" runat="server"> <asp:Label ID="lbInfo4" runat="server"></asp:Label>

                                            </asp:Label><input id="Hidden4" style="height: 22px; width: 16px" type="hidden" size="1" name="hiPaidAmount1"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" style="width: 19%;" valign="top">
                                            <asp:Label ID="Label5" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formTable_ItemInput" align="center" style="width: 5%;" valign="top">
                                            <font face="宋体">明细</font>
                                        </td>
                                        <td class="formTable_ItemInput" align="center" width="20%" valign="top">
                                            <asp:Repeater ID="RpUseList2" runat="server">
                                                <ItemTemplate>
                                                    <table class="tb1" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="20px">
                                                                <asp:HyperLink ID="hlBillsSign2" runat="server"></asp:HyperLink></td>
                                                            <td height="20px">
                                                                <asp:Label ID="lbUseDate2" runat="server"></asp:Label></td>
                                                            <td height="20px" align="right">
                                                                <asp:Label ID="lbPaidAmount2" runat="server"></asp:Label>
                                                            </td>
                                                            <td height="20px" align="right">
                                                                <%--<asp:Label ID="lbLimitUserName" runat="server"></asp:Label>--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <input id="hiPaidAmount2" style="width: 16px; height: 22px" type="hidden" size="1" name="hiPaidAmount2"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" width="20%" valign="top">
                                            <asp:Repeater ID="RpUseList3" runat="server">
                                                <ItemTemplate>
                                                    <table class="tb1" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="20px">
                                                                <asp:HyperLink ID="hlBillsSign3" runat="server"></asp:HyperLink></td>
                                                            <td height="20px">
                                                                <asp:Label ID="lbUseDate3" runat="server"></asp:Label></td>
                                                            <td height="20px" align="right">
                                                                <asp:Label ID="lbPaidAmount3" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <input id="hiPaidAmount3" style="width: 16px; height: 22px" type="hidden" size="1" name="hiPaidAmount3"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" width="20%" valign="top">
                                            <asp:Repeater ID="RpUseList4" runat="server">
                                                <ItemTemplate>
                                                    <table class="tb1" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="20px">
                                                                <asp:HyperLink ID="hlBillsSign4" runat="server"></asp:HyperLink></td>
                                                            <td height="20px">
                                                                <asp:Label ID="lbUseDate4" runat="server"></asp:Label></td>
                                                            <td height="20px" align="right">
                                                                <asp:Label ID="lbPaidAmount4" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <input id="hiPaidAmount4" style="width: 16px; height: 22px" type="hidden" size="1" name="hiPaidAmount4"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" width="20%" valign="top">
                                            <asp:Repeater ID="RpUseList1" runat="server">
                                                <ItemTemplate>
                                                    <table class="tb1" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="20px">
                                                                <asp:HyperLink ID="hlBillsSign1" runat="server"></asp:HyperLink></td>
                                                            <td height="20px">
                                                                <asp:Label ID="lbUseDate1" runat="server"></asp:Label></td>
                                                            <td height="20px" align="right">
                                                                <asp:Label ID="lbPaidAmount1" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:Label ID="lbInfo1" runat="server"></asp:Label><input id="hiPaidAmount1" style="width: 16px; height: 22px" type="hidden" size="1" name="hiPaidAmount1"
                                                runat="server">
                                        </td>
                                        <td class="formTable_ItemInput" align="center" width="20%" valign="top">
                                            <asp:Repeater ID="RpUseList5" runat="server">
                                                <ItemTemplate>
                                                    <table id="tab5" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="20px">
                                                                <asp:HyperLink ID="hlBillsSign5" runat="server"></asp:HyperLink></td>
                                                            <td height="20px" align="right">
                                                                <asp:Label ID="lbPaidAmount5" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:Label ID="lbInfo5" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formTable_Item" align="center" width="5%"><font face="宋体">总金额</font></td>
                                        <td class="formTable_ItemInput" align="left" width="95%" colspan="5">
                                            <asp:Label ID="lbAllPaidAmount" runat="server"></asp:Label></td>
                                    </tr>
                                    <%--<tr>
                                        <td class="formTable_Footer" align="center" colspan="5"></td>
                                    </tr>--%>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();
    function myclick(url) {
        HDialog.Open(w, h, url, '  修改票据', false,
          function callback(_Data) {
             
          });
    }
</script>
