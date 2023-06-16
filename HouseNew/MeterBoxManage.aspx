<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeterBoxManage.aspx.cs" Inherits="M_Main.HouseNew.MeterBoxManage" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>MeterBoxManage</title>
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
    <script type="text/javascript">
		<!--	
        function CheckData() {  
            if (MeterBoxManage.MeterBoxName.value == "") {
            HDialog.Info("请输入表计名称,此项不能为空!");
            MeterBoxManage.MeterBoxName.focus();
            return false;
        } 
        return true; 
    }
          
    </script>
</head>
<body style="overflow-y:auto">
    <form id="MeterBoxManage" method="post" runat="server">

        <table class="DialogTable" id="Table1" style="width: 100%">
            <tr>
                <td align="center" colspan="4" style="height: 22px; background-color: #e6e6e6"> 
                    <input id="hiOPType" type="hidden" name="hiOPType" runat="server" size="1" />
                    <input id="ScopIDs" type="hidden" name="ScopIDs" runat="server" size="1" />
                    <input id="CommID" type="hidden" name="CommID" runat="server" size="1" />
                    <input id="MeterBoxID" type="hidden" name="MeteMeterBoxIDrID" runat="server" size="1" />
                    <input id="MeterSign" type="hidden" size="1" name="MeterSign" runat="server" />
                    <input id="PageIndex" type="hidden" size="1" name="PageIndex" runat="server" />
                    <input id="SelReturn" type="hidden" size="1" name="SelReturn" runat="server" />
                    <input type="hidden" id="SelAll" name="SelAll" runat="server" /> 
                    <input id="BuildSNums"  type="hidden"
            size="1" name="BuildSNums" runat="server"/>
                   <input  id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" /> 
                    <input id="ScopeNum" style="width: 24px; height: 22px" type="hidden" size="1" name="ScopeNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">序号</td>
                <td class="TdContent">
                    <input id="MeterBoxNum"  maxlength="20"  size="10" name="MeterBoxNum" runat="server" data-options="required:true" /> 
                </td> 
            </tr>
                <tr> 
                  <td class="TdTitle">表箱名称</td>
                <td class="TdContent"> <input id="MeterBoxName" class="easyui-validatebox" data-options="required:true" name="MeterBoxName" runat="server"></td> 
            </tr>
           
            <tr>
                <td class="TdTitle">表箱类型</td>
                <td class="TdContent">
                    <select id="MeterBoxType" name="MeterBoxType" runat="server" style="width: 100px" onchange="MeterTypeChange();">
                        <option selected></option>
                    </select></td>
                <input type="hidden" id="hiMeterBoxType" name="hiMeterBoxType" runat="server" /> 
            </tr> 
             
            <tr>
                <td class="TdTitle">表箱位置</td>
                <td class="TdContent">
                   <input id="MeterBoxAddress"  name="MeterBoxAddress" runat="server" />
                </td> 
            </tr>
 
     
        </table>
        <table class="DialogTable" id="Table2" style="width: 100%">
            <tr>
                <td style="width: 100%" valign="top" colspan="4">
                    <div class="SearchContainer" id="TableContainer" style="height: 100%; width: 100%">
                    </div>
                </td>
            </tr>
        </table>
        <table class="DialogTable" id="Table3" style="width: 100%">
            <tr>
                <td class="DialogTdSubmit" align="center" colspan="3">
              
                    <input id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnSave" runat="server" class="button"  style="float: left;margin-right: 10px;margin-left:112px;"/> 
					<input id="btnReturn" type="button" value="关闭" name="btnReturn"
                        runat="server" class="button" style="float: left;margin-right: 10px;"/> 
                           <input type="button" class="button" value="查看二维码" id="BtnGetQrImg" onclick="QrImages();" style=" float: left;margin-right: 10px;display: none;" />
                                  <input type="button" class="button" value="生成二维码" id="btnEQ"  style="float: left;margin-right: 10px;"/>  
                          
                     <input type="hidden" name="MeterBoxEQCodesPath" id="MeterBoxEQCodesPath" value="" runat="server"  />   
                </td> 
            </tr>
        </table>

           
         
        <script type="text/javascript">
            function init() {
                var strcpath = $("#MeterBoxEQCodesPath").val();
                if (strcpath != "") {
                 //   $("#BtnGetQrImg").css("display", "block");
                //    $("#btnEQ").css("display", "none"); 

                    document.getElementById("btnEQ").style.display = "none";
                    document.getElementById("BtnGetQrImg").style.display = "block";
                }
            }
            init();
            function MeterTypeChange() {  
                //$('#hiMeterBoxType').val($("#MeterBoxType").find("option:selected").value);
                $('#hiMeterBoxType').val($("#MeterBoxType").val());
            }
            MeterTypeChange();
            $('#btnSave').click(function () {
                //alert("aa:" + $("#hiMeterBoxType").val());
                //return false;
                var hiOPType= $("#hiOPType").val();
                var cmd = "MeterBoxInsert";
                if (hiOPType == "edit")
                {
                    cmd = "MeterBoxUpdate";
                }
                $.tool.DataPostChk('MeterBoxManage', 'Meter', cmd, $('#MeterBoxManage').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data;

                        if (r == "true") {
                            HDialog.Info('操作成功!');
                            HDialog.Close();
                        }
                        else {
                            HDialog.Info('操作失败!');
                        }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });
            $('#btnReturn').click(function () {
                HDialog.Close();
            });

            $('#btnEQ').click(function () {
                 //生成二维码
                QrSave();
            });


            //二维码
            function QrSave() {
                var str = " <%=GetQrURL()%>";
                if (str != "" && str != null) {
                    HDialog.Info("二维码生成成功"); 
                    document.getElementById("btnEQ").style.display = "none";
                    document.getElementById("BtnGetQrImg").style.display = "block";
                } 
               var obj = str.split('|');
               $("#MeterBoxEQCodesPath").val(obj[0]);
 
            }
            //查看二维码
            function QrImages() {
                var imgUrl = $("#MeterBoxEQCodesPath").val();
                if (imgUrl == "" || imgUrl == null || imgUrl == undefined) {
                    HDialog.Info("请先生成二维码");
                    return;
                }
                HDialog.Open('500', '390', '../EquipmentNew/QrImgMeterBox.aspx?QrImg=' + imgUrl , '查看二维码', true, function callback(_Data) {
                });
            }
        </script>
    </form>
</body>
</html>
