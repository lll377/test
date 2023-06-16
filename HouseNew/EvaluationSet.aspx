<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvaluationSet.aspx.cs" Inherits="M_Main.HouseNew.EvaluationSet" %>

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

        .ProjectStatePadding {
            padding-right: 35px;
        }
    </style>
</head>
<body style="padding-left: 2px; padding-right: 2px; margin: 0px; overflow-x: hidden;">
    <form id="FrmForm" runat="server">
        <div style="height: 10px;"></div>
        <div class="panel panel-primary" style="width: 90%; margin: 0px auto; text-align: center;">
            <div style="height: 10px;"></div>

            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">评价周期设置</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="ProjectStatePadding">
                                <input name="EvaluationPeriod" type="radio" value="1" />&nbsp;每月一次
                            </label>
                            <label class="ProjectStatePadding">
                                <input name="EvaluationPeriod" type="radio" value="3" />&nbsp;每季度一次
                            </label>
                            <label class="ProjectStatePadding">
                                <input name="EvaluationPeriod" type="radio" value="6" />&nbsp;每半年一次
                            </label>
                            <label class="ProjectStatePadding">
                                <input name="EvaluationPeriod" type="radio" value="12" />&nbsp;每年一次
                            </label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 45px; line-height: 45px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input name="BtnSave" type="button" id="BtnSave" class="button" value="保存" onclick="Save();" />
        </div>
    </form>
    <script type="text/javascript">
        function Save() {
            $.tool.DataGet('HouseKeeper', 'SaveKeeperEvaluationSet', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("保存成功");
                    } else {
                        HDialog.Info("保存失败");
                    }
                    Bind();
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        function Bind() {
            $.tool.DataGet('HouseKeeper', 'GetKeeperEvaluationSet', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        if (varObjects[0].EvaluationPeriod == "1") {
                            $("input[name='EvaluationPeriod']").eq(0).click();
                        } else if (varObjects[0].EvaluationPeriod == "3") {
                            $("input[name='EvaluationPeriod']").eq(1).click();
                        } else if (varObjects[0].EvaluationPeriod == "6") {
                            $("input[name='EvaluationPeriod']").eq(2).click();
                        } else if (varObjects[0].EvaluationPeriod == "12") {
                            $("input[name='EvaluationPeriod']").eq(3).click();
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        $("input[name='EvaluationPeriod']").eq(0).click();
        Bind();
    </script>
</body>
</html>
