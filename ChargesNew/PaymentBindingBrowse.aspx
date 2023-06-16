<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentBindingBrowse.aspx.cs" Inherits="M_Main.ChargesNew.PaymentBindingBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/Cache.js" type="text/javascript"></script>
</head>

<body>
    <form id="frmForm" runat="server">
        <input type="hidden" name="CostID" id="CostID" runat="server" />
        <input type="hidden" name="oldCostID" id="oldCostID" runat="server" />
        <input type="hidden" name="HidType" id="HidType" runat="server" />
        <input type="hidden" name="IID" id="IID" runat="server" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">项目名称</td>
                <td class="TdContent">
                    <input class="easyui-searchbox" id="CommNames" searcher="SelCommInfo" style="height: 25px" name="CommNames" runat="server" data-options="editable:false" />
                    <input id="hiCommNames" type="hidden" size="1" name="hiCommNames" runat="server" />
                    <input id="CommID" type="hidden" size="1" name="CommID" runat="server" />
                </td>
            </tr>
            <%--<tr>
					<td class="TdTitle">捆绑名称</td>
					<td class="TdContent" >
						<input class="easyui-validatebox" type="text" id="CostTypeName" name="CostTypeName" style="height: 22px" runat="server" data-options="required:true" />
					</td>
				</tr>--%>
            <tr>
                <td class="TdTitle">费用名称</td>
                <td class="TdContent">
                    <%--<input class="easyui-searchbox" id="CostNames" searcher="SelCostName" style="height: 25px" data-options="editable:false" name="CostNames" runat="server" />--%>

                    <textarea style="width: 92%; font-size: 12px;" name="CostNames" id="CostNames" onclick="SelCostName();" readonly="readonly" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">是否预存</td>
                <td class="TdContent">
                    <select id="IsPrec" name="IsPrec" runat="server">
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <%-- </div>--%>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            function SelCommInfo() {

                HDialog.Open(700, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommNames").searchbox("setText", arrRet.name);
                    //$("#CommID").val(arrRet.attributes.InPopedom);
                    //$("#CommNames").searchbox("setText", arrRet.text);
                });
            }


            function SelCostName() {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open('1000', '600', '../DialogNew/SelCostItemInfo.aspx?CommID=' + $("#CommID").val(), '费用项目选择', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CostID").val(arrRet.CostID);
                    $("#CostNames").val(arrRet.CostName);
                });
            }



            $("#BtnSave").click(function () {

                $.tool.DataPostChk('frmForm', 'PaymentSubject', 'PaymentBindAdd', $('#frmForm').serialize(),
                    function Init() { },
                    function callback(_Data) {
                        if (_Data == "1") {
                            HDialog.Info("该项目费用类型已存在");
                            return;
                        } else {
                            HDialog.Close('1');
                        }

                    },
                    function completeCallback() { },
                    function errorCallback() { });

            });
            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
        </script>
    </form>
</body>

</html>
