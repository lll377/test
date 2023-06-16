<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseUnitManage.aspx.cs" Inherits="M_Main.LeaseManage.LeaseUnitManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同-租赁出租方管理方编辑</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <script type="text/javascript" src="../jscript/jquery.form.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            line-height: 20px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 19%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
        }
    </style>
</head>
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <form id="frmFrom" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">单位类型:</td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="UnitType" name="UnitType" class="easyui-combobox" style="width: 80px;" runat="server" data-options="editable:false,panelHeight:'200',required:true">
                            <option value="出租方">出租方</option>
                            <option value="管理方">管理方</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">单位名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitName" name="UnitName" maxlength="200" class="easyui-validatebox" runat="server" data-options="required:true" />
                    </td>
                    <td class="TdTitle">证件名称:</td>
                    <td class="TdContentSearch">
                        <select id="UnitPaperName" name="UnitPaperName" style="width: 142px;" class="easyui-combobox" runat="server"
                            data-options="editable:false,panelHeight:'120',required:true,width:'auto'">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">证件号码:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitPaperCode" name="UnitPaperCode" maxlength="200" class="easyui-validatebox" runat="server" data-options="required:true" />
                    </td>
                    <td class="TdTitle">(注册)地址:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitRegAddr" name="UnitRegAddr" maxlength="1500" runat="server" data-options="required:true" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">邮政编码:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitPostCode" name="UnitPostCode" maxlength="40" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">法定代表人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitLegalPeople" name="UnitLegalPeople" maxlength="40" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">联系人:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitConnectpeople" name="UnitConnectpeople" maxlength="40" runat="server" data-options="required:true" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">联系电话:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="UnitConnectTel" name="UnitConnectTel" maxlength="40" class="easyui-validatebox" data-options="required:true" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="ID" name="ID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
    </form>
    <div style="text-align: center; width: 100%; padding: 5px 0;">
        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
        <input type="button" class="button" value="放弃返回" id="BtnReturn" onclick="btnClose();" />
    </div>

    <script language="javascript" type="text/javascript">

        function btnClose() {
            HDialog.Close("");
        }

        //加载页面数据
        function LoadBaseData() {
            //修改的情况才加载数据
            if ($('#OpType').val() == "edit") {
                $.tool.DataGet('LeaseManage', 'GetLeaseUnitByID', "ID=" + $('#ID').val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                            //加载easyui控件加载不出来的值
                            $('#frmFrom').form('validate');
                            //单位类型
                            $('#UnitType').combobox("setValue", varObjects[0].UnitType);
                            //证件名称
                            $('#UnitPaperName').combobox("setValue", varObjects[0].UnitPaperName);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        }

        //保存
        function Save() {
            if ($('#frmFrom').form("validate")) {
                $.tool.DataPostJson('LeaseManage', 'SaveLeaseUnit', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            HDialog.Close("1");
                        } else {
                            HDialog.Info(data.msg);
                        }
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }
        }

        //页面初始化
        $(function () {
            LoadBaseData();
        });
    </script>
</body>
</html>
