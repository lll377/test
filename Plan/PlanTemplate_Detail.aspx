<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTemplate_Detail.aspx.cs" Inherits="M_Main.Plan.PlanTemplate_Detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划模板</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        #frmForm {
            font-size: 12px;
            font-family: 微软雅黑;
        }

        input, textarea {
            border: 1px solid #cccccc;
            font-size: 12px;
            font-family: 微软雅黑;
            height: 26px;
        }
        input,text{
            height:21px;
        }
        select{
            height:26px;
        }
    </style>
</head>
<body>
    <form id="frmForm" method="post">
        <table class="DialogTable" style="width: 100%; padding-top: 5px; line-height: 25px;">
            <tr>
                <td class="TdTitle">序号：</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" data-options="required:false" style="width: 80%;height:21px;" id="Sort" name="Sort" runat="server" />
                </td>
                <td class="TdTitle">计划编码：</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" style="width: 80%;height:21px;" type="text" id="PlanCoding" name="PlanCoding" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">是否重点计划：</td>
                <td class="TdContentSearch">
                    <select id="ImportantPlan" name="ImportantPlan" onchange="IsImportantPlan();"
                        style="width: 82%;border: 1px #cccccc solid;" class="easyui-validatebox" runat="server" data-options="required:false">
                        <option value="0">是</option>
                        <option value="1" selected="selected">否</option>
                    </select>
                </td>
                <td class="TdTitle" id="ImportantPlanTdTitle">重点计划：</td>
                <td class="TdContentSearch" id="ImportantPlanTdContent">
                    <input class="easyui-validatebox" style="width: 80%;" type="text" id="ImportantPlanTitlen" name="ImportantPlanTitlen" runat="server" onclick="ImportantPlanclick();" />
                    <input type="hidden" id="ImportantPlanTitlenId" name="ImportantPlanTitlenId" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">计划名称：</td>
                <td colspan="3" class="TdContent">
                    <textarea class="easyui-validatebox" data-options="required:false" runat="server" style="width: 92%;" id="PlanName" name="PlanName"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">计划年度：</td>
                <td class="TdContent">
                    <input class=" easyui-validatebox Wdate" id="PlanYear" data-options="required:false" style="width: 80%;height:21px;" onclick="WdatePicker({ dateFmt: 'yyyy' })" name="PlanYear" runat="server" type="text" /></td>
                <td class="TdTitle">计划月份：</td>
                <td class="TdContent">
                    <select id="PlanMonth" name="PlanMonth" runat="server" style="border: 1px #cccccc solid; width: 50%;"
                        data-options="panelHeight:'auto',editable:false,onSelect:PlanMonthChange,onUnselect:PlanMonthChange" class="easyui-combobox">
                        <option value="01">一月</option>
                        <option value="02">二月</option>
                        <option value="03">三月</option>
                        <option value="04">四月</option>
                        <option value="05">五月</option>
                        <option value="06">六月</option>
                        <option value="07">七月</option>
                        <option value="08">八月</option>
                        <option value="09">九月</option>
                        <option value="10">十月</option>
                        <option value="11">十一月</option>
                        <option value="12">十二月</option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">计划开始时间：</td>
                <td class="TdContent">
                    <input class=" easyui-validatebox Wdate" id="PlanStartTime" data-options="required:false,editable:false" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', onpicked: checkfinish })" onkeypress="CheckDate();" maxlength="50" name="PlanStartTime" runat="server" type="text" style="height:21px;" /></td>
                <td class="TdTitle">计划结束时间：</td>
                <td class="TdContent">
                    <input class=" easyui-validatebox Wdate" id="PlanEndTime" data-options="required:false,editable:false,onSelect:changeYearMonth,onUnselect:changeYearMonth" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', onpicked: checkfinish })" onkeypress="CheckDate();" onchange="changeYearMonth();" maxlength="50" name="PlanEndTime" runat="server" type="text" style="height:21px;" /></td>
            </tr>
            <tr>
                <td class="TdTitle">计划类型：</td>
                <td class="TdContentSearch">
                    <input id="PlanTypeName" name="PlanTypeName" class="easyui-validatebox" data-options="required:false" style="width: 80%;" type="text" runat="server" readonly="readonly" />
                    <input type="hidden" id="PlanType" name="PlanType" /></td>
                <td class="TdTitle">是否关联预算：</td>
                <td class="TdContent">
                    <select id="IsConnectBudget" name="IsConnectBudget" runat="server" style="width: 82%; border: 1px #cccccc solid;" class="easyui-validatebox " onchange="IsConnectBudgetChange();">
                        <option value="0" selected="selected">否</option>
                        <option value="1">是</option>
                    </select></td>
            </tr>
            <tr>
                <td class="TdTitle">关联预算方式：</td>
                <td class="TdContent">
                    <select id="ConnectBudgetWay" name="ConnectBudgetWay" runat="server" style="width: 82%; border: 1px #cccccc solid;" class="easyui-validatebox " disabled="disabled">
                        <option value=""></option>
                        <option value="Adjustment">生成预算调整</option>
                        <option value="Plan">生成预算计划</option>
                    </select></td>
                <td class="TdTitle">关联预算科目：</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" style="width: 80%;" type="text" id="ConnectBudgetProjectName" name="ConnectBudgetProjectName" runat="server" readonly="readonly" />
                    <input type="hidden" id="ConnectBudgetProject" name="ConnectBudgetProject" value="" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">税率(%)：</td>
                <td class="TdContentSearch">
                    <input type="text" id="Rate" name="Rate" class="easyui-validatebox" data-options="required:false" runat="server" style="width: 80%;" onkeyup="value=numTest(value)?value:''" onafterpaste="value=numTest(value)?value:''" />
                </td>
                <td class="TdTitle">费用主管部门：</td>
                <td class="TdContentSearch">
                    <input id="PayDepName" name="PayDepName" type="text" class="easyui-validatebox" onclick="SelPayDep();" readonly="readonly" style="border: 1px solid #cccccc; width: 80%;" />
                    <input type="hidden" name="PayDepCode" id="PayDepCode" value="" /></td>
            </tr>
            <tr>
                <td class="TdTitle">计划内容：</td>
                <td colspan="3" class="TdContent">
                    <textarea class="easyui-validatebox" runat="server" data-options="required:false" style="width: 92%; height: 26px;" id="PlanContent" name="PlanContent"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">计划说明：</td>
                <td colspan="3" class="TdContent">
                    <textarea style="width: 92%; height: 30px;" runat="server" id="PlanExplain" name="PlanExplain"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">计划目标：</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" data-options="required:false" style="width: 80%;" id="Target" name="Target" runat="server" />
                </td>
                <td class="TdTitle">计划费用(元)：</td>
                <td class="TdContentSearch">
                    <input type="text" id="PlanCost" name="PlanCost" runat="server" style="width: 80%;"
                        onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" placeholder="只能输入数字" onchange="planchange(1);" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">节点分解：</td>
                <td colspan="3" class="TdContent">
                    <textarea style="width: 92%; height: 30px;" runat="server" id="PlanNode" name="PlanNode"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">绩效分值：</td>
                <td class="TdContentSearch">
                    <input type="text" id="Point" name="Point" runat="server" style="width: 80%;"
                        onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" placeholder="只能输入数字" onchange="planchange(2);" />
                </td>
                <td class="TdTitle">奖罚金额(元)：</td>
                <td class="TdContentSearch">
                    <input type="text" id="GetCost" name="GetCost" runat="server" style="width: 80%;"
                        onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" placeholder="只能输入数字" onchange="planchange(3);" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">计划来源：</td>
                <td class="TdContentSearch">
                    <select id="PlanSource" name="PlanSource" isdctype="true" dctype="计划来源" onchange="PlanSourceChange()"
                        style="width: 80%; border: 1px #cccccc solid;" class="easyui-validatebox" runat="server" data-options="required:false">
                    </select>
                    <input type="hidden" id="PlanSourceID" name="PlanSourceID" runat="server" />
                </td>
                <td class="TdTitle">协助人：</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" id="AssistMan" style="width: 80%;" name="AssistMan" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">模板类型：</td>
                <td class="TdContentSearch">
                    <select id="TemplateType" name="TemplateType" runat="server" isdctype="true" dctype="模板类型" style="width: 80%; border: 1px #cccccc solid;" class="easyui-validatebox" data-options="required:false">
                    </select>
                </td>
                <td class="TdTitle"></td>
                <td class="TdContentSearch"></td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 10px;" colspan="4" class="DialogTdSubmit">
                    <input type="button" class="button" value="保 存" id="BtnSave" onclick="Save()" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关 闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="TemplateId" name="TemplateId" runat="server" />
        <input type="hidden" id="PlanCostNum" name="PlanCostNum" runat="server" />
        <input type="hidden" id="PointNum" name="PointNum" runat="server" />
        <input type="hidden" id="GetCostNum" name="GetCostNum" runat="server" />
        <script type="text/javascript">
            function numTest(num) {
                var reg = /^(\d?\d(\.\d*)?|100)$/;
                if (!num.match(reg)) {
                    return false;
                } else {
                    return true;
                }
            }

            function changeYearMonth() {
                if ($("#PlanEndTime").val() != null && $("#PlanEndTime").val() != '') {
                    var date = new Date($("#PlanEndTime").val());
                    $("#PlanYear").val(date.getFullYear());
                    var month = date.getMonth() + 1;
                    if (month < 10) { month = '0' + month; }
                    $("#PlanMonth").combobox('setValue', month);
                }
            }
            function PlanMonthChange() {
                if ($("#PlanYear").val() == "") {
                    return;
                }
                var PlanMonthS = $("#PlanMonth").combobox("getValues");
                var MaxValue = 1;
                var MinValue = 12;
                for (var i = 0; i < PlanMonthS.length; i++) {
                    if (parseInt(PlanMonthS[i]) > MaxValue) {
                        MaxValue = parseInt(PlanMonthS[i]);
                    }
                    if (parseInt(PlanMonthS[i]) < MinValue) {
                        MinValue = parseInt(PlanMonthS[i]);
                    }
                }
                if (parseInt(MinValue) < 10) { MinValue = '0' + MinValue }
                if (parseInt(MaxValue) < 10) { MaxValue = '0' + MaxValue }
                //拼装日期
                var PlanStartTime = $("#PlanYear").val() + '-' + MinValue + '-01';
                var PlanEndTime = $("#PlanYear").val() + '-' + MaxValue + '-01';
                var date = new Date(PlanEndTime);

                date.setMonth(date.getMonth() + 1);
                date.setDate(date.getDate() - 1);
                var month = date.getMonth() + 1;
                var day = date.getDate();
                if (parseInt(day) < 10) { day = '0' + day }
                if (parseInt(month) < 10) { month = '0' + month }
                PlanEndTime = date.getFullYear() + '-' + month + '-' + day;
                $("#PlanStartTime").val(PlanStartTime);
                $("#PlanEndTime").val(PlanEndTime);
            }
            //选择费用主管部门
            function SelPayDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择费用主管部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#PayDepCode").val(arrRet[0]);
                        $("#PayDepName").val(arrRet[1]);
                    }
                });
            }
            $(document).ready(function () {
                LoadDictionary();
                $("#ConnectBudgetProjectName").attr("disabled", "disabled");
                $("#ConnectBudgetWay").val('');
                $("#PlanMonth").combobox('setValue', '');
                LoadData(); // 加载页面数据
                IsImportantPlan();
                IsConnectBudgetChange();
            });

            function checkfinish() {
                if ($("#PlanStartTime").val().substring(0, 4) != $("#PlanYear").val() && $("#PlanStartTime").val() > '') {
                    HDialog.Info("计划开始日期不在计划年度之内");
                    $("#PlanStartTime").val('');
                }
                if ($("#PlanEndTime").val().substring(0, 4) != $("#PlanYear").val() && $("#PlanEndTime").val() > '') {
                    HDialog.Info("计划结束日期不在计划年度之内");
                    $("#PlanEndTime").val('');
                }
            }

            //加载字典设置
            function LoadDictionary() {
                $("select[isdctype='true']").each(function (i) {
                    var nId = $(this).attr("id");
                    $.tool.DataPostAsync('CsPlan', 'BindDictionary', 'DcTypeName=' + $(this).attr("dctype"),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            var option = "<option value=''></option>";
                            $("#" + nId).append(option);
                            for (var i = 0; i < varObjects.length; i++) {
                                var option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                                $("#" + nId).append(option);
                            }
                            $("#frmForm").form('validate');
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                });
            }
            //选择计划类型
            $('#PlanTypeName').click(function () {
                HDialog.Open('500', '500', '../Plan/SelPlanType.aspx', '选择计划类型', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#PlanType").val(arrRet[0]);
                        $("#PlanTypeName").val(arrRet[1]);
                    }
                });
            });

            //选择预算科目
            $('#ConnectBudgetProjectName').click(function () {
                HDialog.Open('500', '500', '../BudgetNew/BudgetChangeProjectBottom.aspx?OnlyChildren=true', '选择预算科目', true, function callback(_Data) {
                    if (_Data != '') {
                        $("#Rate").val('');
                        var obj = JSON.parse(_Data);
                        $("#ConnectBudgetProjectName").val(obj[obj.length - 1].text);
                        $("#ConnectBudgetProject").val(obj[obj.length - 1].id);
                        $("#Rate").val(obj[obj.length - 1].attributes['Rate']);
                    }
                });
            });

            function onlyNumber(obj) {
                //得到第一个字符是否为负号
                var t = obj.value.charAt(0);
                //先把非数字的都替换掉，除了数字和.
                obj.value = obj.value.replace(/[^\d\.]/g, '');
                //必须保证第一个为数字而不是.
                obj.value = obj.value.replace(/^\./g, '');
                //保证只有出现一个.而没有多个.
                obj.value = obj.value.replace(/\.{2,}/g, '.');
                //保证.只出现一次，而不能出现两次以上
                obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
                //如果第一位是负号，则允许添加
                if (t == '-') {
                    obj.value = '-' + obj.value;
                }
            }

            //加载数据
            function LoadData() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CsPlan', 'SelTemplate', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();
                                $("#frmForm").form('validate');
                                $("#PlanMonth").combobox('setValue', JSON.parse(_Data)[0].PlanMonth);
                                var ImportantPlan = $("#ImportantPlan").val();
                                if (ImportantPlan == '0') {
                                    $("#ImportantPlanTdTitle").hide();
                                    $("#ImportantPlanTdContent").hide();
                                    $('#ImportantPlanTitlen').val("");
                                    $('#ImportantPlanTitlenId').val("");
                                } else {
                                    $("#ImportantPlanTdTitle").show();
                                    $("#ImportantPlanTdContent").show();
                                }
                                IsConnectBudgetChange();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            $('#BtnReturn').click(function () {
                HDialog.Close();
            });

            function PlanSourceChange() {
                $('#PlanSourceID').val($('#PlanSource option:selected').val());
            }

            //*****保存
            function Save() {
                if ($("#frmForm").form('validate')) {
                    $.tool.DataPostChk('frmFrom', 'CsPlan', 'SaveTemplate', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "1") {
                                HDialog.Info("保存成功");
                                HDialog.Close();
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            function IsImportantPlan(type) {
                var ImportantPlan = $("#ImportantPlan").val();
                if (ImportantPlan == '0') {
                    $("#ImportantPlanTdTitle").hide();
                    $("#ImportantPlanTdContent").hide();
                    $('#ImportantPlanTitlen').val("");
                    $('#ImportantPlanTitlenId').val("");
                    $("#IsConnectBudget").val("1");
                    $('#ConnectBudgetProjectName').validatebox({ required: false });
                } else {
                    $("#IsConnectBudget").val("0");
                    $('#ConnectBudgetProjectName').validatebox({ required: true });
                    $("#ImportantPlanTdTitle").show();
                    $("#ImportantPlanTdContent").show();
                }
                IsConnectBudgetChange();
            }

            function IsConnectBudgetChange() {
                var IsConnectBudget = $("#IsConnectBudget").val();
                if (IsConnectBudget == '0') {
                    //判断 若计划费用大于0，则是否关联预算自动默认为是，不能改为否，反之则允许选择。
                    if ($('#PlanCost').val() != "" && parseFloat($('#PlanCost').val()) > 0) {
                        $('#IsConnectBudget').val("1");
                        IsConnectBudgetChange();
                        HDialog.Info("计划费用大于0，不允许修改是否关联预算，默认为必须关联预算");
                        return;
                    }
                    $('#ConnectBudgetProjectName').validatebox({ required: false });
                    $('#ConnectBudgetProject').val("");
                    $("#ConnectBudgetWay").val('');
                    $('#ConnectBudgetProjectName').val("");
                    $('#PayDepName').val("");
                    $('#PayDepCode').val("");
                    $('#PayDepName').attr("disabled", "disabled");
                    $('#Rate').validatebox({ required: false });
                    $("#ConnectBudgetProjectName").attr("disabled", "disabled");
                } else {
                    $("#ConnectBudgetWay").val('Plan');
                    $('#ConnectBudgetProjectName').removeAttr("disabled");
                    $('#PayDepName').removeAttr("disabled");
                    $('#Rate').validatebox({ required: true });
                    $('#ConnectBudgetProjectName').validatebox({ required: true });
                }

                $("#ConnectBudgetWay").val('Plan');
            }

            function ImportantPlanclick() {
                HDialog.Open(1200, 500, '../Plan/PlanImplementPlan.aspx', '重点计划', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        var obj = _Data.split(',');
                        $("#ImportantPlanTitlen").val(obj[0]);
                        $("#ImportantPlanTitlenId").val(obj[1]);
                        $("#PlanCostNum").val(obj[2]);
                        $("#PointNum").val(obj[3]);
                        $("#GetCostNum").val(obj[4]);
                    }
                });
            }

            function planchange(flag) {
                if (flag == "1") {
                    //若计划费用大于0，则是否关联预算自动默认为是，不能改为否，反之则允许选择。
                    if ($('#PlanCost').val() != "" && parseFloat($('#PlanCost').val()) > 0) {
                        $('#IsConnectBudget').val("1");
                        IsConnectBudgetChange();
                    }
                }
            }

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
