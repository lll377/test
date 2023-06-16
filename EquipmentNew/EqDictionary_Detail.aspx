<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EqDictionary_Detail.aspx.cs" Inherits="M_Main.EquipmentNew.EqDictionary_Detail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
            padding: 5px;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

            .Container ul {
                margin: 0px auto;
                clear: both;
            }

                .Container ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: center;
                    margin-bottom: 10px;
                    line-height: 22px;
                    width: 90px;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 80%;
                }

                .Container ul .Title {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 100%;
                }

                .Container ul .ContentBlank {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .Container ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                }

            .Container .Content input {
                width: 70%;
                border: 1px solid #cccccc;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content select {
                width: 71.5%;
                border: 1px solid #cccccc;
                height: 26px;
                padding-left: 2px;
            }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;">
    <form id="EqDictionary_Detail" runat="server">
        <div class="Container">
            <ul>
                <li class="InputTitle">字典类型：</li>
                <li class="Content">
                    <select id="DType" name="DType" class="easyui-validatebox"
                        data-options="required:true">
                        <option value="" style="color: #000000;"></option>
                        <optgroup label="字典管理" style="color: Blue; font-weight: bold;">
                            <option value="通用设备空间" style="color: #000000;">通用设备空间</option>
                            <option value="巡检类别" style="color: #000000;">巡检类别</option>
                            <option value="维保类别" style="color: #000000;">维保类别</option>
                            <option value="大事件类别" style="color: #000000;">大事件类别</option>
                            <option value="关闭原因" style="color: #000000;">关闭原因</option>
                            <%-- <option value="巡检频率" style="color: #000000;">巡检频率</option> --%>
                        </optgroup>
                    </select>
                </li>
                <li class="InputTitle">字典名称：</li>
                <li class="Content">
                    <input type="text" id="Name" name="Name" runat="server" class="easyui-validatebox"
                        data-options="required:true" />
                </li>

                <li class="InputTitle">字典编码：</li>
                <li class="Content">
                    <input type="text" id="Code" name="Code" class="easyui-validatebox" data-options="required:true" />
                </li>
                <li class="InputTitle">字典序号：</li>
                <li class="Content">
                    <input type="text" id="Sort" name="Sort" class="easyui-validatebox" data-options="required:true" />
                </li>

                <li class="Title">
                    <table style="margin: auto;">
                        <tr>
                            <td style="height: 25px;"></td>
                            <td style="height: 25px; line-height: 25px;"></td>
                            <td>
                                <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
                                <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </li>
            </ul>
        </div>

        <input type="hidden" id="Id" name="Id" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <script language="javascript" type="text/javascript">
            function Load() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CsEquipment', 'GetDictionaryById', $('#EqDictionary_Detail').serialize(),
                            function Init() {
                            },
                            function callback(_Data) {
                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                if (varObjects.length > 0) {
                                    $.JQForm._Data = _Data;
                                    $.JQForm.FillForm();
                                    $("#EqDictionary_Detail").form('validate');
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                }
            }
            function Close() {
                HDialog.Close("true");
            }
            function Save() {
                $.tool.DataPostChk('EqDictionary_Detail', 'CsEquipment', 'SaveDictionary', $('#EqDictionary_Detail').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "") {
                                Close();
                            } else {
                                HDialog.Info(_Data)
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }
            Load();
        </script>
    </form>
</body>
</html>
