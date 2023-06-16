<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysObjectEdit.aspx.cs" Inherits="M_Main.HouseInspect.SysObjectEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body style="margin: 0px; margin-top: 0px; text-align: center;">
    <form id="frmFrom" runat="server" method="post">
        <table style="text-align: center; margin-left: 30px;margin-top:10px">
            <tr>
                <td style="height: 30px;">序号:</td>
                <td>
                    <input type="text" id="Sort" name="Sort" runat="server" style="width: 100%;height:20px; border: 1px solid #cccccc;" class="easyui-validatebox" />

                </td>
                <td style="height: 30px;">对象名称:</td>
                <td>
                    <input type="text" id="ObjectName" name="ObjectName" runat="server" style="width: 100%;height:20px; border: 1px solid #cccccc;" class="easyui-validatebox" data-options="required:true" />
                </td>
            </tr>
            <tr >
                <td></td>
                <td><span style="float: right; margin-left: 110px">
                    <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" /></span></td>
                <td><span style="float: right;">
                    <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" /></span>
                </td>
                <td></td>
            </tr>
        </table>
        <input type="hidden" id="IsChild" name="IsChild" />
        <input type="hidden" id="ObjectId" name="ObjectId" />
        <input type="hidden" id="ParentId" name="ParentId" />
        <script type="text/javascript">
            function Save() {
                $.tool.DataPostChk('frmFrom', 'CsHouseInspect', 'SaveObject', $('#frmFrom').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Close("true");
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Close() {
                HDialog.Close();
            }
            

            function Load() {
                $("#IsChild").val(GetQueryString('IsChild'));
                $("#ObjectId").val(GetQueryString('ObjectId'));
                $("#ParentId").val(GetQueryString('ParentId'));
                if (GetQueryString('IsChild') == '1') {//是新增子节点就传objectid
                    $.tool.DataGet('CsHouseInspect', 'GetMaxSort', "Type=HouseInspectObject&ObjId=" + $("#ObjectId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            $("#Sort").val(_Data);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {//是新增同级节点就传ParentId
                    $.tool.DataGet('CsHouseInspect', 'GetMaxSort', "Type=HouseInspectObject&ObjId=" + $("#ParentId").val(),
                            function Init() {
                            },
                            function callback(_Data) {
                                $("#Sort").val(_Data);
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                }
            }

            Load();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>