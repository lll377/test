<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanIssueDetail.aspx.cs" Inherits="M_Main.Plan.PlanIssueDetail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划单编制页面</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                text-align: center;
                width: 84px;
                height: 40px;
                line-height: 40px;
                background-color: #f5f5f5;
                cursor: pointer;
            }

                .TopHead input:hover {
                    background-color: #ffffff;
                }

        .Bar {
            position: relative;
            width: 75%;
            /* 宽度 */ border: 1px solid #B1D632;
            padding: 1px;
        }

            .Bar div {
                display: block;
                position: relative;
                background: peachpuff; /* 进度条背景颜色 */
                color: #333333;
                height: 20px; /* 高度 */
                line-height: 20px;
                /* 必须和高度一致，文本才能垂直居中 */
            }

                .Bar div span {
                    position: absolute;
                    width: 100%;
                    /* 宽度 */ text-align: center;
                    font-weight: bold;
                }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="IssueId" name="IssueId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="StorageId" name="StorageId" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <%--计划单开始时间--%>
        <input type="hidden" id="ActualStartTime" name="ActualStartTime" runat="server" />
        <%--计划单结束时间--%>
        <input type="hidden" id="ActualEndTime" name="ActualEndTime" runat="server" />
        <%--计划周期名称--%>
        <input type="hidden" id="PlanCycleName" name="PlanCycleName" runat="server" />
        <%--计划月份--%>
        <input type="hidden" id="PlanMonthHid" name="PlanMonth" runat="server" />

        <%--制单人--%>
        <input type="hidden" value="" runat="server" id="StartPerson" name="StartPerson" />
        <%--审核人--%>
        <input type="hidden" value="" runat="server" id="Checker" name="Checker" />

        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />
        <%-- 计划列表数据内容（新增 修改 删除） --%>
        <input type="hidden" id="AddResult" name="AddResult" runat="server" value="" />
        <input type="hidden" id="UpdateResult" name="UpdateResult" runat="server" value="" />
        <input type="hidden" id="DelResult" name="DelResult" runat="server" value="" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />

        <div class="TopHead">
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
            <input id="BtnSend" type="submit" value="发送" onserverclick="BtnSend_ServerClick" runat="server" />
            <input type="button" id="BtnClose" value="关闭" />
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">计划周期：</td>
                <td class="DialogTdContent">
                    <select id="PlanCycle" name="PlanCycle" runat="server" onchange="SelPlanCycle();" isdctype="true" dctype="计划周期" style="width: 75%; border: 1px #cccccc solid; height: 26px;" class="easyui-validatebox " data-options="required:true"></select>
                    <input type="hidden" id="PlanCycleID" name="PlanCycleID" runat="server" />
                </td>
                <td class="DialogTdTitle">计划年度：
                </td>
                <td class="DialogTdContent">
                    <input class=" easyui-validatebox Wdate" id="PlanYear" data-options="required:true" onclick="WdatePicker({ dateFmt: 'yyyy' })" readonly="readonly" name="PlanYear" runat="server" type="text" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle" id="tdTitlePlanMonth">计划月份：</td>
                <td class="DialogTdContent" id="tdContentPlanMonth">
                    <select id="PlanMonth" name="PlanMonth" runat="server" style="width: 75%; border: 1px #cccccc solid; height: 24px;" class="easyui-validatebox ">
                        <option value=""></option>
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
                    </select>
                </td>
                <td class="DialogTdTitle">计划主题：
                </td>
                <td class="DialogTdContent">
                    <input type="text" runat="server" class="easyui-validatebox" data-options="required:true" id="PlanTheme" name="PlanTheme" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">责任部门/责任人：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" id="SelUserName" name="SelUserName" readonly="readonly" runat="server" data-options="required:true" onclick="SelUser()" />
                    <input type="hidden" id="SelUserCode" name="SelUserCode" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto; margin-top: 5px;">
            <div id="TableContainer" style="max-height: 220px;"></div>
        </div>

        <script type="text/javascript">
            //选择责任人
            function SelUser() {
                var w = top.$(window).width();
                var h = top.$(window).height();
                localStorage.setItem("SelUserCode", $("#SelUserCode").val());
                localStorage.setItem("SelUserName", $("#SelUserName").val());

                HDialog.Open(w, h, '../Plan/SelUser.aspx?IsCheck=1', "选择责任人", false, function callback(_Data) {
                    localStorage.removeItem('SelUserCode');
                    localStorage.removeItem('SelUserName');
                    if (_Data > '') {
                        $("#SelUserCode").val(_Data.split('|')[0]);
                        $("#SelUserName").val(_Data.split('|')[1]);
                    }
                });
            }

            $(document).ready(function () {
                $('#PlanMonth').val($('#PlanMonthHid').val());
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
                                $('#PlanCycle').val($('#PlanCycleID').val());
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            }, false);
                    });
                }
                LoadDictionary();
            });

            //选择责任人
            function SelPerson() {
                HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?Cmd=3&MultiLine=0&WorkInfoId=-1&random=' + Math.random(), '选择责任人', false, function callback(_Data) {
                    if (_Data != '') {
                        var Ret = Cache.GetData("SelOrp.aspx_Return");
                        var obj = JSON.parse(Ret);
                        if (obj != null) {
                            var arrUserList = obj[0].split(',');
                            $("#BlamePId").val(arrUserList[1]);
                            $("#BlamePName").val(arrUserList[0].split(']')[1]);
                        }
                    }
                });
            }

            function SelPlanCycle() {
                $('#PlanCycleID').val($('#PlanCycle option:selected').val());
                $('#PlanCycleName').val($('#PlanCycle option:selected').text());//计划周期名称
                if ($('#PlanCycle option:selected').text() == '年度计划') {
                    $('#PlanMonth').val('');
                    $("#PlanMonth").attr("disabled", "disabled");
                } else {
                    $('#PlanMonth').removeAttr("disabled");
                }
            }

            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 40, align: 'center', sortable: true },
                { field: 'PlanTypeName', title: '计划类型', width: 60, align: 'center', sortable: true },
                {
                    field: 'PlanName', title: '计划名称', align: 'left', width: 150, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"PlanDetailEdit('" + row.DetailId + "','edit','true');\">" + row.PlanName + "</a>";
                        return str;
                    }
                },
                {
                    field: 'PlanStartTime', title: '计划开始时间', width: 60, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'PlanEndTime', title: '计划结束时间', width: 60, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PlanEndTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'Target', title: '计划目标', width: 120, align: 'left', sortable: true },
                { field: 'PlanCost', title: '计划费用', width: 60, align: 'center', sortable: true },
                { field: 'Point', title: '绩效分值', align: 'center', width: 60, sortable: true },
                { field: 'GetCost', title: '奖罚金额', align: 'center', width: 60, sortable: true },
                { field: 'PlanAssigned', title: '计划交办', align: 'center', width: 60, sortable: true },

                { field: 'Rate', title: '税率(%)', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PayDepName', title: '费用部门', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'RemindDate', title: '提醒时间', align: 'center', width: 60, sortable: true, hidden: true },
                { field: 'PayDepCode', title: '费用部门code', align: 'center', width: 60, sortable: true, hidden: true },

                {
                    field: 'ImportantPlan', title: '是否重点计划', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) {
                        var str = "";
                        if (row.ImportantPlan == 0) {
                            str = "是";
                        } else {
                            str = "否";
                        }
                        return str;
                    }
                },
                {
                    field: 'RelationPlan', title: '关联计划', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"RelationPlanSee('" + row.DetailId + "','" + row.ImportantPlanTitlenId + "','See','" + row.ImportantPlan + "');\">" + row.RelationPlan + "</a>";
                        return str;
                    }
                }
            ]];
            //工具栏
            var toolbar = [];
            var toolbar_Start = [
                {
                    text: '单个计划新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#PlanYear").val() == "") {
                            HDialog.Info("请选择计划年度");
                            return;
                        }
                        PlanDetailEdit("", "insert", 'true');
                    }
                }, '-', {
                    text: '批量计划新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#PlanYear").val() == "") {
                            HDialog.Info("请选择计划年度");
                            return;
                        }
                        PlanDetailEdit("", "insert", 'false');
                    }
                }, '-',
                {
                    text: '批量导入计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#PlanYear").val() == "") {
                            HDialog.Info("请选择计划年度");
                            return;
                        } else {
                            var month = "-__"
                            if ($("#PlanMonth").val() != "") {
                                month = '-' + $("#PlanMonth").val();
                            }
                            HDialog.Open(800, 550, '../Plan/PlanPlaningList_Import.aspx?PlanYearMonth=' + $("#PlanYear").val() + month, '导入计划', true, function callback(_Data) {
                                var obj = JSON.parse(_Data);
                                for (var i = 0; i < obj.length; i++) {
                                    var _Data1 = $('#TableContainer').datagrid('getData');
                                    var row_index = _Data1.rows.length;
                                    //新增
                                    $('#TableContainer').datagrid('insertRow', {
                                        index: row_index,
                                        row: {
                                            IssueId: $("#IssueId").val(),
                                            DetailId: obj[i].DetailId,
                                            Sort: obj[i].Sort,
                                            PlanTypeName: obj[i].PlanTypeName,
                                            PlanType: obj[i].PlanType,
                                            PlanName: obj[i].PlanName,
                                            PlanStartTime: obj[i].PlanStartTime,
                                            PlanEndTime: obj[i].PlanEndTime,
                                            PlanContent: obj[i].PlanContent,
                                            PlanExplain: obj[i].PlanExplain,
                                            Target: obj[i].Target,
                                            PlanCost: obj[i].PlanCost,
                                            PlanNode: obj[i].PlanNode,
                                            Point: obj[i].Point,
                                            GetCost: obj[i].GetCost,
                                            PlanRemark: obj[i].PlanRemark,
                                            PlanSource: obj[i].PlanSource,
                                            AssistMan: obj[i].AssistMan,
                                            ImportantPlan: obj[i].ImportantPlan,
                                            ImportantPlanTitlen: obj[i].ImportantPlanTitlen,
                                            ImportantPlanTitlenId: obj[i].ImportantPlanTitlenId,
                                            PlanCoding: obj[i].PlanCoding,
                                            PlanYear: obj[i].PlanYear,
                                            PlanMonth: obj[i].PlanMonth,
                                            IsConnectBudget: obj[i].IsConnectBudget,
                                            ConnectBudgetWay: obj[i].ConnectBudgetWay,
                                            ConnectBudgetProject: obj[i].ConnectBudgetProject,
                                            ConnectBudgetProjectName: obj[i].ConnectBudgetProjectName,
                                            Rate: obj[i].Rate,
                                            RemindDate: "",
                                            PayDepName: "",
                                            PayDepCode: "",
                                            RelationPlan: '',
                                            IsClose: '0',
                                            IsDelete: '0',
                                            UpdateState: '0' //修改状态,为100的时候就是修改过的数据
                                        }
                                    });
                                }
                            });
                        }
                    }
                }, '-',
                {
                    text: '引用重点计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#PlanYear").val() == "") {
                            HDialog.Info("请选择计划年度");
                            return;
                        } else {
                            QuoteImportantPlan();
                        }
                    }
                }, '-',
                {
                    text: '引用下级计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        BatchReference();
                    }
                }, '-',
                {
                    text: '引用模板计划',
                    iconCls: 'icon-add',
                    handler: function () {
                        AddPlanDetail_LotSize();
                    }
                }, '-',
                {
                    text: '删除计划',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var rows = $("#TableContainer").datagrid("getChecked");
                        if (rows.length == 0) {
                            HDialog.Info("请勾选删除数据");
                            return;
                        }
                        for (var i = 0; i <= rows.length; i++) {
                            var rowIndex = $('#TableContainer').datagrid('getRowIndex', rows[i]);
                            $('#TableContainer').datagrid('deleteRow', rowIndex);
                            var rows = $('#TableContainer').datagrid("getRows");
                            $('#TableContainer').datagrid("loadData", rows);
                        }
                    }
                }
            ];

            //编辑计划
            function PlanDetailEdit(id, OpType, IsSingle) {
                if (id != "") {
                    var RowIndex = $('#TableContainer').datagrid("getRowIndex", id);
                    var data = $('#TableContainer').datagrid('getData').rows[RowIndex];
                    Cache.SetData("PlanPlaningDetailListRowData", JSON.stringify(data));
                }
                //flag 0:计划编制的时候 可以编辑所有数据 1：计划编制审批的时候 只能填写部分东西
                var Flag = '0';
                var w = 850;
                var h = 660;
                if (IsSingle == 'false') {
                    w = 850;
                    h = 710;
                }
                HDialog.Open(w, h, '../Plan/PlanIssueDetailEdit.aspx?OpType=' + OpType + '&DetailId=' + id + "&IsSingle=" + IsSingle + "&Flag=" + Flag + "&PlanYear=" + $("#PlanYear").val() + "&PlanCycle=" + $('#PlanCycle option:selected').text(), '计划详情', true, function callback(_Data) {
                    var ReturnJson = Cache.GetData("ReturnJsonObjectAll");
                    ReturnJson = eval("(" + ReturnJson.replace(/\\/g, "/") + ")")
                    if (_Data != null || ReturnJson != null) {

                    }
                });
            }

            //绑定数据
            function BindData() {
                var returnJson = Cache.GetData("ReturnJsonObjectAll");
                returnJson = eval("(" + returnJson.replace(/\\/g, "/") + ")")
                for (var i = 0; i < returnJson.length; i++) {
                    var RowIndex = $('#TableContainer').datagrid("getRowIndex", returnJson[i].DetailId);
                    var obj = returnJson[i];
                    if (RowIndex == -1) {
                        var _Data1 = $('#TableContainer').datagrid('getData');
                        var row_index = _Data1.rows.length;
                        //新增
                        $('#TableContainer').datagrid('insertRow', {
                            index: row_index,
                            row: {
                                IssueId: $("#IssueId").val(),
                                DetailId: obj.DetailId,
                                Sort: obj.Sort,
                                PlanTypeName: obj.PlanTypeName,
                                PlanType: obj.PlanType,
                                PlanName: obj.PlanName,
                                PlanStartTime: obj.PlanStartTime,
                                PlanEndTime: obj.PlanEndTime,
                                PlanContent: obj.PlanContent,
                                PlanExplain: obj.PlanExplain,
                                Target: obj.Target,
                                PlanCost: obj.PlanCost,
                                PlanNode: obj.PlanNode,
                                Point: obj.Point,
                                GetCost: obj.GetCost,
                                PlanRemark: obj.PlanRemark,
                                PlanSource: obj.PlanSource,
                                AssistMan: obj.AssistMan,
                                ImportantPlan: obj.ImportantPlan,
                                ImportantPlanTitlen: obj.ImportantPlanTitlen,
                                ImportantPlanTitlenId: obj.ImportantPlanTitlenId,
                                PlanCoding: obj.PlanCoding,
                                PlanYear: obj.PlanYear,
                                PlanMonth: obj.PlanMonth,
                                IsConnectBudget: obj.IsConnectBudget,
                                ConnectBudgetWay: obj.ConnectBudgetWay,
                                ConnectBudgetProject: obj.ConnectBudgetProject,
                                ConnectBudgetProjectName: obj.ConnectBudgetProjectName,
                                RelationPlan: '',
                                Rate: obj.Rate,
                                RemindDate: obj.RemindDate,
                                PayDepName: obj.PayDepName,
                                PayDepCode: obj.PayDepCode,
                                IsClose: '0',
                                IsDelete: '0',
                                UpdateState: '0' //修改状态,为100的时候就是修改过的数据
                            }
                        });
                    } else {
                        //修改
                        $('#TableContainer').datagrid('updateRow', {
                            index: RowIndex,
                            row: {
                                IssueId: $("#IssueId").val(),
                                DetailId: obj.DetailId,
                                Sort: obj.Sort,
                                PlanTypeName: obj.PlanTypeName,
                                PlanType: obj.PlanType,
                                PlanName: obj.PlanName,
                                PlanStartTime: obj.PlanStartTime,
                                PlanEndTime: obj.PlanEndTime,
                                PlanContent: obj.PlanContent,
                                PlanExplain: obj.PlanExplain,
                                Target: obj.Target,
                                PlanCost: obj.PlanCost,
                                PlanNode: obj.PlanNode,
                                Point: obj.Point,
                                GetCost: obj.GetCost,
                                PlanRemark: obj.PlanRemark,
                                PlanSource: obj.PlanSource,
                                AssistMan: obj.AssistMan,
                                ImportantPlan: obj.ImportantPlan,
                                ImportantPlanTitlen: obj.ImportantPlanTitlen,
                                ImportantPlanTitlenId: obj.ImportantPlanTitlenId,
                                PlanCoding: obj.PlanCoding,
                                PlanYear: obj.PlanYear,
                                PlanMonth: obj.PlanMonth,
                                IsConnectBudget: obj.IsConnectBudget,
                                ConnectBudgetWay: obj.ConnectBudgetWay,
                                ConnectBudgetProject: obj.ConnectBudgetProject,
                                ConnectBudgetProjectName: obj.ConnectBudgetProjectName,
                                RelationPlan: '',
                                IsClose: '0',
                                IsDelete: '0',
                                Rate: obj.Rate,
                                RemindDate: obj.RemindDate,
                                PayDepName: obj.PayDepName,
                                PayDepCode: obj.PayDepCode,
                                UpdateState: '100' //修改状态,为100的时候就是修改过的数据
                            }
                        });
                    }
                }
            }

            //批量新增计划
            function AddPlanDetail_LotSize() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanPlaningList_LotSizeEdit_List.aspx', '批量添加计划', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        var data = _Data.split('￥')[0];
                        var beginmonth = _Data.split('￥')[1];
                        var endmonth = _Data.split('￥')[2];
                        var varObjects = eval("(" + data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                if (beginmonth > '' && varObjects[i].PlanYear > '') {
                                    for (var j = 0; j <= parseInt(endmonth) - parseInt(beginmonth); j++) {
                                        var rowdate = varObjects[i];
                                        rowdate.PlanStartTime = rowdate.PlanYear + '-' + (parseInt(beginmonth) + j) + '-01';
                                        var temp = new Date(rowdate.PlanYear + '-' + (parseInt(beginmonth) + j) + '-01');
                                        temp.setMonth(temp.getMonth() + 1)
                                        temp.setDate(temp.getDate() - 1);
                                        rowdate.PlanEndTime = dataformat(new Date(temp), "yyyy-MM-dd");
                                        AddRows_LotSize(rowdate);
                                    }
                                } else {
                                    AddRows_LotSize(varObjects[i]);
                                }
                            }
                        }
                    }
                });
            }
            var dataformat = function (time, format) {
                var t = new Date(time);
                var tf = function (i) { return (i < 10 ? '0' : '') + i };
                return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function (a) {
                    switch (a) {
                        case 'yyyy':
                            return tf(t.getFullYear());
                            break;
                        case 'MM':
                            return tf(t.getMonth() + 1);
                            break;
                        case 'mm':
                            return tf(t.getMinutes());
                            break;
                        case 'dd':
                            return tf(t.getDate());
                            break;
                        case 'HH':
                            return tf(t.getHours());
                            break;
                        case 'ss':
                            return tf(t.getSeconds());
                            break;
                    }
                })
            };

            function AddRows_LotSize(obj) {
                var _Data1 = $('#TableContainer').datagrid('getData');
                var row_index = _Data1.rows.length;
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        IssueId: $("#IssueId").val(),
                        DetailId: guid(),
                        Sort: obj.Sort,
                        PlanTypeName: obj.PlanTypeName,
                        PlanType: obj.PlanType,
                        PlanName: obj.PlanName,
                        PlanStartTime: obj.PlanStartTime,
                        PlanEndTime: obj.PlanEndTime,
                        PlanContent: obj.PlanContent,
                        PlanExplain: obj.PlanExplain,
                        Target: obj.Target,
                        PlanCost: obj.PlanCost,
                        PlanNode: obj.PlanNode,
                        Point: obj.Point,
                        GetCost: obj.GetCost,
                        PlanRemark: obj.PlanRemark,
                        PlanSource: obj.PlanSource,
                        PlanSourceName: obj.PlanSourceName,
                        AssistMan: obj.AssistMan,
                        ImportantPlan: obj.ImportantPlan,
                        ImportantPlanTitlen: obj.ImportantPlanTitlen,
                        ImportantPlanTitlenId: obj.ImportantPlanTitlenId,
                        PlanCoding: obj.PlanCoding,
                        PlanYear: obj.PlanYear,
                        PlanMonth: obj.PlanMonth,
                        IsConnectBudget: obj.IsConnectBudget,
                        ConnectBudgetWay: obj.ConnectBudgetWay,
                        ConnectBudgetProject: obj.ConnectBudgetProject,
                        ConnectBudgetProjectName: obj.ConnectBudgetProjectName,
                        RelationPlan: obj.RelationPlan == undefined ? '' : obj.RelationPlan,
                        IsClose: '0',
                        IsDelete: '0',
                        Rate: obj.Rate,
                        RemindDate: '',
                        PayDepName: obj.PayDepName == undefined ? '' : obj.PayDepName,
                        PayDepCode: obj.PayDepCode == undefined ? '' : obj.PayDepCode,
                        UpdateState: '0' //修改状态,为100的时候就是修改过的数据
                    }
                });
            }

            //生成guid
            function S4() {
                return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
            }

            function guid() {
                return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
            }

            //批量引用计划
            function BatchReference() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanBatchReference.aspx?IssueId=' + $("#IssueId").val(), '批量引用计划', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                AddRows(varObjects[i]);
                            }
                        }
                    }
                });
            }

            //批量引用重点计划
            function QuoteImportantPlan() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanBatchReferenceImportan.aspx?IssueId=' + $("#IssueId").val() + "&PlanYear=" + $("#PlanYear").val() + "&PlanMonth=" + $("#PlanMonth").val(), '批量引用重点计划', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            for (var i = 0; i < varObjects.length; i++) {
                                AddRows(varObjects[i]);
                            }
                        }
                    }
                });
            }

            function AddRows(obj) {
                var _Data1 = $('#TableContainer').datagrid('getData');
                var row_index = _Data1.rows.length;
                $('#TableContainer').datagrid('insertRow', {
                    index: row_index,
                    row: {
                        IssueId: $("#IssueId").val(),
                        DetailId: obj.DetailId,
                        Sort: obj.Sort,
                        PlanTypeName: obj.PlanTypeName,
                        PlanType: obj.PlanType,
                        PlanName: obj.PlanName,
                        PlanStartTime: obj.PlanStartTime,
                        PlanEndTime: obj.PlanEndTime,
                        PlanContent: obj.PlanContent,
                        PlanExplain: obj.PlanExplain,
                        Target: obj.Target,
                        PlanCost: obj.PlanCost,
                        PlanNode: obj.PlanNode,
                        Point: obj.Point,
                        GetCost: obj.GetCost,
                        PlanRemark: obj.PlanRemark,
                        PlanSource: obj.PlanSource,
                        PlanSourceName: obj.PlanSourceName,
                        AssistMan: obj.AssistMan,
                        ImportantPlan: obj.ImportantPlan,
                        ImportantPlanTitlen: obj.ImportantPlanTitlen,
                        ImportantPlanTitlenId: obj.ImportantPlanTitlenId,
                        PlanCoding: obj.PlanCoding,
                        PlanYear: obj.PlanYear,
                        PlanMonth: obj.PlanMonth,
                        IsConnectBudget: obj.IsConnectBudget,
                        ConnectBudgetWay: obj.ConnectBudgetWay,
                        ConnectBudgetProject: obj.ConnectBudgetProject,
                        ConnectBudgetProjectName: obj.ConnectBudgetProjectName,
                        RelationPlan: obj.RelationPlan == undefined ? '' : obj.RelationPlan,
                        IsClose: '0',
                        IsDelete: '0',
                        Rate: obj.Rate,
                        RemindDate: obj.RemindDate,
                        PayDepName: '',
                        PayDepCode: '',
                        UpdateState: '0' //修改状态,为100的时候就是修改过的数据
                    }
                });
            }

            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

            //给datagrid扩展方法
            $.extend($.fn.datagrid.methods, {
                addEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item.field);
                            e.editor = item.editor;
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param.field);
                        e.editor = param.editor;
                    }
                },
                removeEditor: function (jq, param) {
                    if (param instanceof Array) {
                        $.each(param, function (index, item) {
                            var e = $(jq).datagrid('getColumnOption', item);
                            e.editor = {};
                        });
                    } else {
                        var e = $(jq).datagrid('getColumnOption', param);
                        e.editor = {};
                    }
                }
            });


            //初始化加载数据
            toolbar = toolbar_Start;

            function LoadList() {
                $("#TableContainer").datagrid({
                    idField: "DetailId",
                    nowrap: true,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    checkOnSelect: true,
                    selectOnCheck: false,
                    pagination: false,
                    rownumbers: true,
                    border: false,
                    showFooter: true,
                    striped: true,
                    view: myview,
                    toolbar: toolbar,
                    remoteSort: false,
                    onLoadSuccess: function () {

                    }
                });
            }

            //将 列表内容存入隐藏控件中
            function ClientClick() {
                var data = $('#TableContainer').datagrid("getData");
                if (data.rows.length == 0) {
                    return false;
                }
                var AddGridData = $('#TableContainer').datagrid('getChanges', 'inserted');
                //验证是否是批量添加后编辑了的
                for (var i = 0; i < AddGridData.length; i++) {
                    if (AddGridData[i].PlanType == undefined || AddGridData[i].PlanTypSearchResulte == "") {
                        HDialog.Info("计划['" + AddGridData[i].PlanName + "'],计划类型不能为空！");
                        return false;
                    }
                    if (AddGridData[i].PlanStartTime == undefined || AddGridData[i].PlanStartTime == "") {
                        HDialog.Info("计划['" + AddGridData[i].PlanName + "'],计划开始时间不能为空！");
                        return false;
                    }
                    if (AddGridData[i].PlanEndTime == undefined || AddGridData[i].PlanEndTime == "") {
                        HDialog.Info("计划['" + AddGridData[i].PlanName + "'],计划结束时间不能为空！");
                        return false;
                    }
                    if (AddGridData[i].Sort == undefined || AddGridData[i].Sort == "") {
                        HDialog.Info("计划['" + AddGridData[i].PlanName + "'],序号不能为空！");
                        return false;
                    }
                    if (AddGridData[i].PlanName == undefined || AddGridData[i].PlanName == "") {
                        HDialog.Info("计划列表内包含计划名称为空项,请填写后再进行操作！");
                        return false;
                    }
                    if (AddGridData[i].PlanContent == undefined || AddGridData[i].PlanContent == "") {
                        HDialog.Info("计划['" + AddGridData[i].PlanName + "'],计划内容不能为空！");
                        return false;
                    }
                    if (AddGridData[i].Target == undefined || AddGridData[i].Target == "") {
                        HDialog.Info("计划['" + AddGridData[i].PlanName + "'],计划目标不能为空！");
                        return false;
                    }
                    if (AddGridData[i].PlanSource == undefined || AddGridData[i].PlanSource == "") {
                        HDialog.Info("计划['" + AddGridData[i].PlanName + "'],计划来源不能为空！");
                        return false;
                    }
                }
                //获取新增的数据
                $("#AddResult").val(JSON.stringify(AddGridData));
                //获取修改的数据
                var DataGridData = $('#TableContainer').datagrid("getRows");
                $("#UpdateResult").val(JSON.stringify(DataGridData));
                //获取删除的数据
                $("#DelResult").val(JSON.stringify($('#TableContainer').datagrid('getChanges', 'deleted')));
                return true;
            }

            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (ClientClick()) {
                        return true;
                    } else {
                        HDialog.Info("请添加计划详情");
                        return false;
                    }
                }
                else {
                    return false;
                }
            });

            //加载数据
            LoadList();
            var Rows = JSON.parse($("#SearchResult").val());
            $('#TableContainer').datagrid('loadData', Rows);

            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;

            }

            $(document).ready(function () {
                //加载字典设置 
                if (GetQueryString('OpType') == 'insert') {
                    $('#PlanCycle').validatebox({
                        required: true
                    });
                }
                if ($("#PlanYear").val() == '')
                    $("#PlanYear").val(new Date().getFullYear());
                LoadDictionary();
                LoadList();
            });

            function RelationPlanSee(DetailId, ImportantPlanTitlenId, OpType, ImportantPlan) {
                if (ImportantPlan == "1")
                    DetailId = ImportantPlanTitlenId;
                HDialog.Open(1200, 500, '../Plan/PlanImplementPlan.aspx?DetailId=' + DetailId + '&OpType=' + OpType + '&ImportantPlan=' + ImportantPlan, '关联计划', true, function callback(_Data) {

                });
            }
        </script>
    </form>
</body>
</html>
