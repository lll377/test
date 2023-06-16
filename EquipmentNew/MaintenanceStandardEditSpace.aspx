<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceStandardEditSpace.aspx.cs" Inherits="M_Main.EquipmentNew.MaintenanceStandardEditSpace" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>维保标准设置</title>
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
        }

        .TdContentSearch textarea {
            width: 96.2%;
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
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">序号:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Sort" name="Sort" class="easyui-numberbox" style="width: 200px;" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">通用设备空间:</td>
                    <td class="TdContentSearch">
                        <%--<input type="text" id="SpaceName" name="SpaceName" style="width: 195px;" runat="server" class="easyui-validatebox" data-options="required:true" />--%>
                        <select id="SpaceName" name="SpaceName" runat="server" class="easyui-combobox" style="width: 200px;" data-options="editable:false,panelHeight: 'auto',required:true,panelMaxHeight:170">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">维保类别:</td>
                    <td class="TdContentSearch">
                        <select id="MaintenanceTypeId" name="MaintenanceTypeId" runat="server" class="easyui-combobox" style="width: 200px;" data-options="editable:false,panelHeight: 'auto',required:true,panelMaxHeight:170">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标准代码:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="StandardCode" name="StandardCode" style="width: 195px;" class="easyui-validatebox"
                            data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标准名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="StandardName" name="StandardName" style="width: 195px;" class="easyui-validatebox"
                            data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">备注:</td>
                    <td class="TdContentSearch">
                        <textarea type="text" id="Remark" name="Remark" maxlength="250" class="easyui-validatebox"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 10px 0;">
            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
            <input type="button" class="button" value="关闭" id="BtnReturn" onclick="Close();" />
        </div>

        <input type="hidden" id="Id" name="Id" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <script type="text/javascript">
            //页面加载
            function Load() {
                if ($('#OpType').val() == 'edit') {
                    var ParameterStr = "Id=" + $('#Id').val();
                    $.tool.DataGet('CsEquipment', 'GetMaintenanceStandardSpaceById', ParameterStr,
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象 
                            if (varObjects.length > 0) {
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();
                                //$("#frmForm").form('validate');

                                //加载easyui控件加载不出来的值
                                $('#Sort').numberbox("setValue", varObjects[0].Sort);
                                $('#MaintenanceTypeId').combobox("setValue", varObjects[0].MaintenanceTypeId);

                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $.tool.DataGet('CsEquipment', 'GetMaxSort', "Type=MaintenanceStandardSpace",
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                $("#Sort").numberbox("setValue", _Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
            //关闭
            function Close() {
                HDialog.Close("");
            }
            //保存
            function Save() {
                if ($('#frmForm').form("validate")) {
                    $.tool.DataPostChk('frmForm', 'CsEquipment', 'SaveMaintenanceStandardSpace', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Close("1");
                            } else {
                                HDialog.Info("相同通用空间和维保类别只能保存一个！");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            $(function () {
                $('#MaintenanceTypeId').combobox("clear");
                $('#SpaceName').combobox("clear");
                Load();
            });

        </script>

    </form>
</body>
</html>
