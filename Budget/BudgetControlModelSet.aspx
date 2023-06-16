<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetControlModelSet.aspx.cs" Inherits="M_Main.Budget.BudgetControlModelSet" %>

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
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">预算管理设置</div>
            <div class="panel-body" style="text-align: left;">

                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="BudgetStatePadding">
                                <input name="BudgetState" type="radio" value="0" />按含税价编制预算 </label>
                            &nbsp;
                             <label class="ProjectStatePadding">
                                 <input name="BudgetState" type="radio" value="1" />按不含税价编制预算 </label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">科目管控设置</div>
            <div class="panel-body" style="text-align: left;">

                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr style="height: 32px;">
                        <%--<td class="Td"></td>--%>
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="ProjectStatePadding">
                                <input name="ProjectState" type="radio" value="0" />一级 </label>
                            &nbsp;
                             <label class="ProjectStatePadding">
                                 <input name="ProjectState" type="radio" value="1" />二级 </label>
                            &nbsp;
                             <label class="ProjectStatePadding">
                                 <input name="ProjectState" type="radio" value="2" />三级 </label>
                            &nbsp;
                             <label class="ProjectStatePadding">
                                 <input name="ProjectState" type="radio" value="3" />四级 </label>
                            <label class="ProjectStatePadding">
                                <input name="ProjectState" type="radio" value="4" />五级 </label>
                        </td>
                        <%--   <td class="Td">
                        </td>
                        <td class="TContent">
                        </td>--%>
                    </tr>
                </table>
            </div>
            <div class="divHe"></div>
            <div class="panel-heading" style="background-image: linear-gradient(to bottom,#1c84c6 0,#1c84c6 100%);">期间管控设置</div>
            <div class="panel-body" style="text-align: left;">
                <table class="DialogTable" style="width: 100%;">
                    <tr>
                        <td colspan="4" style="height: 12px; text-align: center;"></td>
                    </tr>
                    <tr>
                        <%-- <td class="Td"></td>--%>
                        <td class="TContent" rowspan="3" style="text-align: center; vertical-align: middle;">
                            <label class="ProjectStatePadding">
                                <input name="PeriodState" type="radio" value="1" />当期控制 </label>
                            &nbsp;
                             <label class="ProjectStatePadding">
                                 <input name="PeriodState" type="radio" value="2" />累计控制 </label>
                            &nbsp;
                             <label class="ProjectStatePadding">
                                 <input name="PeriodState" type="radio" value="3" />总量控制 </label>
                        </td>

                        <%--      <td class="Td"></td>
                        <td class="TContent">
                      
                        </td>--%>
                    </tr>
                    <%--  <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>--%>
                </table>
            </div>
        </div>

        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 45px; line-height: 45px; background-color: #f5f5f5; border-top: 1px solid #E7EAEC;">
            <input name="BtnSave" type="button" id="BtnSave" class="button" value="保存" onclick="Save();" />
            <%-- <input type="button" class="button" value="返回" id="BtnReturn" onclick="btnClose();" />--%>
        </div>
        <input type="hidden" id="Id" name="Id" value="" />
    </form>
    <script type="text/javascript">
        function Save() {
            $.tool.DataGet('Budget', 'SaveBudgetControlModelSet', $('#FrmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        HDialog.Info("保存成功");
                        Bind();
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        function Bind() {
            $.tool.DataGet('Budget', 'SelBudgetControlModelSet', $('#FrmForm').serialize(),
                function Init() {

                },
                function callback(_Data) {

                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {

                        $.JQForm._Data = _Data;
                        $.JQForm.FillForm();
                        $("#FrmForm").form('validate');
                        $("#Id").val(varObjects[0].Id);
                        $("input[name='BudgetState']").eq(varObjects[0].BudgetState).click();
                        $("input[name='ProjectState']").eq(varObjects[0].ProjectState).click();
                        //switch (varObjects[0].ProjectState) {
                        //    case 5:
                        //        $("input[name='ProjectState']").eq(4).click();
                        //        break;
                        //    case 4:
                        //        $("input[name='ProjectState']").eq(3).click();
                        //        break;
                        //    case 3:
                        //        $("input[name='ProjectState']").eq(2).click();
                        //        break;
                        //    case 2:
                        //        $("input[name='ProjectState']").eq(1).click();
                        //        break;
                        //    case 1:
                        //        $("input[name='ProjectState']").eq(0).click();
                        //        break;
                        //}
                        $("input[name='PeriodState']").eq(varObjects[0].PeriodState - 1).click();
                        //switch (varObjects[0].PeriodState) {
                        //    case 2:
                        //        $("input[name='PeriodState']").eq(2).click();
                        //        break;
                        //    case 1:
                        //        $("input[name='PeriodState']").eq(1).click();
                        //        break;
                        //    case 0:
                        //        $("input[name='PeriodState']").eq(0).click();
                        //        break;
                        //}
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        Bind()
    </script>
</body>
</html>
