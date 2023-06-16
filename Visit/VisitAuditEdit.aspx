<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitAuditEdit.aspx.cs" Inherits="M_Main.Visit.VisitAuditEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>字典</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        /*.bootstrap_table tr td.title {
            width: 10%;
            text-align: center;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 35%;
            text-align: left;
        }*/

        .SearchTable {
            width: 100%;
            height: auto;
            border-left: 1px solid #E7EAEC;
            border-top: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 98%;
            height: 40px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 9%;
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
<body>
    <form id="mainForm" runat="server">
        <input type="hidden" name="OpType" id="OpType" />
        <input type="hidden" name="CommID" id="CommID" />
        <input type="hidden" name="PlanState" id="PlanState" value="2" />
        <div style="padding: 5px; padding-top: 30px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">
                        <span>原责任岗位</span>
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="OriginalRoleName" style="width: 98%; height: 28px;" name="OriginalRoleName" runat="server" class="easyui-validatebox"
                            data-options="required:true" readonly />
                        <input type="hidden" id="OriginalRoleCode" name="OriginalRoleCode" runat="server" />
                    </td>
                    <td class="TdTitle">
                        <span>现责任岗位</span>
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoleName" name="RoleName" style="width: 98%; height: 28px;" runat="server" onclick="SelRole()" class="easyui-validatebox"
                            data-options="required:true" readonly />
                        <input type="hidden" id="RoleCode" name="RoleCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"><span>原责任人</span></td>
                    <td class="TdContentSearch">
                        <textarea id="OriginalUserName" name="OriginalUserName" style="line-height: 12px;" maxlength="2000" runat="server" class="easyui-validatebox"
                            data-options="required:true" readonly></textarea>
                        <input type="hidden" id="OriginalUserCode" name="OriginalUserCode" runat="server" />
                    </td>
                    <td class="TdTitle"><span>现在责任人</span></td>
                    <td class="TdContentSearch">
                        <textarea id="UserName" name="UserName" style="line-height: 12px;" maxlength="2000" runat="server" onclick="SelUser()" class="easyui-validatebox"
                            data-options="required:true" readonly></textarea>
                        <input type="hidden" id="UserCode" name="UserCode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle"><span>计划开始时间</span></td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanBeginTime" name="PlanBeginTime" runat="server" class="easyui-datebox" readonly data-options="editable:false,required:true" />
                    </td>
                    <td class="TdTitle"><span>计划结束时间</span></td>
                    <td class="TdContentSearch">
                        <input type="text" id="PlanEndTime" name="PlanEndTime" runat="server" class="easyui-datebox" readonly data-options="editable:false,required:true" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="查看" id="btnSelect" onclick="PlanDetail();" />
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
        <%--<div class="btnFixed">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="送审" id="btnSaveAuditing" onclick="SaveAuditing();" />
            <input type="button" class="button" value="审批通过" id="btnCheckPass" onclick="SaveCheckPass();" />
            <input type="button" class="button" value="审批不通过" id="btnCheckNoPass" onclick="SaveCheckNoPass();" />
            <input type="button" class="button" value="驳回" id="btnReturn" onclick="SaveReturn();" />
            <input type="hidden" name="ID" id="ID" runat="server" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>--%>
    </form>
    <script type="text/javascript">
        $(function () {
            InitPage();
        });

        function InitPage() {
            var OpType = GetQueryStringDecodeURI("OpType");
            var ID = GetQueryStringDecodeURI("ID");
            var CommID = GetQueryStringDecodeURI("CommID");
            $("#OpType").val(OpType);
            $("#CommID").val(CommID);
            if (OpType == "Edit") {
                $("#ID").val(ID);
                InitData();

            }
        }
        function GetQueryStringDecodeURI(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) { return pair[1]; }
            }
            return (false);
        }
        function PlanDetail() {
            var h = $(window).height();
            var w = $(window).width();
            w = w * 5 / 7;
            HDialog.OpenWin(900, 600, '../Visit/VisitPlanDetail.aspx?ID=' + $("#ID").val() + '&OpType=edit&IsView=1', "拜访计划", false, function callback(_Data) {
                if (_Data != "") {
                    LoadList();
                }
            });

        }
        //选择责任人
        function SelUser() {
            if ($("#RoleCode").val() == "" || $("#RoleCode").val() == null) {
                HDialog.Info("请先选择责任岗位!");
                return;
            }
            HDialog.Open('850', '600', '../Visit/SelUser.aspx?RoleCode=' + $("#RoleCode").val(), '选择责任人', false, function callback(_Data) {
                if (_Data) {
                    $("#UserCode").val(_Data.split(';')[1]);
                    $("#UserName").val(_Data.split(';')[0]);
                };
            })
        }
        //选择责任岗位
        function SelRole() {
            HDialog.Open('950', '600', '../Visit/SelRoleList.aspx?CommId=' + $("#CommID").val(), '选择责任岗位', false, function callback(_Data) {
                if (_Data) {
                    var strs = _Data.split('|');
                    $("#RoleName").val(strs[0]);
                    $("#RoleCode").val(strs[1]);
                    $("#UserCode").val('');
                    $("#UserName").val('');
                };
            })
        }
        function InitData() {
            var ParameterStr = "ID=" + $('#ID').val();
            $.tool.DataGet('Visit', 'GetVisitPlanByID', ParameterStr,
                function Init() {
                },
                function callback(Result) {
                    if (Result.length > 0) {
                        //加载页面数据
                        $.JQForm._Data = Result;
                        $.JQForm.FillForm();
                        var Obj = JSON.parse(Result);
                        if (Obj != null) {
                            ////加载easyui 加载不出来的数据
                            if (!!Obj[0].PlanBeginTime) {
                                $('#PlanBeginTime').datebox("setValue", formatDate(Obj[0].PlanBeginTime, 'yyyy-MM-dd'));
                            }
                            if (!!Obj[0].PlanEndTime) {
                                $('#PlanEndTime').datebox("setValue", formatDate(Obj[0].PlanEndTime, 'yyyy-MM-dd'));
                            }
                            $('#OriginalRoleName').val(Obj[0].RoleName);
                            $('#OriginalRoleCode').val(Obj[0].RoleCode);
                            $('#OriginalUserName').val(Obj[0].UserName);
                            $('#OriginalUserCode').val(Obj[0].UserCode);
                            $("#mainForm").form('validate');
                            $("#PlanState").val("2");
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

        function Save() {
            if ($('#mainForm').form("validate")) {
                $.tool.DataPostJson('Visit', 'SaveVisitPlan', $.JQForm.GetStrParam(),
                    function Init() {
                        $("#btnSave").attr("disabled", "disabled");
                    },
                    function callback(data) {
                        if (data) {

                        } else { $.messager.alert('温馨提示', "修改失败！"); }
                    },
                    function completeCallback() {
                        $("#btnSave").removeAttr("disabled");
                    }, function errorCallback() {
                        $("#btnSave").removeAttr("disabled");
                    });
            }
        }
        function Close() {
            HDialog.Info("1");
            //HDialog.CloseWindow("", parent.window.name);
        }
    </script>
</body>
</html>
