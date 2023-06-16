<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDConfigSetChargeModeManage.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDConfigSetChargeModeManage" %>

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
                <td class="TdTitle">收费方式</td>
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
                </td>
            </tr> 
             
            <tr>
                <td class="TdTitle">科目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="AccSubjName" data-options="editable:false" 
                    searcher="SelSubj" type="text"  name="AccSubjName" runat="server" />
                         <input type="hidden" id="hiAccSubjName" name="hiAccSubjName" runat="server" />
                         <input type="hidden" id="AccSubjCode" name="AccSubjCode" runat="server" />
                    <INPUT id="btnClearAccSubj" onclick="javascript:btnClearAccSubj_OnClick();"
						type="button" value="清空" name="btnClearAccSubj" runat="server">
                </td>
            </tr>  
             <tr>
                <td class="TdTitle">手续费</td>
                <td class="TdContent" colspan="3"><input id="TaxRate"
                    type="text"  name="TaxRate" runat="server" />                        
                </td>
            </tr>
            <tr>
                <td class="TdTitle">科目(手续费)</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="TaxAccSubjName" data-options="editable:false" 
                    searcher="SelTaxSubj" type="text"  name="TaxAccSubjName" runat="server" />
                         <input type="hidden" id="hiTaxAccSubjName" name="hiTaxAccSubjName" runat="server" />
                         <input type="hidden" id="TaxAccSubjCode" name="TaxAccSubjCode" runat="server" />
                    <INPUT id="btnClearTaxAccSubj" onclick="javascript:btnClearTaxAccSubj_OnClick();"
						type="button" value="清空" name="btnClearTaxAccSubj" runat="server">
                </td>
            </tr>
             <tr>
                <td class="TdTitle">银行账户</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="BankAccountName" data-options="editable:false" 
                    searcher="SelBankAccount" type="text"  name="BankAccountName" runat="server" />
                         <input type="hidden" id="hiBankAccountName" name="hiBankAccountName" runat="server" />
                         <input type="hidden" id="BankAccountCode" name="BankAccountCode" runat="server" />
                    <INPUT id="btnClearBankAccount" onclick="javascript:btnClearBankAccount_OnClick();"
						type="button" value="清空" name="btnClearBankAccount" runat="server">
                </td>
            </tr> 
            <%-- <tr>
                <td class="TdTitle">现金账户</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CashAccountName" data-options="editable:false" 
                    searcher="SelCashAccount" type="text"  name="CashAccountName" runat="server" />
                         <input type="hidden" id="hiCashAccountName" name="hiCashAccountName" runat="server" />
                         <input type="hidden" id="CashAccountCode" name="CashAccountCode" runat="server" />
                </td>
            </tr>--%>
            <tr>
                <td class="TdTitle">内部公司</td>
                <td class="TdContent"><input class="easyui-searchbox" id="UFCorpName" data-options="editable:false" 
                    searcher="SelUFCorp" type="text"  name="UFCorpName" runat="server" />
                         <input type="hidden" id="hiUFCorpName" name="hiUFCorpName" runat="server" />
                         <input type="hidden" id="UFCorpCode" name="UFCorpCode" runat="server" />
                    <INPUT id="btnClearUFCorp" onclick="javascript:btnClearUFCorp_OnClick();"
						type="button" value="清空" name="btnClearUFCorp" runat="server">
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

                $.tool.DataPostChk('frmForm', 'UFJDConfigChargeMode', "add", $('#frmForm').serialize(),
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
                
                HDialog.Open('800', '600', '../DialogNew/UFJDChargeModeDlg.aspx' + '?Ram=' + Math.random(), '选择结算方式', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#ChargeModeCode').val(Obj.ChargeModeCode);
                        $('#ChargeModeName').searchbox("setValue", Obj.ChargeModeName);
                        $('#hiChargeModeName').val(Obj.ChargeModeName);

                        return true;
                    }
                });

                return false;
            }
            

            function SelSubj() {
               
                HDialog.Open('800', '600', '../DialogNew/UFJDAccSubjDlg.aspx' + '?Ram=' + Math.random(), '选择科目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#AccSubjCode').val(Obj.SubjCode);
                        $('#AccSubjName').searchbox("setValue", Obj.SubjName);
                        $('#hiAccSubjName').val(Obj.SubjName);

                        return true;
                    }
                });

                return false;
            }

            
            function SelTaxSubj() {
               
                HDialog.Open('800', '600', '../DialogNew/UFJDAccSubjDlg.aspx' + '?Ram=' + Math.random(), '选择科目(手续费)', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                                                
                        $('#TaxAccSubjCode').val(Obj.SubjCode);
                        $('#TaxAccSubjName').searchbox("setValue", Obj.SubjName);
                        $('#hiTaxAccSubjName').val(Obj.SubjName);

                        return true;
                    }
                });

                return false;
            }

            
            function SelBankAccount() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDBankAccountDlg.aspx' +  '?Ram=' + Math.random(), '选择银行账户', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#BankAccountCode').val(Obj.BankAccountCode);
                        $('#BankAccountName').searchbox("setValue", Obj.BankAccountName);
                        $('#hiBankAccountName').val(Obj.BankAccountName);

                        return true;
                    }
                });

                return false;
            }

            function SelUFCorp() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCorpDlg.aspx' +  '?Ram=' + Math.random(), '选择内部公司', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#UFCorpCode').val(Obj.UFCorpCode);
                        $('#UFCorpName').searchbox("setValue", Obj.UFCorpName);
                        $('#hiUFCorpName').val(Obj.UFCorpName);

                        return true;
                    }
                });

                return false;
            }

            
            //function SelCashAccount() {
                
            //    HDialog.Open('800', '600', '../DialogNew/UFJDCashAccountDlg.aspx' +  '?Ram=' + Math.random(), '选择现金账户', true, function callback(_Data) {

            //        if (_Data != "") {
            //            var Obj = JSON.parse(_Data);
                        
            //            $('#CashAccountCode').val(Obj.CashAccountCode);
            //            $('#CashAccountName').searchbox("setValue", Obj.CashAccountName);
            //            $('#hiCashAccountName').val(Obj.CashAccountName);

            //            return true;
            //        }
            //    });

            //    return false;
            //}

            function btnClearAccSubj_OnClick()
            {
                $('#AccSubjCode').val("");
                $('#AccSubjName').searchbox("setValue", "");
                $('#hiAccSubjName').val("");
            }

            function btnClearTaxAccSubj_OnClick()
            {
                $('#TaxAccSubjCode').val("");
                $('#TaxAccSubjName').searchbox("setValue", "");
                $('#hiTaxAccSubjName').val("");
            }

            function btnClearBankAccount_OnClick()
            {
                $('#BankAccountCode').val("");
                $('#BankAccountName').searchbox("setValue", "");
                $('#hiBankAccountName').val("");
            }

             function btnClearUFCorp_OnClick()
            {
                $('#UFCorpCode').val("");
                $('#UFCorpName').searchbox("setValue", "");
                $('#hiUFCorpName').val("");
            }
        </script>
    </form>
</body>
</html>
