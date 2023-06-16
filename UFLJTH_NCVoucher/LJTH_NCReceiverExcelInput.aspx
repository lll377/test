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

            //����
            $("#btnReturn").click(function () {
                HDialog.Close();
            });

        });

        function ImportSuccess(successNum) {
            HDialog.Info("����" + successNum + "�����ɹ�" + successNum+"����");
            HDialog.Close("true");
        }

        //����
        function btnImport_Onclick() {
            if ($('#FileRemark').val() == "" || $('#FileRemark').val() == null) {
                HDialog.Info("�������ļ���������,�����Ϊ��!");
                return false;
            }
            var fileType = $('#FileRemark').val().substr($('#FileRemark').val().lastIndexOf(".")).toLowerCase();
            if (fileType != '.xls' & fileType != '.xlsx') {
                HDialog.Info("�ļ����ʹ������ϴ�Excel�ļ����ͣ�");
                return false;
            }
            if ($('#file').val() == "" || $('#file').val() == null) {
                HDialog.Info("��ѡ��Ҫ�ϴ��ı����ļ�!");
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
                <td colspan="4" style="text-align: center">�����޸ĺ���ļ���
                    <input id="FileRemark" name="FileRemark" runat="server" style="width: 270px" />
                    <input style="width: 61px" tabindex="1" type="file" id="file" accept=".xls,.xlsx" onchange="handleFiles(this.files)" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 30px; color: crimson; text-align: center; font-weight: 600; font-size: 14px">*��ʾ�������ļ����ͱ���ΪExcel��ʽ��
                    �����տλ���ͣ��տλID���տλ���ƣ��տλ�����У��տλ�˺�
                    <%--����֮ǰ������ģ���ļ�&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="CreExcel()">����ģ���ļ�</a>--%>
                </td>
            </tr>
        </table>
        <div id="Error" style="text-align:left;font-size:14px;font-weight:500;color:royalblue;padding:0 0 77px 77px">
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnImport" type="button" value="����" name="btnImport" runat="server" onclick="javascript: if (btnImport_Onclick() == false) return false;" />
                        <input class="button" id="btnReturn" type="button" value="�ر�" name="btnReturn" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>

</body>
</html>
<script type="text/javascript">
    //function CreExcel() {
    //    HDialog.Open(500, 300, '../UFLJTH_NCVoucher/XXX.aspx', '����ExcelԤ���ļ�', false, function callback(_Data) {
    //    });
    //}
</script>
