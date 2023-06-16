<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoSendManageJH.aspx.cs" Inherits="M_Main.SMSNew.AutoSendManageJH" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.js"></script>
    
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    

    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" style="height: 22px; width: 32px" size="1">
        <input id="Type" style="height: 22px; width: 24px" type="hidden" size="1" name="Type" runat="server">
        <input id="IID" type="hidden" name="IID" runat="server" style="height: 22px; width: 24px" size="1">
        <input id="CommID" style="height: 22px; width: 24px" type="hidden" size="1" name="CommID" runat="server">
        <input id="BuildSNums" size="1" type="hidden" name="BuildSNums" runat="server" />
        <input id="SelReturn" type="hidden" name="SelReturn" runat="server" />

        <table class="DialogTable">
            <tr>
                <td style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;" colspan="4">自动短信发送</td>
            </tr>
            <tr>
                <td class="TdTitle">类别</td>
                <td class="TdContentSearch" colspan="3">
                    <select id="SMSType" class="easyui-combobox" name="SMSType" runat="server">
                        <option value="欠费提醒" selected>欠费提醒</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">楼宇</td>
                <td class="TdContent" colspan="3">
                    <textarea class="easyui-validatebox" id="BuildNames" name="BuildNames" data-options="required:true" rows="6" cols="70" runat="server" onclick="SelCust();"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">发送时刻</td>
                <td class="TdContentSearch">
                    <select id="nDay" name="nDay" runat="server">
                        <option selected></option>
                    </select>日
                    <select id="nHour" name="nHour" style="display: none" runat="server">
                        <option selected></option>
                    </select>
                    <select id="nMinute" name="nMinute" style="display: none" runat="server">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">是否自动发送</td>
                <td class="TdContent">
                    <input id="IsUsed1" value="1" type="radio" name="IsUsed" runat="server" checked>是
                    <input id="IsUsed2" value="0" type="radio" name="IsUsed" runat="server">否
                </td>
            </tr>
            <tr>
                <td class="TdTitle">最近设置人</td>
                <td class="TdContent" colspan="3">
                    <asp:Label ID="lbUserName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="4" class="DialogTdSubmit">
                    <input type="button" style="display: none;" class="button" id="btnSave" value="保存" runat="server" />
                    <input type="button" class="button" id="btnSaveSubmit" value="保存" runat="server" />
                    <input type="button" class="button" id="btnClear" value="清空" runat="server" />
                </td>
            </tr>
        </table>

    </form>
    <script type="text/javascript">
        $("#btnSaveSubmit").click(function () {
            if ($("#frmForm").form("validate")) {
                $("#btnSave").click();
            }
        })

        $("#btnClear").click(function () {
            $('#BuildSNums').val('');
            $('#BuildNames').val('');
            $("#SelReturn").val('');
        })


        function SelBuild() {
            HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {
                if (_Data != "") {//**获得返回 刷新
                    var varObjects = _Data.split("|");
                    var BuildSNums = "";
                    var BuildNames = "";
                    for (var i = 0; i < varObjects.length; i++) {
                        if (varObjects[i].indexOf(",") > 0) {
                            var d1 = varObjects[i].split(",")[0];
                            var d2 = varObjects[i].split(",")[1];

                            BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                            BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                        }
                    }
                    $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                    $('#BuildNames').val(BuildNames.substring(1, BuildNames.length));
                }
            });

        }

        function SelCust() {
            var varCommID = $("#CommID").val();
            if (varCommID == "") {
                HDialog.Info("请选择小区,此项不能为空!");
                $("#btnSelComm").focus();
                return false;
            }
           
            $.cookie('SelReturnName',$("#SelReturn").val()); 
            $.cookie('key', 'value', { expires: 7 });

            
            HDialog.Open('900', '600', '../DialogNew/MultiCustCanDlgJH.aspx?CommID=' + varCommID + '&Ram=' + Math.random(), '选择客户名称', false, function callback(varReturn) {
                if (varReturn != "") {//**获得返回的参数信息    
                    var varObjects = varReturn.split("\t");
                    $('#BuildSNums').val(varObjects[0]);
                    $('#BuildNames').val(varObjects[1]);
                    $("#SelReturn").val(varObjects[0] + '|' + varObjects[1] + '|' + varObjects[2]);
                }
            },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

    </script>
</body>
</html>
