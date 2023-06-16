<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractSignUnitSetDetail.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractSignUnitSetDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同签约单位-详细编辑页面</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.tool.new.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>

    <style type="text/css">
        .bootstrap_table tr td.title {
            width: 20%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 30%;
            text-align: left;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="overflow: hidden; padding: 0px; margin: 0px;">
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" name="ID" id="ID" />
    <form id="mainForm" runat="server">
        <div style="padding: 20px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>单位类型</span>
                    </td>
                    <td class="text" colspan="3">
                        <input id="UnitType" name="UnitType" class="easyui-combobox" data-options="required:true,editable:false,tipPosition:'bottom',panelHeight:'auto',
                         valueField:'id',textField:'text',value:'',
                            data: [{id: '',text: ''},{id: '收款方',text: '收款方'},{id: '管理方',text: '管理方'}]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>单位名称</span>
                    </td>
                    <td class="text">
                        <input id="UnitName" typ="text" name="UnitName" runat="server" class="easyui-textbox" data-options="required:true" />
                    </td>
                    <td class="title">
                        <span>证件名称</span>
                    </td>
                    <td class="text">
                        <input id="UnitPaperName" typ="text" name="UnitPaperName" runat="server" class="easyui-textbox" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>证件号码</span>
                    </td>
                    <td class="text">
                        <input id="UnitPaperCode" typ="text" name="UnitPaperCode" runat="server" class="easyui-textbox" data-options="required:true" />
                    </td>
                    <td class="title">
                        <span>(注册)地址</span>
                    </td>
                    <td class="text">
                        <input id="UnitRegAddr" typ="text" name="UnitRegAddr" runat="server" class="easyui-textbox" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>邮政编码</span>
                    </td>
                    <td class="text">
                        <input id="UnitPostCode" typ="text" name="UnitPostCode" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title">
                        <span>法定代表人</span>
                    </td>
                    <td class="text">
                        <input id="UnitLegalPeople" typ="text" name="UnitLegalPeople" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>联系人</span>
                    </td>
                    <td class="text">
                        <input id="UnitConnectpeople" typ="text" name="UnitConnectpeople" runat="server" class="easyui-textbox" />
                    </td>
                    <td class="title">
                        <span>联系电话</span>
                    </td>
                    <td class="text">
                        <input id="UnitConnectTel" typ="text" name="UnitConnectTel" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="PageClose();" />
        </div>
    </form>
    <script type="text/javascript">
        //页面初始化
        $(function () {
            InitPage();
        });
        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            $("#OpType").val(OpType);
            if (OpType == "edit") {
                $("#ID").val(ID);
                InitData();
            }

        }
        //初始化页面数据
        function InitData() {
            $.tool.DataGet('DiversifiedManage', 'GetModelSignUnit', "ID=" + $('#ID').val(),
                function Init() {
                },
                function callback(_Data) {
                    var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {
                        $('#mainForm').form('load', $.parseJSON(_Data)[0]);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        //保存
        function Save() {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('DiversifiedManage', 'SaveSignUnit', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            LayerDialog.Close("true");
                        } else {
                            $.messager.alert('温馨提示', data.msg);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }
        //关闭
        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>

