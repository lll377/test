<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiskLevelEdit.aspx.cs" Inherits="M_Main.ComprehensivePatrols.RiskLevelEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <%--<script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>--%>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <%--    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>--%>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <%--<script type="text/javascript" src="../jscript/linq.js"></script>--%>
    <%--<script type="text/javascript" src="../jscript/City/City.js"></script>--%>

    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmFrom">
        <div style="padding: 5px;">
            <table class="dlg_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>等级序号:</span></td>
                    <td class="text">
                        <input id="Sort" name="Sort" class="easyui-numberbox" data-options="required:true" />
                    </td>
                    <td class="title"><span>风险等级</span></td>
                    <td class="text">
                        <input id="Level" name="Level" class="easyui-textbox" data-options="required:true,validType:'length[0,200]'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>风险系数:</span></td>
                    <td class="text" colspan="3">
                        <input id="Coefficient" name="Coefficient" class="easyui-numberbox" data-options="required:true,min:0,precision:2" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>备注:</span></td>
                    <td class="text" colspan="4">
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,validType:'length[0,200]'" style="width: 98%;" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>

    <script type="text/javascript">
        $(function () {
            PageInit();
        });
        function PageInit() {
            var ID = GetQueryString("ID");
            $("#ID").val(ID);
            $('#Sort').numberbox('textbox').attr('maxlength', 8);
            if (isValueNull(ID)) {
                LoadInfo();
            }
        }

        function LoadInfo() {
            $.tool.DataPostJson('CpComPatrols', 'GetModelRiskLevel', $.JQForm.GetStrParam(),
                   function Init() {
                   },
                   function callback(data) {
                       $('#frmFrom').form('load', data);
                   },
                   function completeCallback() {
                   }, function errorCallback() {
                   });
        }

        function Save() {
            if ($('#frmFrom').form("validate")) {
                $.tool.DataPostJson('CpComPatrols', 'SaveRiskLevel', $.JQForm.GetStrParam(),
                   function Init() {
                       $("#btnSave").attr("disabled", "disabled");
                   },
                   function callback(data) {
                       if (data.result) {
                           HDialog.Close("true");
                       } else {
                           HDialog.Info(data.msg);
                       }
                   },
                   function completeCallback() {
                       $("#btnSave").removeAttr("disabled");
                   }, function errorCallback() {
                       $("#btnSave").removeAttr("disabled");
                   });
            }
        }

        function Close() {
            HDialog.Close();
        }
    </script>
</body>
</html>
