<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractFeesInsertConditionEdit.aspx.cs" Inherits="M_Main.DiversifiedManage.ContractManage.ContractFeesInsertConditionEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多经合同费用登记前置条件设置页面</title>
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
    <script type="text/javascript" src="../../jscript/uuid.js"></script>
    <script type="text/javascript" src="../../jscript/Dialog.js"></script>

    <style type="text/css">
        .bootstrap_table tr td.title {
            width: 25%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 25%;
            text-align: left;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="overflow: hidden; padding: 0px; margin: 0px;">
    <input type="hidden" name="ID" id="ID" />
    <input type="hidden" name="ContractID" id="ContractID" />
    <input type="hidden" name="ContID" id="ContID" />
    <input type="hidden" name="OldCommID" id="OldCommID" />
    <form id="mainForm" runat="server">
        <div style="padding: 20px 5px;">
            <table class="bootstrap_table baseinfo" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="title">
                        <span>项目名称</span>
                    </td>
                    <td class="text">
                        <input id="CommName" name="CommName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'300px',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelComm();}" />
                        <input type="hidden" name="CommID" id="CommID" />
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <span>客户名称</span>
                    </td>
                    <td class="text">
                        <input id="CustName" name="CustName" class="easyui-textbox"
                            data-options="prompt:'请选择!',editable:false,tipPosition:'bottom',required:true,multiline:false,width:'300px',
                                        buttonText:'',buttonIcon:'icon-search',onClickButton:function(){SelCust();},
                                        icons:[{
                                            iconCls:'icon-clear',
                                            handler: function(e){
                                            $(e.data.target).textbox('clear');
                                            $('#CommID').val('');
                                            }}] " />
                        <input type="hidden" name="CustID" id="CustID" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="确定条件" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>
    <script type="text/javascript">

        //选择项目
        function SelComm() {
            LayerDialog.OpenWin('680', '500', '../DiversifiedManage/Dialog/SelContractCommByCommRole.aspx', "选择项目", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#CommID").val(data.attributes.CommID);
                    $("#CommName").textbox("setValue", data.text);
                    $("#CustID").val("");
                    $("#CustName").textbox("setValue", "");
                }
            });
        }

        //选择客户 当前项目的业主、租户、临时客户和所有的客商
        function SelCust() {
            var param = { "CommID": $('#CommID').val(), "CommName": $('#CommName').textbox("getValue") };
            LayerDialog.OpenWin('1000', '600', '../DiversifiedManage/Dialog/SelContractCustomer.aspx?' + $.param(param), "选择客户", false, function callback(data) {
                if (isValueNull(data)) {
                    data = $.parseJSON(data);
                    $("#CustID").val(data.CustID);
                    $("#CustName").textbox("setValue", data.CustName);
                }
            });
        }

        //初始化页面数据
        function InitData() {
            var CommID = $.getUrlParam("CommID");
            var CommName = $.getUrlParam("CommName");
            var CustID = $.getUrlParam("CustID");
            var CustName = $.getUrlParam("CustName");
            if (!!CommID) {
                $('#CommID').val(CommID);
            }
            if (!!CommName) {
                $('#CommName').textbox("setValue", CommName);
            }
            if (!!CustID) {
                $('#CustID').val(CustID);
            }
            if (!!CustName) {
                $('#CustName').textbox("setValue", CustName);
            }
        }

        //确定条件
        function Save() {
            if ($('#mainForm').form("validate")) {
                var ReturnParame = {
                    "CommID": $('#CommID').val(),
                    "CommName": $('#CommName').textbox("getValue"),
                    "CustID": $('#CustID').val(),
                    "CustName": $('#CustName').textbox("getValue")
                };
                HDialog.Close(JSON.stringify(ReturnParame));
                //$.tool.DataPostJsonAsync('DiversifiedManage', 'ContractSettingCopy', "ContractID=" + $('#ContractID').val() + "&CommID=" + $('#OldCommID').val() +
                //    "&CommIDs=" + $("#CommID").val() + "&CustID=" + $('#CustID').val(),
                //    function Init() {
                //    },
                //    function callback(_Data) {
                //        if (_Data.result) {
                //            HDialog.Close(_Data.data);
                //        } else {
                //            $.messager.alert('温馨提示', _Data.msg);
                //        }
                //    },
                //    function _completeCallBack() {
                //    },
                //    function errorCallback() {
                //    });
            }
        }
        //关闭
        function Close() {
            LayerDialog.Close("");
        }
        //页面初始化
        $(function () {
            InitData();
        });
    </script>
</body>
</html>
