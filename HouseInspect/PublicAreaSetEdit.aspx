﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublicAreaSetEdit.aspx.cs" Inherits="M_Main.HouseInspect.PublicAreaSetEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查验公区编辑</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            margin-bottom: 53px;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body>
    <form id="frmFormStandard" runat="server">
        <div class="Container">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">序号</td>
                    <td class="TdContentSearch">
                        <input id="Sort" name="Sort" class="easyui-validatebox" data-options="required:true" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" style="border: 1px #cccccc solid; width: 200px;height:20px" />
                    </td>
                    <td class="TdTitle">公区编号：</td>
                    <td class="TdContentSearch">
                        <input id="PublicAreaCode" name="PublicAreaCode" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height:20px" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">公区名称：</td>
                    <td class="TdContentSearch">
                        <input id="PublicAreaName" name="PublicAreaName" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height:20px" data-options="required:true" />
                    </td>
                    <td class="TdTitle">公区类型</td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="PublicAreaType" name="PublicAreaType" data-options="required:true" isdctype='true' dctype="公区类型" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 204px;height:22px">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">备注：</td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="Remark" name="Remark" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 99%;"></textarea>
                    </td>

                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;"
            id="BtnLi">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="BtnSave" onclick="Save();">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" id="BtnClose" onclick=" HDialog.Close();">放弃</a>
        </div>
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="OpType" name="OpType" />
    </form>
    <script>
        function Load() {
            $("#CommId").val(GetQueryString('CommID'));
            $("#Id").val(GetQueryString('Id'));
            $("#OpType").val(GetQueryString('OpType'));
            if (GetQueryString('OpType') == 'edit') {
                $.tool.DataGet('CsHouseInspect', 'GetPublicAreaSetList', 'ID=' + $("#Id").val() + '&page=1&rows=1',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        $("#Sort").val(varObjects.rows[0].Sort);
                        $("#PublicAreaCode").val(varObjects.rows[0].PublicAreaCode);
                        $("#PublicAreaName").val(varObjects.rows[0].PublicAreaName);
                        $("#PublicAreaType").val(varObjects.rows[0].PublicAreaType);
                        $("#Remark").val(varObjects.rows[0].Remark);

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            else {

            }
        }
        $(document).ready(function () {
            Load();
        });
        function Save() {
            $.tool.DataPostChk('frmFormStandard', 'CsHouseInspect', 'SavePublicAreaSet', $('#frmFormStandard').serialize(),
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

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    </script>
</body>
</html>