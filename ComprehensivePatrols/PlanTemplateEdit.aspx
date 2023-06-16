<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTemplateEdit.aspx.cs" Inherits="M_Main.ComprehensivePatrols.PlanTemplateEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划模板设置</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/PinYin.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/PatrolDictionariesCanNull.js" type="text/javascript"></script>
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
    <form id="frmForm" runat="server">
        <div class="Container">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input id="CommName" name="CommName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" />
                        <input type="hidden" id="CommId" name="CommId" runat="server" />
                    </td>
                    <td class="TdTitle">任务类型</td>
                    <td class="TdContentSearch">
                        <select id="TypeId" name="TypeId" isdctype='true' dctype="任务类型" dcname="品质核查" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true" onchange="SelTaskType();SetPlanName();">
                        </select>
                    </td>
                    <td class="TdTitle">任务级别</td>
                    <td class="TdContentSearch">
                        <select id="LevelId" name="LevelId" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true" runat="server" onchange="SelTaskLevel();SetPlanName();">
                        </select>
                    </td>
                    <td class="TdTitle">责任岗位</td>
                    <td class="TdContentSearch">
                        <input id="TaskRoleName" name="TaskRoleName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" data-options="required:true" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 60%;" onclick="SelTaskRole()" />
                        <input type="hidden" id="TaskRoleCode" name="TaskRoleCode" runat="server" />
                        <a href="#" class="easyui-linkbutton" onclick="ClearRole('Task');" data-options="iconCls:'icon-clear',plain:true"></a>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">责任人</td>
                    <td class="TdContentSearch">
                        <input id="TaskUserName" name="TaskUserName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 60%;" onclick="SelTaskUser()" />
                        <input type="hidden" id="TaskUserCode" name="TaskUserCode" runat="server" />
                        <a href="#" class="easyui-linkbutton" onclick="ClearUser('Task');" data-options="iconCls:'icon-clear',plain:true"></a>
                    </td>
                    <td class="TdTitle">是否外委</td>
                    <td class="TdContentSearch">
                        <select id="IsEntrust" name="IsEntrust" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">任务点位数</td>
                    <td class="TdContentSearch">
                        <input id="PointNum" name="PointNum" class="easyui-validatebox" runat="server" type="text" readonly="readonly" disabled="disabled" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" />
                    </td>
                    <td class="TdTitle">必查点位数</td>
                    <td class="TdContentSearch">
                        <input id="MustCheckPointNum" name="MustCheckPointNum" class="easyui-validatebox" runat="server" type="text" readonly="readonly" disabled="disabled" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">抽查点位覆盖率</td>
                    <td class="TdContentSearch">
                        <input id="OtherPointPercentage" name="OtherPointPercentage" class="easyui-validatebox" runat="server" type="text" readonly="readonly" disabled="disabled" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" />
                    </td>
                    <td class="TdTitle">任务点位是否扫码</td>
                    <td class="TdContentSearch">
                        <select id="TaskPointIsScan" name="TaskPointIsScan" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">任务点位是否拍照</td>
                    <td class="TdContentSearch">
                        <select id="TaskPointIsPhotograph" name="TaskPointIsPhotograph" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">问题点位是否拍照</td>
                    <td class="TdContentSearch">
                        <select id="ProblemPointIsPhotograph" name="ProblemPointIsPhotograph" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">问题点位是否报事</td>
                    <td class="TdContentSearch">
                        <select id="ProblemPointIsIncident" name="ProblemPointIsIncident" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">任务频次</td>
                    <td class="TdContentSearch">
                        <select id="Frequency" name="Frequency" onchange="FrequencyChange(this)" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value=""></option>
                            <option value="1次/半小时">1次/半小时</option>
                            <option value="1次/1小时">1次/1小时</option>
                            <option value="1次/2小时">1次/2小时</option>
                            <option value="1次/3小时">1次/3小时</option>
                            <option value="1次/4小时">1次/4小时</option>
                            <option value="1次/6小时">1次/6小时</option>
                            <option value="1次/8小时">1次/8小时</option>
                            <option value="1次/12小时">1次/12小时</option>
                            <option value="1次/天">1次/天</option>
                            <option value="1次/周">1次/周</option>
                            <option value="2次/周">2次/周</option>
                            <option value="3次/周">3次/周</option>
                            <option value="1次/10天">1次/10天</option>
                            <option value="1次/15天">1次/15天</option>
                            <option value="1次/月">1次/月</option>
                            <option value="1次/2月">1次/2月</option>
                            <option value="1次/季">1次/季</option>
                            <option value="1次/半年">1次/半年</option>
                            <option value="1次/年">1次/年</option>
                        </select>
                    </td>
                    <td class="TdTitle">额定工时(小时)</td>
                    <td class="TdContentSearch">
                        <input id="RatedHours" name="RatedHours" class="easyui-validatebox" runat="server" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" onkeyup="clearNoNum(this);" onafterpaste="clearNoNum(this);" />
                    </td>
                    <td class="TdTitle">绩效系数</td>
                    <td class="TdContentSearch">
                        <input id="Performance" name="Performance" class="easyui-validatebox" runat="server" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" onkeyup="clearNoNum(this);" onafterpaste="clearNoNum(this);" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">任务完成汇报岗位</td>
                    <td class="TdContentSearch">
                        <input id="ReportRoleName" name="ReportRoleName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 60%;" onclick="SelRole('Report')" />
                        <input type="hidden" id="ReportRoleCode" name="ReportRoleCode" runat="server" />
                        <a href="#" class="easyui-linkbutton" onclick="ClearRole('Report');" data-options="iconCls:'icon-clear',plain:true"></a>
                    </td>
                    <td class="TdTitle">任务完成汇报人</td>
                    <td class="TdContentSearch">
                        <input id="ReportUserName" name="ReportUserName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 60%;" onclick="SelUser('Report')" />
                        <input type="hidden" id="ReportUserCode" name="ReportUserCode" runat="server" />
                        <a href="#" class="easyui-linkbutton" onclick="ClearUser('Report');" data-options="iconCls:'icon-clear',plain:true"></a>
                    </td>
                    <td class="TdTitle">任务过期预警岗位</td>
                    <td class="TdContentSearch">
                        <input id="OverdueRoleName" name="OverdueRoleName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 60%;" onclick="SelRole('Overdue')" />
                        <input type="hidden" id="OverdueRoleCode" name="OverdueRoleCode" runat="server" />
                        <a href="#" class="easyui-linkbutton" onclick="ClearRole('Overdue');" data-options="iconCls:'icon-clear',plain:true"></a>
                    </td>
                    <td class="TdTitle">任务过期预警人</td>
                    <td class="TdContentSearch">
                        <input id="OverdueUserName" name="OverdueUserName" class="easyui-validatebox" runat="server" readonly="readonly" type="text" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 60%;" onclick="SelUser('Overdue')" />
                        <input type="hidden" id="OverdueUserCode" name="OverdueUserCode" runat="server" />
                        <a href="#" class="easyui-linkbutton" onclick="ClearUser('Overdue');" data-options="iconCls:'icon-clear',plain:true"></a>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">生成任务方式</td>
                    <td class="TdContentSearch">
                        <select id="GeneratingType" name="GeneratingType" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value="1">自动</option>
                            <option value="0">手动</option>
                        </select>
                    </td>
                    <td class="TdTitle">计划名称</td>
                    <td class="TdContentSearch" colspan="5">
                        <input id="PlanName" name="PlanName" class="easyui-validatebox" runat="server" type="text" data-options="required:true" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 94%;" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否启用</td>
                    <td class="TdContentSearch">
                        <select id="IsEnable" name="IsEnable" class="easyui-validatebox" style="border: 1px #cccccc solid; height: 22px; line-height: 22px; width: 70%;" data-options="required:true">
                            <option value="1">启用</option>
                            <option value="0">停用</option>
                        </select>
                    </td>
                    <td class="TdTitle">备注</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea id="Remark" name="Remark" style="width: 94%; border: 1px solid #cccccc; height: 44px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">频次详情</td>
                    <td class="TdContentSearch" colspan="7">
                        <table class="time" style="width: 95%">
                            <tr id="TimeTr1">
                                <td style="width: 8%">有效时段</td>
                                <td style="width: 8%">
                                    <input id="chkTimeAll" name="chkTimeAll" onclick="chkAllTime();" type="checkbox" value="" style="width: 10px;" /><span style="color: orangered;">全选</span>
                                </td>
                                <td style="width: 12%">
                                    <input id="chkTime1" name="chkTime1" type="checkbox" onclick="chkTime()" value="1" style="width: 15px;" /><span id="spTime1">00:00-00:30</span>
                                </td>
                                <td style="width: 12%">
                                    <input id="chkTime2" name="chkTime2" type="checkbox" onclick="chkTime()" value="2" style="width: 15px;" /><span id="spTime2">00:30-01:00</span>
                                </td>
                                <td style="width: 12%">
                                    <input id="chkTime3" name="chkTime3" type="checkbox" onclick="chkTime()" value="3" style="width: 15px;" /><span id="spTime3">01:00-01:30</span>
                                </td>
                                <td style="width: 12%">
                                    <input id="chkTime4" name="chkTime4" type="checkbox" onclick="chkTime()" value="4" style="width: 15px;" /><span id="spTime4">01:30-02:00</span>
                                </td>
                                <td style="width: 12%">
                                    <input id="chkTime5" name="chkTime5" type="checkbox" onclick="chkTime()" value="5" style="width: 15px;" /><span id="spTime5">02:00-02:30</span>
                                </td>
                                <td style="width: 12%">
                                    <input id="chkTime6" name="chkTime6" type="checkbox" onclick="chkTime()" value="6" style="width: 15px;" /><span id="spTime6">02:30-03:00</span>
                                </td>
                                <td style="width: 12%">
                                    <input id="chkTime7" name="chkTime7" type="checkbox" onclick="chkTime()" value="7" style="width: 15px;" /><span id="spTime7">03:00-03:30</span>
                                </td>
                            </tr>
                            <tr id="TimeTr2">
                                <td></td>
                                <td></td>
                                <td>
                                    <input id="chkTime8" name="chkTime8" type="checkbox" onclick="chkTime()" value="8" style="width: 15px;" /><span id="spTime8">03:30-04:00</span>
                                </td>
                                <td>
                                    <input id="chkTime9" name="chkTime9" type="checkbox" onclick="chkTime()" value="9" style="width: 15px;" /><span id="spTime9">04:00-04:30</span>
                                </td>
                                <td>
                                    <input id="chkTime10" name="chkTime10" type="checkbox" onclick="chkTime()" value="10" style="width: 15px;" /><span id="spTime10">04:30-05:00</span>
                                </td>
                                <td>
                                    <input id="chkTime11" name="chkTime11" type="checkbox" onclick="chkTime()" value="11" style="width: 15px;" /><span id="spTime11">05:00-05:30</span>
                                </td>
                                <td>
                                    <input id="chkTime12" name="chkTime12" type="checkbox" onclick="chkTime()" value="12" style="width: 15px;" /><span id="spTime12">05:30-06:00</span>
                                </td>
                                <td>
                                    <input id="chkTime13" name="chkTime13" type="checkbox" onclick="chkTime()" value="13" style="width: 15px;" /><span id="spTime13">06:00-06:30</span>
                                </td>
                                <td>
                                    <input id="chkTime14" name="chkTime14" type="checkbox" onclick="chkTime()" value="14" style="width: 15px;" /><span id="spTime14">06:30-07:00</span>
                                </td>
                            </tr>
                            <tr id="TimeTr3">
                                <td></td>
                                <td></td>
                                <td>
                                    <input id="chkTime15" name="chkTime15" type="checkbox" onclick="chkTime()" value="15" style="width: 15px;" /><span id="spTime15">07:00-07:30</span>
                                </td>
                                <td>
                                    <input id="chkTime16" name="chkTime16" type="checkbox" onclick="chkTime()" value="16" style="width: 15px;" /><span id="spTime16">07:30-08:00</span>
                                </td>
                                <td>
                                    <input id="chkTime17" name="chkTime17" type="checkbox" onclick="chkTime()" value="17" style="width: 15px;" /><span id="spTime17">08:00-08:30</span>
                                </td>
                                <td>
                                    <input id="chkTime18" name="chkTime18" type="checkbox" onclick="chkTime()" value="18" style="width: 15px;" /><span id="spTime18">08:30-09:00</span>
                                </td>
                                <td>
                                    <input id="chkTime19" name="chkTime19" type="checkbox" onclick="chkTime()" value="19" style="width: 15px;" /><span id="spTime19">09:00-09:30</span>
                                </td>
                                <td>
                                    <input id="chkTime20" name="chkTime20" type="checkbox" onclick="chkTime()" value="20" style="width: 15px;" /><span id="spTime20">09:30-10:00</span>
                                </td>
                                <td>
                                    <input id="chkTime21" name="chkTime21" type="checkbox" onclick="chkTime()" value="21" style="width: 15px;" /><span id="spTime21">10:00-10:30</span>
                                </td>
                            </tr>
                            <tr id="TimeTr4">
                                <td></td>
                                <td></td>
                                <td>
                                    <input id="chkTime22" name="chkTime22" type="checkbox" onclick="chkTime()" value="22" style="width: 15px;" /><span id="spTime22">10:30-11:00</span>
                                </td>
                                <td>
                                    <input id="chkTime23" name="chkTime23" type="checkbox" onclick="chkTime()" value="23" style="width: 15px;" /><span id="spTime23">11:00-11:30</span>
                                </td>
                                <td>
                                    <input id="chkTime24" name="chkTime24" type="checkbox" onclick="chkTime()" value="24" style="width: 15px;" /><span id="spTime24">11:30-12:00</span>
                                </td>
                                <td>
                                    <input id="chkTime25" name="chkTime25" type="checkbox" onclick="chkTime()" value="25" style="width: 15px;" /><span id="spTime25">12:00-12:30</span>
                                </td>
                                <td>
                                    <input id="chkTime26" name="chkTime26" type="checkbox" onclick="chkTime()" value="26" style="width: 15px;" /><span id="spTime26">12:30-13:00</span>
                                </td>
                                <td>
                                    <input id="chkTime27" name="chkTime27" type="checkbox" onclick="chkTime()" value="27" style="width: 15px;" /><span id="spTime27">13:00-13:30</span>
                                </td>
                                <td>
                                    <input id="chkTime28" name="chkTime28" type="checkbox" onclick="chkTime()" value="28" style="width: 15px;" /><span id="spTime28">13:30-14:00</span>
                                </td>
                            </tr>
                            <tr id="TimeTr5">
                                <td></td>
                                <td></td>
                                <td>
                                    <input id="chkTime29" name="chkTime29" type="checkbox" onclick="chkTime()" value="29" style="width: 15px;" /><span id="spTime29">14:00-14:30</span>
                                </td>
                                <td>
                                    <input id="chkTime30" name="chkTime30" type="checkbox" onclick="chkTime()" value="30" style="width: 15px;" /><span id="spTime30">14:30-15:00</span>
                                </td>
                                <td>
                                    <input id="chkTime31" name="chkTime31" type="checkbox" onclick="chkTime()" value="31" style="width: 15px;" /><span id="spTime31">15:00-15:30</span>
                                </td>
                                <td>
                                    <input id="chkTime32" name="chkTime32" type="checkbox" onclick="chkTime()" value="32" style="width: 15px;" /><span id="spTime32">15:30-16:00</span>
                                </td>
                                <td>
                                    <input id="chkTime33" name="chkTime33" type="checkbox" onclick="chkTime()" value="33" style="width: 15px;" /><span id="spTime33">16:00-16:30</span>
                                </td>
                                <td>
                                    <input id="chkTime34" name="chkTime34" type="checkbox" onclick="chkTime()" value="34" style="width: 15px;" /><span id="spTime34">16:30-17:00</span>
                                </td>
                                <td>
                                    <input id="chkTime35" name="chkTime35" type="checkbox" onclick="chkTime()" value="35" style="width: 15px;" /><span id="spTime35">17:00-17:30</span>
                                </td>
                            </tr>
                            <tr id="TimeTr6">
                                <td></td>
                                <td></td>
                                <td>
                                    <input id="chkTime36" name="chkTime36" type="checkbox" onclick="chkTime()" value="36" style="width: 15px;" /><span id="spTime36">17:30-18:00</span>
                                </td>
                                <td>
                                    <input id="chkTime37" name="chkTime37" type="checkbox" onclick="chkTime()" value="37" style="width: 15px;" /><span id="spTime37">18:00-18:30</span>
                                </td>
                                <td>
                                    <input id="chkTime38" name="chkTime38" type="checkbox" onclick="chkTime()" value="38" style="width: 15px;" /><span id="spTime38">18:30-19:00</span>
                                </td>
                                <td>
                                    <input id="chkTime39" name="chkTime39" type="checkbox" onclick="chkTime()" value="39" style="width: 15px;" /><span id="spTime39">19:00-19:30</span>
                                </td>
                                <td>
                                    <input id="chkTime40" name="chkTime40" type="checkbox" onclick="chkTime()" value="40" style="width: 15px;" /><span id="spTime40">19:30-20:00</span>
                                </td>
                                <td>
                                    <input id="chkTime41" name="chkTime41" type="checkbox" onclick="chkTime()" value="41" style="width: 15px;" /><span id="spTime41">20:00-20:30</span>
                                </td>
                                <td>
                                    <input id="chkTime42" name="chkTime42" type="checkbox" onclick="chkTime()" value="42" style="width: 15px;" /><span id="spTime42">20:30-21:00</span>
                                </td>
                            </tr>
                            <tr id="TimeTr7">
                                <td></td>
                                <td></td>
                                <td>
                                    <input id="chkTime43" name="chkTime43" type="checkbox" onclick="chkTime()" value="43" style="width: 15px;" /><span id="spTime43">21:00-21:30</span>
                                </td>
                                <td>
                                    <input id="chkTime44" name="chkTime44" type="checkbox" onclick="chkTime()" value="44" style="width: 15px;" /><span id="spTime44">21:30-22:00</span>
                                </td>
                                <td>
                                    <input id="chkTime45" name="chkTime45" type="checkbox" onclick="chkTime()" value="45" style="width: 15px;" /><span id="spTime45">22:00-22:30</span>
                                </td>
                                <td>
                                    <input id="chkTime46" name="chkTime46" type="checkbox" onclick="chkTime()" value="46" style="width: 15px;" /><span id="spTime46">22:30-23:00</span>
                                </td>
                                <td>
                                    <input id="chkTime47" name="chkTime47" type="checkbox" onclick="chkTime()" value="47" style="width: 15px;" /><span id="spTime47">23:00-23:30</span>
                                </td>
                                <td>
                                    <input id="chkTime48" name="chkTime48" type="checkbox" onclick="chkTime()" value="48" style="width: 15px;" /><span id="spTime48">23:30-00:00</span>
                                </td>
                                <td></td>
                            </tr>
                            <tr id="MonthTr1">
                                <td>有效月份</td>
                                <td>
                                    <input id="chkMonthAll" name="chkMonthAll" onclick="chkAllMonth();" type="checkbox" value="" style="width: 10px;" /><span style="color: orangered;">全选</span>
                                </td>
                                <td>
                                    <input id="chkMonth1" name="chkMonth1" type="checkbox" onclick="chkMonth()" value="1" style="width: 15px;" /><span>一月</span>
                                </td>
                                <td>
                                    <input id="chkMonth2" name="chkMonth2" type="checkbox" onclick="chkMonth()" value="2" style="width: 15px;" /><span>二月</span>
                                </td>
                                <td>
                                    <input id="chkMonth3" name="chkMonth2" type="checkbox" onclick="chkMonth()" value="3" style="width: 15px;" /><span>三月</span>
                                </td>
                                <td>
                                    <input id="chkMonth4" name="chkMonth2" type="checkbox" onclick="chkMonth()" value="4" style="width: 15px;" /><span>四月</span>
                                </td>
                                <td>
                                    <input id="chkMonth5" name="chkMonth2" type="checkbox" onclick="chkMonth()" value="5" style="width: 15px;" /><span>五月</span>
                                </td>
                                <td>
                                    <input id="chkMonth6" name="chkMonth2" type="checkbox" onclick="chkMonth()" value="6" style="width: 15px;" /><span>六月</span>
                                </td>
                                <td>
                                    <input id="chkMonth7" name="chkMonth2" type="checkbox" onclick="chkMonth()" value="7" style="width: 15px;" /><span>七月</span>
                                </td>
                            </tr>
                            <tr id="MonthTr2">
                                <td></td>
                                <td></td>
                                <td>
                                    <input id="chkMonth8" name="chkMonth2" type="checkbox" onclick="chkMonth()" value="8" style="width: 15px;" /><span>八月</span>
                                </td>
                                <td>
                                    <input id="chkMonth9" name="chkMonth9" type="checkbox" onclick="chkMonth()" value="9" style="width: 15px;" /><span>九月</span>
                                </td>
                                <td>
                                    <input id="chkMonth10" name="chkMonth10" type="checkbox" onclick="chkMonth()" value="10" style="width: 15px;" /><span>十月</span>
                                </td>
                                <td>
                                    <input id="chkMonth11" name="chkMonth11" type="checkbox" onclick="chkMonth()" value="11" style="width: 15px;" /><span>十一月</span>
                                </td>
                                <td>
                                    <input id="chkMonth12" name="chkMonth12" type="checkbox" onclick="chkMonth()" value="12" style="width: 15px;" /><span>十二月</span>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="WeekTr">
                                <td>有效星期</td>
                                <td>
                                    <input id="chkWeekAll" name="chkWeekAll" onclick="chkAllWeek();" type="checkbox" value="" style="width: 10px;" /><span style="color: orangered;">全选</span>
                                </td>
                                <td>
                                    <input id="chkWeek1" name="chkWeek1" type="checkbox" onclick="chkWeek()" value="1" style="width: 15px;" /><span>星期一</span>
                                </td>
                                <td>
                                    <input id="chkWeek2" name="chkWeek2" type="checkbox" onclick="chkWeek()" value="2" style="width: 15px;" /><span>星期二</span>
                                </td>
                                <td>
                                    <input id="chkWeek3" name="chkWeek3" type="checkbox" onclick="chkWeek()" value="3" style="width: 15px;" /><span>星期三</span>
                                </td>
                                <td>
                                    <input id="chkWeek4" name="chkWeek4" type="checkbox" onclick="chkWeek()" value="4" style="width: 15px;" /><span>星期四</span>
                                </td>
                                <td>
                                    <input id="chkWeek5" name="chkWeek5" type="checkbox" onclick="chkWeek()" value="5" style="width: 15px;" /><span>星期五</span>
                                </td>
                                <td>
                                    <input id="chkWeek6" name="chkWeek6" type="checkbox" onclick="chkWeek()" value="6" style="width: 15px;" /><span>星期六</span>
                                </td>
                                <td>
                                    <input id="chkWeek7" name="chkWeek7" type="checkbox" onclick="chkWeek()" value="7" style="width: 15px;" /><span>星期日</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
            <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" runat="server" />
            <input type="button" class="button" value="放弃返回" id="BtnClose" onclick="Close();" />
        </div>
        <input type="hidden" id="CpOpType" name="CpOpType" runat="server" />
        <input type="hidden" id="PlanId" name="PlanId" runat="server" />
        <input type="hidden" id="OldTypeId" name="OldTypeId" runat="server" />
        <input type="hidden" id="CanEdit" name="CanEdit" runat="server" />
        <script type="text/javascript">
            function clearNoNum(obj) {
                obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符
                obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
                obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
                obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');//只能输入两个小数
                if (obj.value.indexOf(".") < 0 && obj.value != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
                    obj.value = parseFloat(obj.value);
                }
            }

            function SelTaskType(LevelId, FrequencyTitle) {
                $("#LevelId").empty();
                if ($("#CanEdit").val() == "true" || $("#CpOpType").val() == "add") {
                    $.tool.DataPostNoLoading('CpComPatrols', 'GetPatrolLevelList_Role', 'TypeId=' + $("#TypeId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var Objects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象s
                            var option = "<option value=''></option>";
                            $("#LevelId").append(option);
                            for (var i = 0; i < Objects.length; i++) {
                                option = "<option value='" + Objects[i].LevelId + "'>" + Objects[i].TaskLevelName + "</option>";
                                $("#LevelId").append(option);
                            }
                            if (LevelId > '') {
                                $("#LevelId").val(LevelId);
                                SelTaskLevel(FrequencyTitle);
                            } else {
                                $("#TaskRoleCode").val("");
                                $("#TaskRoleName").val("");
                                $("#TaskUserCode").val("");
                                $("#TaskUserName").val("");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                } else {
                    $.tool.DataPostNoLoading('CpComPatrols', 'GetPatrolLevelList', 'page=1&rows=10000&TypeId=' + $("#TypeId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var Objects = eval("(" + _Data.replace(/\\/g, "/") + ")").rows; //转换为json对象s
                            var option = "<option value=''></option>";
                            $("#LevelId").append(option);
                            for (var i = 0; i < Objects.length; i++) {
                                option = "<option value='" + Objects[i].LevelId + "'>" + Objects[i].TaskLevelName + "</option>";
                                $("#LevelId").append(option);
                            }
                            $("#LevelId").val(LevelId);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                }
            }

            function SelTaskLevel(FrequencyTitle) {
                if (FrequencyTitle == '' || FrequencyTitle == undefined) {
                    $("#TaskRoleCode").val("");
                    $("#TaskRoleName").val("");
                    $("#TaskUserCode").val("");
                    $("#TaskUserName").val("");
                }
                if ($("#LevelId").val() > "") {
                    $.tool.DataPostNoLoading('CpComPatrols', 'GetPatrolLevelList', 'page=1&rows=100000&LevelId=' + $("#LevelId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var Objects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            SetFrequency(Objects.rows[0].Frequency, FrequencyTitle);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                }
            }

            //设置频次
            function SetFrequency(Frequency, FrequencyTitle) {
                $("#Frequency").empty();
                var option = "<option value=''></option>";
                switch (Frequency) {
                    case "1次/半小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        break;
                    case "1次/1小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        break;
                    case "1次/2小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        break;
                    case "1次/3小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        break;
                    case "1次/4小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        break;
                    case "1次/6小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        break;
                    case "1次/8小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        break;
                    case "1次/12小时":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        break;
                    case "1次/天":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        break;
                    case "3次/周":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        break;
                    case "2次/周":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        break;
                    case "1次/周":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        break;
                    case "1次/10天":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        break;
                    case "1次/15天":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        option += "<option value='1次/15天'>1次/15天</option>";
                        break;
                    case "1次/月":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        option += "<option value='1次/15天'>1次/15天</option>";
                        option += "<option value='1次/月'>1次/月</option>";
                        break;
                    case "1次/2月":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        option += "<option value='1次/15天'>1次/15天</option>";
                        option += "<option value='1次/月'>1次/月</option>";
                        option += "<option value='1次/2月'>1次/2月</option>";
                        break;
                    case "1次/季":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        option += "<option value='1次/15天'>1次/15天</option>";
                        option += "<option value='1次/月'>1次/月</option>";
                        option += "<option value='1次/2月'>1次/2月</option>";
                        option += "<option value='1次/季'>1次/季</option>";
                        break;
                    case "1次/半年":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        option += "<option value='1次/15天'>1次/15天</option>";
                        option += "<option value='1次/月'>1次/月</option>";
                        option += "<option value='1次/2月'>1次/2月</option>";
                        option += "<option value='1次/季'>1次/季</option>";
                        option += "<option value='1次/半年'>1次/半年</option>";
                        break;
                    case "1次/年":
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        option += "<option value='1次/15天'>1次/15天</option>";
                        option += "<option value='1次/月'>1次/月</option>";
                        option += "<option value='1次/2月'>1次/2月</option>";
                        option += "<option value='1次/季'>1次/季</option>";
                        option += "<option value='1次/半年'>1次/半年</option>";
                        option += "<option value='1次/年'>1次/年</option>";
                        break;
                    default:
                        option += "<option value='1次/半小时'>1次/半小时</option>";
                        option += "<option value='1次/1小时'>1次/1小时</option>";
                        option += "<option value='1次/2小时'>1次/2小时</option>";
                        option += "<option value='1次/3小时'>1次/3小时</option>";
                        option += "<option value='1次/4小时'>1次/4小时</option>";
                        option += "<option value='1次/6小时'>1次/6小时</option>";
                        option += "<option value='1次/8小时'>1次/8小时</option>";
                        option += "<option value='1次/12小时'>1次/12小时</option>";
                        option += "<option value='1次/天'>1次/天</option>";
                        option += "<option value='3次/周'>3次/周</option>";
                        option += "<option value='2次/周'>2次/周</option>";
                        option += "<option value='1次/周'>1次/周</option>";
                        option += "<option value='1次/10天'>1次/10天</option>";
                        option += "<option value='1次/15天'>1次/15天</option>";
                        option += "<option value='1次/月'>1次/月</option>";
                        option += "<option value='1次/2月'>1次/2月</option>";
                        option += "<option value='1次/季'>1次/季</option>";
                        option += "<option value='1次/半年'>1次/半年</option>";
                        option += "<option value='1次/年'>1次/年</option>";
                        break;
                }
                $("#Frequency").append(option);
                $("#Frequency").val(FrequencyTitle);
                //<option value=''></option>
                //<option value='1次/1小时'>1次/1小时</option>
                //<option value='1次/2小时'>1次/2小时</option>
                //<option value='1次/3小时'>1次/3小时</option>
                //<option value='1次/4小时'>1次/4小时</option>
                //<option value='1次/6小时'>1次/6小时</option>
                //<option value='1次/8小时'>1次/8小时</option>
                //<option value='1次/12小时'>1次/12小时</option>
                //<option value='1次/天'>1次/天</option>
                //<option value='1次/周'>1次/周</option>
                //<option value='2次/周'>2次/周</option>
                //<option value='3次/周'>3次/周</option>
                //<option value='1次/10天'>1次/10天</option>
                //<option value='1次/15天'>1次/15天</option>
                //<option value='1次/月'>1次/月</option>
                //<option value='1次/2月'>1次/2月</option>
                //<option value='1次/季'>1次/季</option>
                //<option value='1次/半年'>1次/半年</option>
                //<option value='1次/年'>1次/年</option>
            }

            function SelTaskRole() {
                if ($("#LevelId").val() == "" || $("#LevelId").val() == null) {
                    HDialog.Info("请先选择任务级别!");
                    return;
                }
                HDialog.Open('650', '600', '../ComprehensivePatrols/SelRole.aspx?LevelId=' + $("#LevelId").val() + '&CommId=' + $("#CommId").val(), '选择责任岗位', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        var strs = new Array();
                        strs = _Data.split(',');
                        var code = "";
                        var name = "";
                        var all = "";
                        for (var i = 0; i < strs.length; i++) {
                            all = strs[i].trim().split(/\s+/);
                            code = code + all[0] + ",";
                            name = name + all[1] + ",";
                        }
                        code = code.substring(0, code.length - 1);
                        name = name.substring(0, name.length - 1);
                        $("#TaskRoleName").val(name);
                        $("#TaskRoleCode").val(code);
                        $("#TaskUserCode").val("");
                        $("#TaskUserName").val("");
                        SetPlanName();
                    };
                })
            }

            function SelTaskUser() {
                if ($("#TaskRoleCode").val() == "" || $("#TaskRoleCode").val() == null) {
                    HDialog.Info("请先选择责任岗位!");
                    return;
                }
                HDialog.Open('650', '600', '../ComprehensivePatrols/SelUser.aspx?RoleCode=' + $("#TaskRoleCode").val(), '选择责任人', false, function callback(_Data) {
                    if (_Data) {
                        $("#TaskUserCode").val(_Data.split(';')[1]);
                        $("#TaskUserName").val(_Data.split(';')[0]);
                    };
                })
            }

            //选择岗位
            function SelRole(type) {
                HDialog.Open('650', '600', '../ComprehensivePatrols/SelRole.aspx?CommId=' + $("#CommId").val(), '选择岗位', false, function callback(_Data) {
                    if (_Data) {
                        _Data = _Data.substring(1, _Data.length);
                        var strs = new Array();
                        strs = _Data.split(',');
                        var code = "";
                        var name = "";
                        var all = "";
                        for (var i = 0; i < strs.length; i++) {
                            all = strs[i].trim().split(/\s+/);
                            code = code + all[0] + ",";
                            name = name + all[1] + ",";
                        }
                        code = code.substring(0, code.length - 1);
                        name = name.substring(0, name.length - 1);
                        $("#" + type + "RoleName").val(name);
                        $("#" + type + "RoleCode").val(code);
                        $("#" + type + "UserCode").val('');
                        $("#" + type + "UserName").val('');
                    };
                })
            }

            //选择用户
            function SelUser(type) {
                //if ($("#" + type + "RoleCode").val() == "" || $("#" + type + "RoleCode").val() == null) {
                //    HDialog.Info("请先选择岗位!");
                //    return;
                //}
                HDialog.Open('650', '600', '../ComprehensivePatrols/SelUser.aspx?RoleCode=' + $("#" + type + "RoleCode").val(), '选择人员', false, function callback(_Data) {
                    if (_Data) {
                        $("#" + type + "UserCode").val(_Data.split(';')[1]);
                        $("#" + type + "UserName").val(_Data.split(';')[0]);
                    };
                })
            }

            //清除岗位
            function ClearRole(type) {
                $("#" + type + "RoleCode").val('');
                $("#" + type + "RoleName").val('');
            }

            //清除用户
            function ClearUser(type) {
                $("#" + type + "UserCode").val('');
                $("#" + type + "UserName").val('');
            }

            function SetPlanName() {
                var Frequency = "";
                if ($("#Frequency").find("option:selected").text() != "" &&
                    $("#TypeId").find("option:selected").text() != "" &&
                    $("#LevelId").find("option:selected").text() != "" &&
                    $("#TaskRoleName").val() != "") {
                    switch ($("#Frequency").find("option:selected").text()) {
                        case "1次/半小时":
                            Frequency = "半小时计划";
                            break;
                        case "1次/1小时":
                            Frequency = "一小时计划";
                            break;
                        case "1次/2小时":
                            Frequency = "两小时计划";
                            break;
                        case "1次/3小时":
                            Frequency = "三小时计划";
                            break;
                        case "1次/4小时":
                            Frequency = "四小时计划";
                            break;
                        case "1次/6小时":
                            Frequency = "六小时计划";
                            break;
                        case "1次/8小时":
                            Frequency = "八小时计划";
                            break;
                        case "1次/12小时":
                            Frequency = "半日计划";
                            break;
                        case "1次/天":
                            Frequency = "日计划";
                            break;
                        case "1次/周":
                            Frequency = "周一次计划";
                            break;
                        case "2次/周":
                            Frequency = "周两次计划";
                            break;
                        case "3次/周":
                            Frequency = "周三次计划";
                            break;
                        case "1次/10天":
                            Frequency = "月三次计划";
                            break;
                        case "1次/15天":
                            Frequency = "月两次计划";
                            break;
                        case "1次/月":
                            Frequency = "月计划";
                            break;
                        case "1次/2月":
                            Frequency = "两月计划";
                            break;
                        case "1次/季":
                            Frequency = "季计划";
                            break;
                        case "1次/半年":
                            Frequency = "半年计划";
                            break;
                        case "1次/年":
                            Frequency = "年计划";
                            break;
                    }
                    $("#PlanName").val($("#CommName").val() + "-" + $("#LevelId").find("option:selected").text() + "-" + $("#TaskRoleName").val() + "-" + $("#TypeId").find("option:selected").text() + "-" + Frequency);
                } else {
                    $("#PlanName").val("");
                }
            }

            function Save() {
                if ($("#Frequency").find("option:selected").text() == "") {
                    HDialog.Info("请选择任务频次!");
                    return;
                }
                var WorkTime = '';
                var WorkWeek = '';
                var WorkMonth = '';
                for (var i = 1; i < 8; i++) {
                    var checkboxs = $("input[type='checkbox'][id='chkWeek" + i + "']");
                    $.each(checkboxs, function () {
                        if (this.checked) {
                            WorkWeek += "," + i;
                        }
                    });
                }
                for (var i = 1; i <= 12; i++) {
                    var checkboxs = $("input[type='checkbox'][id='chkMonth" + i + "']");
                    $.each(checkboxs, function () {
                        if (this.checked) {
                            WorkMonth += "," + i;
                        }
                    });
                }
                if (WorkWeek.length > 0)
                    WorkWeek = WorkWeek.substr(1, WorkWeek.length - 1);
                if (WorkMonth.length > 0)
                    WorkMonth = WorkMonth.substr(1, WorkMonth.length - 1);
                var num = 0;
                switch ($("#Frequency").find("option:selected").text()) {
                    case "1次/半小时":
                        num = 48;
                        break;
                    case "1次/1小时":
                        num = 24;
                        break;
                    case "1次/2小时":
                        num = 12;
                        break;
                    case "1次/3小时":
                        num = 8;
                        break;
                    case "1次/4小时":
                        num = 6;
                        break;
                    case "1次/6小时":
                        num = 4;
                        break;
                    case "1次/8小时":
                        num = 3;
                        break;
                    case "1次/12小时":
                        num = 2;
                        break;
                    case "1次/天":
                        num = 0;
                        break;
                    case "1次/周":
                        num = 0;
                        WorkWeek = "";
                        break;
                    case "2次/周":
                        num = 2;
                        WorkWeek = "";
                        break;
                    case "3次/周":
                        num = 3;
                        WorkWeek = "";
                        break;
                    case "1次/10天":
                        num = 3;
                        WorkWeek = "";
                        break;
                    case "1次/15天":
                        num = 2;
                        WorkWeek = "";
                        break;
                    case "1次/月":
                        num = 0;
                        WorkWeek = "";
                        break;
                    case "1次/2月":
                        num = 6;
                        WorkWeek = "";
                        WorkMonth = "";
                        break;
                    case "1次/季":
                        num = 4;
                        WorkWeek = "";
                        WorkMonth = "";
                        break;
                    case "1次/半年":
                        num = 2;
                        WorkWeek = "";
                        WorkMonth = "";
                        break;
                    case "1次/年":
                        num = 1;
                        WorkWeek = "";
                        WorkMonth = "";
                        break;
                }
                if (num > 0) {
                    for (var i = 1; i <= num; i++) {
                        var checkboxs = $("input[type='checkbox'][id='chkTime" + i + "']");
                        $.each(checkboxs, function () {
                            if (this.checked) {
                                WorkTime += "," + i;
                            }
                        });
                    }
                }
                if (WorkTime.length > 0)
                    WorkTime = WorkTime.substr(1, WorkTime.length - 1);
                if (WorkTime == "" && WorkWeek == "" && WorkMonth == "") {
                    HDialog.Info("请选择频次详情!");
                    return;
                }
                var work = "&FrequencyTitle=" + $("#Frequency").find("option:selected").text() + "&WorkTime=" + WorkTime + "&WorkWeek=" + WorkWeek + "&WorkMonth=" + WorkMonth;
                if ($("#CpOpType").val() == "edit") {
                    if ($("#OldTypeId").val() != $("#TypeId").val()) {
                        HDialog.Prompt('修改模板任务类型后将刷新点位信息', function () {
                            SavePlan(work, 1);
                        });
                    } else {
                        SavePlan(work, 0);
                    }
                } else {
                    SavePlan(work, 0);
                }
            }

            function SavePlan(work, NeedClear) {
                $.tool.DataPostChk('frmForm', 'CpComPatrols', 'SavePlanTemplate', $('#frmForm').serialize() + work + '&NeedClear=' + NeedClear,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data > '') {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $("#OldTypeId").val($("#TypeId").val());//记录本次保存后的任务类型
                            if ($("#CpOpType").val() == "add") {
                                $("#PlanId").val(varObjects[0].PlanId);
                                $("#CpOpType").val("edit");
                                localStorage.setItem("CpPlanOpType", "edit");
                                localStorage.setItem("CpPlanCanEdit", true);
                                localStorage.setItem("CpPlanId", varObjects[0].PlanId);
                                $("#PointNum").val(varObjects[0].PointNum);
                                $("#MustCheckPointNum").val('0');
                                $("#OtherPointPercentage").val('0');
                                $("#CanEdit").val(localStorage.getItem('CpPlanCanEdit'));
                            } else if (NeedClear == 1) {
                                $("#PointNum").val(varObjects[0].PointNum);
                                $("#MustCheckPointNum").val('0');
                                $("#OtherPointPercentage").val('0');
                            }
                        }
                        HDialog.Info("保存成功!");
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Close() {
                window.parent.Close();
            }

            function chkAllWeek() {
                if ($('#chkWeekAll').is(':checked')) {
                    for (var i = 1; i < 8; i++) {
                        var checkboxs = $("input[type='checkbox'][id='chkWeek" + i + "']");
                        $.each(checkboxs, function () {
                            this.checked = "checked";
                        });
                    }
                }
                else {
                    for (var i = 1; i < 8; i++) {
                        var checkboxs = $("input[type='checkbox'][id='chkWeek" + i + "']");
                        $.each(checkboxs, function () {
                            this.checked = "";
                        });
                    }
                }
            }

            function chkWeek() {
                var ischecked = true;
                for (var i = 1; i < 8; i++) {
                    var checkboxs = $("input[type='checkbox'][id='chkWeek" + i + "']");
                    $.each(checkboxs, function () {
                        if (!this.checked) {
                            ischecked = false;
                        }
                    });
                }
                document.getElementById("chkWeekAll").checked = ischecked;
            }

            function chkAllMonth() {
                if ($('#chkMonthAll').is(':checked')) {
                    for (var i = 1; i < 13; i++) {
                        var checkboxs = $("input[type='checkbox'][id='chkMonth" + i + "']");
                        $.each(checkboxs, function () {
                            this.checked = "checked";
                        });
                    }
                }
                else {
                    for (var i = 1; i < 13; i++) {
                        var checkboxs = $("input[type='checkbox'][id='chkMonth" + i + "']");
                        $.each(checkboxs, function () {
                            this.checked = "";
                        });
                    }
                }
            }

            function chkMonth() {
                var ischecked = true;
                for (var i = 1; i <= 12; i++) {
                    var checkboxs = $("input[type='checkbox'][id='chkMonth" + i + "']");
                    $.each(checkboxs, function () {
                        if (!this.checked) {
                            ischecked = false;
                        }
                    });
                }
                document.getElementById("chkMonthAll").checked = ischecked;
            }

            function chkAllTime() {
                if ($('#chkTimeAll').is(':checked')) {
                    for (var i = 1; i < 49; i++) {
                        var checkboxs = $("input[type='checkbox'][id='chkTime" + i + "']");
                        $.each(checkboxs, function () {
                            this.checked = "checked";
                        });
                    }
                }
                else {
                    for (var i = 1; i < 49; i++) {
                        var checkboxs = $("input[type='checkbox'][id='chkTime" + i + "']");
                        $.each(checkboxs, function () {
                            this.checked = "";
                        });
                    }
                }
            }

            function chkTime() {
                var num = 24;
                switch ($("#Frequency").find("option:selected").text()) {
                    case "1次/半小时":
                        num = 48;
                        break;
                    case "1次/1小时":
                        num = 24;
                        break;
                    case "1次/2小时":
                        num = 12;
                        break;
                    case "1次/3小时":
                        num = 8;
                        break;
                    case "1次/4小时":
                        num = 6;
                        break;
                    case "1次/6小时":
                        num = 4;
                        break;
                    case "1次/8小时":
                        num = 3;
                        break;
                    case "1次/12小时":
                        num = 2;
                        break;
                    case "2次/周":
                        num = 2;
                        break;
                    case "3次/周":
                        num = 3;
                        break;
                    case "1次/10天":
                        num = 3;
                        break;
                    case "1次/15天":
                        num = 2;
                        break;
                    case "1次/2月":
                        num = 6;
                        break;
                    case "1次/季":
                        num = 4;
                        break;
                    case "1次/半年":
                        num = 2;
                        break;
                    case "1次/年":
                        num = 1;
                        break;
                    default:
                        num = 24;
                        break;
                }
                var ischecked = true;
                for (var i = 1; i <= num; i++) {
                    var checkboxs = $("input[type='checkbox'][id='chkTime" + i + "']");
                    $.each(checkboxs, function () {
                        if (!this.checked) {
                            ischecked = false;
                        }
                    });
                }
                document.getElementById("chkTimeAll").checked = ischecked;
            }

            function FrequencyChange(obj, varObjects) {
                //控制复选框选中状态
                document.getElementById("chkTime1").checked = false;
                document.getElementById("chkTime2").checked = false;
                document.getElementById("chkTime3").checked = false;
                document.getElementById("chkTime4").checked = false;
                document.getElementById("chkTime5").checked = false;

                document.getElementById("chkTime6").checked = false;
                document.getElementById("chkTime7").checked = false;
                document.getElementById("chkTime8").checked = false;
                document.getElementById("chkTime9").checked = false;
                document.getElementById("chkTime10").checked = false;

                document.getElementById("chkTime11").checked = false;
                document.getElementById("chkTime12").checked = false;
                document.getElementById("chkTime13").checked = false;
                document.getElementById("chkTime14").checked = false;
                document.getElementById("chkTime15").checked = false;

                document.getElementById("chkTime16").checked = false;
                document.getElementById("chkTime17").checked = false;
                document.getElementById("chkTime18").checked = false;
                document.getElementById("chkTime19").checked = false;
                document.getElementById("chkTime20").checked = false;

                document.getElementById("chkTime21").checked = false;
                document.getElementById("chkTime22").checked = false;
                document.getElementById("chkTime23").checked = false;
                document.getElementById("chkTime24").checked = false;

                document.getElementById("chkTime25").checked = false;
                document.getElementById("chkTime26").checked = false;
                document.getElementById("chkTime27").checked = false;
                document.getElementById("chkTime28").checked = false;
                document.getElementById("chkTime29").checked = false;

                document.getElementById("chkTime30").checked = false;
                document.getElementById("chkTime31").checked = false;
                document.getElementById("chkTime32").checked = false;
                document.getElementById("chkTime33").checked = false;
                document.getElementById("chkTime34").checked = false;

                document.getElementById("chkTime35").checked = false;
                document.getElementById("chkTime36").checked = false;
                document.getElementById("chkTime37").checked = false;
                document.getElementById("chkTime38").checked = false;
                document.getElementById("chkTime39").checked = false;

                document.getElementById("chkTime40").checked = false;
                document.getElementById("chkTime41").checked = false;
                document.getElementById("chkTime42").checked = false;
                document.getElementById("chkTime43").checked = false;
                document.getElementById("chkTime44").checked = false;

                document.getElementById("chkTime45").checked = false;
                document.getElementById("chkTime46").checked = false;
                document.getElementById("chkTime47").checked = false;
                document.getElementById("chkTime48").checked = false;

                document.getElementById("chkMonth1").checked = true;
                document.getElementById("chkMonth2").checked = true;
                document.getElementById("chkMonth3").checked = true;
                document.getElementById("chkMonth4").checked = true;
                document.getElementById("chkMonth5").checked = true;
                document.getElementById("chkMonth6").checked = true;
                document.getElementById("chkMonth7").checked = true;
                document.getElementById("chkMonth8").checked = true;
                document.getElementById("chkMonth9").checked = true;
                document.getElementById("chkMonth10").checked = true;
                document.getElementById("chkMonth11").checked = true;
                document.getElementById("chkMonth12").checked = true;

                document.getElementById("chkWeek1").checked = true;
                document.getElementById("chkWeek2").checked = true;
                document.getElementById("chkWeek3").checked = true;
                document.getElementById("chkWeek4").checked = true;
                document.getElementById("chkWeek5").checked = true;
                document.getElementById("chkWeek6").checked = true;
                document.getElementById("chkWeek7").checked = true;

                //默认全选
                document.getElementById("chkTimeAll").checked = true;
                document.getElementById("chkMonthAll").checked = true;
                document.getElementById("chkWeekAll").checked = true;

                //控制有效时段的文字
                $("#spTime1").html("");
                $("#spTime2").html("");
                $("#spTime3").html("");
                $("#spTime4").html("");
                $("#spTime5").html("");
                $("#spTime6").html("");
                $("#spTime7").html("");
                $("#spTime8").html("");
                $("#spTime9").html("");
                $("#spTime10").html("");
                $("#spTime11").html("");
                $("#spTime12").html("");
                $("#spTime13").html("");
                $("#spTime14").html("");
                $("#spTime15").html("");
                $("#spTime16").html("");
                $("#spTime17").html("");
                $("#spTime18").html("");
                $("#spTime19").html("");
                $("#spTime20").html("");
                $("#spTime21").html("");
                $("#spTime22").html("");
                $("#spTime23").html("");
                $("#spTime24").html("");

                $("#spTime25").html("");
                $("#spTime26").html("");
                $("#spTime27").html("");
                $("#spTime28").html("");
                $("#spTime29").html("");
                $("#spTime30").html("");
                $("#spTime31").html("");
                $("#spTime32").html("");
                $("#spTime33").html("");
                $("#spTime34").html("");
                $("#spTime35").html("");
                $("#spTime36").html("");
                $("#spTime37").html("");
                $("#spTime38").html("");
                $("#spTime39").html("");
                $("#spTime40").html("");
                $("#spTime41").html("");
                $("#spTime42").html("");
                $("#spTime43").html("");
                $("#spTime44").html("");
                $("#spTime45").html("");
                $("#spTime46").html("");
                $("#spTime47").html("");
                $("#spTime48").html("");

                //控制有效时段的复选框的展示
                $("#chkTime1").hide();
                $("#chkTime2").hide();
                $("#chkTime3").hide();
                $("#chkTime4").hide();
                $("#chkTime5").hide();

                $("#chkTime6").hide();
                $("#chkTime7").hide();
                $("#chkTime8").hide();
                $("#chkTime9").hide();
                $("#chkTime10").hide();

                $("#chkTime11").hide();
                $("#chkTime12").hide();
                $("#chkTime13").hide();
                $("#chkTime14").hide();
                $("#chkTime15").hide();

                $("#chkTime16").hide();
                $("#chkTime17").hide();
                $("#chkTime18").hide();
                $("#chkTime19").hide();
                $("#chkTime20").hide();

                $("#chkTime21").hide();
                $("#chkTime22").hide();
                $("#chkTime23").hide();
                $("#chkTime24").hide();

                $("#chkTime25").hide();
                $("#chkTime26").hide();
                $("#chkTime27").hide();
                $("#chkTime28").hide();
                $("#chkTime29").hide();

                $("#chkTime30").hide();
                $("#chkTime31").hide();
                $("#chkTime32").hide();
                $("#chkTime33").hide();
                $("#chkTime34").hide();

                $("#chkTime35").hide();
                $("#chkTime36").hide();
                $("#chkTime37").hide();
                $("#chkTime38").hide();
                $("#chkTime39").hide();

                $("#chkTime40").hide();
                $("#chkTime41").hide();
                $("#chkTime42").hide();
                $("#chkTime43").hide();
                $("#chkTime44").hide();

                $("#chkTime45").hide();
                $("#chkTime46").hide();
                $("#chkTime47").hide();
                $("#chkTime48").hide();

                //控制有效时段的文字的展示
                $("#spTime1").hide();
                $("#spTime2").hide();
                $("#spTime3").hide();
                $("#spTime4").hide();
                $("#spTime5").hide();

                $("#spTime6").hide();
                $("#spTime7").hide();
                $("#spTime8").hide();
                $("#spTime9").hide();
                $("#spTime10").hide();

                $("#spTime11").hide();
                $("#spTime12").hide();
                $("#spTime13").hide();
                $("#spTime14").hide();
                $("#spTime15").hide();

                $("#spTime16").hide();
                $("#spTime17").hide();
                $("#spTime18").hide();
                $("#spTime19").hide();
                $("#spTime20").hide();

                $("#spTime21").hide();
                $("#spTime22").hide();
                $("#spTime23").hide();
                $("#spTime24").hide();

                $("#spTime25").hide();
                $("#spTime26").hide();
                $("#spTime27").hide();
                $("#spTime28").hide();
                $("#spTime29").hide();
                $("#spTime30").hide();
                $("#spTime31").hide();
                $("#spTime32").hide();
                $("#spTime33").hide();
                $("#spTime34").hide();
                $("#spTime35").hide();
                $("#spTime36").hide();
                $("#spTime37").hide();
                $("#spTime38").hide();
                $("#spTime39").hide();
                $("#spTime40").hide();
                $("#spTime41").hide();
                $("#spTime42").hide();
                $("#spTime43").hide();
                $("#spTime44").hide();
                $("#spTime45").hide();
                $("#spTime46").hide();
                $("#spTime47").hide();
                $("#spTime48").hide();

                $("#TimeTr1").hide();
                $("#TimeTr2").hide();
                $("#TimeTr3").hide();
                $("#TimeTr4").hide();
                $("#TimeTr5").hide();
                $("#TimeTr6").hide();
                $("#TimeTr7").hide();

                switch ($(obj).find("option:selected").text()) {
                    case "1次/半小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").show();
                        $("#TimeTr3").show();
                        $("#TimeTr4").show();
                        $("#TimeTr5").show();
                        $("#TimeTr6").show();
                        $("#TimeTr7").show();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;
                        document.getElementById("chkTime5").checked = true;

                        document.getElementById("chkTime6").checked = true;
                        document.getElementById("chkTime7").checked = true;
                        document.getElementById("chkTime8").checked = true;
                        document.getElementById("chkTime9").checked = true;
                        document.getElementById("chkTime10").checked = true;

                        document.getElementById("chkTime11").checked = true;
                        document.getElementById("chkTime12").checked = true;
                        document.getElementById("chkTime13").checked = true;
                        document.getElementById("chkTime14").checked = true;
                        document.getElementById("chkTime15").checked = true;

                        document.getElementById("chkTime16").checked = true;
                        document.getElementById("chkTime17").checked = true;
                        document.getElementById("chkTime18").checked = true;
                        document.getElementById("chkTime19").checked = true;
                        document.getElementById("chkTime20").checked = true;

                        document.getElementById("chkTime21").checked = true;
                        document.getElementById("chkTime22").checked = true;
                        document.getElementById("chkTime23").checked = true;
                        document.getElementById("chkTime24").checked = true;

                        document.getElementById("chkTime25").checked = true;
                        document.getElementById("chkTime26").checked = true;
                        document.getElementById("chkTime27").checked = true;
                        document.getElementById("chkTime28").checked = true;
                        document.getElementById("chkTime29").checked = true;

                        document.getElementById("chkTime30").checked = true;
                        document.getElementById("chkTime31").checked = true;
                        document.getElementById("chkTime32").checked = true;
                        document.getElementById("chkTime33").checked = true;
                        document.getElementById("chkTime34").checked = true;

                        document.getElementById("chkTime35").checked = true;
                        document.getElementById("chkTime36").checked = true;
                        document.getElementById("chkTime37").checked = true;
                        document.getElementById("chkTime38").checked = true;
                        document.getElementById("chkTime39").checked = true;

                        document.getElementById("chkTime40").checked = true;
                        document.getElementById("chkTime41").checked = true;
                        document.getElementById("chkTime42").checked = true;
                        document.getElementById("chkTime43").checked = true;
                        document.getElementById("chkTime44").checked = true;

                        document.getElementById("chkTime45").checked = true;
                        document.getElementById("chkTime46").checked = true;
                        document.getElementById("chkTime47").checked = true;
                        document.getElementById("chkTime48").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-00:30");
                        $("#spTime2").html("00:30-01:00");
                        $("#spTime3").html("01:00-01:30");
                        $("#spTime4").html("01:30-02:00");
                        $("#spTime5").html("02:00-02:30");
                        $("#spTime6").html("02:30-03:00");
                        $("#spTime7").html("03:00-03:30");
                        $("#spTime8").html("03:30-04:00");
                        $("#spTime9").html("04:00-04:30");
                        $("#spTime10").html("04:30-05:00");
                        $("#spTime11").html("05:00-05:30");
                        $("#spTime12").html("05:30-06:00");
                        $("#spTime13").html("06:00-06:30");
                        $("#spTime14").html("06:30-07:00");
                        $("#spTime15").html("07:00-07:30");
                        $("#spTime16").html("07:30-08:00");
                        $("#spTime17").html("08:00-08:30");
                        $("#spTime18").html("08:30-09:00");
                        $("#spTime19").html("09:00-09:30");
                        $("#spTime20").html("09:30-10:00");
                        $("#spTime21").html("10:00-10:30");
                        $("#spTime22").html("10:30-11:00");
                        $("#spTime23").html("11:00-11:30");
                        $("#spTime24").html("11:30-12:00");

                        $("#spTime25").html("12:00-12:30");
                        $("#spTime26").html("12:30-13:00");
                        $("#spTime27").html("13:00-13:30");
                        $("#spTime28").html("13:30-14:00");
                        $("#spTime29").html("14:00-14:30");
                        $("#spTime30").html("14:30-15:00");
                        $("#spTime31").html("15:00-15:30");
                        $("#spTime32").html("15:30-16:00");
                        $("#spTime33").html("16:00-16:30");
                        $("#spTime34").html("16:30-17:00");
                        $("#spTime35").html("17:00-17:30");
                        $("#spTime36").html("17:30-18:00");
                        $("#spTime37").html("18:00-18:30");
                        $("#spTime38").html("18:30-19:00");
                        $("#spTime39").html("19:00-19:30");
                        $("#spTime40").html("19:30-20:00");
                        $("#spTime41").html("20:00-20:30");
                        $("#spTime42").html("20:30-21:00");
                        $("#spTime43").html("21:00-21:30");
                        $("#spTime44").html("21:30-22:00");
                        $("#spTime45").html("22:00-22:30");
                        $("#spTime46").html("22:30-23:00");
                        $("#spTime47").html("23:00-23:30");
                        $("#spTime48").html("23:30-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();
                        $("#chkTime5").show();

                        $("#chkTime6").show();
                        $("#chkTime7").show();
                        $("#chkTime8").show();
                        $("#chkTime9").show();
                        $("#chkTime10").show();

                        $("#chkTime11").show();
                        $("#chkTime12").show();
                        $("#chkTime13").show();
                        $("#chkTime14").show();
                        $("#chkTime15").show();

                        $("#chkTime16").show();
                        $("#chkTime17").show();
                        $("#chkTime18").show();
                        $("#chkTime19").show();
                        $("#chkTime20").show();

                        $("#chkTime21").show();
                        $("#chkTime22").show();
                        $("#chkTime23").show();
                        $("#chkTime24").show();

                        $("#chkTime25").show();
                        $("#chkTime26").show();
                        $("#chkTime27").show();
                        $("#chkTime28").show();
                        $("#chkTime29").show();

                        $("#chkTime30").show();
                        $("#chkTime31").show();
                        $("#chkTime32").show();
                        $("#chkTime33").show();
                        $("#chkTime34").show();

                        $("#chkTime35").show();
                        $("#chkTime36").show();
                        $("#chkTime37").show();
                        $("#chkTime38").show();
                        $("#chkTime39").show();

                        $("#chkTime40").show();
                        $("#chkTime41").show();
                        $("#chkTime42").show();
                        $("#chkTime43").show();
                        $("#chkTime44").show();

                        $("#chkTime45").show();
                        $("#chkTime46").show();
                        $("#chkTime47").show();
                        $("#chkTime48").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();
                        $("#spTime5").show();

                        $("#spTime6").show();
                        $("#spTime7").show();
                        $("#spTime8").show();
                        $("#spTime9").show();
                        $("#spTime10").show();

                        $("#spTime11").show();
                        $("#spTime12").show();
                        $("#spTime13").show();
                        $("#spTime14").show();
                        $("#spTime15").show();

                        $("#spTime16").show();
                        $("#spTime17").show();
                        $("#spTime18").show();
                        $("#spTime19").show();
                        $("#spTime20").show();

                        $("#spTime21").show();
                        $("#spTime22").show();
                        $("#spTime23").show();
                        $("#spTime24").show();

                        $("#spTime25").show();
                        $("#spTime26").show();
                        $("#spTime27").show();
                        $("#spTime28").show();
                        $("#spTime29").show();
                        $("#spTime30").show();
                        $("#spTime31").show();
                        $("#spTime32").show();
                        $("#spTime33").show();
                        $("#spTime34").show();
                        $("#spTime35").show();
                        $("#spTime36").show();
                        $("#spTime37").show();
                        $("#spTime38").show();
                        $("#spTime39").show();
                        $("#spTime40").show();
                        $("#spTime41").show();
                        $("#spTime42").show();
                        $("#spTime43").show();
                        $("#spTime44").show();
                        $("#spTime45").show();
                        $("#spTime46").show();
                        $("#spTime47").show();
                        $("#spTime48").show();

                        break;
                    case "1次/1小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").show();
                        $("#TimeTr3").show();
                        $("#TimeTr4").show();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;
                        document.getElementById("chkTime5").checked = true;

                        document.getElementById("chkTime6").checked = true;
                        document.getElementById("chkTime7").checked = true;
                        document.getElementById("chkTime8").checked = true;
                        document.getElementById("chkTime9").checked = true;
                        document.getElementById("chkTime10").checked = true;

                        document.getElementById("chkTime11").checked = true;
                        document.getElementById("chkTime12").checked = true;
                        document.getElementById("chkTime13").checked = true;
                        document.getElementById("chkTime14").checked = true;
                        document.getElementById("chkTime15").checked = true;

                        document.getElementById("chkTime16").checked = true;
                        document.getElementById("chkTime17").checked = true;
                        document.getElementById("chkTime18").checked = true;
                        document.getElementById("chkTime19").checked = true;
                        document.getElementById("chkTime20").checked = true;

                        document.getElementById("chkTime21").checked = true;
                        document.getElementById("chkTime22").checked = true;
                        document.getElementById("chkTime23").checked = true;
                        document.getElementById("chkTime24").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-01:00");
                        $("#spTime2").html("01:00-02:00");
                        $("#spTime3").html("02:00-03:00");
                        $("#spTime4").html("03:00-04:00");
                        $("#spTime5").html("04:00-05:00");
                        $("#spTime6").html("05:00-06:00");
                        $("#spTime7").html("06:00-07:00");
                        $("#spTime8").html("07:00-08:00");
                        $("#spTime9").html("08:00-09:00");
                        $("#spTime10").html("09:00-10:00");
                        $("#spTime11").html("10:00-11:00");
                        $("#spTime12").html("11:00-12:00");
                        $("#spTime13").html("12:00-13:00");
                        $("#spTime14").html("13:00-14:00");
                        $("#spTime15").html("14:00-15:00");
                        $("#spTime16").html("15:00-16:00");
                        $("#spTime17").html("16:00-17:00");
                        $("#spTime18").html("17:00-18:00");
                        $("#spTime19").html("18:00-19:00");
                        $("#spTime20").html("19:00-20:00");
                        $("#spTime21").html("20:00-21:00");
                        $("#spTime22").html("21:00-22:00");
                        $("#spTime23").html("22:00-23:00");
                        $("#spTime24").html("23:00-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();
                        $("#chkTime5").show();

                        $("#chkTime6").show();
                        $("#chkTime7").show();
                        $("#chkTime8").show();
                        $("#chkTime9").show();
                        $("#chkTime10").show();

                        $("#chkTime11").show();
                        $("#chkTime12").show();
                        $("#chkTime13").show();
                        $("#chkTime14").show();
                        $("#chkTime15").show();

                        $("#chkTime16").show();
                        $("#chkTime17").show();
                        $("#chkTime18").show();
                        $("#chkTime19").show();
                        $("#chkTime20").show();

                        $("#chkTime21").show();
                        $("#chkTime22").show();
                        $("#chkTime23").show();
                        $("#chkTime24").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();
                        $("#spTime5").show();

                        $("#spTime6").show();
                        $("#spTime7").show();
                        $("#spTime8").show();
                        $("#spTime9").show();
                        $("#spTime10").show();

                        $("#spTime11").show();
                        $("#spTime12").show();
                        $("#spTime13").show();
                        $("#spTime14").show();
                        $("#spTime15").show();

                        $("#spTime16").show();
                        $("#spTime17").show();
                        $("#spTime18").show();
                        $("#spTime19").show();
                        $("#spTime20").show();

                        $("#spTime21").show();
                        $("#spTime22").show();
                        $("#spTime23").show();
                        $("#spTime24").show();

                        break;
                    case "1次/2小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").show();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;
                        document.getElementById("chkTime5").checked = true;

                        document.getElementById("chkTime6").checked = true;
                        document.getElementById("chkTime7").checked = true;
                        document.getElementById("chkTime8").checked = true;
                        document.getElementById("chkTime9").checked = true;
                        document.getElementById("chkTime10").checked = true;

                        document.getElementById("chkTime11").checked = true;
                        document.getElementById("chkTime12").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-02:00");
                        $("#spTime2").html("02:00-04:00");
                        $("#spTime3").html("04:00-06:00");
                        $("#spTime4").html("06:00-08:00");
                        $("#spTime5").html("08:00-10:00");
                        $("#spTime6").html("10:00-12:00");
                        $("#spTime7").html("12:00-14:00");
                        $("#spTime8").html("14:00-16:00");
                        $("#spTime9").html("16:00-18:00");
                        $("#spTime10").html("18:00-20:00");
                        $("#spTime11").html("20:00-22:00");
                        $("#spTime12").html("22:00-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();
                        $("#chkTime5").show();

                        $("#chkTime6").show();
                        $("#chkTime7").show();
                        $("#chkTime8").show();
                        $("#chkTime9").show();
                        $("#chkTime10").show();

                        $("#chkTime11").show();
                        $("#chkTime12").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();
                        $("#spTime5").show();

                        $("#spTime6").show();
                        $("#spTime7").show();
                        $("#spTime8").show();
                        $("#spTime9").show();
                        $("#spTime10").show();

                        $("#spTime11").show();
                        $("#spTime12").show();

                        break;
                    case "1次/3小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").show();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;
                        document.getElementById("chkTime5").checked = true;

                        document.getElementById("chkTime6").checked = true;
                        document.getElementById("chkTime7").checked = true;
                        document.getElementById("chkTime8").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-03:00");
                        $("#spTime2").html("03:00-06:00");
                        $("#spTime3").html("06:00-09:00");
                        $("#spTime4").html("09:00-12:00");
                        $("#spTime5").html("12:00-15:00");
                        $("#spTime6").html("15:00-18:00");
                        $("#spTime7").html("18:00-21:00");
                        $("#spTime8").html("21:00-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();
                        $("#chkTime5").show();

                        $("#chkTime6").show();
                        $("#chkTime7").show();
                        $("#chkTime8").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();
                        $("#spTime5").show();

                        $("#spTime6").show();
                        $("#spTime7").show();
                        $("#spTime8").show();

                        break;
                    case "1次/4小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;
                        document.getElementById("chkTime5").checked = true;

                        document.getElementById("chkTime6").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-04:00");
                        $("#spTime2").html("04:00-08:00");
                        $("#spTime3").html("08:00-12:00");
                        $("#spTime4").html("12:00-16:00");
                        $("#spTime5").html("16:00-20:00");
                        $("#spTime6").html("20:00-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();
                        $("#chkTime5").show();

                        $("#chkTime6").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();
                        $("#spTime5").show();

                        $("#spTime6").show();

                        break;
                    case "1次/6小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-06:00");
                        $("#spTime2").html("06:00-12:00");
                        $("#spTime3").html("12:00-18:00");
                        $("#spTime4").html("18:00-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();

                        break;
                    case "1次/8小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-08:00");
                        $("#spTime2").html("08:00-16:00");
                        $("#spTime3").html("16:00-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();

                        break;
                    case "1次/12小时":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-12:00");
                        $("#spTime2").html("12:00-24:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();

                        break;
                    case "1次/天":
                        //控制列显示
                        $("#TimeTr1").hide();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        document.getElementById("chkTimeAll").checked = false;

                        break;
                    case "1次/周":
                        //控制列显示
                        $("#TimeTr1").hide();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").hide();

                        document.getElementById("chkTimeAll").checked = false;
                        document.getElementById("chkWeekAll").checked = false;

                        break;
                    case "2次/周":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;

                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("星期一-星期三");
                        $("#spTime2").html("星期四-星期日");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();

                        break;
                    case "3次/周":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;

                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("星期一-星期二");
                        $("#spTime2").html("星期三-星期四");
                        $("#spTime3").html("星期五-星期日");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();

                        break;
                    case "1次/10天":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;

                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("1日-10日");
                        $("#spTime2").html("11日-20日");
                        $("#spTime3").html("21日-31日");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();

                        break;
                    case "1次/15天":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;

                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("1日-15日");
                        $("#spTime2").html("16日-31日");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();

                        break;
                    case "1次/月":
                        //控制列显示
                        $("#TimeTr1").hide();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").hide();

                        document.getElementById("chkTimeAll").checked = false;
                        document.getElementById("chkWeekAll").checked = false;

                        break;
                    case "1次/2月":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").hide();
                        $("#MonthTr2").hide();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;
                        document.getElementById("chkTime5").checked = true;

                        document.getElementById("chkTime6").checked = true;

                        document.getElementById("chkMonthAll").checked = false;
                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("1.1-2.28");
                        $("#spTime2").html("3.1-4.30");
                        $("#spTime3").html("5.1-6.30");
                        $("#spTime4").html("7.1-8.31");
                        $("#spTime5").html("9.1-10.31");
                        $("#spTime6").html("11.1-12.31");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();
                        $("#chkTime5").show();
                        $("#chkTime6").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();
                        $("#spTime5").show();
                        $("#spTime6").show();

                        break;
                    case "1次/季":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").hide();
                        $("#MonthTr2").hide();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;

                        document.getElementById("chkMonthAll").checked = false;
                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("1.1-3.31");
                        $("#spTime2").html("4.1-6.30");
                        $("#spTime3").html("7.1-9.30");
                        $("#spTime4").html("10.1-12.31");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();

                        break;
                    case "1次/半年":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").hide();
                        $("#MonthTr2").hide();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;

                        document.getElementById("chkMonthAll").checked = false;
                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("1.1-6.30");
                        $("#spTime2").html("7.1-12.31");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();

                        break;
                    case "1次/年":
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").hide();
                        $("#TimeTr3").hide();
                        $("#TimeTr4").hide();

                        $("#MonthTr1").hide();
                        $("#MonthTr2").hide();

                        $("#WeekTr").hide();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;

                        document.getElementById("chkMonthAll").checked = false;
                        document.getElementById("chkWeekAll").checked = false;

                        //控制有效时段的文字
                        $("#spTime1").html("1.1-12.31");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();

                        break;
                    default:
                        //控制列显示
                        $("#TimeTr1").show();
                        $("#TimeTr2").show();
                        $("#TimeTr3").show();
                        $("#TimeTr4").show();
                        $("#TimeTr5").show();
                        $("#TimeTr6").show();
                        $("#TimeTr7").show();

                        $("#MonthTr1").show();
                        $("#MonthTr2").show();

                        $("#WeekTr").show();

                        //控制复选框选中状态
                        document.getElementById("chkTime1").checked = true;
                        document.getElementById("chkTime2").checked = true;
                        document.getElementById("chkTime3").checked = true;
                        document.getElementById("chkTime4").checked = true;
                        document.getElementById("chkTime5").checked = true;

                        document.getElementById("chkTime6").checked = true;
                        document.getElementById("chkTime7").checked = true;
                        document.getElementById("chkTime8").checked = true;
                        document.getElementById("chkTime9").checked = true;
                        document.getElementById("chkTime10").checked = true;

                        document.getElementById("chkTime11").checked = true;
                        document.getElementById("chkTime12").checked = true;
                        document.getElementById("chkTime13").checked = true;
                        document.getElementById("chkTime14").checked = true;
                        document.getElementById("chkTime15").checked = true;

                        document.getElementById("chkTime16").checked = true;
                        document.getElementById("chkTime17").checked = true;
                        document.getElementById("chkTime18").checked = true;
                        document.getElementById("chkTime19").checked = true;
                        document.getElementById("chkTime20").checked = true;

                        document.getElementById("chkTime21").checked = true;
                        document.getElementById("chkTime22").checked = true;
                        document.getElementById("chkTime23").checked = true;
                        document.getElementById("chkTime24").checked = true;

                        document.getElementById("chkTime25").checked = true;
                        document.getElementById("chkTime26").checked = true;
                        document.getElementById("chkTime27").checked = true;
                        document.getElementById("chkTime28").checked = true;
                        document.getElementById("chkTime29").checked = true;

                        document.getElementById("chkTime30").checked = true;
                        document.getElementById("chkTime31").checked = true;
                        document.getElementById("chkTime32").checked = true;
                        document.getElementById("chkTime33").checked = true;
                        document.getElementById("chkTime34").checked = true;

                        document.getElementById("chkTime35").checked = true;
                        document.getElementById("chkTime36").checked = true;
                        document.getElementById("chkTime37").checked = true;
                        document.getElementById("chkTime38").checked = true;
                        document.getElementById("chkTime39").checked = true;

                        document.getElementById("chkTime40").checked = true;
                        document.getElementById("chkTime41").checked = true;
                        document.getElementById("chkTime42").checked = true;
                        document.getElementById("chkTime43").checked = true;
                        document.getElementById("chkTime44").checked = true;

                        document.getElementById("chkTime45").checked = true;
                        document.getElementById("chkTime46").checked = true;
                        document.getElementById("chkTime47").checked = true;
                        document.getElementById("chkTime48").checked = true;

                        //控制有效时段的文字
                        $("#spTime1").html("00:00-00:30");
                        $("#spTime2").html("00:30-01:00");
                        $("#spTime3").html("01:00-01:30");
                        $("#spTime4").html("01:30-02:00");
                        $("#spTime5").html("02:00-02:30");
                        $("#spTime6").html("02:30-03:00");
                        $("#spTime7").html("03:00-03:30");
                        $("#spTime8").html("03:30-04:00");
                        $("#spTime9").html("04:00-04:30");
                        $("#spTime10").html("04:30-05:00");
                        $("#spTime11").html("05:00-05:30");
                        $("#spTime12").html("05:30-06:00");
                        $("#spTime13").html("06:00-06:30");
                        $("#spTime14").html("06:30-07:00");
                        $("#spTime15").html("07:00-07:30");
                        $("#spTime16").html("07:30-08:00");
                        $("#spTime17").html("08:00-08:30");
                        $("#spTime18").html("08:30-09:00");
                        $("#spTime19").html("09:00-09:30");
                        $("#spTime20").html("09:30-10:00");
                        $("#spTime21").html("10:00-10:30");
                        $("#spTime22").html("10:30-11:00");
                        $("#spTime23").html("11:00-11:30");
                        $("#spTime24").html("11:30-12:00");

                        $("#spTime25").html("12:00-12:30");
                        $("#spTime26").html("12:30-13:00");
                        $("#spTime27").html("13:00-13:30");
                        $("#spTime28").html("13:30-14:00");
                        $("#spTime29").html("14:00-14:30");
                        $("#spTime30").html("14:30-15:00");
                        $("#spTime31").html("15:00-15:30");
                        $("#spTime32").html("15:30-16:00");
                        $("#spTime33").html("16:00-16:30");
                        $("#spTime34").html("16:30-17:00");
                        $("#spTime35").html("17:00-17:30");
                        $("#spTime36").html("17:30-18:00");
                        $("#spTime37").html("18:00-18:30");
                        $("#spTime38").html("18:30-19:00");
                        $("#spTime39").html("19:00-19:30");
                        $("#spTime40").html("19:30-20:00");
                        $("#spTime41").html("20:00-20:30");
                        $("#spTime42").html("20:30-21:00");
                        $("#spTime43").html("21:00-21:30");
                        $("#spTime44").html("21:30-22:00");
                        $("#spTime45").html("22:00-22:30");
                        $("#spTime46").html("22:30-23:00");
                        $("#spTime47").html("23:00-23:30");
                        $("#spTime48").html("23:30-00:00");

                        //控制有效时段的复选框的展示
                        $("#chkTime1").show();
                        $("#chkTime2").show();
                        $("#chkTime3").show();
                        $("#chkTime4").show();
                        $("#chkTime5").show();

                        $("#chkTime6").show();
                        $("#chkTime7").show();
                        $("#chkTime8").show();
                        $("#chkTime9").show();
                        $("#chkTime10").show();

                        $("#chkTime11").show();
                        $("#chkTime12").show();
                        $("#chkTime13").show();
                        $("#chkTime14").show();
                        $("#chkTime15").show();

                        $("#chkTime16").show();
                        $("#chkTime17").show();
                        $("#chkTime18").show();
                        $("#chkTime19").show();
                        $("#chkTime20").show();

                        $("#chkTime21").show();
                        $("#chkTime22").show();
                        $("#chkTime23").show();
                        $("#chkTime24").show();

                        $("#chkTime25").show();
                        $("#chkTime26").show();
                        $("#chkTime27").show();
                        $("#chkTime28").show();
                        $("#chkTime29").show();

                        $("#chkTime30").show();
                        $("#chkTime31").show();
                        $("#chkTime32").show();
                        $("#chkTime33").show();
                        $("#chkTime34").show();

                        $("#chkTime35").show();
                        $("#chkTime36").show();
                        $("#chkTime37").show();
                        $("#chkTime38").show();
                        $("#chkTime39").show();

                        $("#chkTime40").show();
                        $("#chkTime41").show();
                        $("#chkTime42").show();
                        $("#chkTime43").show();
                        $("#chkTime44").show();

                        $("#chkTime45").show();
                        $("#chkTime46").show();
                        $("#chkTime47").show();
                        $("#chkTime48").show();

                        //控制有效时段的文字的展示
                        $("#spTime1").show();
                        $("#spTime2").show();
                        $("#spTime3").show();
                        $("#spTime4").show();
                        $("#spTime5").show();

                        $("#spTime6").show();
                        $("#spTime7").show();
                        $("#spTime8").show();
                        $("#spTime9").show();
                        $("#spTime10").show();

                        $("#spTime11").show();
                        $("#spTime12").show();
                        $("#spTime13").show();
                        $("#spTime14").show();
                        $("#spTime15").show();

                        $("#spTime16").show();
                        $("#spTime17").show();
                        $("#spTime18").show();
                        $("#spTime19").show();
                        $("#spTime20").show();

                        $("#spTime21").show();
                        $("#spTime22").show();
                        $("#spTime23").show();
                        $("#spTime24").show();

                        $("#spTime25").show();
                        $("#spTime26").show();
                        $("#spTime27").show();
                        $("#spTime28").show();
                        $("#spTime29").show();
                        $("#spTime30").show();
                        $("#spTime31").show();
                        $("#spTime32").show();
                        $("#spTime33").show();
                        $("#spTime34").show();
                        $("#spTime35").show();
                        $("#spTime36").show();
                        $("#spTime37").show();
                        $("#spTime38").show();
                        $("#spTime39").show();
                        $("#spTime40").show();
                        $("#spTime41").show();
                        $("#spTime42").show();
                        $("#spTime43").show();
                        $("#spTime44").show();
                        $("#spTime45").show();
                        $("#spTime46").show();
                        $("#spTime47").show();
                        $("#spTime48").show();

                        break;
                }
                if ($("#CpOpType").val() == 'edit' && varObjects > '') {
                    SetCheck(varObjects)
                } else {
                    SetPlanName();
                }
            }

            function SetCheck(varObjects) {
                //循环48次
                for (var ii = 1; ii <= 48; ii++) {
                    document.getElementById("chkTime" + ii).checked = false;
                    if (ii <= 12)
                        document.getElementById("chkMonth" + ii).checked = false;
                    if (ii <= 7)
                        document.getElementById("chkWeek" + ii).checked = false;
                }

                var Week = varObjects[0].WorkWeek;
                if (Week > '') {
                    var Weeks = Week.split(',');
                    for (var ii = 0; ii < Weeks.length; ii++) {
                        document.getElementById("chkWeek" + Weeks[ii]).checked = true;
                    }
                    document.getElementById("chkWeekAll").checked = (Week.indexOf('1,2,3,4,5,6,7') >= 0);
                }

                var Month = varObjects[0].WorkMonth;
                if (Month > '') {
                    var Months = Month.split(',');
                    for (var ii = 0; ii < Months.length; ii++) {
                        document.getElementById("chkMonth" + Months[ii]).checked = true;
                    }
                    document.getElementById("chkMonthAll").checked = (Month.indexOf('1,2,3,4,5,6,7,8,9,10,11,12') >= 0);
                }

                var Time = varObjects[0].WorkTime;
                if (Time > '') {
                    var Times = Time.split(',');
                    for (var ii = 0; ii < Times.length; ii++) {
                        document.getElementById("chkTime" + Times[ii]).checked = true;
                    }
                    var str = '';
                    switch (varObjects[0].FrequencyTitle) {
                        case "1次/半小时":
                            str = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48';
                            break;
                        case "1次/1小时":
                            str = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24';
                            break;
                        case "1次/2小时":
                            str = '1,2,3,4,5,6,7,8,9,10,11,12';
                            break;
                        case "1次/3小时":
                            str = '1,2,3,4,5,6,7,8';
                            break;
                        case "1次/4小时":
                            str = '1,2,3,4,5,6';
                            break;
                        case "1次/6小时":
                            str = '1,2,3,4';
                            break;
                        case "1次/8小时":
                            str = '1,2,3';
                            break;
                        case "1次/12小时":
                            str = '1,2';
                            break;
                        case "2次/周":
                            str = '1,2';
                            break;
                        case "3次/周":
                            str = '1,2,3';
                            break;
                        case "1次/10天":
                            str = '1,2,3';
                            break;
                        case "1次/15天":
                            str = '1,2';
                            break;
                        case "1次/2月":
                            str = '1,2,3,4,5,6';
                            break;
                        case "1次/季":
                            str = '1,2,3,4';
                            break;
                        case "1次/半年":
                            str = '1,2';
                            break;
                        case "1次/年":
                            str = '1';
                            break;
                    }
                    document.getElementById("chkTimeAll").checked = (Time.indexOf(str) >= 0);
                }
            }

            function Load() {
                $("#CpOpType").val(localStorage.getItem('CpPlanOpType'));
                $("#CommId").val(localStorage.getItem('CpPlanCommId'));
                $("#CommName").val(localStorage.getItem('CpPlanCommName'));
                $("#CanEdit").val(localStorage.getItem('CpPlanCanEdit'));
                if ($("#CpOpType").val() == "edit") {
                    if ($("#CanEdit").val() == "false") {
                        $("#BtnSave").hide();
                    }
                    $("#PlanId").val(localStorage.getItem('CpPlanId'));
                    LoadData($("#PlanId").val());
                } else if (localStorage.getItem('CpCopyPlanId') > '') {
                    LoadData(localStorage.getItem('CpCopyPlanId'));
                }
            }

            function LoadData(PlanId) {
                $.tool.DataGet('CpComPatrols', 'GetPlanTemplateList', 'page=1&rows=10&PlanId=' + PlanId + '&CommId=' + $("#CommId").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        $("#TypeId").val(varObjects.rows[0].TypeId);
                        $("#OldTypeId").val(varObjects.rows[0].TypeId);
                        SelTaskType(varObjects.rows[0].LevelId, varObjects.rows[0].FrequencyTitle);
                        $("#TaskRoleCode").val(varObjects.rows[0].TaskRoleCode);
                        $("#TaskRoleName").val(varObjects.rows[0].TaskRoleName);
                        $("#TaskUserCode").val(varObjects.rows[0].TaskUserCode);
                        $("#TaskUserName").val(varObjects.rows[0].TaskUserName);
                        $("#IsEntrust").val(varObjects.rows[0].IsEntrust);
                        $("#PointNum").val(varObjects.rows[0].PointNum);
                        $("#MustCheckPointNum").val(varObjects.rows[0].MustCheckPointNum);
                        $("#OtherPointPercentage").val(varObjects.rows[0].OtherPointPercentage);
                        $("#TaskPointIsScan").val(varObjects.rows[0].TaskPointIsScan);
                        $("#TaskPointIsPhotograph").val(varObjects.rows[0].TaskPointIsPhotograph);
                        $("#ProblemPointIsPhotograph").val(varObjects.rows[0].ProblemPointIsPhotograph);
                        $("#ProblemPointIsIncident").val(varObjects.rows[0].ProblemPointIsIncident);
                        $("#ReportRoleCode").val(varObjects.rows[0].ReportRoleCode);
                        $("#ReportRoleName").val(varObjects.rows[0].ReportRoleName);
                        $("#ReportUserCode").val(varObjects.rows[0].ReportUserCode);
                        $("#ReportUserName").val(varObjects.rows[0].ReportUserName);
                        $("#OverdueRoleCode").val(varObjects.rows[0].OverdueRoleCode);
                        $("#OverdueRoleName").val(varObjects.rows[0].OverdueRoleName);
                        $("#OverdueUserCode").val(varObjects.rows[0].OverdueUserCode);
                        $("#OverdueUserName").val(varObjects.rows[0].OverdueUserName);
                        $("#Frequency").val(varObjects.rows[0].FrequencyTitle);
                        $("#RatedHours").val(varObjects.rows[0].RatedHours);
                        $("#Performance").val(varObjects.rows[0].Performance);
                        $("#GeneratingType").val(varObjects.rows[0].GeneratingType);
                        $("#IsEnable").val(varObjects.rows[0].IsEnable);
                        $("#Remark").val(varObjects.rows[0].Remark);
                        setTimeout(FrequencyChange($("#Frequency"), varObjects.rows), 1000);
                        $("#PlanName").val(varObjects.rows[0].PlanName);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $(document).ready(function () { Load(); });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
