<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckRoomProblemEdit.aspx.cs" Inherits="M_Main.HouseInspect.CheckRoomProblemEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑查验问题</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    
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
                        <input id="Sort" name="Sort" class="easyui-validatebox" data-options="required:true" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" style="border: 1px #cccccc solid; width: 200px;height: 20px" />
                    </td>
                    <td class="TdTitle">问题类型：</td>
                    <td class="TdContentSearch">
                        <input id="Content" name="Content" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;height: 20px" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">问题级别</td>
                    <td class="TdContentSearch">
                        <select id="ProblemLevel" name="ProblemLevel" data-options="required:true" isdctype='true' dctype="问题级别" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 204px;height: 22px">
                        </select>
                    </td>
                    <td class="TdTitle">整改时限（天）</td>
                    <td class="TdContentSearch">
                        <input id="TimeLimit" name="TimeLimit" class="easyui-validatebox" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" style="border: 1px #cccccc solid; width: 200px;height: 20px" />
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
         <input type="hidden" id="ObjectId" name="ObjectId" />
    <input type="hidden" id="ID" name="ID" />
    <input type="hidden" id="OpType" name="OpType" />
    </form>
     <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <script type="text/javascript">
        
        function Load() {
            $("#ObjectId").val(GetQueryString('ObjectId'));
            $("#ID").val(GetQueryString('ID'));
            $("#OpType").val(GetQueryString('OpType'));
            if (GetQueryString('OpType') == 'edit') {
                $.tool.DataGet('CsHouseInspect', 'GetCheckRoomProblemList', 'ID=' + $("#ID").val() + '&page=1&rows=1',
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        console.log($("#ProblemLevel").val())
                        $("#ProblemLevel").val(varObjects.rows[0].ProblemLevel);
                        $("#Sort").val(varObjects.rows[0].Sort);
                        $("#Content").val(varObjects.rows[0].Content); 
                        $("#TimeLimit").val(varObjects.rows[0].TimeLimit);
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
            $.tool.DataPostChk('frmFormStandard', 'CsHouseInspect', 'SaveCheckRoomProblem', $('#frmFormStandard').serialize(),
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
