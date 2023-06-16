<%@ Page Language="c#" CodeBehind="LJTH_NCReceiverExcelInput.aspx.cs" AutoEventWireup="false" Inherits="M_Main.UFLJTH_NCVoucher.LJTH_NCReceiverExcelInput" %>

<!DOCTYPE HTML >
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {

            //返回
            $("#btnReturn").click(function () {
                HDialog.Close();
            });

        });

        function ImportSuccess(successNum) {
            HDialog.Info("导入" + successNum + "条，成功" + successNum+"条！");
            HDialog.Close("true");
        }

        //导入
        function btnImport_Onclick() {
            if ($('#FileRemark').val() == "" || $('#FileRemark').val() == null) {
                HDialog.Info("请输入文件附件名称,此项不能为空!");
                return false;
            }
            var fileType = $('#FileRemark').val().substr($('#FileRemark').val().lastIndexOf(".")).toLowerCase();
            if (fileType != '.xls' & fileType != '.xlsx') {
                HDialog.Info("文件类型错误，请上传Excel文件类型！");
                return false;
            }
            if ($('#file').val() == "" || $('#file').val() == null) {
                HDialog.Info("请选择要上传的本地文件!");
                return false;
            }
            $("#FileRemark").val("");
            $.tool.pageLoading();
            return true;
        }
        
        function handleFiles(files) {
            if (files.length) {
                var file = files[0];
                var fileName = file.name;
                $("#FileRemark").val(fileName);
            }
            
        }
    </script>
</head>
<body style="overflow-y: auto;">

    <form id="BatchUpdateRoom" runat="server">
        <table class="DialogTable" id="Table1" style="width: 100%">
            <tr>
                <td colspan="4" style="height: 30px;"></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">导入修改后的文件：
                    <input id="FileRemark" name="FileRemark" runat="server" style="width: 270px" />
                    <input style="width: 61px" tabindex="1" type="file" id="file" accept=".xls,.xlsx" onchange="handleFiles(this.files)" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 30px; color: crimson; text-align: center; font-weight: 600; font-size: 14px">*提示：导入文件类型必须为Excel格式。
                    列是收款单位类型，收款单位ID，收款单位名称，收款单位开户行，收款单位账号
                    <%--导入之前先下载模板文件&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="CreExcel()">下载模板文件</a>--%>
                </td>
            </tr>
        </table>
        <div id="Error" style="text-align:left;font-size:14px;font-weight:500;color:royalblue;padding:0 0 77px 77px">
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnImport" type="button" value="导入" name="btnImport" runat="server" onclick="javascript: if (btnImport_Onclick() == false) return false;" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>

</body>
</html>
<script type="text/javascript">
    //function CreExcel() {
    //    HDialog.Open(500, 300, '../UFLJTH_NCVoucher/XXX.aspx', '生成Excel预交文件', false, function callback(_Data) {
    //    });
    //}
</script>
