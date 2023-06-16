<%@ Page Language="c#" CodeBehind="MeterBatchManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.MeterBatchManage" %>

<%@ Register TagPrefix="dslbc" Namespace="DualSelectListBoxControl" Assembly="DualSelectListBoxControl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>MeterBatchManage</title>
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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script language="javascript">

        function CheckData() {
            if (MeterBatchManage.MeterName.value == "") {
                alert("请输入表计名称,此项不能为空!");
                MeterBatchManage.MeterName.focus();
                return false;
            }
            if (MeterBatchManage.InitAmount.value == "") {
                alert("请输入初始读数,此项不能为空!");
                MeterBatchManage.InitAmount.focus();
                return false;
            }
            if (MeterBatchManage.Ratio.value == "") {
                alert("请输入变比,此项不能为空!");
                MeterBatchManage.Ratio.focus();
                return false;
            }
            if ($("#MeterTabClass option:selected").val() == "") {
                alert("请选择表计类型,此项不能为空!");
                return false;
            }

            return true;
        }
        function SearMeterBox() {

            HDialog.Open('700', '400', "../dialogNew/MeterBoxDlg.aspx", '表箱选择', false, function callback(_Data) {

                if (_Data != "") {
                    //**获得返回 
                    var varObjects = JSON.parse(_Data);
                    $('#MeterBoxID').val(varObjects.MeterBoxID);
                    $('#MeterBoxName').searchbox('setValue', varObjects.MeterBoxName);

                }
            });
        }

        function SearCorrespTotalMeter() {
            HDialog.Open('700', '400', "../dialogNew/CorrespTotalMeterDlg.aspx", '对应公区表总表选择', false, function callback(_Data) {
                if (_Data != "") {
                    //**获得返回 
                    var varObjects = JSON.parse(_Data);
                    console.log(varObjects);
                    $('#CorrespTotalMeterId').val(varObjects.MeterID);
                    $('#CorrespTotalMeterName').searchbox('setValue', varObjects.MeterName);
                }
            });
        }
    </script>
</head>
<body style="overflow-y: auto">
    <form id="MeterBatchManage" method="post" runat="server">
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td align="center" colspan="4" style="height: 22px"><span id="lbl_WorkflowName">表计批量设置</span></td>
            </tr>
            <tr>
                <td class="TdTitle">请选择设置范围</td>
                <td colspan="3" align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>

                            <td align="center">
                                <asp:DropDownList ID="DListRange" runat="server" AutoPostBack="True">
                                    <asp:ListItem Value="4">按组团</asp:ListItem>
                                    <asp:ListItem Value="1">按楼宇</asp:ListItem>
                                    <asp:ListItem Value="2">按单元</asp:ListItem>
                                    <asp:ListItem Value="3">按楼层</asp:ListItem>

                                </asp:DropDownList></td>
                            <td width="30%"></td>
                        </tr>
                    </table>
                    <dslbc:DualSelectListBox runat="server" ID="DualListField">
                        <LeftListStyle Width="200px" Height="250px"></LeftListStyle>
                        <RightListStyle Width="200px" Height="250px"></RightListStyle>
                    </dslbc:DualSelectListBox>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">表计类型</td>
                <td class="TdContent">
                    <asp:DropDownList ID="MeterType" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList></td>
                <td class="TdTitle">表计序号</td>
                <td class="TdContent">
                    <asp:DropDownList ID="SNum" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList><input id="StanID" style="width: 24px; height: 22px" type="hidden" size="1" name="StanID"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">表计名称</td>
                <td class="TdContent">
                    <input id="MeterName" class="easyui-validatebox" data-options="required:true" name="MeterName" runat="server" type="text" />
                </td>
                <td class="TdTitle">初始读数</td>
                <td class="TdContent">
                    <input onkeypress="CheckNumeric();" id="InitAmount" type="text" class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'digital'"
                        maxlength="20" size="10" name="InitAmount" runat="server" />

                </td>
            </tr>
            <tr>
                <td class="TdTitle">变比</td>
                <td class="TdContent">
                    <input onkeypress="CheckInterger();" id="Ratio" type="text" class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'positiveint'"
                        maxlength="10" size="10" name="Ratio" runat="server" /></td>
                <td class="TdTitle">是否反向</td>
                <td class="TdContent">
                    <select id="IsReverse" style="width: 100px" name="IsReverse" runat="server">
                        <option selected></option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">表计类别</td>
                <td class="TdContent">
                    <select id="MeterTabClass" name="MeterTabClass" style="width: 100px" runat="server">
                        <option selected></option>
                        <option value="商业">商业</option>
                        <option value="外协">外协</option>
                        <option value="住宅">住宅</option>
                        <option value="其他">其他</option>
                    </select>
                </td>
                <td class="TdTitle">表箱</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="MeterBoxName" searcher="SearMeterBox" data-options="editable:false" name="MeterBoxName" runat="server" />
                    <input type="hidden" id="MeterBoxID" runat="server" value="" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">对应总表</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="CorrespTotalMeterName" searcher="SearCorrespTotalMeter" data-options="editable:false" name="CorrespTotalMeterName" runat="server" />
                    <input type="hidden" id="CorrespTotalMeterId" name="CorrespTotalMeterId" runat="server" value="" />
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input class="button" id="btnOK" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="确定" name="btnOK" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" align="left">备注：一个房间最多可以设置总共36个表计（包含水电气暖），超出限制可虚拟新的房号进行设置。</td>
            </tr>
        </table>
    </form>
</body>
</html>
