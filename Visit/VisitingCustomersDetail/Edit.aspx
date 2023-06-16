<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="M_Main.Visit.VisitingCustomersDetail_1.Edit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>拜访客户明细编辑</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="../../css/button.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>

    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script src="../../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>

    <style type="text/css">
        .bootstrap_table tr td.title {
            width: 13%;
            text-align: right;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            width: 37%;
            text-align: left;
        }

        .bootstrap_table tr td {
            padding: 5px 10px;
        }

        .answer tr {
            height: 29px;
            line-height: 29px;
            overflow: hidden;
        }

            .answer tr td {
                border: 1px solid #e5e5e5;
            }

            .answer tr:nth-child(odd) {
                background: #f9f9f9;
            }

        .frame-fieldset {
            margin-bottom: 15px;
            border: 1px solid #e5e5e5;
            padding: 10px;
        }

            .frame-fieldset .frame-legend {
                width: auto;
                display: block;
                margin: 0 0 0 -5px;
                font-size: 13px;
                font-weight: bold;
                border-bottom: 0;
                padding: 0 5px;
                color: #333;
            }
    </style>
</head>
<body>
    <input type="hidden" id="OpType" name="OpType" />
    <input type="hidden" id="PlanID" name="PlanID" />
    <input type="hidden" id="RoomID" name="RoomID" />
    <input type="hidden" id="CustID" name="CustID" />
    <input type="hidden" id="CommID" name="CommID" />
    <input type="hidden" id="IncidentId" name="IncidentId" />
    <form id="mainForm" runat="server">
        <input type="hidden" id="LongTimeStamp" name="LongTimeStamp" />
        <div style="padding: 5px;">
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">基础信息</legend>
                <table class="bootstrap_table" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="title">
                            <span>业主名称</span>
                        </td>
                        <td class="text">
                            <label id="CustName"></label>
                        </td>
                        <td class="title"><span>房屋编号</span></td>
                        <td class="text">
                            <label id="RoomSign"></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            <span>受访对象</span>
                        </td>
                        <td class="text">
                            <label id="InterviewedObject"></label>
                        </td>
                        <td class="title"><span>与业主关系</span></td>
                        <td class="text">
                            <input id="RelationsWithOwners" name="RelationsWithOwners" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>联系电话</span></td>
                        <td class="text">
                            <input id="ContactTelephone" name="ContactTelephone" class="easyui-textbox" data-options="required:true,tipPosition:'bottom'" />
                        </td>
                        <td class="title"><span>拜访人</span></td>
                        <td class="text">
                            <label id="VisitUserName"></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>拜访方式</span></td>
                        <td class="text">
                            <input id="VisitWayID" name="VisitWayID" class="easyui-combobox" />
                        </td>
                        <td class="title"><span>完成时间</span></td>
                        <td class="text">
                            <label id="CompleteTime"></label>
                        </td>
                    </tr>
                    <tr>
                        <td class="title"><span>问卷标准分</span></td>
                        <td class="text">
                            <label id="QuestionnaireStandardScore"></label>
                        </td>
                        <td class="title IsScoreNo"><span>问卷实得分</span></td>
                        <td class="text IsScoreNo">
                            <input id="QuestionnaireRealScore" name="QuestionnaireRealScore" class="easyui-numberbox" data-options="required:true,disabled:true,tipPosition:'bottom'" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">问卷问答明细</legend>
                <table class="bootstrap_table answer" border="0" cellspacing="0" cellpadding="0">
                </table>
            </fieldset>
            <fieldset class="frame-fieldset">
                <legend class="frame-legend">拜访总结</legend>
                <table class="bootstrap_table" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <input id="VisitSummary" name="VisitSummary" class="easyui-textbox" data-options="required:false,tipPosition:'bottom',multiline:true,width:'98%',height:'60px'" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div style="height: 50px"></div>
        <%--  <div style="text-align: center; width: 100%; padding: 5px 0;">
            <input type="button" class="button" value="保存" id="btnSave" onclick="Save();" />
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>--%>
        <div class="btnFixed">
            <input type="hidden" name="ID" id="ID" />
            <input type="button" class="button" value="提交报事" id="btnSubmitIncident" onclick="SubmitIncident();" />
            <input type="button" class="button" value="审核通过" id="btnSave" onclick="Save();" />
            <input type="button" class="button" value="放弃返回" id="btnClose" onclick="Close();" />
        </div>
    </form>
    <script type="text/javascript">
        function InitControl() {
            $('#VisitWayID').combobox({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: 'post',
                queryParams: {
                    "Method": "DataPost",
                    "Class": "Visit",
                    "Command": "GetListDataTableVisitWay",
                },
                valueField: 'ID',
                textField: 'VisitWay',
                required: true,
                editable: false,
                tipPosition: 'bottom',
                panelHeight: 194,
                icons: [{
                    iconCls: 'icon-clear',
                    handler: function (e) {
                        $(e.data.target).combobox('clear');
                    }
                }]
            });

            //$('#Sort').numberbox('textbox').attr('maxlength', 6);
        }

        function SubmitIncident() {
            HDialog.Open('850', '600', '../Visit/VisitIncidentAcceptManage.aspx?RoomSign=' + $("#RoomSign").html() + '&CustName=' + $("#CustName").html()
                + '&RoomID=' + $("#RoomID").val() + '&CustID=' + $("#CustID").val(),
                '提交报事', false, function callback(_Data) {
                    if (_Data) {
                        $("#IncidentId").val(_Data);
                        //写入拜访报事
                        $.tool.DataPostJson('Visit', 'SaveVisitIncidentAcceptManage', $.JQForm.GetStrParam(),
                            function Init() {
                            },
                            function callback(data) {
                                if (data == true) {
                                } else { $.messager.alert('温馨提示', data.msg); }
                            },
                            function completeCallback() {

                            }, function errorCallback() {

                            });
                    };
                })
        }


        //获取最高分
        function GetMaxScore() {
            var maxScore = -1, valueScore = -1;
            for (var i = 1; i <= 5; i++) {
                valueScore = $("#OptionStandardScore_" + i).numberbox("getValue");
                if (isValueNull(valueScore)) {
                    if (parseFloat(valueScore) > parseFloat(maxScore)) {
                        maxScore = valueScore;
                    }
                }
            }
            $("#IssueStandardScore").numberbox("setValue", maxScore);
        }

        $(function () {
            InitControl();
            InitPage();
        });
        var OpType;
        function InitPage() {
            var OpType = $.getUrlParam("OpType");
            var ID = $.getUrlParam("ID");
            $("#OpType").val(OpType);
            if (OpType == "Edit") {
                $("#ID").val(ID);
                InitData();
            }
        }
        //计算总实得分
        function FinalScoring() {
            var id = "", value, sountScoring = 0;
            $(".easyui-numberbox").each(function () {
                id = $(this).attr("id");
                if (isValueNull(id)) {
                    if (id != "QuestionnaireRealScore") {
                        value = $(this).numberbox("getValue");
                        if (isValueNull(value)) {
                            sountScoring += parseFloat(value);
                        }
                    }
                }
            });
            $(".RealScore").each(function () {
                value = $(this).val();
                if (isValueNull(value)) {
                    sountScoring += parseFloat(value);
                }
            });


            $("#QuestionnaireRealScore").numberbox("setValue", sountScoring)

        }
        function InitData() {
            $.tool.DataPostJson('Visit', 'GetModelVisitingCustomersDetail', $.JQForm.GetStrParam(),
                function Init() {
                },
                function callback(data) {
                    data = data[0];
                    data.CompleteTime = formatDate(data.CompleteTime, "yyyy-MM-dd")


                    if (data.IsScore == 0) {
                        $(".IsScoreNo").hide();
                    }
                    $('#mainForm').form('load', data);

                    //加载客户问答明细
                    var param = { "VisitingCustomersDetailID": data.ID };
                    $.tool.DataPostJson('Visit', 'GetListDataTableVCQuestionnaire', $.param(param),
                        function Init() {
                        },
                        function callback(dataVCQ) {

                            var html = "", value, answerText = "", realScore = 0;
                            $.each(dataVCQ, function (i, item) {

                                item.IssueProperty = isValueNull(item.IssueProperty) ? item.IssueProperty : "";
                                item.IssueName = isValueNull(item.IssueName) ? item.IssueName : "";
                                item.RealScore = isValueNull(item.RealScore) ? item.RealScore : 0;
                                item.IssueResults = isValueNull(item.IssueResults) ? item.IssueResults : "";

                                realScore = parseFloat(realScore) + parseFloat(item.RealScore);
                                answerText = item.IssueResults;

                                if (item.IssueProperty == "选择题") {
                                    if (item.ActualOption == 1) {
                                        answerText = item.Option_1;
                                    } else if (item.ActualOption == 2) {
                                        answerText = item.Option_2;
                                    } else if (item.ActualOption == 3) {
                                        answerText = item.Option_3;
                                    } else if (item.ActualOption == 4) {
                                        answerText = item.Option_4;
                                    } else if (item.ActualOption == 5) {
                                        answerText = item.Option_5;
                                    }
                                }


                                //是否评分 0:不评分
                                if (data.IsScore == 0) {
                                    html += "<tr><td class=\"title\"><span>" + (i + 1) + "、" + item.IssueProperty + "-问题</span></td><td class=\"text\" colspan=\"3\">" + item.IssueName + "</td></tr><tr><td class=\"title\"><span>回答</span></td><td class=\"text\" colspan=\"3\">" + answerText + "</td></tr>";
                                } else {
                                    if (item.IssueProperty == "选择题" || data.IsExamine == 1) {
                                        html += "<tr><td class=\"title\"><span>" + (i + 1) + "、" + item.IssueProperty + "-问题</span></td><td class=\"text\">" + item.IssueName + "</td><td class=\"title\"><span>实得分</span></td><td class=\"text\"><input type=\"hidden\" class=\"RealScore\" value=\"" + item.RealScore + "\" /><label>" + item.RealScore + "</td></tr><tr><td class=\"title\"><span>回答</span></td><td class=\"text\" colspan=\"3\">" + answerText + "</td></tr>";
                                    } else {
                                        html += "<tr><td class=\"title\"><span>" + (i + 1) + "、" + item.IssueProperty + "-问题</span></td><td class=\"text\">" + item.IssueName + "</td><td class=\"title\"><span>实得分</span></td><td class=\"text\"><input id=\"" + item.ID + "\" name=\"" + item.ID + "\" class=\"easyui-numberbox\" data-options=\"required:true,value:" + item.RealScore + ",tipPosition:'bottom'\" /></td></tr><tr><td class=\"title\"><span>回答</span></td><td class=\"text\" colspan=\"3\">" + answerText + "</td></tr>";
                                    }
                                }
                            })
                            data.QuestionnaireRealScore = realScore;
                            $("#QuestionnaireRealScore").numberbox("setValue", realScore);
                            $(".answer").html(html);
                            $(".easyui-numberbox").numberbox({
                                required: true,
                                editable: true,
                                tipPosition: 'bottom',
                                min: 0,
                                max: 1000,
                                precision: 2,
                                onChange: function (newValue, oldValue) {
                                    FinalScoring();
                                }
                            });
                            if (data.IsExamine == 1) {
                                $("#RelationsWithOwners").parent().html("<input type=\"hidden\" id=\"RelationsWithOwners\" name=\"RelationsWithOwners\" /><label>" + data.RelationsWithOwners + "</label>");
                                $("#ContactTelephone").parent().html("<input type=\"hidden\" id=\"ContactTelephone\" name=\"ContactTelephone\" /><label>" + data.ContactTelephone + "</label>");
                                $("#VisitWayID").parent().html("<input type=\"hidden\" id=\"VisitWayName\" name=\"VisitWayName\" /><label>" + data.VisitWayName + "</label>");
                                $("#QuestionnaireRealScore").parent().html("<input type=\"hidden\" id=\"QuestionnaireRealScore\" name=\"QuestionnaireRealScore\" /><label>" + data.QuestionnaireRealScore + "</label>");
                                $("#VisitSummary").parent().html("<input type=\"hidden\" id=\"VisitSummary\" name=\"VisitSummary\" /><label>" + data.VisitSummary + "</label>");
                                $(".btnFixed").hide();
                            }
                            $.JQForm.SetStrParam(data);

                        },
                        function completeCallback() {
                        }, function errorCallback() {
                        });

                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }



        function Save() {
            if ($('#mainForm').form("validate")) {
                var id = "", value, listVCQ = "";
                $(".easyui-numberbox").each(function () {
                    id = $(this).attr("id");
                    if (isValueNull(id)) {
                        if (id != "QuestionnaireRealScore") {
                            value = $(this).numberbox("getValue");
                            listVCQ += id + "_" + value + ",";
                        }
                    }
                });
                listVCQ = listVCQ.substr(0, listVCQ.length - 1);
                $.tool.DataPostJson('Visit', 'SaveVisitingCustomersDetail', $.JQForm.GetStrParam() + "&listVCQ=" + listVCQ,
                    function Init() {
                    },
                    function callback(data) {
                        if (data.result) {
                            $('#mainForm').form('clear');
                            Close();
                        } else { $.messager.alert('温馨提示', data.msg); }
                    },
                    function completeCallback() {

                    }, function errorCallback() {

                    });
            }
        }
        function Close() {
            HDialog.Close();
        }
    </script>
</body>
</html>
