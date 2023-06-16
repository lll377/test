<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIssueDetailEdit.aspx.cs" Inherits="M_Main.Plan.PlanIssueDetailEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划下发-新增计划</title>
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
            height: 24px;
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
                    <input type="text" class="easyui-validatebox" data-options="required:true" style="width: 80%;" id="Sort" name="Sort" runat="server" />
                </td>
                <td class="TdTitle">计划编码：</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" style="width: 80%;" type="text" id="PlanCoding" name="PlanCoding" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="TdTitle">是否重点计划：</td>
                <td class="TdContentSearch">
                    <select id="ImportantPlan" name="ImportantPlan" onchange="IsImportantPlan();"
                        style="width: 82%; border: 1px #cccccc solid;" class="easyui-validatebox" runat="server" data-options="required:true">
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
                    <textarea class="easyui-validatebox" data-options="required:true" runat="server" style="width: 92%;" id="PlanName" name="PlanName"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">计划开始时间：</td>
                <td class="TdContent">
                    <input class=" easyui-validatebox Wdate" id="PlanStartTime" data-options="required:true,editable:false" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', onpicked: checkfinish })" onkeypress="CheckDate();" maxlength="50" name="PlanStartTime" runat="server" type="text" style="height:21px;"/></td>
                <td class="TdTitle">计划结束时间：</td>
                <td class="TdContent">
                    <input class=" easyui-validatebox Wdate" id="PlanEndTime" data-options="required:true,editable:false,onSelect:changeYearMonth,onUnselect:changeYearMonth" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', onpicked: checkfinish })" onkeypress="CheckDate();" onchange="changeYearMonth();" maxlength="50" name="PlanEndTime" runat="server" type="text" style="height:21px;" /></td>
            </tr>
            <tr>
                <td class="TdTitle">计划年度：</td>
                <td class="TdContent">
                    <input class=" easyui-validatebox Wdate" id="PlanYear" data-options="required:true" style="width: 80%;height:21px;" onclick="WdatePicker({ dateFmt: 'yyyy' })" readonly="readonly" name="PlanYear" runat="server" type="text" disabled="disabled" /></td>
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
                <td class="TdTitle">计划类型：</td>
                <td class="TdContentSearch">
                    <input class="easyui-validatebox" data-options="required:true" style="width: 80%;" type="text" id="PlanType" name="PlanType" runat="server" readonly="readonly" />
                    <input type="hidden" id="PlanTypeID" name="PlanTypeID" runat="server" /></td>
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
                    <textarea class="easyui-validatebox" runat="server" data-options="required:true" style="width: 92%; height: 30px;" id="PlanContent" name="PlanContent"></textarea>
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
                    <input type="text" class="easyui-validatebox" data-options="required:true" style="width: 80%;" id="Target" name="Target" runat="server" />
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
            <%--  <tr>
                <td class="TdTitle">考评性质：</td>
                <td class="TdContentSearch">
                    <select id="CheckType" name="CheckType" isdctype="true" dctype="考评性质" onchange="CheckTypeChange()"
                        style="width: 80%; border: 1px #cccccc solid;" class="easyui-validatebox" runat="server">
                    </select>
                    <input type="hidden" id="CheckTypeID" name="CheckTypeID" runat="server" />
                </td>
                <td class="TdTitle">考评方法：</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" id="CheckWay" style="width: 80%;" name="CheckWay" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">考评依据：</td>
                <td colspan="3" class="TdContent">
                    <textarea style="width: 92%; height: 30px;" runat="server" id="CheckBasis" name="CheckBasis"></textarea>
                </td>
            </tr>--%>
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
                        style="width: 80%; border: 1px #cccccc solid;" class="easyui-validatebox" runat="server" data-options="required:true">
                    </select>
                    <input type="hidden" id="PlanSourceID" name="PlanSourceID" runat="server" />
                </td>
                <td class="TdTitle">协助人：</td>
                <td class="TdContentSearch">
                    <input type="text" class="easyui-validatebox" id="AssistMan" style="width: 80%;" name="AssistMan" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">提醒时间：</td>
                <td colspan="3" class="TdContent">
                    <input id="chkTime1" name="chkTime1" type="checkbox" value="1" style="width: 15px;" /><span>提前一月</span>
                    <input id="chkTime2" name="chkTime2" type="checkbox" value="2" style="width: 15px;" /><span>提前半月</span>
                    <input id="chkTime3" name="chkTime3" type="checkbox" value="3" style="width: 15px;" checked="checked" /><span>提前一周</span>
                    <input id="chkTime4" name="chkTime4" type="checkbox" value="4" style="width: 15px;" checked="checked" /><span>提前三天</span>
                    <input id="chkTime5" name="chkTime5" type="checkbox" value="5" style="width: 15px;" checked="checked" /><span>提前一天</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">附件：</td>
                <td class="TdContentSearch" colspan="3">
                    <iframe id="UploadFrame" frameborder="0" width="75%" style="margin-top: 10px; height: 30px; float: left;" scrolling="no"></iframe>
                    <%--<input id="btnFile" style="width: 320px; height: 25px; border: none;" tabindex="1" type="file" size="1"
                        name="btnFile" runat="server" />
                    <input type="button" name="fileList" style="width: 50px; height: 25px;" value="上传" id="fileList" runat="server" />--%>
                    <input type="button" name="fileList1" style="width: 70px; height: 25px; display: block; float: left; margin-top: 10px;" value="查看列表" id="fileList1" runat="server" onclick="OnFileList();" /></td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 10px;" colspan="4" class="DialogTdSubmit">
                    <input type="button" class="button" value="保 存" id="BtnSave" onclick="Save()" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="button" class="button" value="保存并新增" id="BtnSaveAdd" onclick="SaveAdd()" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关 闭" id="BtnReturn" />
                </td>
            </tr>
        </table>

        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="DetailId" name="DetailId" runat="server" />
        <input type="hidden" id="PlanCostNum" name="PlanCostNum" runat="server" />
        <input type="hidden" id="PointNum" name="PointNum" runat="server" />
        <input type="hidden" id="GetCostNum" name="GetCostNum" runat="server" />
        <input type="hidden" id="Flag" name="Flag" runat="server" />
        <input type="hidden" id="IsAdjust" value="0" name="IsAdjust" runat="server" />
        <input type="hidden" id="IsSingle" value="true" name="IsSingle" runat="server" />
        <input type="hidden" id="PlanCycle" value="" name="PlanCycle" runat="server" />

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
                if ($("#OpType").val() != 'edit') {// && $("#PlanEndTime").val() == ''
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
                    if (PlanMonthS.length == 1 && $("#IsSingle").val() == 'false') {
                        $("#PlanStartTime").val('');
                        $("#PlanEndTime").val('');
                    }
                }
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
                //计划年度默认当年
                $("#PlanYear").val(GetQueryString("PlanYear"));
                LoadDictionary();

                if ($("#IsAdjust").val() == '0') {//1计划调整 0计划下发
                    $("#ConnectBudgetProjectName").attr("disabled", "disabled");
                    $("#ConnectBudgetWay").val('');
                } else {
                    $("#ConnectBudgetWay").val('Adjustment');
                }
                if ($("#IsSingle").val() == 'false')  //批量新增  月份可多选
                {
                    $("#PlanMonth").combobox({ multiple: "true" });
                }
                $("#PlanMonth").combobox('setValue', '');

                IsImportantPlan();
                LoadData(); // 加载页面数据
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
            $('#PlanType').click(function () {
                HDialog.Open('500', '500', '../Plan/SelPlanType.aspx', '选择计划类型', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#PlanTypeID").val(arrRet[0]);
                        $("#PlanType").val(arrRet[1]);
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
                //if (/^\d+\.?\d{0,2}$/.test(obj.value)) {
                //    obj.value = obj.value;
                //} else {
                //    obj.value = obj.value.substring(0, obj.value.length - 1);
                //}
            }

            //加载数据
            function LoadData() {
                //清空缓存
                Cache.SetData("ReturnJsonObjectAll", "");
                $('#UploadFrame').attr("src", "../Plan/PlanUploadFile.aspx?DetailId=" + $('#DetailId').val() + "&SortName=计划下发");
                if ($("#OpType").val() == 'edit') {
                    //initSelect();
                    //加载直接传过来的对象
                    var Rows = Cache.GetData("PlanPlaningDetailListRowData");
                    if (Rows != undefined && Rows != "") {
                        $.JQForm._Data = Rows;
                        $.JQForm.FillForm();
                        //加载 选择控件值
                        Rows = eval("(" + Rows.replace(/\\/g, "/") + ")");
                        $('#Rate').val(Rows.Rate);
                        $('#PayDepName').val(Rows.PayDepName); //费用主管部门
                        $('#PayDepCode').val(Rows.PayDepCode);
                        $('#PlanTypeID').val(Rows.PlanType);
                        $('#PlanType').val(Rows.PlanTypeName);
                        $('#PlanSource').val(Rows.PlanSource);
                        $('#PlanSourceID').val(Rows.PlanSource);
                        $('#PlanMonth').combobox("setValue", Rows.PlanMonth);
                        $('#PlanStartTime').val(formatDate(Rows.PlanStartTime, "yyyy-MM-dd"));
                        $('#PlanEndTime').val(formatDate(Rows.PlanEndTime, "yyyy-MM-dd"));
                        //判断是否是重点计划
                        if (Rows.ImportantPlan == "0") {
                            $("#ImportantPlanTdTitle").hide();
                            $("#ImportantPlanTdContent").hide();
                            $('#ImportantPlanTitlen').val("");
                            $('#ImportantPlanTitlenId').val("");
                        }
                        $('#PlanCoding').val(Rows.PlanCoding);
                        //判断是否关联预算
                        if (Rows.ImportantPlan == "1") {
                            $('#ConnectBudgetProjectName').removeAttr("disabled");
                            $('#PayDepName').removeAttr("disabled");
                            $('#Rate').validatebox({ required: true });
                        }
                        for (var j = 1; j <= 5; j++) {
                            if (Rows.RemindDate.indexOf(j)>=0)
                                $("#chkTime" + j).attr('checked', 'checked');
                            else
                                $("#chkTime" + j).removeAttr('checked');
                        }
                    }
                    //清除缓存
                    Cache.SetData("PlanPlaningDetailListRowData", "");
                }
                if ($("#Flag").val() == '1') {
                    $("#frmForm input,select,textarea").attr("disabled", "disabled");
                    //$('#UploadFrame').attr("src", "");
                    $('#Point').removeAttr("disabled");
                    $('#GetCost').removeAttr("disabled");
                    //$('#CheckWay').removeAttr("disabled");
                    //$('#CheckBasis').removeAttr("disabled");
                    //$('#CheckType').removeAttr("disabled");
                    $('#fileList1').removeAttr("disabled");
                    $('#BtnReturn').removeAttr("disabled");
                    $('#BtnSave').removeAttr("disabled");

                } else if ($("#Flag").val() == '2') {
                    $("#frmForm input,select,textarea").attr("disabled", "disabled");
                    $('#UploadFrame').attr("src", "");

                    $('#fileList1').removeAttr("disabled");
                    $('#BtnReturn').removeAttr("disabled");
                    $('#BtnSave').css("display", "none");
                }
                if ($("#PlanCycle").val() == '月度计划') //10， 计划下发时若计划类型选择的年，新增计划时可以选择月份，若选择的是月，则只能默认计划单的月份，不能修改
                {
                    // alert($("#PlanCycle").val());//data-options="panelHeight:'auto',editable:false,onSelect:PlanMonthChange,onUnselect:PlanMonthChange"
                    $("#PlanMonth").combobox("disable");
                }

            }

            function OnFileList() {
                HDialog.Open(600, 450, '../Plan/PlanDetailFiles.aspx?DetailId=' + $("#DetailId").val(), '查看计划附件', true, function callback(_Data) {
                });
            }

            $('#BtnReturn').click(function () {
                HDialog.Close();
            });

            //获取选中的index
            function CheckTypeChange() {
                //$('#CheckTypeID').val($('#CheckType option:selected').val());

                //var CheckTypeOptions = document.getElementById("CheckType").options;

                //for (var i = 0; i < CheckTypeOptions.length; i++) {
                //    if (CheckTypeOptions[i].Id == $('#CheckType option:selected').val()) {
                //        $('#CheckTypeID').val(i);
                //        break;
                //    }
                //}
            }

            function PlanSourceChange() {
                $('#PlanSourceID').val($('#PlanSource option:selected').val());
            }
            //保存的方法 直接返回json数据  不保存数据库
            function Save() {
                if ($("#frmForm").form('validate')) {
                    SaveAdd();
                    HDialog.ReturnIsJson = true;
                    HDialog.Close("true");
                }
            }
            var ReturnJsonObjectAll = [];
            //*****保存并新增
            function SaveAdd() {
                if ($("#frmForm").form('validate')) {
                    var PlanMonthS = $("#PlanMonth").combobox("getValues");
                    for (var i = 0; i < PlanMonthS.length; i++) {
                        var DetailIDTemp = "";
                        var PlanStartTime = "";
                        var PlanEndTime = "";
                        var PlanContent = "";
                        var Sort = ""
                        if ($("#OpType").val() == 'edit') {
                            DetailIDTemp = $("#DetailId").val();
                            PlanEndTime = $("#PlanEndTime").val();
                            PlanStartTime = $("#PlanStartTime").val();
                            Sort = $("#Sort").val();
                            PlanContent = $("#PlanContent").val();
                        } else {
                            DetailIDTemp = guid();
                            var PlanEndTime = $("#PlanYear").val() + '-' + PlanMonthS[i] + '-01';
                            var date = new Date(PlanEndTime);
                            date.setMonth(date.getMonth() + 1);
                            date.setDate(date.getDate() - 1);
                            var month = date.getMonth() + 1;
                            var day = date.getDate();
                            if (parseInt(day) < 10) { day = '0' + day }
                            if (parseInt(month) < 10) { month = '0' + month }
                            PlanStartTime = PlanEndTime;
                            PlanEndTime = date.getFullYear() + '-' + month + '-' + day;;
                            Sort = $("#Sort").val();// + '-' + PlanMonthS[i];
                            PlanContent = $("#PlanContent").val();// + '-' + PlanMonthS[i];
                        }
                        var RemindDate = '';
                        for (var j = 1; j <= 5; j++) {
                            if ($("#chkTime" + j)[0].checked)
                                RemindDate += ',' + j;
                        }
                        if (RemindDate.length > 0) {
                            RemindDate = RemindDate.substr(1, RemindDate.length);
                        }
                        var ReturnJsonObj = {
                            DetailId: DetailIDTemp,
                            Sort: Sort,
                            PlanType: $("#PlanTypeID").val(),
                            PlanTypeName: $("#PlanType").val(),
                            PlanName: $("#PlanName").val(),
                            PlanStartTime: PlanStartTime,
                            PlanEndTime: PlanEndTime,
                            PlanContent: replaceAll(PlanContent, "\n", "\r\n"),
                            PlanExplain: replaceAll($("#PlanExplain").val(), "\n", "\r\n"),
                            Target: $("#Target").val(),
                            PlanCost: $("#PlanCost").val(),
                            PlanNode: replaceAll($("#PlanNode").val(), "\n", "\r\n"),
                            //CheckType: $('#CheckType option:selected').text(),
                            //CheckWay: $("#CheckWay").val(),
                            //CheckBasis: replaceAll($("#CheckBasis").val(), "\n", "\r\n"),
                            Point: $("#Point").val(),
                            GetCost: $('#GetCost').val(),
                            PlanSource: $("#PlanSourceID").val(),//计划来源ID
                            //PlanSourceName: $("#PlanSource").val(),//计划来源名称
                            AssistMan: $("#AssistMan").val(),//协助人
                            PlanRemark: '',
                            ImportantPlan: $("#ImportantPlan").val(),
                            ImportantPlanTitlen: $("#ImportantPlanTitlen").val(),
                            ImportantPlanTitlenId: $("#ImportantPlanTitlenId").val(),
                            PlanCoding: $('#PlanCoding').val(),
                            PlanYear: $('#PlanYear').val(),
                            PlanMonth: PlanMonthS[i],//$('#PlanMonth').val(),
                            IsConnectBudget: $('#IsConnectBudget').val(),
                            ConnectBudgetWay: $('#ConnectBudgetWay').val(),
                            ConnectBudgetProject: $('#ConnectBudgetProject').val(),
                            ConnectBudgetProjectName: $('#ConnectBudgetProjectName').val(),
                            ThisConnectBudgetProjectName: $('#ConnectBudgetProjectName').val(),
                            RelationPlan: $("#ImportantPlanTitlenId").val() > '' ? '0/1' : '0/0',
                            PayDepName: $('#PayDepName').val(),  //费用主管部门
                            PayDepCode: $('#PayDepCode').val(),
                            Rate: $('#Rate').val(),
                            RemindDate: RemindDate
                        };
                        ReturnJsonObjectAll.push(ReturnJsonObj);
                    }
                    Cache.SetData("ReturnJsonObjectAll", JSON.stringify(ReturnJsonObjectAll));
                    var objIframe = $("iframe", window.parent.document);
                    for (var i = 0; i < objIframe.length; i++) {
                        if (typeof objIframe[i].contentWindow.BindData == 'function') {
                            objIframe[i].contentWindow.BindData();
                        }
                    }

                    //清空页面
                    ClearAll();
                }
            }
            //清空控件
            function ClearAll() {
                var PlanYear = $('#PlanYear').val();
                // var PlanMonth = $('#PlanMonth').val();
                $("#frmForm").form('clear');
                //生成guid
                $("#DetailId").val(guid());
                //重新设置附件上传控件
                $('#UploadFrame').attr("src", "../Plan/PlanUploadFile.aspx?DetailId=" + $('#DetailId').val() + "&SortName=计划下发");
                $('#Sort').val("");
                $('#PlanType').val("");
                $('#PlanTypeID').val("");
                $('#PlanName').val("");
                $('#PlanStartTime').val("");
                $('#PlanEndTime').val("");
                $('#PlanContent').val("");
                $('#PlanExplain').val("");
                $('#Target').val("");
                $('#PlanCost').val("");
                $('#PlanNode').val("");
                //$('#CheckType').val("");
                //$('#CheckTypeID').val("");
                //$('#CheckWay').val("");
                //$('#CheckBasis').val("");
                $('#Point').val("");
                $('#GetCost').val("");
                $('#PlanSource').val("");
                $('#PlanSourceID').val("");
                $('#AssistMan').val("");
                //$('#PlanRemark').val("");
                $('#ImportantPlan').val("1");
                $('#ImportantPlanTitlen').val("");
                $('#ImportantPlanTitlenId').val("");
                $('#PlanCoding').val("");
                $('#PlanYear').val(PlanYear);
                //$('#PlanMonth').val(PlanMonth);
                $('#IsConnectBudget').val("");
                $('#ConnectBudgetWay').val("");
                $('#ConnectBudgetProject').val("");
                $('#ConnectBudgetProjectName').val("");
                $('#PayDepName').val("");
                $('#PayDepCode').val("");
                $('#Rate').val("");
            }

            //生成guid
            function S4() {
                return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
            }

            function guid() {
                return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
            }

            function replaceAll(str, strChange, strValue) {
                if (!str && typeof (str) != "undefined" && str != 0) {
                    // str = str.replace(strChange, strValue);
                    str = str.replace(new RegExp(strChange.replace(/([.*+?\^=!:${}()|\[\]\/\\])/g, '\\$1'), 'g'), strValue);
                }
                return str;

            }

            function IsImportantPlan() {
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

                if ($("#IsAdjust").val() == '1') { $("#ConnectBudgetWay").val('Adjustment'); } else { $("#ConnectBudgetWay").val('Plan'); }
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

                <%--if ($("#ImportantPlan").val() == "1") {
                    //if ($("#ImportantPlanTitle").val() == "") {
                    //    HDialog.Info("请选择重点计划。");
                    //    $("#PlanCost").val("");
                    //    $("#Point").val("");
                    //    $("#GetCost").val("");
                    //    return;
                    //}
                    var PlanCost = $("#PlanCost").val();
                    var Point = $("#Point").val();
                    var GetCost = $("#GetCost").val();
                    var PlanCostNum = $("#PlanCostNum").val();
                    var PointNum = $("#PointNum").val();
                    var GetCostNum = $("#GetCostNum").val();
                    var SumPlanCost;
                    var SumPoint;
                    var SumGetCost;

                    $.tool.DataPostAsync('CsPlan', 'GetImplementPlanNum', 'ImportantPlanTitlenId=' + $("#ImportantPlanTitlenId").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (PlanCost != "" && PlanCost != null) {
                                SumPlanCost = parseFloat(PlanCost) + parseFloat(varObjects[0].SumPlanCost);
                            }
                            if (Point != "" && Point != null) {

                                SumPoint = parseFloat(Point) + parseFloat(varObjects[0].SumPoint);
                            }

                            if (GetCost != "" && GetCost != null) {
                                SumGetCost = parseFloat(GetCost) + parseFloat(varObjects[0].SumGetCost);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);

                    if (flag == 1) {
                        if (parseFloat(PlanCostNum) < parseFloat(SumPlanCost)) {
                            HDialog.Info("计划费用不能大于当前选择重点计划的计划费用。");
                            return;
                        }
                    } if (flag == 2) {
                        if (parseFloat(PointNum) < parseFloat(SumPoint)) {
                            HDialog.Info("绩效分值不能大于当前选择重点计划的绩效分值。");
                            return;
                        }
                    } if (flag == 3) {
                        if (parseFloat(GetCostNum) < parseFloat(SumGetCost)) {
                            HDialog.Info("奖罚金额不能大于当前选择重点计划的奖罚金额。");
                            return;
                        }
                    }
                }--%>
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

