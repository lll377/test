<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanStatistics.aspx.cs" Inherits="M_Main.Plan.PlanStatistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划统计</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/export.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 1000px;
            height: 200px;
        }

        .SearchTable {
            width: 1000px;
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="WorkFlowTypeId" type="hidden" name="WorkFlowTypeId" runat="server" />
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">计划周期
                    </td>
                    <td class="DialogTdDateContent">
                        <select id="PlanCycleID" name="PlanCycleID" runat="server" onchange="PlanCycleChange();" isdctype="true" dctype="计划周期" style="width: 63%; border: 1px #cccccc solid;">
                        </select>
                        <input type="hidden" value="" runat="server" id="PlanCycle" name="PlanCycle" />
                    </td>
                    <td class="TdTitle">责任部门
                    </td>
                    <td class="DialogTdDateContent">
                        <input id="BlameDepCode" name="BlameDepCode" runat="server" style="width: 63%; border: 1px #cccccc solid;" onclick="SelDepart();" />
                        <input type="hidden" id="BlameDepCodeList" name="BlameDepCodeList" runat="server" />
                    </td>
                    <td class="TdTitle">计划类型
                    </td>
                    <td class="DialogTdDateContent">
                        <input id="PlanType" name="PlanType" runat="server" style="width: 63%; border: 1px #cccccc solid;" />
                        <input type="hidden" id="PlanTypeCodeList" name="PlanTypeCodeList" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanStartTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 63%;" name="PlanStartTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanStartTime_End" class="easyui-datebox" data-options="editable:false" style="width: 63%;" name="PlanStartTime_End" runat="server" />
                    </td>
                    <td class="TdTitle">是否关闭
                    </td>
                    <td class="DialogTdDateContent">
                        <select id="IsClose" name="IsClose" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">结束时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanEndTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 63%;" name="PlanEndTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanEndTime_End" class="easyui-datebox" data-options="editable:false" style="width: 63%;" name="PlanEndTime_End" runat="server" />
                    </td>
                    <td class="TdTitle">责任人
                    </td>
                    <td class="DialogTdDateContent">
                        <%-- <select id="Methods" name="Methods" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="按责任人">按责任人</option>
                        </select>--%>
                        <input type="text" class="easyui-validatebox" id="Personliable" name="Personliable" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划来源
                    </td>
                    <td class="DialogTdDateContent">
                        <select id="PlanSourceName" name="PlanSourceName" onchange="PlanSourceChange();" isdctype="true" dctype="计划来源" style="width: 63%; border: 1px #cccccc solid;">
                        </select>
                        <input type="hidden" value="" runat="server" id="PlanSource" name="PlanSource" />

                    </td>
                    <td class="TdTitle">发起时间</td>
                    <td class="DialogTdDateContent">
                        <input id="AddTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 63%;" name="AddTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="AddTime_End" class="easyui-datebox" data-options="editable:false" style="width: 63%;" name="AddTime_End" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList(1);">确定筛选</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ClaerWhere();">清  除 </a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" value="" runat="server" id="SortDepCode" name="SortDepCode" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(document).ready(function () {
                //加载字典设置
                function LoadDictionary() {
                    $("select[isdctype='true']").each(function (i) {
                        var nId = $(this).attr("id");

                        $.tool.DataPostAsync('CsPlan', 'BindDictionary', 'DcTypeName=' + $(this).attr("dctype"),
                            function Init() {
                            },
                            function callback(_Data) {
                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                var option = "<option value='全部'>全部</option>";
                                $("#" + nId).append(option);
                                for (var i = 0; i < varObjects.length; i++) {
                                    var option = "<option value='" + varObjects[i].Id + "'>" + varObjects[i].Name + "</option>";
                                    $("#" + nId).append(option);
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            }, false);
                    });
                }
                LoadDictionary();

            });

            //计划周期改变
            function PlanCycleChange() {
                $('#PlanCycle').val($('#PlanCycleChange option:selected').val());
            }

            //计划来源改变
            function PlanSourceChange() {
                $('#PlanSource').val($('#PlanSourceChange option:selected').val());
            }

            //清空筛选条件
            function ClaerWhere() {
                $("#PlanCycleID").find("option[value='全部']")[0].selected = true;
                $("#PlanCycle").val("");
                $("#PlanSourceName").find("option[value='全部']")[0].selected = true;
                $("#PlanSource").val("");

                $("#BlameDepCode").val("");
                $("#BlameDepCodeList").val("");

                $("#PlanType").val("");
                $("#PlanTypeCodeList").val("");

                $("#PlanStartTime_Begin").datebox("setValue", "");
                $("#PlanStartTime_End").datebox("setValue", "");
                $("#PlanEndTime_Begin").datebox("setValue", "");
                $("#PlanEndTime_End").datebox("setValue", "");

                $('#AuditingState').combobox("select", "全部");
                $('#IsClose').combobox("select", "全部");
            }
            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitFunction();

            //统计 列
            var PersonColumn = [[
                { field: 'text', title: '责任部门', align: 'left', width: 200, sortable: true },
                {
                    field: 'PlanNum', title: '计划数量', align: 'center', width: 60, sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.depcode + "','0');\">" + row.PlanNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'PlanCloseNum', title: '完成数量', align: 'center', width: 60, sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.depcode + "','1');\">" + row.PlanCloseNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'PlanNotCloseNum', title: '未完成数量', align: 'center', width: 60, sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.depcode + "','2');\">" + row.PlanNotCloseNum + "</a>";
                        return str;
                    }
                },
                {
                    field: 'PlanCompleteRate', title: '完成率', align: 'center', width: 60, sortable: true
                },
                {
                    field: 'PlanCost', title: '计划费用(元)', width: 80, align: 'left', sortable: true
                },
                {
                    field: 'ActualCost', title: '累计完成费用(元)', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'PlanPoint', title: '所占分值', width: 60, align: 'left', sortable: true
                },
                {
                    field: 'ActualPoint', title: '累计所得分值', width: 80, align: 'left', sortable: true
                },
                {
                    field: 'GetCost', title: '所占金额(元)', width: 80, align: 'left', sortable: true
                },
                {
                    field: 'ActualGetCost', title: '累计所得金额(元)', width: 100, align: 'left', sortable: true
                }
            ]];
            //工具栏
            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '导出',
                    iconCls: 'icon-mini-edit',
                    handler: function () {
                        window.open("PlanStatisticsExcel.aspx?random=" + Math.random() + $("#frmForm").serialize());
                    }
                }
            ];
            //导出的方法
            function Export(strXlsName, exportGrid) {
                var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
                var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
                var l = $('<input type="hidden" id="txtName" name="txtName" />');
                i.val(ChangeToTableTreegrid(exportGrid, Headcolumn, ExcelCol));
                i.appendTo(f);
                l.val(strXlsName);
                l.appendTo(f);
                f.appendTo(document.body).submit();
                document.body.removeChild(f);
            }

            var Headcolumn = [[
              { field: 'text', title: '责任部门', align: 'left', width: 200, sortable: true },
                { field: 'PlanNum', title: '计划数量', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanNum; } },
                { field: 'PlanCloseNum', title: '完成数量', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanCloseNum; } },
                { field: 'PlanNotCloseNum', title: '未完成数量', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanNotCloseNum; } },
                { field: 'PlanCompleteRate', title: '完成率', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanCompleteRate } },
                { field: 'PlanCost', title: '计划费用(元)', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.PlanCost } },
                { field: 'ActualCost', title: '累计完成费用(元)', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.ActualCost } },
                { field: 'PlanPoint', title: '所占分值', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.PlanPoint } },
                { field: 'ActualPoint', title: '累计所得分值', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.ActualPoint } },
                { field: 'GetCost', title: '所占金额(元)', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.GetCost } },
                { field: 'ActualGetCost', title: '累计所得金额(元)', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.ActualGetCost } }
            ]];
            var ExcelCol = [
                { field: 'text', title: '责任部门', align: 'left', width: 200, sortable: true },
                { field: 'PlanNum', title: '计划数量', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanNum; } },
                { field: 'PlanCloseNum', title: '完成数量', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanCloseNum; } },
                { field: 'PlanNotCloseNum', title: '未完成数量', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanNotCloseNum; } },
                { field: 'PlanCompleteRate', title: '完成率', align: 'center', width: 60, sortable: true, formatter: function (value, row, index) { return row.attributes.PlanCompleteRate } },
                { field: 'PlanCost', title: '计划费用(元)', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.PlanCost } },
                { field: 'ActualCost', title: '累计完成费用(元)', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.ActualCost } },
                { field: 'PlanPoint', title: '所占分值', width: 60, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.PlanPoint } },
                { field: 'ActualPoint', title: '累计所得分值', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.ActualPoint } },
                { field: 'GetCost', title: '所占金额(元)', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.GetCost } },
                { field: 'ActualGetCost', title: '累计所得金额(元)', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) { return row.attributes.ActualGetCost } }
            ];


            //选择部门
            function SelDepart() {
                HDialog.Open('400', '403', "../dialog/DepartmentDlgNew_hr.aspx?Ram=" + Math.random(), '选择责任部门', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息

                        var varObjects = _Data.split("~");
                        var varDepObj = "";
                        var depName = "";
                        var depCode = "";
                        var depCode = "";
                        for (var i = 0; i < varObjects.length; i++) {
                            varDepObj = varObjects[i].split('\t');
                            depName += varDepObj[2] + ",";
                            depCode += "'" + varDepObj[4] + "',";
                        }
                        depName = depName.substr(0, depName.length - 1);
                        depCode = depCode.substr(0, depCode.length - 1);
                        $("#BlameDepCode").val(depName);
                        $("#BlameDepCodeList").val(depCode);
                    }
                });

            }

            //****选择计划类型（可以多选）
            function selPlanType() {


            }
            var flag = true;
            //加载列表
            function LoadList(obj) {
                var column = PersonColumn;
                flag = false;
                if (obj == "1") {
                    $.tool.DataPost('CsPlan', 'GetPlanStatisticsData', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var Data = "";
                            if (_Data != "") {
                                Data = eval("(" + _Data + ")"); //转换为json对象
                            }
                            $("#TableContainer").treegrid({
                                treeField: 'text',
                                idField: 'id',
                                method: "get",
                                title: '',
                                loadMsg: '加载中,请稍侯',
                                data: Data,
                                nowrap: false,
                                //pageSize: 100,
                                //pageList: [100, 200, 500],
                                //pageNumber: 1,
                                columns: column,
                                fitColumns: true,
                                border: false,
                                pagination: false,
                                rownumbers: true,
                                width: "100%",
                                toolbar: toolbar,
                                onBeforeExpand: function (row) {

                                },
                                onExpand: function (row) {

                                }
                            });
                            $("#SearchDlg").dialog("close");
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    $("#TableContainer").treegrid({
                        treeField: 'text',
                        idField: 'id',
                        method: "get",
                        title: '',
                        loadMsg: '加载中,请稍侯',
                        data: null,
                        nowrap: false,
                        //pageSize: 100,
                        //pageList: [100, 200, 500],
                        //pageNumber: 1,
                        columns: column,
                        fitColumns: true,
                        border: false,
                        pagination: false,
                        rownumbers: true,
                        width: "100%",
                        toolbar: toolbar,
                        onExpand: function (row) {

                        }
                    });
                }
            }
            LoadList();
            $('#SearchDlg').parent().appendTo($("form:first"));

            function Detail(DepCode, OpType) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanStatisticsDetail.aspx?DepCode=' + DepCode + '&OpType=' + OpType, '计划统计详情', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }

            //选择计划类型
            $('#PlanType').click(function () {
                HDialog.Open('500', '500', '../Plan/SelPlanType.aspx', '选择计划类型', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#PlanTypeCodeList").val(arrRet[0]);
                        $("#PlanType").val(arrRet[1]);
                    }
                });
            });
        </script>
    </form>
</body>
</html>
