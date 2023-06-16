<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanImplement_Details.aspx.cs" Inherits="M_Main.Plan.rwxq" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划执行-预览页面</title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <style type="text/css">
        .panel-body div {
            margin-bottom: 5px;
        }

        #divDefait table tr .title {
            width: 100px;
        }

        #divDefait table tr .centent input {
            /*border: 1px solid #cccccc;*/
            border: none;
        }

        #divDefait table tr .centent textarea {
            BORDER-BOTTOM-STYLE: none;
            BORDER-LEFT-STYLE: none;
            BORDER-RIGHT-STYLE: none;
            BORDER-TOP-STYLE: none;
            resize: none;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px;">
    <form id="frmForm">
        <div class="row" style="margin-left: 5%;" id="divDefait">
            <table style="width: 100%;">
                <tr style="height: 30px;">
                    <td class="title">序号:</td>
                    <td class="centent">
                        <input type="text" id="Sort" readonly="readonly" name="Sort" /></td>
                    <td class="title">计划类型:</td>
                    <td class="centent">
                        <input type="text" id="TypeName" readonly="readonly" name="TypeName" /></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">计划名称:</td>
                    <td colspan="3" class="centent">
                        <textarea id="PlanName" name="PlanName" readonly="readonly" style="width: 70%; height: 40px;padding-top:10px;"></textarea>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">计划开始时间:</td>
                    <td class="centent">
                        <input type="text" id="PlanStartTime" readonly="readonly" name="PlanStartTime" /></td>
                    <td class="title">计划结束时间:</td>
                    <td class="centent">
                        <input type="text" id="PlanEndTime" readonly="readonly" name="PlanEndTime" /></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">计划内容:</td>
                    <td colspan="3" class="centent">
                        <textarea id="PlanContent" name="PlanContent" readonly="readonly" style="width: 70%; height: 40px;padding-top:10px;"></textarea>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">计划说明:</td>
                    <td colspan="3" class="centent">
                        <textarea id="PlanExplain" name="PlanExplain" readonly="readonly" style="width: 70%; height: 40px;padding-top:10px;"></textarea></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">计划目标:</td>
                    <td class="centent">
                        <input type="text" id="Target" readonly="readonly" name="Target" /></td>
                    <td class="title">计划费用（元）:</td>
                    <td class="centent">
                        <input type="text" id="PlanCost" name="PlanCost" readonly="readonly" /></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">节点分解:</td>
                    <td colspan="3" class="centent">
                        <textarea id="PlanNode" name="PlanNode" readonly="readonly" style="width: 70%; height: 40px;padding-top:10px;"></textarea></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">绩效分值:</td>
                    <td class="centent">
                        <input type="text" id="Point" name="Point" readonly="readonly" /></td>
                    <td class="title">奖罚金额（元）:</td>
                    <td class="centent">
                        <input type="text" id="GetCost" name="GetCost" readonly="readonly" /></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">责任人:</td>
                    <td class="centent">
                        <input type="text" id="DutyUserName" name="DutyUserName" readonly="readonly" /></td>
                    <td class="title">协助人:</td>
                    <td class="centent">
                        <input type="text" id="AssistManName" name="AssistManName" readonly="readonly" /></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">考评人:</td>
                    <td class="centent">
                        <input type="text" id="EvaluationUserName" name="EvaluationUserName" readonly="readonly" /></td>
                    <td class="title">计划来源:</td>
                    <td class="centent">
                        <input type="text" id="PlanSourceName" name="PlanSourceName" readonly="readonly" /></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">实施开始时间:</td>
                    <td class="centent">
                        <input type="text" id="ActualStartTime" name="ActualStartTime" readonly="readonly" /></td>
                    <td class="title">实施结束时间:</td>
                    <td class="centent">
                        <input type="text" id="ActualEndTime" name="ActualEndTime" readonly="readonly" /></td>
                </tr>
                <tr style="height: 30px;">
                    <td class="title">累计完成目标:</td>
                    <td class="centent">
                        <input type="text" id="ActualTarget" name="ActualTarget" readonly="readonly" /></td>
                    <td class="title">累计完成费用:</td>
                    <td class="centent">
                        <input type="text" id="ActualCost" name="ActualCost" readonly="readonly" /></td>
                </tr>
                 <tr style="height: 30px;">
                    <td class="title">累计所得分值:</td>
                    <td class="centent">
                        <input type="text" id="ActualPoint" name="ActualPoint" readonly="readonly" /></td>
                    <td class="title">累计所得金额:</td>
                    <td class="centent">
                        <input type="text" id="ActualGetCost" name="ActualGetCost" readonly="readonly" /></td>
                </tr>
                <tr style="height: 53px;">
                    <td class="title">计划备注:</td>
                    <td colspan="3" class="centent">
                        <textarea id="PlanRemark" name="PlanRemark" readonly="readonly" style="width: 70%; height: 40px;padding-top:10px;"></textarea></td>
                </tr>
                <tr style="height: 53px;">
                    <td class="title">附件:</td>
                    <td colspan="3" class="centent">
                        <input type="button" name="fileList1" style="width: 70px; height: 25px;" value="查看列表" id="fileList1" runat="server" onclick="OnFileList();" />
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <input type="hidden" id="DetailId" name="DetailId" runat="server" />
        <script type="text/javascript">
            function InitDate() {
                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsPlan&Command=GetImplementListDetailById&page=1&rows=1000&DetailId=' + GetQueryString('DetailId'),
                    type: 'GET',
                    dataType: 'JSON',
                    cache: false,
                    success: function (_Data) {

                        if (_Data.rows.length > 0) {
                            $("#Sort").val(_Data.rows[0].Sort);
                            $("#TypeName").val(_Data.rows[0].TypeName);
                            $("#PlanName").val(_Data.rows[0].PlanName);
                            $("#PlanStartTime").val(_Data.rows[0].PlanStartTime);
                            $("#PlanEndTime").val(_Data.rows[0].PlanEndTime);
                            $("#PlanContent").val(_Data.rows[0].PlanContent);
                            $("#PlanExplain").val(_Data.rows[0].PlanExplain);
                            $("#Target").val(_Data.rows[0].Target);
                            $("#PlanCost").val(_Data.rows[0].PlanCost);

                            //新增字段
                            $('#ActualStartTime').val(formatDate(_Data.rows[0].ActualStartTime, "yyyy-MM-dd"));
                            $('#ActualEndTime').val(formatDate(_Data.rows[0].ActualEndTime, "yyyy-MM-dd"));
                            $('#ActualTarget').val(_Data.rows[0].ActualTarget);
                            $('#ActualCost').val(_Data.rows[0].ActualCost);
                            $('#ActualPoint').val(_Data.rows[0].ActualPoint);
                            $('#ActualGetCost').val(_Data.rows[0].ActualGetCost);

                            $("#PlanNode").val(_Data.rows[0].PlanNode);
                            $("#Point").val(_Data.rows[0].Point);
                            $("#GetCost").val(_Data.rows[0].GetCost);
                            $("#PlanRemark").val(_Data.rows[0].PlanRemark);
                            $("#AssistManName").val(_Data.rows[0].AssistManName);
                            $("#PlanSourceName").val(_Data.rows[0].PlanSourceName);
                            $("#DutyUserName").val(_Data.rows[0].DutyUserName);
                            $("#EvaluationUserName").val(_Data.rows[0].EvaluationUserName);
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.alert('错误', '数据读取错误', 'error');
                    }
                });

            }
            InitDate();
            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;

            }

            function OnFileList() {
                HDialog.Open(600, 450, '../Plan/PlanDetailFiles.aspx?DetailId=' + $("#DetailId").val(), '查看计划附件', true, function callback(_Data) {
                });
            }
        </script>
    </form>
</body>
</html>
