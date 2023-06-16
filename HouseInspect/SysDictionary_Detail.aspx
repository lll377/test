<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysDictionary_Detail.aspx.cs" Inherits="M_Main.HouseInspect.SysDictionary_Detail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <title>查验字典</title>
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
<body style="margin: 0px; margin-top: 0px;">
    <form id="HIDictionary_Detail" runat="server">
        <div class="Container">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">字典类型</td>
                    <td class="TdContentSearch">
                        <select id="DType" name="DType" style="width:300px;height:22px" class="easyui-validatebox"
                            data-options="required:true">
                            <option value="" style="color: #000000;"></option>
                            <optgroup label="字典管理" style="color: Blue; font-weight: bold;">
                                <option value="产品形态" style="color: #000000;">产品形态</option>
                                <option value="装修属性" style="color: #000000;">装修属性</option>
                                <option value="查验批次" style="color: #000000;">查验批次</option>
                                <option value="所属专业" style="color: #000000;">所属专业</option>
                                <option value="重要程度" style="color: #000000;">重要程度</option>
                                <option value="修改原因" style="color: #000000;">修改原因</option>
                                <option value="不合格原因" style="color: #000000;">不合格原因</option>
                                <option value="问题级别" style="color: #000000;">问题级别</option>
                                <option value="房间类型" style="color: #000000;">房间类型</option>
                                <option value="公区类型" style="color: #000000;">公区类型</option>
                            </optgroup>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">字典名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Name" name="Name" runat="server" style="width:300px;height:22px" class="easyui-validatebox"
                            data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">字典编码</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Code" name="Code" class="easyui-validatebox" style="width:300px;height:22px" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">字典序号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="Sort" name="Sort" class="easyui-validatebox" style="width:300px;height:22px" data-options="required:true" onkeyup="javascript:CheckInputIntFloat(this);" onchange="javascript:CheckInputIntFloat(this);" onblur="javascript:CheckInputIntFloat(this);" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
        </div>

        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="OpType" name="OpType" />
        <script language="javascript" type="text/javascript">
            function CheckInputIntFloat(oInput) {
                if ('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/, '')) {
                    oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '' : oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
                }
            }

            function Load() {
                $("#Id").val(GetQueryString('Id'));
                $("#OpType").val(GetQueryString('OpType'));
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CsHouseInspect', 'SelDictionary', $('#HIDictionary_Detail').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();
                                $("#HIDictionary_Detail").form('validate');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            function Close() {
                HDialog.Close();
            }

            function Save() {
                $.tool.DataPostChk('HIDictionary_Detail', 'CsHouseInspect', 'SaveDictionary', $('#HIDictionary_Detail').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            HDialog.Info(_Data);
                        }
                        else {
                            HDialog.Close();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
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
