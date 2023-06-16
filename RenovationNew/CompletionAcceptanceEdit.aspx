<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompletionAcceptanceEdit.aspx.cs" Inherits="M_Main.RenovationNew.CompletionAcceptanceEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>装修验收</title>
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
    </style>
</head>
<body>
    <input type="hidden" name="RID" id="RID" />
    <form id="mainForm" runat="server">

        <div style="padding: 5px">
            <table class="bootstrap_table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title"><span>验收部门</span></td>
                    <td class="text">
                        <input id="AcceptanceDepartment" name="AcceptanceDepartment" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>验收人</span></td>
                    <td class="text">
                        <input id="AcceptancePeople" name="AcceptancePeople" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>验收时间</span></td>
                    <td class="text">
                        <input id="AcceptanceDate" name="AcceptanceDate" class="easyui-datebox" data-options="required:true,editable:false,tipPosition:'bottom',icons:[{
                            iconCls:'icon-clear',
                            handler: function(e){
                            $(e.data.target).datebox('clear');
                            }}]"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>验收次序</span></td>
                    <td class="text">
                        <input id="AcceptanceOrder" name="AcceptanceOrder" class="easyui-numberspinner" value="1" data-options="required:true,min:1,prefix:'第 ',suffix:' 次',spinAlign:'right'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>是否合格</span></td>
                    <td class="text">
                        <input class="easyui-radiobutton" id="QualifiedYes" name="Qualified" data-options="value:'是',label:'是',labelWidth:18,labelAlign:'right'" />
                        <input class="easyui-radiobutton" id="QualifiedNo" name="Qualified" data-options="value:'否',label:'否',labelWidth:40,labelAlign:'right',checked:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>验收意见</span></td>
                    <td class="text">
                        <input id="AcceptanceIdea" name="AcceptanceIdea" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'370px',height:'100px'" />
                    </td>
                </tr>
                <tr>
                    <td class="title"><span>备注</span></td>
                    <td class="text">
                        <input id="Remark" name="Remark" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'370px',height:'100px'" />
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
        <input type="hidden" name="QualifiedValue" id="QualifiedValue" />
    </form>

    <script type="text/javascript">
        function InitControl() {
        }

        $(function () {
            InitPage();
            InitControl();
        });

        function InitPage() {
            $("#RID").val($.getUrlParam("RID"));
            var ID = $.getUrlParam("ID");
            if (isValueNull(ID)) {
                $("#ID").val(ID);
                InitData();
            }
            $("#QualifiedYes").radiobutton({
                onChange: function (checked) {
                    if (checked) {
                        $("#QualifiedValue").val("是");
                    } else {
                        $("#QualifiedValue").val("否");
                    }
                }
            });
        }

        function InitData() {
            $.tool.DataPostJson('Renovation', 'GetModelCompletionAcceptance', $.JQForm.GetStrParam(),
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
                $.tool.DataPostJson('Renovation', 'SaveCompletionAcceptance', $.JQForm.GetStrParam(),
                    function Init() {
                        $("#btnSave").attr("disabled", "disabled");
                    },
                    function callback(data) {
                        if (data.result) {
                            $.tool.DataPostJson('Renovation', 'CheckUnreturned', $.JQForm.GetStrParam(),
                                function Init() {

                                },
                                function callback(data) {
                                    if (!data.result) {
                                        $.messager.confirm('温馨提示', data.msg, function (r) {
                                            Close($("#QualifiedValue").val());
                                        });
                                    } else {
                                        Close($("#QualifiedValue").val());
                                    }
                                },
                                function completeCallback() {

                                }, function errorCallback() {

                                });
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {
                        $("#btnSave").removeAttr("disabled");
                    }, function errorCallback() {
                        $("#btnSave").removeAttr("disabled");
                    });
            }
        }
        function Close(val) {
            HDialog.CloseWindow(val, parent.window[parent.window.length - 1].name);
        }
    </script>
</body>
</html>
