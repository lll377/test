<%@ Page Language="c#" CodeBehind="InputFeesManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.InputFeesManage" %>

<%@ Register TagPrefix="dslbc" Namespace="DualSelectListBoxControl" Assembly="DualSelectListBoxControl" %>
<!DOCTYPE HTML  >
<html>
<head>
    <title>InputFeesManage</title>
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
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script language="javascript">
		<!--
    function btnFileUp_Onclick() {

        if (InputFeesManage.btnFile.value == "" && InputFeesManage.PostedFileName.value == "") {
            alert("请选择要读取的本地文件!");
            InputFeesManage.btnFile.focus();
            return false;
        }
        if (InputFeesManage.TableName.value == "") {
            alert("请输入Excel表的工作表名!");
            InputFeesManage.TableName.focus();
            return false;
        }

        return true;
    }
    function btnFile_OnClick() {
        InputFeesManage.FilePhysics.value = "";
    }
    function btnOK_Onclick() {
        if (btnFileUp_Onclick() == false) {
            return false;
        }

        if (InputFeesManage.StartNum.value == "") {
            alert("请输入起始行数!");
            InputFeesManage.StartNum.focus();
            return false;
        }

        if (InputFeesManage.DualListField_RightBox.options.length <= 0) {
            alert("请选择Excel列名对应的项目!");
            return false;
        }

        return true;

    }

    //-->
    </script>
</head>
<body style="overflow-y: auto;">
    <form id="InputFeesManage" method="post" runat="server">

        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <h3>这里是应收管理-应收导入操作介绍<br />
                    点击下一步继续教程</h3>
            </div>

            <div id="walkthrough-2">
                在这里点击生成格式文件
            </div>

            <div id="walkthrough-3">
                点击这里上传文件
            </div>

            <div id="walkthrough-4">
                一般不需要对格式设置做改动
            </div>

            <div id="walkthrough-5">
                点击这里确定导入
            </div>
        </div>

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

                    <input id="btnFile" style="height: 22px; width: 264px" onclick="javascript: btnFile_OnClick();"
                        tabindex="1" type="file" size="24" name="btnFile" runat="server">
                    <input id="FilePhysics" style="height: 22px; width: 35px" type="hidden" size="1" name="FilePhysics"
                        runat="server"><input id="PostedFileName" style="height: 22px; width: 35px" type="hidden" size="1" name="PostedFileName"
                            runat="server">Excel工作表名<input class="Control_ItemInput" id="TableName" style="height: 19px; width: 112px" maxlength="50"
                                size="13" value="Sheet1" name="TableName" runat="server">
                    <input class="button" id="btnFileUp" onclick="javascript: if (btnFileUp_Onclick() == false) return false;"
                        type="button" value="读取" name="btnFileUp" runat="server">
                </td>
            </tr>
            <tr><td>                    <span style="color: red;">
                        备注:按房号导入房屋编号、客户名称、楼宇、应收金额和客户类别不能为空;
                        &nbsp;
                        按客户导入客户名称、房屋编号、应收金额和客户类别不能为空。</span></td></tr>
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
                                            <asp:ListBox ID="ListBox1" runat="server" Width="120px" Height="160px"></asp:ListBox></td>
                                        <td width="40">
                                            <input class="button" id="btnRemove" type="button" value="去除" name="btnRemove" runat="server"></td>
                                        <td valign="top" nowrap align="center">
                                            <div id="div_send" runat="server">
                                                <table id="Table3" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                    <tr>
                                                        <td><font face="宋体"></font></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 22px" align="left">起始行数：<input class="Control_ItemInput" id="StartNum" style="height: 19px; width: 34px" maxlength="10"
                                                            size="1" value="1" name="StartNum" runat="server"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="50"></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="div_load" runat="server">
                                                <table class="font" style="display: none; height: 20px; width: 200px; filter: Alpha(opacity=80)" bordercolor="#cccccc"
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
                                            <asp:Label ID="lab_jg" runat="server" ForeColor="Transparent"></asp:Label></td>
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
                                <asp:CheckBox ID="CkIsSplit" Style="z-index: 0" runat="server" Text="按自然月分解" Checked="True"></asp:CheckBox>&nbsp;
                                <input class="button" id="btnOK" onclick="javascript: if (btnOK_Onclick() == false) return false;"
                                    type="button" value="确定导入" name="btnOK" runat="server">
                                <br>
                                <textarea id="TextResults" style="width: 100%; display: none;" name="TextResults" rows="6" runat="server"></textarea>
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
                    <asp:DataGrid ID="DGrid" Style="font-size: 12px" runat="server" Width="100%" CssClass="DataGrid">
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

    $('#btnCreExcel').click(function () {
        HDialog.Open(550, 350, '../ChargesNew/ExcelFeesManage.aspx', '生成Excel费用文件', false, function callback(_Data) {

        });

    });

    function GetShow() {
        $('body').pagewalkthrough({
            name: 'introduction',
            steps: [{
                popup: {
                    content: '#walkthrough-1',
                    type: 'modal'
                }
            }, {
                wrapper: '#btnCreExcel',
                popup: {
                    content: '#walkthrough-2',
                    type: 'tooltip',
                    position: 'bottom'
                },
                onLeave: function () {
                    HDialog.Open(550, 350, '../ChargesNew/ExcelFeesManage.aspx?is_show=1', '生成Excel费用文件', false, function callback(_Data) {
                        $('body').pagewalkthrough('close');
                        if (_Data == "1") {
                            next_step();
                        }
                    });
                }
            }
            ],
            buttons: {
                jpwNext: {
                    i18n: "下一步 &rarr;"
                },
                jpwFinish: {
                    i18n: "下一步 &rarr;"
                },
                jpwPrevious: {
                    i18n: "&larr; 上一步"
                },
                jpwClose: {
                    i18n: "关闭",
                }
            }
        });
        $('body').pagewalkthrough('show');
    }

    function next_step() {
        $('body').pagewalkthrough({
            name: 'next_step',
            steps: [{
                wrapper: '#btnFileUp',
                popup: {
                    content: '#walkthrough-3',
                    type: 'tooltip',
                    position: 'bottom'
                }
            }, {
                wrapper: '#Table1',
                popup: {
                    content: '#walkthrough-4',
                    type: 'tooltip',
                    position: 'bottom'
                }
            }, {
                wrapper: '#btnOK',
                popup: {
                    content: '#walkthrough-5',
                    type: 'tooltip',
                    position: 'bottom'
                }
            }
            ],
            buttons: {
                jpwNext: {
                    i18n: "下一步 &rarr;"
                },
                jpwFinish: {
                    i18n: "结束指引 &rarr;"
                },
                jpwPrevious: {
                    i18n: "&larr; 上一步"
                },
                jpwClose: {
                    i18n: "关闭",
                }
            }
        });
        $('body').pagewalkthrough('show');
    }
</script>
