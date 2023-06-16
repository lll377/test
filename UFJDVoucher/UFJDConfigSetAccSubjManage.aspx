<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDConfigSetAccSubjManage.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDConfigSetAccSubjManage" %>

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
        <table class="DialogTable" border="0" style="line-height:23px;height:23px;">
           <tr>
                <td class="TdTitle">类别</td>
                <td class="TdContent" colspan="3">
                   <SELECT id="SubjectSetType" name="SubjectSetType" runat="server">
                        <option value="17">应收账款</option>
                        <option value="18">业务收入</option>
                        <OPTION value="1">收款</OPTION>
                        <OPTION value="14">预收</OPTION>
                        <OPTION value="4">预存费用</OPTION>
                        <option value="5">预交冲抵</option>
                        <option value="3">合同违约金</option>
                        <OPTION value="9">退款</OPTION>
                        <OPTION value="10">预交退款</OPTION>
                        <option value="12">合同违约金退款</option>
					</SELECT>
                </td>
             </tr>
            <tr>
                <td class="TdTitle">费用项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CostName" 
                    searcher="SelCost" type="text"  name="CostName" runat="server" />
                         <input type="hidden" id="hiCostName" name="hiCostName" runat="server" />
                         <input type="hidden" id="CorpCostID" name="CorpCostID" runat="server" />
                         <input type="hidden" id="CostCode"  name="CostCode" runat="server" />
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
                <td class="TdTitle">税率</td>
                <td class="TdContent" colspan="3"><input id="TaxRate"
                    type="text"  name="TaxRate" runat="server" />                        
                </td>
            </tr>
            <tr>
                <td class="TdTitle">科目(税)</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="TaxAccSubjName" data-options="editable:false" 
                    searcher="SelTaxSubj" type="text"  name="TaxAccSubjName" runat="server" />
                         <input type="hidden" id="hiTaxAccSubjName" name="hiTaxAccSubjName" runat="server" />
                         <input type="hidden" id="TaxAccSubjCode" name="TaxAccSubjCode" runat="server" />
                    <INPUT id="btnClearTaxAccSubj" onclick="javascript:btnClearTaxAccSubj_OnClick();"
						type="button" value="清空" name="btnClearTaxAccSubj" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">现金流量(主表)</td>
                <td class="TdContent"><input class="easyui-searchbox" id="CashFlowName" data-options="editable:false" 
                    searcher="SelCashFlow" type="text"  name="CashFlowName" runat="server" />
                         <input type="hidden" id="hiCashFlowName" name="hiCashFlowName" runat="server" />
                         <input type="hidden" id="CashFlowCode" name="CashFlowCode" runat="server" />
                    <INPUT id="btnClearCashFlow" onclick="javascript:btnClearCashFlow_OnClick();"
						type="button" value="清空" name="btnClearCashFlow" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">现金流量(附表)</td>
                <td class="TdContent"><input class="easyui-searchbox" id="CashFlow2Name" data-options="editable:false" 
                    searcher="SelCashFlow2" type="text"  name="CashFlow2Name" runat="server" />
                         <input type="hidden" id="hiCashFlow2Name" name="hiCashFlow2Name" runat="server" />
                         <input type="hidden" id="CashFlow2Code" name="CashFlow2Code" runat="server" />
                    <INPUT id="btnClearCashFlow2" onclick="javascript:btnClearCashFlow2_OnClick();"
						type="button" value="清空" name="btnClearCashFlow2" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">项目档案</td>
                <td class="TdContent"><input class="easyui-searchbox" id="FitemssName" data-options="editable:false" 
                    searcher="SelFitemss" type="text"  name="FitemssName" runat="server" />
                         <input type="hidden" id="hiFitemssName" name="hiFitemssName" runat="server" />
                         <input type="hidden" id="FitemssCode" name="FitemssCode" runat="server" />
                    <INPUT id="btnClearFitemss" onclick="javascript:btnClearFitemss_OnClick();"
						type="button" value="清空" name="btnClearFitemss" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户</td>
                <td class="TdContent"><input class="easyui-searchbox" id="UFCustName" data-options="editable:false" 
                    searcher="SelUFCust" type="text"  name="UFCustName" runat="server" />
                         <input type="hidden" id="hiUFCustName" name="hiUFCustName" runat="server" />
                         <input type="hidden" id="UFCustCode" name="UFCustCode" runat="server" />
                    <INPUT id="btnClearUFCust" onclick="javascript:btnClearUFCust_OnClick();"
						type="button" value="清空" name="btnClearUFCust" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">部门</td>
                <td class="TdContent"><input class="easyui-searchbox" id="UFDepName" data-options="editable:false" 
                    searcher="SelUFDep" type="text"  name="UFDepName" runat="server" />
                         <input type="hidden" id="hiUFDepName" name="hiUFDepName" runat="server" />
                         <input type="hidden" id="UFDepCode" name="UFDepCode" runat="server" />
                    <INPUT id="btnClearUFDep" onclick="javascript:btnClearUFDep_OnClick();"
						type="button" value="清空" name="btnClearUFDep" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">公司</td>
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
           
                $.tool.DataPostChk('frmForm', 'UFJDConfigAccSubj', "add", $('#frmForm').serialize(),
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

            function SelCost() {
                HDialog.Open('800', '600', '../DialogNew/CorpCostDlg.aspx', '选择费用项目', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        $("#CorpCostID").val(Obj.attributes.CorpCostID);
                        $("#CostCode").val(Obj.attributes.CostCode);
                        $("#CostName").searchbox("setValue", Obj.text);
                        $('#hiCostName').val(Obj.text);

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
               
                HDialog.Open('800', '600', '../DialogNew/UFJDAccSubjDlg.aspx' + '?Ram=' + Math.random(), '选择科目(税)', true, function callback(_Data) {

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

            function SelCashFlow() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCashFlowDlg.aspx' +  '?Ram=' + Math.random(), '选择现金流量', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#CashFlowCode').val(Obj.CashFlowCode);
                        $('#CashFlowName').searchbox("setValue", Obj.CashFlowName);
                        $('#hiCashFlowName').val(Obj.CashFlowName);

                        return true;
                    }
                });

                return false;
            }

            function SelCashFlow2() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCashFlowDlg.aspx' +  '?Ram=' + Math.random(), '选择现金流量', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#CashFlow2Code').val(Obj.CashFlowCode);
                        $('#CashFlow2Name').searchbox("setValue", Obj.CashFlowName);
                        $('#hiCashFlow2Name').val(Obj.CashFlowName);

                        return true;
                    }
                });

                return false;
            }

            function SelFitemss() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDFitemssDlg.aspx' + '?Ram=' + Math.random(), '选择项目档案', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#FitemssCode').val(Obj.FitemssCode);
                        $('#FitemssName').searchbox("setValue", Obj.FitemssName);
                        $('#hiFitemssName').val(Obj.FitemssName);

                        return true;
                    }
                });

                return false;
            }

            function SelUFCust() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCustDlg.aspx' + '?Ram=' + Math.random(), '选择客户', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#UFCustCode').val(Obj.CustCode);
                        $('#UFCustName').searchbox("setValue", Obj.CustName);
                        $('#hiUFCustName').val(Obj.CustName);

                        return true;
                    }
                });

                return false;
            }

            function SelUFDep() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDDeptDlg.aspx' +  '?Ram=' + Math.random(), '选择部门', true, function callback(_Data) {

                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        
                        $('#UFDepCode').val(Obj.DepCode);
                        $('#UFDepName').searchbox("setValue", Obj.DepName);
                        $('#hiUFDepName').val(Obj.DepName);

                        return true;
                    }
                });

                return false;
            }

            function SelUFCorp() {
                
                HDialog.Open('800', '600', '../DialogNew/UFJDCorpDlg.aspx' +  '?Ram=' + Math.random(), '选择公司', true, function callback(_Data) {

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

            function btnClearCashFlow_OnClick()
            {
                $('#CashFlowCode').val("");
                $('#CashFlowName').searchbox("setValue", "");
                $('#hiCashFlowName').val("");
            }

            function btnClearCashFlow2_OnClick()
            {
                $('#CashFlow2Code').val("");
                $('#CashFlow2Name').searchbox("setValue", "");
                $('#hiCashFlow2Name').val("");                
            }

            function btnClearFitemss_OnClick()
            {
                $('#FitemssCode').val("");
                $('#FitemssName').searchbox("setValue", "");
                $('#hiFitemssName').val("");  
            }

            function btnClearUFCust_OnClick()
            {
                $('#UFCustCode').val("");
                $('#UFCustName').searchbox("setValue", "");
                $('#hiUFCustName').val("");
            }

            function btnClearUFDep_OnClick()
            {
                $('#UFDepCode').val("");
                $('#UFDepName').searchbox("setValue", "");
                $('#hiUFDepName').val("");
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
