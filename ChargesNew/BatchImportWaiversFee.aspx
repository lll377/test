<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchImportWaiversFee.aspx.cs" Inherits="M_Main.ChargesNew.BatchImportWaiversFee" %>

<!DOCTYPE HTML  >
<html>
<head>
    <title>批量导入减免信息</title>
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

            //导入
            $("#btnImport").click(function () {
                if (CheckFile()) {
                    var formData = new FormData();
                    var ImportType = "BatchImportWaiversFee";
                    formData.append("ImportType", ImportType);
                    formData.append("file", $("#file")[0].files[0]);
                    $(".datagrid-mask").remove();
                    $.ajax({
                        url: '/HM/M_Main/ImportExcel/ImportExcelHelp.aspx',
                        type: 'post',
                        data: formData,
                        dataType: 'html',
                        async: true,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            var returnData = data.split('|');
                            if (returnData[0] == "false") {
                                HDialog.Info("数据格式有错误，请改正后重新导入！");
                                $('#Error').html('<span style="font-weight:600;font-size:16px;color: red">错误提示：</span><br/>' + returnData[1]);
                            } else {
                                HDialog.Info("导入" + returnData[1] + "条，成功" + returnData[2] + "条");
                                $('#Error').html('');
                            }
                        },
                        error: function (data) {
                            HDialog.Info("导入失败！！！" + data);
                        }
                    });
                }
            });

            //返回
            $("#btnReturn").click(function () {
                HDialog.Close(true);
            });

        });

        //导入
        function CheckFile() {
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
            return true;
        }

        //生成文件
        function CreExcel() {
            HDialog.Open(670, 330, '../ImportExcel/ExcelDownload/GenerateWaivFeesExcel.aspx', '生成费用减免模板文件', false, function callback(_Data) {
            });
        }

        function handleFiles(files) {
            if (files.length) {
                var file = files[0];
                var fileName = file.name;
                $("#FileRemark").val(fileName);
            }
        }

        function ajaxLoading() {
            var id = "#textboxDiv";
            var left = ($(window).outerWidth(true) - 190) / 2;
            var top = ($(window).height() - 35) / 2;
            var height = $(window).height() * 2;
            $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: height }).appendTo(id);
            $("<div class=\"datagrid-mask-msg\"></div>").html("正在加载,请稍候...").appendTo(id).css({ display: "block", left: left, top: top });
        }

    </script>
</head>
<body style="overflow-y: auto;">
    <form id="BatchImportWaiversFee" enctype="multipart/form-data" runat="server">
        <table class="DialogTable" id="Table1" style="width: 100%">
            <tr>
                <td colspan="4" style="height: 30px;"></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">导入修改后的模板文件：
                    <input id="FileRemark" name="FileRemark" runat="server" style="width: 270px" />
                    <input style="width: 61px" tabindex="1" type="file" id="file" accept=".xls,.xlsx" onchange="handleFiles(this.files)" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 30px; color: crimson; text-align: center; font-weight: 600; font-size: 14px">*提示：导入文件类型必须为Excel格式，导入之前先生成模板文件
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="CreExcel()">生成模板文件</a>
                </td>
            </tr>
        </table>
        <div id="Error" style="text-align: left; font-size: 14px; font-weight: 500; color: royalblue; padding: 0 0 77px 77px">
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 60px; line-height: 20px; background-color: #f5f5f5; margin-right: 45px;">
            <table class="DialogTable" id="Table6">
                <tr>
                    <td style="text-align: center;" class="DialogTdSubmit">
                        <input class="button" id="btnImport" type="button" value="导入" name="btnImport" runat="server" />
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>

</body>
</html>

