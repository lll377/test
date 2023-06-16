<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChargesHistoricalPaymentSettingsDetail.aspx.cs" Inherits="M_Main.ChargesNew.ChargesHistoricalPaymentSettingsDetail" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增捆绑信息</title>
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

</head>
<body>
    <form id="frmForm" runat="server">
    <table class="DialogTable">
         <tr><td  style="height:2px;"></td></tr>
        <tr>
            <td class="DialogTdTitle">
                序号
            </td>
            <td class="DialogTdContent">
                <input type="text" class="easyui-validatebox" data-options="required:true,validType:'digital'"
                    id="Sort" name="Sort" runat="server" readonly="readonly"/>
            </td>
        </tr>     
        <tr>
            <td class="DialogTdTitle">
                是否显示
            </td>
            <td class="DialogTdContent" >
                <select id="IsShow" name="IsShow" runat="server">
                    <option value="0" selected="selected">否</option>
                    <option value="1">是</option>
                </select>
            </td>
        </tr>
               <tr>
            <td class="DialogTdTitle">
                开始时间
            </td>
            <td class="DialogTdContent">
                  <input name="BeginDate" type="text" id="BeginDate" runat="server" placeholder="选择时间" required="required" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })"
                            format="Time"/>
            </td>
        </tr>
        <tr>
            <td class="DialogTdTitle">
                项目
            </td>
            <td class="DialogTdContent">
                <input type="text"  data-options="required:true;" 
                    id="CommName" name="CommName" runat="server" onclick="SelCommName();" placeholder="点击选择项目"/>
                <input id="CommID" name="CommID" runat="server" type="hidden"/>
            </td>
        </tr>
               <tr>
            <td class="DialogTdTitle">
                备注
            </td>
                   <td class="DialogTdContent">
                   <textarea id="Remark" name="Remark" runat="server"></textarea>
                   </td>
               </tr>
        <tr>
            <td style="height: 2px;"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="button" class="button" value="保存" id="BtnSave" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
            </td>
        </tr>
    </table>
        <input type="hidden" id="OpType"  name="OpType" runat="server">
        <input type="hidden" id="IID" name="IID" runat="server" />
        <script type="text/javascript">

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

            function SelCommName() {
                var opType = $("#OpType").val();
                if (opType == "edit") {
                    HDialog.Info("项目不允许修改!");
                    return false;
                }
                HDialog.Open('500', '500', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                    var ob = JSON.parse(_Data);
                    $("#CommID").val(ob.id);
                    $("#CommName").val(ob.name);
                });

            }

            $("#BtnSave").click(function () {
                var opType = $("#OpType").val();
                if (opType == "add") {
                    opType = "ChargesFeeBundleSettingsInsert";
                } else if (opType == "edit") {
                    opType = "ChargesFeeBundleSettingsUpdate";
                } else {
                    return false;
                }

                $.tool.DataPostChk('frmForm', 'ChargesFeeBundleSettings', opType, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                        } else {
                        HDialog.Close('1');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            });
        </script>
    </form>
</body>
</html>
