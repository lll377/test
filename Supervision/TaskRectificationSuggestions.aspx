<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskRectificationSuggestions.aspx.cs" Inherits="M_Main.Supervision.TaskRectificationSuggestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>改进建议及提升方向</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="panel-body" style="padding: 0px;">
            <div id="Suggestions" style="width: 100%; overflow: hidden;"></div>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <a href="javascript:void(0)" id="btnSave" class="easyui-linkbutton" style="display:none" data-options="iconCls:'icon-save',width:80" onclick="Save();">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="CommId" name="CommId" />
        <input type="hidden" id="TaskId" name="TaskId" />
        <script type="text/javascript">
            //加载 改进建议及提升方向 
            function Load() {
                var H = $(window).height();
                $('#Suggestions').height(H - 180 + "px");
                var ue = UE.getEditor('Suggestions',
                    {
                        initialFrameWidth: null,
                        autoHeightEnabled: false
                    });
                //加载内容
                ue.ready(function () {
                    // editor准备好之后才可以使用
                    $.tool.DataGet('CSSupervision', 'GetTaskRectificationSuggestions', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (obj.length > 0)
                                ue.setContent(obj[0].Content);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                });
            }

            function Close() {
                window.parent.HDialog.Close();
            }

            function Save() {
                var SuggestionsResult = UE.getEditor('Suggestions').getContent();
                if (SuggestionsResult.length > 0) {
                    SuggestionsResult = escape(SuggestionsResult);
                }
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SaveTaskRectificationSuggestions', $('#frmForm').serialize() + '&Content=' + SuggestionsResult,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("保存成功");
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(function () {
                $("#OpType").val(localStorage.getItem('OpType'));
                $("#TaskId").val(localStorage.getItem('TaskId'));
                $("#CommId").val(localStorage.getItem('CommId'));
                Load();
                if ($("#OpType").val() == "edit")
                    $("#btnSave").show();
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
