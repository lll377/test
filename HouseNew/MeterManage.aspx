<%@ Page Language="c#" CodeBehind="MeterManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.MeterManage" %>

<!DOCTYPE html>
<html>
<head>
    <title>MeterManage</title>
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

            if (MeterManage.MeterName.value == "") {
                alert("请输入表计名称,此项不能为空!");
                MeterManage.MeterName.focus();
                return false;
            }
            if (MeterManage.InitAmount.value == "") {
                alert("请输入初始读数,此项不能为空!");
                MeterManage.InitAmount.focus();
                return false;
            }
            if (MeterManage.Ratio.value == "") {
                alert("请输入变比,此项不能为空!");
                MeterManage.Ratio.focus();
                return false;
            }

            if ($("#MeterTabClass option:selected").val() == "") {
                alert("请选择计量表类型,此项不能为空!");
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
                    $('#CorrespTotalMeterId').val(varObjects.MeterID);
                    $('#CorrespTotalMeterName').searchbox('setValue', varObjects.MeterName);

                }
            });
        }
        
        //-->
    </script>
</head>
<body>
    <form id="MeterManage" method="post" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server"
            size="1" />
        <input id="MeterID" type="hidden" name="MeterID" runat="server"
            size="1" />
        <input id="RoomID" type="hidden" size="1" name="RoomID"
            runat="server" />
        <input id="MeterSign" type="hidden" size="1" name="MeterSign"
            runat="server" />
        <table class="DialogTable" style="width: 100%">
            <tr>
                <td class="TdTitle">房屋编号</td>
                <td class="TdContent">
                    <input class="Control_ItemInput" id="RoomSign" readonly name="RoomSign"
                        runat="server" />
                </td>
                <td class="TdTitle">
                    <input id="StanID" type="hidden" size="1" name="StanID"
                        runat="server" /></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">表计类型</td>
                <td class="TdContent">
                    <asp:DropDownList ID="MeterType" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList></td>
                <td class="TdTitle">表计序号</td>
                <td class="TdContent">
                    <div class="font_red" id="results">
                        <asp:DropDownList ID="SNum" runat="server" Width="100" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">表计名称</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="MeterName" name="MeterName" runat="server" /></td>
                <td class="TdTitle">初始读数</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'digital'" id="InitAmount"
                        name="InitAmount" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">变比</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'positiveint'" id="Ratio"
                        name="Ratio" runat="server" /></td>
                <td class="TdTitle">是否反向</td>
                <td class="TdContent">
                    <select id="IsReverse" name="IsReverse" style="width: 100px" runat="server">
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
                <td colspan="4"></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnFilter" runat="server" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												&nbsp;&nbsp;&nbsp;
                                            <input id="btnReturn" type="button" value="关闭" name="btnFilter"
                                                runat="server" class="button"></td>
            </tr>
            <tr>
                <td class="TdTitle" colspan="4" style="text-align: left">备注：一个房间最多可以设置总共36个表计（包含水电气暖），超出限制可虚拟新的房号进行设置。</td>
            </tr>
        </table>
    </form>
</body>
</html>
