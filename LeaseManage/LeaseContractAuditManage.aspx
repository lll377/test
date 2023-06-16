<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseContractAuditManage.aspx.cs" Inherits="M_Main.LeaseManage.LeaseContractAuditManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同签订</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
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
            width: 180px;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 91%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
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
            width: 8%;
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
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="form1" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">合同类别</td>
                    <td class="TdContentSearch">
                        <input id="ContractTypeName" class="easyui-searchbox" searcher="ContractTypeSelect" data-options="required:true, editable:false" name="ContractTypeName" runat="server" />
                        <input type="hidden" runat="server" id="ContractTypeCode" name="ContractTypeCode" />
                    </td>
                    <td class="TdTitle">流程名称</td>
                    <td class="TdContentSearch">
                        <input id="WorkFlowName" name="WorkFlowName" style="width: 150px; border: 1px solid #ccc;" class="easyui-validatebox" onclick="WorkFlowChoise();" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起部门</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="DepName" name="DepName" readonly class="easyui-validatebox"></textarea>
                        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">备注</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="Memo" name="Memo" maxlength="1400" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
            </table>

        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="BtnSave" />
            <input type="button" class="button" value="放弃返回" id="BtnReturn" />
        </div>
        <input type="hidden" id="OpType" name="OpType" runat="server">
        <input type="hidden" id="AuditID" name="AuditID" runat="server" />
        <input type="hidden" id="WorkFlowId" name="WorkFlowId" runat="server" />
        <input type="hidden" id="AuditType" name="AuditType" runat="server" value="29" />
        <script type="text/javascript">
            $(function () {// 初始化内容
                if ($('#OpType').val() == "edit") {
                    $.tool.DataPostAsync('AuditLeaseContract', 'LoadItem', 'AuditID=' + $("#AuditID").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();
                                var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                if (varObjects.length > 0) {
                                    $("#ContractTypeName").searchbox("setValue", varObjects[0]["ContractTypeName"]);
                                    $('#WorkFlowId').val(varObjects[0]["WorkFlowID"]);
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                }
            });

            function WorkFlowChoise() {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&biaoshi=1&Filter=1204&random=" + Math.random();
                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        $('#WorkFlowId').val(obj[0].toString());
                        $('#WorkFlowName').val(obj[1].toString());
                    }
                });
            }

            //选择合同类别
            function ContractTypeSelect() {
                HDialog.Open('400', '350', '../LeaseManage/CostContractType_Multiple.aspx', '选择合同类型', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split('&');
                        if (varObjects.length > 0) {
                            $("#ContractTypeCode").val(varObjects[0]);
                            $("#ContractTypeName").searchbox("setValue", varObjects[1]);
                        }
                    }
                });
            }

            //选择部门
            $("#DepName").click(function () {
                HDialog.Open('500', '500', '../LeaseManage/SelDepartWithOutParent.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(';');
                        $("#DepCode").val(varObjects[0]);
                        $("#DepName").val(varObjects[1]);
                    }
                });
            });

            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });

            $("#BtnSave").click(function () {
                $.tool.DataPostChk('form1', 'AuditLeaseContract', 'Save', $('#form1').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Close('1');
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            });

        </script>
    </form>
</body>
</html>
