<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysPointEdit.aspx.cs" Inherits="M_Main.ComprehensivePatrols.SysPointEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>通用点位编辑</title>
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
<body style="overflow: hidden; margin: 0px; padding: 0px;">
    <form id="SysPoint" runat="server">
        <div style="padding: 5px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">序号:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Sort" name="Sort" class="easyui-numberbox" style="width:200px;" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">点位名称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PointName" name="PointName" maxlength="25" style="width:195px;" class="easyui-validatebox"
                            data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">点位简称:</td>
                    <td class="TdContentSearch">
                        <input type="text" id="PointCode" name="PointCode" maxlength="25" style="width:195px;" class="easyui-validatebox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">任务类型:</td>
                    <td class="TdContentSearch">
                        <select id="TaskType" name="TaskType" runat="server" class="easyui-combobox" style="width:200px;" data-options="editable:false,panelHeight: '100',required:true,multiple:true">
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
            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
            <input type="button" class="button" value="放弃返回" id="BtnReturn" onclick="btnClose();" />
        </div>

        <input type="hidden" id="SysPointId" name="SysPointId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <script language="javascript" type="text/javascript">
            function btnClose() {
                HDialog.Close("");
            }
            //加载页面数据
            function Load() {
                if ($("#OpType").val() == 'Edit') {
                    $.tool.DataGet('CpComPatrols', 'GetSysPointListById', "SysPointId=" + $('#SysPointId').val(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                            //$("#SysPointSave").form('validate');
                            //加载easyui控件加载不出来的值
                            $('#Sort').numberbox("setValue", varObjects[0].Sort);
                            $('#TaskType').combobox("setValues", varObjects[0].TaskType);
                            //$("#SysPointSave").form('validate');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                }
                else {
                    $.tool.DataGet('CpComPatrols', 'GetMaxSort', "Type=SysPoint&Id=",
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
            //保存
            function Save() {
                if ($('#SysPoint').form("validate")) {
                    $.tool.DataPostChk('SysPoint', 'CpComPatrols', 'SaveSysPoint', $('#SysPoint').serialize(),
                       function Init() {
                       },
                       function callback(_Data) {
                           switch (_Data) {
                               case "1":
                                   HDialog.Close("1");
                                   break;
                               case "1001":
                                   HDialog.Info("通用点位的任务类型已被通用对象使用，不允许修改");
                                   break;
                               case "-1":
                                   HDialog.Info("通用点位名称，或序号不能重复！");
                                   break;
                               default:
                                   HDialog.Info("出现错误请重试！");
                                   break;
                           }


                       },
                       function completeCallback() {
                       },
                       function errorCallback() {
                       });
                }
            }

            $(function () {
                $('#TaskType').combobox("clear");
                Load();
            });
        </script>

    </form>
</body>
</html>

