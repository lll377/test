<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskGenerationEdit.aspx.cs" Inherits="M_Main.HouseInspect.TaskGenerationEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查验任务修改</title>
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
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
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

        /*  .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }*/

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
            width: 160px;
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
    <form id="frmForm" runat="server">
        <div class="Container">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">修改原因：</td>
                    <td class="TdContentSearch">
                        <select id="Reason" name="Reason" onchange="FrequencyChange(this)" isdctype='true' dctype="修改原因" class="easyui-validatebox" data-options="required:true" style="width: 182px;height:22px; border: 1px solid #cccccc;">
                        </select>
                    </td>
                    <td class="TdTitle">查验岗位：</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoleName" name="RoleName" class="easyui-validatebox" onclick="SelRole()" style="width: 182px; height:20px;border: 1px solid #cccccc;" readonly="readonly" />
                        <input type="hidden" id="RoleCode" name="RoleCode" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间：</td>
                    <td class="TdContentSearch">
                        <input class="Control_IteminputNoStyle" id="BeginTime" name="BeginTime"
                            style="width: 180px;height:20px; border: 1px solid #cccccc;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', minDate: new Date() })"
                            format="date" data-options="required:true" />
                    </td>
                    <td class="TdTitle">结束时间：</td>
                    <td class="TdContentSearch">
                        <input class="Control_IteminputNoStyle" id="EndTime" name="EndTime"
                            style="width: 181px;height:20px; border: 1px solid #cccccc;" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', minDate: new Date() })"
                            format="date" data-options="required:true" />
                    </td>
                </tr>
            </table>

        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="修改" id="BtnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
        </div>
        <input type="hidden" id="TaskId" name="TaskId" />
        <input type="hidden" id="HiCommID" name="HiCommID" />
        <script type="text/javascript">
            //选择岗位
            function SelRole() {
                HDialog.Open('500', '450', '../HouseInspect/SelSpecificRole.aspx', '选择岗位', true, function callback(_Data) {
                    if (_Data != "") {
                        var arrRet = _Data.split(',');
                        $("#RoleCode").val(arrRet[0]);
                        $("#RoleName").val(arrRet[1]);
                    }
                });
            }

            function Load() {
                $("#TaskId").val(GetQueryString("TaskId"));
                $("#HiCommID").val(GetQueryString("HiCommID"));
                $.tool.DataPostChk('frmForm', 'CsHouseInspect', 'GetTaskInfo', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.rows.length > 0) {
                            $("#RoleCode").val(varObjects.rows[0].RoleCode);
                            $("#RoleName").val(varObjects.rows[0].RoleName);
                            $("#BeginTime").val(varObjects.rows[0].BeginTime);
                            $("#EndTime").val(varObjects.rows[0].EndTime);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            Load();

            function Close() {
                HDialog.Close();
            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function Save() {
                if ($("#BeginTime").val() > $("#EndTime").val()) {
                    HDialog.Info("开始时间不能大于结束时间");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'CsHouseInspect', 'EditTask', $('#frmForm').serialize(),
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
        </script>
    </form>
</body>
</html>
