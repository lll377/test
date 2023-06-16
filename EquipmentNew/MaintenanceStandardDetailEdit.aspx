<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceStandardDetailEdit.aspx.cs" Inherits="M_Main.EquipmentNew.MaintenanceStandardDetailEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备维保工艺路线编辑页面</title>
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
<body style="margin: 0px; overflow: hidden; padding: 0px">
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">标准名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="MaintenanceStandardName" name="MaintenanceStandardName" readonly style="width: 195px;" class="easyui-validatebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">序号:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Sort" name="Sort" class="easyui-numberbox" style="width: 200px;" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">维保项目、内容、方法、标准:</td>
                    <td class="TdContentSearch">
                        <textarea type="text" id="MaintenanceContent" name="MaintenanceContent" maxlength="1900" class="easyui-validatebox" data-options="required:true"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">维保登记类型:</td>
                    <td class="TdContentSearch">
                        <select id="InputType" name="InputType" runat="server" class="easyui-combobox"
                            data-options="editable:false,panelHeight: 'auto',required:true,width:60,onSelect:InputTypeSelect">
                            <option value="1">选项</option>
                            <option value="2">数字</option>
                            <option value="3">文字</option>
                        </select>
                    </td>
                </tr>
                <tr id="CheckTypeTr">
                    <td class="TdTitle">选项参考值:</td>
                    <td class="TdContentSearch">
                        <select id="CheckType" name="CheckType" runat="server" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,width:100">
                            <option value="1">正常/不正常</option>
                            <option value="2">合格/不合格</option>
                            <option value="3">完成/未完成</option>
                            <option value="4">是/否</option>
                        </select>
                    </td>
                </tr>
                <tr id="NumTypeSelectTr" style="display: none;">
                    <td class="TdTitle">数字参考值:</td>
                    <td class="TdContentSearch">
                        <div>
                            <select id="NumTypeSelect" name="NumTypeSelect" runat="server" class="easyui-combobox"
                                data-options="editable:false,panelHeight: 'auto',width:80,onSelect:NumTypeSelectFunc">
                                <option value="1">＞</option>
                                <option value="2">＜</option>
                                <option value="3">≥</option>
                                <option value="4">≤</option>
                                <option value="5">X≤?≤Y</option>
                                <option value="6">X＜?＜Y</option>
                            </select>
                            <div style="display: inline-block;" id="NumType1Div">
                                <input id="NumType1" name="NumType1" class="easyui-numberbox" data-options="precision:2,min:0" style="width: 50px;" />
                            </div>
                            <div style="display: inline-block;" id="NumType2Div">
                                <input id="NumType2" name="NumType2" class="easyui-numberbox" data-options="precision:2,min:0" style="width: 50px;" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">维保登记是否必填:</td>
                    <td class="TdContentSearch">
                        <select id="IsInspectionRegistration" name="IsInspectionRegistration" class="easyui-combobox" data-options="panelHeight:'auto',width:'60',editable:false">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">异常是否强制报修:</td>
                    <td class="TdContentSearch">
                        <select id="IsControl" name="IsControl" class="easyui-combobox" data-options="panelHeight:'auto',width:'60',editable:false">
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
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
            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
            <input type="button" class="button" value="关闭" id="BtnReturn" onclick="btnClose();" />
        </div>

        <input type="hidden" id="MaintenanceStandardId" name="MaintenanceStandardId" runat="server" />
        <input type="hidden" id="NumType" name="NumType" />
        <input type="hidden" id="DetailId" name="DetailId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />

        <script type="text/javascript">

            function btnClose() {
                HDialog.Close("");
            }
            //巡检登记类型 切换
            function InputTypeSelect(record) {
                switch (record.value) {
                    case "1":
                        //选项
                        $('#CheckTypeTr').show();
                        $('#NumTypeSelectTr').hide();

                        $('#CheckType').combobox({ required: true });
                        $('#CheckType').combobox('clear');

                        $('#NumTypeSelect').combobox({ required: false });
                        $('#NumTypeSelect').combobox('clear');
                        $('#NumType1').numberbox("setValue", "");
                        $('#NumType2').numberbox("setValue", "");
                        $('#NumType1').numberbox({ required: false });
                        $('#NumType2').numberbox({ required: false });
                        break;
                    case "2":
                        //数字
                        $('#CheckTypeTr').hide();
                        $('#NumTypeSelectTr').show();

                        $('#NumTypeSelect').combobox({ required: true });
                        $('#NumTypeSelect').combobox('clear');

                        $('#NumType1Div').hide();
                        $('#NumType2Div').hide();

                        $('#NumType1').numberbox("setValue", "");
                        $('#NumType2').numberbox("setValue", "");
                        $('#NumType1').numberbox({ required: true });
                        $('#NumType2').numberbox({ required: true });

                        $('#CheckType').combobox({ required: false });
                        $('#CheckType').combobox('clear');
                        break;
                    case "3":
                        //文字
                        $('#CheckTypeTr').hide();
                        $('#NumTypeSelectTr').hide();

                        //删除 选项和数字的选择
                        $('#CheckType').combobox({ required: false });
                        $('#CheckType').combobox('clear');

                        $('#NumTypeSelect').combobox({ required: false });
                        $('#NumTypeSelect').combobox('clear');
                        $('#NumType1').numberbox("setValue", "");
                        $('#NumType2').numberbox("setValue", "");
                        $('#NumType1').numberbox({ required: false });
                        $('#NumType2').numberbox({ required: false });
                        break;
                }
            }
            //数字参考值 切换
            function NumTypeSelectFunc(record) {
                switch (record.value) {
                    case "1": case "2": case "3": case "4":
                        $('#NumType1Div').show();
                        $('#NumType2Div').hide();

                        $('#NumType1').numberbox("setValue", "");
                        $('#NumType2').numberbox("setValue", "");
                        $('#NumType1').numberbox({ required: true });
                        $('#NumType2').numberbox({ required: false });

                        break;
                    case "5": case "6":
                        $('#NumType1Div').show();
                        $('#NumType2Div').show();
                        $('#NumType1').numberbox("setValue", "");
                        $('#NumType2').numberbox("setValue", "");
                        $('#NumType1').numberbox({ required: true });
                        $('#NumType2').numberbox({ required: true });
                        break;
                }
            }

            function Load() {
                if ($('#OpType').val() == 'edit') {
                    var parameterStr = "DetailId=" + $('#DetailId').val();
                    $.tool.DataGet('CsEquipment', 'GetMaintenanceStandardDetailById', parameterStr,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象 
                                        if (varObjects.length > 0) {
                                            $.JQForm._Data = _Data;
                                            $.JQForm.FillForm();

                                            //加载easyui控件加载不出来的值
                                            $('#Sort').numberbox("setValue", varObjects[0].Sort);
                                            $('#InputType').combobox("setValue", varObjects[0].InputType);
                                            switch (varObjects[0].InputType) {
                                                case 1:
                                                    $('#CheckTypeTr').show();
                                                    $('#NumTypeSelectTr').hide();
                                                    $('#CheckType').combobox({ required: true });
                                                    $('#CheckType').combobox("setValue", varObjects[0].CheckType);

                                                    $('#NumTypeSelect').combobox({ required: false });
                                                    $('#NumTypeSelect').combobox('clear');
                                                    $('#NumType1').numberbox("setValue", "");
                                                    $('#NumType2').numberbox("setValue", "");
                                                    $('#NumType1').numberbox({ required: false });
                                                    $('#NumType2').numberbox({ required: false });
                                                    break;
                                                case 2:
                                                    $('#CheckTypeTr').hide();
                                                    $('#NumTypeSelectTr').show();

                                                    $('#NumTypeSelect').combobox({ required: true });

                                                    var NumTypeStr = varObjects[0].NumType;
                                                    var NumArr = NumTypeStr.split(',');

                                                    switch (String(NumArr[0])) {
                                                        case "1": case "2": case "3": case "4":
                                                            $('#NumType1Div').show();
                                                            $('#NumType2Div').hide();
                                                            $('#NumType1').numberbox("setValue", NumArr[1]);
                                                            $('#NumType2').numberbox("setValue", "");
                                                            $('#NumType1').numberbox({ required: true });
                                                            $('#NumType2').numberbox({ required: false });

                                                            break;
                                                        case "5": case "6":
                                                            $('#NumType1Div').show();
                                                            $('#NumType2Div').show();
                                                            $('#NumType1').numberbox("setValue", NumArr[1]);
                                                            $('#NumType2').numberbox("setValue", NumArr[2]);
                                                            $('#NumType1').numberbox({ required: true });
                                                            $('#NumType2').numberbox({ required: true });
                                                            break;
                                                    }

                                                    $('#NumTypeSelect').combobox("setValue", NumArr[0]);

                                                    $('#CheckType').combobox({ required: false });
                                                    $('#CheckType').combobox('clear');
                                                    break;
                                                case 3:
                                                    $('#CheckTypeTr').hide();
                                                    $('#NumTypeSelectTr').hide();

                                                    //删除 选项和数字的选择
                                                    $('#CheckType').combobox({ required: false });
                                                    $('#CheckType').combobox('clear');

                                                    $('#NumTypeSelect').combobox({ required: false });
                                                    $('#NumTypeSelect').combobox('clear');
                                                    $('#NumType1').numberbox("setValue", "");
                                                    $('#NumType2').numberbox("setValue", "");
                                                    $('#NumType1').numberbox({ required: false });
                                                    $('#NumType2').numberbox({ required: false });

                                                    break;
                                            }
                                            $('#IsInspectionRegistration').combobox("setValue", varObjects[0].IsInspectionRegistration);
                                            $('#IsControl').combobox("setValue", varObjects[0].IsControl);
                                           
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    });
                }
                else {
                    $.tool.DataGet('CsEquipment', 'GetMaxSort', "Type=MaintenanceStandardDetail&ID=" + $("#MaintenanceStandardId").val(),
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
            //保存方法
            function Save() {
                if ($('#frmForm').form("validate")) {
                    var NumTypeStr = "";
                    if ($('#NumType2').numberbox('getValue') != "") {
                        NumTypeStr = $('#NumTypeSelect').combobox("getValue") + ',' + $('#NumType1').numberbox('getValue') + ',' + $('#NumType2').numberbox('getValue');
                    } else if ($('#NumType1').numberbox('getValue') != "") {
                        NumTypeStr = $('#NumTypeSelect').combobox("getValue") + ',' + $('#NumType1').numberbox('getValue');
                    }
                    $('#NumType').val(NumTypeStr);
                    $.tool.DataPostChk('frmForm', 'CsEquipment', 'SaveMaintenanceStandardDetail', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Close("1");
                            } else {
                                HDialog.Close(_Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            //页面初始化
            $(function () {
                $('#CheckType').combobox('clear');
                Load();
            });
        </script>
    </form>
</body>
</html>
