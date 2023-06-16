<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitPlanDetail.aspx.cs" Inherits="M_Main.Visit.VisitPlanDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>拜访计划明细</title>
    <link href="../css/button.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: hidden;
        }

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

        .TdContentSearchDisable {
            background-color: #E3E3E3;
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

        .messager-body {
            padding: 15px;
        }

        .datagrid-mask-msg {
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="IsView" name="IsView" runat="server" />
        <input type="hidden" id="ID" name="ID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="PlanState" name="PlanState" value="0" runat="server" />
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="PlanInformation" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">计划信息</a>
                </li>
                <li class="" refpage="QuestionInformation" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">问卷信息</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" id="ContentBody" style="padding: 10px; overflow: auto;">
                        <table class="SearchTable">
                            <tr>
                                <td class="TdTitle">项目名称:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="CommName" name="CommName" runat="server" class="easyui-validatebox"
                                        data-options="required:true" readonly />
                                    <input type="hidden" id="CommID" name="CommID" runat="server" />
                                </td>
                                <td class="TdTitle">拜访类别:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="VisitCategoryName" name="VisitCategoryName" runat="server" onclick="SelVisitVategory()" class="easyui-validatebox"
                                        data-options="required:true" readonly />
                                    <input type="hidden" id="VisitCategoryID" name="VisitCategoryID" runat="server" />
                                </td>
                                <td class="TdTitle">问卷类别:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="QuestionnaireCategoryName" name="QuestionnaireCategoryName" runat="server" onclick="SelQuestCategory()"
                                        class="easyui-validatebox" data-options="required:true" readonly />
                                    <input type="hidden" id="QuestionnaireCategoryID" name="QuestionnaireCategoryID" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">是否评分:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="IsScoreName" name="IsScoreName" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                                    <input type="hidden" id="IsScore" name="IsScore" runat="server" />
                                </td>
                                <td class="TdTitle">计划开始时间:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="PlanBeginTime" name="PlanBeginTime" runat="server" class="easyui-datebox" data-options="editable:false,required:true" />
                                </td>
                                <td class="TdTitle">计划结束时间:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="PlanEndTime" name="PlanEndTime" runat="server" class="easyui-datebox" data-options="editable:false,required:true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">计划名称:</td>
                                <td class="TdContentSearch" colspan="5">
                                    <textarea id="PlanName" name="PlanName" onclick="PlanNameInsert()" maxlength="2000" runat="server" class="easyui-validatebox" data-options="required:true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">计划目的:</td>
                                <td class="TdContentSearch" colspan="5">
                                    <textarea id="PlanObjective" name="PlanObjective" maxlength="2000" runat="server" class="easyui-validatebox"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">交房状态:</td>
                                <td class="TdContentSearch">
                                    <select id="RoomState" name="RoomState" class="easyui-combobox" style="width: 160px;" runat="server"
                                        data-options="editable:false,panelHeight: 200,panelWidth:'auto',required:true,multiple:true,onSelect:RoomStateSelected,onUnselect:RoomStateSelected">
                                    </select>
                                </td>
                                <td class="TdTitle">使用性质:</td>
                                <td class="TdContentSearch">
                                    <select id="PropertyUses" name="PropertyUses" class="easyui-combobox" style="width: 160px;" runat="server"
                                        data-options="editable:false,panelHeight: 200,required:true,multiple:true,onSelect:PropertyUsesSelected,onUnselect:PropertyUsesSelected">
                                    </select>
                                </td>
                                <td class="TdTitle"></td>
                                <td class="TdContentSearch"></td>
                            </tr>
                            <tr>
                                <td class="TdTitle">当前总户数:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="TotalHouseholds" name="TotalHouseholds" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                                </td>
                                <td class="TdTitle">计划覆盖率(%):</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="PlanCoverageRate" name="PlanCoverageRate" runat="server" class="easyui-numberbox" data-options="required:true,min:0,precision:2" />
                                </td>
                                <td class="TdTitle">是否推送业主:</td>
                                <td class="TdContentSearch">
                                    <select id="IsPushOwner" name="IsPushOwner">
                                        <option value="否" selected="selected">否</option>
                                        <option value="是">是</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">责任岗位:</td>
                                <td class="TdContentSearch">
                                    <textarea type="text" id="RoleName" name="RoleName" runat="server" style="width: 92%;" onclick="SelRole()" class="easyui-validatebox"
                                        data-options="required:true" readonly></textarea>
                                    <input type="hidden" id="RoleCode" name="RoleCode" runat="server" />
                                </td>
                                <td class="TdTitle">责任人:</td>
                                <td class="TdContentSearch" colspan="3">
                                    <textarea id="UserName" name="UserName" maxlength="2000" runat="server" onclick="SelUser()" class="easyui-validatebox"
                                        data-options="required:true" readonly></textarea>
                                    <input type="hidden" id="UserCode" name="UserCode" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">计划人:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="PlanUserName" name="PlanUserName" runat="server" onclick="SelPlanUser()" class="easyui-validatebox" readonly />
                                    <input type="hidden" id="PlanUserCode" name="PlanUserCode" runat="server" />
                                </td>
                                <td class="TdTitle">计划时间:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="PlanTime" name="PlanTime" runat="server" class="easyui-datebox" data-options="editable:false,required:true" />
                                </td>
                                <td class="TdTitle">问卷标准分:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="QuestionnaireStandardScore" name="QuestionnaireStandardScore" runat="server" class="easyui-validatebox TdContentSearchDisable"
                                        readonly />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">备注:</td>
                                <td class="TdContentSearch" colspan="5">
                                    <textarea id="Remark" name="Remark" maxlength="1500" runat="server" class="easyui-validatebox"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">是否关闭:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="IsCloseName" name="IsCloseName" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly />
                                </td>
                                <td class="TdTitle">关闭人:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="CloseUserName" name="CloseUserName" runat="server" class="easyui-validatebox TdContentSearchDisable"
                                        readonly />
                                    <input type="hidden" id="CloseUserCode" name="CloseUserCode" runat="server" />
                                </td>
                                <td class="TdTitle">关闭时间:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="CloseTime" name="CloseTime" runat="server" class="easyui-validatebox TdContentSearchDisable"
                                        readonly />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">关闭原因:</td>
                                <td class="TdContentSearch" colspan="5">
                                    <textarea id="CloseReasonName" name="CloseReasonName" maxlength="1500" runat="server" class="easyui-validatebox TdContentSearchDisable" readonly></textarea>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: center; width: 100%; padding: 5px 0; height: 40px;">
                            <input type="button" class="button" value="保存" id="BtnSave" runat="server" />
                            <input type="button" class="button" value="放弃返回" id="BtnCancle" onclick="btnClose();" runat="server" />
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <div id="TableContainer"></div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function InitTableHeight() {
                var H = $(window).height();
                var HeaderHeight = $('.nav-tabs').height();
                $('.panel-body').height(H - HeaderHeight - 1 + "px");
                $('#ContentBody').height(H - HeaderHeight - 21 + "px");
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
            //初始化计划名称
            function PlanNameInsert() {
                if ($('#PlanName').val() == "") {
                    var PlanNameStr = $('#CommName').val() + $('#VisitCategoryName').val() + "(" + $('#PlanBeginTime').datebox("getValue") + "  ----  " + $('#PlanEndTime').datebox("getValue") + ")"
                    $('#PlanName').val(PlanNameStr)
                }
            }

            //房屋状态选择，查询对应房屋状态下对应项目的户数
            function RoomStateSelected(record) {
                var IsView = GetQueryStringDecodeURI("IsView"); //是否是查看
                if ($('#IsCloseName').val() == "是" || $('#PlanState').val() == "2" || $('#PlanState').val() == "1" || IsView == "1") {
                    $('#RoomState').combobox("unselect", record.value);
                    return false;
                }
                var NewRecordValue = $(this).combobox("getValues");
                var PropertyUsesValue = $('#PropertyUses').combobox("getText");
                if (NewRecordValue != "" && PropertyUsesValue != "") {
                    var ParameterStr = "CommID=" + $('#CommID').val() + "&RoomState=" + NewRecordValue + "&PropertyUses=" + PropertyUsesValue;
                    $.tool.DataGet('Visit', 'GetCurrentHouseHoldCount', ParameterStr,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                $('#TotalHouseholds').val(_Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
            //使用性质选择
            function PropertyUsesSelected(record) {
                var IsView = GetQueryStringDecodeURI("IsView"); //是否是查看
                if ($('#IsCloseName').val() == "是" || $('#PlanState').val() == "2" || $('#PlanState').val() == "1" || IsView == "1") {
                    $('#PropertyUses').combobox("unselect", record.value);
                    return;
                }
                var NewRecordValue = $(this).combobox("getText");
                var RoomStateValue = $('#RoomState').combobox("getValues");
                if (NewRecordValue != "" && RoomStateValue != "") {
                    var ParameterStr = "CommID=" + $('#CommID').val() + "&RoomState=" + RoomStateValue + "&PropertyUses=" + NewRecordValue;
                    $.tool.DataGet('Visit', 'GetCurrentHouseHoldCount', ParameterStr,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                $('#TotalHouseholds').val(_Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            //选择拜访类别
            function SelVisitVategory() {
                HDialog.Open('650', '400', '../Visit/Dialog/VisitCategory.aspx', '选择拜访类别', false, function callback(_Data) {
                    if (_Data) {
                        var Obj = eval("(" + _Data + ")");
                        //是修改情况的话 就需要判断一下是否修改了拜访类别
                        if ($('#OpType').val() == "edit") {
                            if ($("#VisitCategoryID").val() != Obj.ID) {
                                HDialog.Info("修改拜访类别会导致，计划与对应的问卷问题类别不对应，请先保存计划再编辑问卷信息（保存后计划对应的问卷问题会重新加载）！");
                            }
                        }
                        $("#VisitCategoryName").val(Obj.VisitCategory);
                        $("#VisitCategoryID").val(Obj.ID);
                        $("#QuestionnaireCategoryID").val('');
                        $("#QuestionnaireCategoryName").val('');
                        $('#IsScoreName').val("");
                        $('#IsScore').val("");

                    };
                })
            }

            //选择问卷类别
            function SelQuestCategory() {
                if ($("#VisitCategoryID").val() == "" || $("#VisitCategoryID").val() == null) {
                    HDialog.Info("请先选择拜访类别!");
                    return;
                }
                HDialog.Open('850', '600', '../Visit/Dialog/QuestionnaireCategory.aspx?VisitCategoryID=' + $("#VisitCategoryID").val(), '选择问卷类别', false, function callback(_Data) {
                    if (_Data) {
                        var Obj = eval("(" + _Data + ")");
                        //是修改情况的话 就需要判断一下是否修改了拜访类别
                        if ($('#OpType').val() == "edit") {
                            if ($("#VisitCategoryID").val() != Obj.ID) {
                                HDialog.Info("修改问卷类别会导致，计划与对应的问卷问题类别不对应，请先保存计划再编辑问卷信息（保存后计划对应的问卷问题会重新加载）！");
                            }
                        }

                        $("#QuestionnaireCategoryID").val(Obj.ID);
                        $("#QuestionnaireCategoryName").val(Obj.QuestionnaireCategory);
                        if (Obj.IsScore == "0") {
                            $('#IsScoreName').val("否");
                        } else if (Obj.IsScore == "1") {
                            $('#IsScoreName').val("是");
                        }
                        $('#IsScore').val(Obj.IsScore);
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
            //选择计划人
            function SelPlanUser() {
                HDialog.Open('850', '600', '../Visit/SelUser.aspx?IsSingle=1&CommID=' + $("#CommID").val(), '选择计划人', false, function callback(_Data) {
                    if (_Data) {
                        $("#PlanUserCode").val(_Data.split(';')[1]);
                        $("#PlanUserName").val(_Data.split(';')[0]);
                    };
                })
            }


            //页面关闭
            function btnClose() {
                HDialog.Close("");
            }

            /* 拜访问卷 列表内容 */
            var Columns = [[
                { field: 'IssueTypeName', title: '问题类别', width: 120, align: 'center', sortable: true },
                {
                    field: 'IssueName', title: '问题名称', width: 200, align: 'center', sortable: true, formatter: function (value, row, index) {
                        var str = "<a style=\"color:blue\" onclick=\"PlanQuestionnaireDetail('" + row.ID + "','edit','" + row.IsScore +
                            "','" + row.VisitCategoryID + "','" + row.QuestionnaireCategoryID + "','" + row.PlanID + "')\" href=\"javascript:void(0);\">" + row.IssueName + "</a>";
                        return str;
                    }
                },
                { field: 'IssueProperty', title: '问题属性', width: 100, align: 'center', sortable: true },
                { field: 'IssueStandardScore', title: '问题标准分', width: 100, align: 'center', sortable: true },
                {
                    field: 'IsProjectRequired', title: '项目是否必选', width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                        if (value == "1") {
                            return "是"
                        }
                        return "否";
                    }
                },
                //{ field: 'BudgetPayMoney', title: '问题选项', width: 160, align: 'center', sortable: true },
                { field: 'Remark', title: '备注', width: 180, align: 'center', sortable: true }
            ]];

            var ToolBar = [
                {
                    text: '新增问题',
                    iconCls: 'icon-add',
                    handler: function () {
                        var IsScoreStr = $('#IsScore').val();
                        var VisitCategoryIDStr = $('#VisitCategoryID').val();
                        var QuestionnaireCategoryIDStr = $('#QuestionnaireCategoryID').val();
                        if (VisitCategoryIDStr == "") {
                            HDialog.Info("请选择拜访类别！");
                            return;
                        }
                        if (QuestionnaireCategoryIDStr == "") {
                            HDialog.Info("请选择问卷类别！");
                            return;
                        }
                        PlanQuestionnaireDetail('', 'insert', IsScoreStr, VisitCategoryIDStr, QuestionnaireCategoryIDStr, $('#ID').val());
                    }
                }, '-', {
                    text: '删除问题',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        //判断问题是否是被项目必选
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (row == null) {
                            HDialog.Info('请选项需要删除的问题数据!');
                            return;
                        }
                        if (row.IsProjectRequired == "1") {
                            HDialog.Info('项目必选问题，不允许删除!');
                            return;
                        }
                        DelPlanQuestionnaire(row.ID, row.PlanID);
                    }
                }, '-',
                {
                    text: '重新加载问题',
                    iconCls: 'icon-reload',
                    handler: function () {
                        //$('#ID').val() 为计划的id
                        ReloadPlanQuestionnaire($('#ID').val());
                    }
                }
            ];

            //删除拜访计划问题
            function DelPlanQuestionnaire(ID, PlanID) {
                $.messager.confirm('确定', '是否确认删除选择的问题?', function (r) {
                    if (r) {
                        $.tool.DataGet('Visit', 'DelVisitPlanQuestionnaireByID', "ID=" + ID + "&PlanID=" + PlanID,
                            function Init() {
                            },
                            function callback(data) {
                                if (data == "true") {
                                    HDialog.Info("删除成功！");
                                    LoadList();
                                } else {
                                    HDialog.Info(data);
                                }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }
                });
            }

            //重新加载拜访计划问题
            function ReloadPlanQuestionnaire(PlanID) {
                $.messager.confirm('确定', '是否确认重新加载问题(根据保存后的计划进行重新加载)?', function (r) {
                    if (r) {
                        $.tool.DataGet('Visit', 'ReloadVisitPlanQuestionQuestionnaire', "PlanID=" + PlanID,
                            function Init() {
                            },
                            function callback(data) {
                                if (data == "true") {
                                    HDialog.Info("重新加载成功！");
                                    LoadList();
                                } else {
                                    HDialog.Info(data);
                                }
                            },
                            function completeCallback() {
                            }, function errorCallback() {
                            });
                    }
                });
            }

            //查看计划问题详情
            function PlanQuestionnaireDetail(ID, OpType, IsScore, VisitCategoryID, QuestionnaireCategoryID, PlanID) {
                var h = $(window).height();
                var w = $(window).width();
                w = w;
                h = h * 6 / 7;
                HDialog.OpenWin(w, h + 20, '../Visit/VisitPlanQuestionnaireDetail.aspx?ID=' + ID + '&OpType=' + OpType + "&IsScore=" + IsScore + "&VisitCategoryID=" + VisitCategoryID + "&QuestionnaireCategoryID=" + QuestionnaireCategoryID + "&PlanID=" + PlanID, "拜访计划问题详情", false, function callback(_Data) {
                    if (_Data != "") {
                        LoadList();
                    }
                });
            }

            //加载 问卷问题
            function LoadList() {
                //新增的时候不能新增删除 已完成  或者是已关闭都不允许修改
                if ($('#OpType').val() == "insert" || $('#PlanState').val() == "1" || $('#PlanState').val() == "2" || $('#IsCloseName').val() == "是") {
                    ToolBar = [];
                }
                var ParameterStr = "ID=" + $('#ID').val();
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Visit&Command=GetVisitPlanQuestionnaireList&' + ParameterStr,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    columns: Columns,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    border: true,
                    toolbar: ToolBar,
                    rownumbers: "true",
                    width: '100%',
                    height: '100%',
                    remoteSort: false,
                    onLoadSuccess: function (data) {
                    },
                    onLoadError: function () {
                    }
                });
            }

            //保存
            $('#BtnSave').bind("click", function () {
                //验证条件
                if ($('#CommID').val() == "" || $('#CommID').val() == "0") {
                    HDialog.Info("项目不能为空。");
                    return;
                }
                //当前总户数
                if ($('#TotalHouseholds').val() == "" || $('#TotalHouseholds').val() == "0") {
                    HDialog.Info("当前总户数不能为空或者为0。");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'Visit', 'SaveVisitPlan', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            //判断是新增保存还是 修改保存
                            if ($('#OpType').val() == "insert") {
                                HDialog.Info("新增拜访计划成功，请编辑拜访计划问卷信息！");
                                location.href = '../Visit/VisitPlanDetail.aspx?ID=' + $('#ID').val() + '&OpType=edit';
                            } else {
                                if ($('#PlanState').val() != "0") {
                                    HDialog.Info("修改成功！");
                                    HDialog.Close("1");
                                } else {
                                    HDialog.Info("修改成功！");
                                    location.href = '../Visit/VisitPlanDetail.aspx?ID=' + $('#ID').val() + '&OpType=edit';
                                }
                            }
                        } else {
                            HDialog.Info(_Data);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            //加载页面数据
            function LoadData() {
                //修改的情况才加载数据
                if ($('#OpType').val() == "edit") {
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
                                    if (!!Obj[0].IsPushOwner) {
                                        $("#IsPushOwner").val(Obj[0].IsPushOwner);
                                    }
                                    ////加载easyui 加载不出来的数据
                                    if (!!Obj[0].PlanBeginTime) {
                                        $('#PlanBeginTime').datebox("setValue", formatDate(Obj[0].PlanBeginTime, 'yyyy-MM-dd'));
                                    }
                                    if (!!Obj[0].PlanEndTime) {
                                        $('#PlanEndTime').datebox("setValue", formatDate(Obj[0].PlanEndTime, 'yyyy-MM-dd'));
                                    }
                                    $('#RoomState').combobox("setValues", Obj[0].RoomState);
                                    if (!!Obj[0].PropertyUses) {
                                        $('#PropertyUses').combobox("setValues", Obj[0].PropertyUses);
                                    }
                                    $('#PlanCoverageRate').numberbox("setValue", Obj[0].PlanCoverageRate);
                                    if (!!Obj[0].PlanTime) {
                                        $('#PlanTime').datebox("setValue", formatDate(Obj[0].PlanTime, 'yyyy-MM-dd'));
                                    }
                                    $("#frmForm").form('validate');
                                    //判断数据状态  如果是 PlanState !=0 就需要控制了
                                    if (Obj[0].PlanState == "1") {
                                        //执行中
                                        $('textarea').each(function () {
                                            if ($(this).attr("id") != "UserName") {
                                                $(this).attr("disabled", "disabled");
                                            }
                                        });
                                        //$('.easyui-combobox').combobox('disable');
                                        $('input').each(function () {
                                            if ($(this).hasClass("easyui-datebox")) {
                                                $(this).datetimebox('disable')
                                            } else if ($(this).hasClass("easyui-numberbox")) {
                                                $(this).numberbox('disable')
                                            } else {
                                                if ($(this).attr("id") != "RoleName" &&
                                                    $(this).attr("id") != "RoleCode" &&
                                                    $(this).attr("id") != "UserCode") {
                                                    $(this).attr("disabled", "disabled");
                                                }
                                            }
                                        });
                                    }
                                    var IsView = GetQueryStringDecodeURI("IsView"); //是否是查看
                                    //已关闭的时候啥子都不允许修改
                                    if (Obj[0].IsClose == "1" || Obj[0].PlanState == "2" || IsView == "1") {
                                        $('textarea').attr("disabled", "disabled");
                                        //$('.easyui-combobox').combobox('disable');
                                        $('input').each(function () {
                                            if ($(this).hasClass("easyui-datebox")) {
                                                $(this).datetimebox('disable')
                                            } else if ($(this).hasClass("easyui-numberbox")) {
                                                $(this).numberbox('disable')
                                            } else {
                                                $(this).attr("disabled", "disabled");
                                            }
                                        });
                                        $('#BtnSave').css("display", "none");
                                    }
                                }
                                $('#BtnCancle').removeAttr("disabled");
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
                InitTableHeight();

                $(".tabs-container li").click(function () {
                    var refsel = $(this).attr("refsel");
                    //加载 问卷信息
                    if (refsel == 0) {
                        setTimeout(function () { LoadList() }, 100);
                        $(this).attr("refsel", "1");
                    }
                });

                LoadData();
            })

        </script>
    </form>
</body>
</html>
