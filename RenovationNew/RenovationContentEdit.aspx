<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenovationContentEdit.aspx.cs" Inherits="M_Main.RenovationNew.RenovationContentEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修巡查编辑</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../css/basebootstrap.css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        /*.bootstrap_table tr td.title {
            width: 10%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 40%;
            text-align: left;
        }*/
    </style>
</head>
<body>
    <form id="mainForm" runat="server">
        <div style="padding: 5px">
            <table class="bootstrap_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>内容</span></td>
                    <td class="text" colspan="3">
                        <input id="Content" name="Content" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'100%',height:'300px'" />
                    </td>
                </tr>
            </table>
            <div style="height: 60px"></div>
        </div>
        <%--   <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>--%>
        <div class="btnFixed">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" runat="server" />
            <input type="button" class="button" value="放弃" id="btnClose" onclick="Close();" />
        </div>

    </form>

    <script type="text/javascript">
        function InitControl() {
        }

        $(function () {
            InitPage();
            InitControl();
        });

        function InitPage() {
            var ID =$.getUrlParam("ID");
            if (isValueNull(ID)) {
                $("#ID").val(ID);
                InitData();
            }
        }

        function InitData() {
            $.tool.DataPostJson('Renovation', 'GetModelRenovationContent', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    data = data[0];
                    $('#mainForm').form('load', data);
                    //$("#Progress").textbox("setValue", data.Table[0].Progress);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('Renovation', 'SaveRenovationContent', $.JQForm.GetStrParam(),
                    function Init() {
                        $("#btnSave").attr("disabled", "disabled");
                    },
                    function callback(data) {
                        if (data.result) {
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {
                        $("#btnSave").removeAttr("disabled");
                    }, function errorCallback() {
                        $("#btnSave").removeAttr("disabled");
                    });
            }
        }
        function Close() {
            HDialog.CloseWindow("", parent.window[parent.window.length - 1].name);
        }
    </script>
</body>
</html>
