<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UFJDConfigSet_JinWei_CustManage.aspx.cs" Inherits="M_Main.UFJDVoucher.UFJDConfigSet_JinWei_CustManage" %>

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
                <td class="TdTitle">管理项目</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="CommName" searcher="SelComm"  data-options="editable:false,readonly:true"  name="CommName" runat="server">                        
                        <input id="hiCommID"  type="hidden" name="hiCommID" runat="server">
                        <input id="hiCommName"  type="hidden" name="hiCommName" runat="server">
                </td>                
            </tr>
            <tr>
                <td class="TdTitle">客户名称</td>
                <td class="TdContent" colspan="3"> <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" searcher="SelCust" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>
            </tr>              
            <tr> 
                <td class="TdTitle">客商名称</td>
                <td class="TdContent" colspan="3"><input class="easyui-searchbox" id="UFCustName" data-options="editable:false" 
                    searcher="SelUFCust" type="text"  name="UFCustName" runat="server" />
                         <input type="hidden" id="hiUFCustName" name="hiUFCustName" runat="server" />
                         <input type="hidden" id="UFCustCode" name="UFCustCode" runat="server" />
                    <INPUT id="btnClearUFCust" onclick="javascript:btnClearUFCust_OnClick();"
						type="button" value="清空" name="btnClearUFCust" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">公司编码</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="UFCorpCode" name="UFCorpCode" runat="server">
                </td>
                <td class="TdTitle">地区分类编码</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="AreaclCode" name="AreaclCode" runat="server">
                </td> 
            </tr>
             <tr>
                <td class="TdTitle">客商类型</td>
                <td class="TdContent"><SELECT id="CustProp" name="CustProp" runat="server">
                        <OPTION value="0">外部单位</OPTION>
                        <OPTION value="1">内部核算单位</OPTION>
                        <OPTION value="2">内部法人单位</OPTION>
                        <OPTION value="3">内部渠道成员</OPTION>
					</SELECT>
                </td>
                <td class="TdTitle">客商属性</td>
                <td class="TdContent"><SELECT id="CustType" name="CustType" runat="server">
                        <OPTION value="0">客户</OPTION>
                        <OPTION value="1">供应商</OPTION>
                        <OPTION value="2">客商</OPTION>
					</SELECT>
                </td>
            </tr>            
            <tr>
                <td class="TdTitle">内部客商编码</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="UFCorp1Code" name="UFCorp1Code" runat="server">
                </td>
                <td class="TdTitle">组织机构代码</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="OrgCode" name="OrgCode" runat="server">
                </td> 
            </tr>
            <tr>
                <td class="TdTitle">纳税人登记号</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="TaxPayerID" name="TaxPayerID" runat="server">
                </td> 
                <td class="TdTitle">法人</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="LegalBody" name="LegalBody" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">通信地址</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="ConAddr" name="ConAddr" runat="server">
                </td>
                <td class="TdTitle">电话</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="Phone1" name="Phone1" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">联系人</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="LinkMan1" name="LinkMan1" runat="server">
                </td>
                <td class="TdTitle">联系人手机</td>
                <td class="TdContent"><INPUT class="easyui-validatebox"  id="MobilePhone1" name="MobilePhone1" runat="server">
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

                $.tool.DataPostChk('frmForm', 'UFJDConfig_JinWei_Cust', "add", $('#frmForm').serialize(),
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

            function SelComm() {

                $('#CommName').searchbox("setValue", '');
                $('#hiCommID').val('');
                $('#hiCommName').val('');

                var conent = "../DialogNew/CommDlg.aspx";

                HDialog.Open(650, 430, conent, '项目选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CommName').searchbox("setValue", data.text);

                    $('#hiCommID').val(data.attributes.InPopedom);
                    $('#hiCommName').val(data.text);
                });
            }


            function SelCust() {
                var vCommID = $('#hiCommID').val();

                if (vCommID == "")
                {
                    HDialog.Info('请选择管理项目！');
                    return
                }                

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
              
                var conent = "../DialogNew/CustDlg.aspx" + "?CommID=" + vCommID;
                var w = 800;
                var h = 600;

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                });
            }

            function SelUFCust() {

                HDialog.Open('800', '600', '../DialogNew/UFJDCustDlg.aspx' + '?Ram=' + Math.random(), '选择客商', true, function callback(_Data) {

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
            
            function btnClearUFCust_OnClick()
            {
                $('#UFCustCode').val("");
                $('#UFCustName').searchbox("setValue", "");
                $('#hiUFCustName').val("");
            }
            
        </script>
    </form>
</body>
</html>
