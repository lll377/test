<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LJTH_NCConfigSetChargeModeRefundManage.aspx.cs" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCConfigSetChargeModeRefundManage" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="ConfigID" type="hidden" name="ConfigID" runat="server" />
        <input id="ChargeMode" type="hidden" name="ChargeMode" runat="server" />
        <table class="DialogTable" border="0" style="line-height:23px;height:23px;">           
            <tr>
                <td class="TdTitle">退费方式</td>
                <td class="TdContent" colspan="3"><SELECT id="SelChargeMode" name="SelChargeMode" runat="server">
													<OPTION selected></OPTION>
												</SELECT>
                </td>
            </tr>           
            <tr> 
                <td class="TdTitle">结算方式</td>
                <td class="TdContent"><input class="easyui-searchbox" id="ChargeModeName" data-options="editable:false" 
                    searcher="SelChargeMode" type="text"  name="ChargeModeName" runat="server" />
                    <input type="hidden" id="hiChargeModeName" name="hiChargeModeName" runat="server" />
                    <input type="hidden" id="ChargeModeCode" name="ChargeModeCode" runat="server" />
                    <input type="hidden" id="ChargeModeID" name="ChargeModeID" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center; padding-top: 15px;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            $("#BtnSave").click(function () {
                var cmd = $("#hiOPType").val();

                var strChargeMode = $("#SelChargeMode").find("option:selected").text();

                $("#ChargeMode").val(strChargeMode);

                $.tool.DataPostChk('frmForm', 'LJTH_NCConfigChargeModeRefund', "add", $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        parent.layer.alert('保存成功');
                        HDialog.Close("true");                        
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
            });
            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                HDialog.Close('');
            }
            
            function SelChargeMode() {
                
                HDialog.Open('800', '600', '../DialogNew/UFLJTH_NCChargeModeDlg.aspx' + '?Ram=' + Math.random(), '选择结算方式', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);

                        $('#ChargeModeID').val(Obj.ChargeModeID);
                        $('#ChargeModeCode').val(Obj.ChargeModeCode);
                        $('#ChargeModeName').searchbox("setValue", Obj.ChargeModeName);
                        $('#hiChargeModeName').val(Obj.ChargeModeName);

                        return true;
                    }
                });

                return false;
            }

        </script>
    </form>
</body>
</html>
