<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanEdit.aspx.cs" Inherits="M_Main.Supervision.PlanEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划编辑</title>
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
    <script src="../jscript/uuid.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .dlg_table {
            margin-bottom: 53px;
        }

        .datagrid-toolbar tr td {
            padding: 0px;
        }

        .dlg_table tr td.title {
            width: 10%;
        }

        .dlg_table tr td.text {
            width: 40%;
        }

        .easyui-textbox {
            width: 35%;
        }

        .easyui-numberbox {
            width: 35%;
        }

        .easyui-combobox {
            width: 35%;
        }

        .colspan {
            width: 84.5%;
        }

        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="padding: 5px;">
            <table class="dlg_table">
                <tr>
                    <td class="title">项目名称:</td>
                    <td class="text" colspan="3">
                        <input id="CommId" name="CommId" class="easyui-textbox colspan" data-options="
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false" />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查类型:</td>
                    <td class="text">
                        <input id="CheckTypeId" name="CheckTypeId" class="easyui-combobox" />
                    </td>
                    <td class="title">计划名称:</td>
                    <td class="text">
                        <input type="text" id="PlanName" name="PlanName" class="easyui-textbox" data-options="
                            required: false,
                            editable: false,
                            value:'保存后自动生成'
                            " />
                    </td>
                </tr>
                <tr>
                    <td class="title">检查方式:</td>
                    <td class="text">
                        <input id="CheckMethod" name="CheckMethod" class="easyui-combobox" />
                    </td>
                    <td class="title">检查频次:</td>
                    <td class="text">
                        <input id="Frequency" name="Frequency" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
                            panelHeight:'200',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            data: [
                                {id: '1次/半小时',text: '1次/半小时'},
                                {id: '1次/1小时',text: '1次/1小时'},
                                {id: '1次/2小时',text: '1次/2小时'},
                                {id: '1次/3小时',text: '1次/3小时'},
                                {id: '1次/4小时',text: '1次/4小时'},
                                {id: '1次/6小时',text: '1次/6小时'},
                                {id: '1次/8小时',text: '1次/8小时'},
                                {id: '1次/12小时',text: '1次/12小时'},
                                {id: '1次/天',text: '1次/天'},
                                {id: '1次/周',text: '1次/周'},
                                {id: '2次/周',text: '2次/周'},
                                {id: '3次/周',text: '3次/周'},
                                {id: '1次/10天',text: '1次/10天'},
                                {id: '1次/15天',text: '1次/15天'},
                                {id: '1次/月',text: '1次/月'},
                                {id: '1次/2月',text: '1次/2月'},
                                {id: '1次/季',text: '1次/季'},
                                {id: '1次/半年',text: '1次/半年'},
                                {id: '1次/年',text: '1次/年'}
                            ]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务执行检查:</td>
                    <td class="text" colspan="3">
                        <input id="ExecutionCheck" name="ExecutionCheck" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮选择任务执行检查岗位/检查人!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelRoleOrUser('ExecutionCheck'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    ClearRoleOrUser('ExecutionCheck');
                                }
                            }]" />
                        <input type="hidden" id="ExecutionCheckRoleCode" name="ExecutionCheckRoleCode" />
                        <input type="hidden" id="ExecutionCheckUserCode" name="ExecutionCheckUserCode" />
                        <input type="hidden" id="ExecutionCheckRoleName" name="ExecutionCheckRoleName" />
                        <input type="hidden" id="ExecutionCheckUserName" name="ExecutionCheckUserName" />
                        <input type="hidden" id="ExecutionCheckType" name="ExecutionCheckType" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务完成汇报:</td>
                    <td class="text" colspan="3">
                        <input id="Report" name="Report" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮选择任务完成汇报岗位/检查人!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelRoleOrUser('Report'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    ClearRoleOrUser('Report');
                                }
                            }]" />
                        <input type="hidden" id="ReportRoleCode" name="ReportRoleCode" />
                        <input type="hidden" id="ReportUserCode" name="ReportUserCode" />
                        <input type="hidden" id="ReportRoleName" name="ReportRoleName" />
                        <input type="hidden" id="ReportUserName" name="ReportUserName" />
                        <input type="hidden" id="ReportType" name="ReportType" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务过期预警:</td>
                    <td class="text" colspan="3">
                        <input id="Overdue" name="Overdue" class="easyui-textbox colspan" data-options="
                            prompt: '请单击\'放大镜\'按钮选择任务过期预警岗位/检查人!',
                            editable: false,
                            tipPosition: 'bottom',
                            required: true,
                            multiline: false,
                            buttonText: '',
                            buttonIcon: 'icon-search',
                            onClickButton: function() { SelRoleOrUser('Overdue'); },
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    ClearRoleOrUser('Overdue');
                                }
                            }]" />
                        <input type="hidden" id="OverdueRoleCode" name="OverdueRoleCode" />
                        <input type="hidden" id="OverdueUserCode" name="OverdueUserCode" />
                        <input type="hidden" id="OverdueRoleName" name="OverdueRoleName" />
                        <input type="hidden" id="OverdueUserName" name="OverdueUserName" />
                        <input type="hidden" id="OverdueType" name="OverdueType" />
                    </td>
                </tr>
                <tr>
                    <td class="title">任务生成方式:</td>
                    <td class="text">
                        <input id="GenerateType" name="GenerateType" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
                            panelHeight:'200',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            value:'1',
                            data: [
                                {id: '1',text: '自动生成'},
                                {id: '2',text: '手动生成'}
                            ]" />
                    </td>
                    <td class="title">计划是否启用:</td>
                    <td class="text">
                        <input id="IsEnable" name="IsEnable" class="easyui-combobox" data-options="
                            editable:false,
                            tipPosition:'bottom',
                            required:true,
                            panelHeight:'200',
                            icons: [{
                                iconCls: 'icon-clear',
                                handler: function (e) {
                                    $(e.data.target).combobox('clear');
                                }
                            }],
                            valueField:'id',
                            textField:'text',
                            value:'1',
                            data: [
                                {id: '1',text: '是'},
                                {id: '0',text: '否'}
                            ]" />
                    </td>
                </tr>
                <tr>
                    <td class="title">备注:</td>
                    <td class="text" colspan="3">
                        <input type="text" id="Remark" name="Remark" class="easyui-textbox colspan" />
                    </td>
                </tr>
                <tr>
                    <td class="title">频次详情</td>
                    <td class="text" colspan="3">
                        <table class="time" style="width: 99%">
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
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();" style="display: none" id="btnSave">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-back',width:80" onclick="Close();">返回</a>
        </div>
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="Id" name="Id" />
        <input type="hidden" id="OldCheckTypeId" name="OldCheckTypeId" />
        <script type="text/javascript">
            //选择责任岗位或责任人
            function SelRoleOrUser(Name) {
                if ($("#" + Name + 'Type').val() == "Role") {
                    localStorage.setItem("SelRoleCode", $("#" + Name + 'RoleCode').val());
                    localStorage.setItem("SelRoleName", $("#" + Name + 'RoleName').val());
                    localStorage.setItem("SelUserCode", '');
                    localStorage.setItem("SelUserName", '');
                } else if ($("#" + Name + 'Type').val() == "User") {
                    localStorage.setItem("SelRoleCode", '');
                    localStorage.setItem("SelRoleName", '');
                    localStorage.setItem("SelUserCode", $("#" + Name + 'UserCode').val());
                    localStorage.setItem("SelUserName", $("#" + Name + 'UserName').val());
                } else {
                    localStorage.setItem("SelRoleCode", '');
                    localStorage.setItem("SelRoleName", '');
                    localStorage.setItem("SelUserCode", '');
                    localStorage.setItem("SelUserName", '');
                }
                var ExecuteRoleCode = '';
                if (Name == 'ExecutionCheck') {
                    ExecuteRoleCode = '&CheckTypeId=' + $('#CheckTypeId').combobox('getValue');
                }
                HDialog.Open('700', '500', '../Supervision/SelRoleOrUser.aspx?IsCheck=1&RoleOrUser=' + $("#" + Name + 'Type').val() + '&CommId=' + $("#CommId").textbox('getValue') + ExecuteRoleCode, "选择通用岗位或人员", false, function callback(_Data) {
                    localStorage.removeItem('SelRoleCode');
                    localStorage.removeItem('SelRoleName');
                    localStorage.removeItem('SelUserCode');
                    localStorage.removeItem('SelUserName');
                    if (_Data > '') {
                        $("#" + Name).textbox('setValue', _Data.split('|')[0]);
                        $("#" + Name).textbox('setText', _Data.split('|')[1]);
                        $("#" + Name + _Data.split('|')[2] + 'Code').val(_Data.split('|')[0]);
                        $("#" + Name + _Data.split('|')[2] + 'Name').val(_Data.split('|')[1]);
                        $("#" + Name + 'Type').val(_Data.split('|')[2]);
                        if (_Data.split('|')[2] == "Role") {
                            $("#" + Name + 'UserCode').val('');
                            $("#" + Name + 'UserName').val('');
                        } else {
                            $("#" + Name + 'RoleCode').val('');
                            $("#" + Name + 'RoleName').val('');
                        }
                    }
                });
            }

            function ClearRoleOrUser(Name) {
                $('#' + Name).textbox('clear');
                $('#' + Name + 'RoleCode').val(null);
                $('#' + Name + 'UserCode').val(null);
            }

            //加载检查类型
            function LoadCheckTypeId() {
                $('#CheckTypeId').combobox({
                    required: true,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CheckTypeId\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'TypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindCheckType_ByPlanCompilation';
                    },
                    onChange: function () {
                        $("#ExecutionCheck").textbox('setValue', "");
                        $("#ExecutionCheck").textbox('setText', "");
                        $("#ExecutionCheckUserCode").val('');
                        $("#ExecutionCheckUserName").val('');
                        $("#ExecutionCheckRoleCode").val('');
                        $("#ExecutionCheckRoleName").val('');
                        LoadCheckMethod();
                        LoadFrequency();
                    },
                    onLoadSuccess: function () {
                        Load();
                    }
                });
            }

            //加载检查类型  没有编辑权限  加载全部
            function LoadCheckTypeIdAll() {
                $('#CheckTypeId').combobox({
                    required: true,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CheckTypeId\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Id',
                    textField: 'TypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindCheckType';
                    },
                    onChange: function () {
                        LoadCheckMethod();
                        LoadFrequency();
                    },
                    onLoadSuccess: function () {
                        Load();
                    }
                });
            }

            //加载检查方式
            function LoadCheckMethod() {
                $('#CheckMethod').combobox({
                    required: true,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#CheckMethod\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'ScoreType',
                    textField: 'ScoreTypeName',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindScoreType_ByCheckType';
                        param.CheckTypeId = $('#CheckTypeId').combobox('getValue');
                    }
                });
            }

            //加载检查频次
            function LoadFrequency() {
                $('#Frequency').combobox({
                    required: true,
                    panelHeight: '150',
                    validType: ['comboBoxValid[\'#Frequency\']'],
                    icons: [{
                        iconCls: 'icon-clear',
                        handler: function (e) {
                            $(e.data.target).combobox('clear');
                        }
                    }],
                    url: '/HM/M_Main/HC/DataGetControl.aspx',
                    method: 'get',
                    valueField: 'Frequency',
                    textField: 'Frequency',
                    onBeforeLoad: function (param) {
                        param.Method = 'DataGet';
                        param.Class = 'CSSupervision';
                        param.Command = 'BindFrequency_ByCheckType';
                        param.CheckTypeId = $('#CheckTypeId').combobox('getValue');
                    },
                    onChange: function (newValue, oldValue) {
                        FrequencyChange(newValue);
                    }
                });
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
                switch ($('#Frequency').combobox('getValue')) {
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


            function FrequencyChange(value, varObjects) {
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

                switch (value) {
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
                if ($("#OpType").val() == 'edit' && varObjects > '') {
                    SetCheck(varObjects)
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
                    switch (varObjects[0].Frequency) {
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

            function Close() {
                window.parent.HDialog.Close();
            }

            function Save() {
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
                switch ($('#Frequency').combobox('getValue')) {
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
                var work = "&WorkTime=" + WorkTime + "&WorkWeek=" + WorkWeek + "&WorkMonth=" + WorkMonth + '&DidMonth=';
                if ($("#OpType").val() == "edit" && $("#OldTypeId").val() != $("#TypeId").val()) {
                    HDialog.Prompt('修改模板检查类型后将刷新标准信息', function () {
                        SavePlan(work);
                    });
                } else {
                    SavePlan(work);
                }
            }

            function SavePlan(work) {
                $.tool.DataPostChk('frmForm', 'CSSupervision', 'SavePlan', $('#frmForm').serialize() + work,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("保存成功");
                        Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Load() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CSSupervision', 'GetPlanInfo', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var obj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            $('#frmForm').form('load', obj[0]);
                            $("#OldCheckTypeId").val(obj[0].CheckTypeId);
                            $("#CommId").textbox('setText', obj[0].CommName);
                            setTimeout(FrequencyChange(obj[0].Frequency, obj), 1000);
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $("#CommId").textbox('setValue', GetQueryString('CommId'));
                    $("#CommId").textbox('setText', decodeURI(GetQueryString('CommName')));
                }
            }

            $(function () {
                $("#OpType").val(GetQueryString('OpType'));
                $("#Id").val(GetQueryString('Id'));
                if ($("#OpType").val() == "edit") {
                    $.tool.DataGet('CSSupervision', 'CheckPlanCanEdit', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "1") {
                                $("#btnSave").show();
                                LoadCheckTypeId();
                            } else {
                                LoadCheckTypeIdAll();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $("#btnSave").show();
                    LoadCheckTypeId();
                }
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
