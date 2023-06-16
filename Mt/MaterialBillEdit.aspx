<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialBillEdit.aspx.cs" Inherits="M_Main.Mt.MaterialBillEdit" %>

<!DOCTYPE html>

<html xmlns="">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="HidOpType" type="hidden" name="HidOpType" runat="server" value="" />
        <input id="Id" type="hidden" name="Id" runat="server" />
    <table class="DialogTable">
           <tr>
                    <td class="TdTitle">发票号：</td>
                    <td class="TdContent">
                       <input type="text" class="easyui-validatebox" data-options="required:false" runat="server" id="BillNum" value="" name="BillNum" />
                    </td>
                    <td class="TdTitle">发票日期：</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" data-options="required:true" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" id="BillDate" value="" name="BillDate" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">供方单位：</td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" data-options="required:true" runat="server" id="SupplierName" value="" name="SupplierName" />
                    </td>
               
                     <td class="TdTitle">入库单号：</td>
                    <td class="TdContent">
                        <input id="StorageName" name="StorageName"  runat="server" style="width: 150px;" runat="server" class="easyui-searchbox " searcher="SelLastDep" />
                        <input type="hidden"  id="StorageId"  runat="server" value="" name="StorageId" />
                    </td>
                     </tr>
                <tr>
                    <td class="TdTitle">发票金额：</td>
                    <td class="TdContent">
                       <input type="text" class="easyui-validatebox" data-options="required:true" runat="server" id="BillPrice" value="" name="BillPrice" />(元)
                    </td>
                     <td class="TdTitle">金额类型：</td>
                    <td class="TdContent">                        
                        <select id="AmountType"  runat="server" name="AmountType">
                            <option value="" selected="selected"></option>
                            <option value="预估" style="color: #000000;">预估</option>
                            <option value="实开" style="color: #000000;" >实开</option>
                        </select>
                    </td>                   
                </tr>
        <tr>
            <td class="TdTitle">是否付款：</td>
                    <td class="TdContent">                        
                        <select id="IsPayment"  runat="server" name="IsPayment">
                            <option value="0" style="color: #000000;">是</option>
                            <option value="1" style="color: #000000;" selected="selected">否</option>
                        </select>
                    </td>      
        </tr>
        <tr>
             <td class="TdTitle">备注:</td>
                <td class="TdContent" colspan="3">
                    <textarea class="easyui-validatebox" style="height: 52px; width: 98%" runat="server" id="Memo" name="Memo"></textarea>
                </td>
        </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            <tr>
                <td colspan="4" style="text-align: center;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>

        <script type="text/javascript">

            $("#BtnSave").click(function ()
            {
                
                if ($("#BillDate").val() == "") {
                    HDialog.Info('发票日期不能为空');
                    return;
                }
                if ($("#SupplierName").val() == "") {
                    HDialog.Info('供方单位不能为空');
                    return;
                }
                if ($("#StorageId").val() == "") {
                    HDialog.Info('入库单号不能为空');
                    return;
                }
                if ($("#BillPrice").val() == "") {
                    HDialog.Info('发票金额不能为空');
                    return;
                }
                
                $.tool.DataPostChk('frmForm', 'ReceiptRevoke', 'SaveBill', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('操作成功');
                            HDialog.Close('1');
                        } else {
                            HDialog.Info(_Data);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });


            //入库单
            function SelLastDep() {
                //var w = $(window).width();
                //var h = $(window).height();
                HDialog.Open(800, 600, '../Mt/StorageDialog/StorageList.aspx', '选择入库单', false, function callback(_Data) {
                    
                    //$("#StorageId").val(row.Id);
                    //$("#StorageName").searchbox("setValue", row.ReceiptSign);




                    $("#StorageName").text("setValue","");
                    $("#StorageId").val("");
                    var Obj = JSON.parse(_Data);

                    var _n = '';
                    var _Id = '';
                    for (var i = 0; i < Obj.length; i++) {
                        _n = _n + Obj[i].ReceiptSign + ",";
                        _Id = _Id + Obj[i].Id + ",";
                    }
                    if (_n != '') _n = _n.substr(0, _n.length - 1);
                    if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                    $("#StorageName").searchbox("setValue", _n);
                    $("#StorageId").val(_Id);


                });
            }


        </script>
    </form>
</body>
</html>
