<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialInfoEdit.aspx.cs" Inherits="M_Main.Mt.MaterialInfoEdit" %>

<!DOCTYPE html>

<html xmlns="">
<head runat="server">
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
</head>
<body>
    <form id="frmForm" runat="server">
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">物资编码:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox"  data-options="required:true" runat="server" id="Num" value="" name="Num" />
                </td>
                <td class="TdTitle">物资名称:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" runat="server" id="Name" value="" name="Name" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">物资简拼:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" runat="server" id="Spell" value="" name="Spell" />
                </td>
                <td class="TdTitle">物资属性:</td>
                <td class="TdContent">                    
                    <select runat="server" id="Property" data-options="required:true"  name="Property">
                        <option value="" selected="selected">--请选择--</option>
                        <option value="材料">材料</option>
                        <option value="低值易耗品">低值易耗品</option>
                        <option value="固定资产">固定资产</option>
                         <option value="列管资产">列管资产</option>
                         <option value="代管资产">代管资产</option>

                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">物资单位:</td>
                <td class="TdContent">
                    <input type="hidden" name="Unit" id="Unit" runat="server" />
                    <input type="text" name="UnitName" id="UnitName" runat="server" data-options="required:true"  value="" class="easyui-validatebox"/>
                   <%-- <select runat="server" id="Unit" style="border: 1px solid #cccccc;" name="Unit">
                        </select>--%>
                </td>

                <td class="TdTitle">物资品牌:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"  runat="server" id="Brand" value="" name="Brand" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">规格型号:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" runat="server" id="Specification" value="" name="Specification" />
                </td>
                <td class="TdTitle">物资颜色:</td>
                <td class="TdContent">
                    <input type="hidden" name="Color" id="Color" runat="server" />
                    <input type="text" name="ColorName" id="ColorName" runat="server" value="" class="easyui-validatebox"/>
                   <%-- <select runat="server" id="Color" style="border: 1px solid #cccccc;" name="Color">
                        </select>--%>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">序   号:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox"  id="Sort" name="Sort" runat="server"  />
                </td>
                <td class="TdTitle">物资类别:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true"  runat="server" id="TypeCodeValue" value="" name="TypeCodeValue" readonly="readonly" unselectable="on" style="background:#F4F4F4" />
                </td>
            </tr>        
            <tr>
                <td class="TdTitle">物资产地:</td>
                <td class="TdContent">
                    
                    <input type="text" class="easyui-validatebox" runat="server" id="OriginPlace" value="" name="OriginPlace" />
                </td>
                <td class="TdTitle">质保期限:</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" runat="server" id="WarrantyPeriod" 
                        data-options="prompt:'请输入数字',required:true,validType:'positiveint'" value="" name="WarrantyPeriod" />
                </td>
                </tr>
             <tr>
                <td class="TdTitle">物资描述:</td>
                <td class="TdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" runat="server" id="Describe" value="" style="width: 92%;" name="Describe" />
                </td>
               
                </tr>
              <tr>
                <td class="TdTitle">备注:</td>
                <td class="TdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" runat="server" id="Remark" value="" style="width: 92%;" name="Remark" />
                </td>
               
                </tr>
            <tr>
               <td class="TdTitle">是否作废:</td>
                <td>
                     <select runat="server" id="IsVoid" style="border: 1px solid #cccccc;" name="IsVoid">
                                <option  selected="selected" value="0">否</option>
                                <option value="1">是</option>
                              </select>
                </td>
            </tr>
             
            <tr>
                <td class="TdTitle">物资图片:</td>
                <td class="DialogTdContent_4Col" colspan="3" style=" border: #9ff5b8 solid 0px;">
                    <%--<input type="text" class="easyui-validatebox" data-options="required:true" id="Imgs" name="Imgs" runat="server" style="width: 80%;" />--%>
                    <div style="float: left; position: relative" runat="server">
                        <img id="xximg" class="xximg" src="../images/nopicture2.jpg" runat="server" width="100" height="100"/>
                        <%--<input id="add" type="button" class="button abscenter" value="添 加" runat="server" />--%>
                    </div>
                </td>
            </tr>


            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center;">
                    <input type="button" class="button" value="保    存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关   闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <input id="HidOpType" type="hidden" name="HidOpType" runat="server" value="" />
        <%--<input id="Num" type="hidden" name="Num" runat="server" value="" />--%>
        <input type="hidden" id="Typecode" name="TypeCode" runat="server" value="" />
        <input type="hidden" id="Id" name="Id" runat="server" value="" />

        <input id="ImageSave" name='ImageSave' type="hidden" runat="server" style="width:50%"/>
        <input id="Imgs" name='Imgs' type="hidden" runat="server" style="width:50%"/>
        <input id="UpFile" type="file" runat="server" name="UpFile" style="width: 1px; visibility: hidden" accept="image/*" />


        <script type="text/javascript">

            //$("#TypeCodeValue").click(function (e) {
            //    HDialog.Open('500', '500', '../Mt/MaterialType/MaterialTypeDialLog.aspx', '选择类别', true, function callback(_Data) {
            //        if (_Data != '') {
            //            var arrRet = _Data.split(',');
            //            $("#Typecode").val(arrRet[0]);
            //            $("#TypeCodeValue").val(arrRet[1]);
            //            $("#Typecode").val(arrRet[2]);
            //        }
            //    });
            //});


            $("#ColorName").focusout(function (e) {
             
                $.tool.DataPostNoChk('frmForm', 'MaterialBaseHandle', 'GetModel', 'DType=颜色&Name=' + $("#ColorName").val().trim(),
                   function Init() {
                   },
                   function callback(_Data) {
                       var obj = JSON.parse(_Data);
                       if (obj.Result == "True") {                          
                           $("#Color").val(obj.ds[0].Id);
                           $("#ColorName").val(obj.ds[0].Name);
                       } else {
                           HDialog.Info("该颜色不存在");
                           $("#Color").val("");
                           $("#ColorName").val("");
                       }  
                   },
                   function completeCallback() {
                   },
                   function errorCallback() {
                   });
            });


            $("#UnitName").focusout(function (e) {
              
                $.tool.DataPostNoChk('frmForm', 'MaterialBaseHandle', 'GetModel', 'DType=物资单位&Name=' + $("#UnitName").val().trim(),
                   function Init() {
                   },
                   function callback(_Data) {
                       var obj = JSON.parse(_Data);
                       if (obj.Result == "True") {
                           $("#Unit").val(obj.ds[0].Id);
                           $("#UnitName").val(obj.ds[0].Name);
                       } else {
                           HDialog.Info("该单位不存在");
                           $("#Unit").val("");
                           $("#UnitName").val("");
                       }
                   },
                   function completeCallback() {

                   },
                   function errorCallback() {

                   });
            });




            $("#BtnSave").click(function ()
            {
                if ($("#Property").val() == "")
                {
                    HDialog.Info('物资属性不能为空');
                    return;
                }
                $.tool.DataPostChk('frmForm', 'MaterialInfoHandle', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            //HDialog.Info('操作成功');
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



            $("#xximg").dblclick(function () {                
                var ImgUrl = $("#Imgs").val();
                if (ImgUrl != "") {
                    window.open(ImgUrl);
                }
               
            });
            $("#xximg").click(function (e) {
                $("#UpFile").click();
            });
            $("#UpFile").change(function (e) {
                UpLoadFile();
            });
            function getFileName(o) {
                var pos = o.lastIndexOf("\\");
                return o.substring(pos + 1);
            }
            function UpLoadFile() {
                var file = $("#UpFile").val();
                var fileName = getFileName(file);

                var fd = new FormData();
                fd.append("UpFileData", $("#UpFile")[0].files[0]);

                $.tool.pageLoadInfo("上传中，请等待");
                $.ajax({
                    url: "../UpLoad/UpFile.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        $.tool.pageUnLoading();
                        $("#ImageSave").val(addr);

                        if (addr.length > 200) {
                            HDialog.Info('上传失败啦,重新试试吧');
                            return;
                        }
                        else {

                            $("#Imgs").val(addr);
                            $("#xximg").attr("src", addr);
                            $("#add").val("更换");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                        HDialog.Info('上传失败啦,重新试试吧');
                    }
                });
            }





        </script>

    </form>
</body>
</html>
