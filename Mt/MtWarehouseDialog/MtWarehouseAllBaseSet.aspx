<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MtWarehouseAllBaseSet.aspx.cs" Inherits="M_Main.Mt.MtWarehouseDialog.MtWarehouseAllBaseSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script language="javascript" src="../../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet" />
      <script src="../../jscript/format.js" type="text/javascript"></script>
     <script type="text/javascript" src="../../Jscript/json2.js"></script>
    <script type="text/javascript" src="../../Jscript/Guid.js"></script>
    <script src="../../jscript/Taxes.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
      <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../../css/button.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
    <div>    
                <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                    <tr style="height:80px;">
                        <td class="TdTitle"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SelWarehouse()">选择仓库</a></td>
                        <td class="TdContent" colspan="2">
                            <input type="hidden" value=""  id="WarehouseIdS" name="WarehouseIdS" />
                            
                            <textarea maxlength="5000" style="font-size:12px;height:102px; width:90%;resize: none;" readonly="readonly" id="WarehouseIdName" class="easyui-validatebox"></textarea>
                        </td>
                        <td class="TdTitle"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="SelMMaterial()">选择物资</a></td>
                        <td class="TdContent" colspan="2">
                            <input type="hidden" value="" id="MaterialIdS" name="MaterialIdS" />
                            
                            <textarea maxlength="5000" style="font-size:12px; height:102px;width:90%;resize: none;" readonly="readonly" id="MaterialIdName" ></textarea>
                        </td>                       
                    </tr>
                    
                    <tr>
                        <td class="TdTitle">安全库存:</td>
                        <td class="TdContent">
                            <input name="SafeCount" type="text" id="SafeCount"   class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">税率:</td>
                        <td class="TdContent">
                            <input name="Taxes" type="text" id="Taxes"  class="easyui-numberbox" precision="4" style="width:80%" />
                        </td>
                        <td class="TdTitle">采购方式:</td>
                        <td class="TdContent">
                           <select name="BuyMethod" id="BuyMethod">
                                <option selected="selected" value="统购">统购</option>
                                <option value="自购">自购</option>                                
                            </select>
                        </td>
                    </tr> 
                    <tr><td colspan="6">&nbsp;</td></tr>                 
                    <tr>
                        <td colspan="6" align="center">
                            <a href="#" class="button" data-options="iconCls:'icon-save'" onclick="Save();">确 定</a>                         
                        </td>
                    </tr>
                </table>           
    </div>

        <script type="text/javascript">

            //选择仓库
            function SelWarehouse() {
                HDialog.Open(300, 500, '../DialogNew/SelWareHouses.aspx', '仓库选择', true, function callback(_Data) {
                    $("#WarehouseIdName").text("");
                    $("#WarehouseIdS").val("");
                var Obj = JSON.parse(_Data);
                var _n='';
                var _Id='';
                for(var i=0;i<Obj.length;i++)
                {
                    _n = _n + Obj[i].text+",";
                    _Id = _Id + Obj[i].attributes.Id+",";
                }
                if (_n != '') _n = _n.substr(0, _n.length - 1);
                if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                $("#WarehouseIdName").text(_n);
                $("#WarehouseIdS").val(_Id);
            });
            }

            //选择物资
            function SelMMaterial() {
                var h = $(parent.window).height()*0.8;
                var w = $(parent.window).width()*0.8;
                HDialog.Open(w, h, '../Mt/PurchaseDialog/MaterialSelFrame.aspx', '选择物资', true, function callback(_Data) {
                    $("#MaterialIdName").text("");
                    $("#MaterialIdS").val("");
                    var Obj = JSON.parse(_Data);
                    
                    var _n = '';
                    var _Id = '';
                    var n = '';
                    for (var i = 0; i < Obj.length; i++) {
                       
                        if (i>0) {
                            if (CheckRepeat(Obj[i].Name, _n)) {
                                _n = _n + Obj[i].Name + ",";
                                _Id = _Id + Obj[i].Id + ",";
                            }
                        } else {
                            _n = _n + Obj[i].Name + ",";
                            _Id = _Id + Obj[i].Id + ",";
                        } 
                    }
                    if (_n != '') _n = _n.substr(0, _n.length - 1);
                    if (_Id != '') _Id = _Id.substr(0, _Id.length - 1);
                    $("#MaterialIdName").text(_n);
                    $("#MaterialIdS").val(_Id);
                });
            }
            //重复物资检测
            function CheckRepeat(name, strs) {
                var bl = true;
                for (var i = 0; i <strs.split(',').length; i++) {
                    if (strs.split(',')[i] == name) {
                        bl = false;
                    }
                }
                return bl;
            }

            function CheckValues(obj) {

                obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符  

                obj.value = obj.value.replace(/^\./g, "");  //验证第一个字符是数字而不是. 

                obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的.   

                obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");

                var reg = new RegExp("^0\.[0-9]*[1-9]0*$");
                if (!reg.test(obj.value)) {
                    $.messager.alert("提示", "请输入数字!");
                    document.getElementById(obj.id).value = "";
                }

                //if (parseFloat( $("#Taxes").val())>1) {
                //    $("#Taxes").val("1");
                //}
            }

            //保存
            function Save() {
                $.tool.DataPost('MtWarehouseManager', 'InsertAllWarehouseMaterial', $("#frmForm").serialize(),
                           function Init() {
                           },
                           function callback(_Data) {
                               
                               if (_Data == "true") {
                                   HDialog.Close("1");
                               }
                           },
                           function completeCallback() {
                           },
                           function errorCallback() {
                           });                

            }
        </script>


    </form>
</body>
</html>
