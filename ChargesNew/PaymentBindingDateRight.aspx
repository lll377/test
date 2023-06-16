<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentBindingDateRight.aspx.cs" Inherits="M_Main.ChargesNew.PaymentBindingDateRight" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管控模型设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" />
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/PersonDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <link href="../css/button.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .Td {
            height: 16px;
            width: 23%;
            text-align: right;
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .TContent {
            height: 16px;
            width: 22%;
            margin-left: 15px;
            padding-left: 15px;
            text-align: left;
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .spanTitle {
        }

        .fontSizes {
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .divHe {
            height: 10px;
        }
    </style>
</head>
<body style="padding-left: 2px; padding-right: 2px; margin: 0px; overflow-x: hidden;">
    <form id="FrmForm" runat="server">
        <div style="height: 10px;"></div>
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <input type="hidden" id="checkbox3" name="checkbox3" runat="server" />
        <div class="panel panel-primary" style="width: 85%; margin: 0px auto; text-align: center;">

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">时间绑定设置</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr style="height: 32px;">
                        <td colspan="2" class="TContent">项目名称：<label id="CommName" name="CommName" runat="server"></label></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td colspan="2" class="TContent">
                            <input name="checkbox_1" type="radio" id="checkbox_1" runat="server" />全部费用一次缴纳</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">
                            <input name="checkbox_1" type="radio" id="checkbox_2" runat="server" />单笔费用任意缴纳；
                            <input type="radio" id="checkbox_3" runat="server" />同时缴纳历史欠费</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">
                            <input name="checkbox_1" type="radio" id="checkbox_4" runat="server" />按照费项绑定设置，整月费用一次缴纳；
                            <input type="radio" id="checkbox_5" disabled="disabled" runat="server" />同时缴纳历史欠费</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">
                            <input name="checkbox_1" type="radio" id="checkbox_6" runat="server" />按照费项绑定设置，整季费用一次缴纳；
                            <input type="radio" id="checkbox_7" disabled="disabled" runat="server" />同时缴纳历史欠费</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">
                            <input name="checkbox_1" type="radio" id="checkbox_8" runat="server" />按照费项绑定设置，半年费用一次缴纳；
                            <input type="radio" id="checkbox_9" disabled="disabled" runat="server" />同时缴纳历史欠费</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">
                            <input name="checkbox_1" type="radio" id="checkbox_10" runat="server" />按照费项绑定设置，整年费用一次缴纳；
                            <input type="radio" id="checkbox_11" disabled="disabled" runat="server" />同时缴纳历史欠费</td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent">
                            <input name="checkbox_1" type="radio" id="checkbox_12" runat="server" />按照费项绑定设置，往后缴纳<input type="text" id="month" name="month" runat="server" style="width: 4%;" />月费用；
                            <input type="radio" id="checkbox_13" disabled="disabled" runat="server" />同时缴纳历史欠费</td>
                    </tr>
                </table>

            </div>
            <div class="divHe"></div>

        </div>

        <div style="text-align: center; width: 100%; height: 45px; line-height: 45px; border-top: 1px solid #E7EAEC;">
            <input name="BtnSave" type="button" id="BtnSave" class="button" value="保存" runat="server" />
        </div>
    </form>
    <script type="text/javascript">
        //$(function () {
        //    $(':checkbox[name=checkbox_1]').each(function () {
        //        $(this).click(function () {
        //            if ($(this).attr('checked')) {
        //                $(':checkbox[name=checkbox_1]').removeAttr('checked');
        //                $(this).attr('checked', 'checked');
        //            }
        //        });
        //    });
        //});

        $('#checkbox_3').click(function (e) {
            //$browsers.removeAttr("checked");  

            //$('#checkbox_3').attr('checked', 'checked');

            //if ($('#checkbox_3').is(':checked')) {
            //    $('#checkbox_3').attr('checked', false);
            //} else {
            //    //$('#checkbox_3').attr('checked', 'checked');
            //    $('#checkbox_3').attr('checked', true);
            //    alert();
            //}

            var $radio = $(this);

            if ($('#checkbox3').val() == '1') {
                $radio.data('checked', true);
            } else {
                $radio.data('checked', false);
            }

            if ($radio.data('checked')) {
                $radio.prop('checked', false);
                $radio.data('checked', false);
                $('#checkbox3').val('0')
            } else {
                $radio.prop('checked', true);
                $radio.data('checked', true);
                $('#checkbox3').val('1')
            }

        });

        $('#BtnSave').click(function () {
            //alert($('#checkbox_3').is(':checked'))
            if ($('#checkbox_12').is(':checked') && ($('#month').val() <= 0 || $('#month').val() == '')) {
                HDialog.Info('按照费项绑定设置，往后缴纳几月必填！');
                return false;
            }
        });
        $(':radio[name=checkbox_1]').click(function () {
            if (!$('#checkbox_2').is(':checked')) {
                $('#checkbox_3').attr('disabled', 'disabled');
                $('#checkbox3').val('0')
            }
            if ($('#checkbox_2').is(':checked')) {
                $('#checkbox_3').removeAttr('disabled');
            }
        });

        //$('#checkbox_1').click(function () {
        //    if ($('#checkbox_1').is(':checked')) {
        //        alert(1);
        //        //$('#checkbox_1').removeAttr('checked');
        //    } else {
        //        alert(2);
        //        //$('#checkbox_1').attr('checked', 'checked');
        //        //$('#checkbox_2').removeAttr('checked');
        //        //$('#checkbox_4').removeAttr('checked');
        //        //$('#checkbox_6').removeAttr('checked');
        //        //$('#checkbox_8').removeAttr('checked');
        //        //$('#checkbox_10').removeAttr('checked');
        //        //$('#checkbox_12').removeAttr('checked');
        //    }
        //});

    </script>
</body>
</html>
