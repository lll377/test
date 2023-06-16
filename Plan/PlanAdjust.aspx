<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanAdjust.aspx.cs" Inherits="M_Main.Plan.PlanAdjust" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 800px;
            height: 130px;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">计划单号
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="PlanNO" style="width: 90%;" name="PlanNO" />
                    </td>
                    <td class="TdTitle">计划周期
                    </td>
                    <td class="TdContent">
                        <select id="PlanCycle" name="PlanCycle" isdctype="true" dctype="计划周期" style="width: 93%; border: 1px #cccccc solid;">
                        </select>
                    </td>

                    <td class="TdTitle">计划类型
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="PlanType" style="width: 90%;" name="PlanType" />
                        <input type="hidden" id="PlanTypeID" name="PlanTypeID" runat="server" />

                    </td>
                    <td class="TdTitle">计划名称
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="PlanName" style="width: 90%;" name="PlanName" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">调整类型
                    </td>
                    <td class="TdContent">
                        <select id="ChangeType" name="ChangeType"
                            style="width: 130px; border: 1px solid #cccccc; height: 23px;">
                            <option value=""></option>
                            <option value="计划变更">计划变更
                            </option>
                            <option value="计划终止">计划终止
                            </option>
                        </select>
                    </td>
                    <td class="TdTitle">责任部门
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="BlameDepCodeName" style="width: 90%;" name="BlameDepCodeName" onclick="SelDepart();" />
                        <input type="hidden" id="BlameDepCodeId" name="BlameDepCodeId" runat="server" />
                    </td>

                    <td class="TdTitle">责任人
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="BlamePIdName" style="width: 90%;" name="BlamePIdName" />

                    </td>
                    <td class="TdTitle">审核状态
                    </td>
                    <td class="TdContent">

                        <select id="AuditingState" name="AuditingState"
                            style="width: 130px; border: 1px solid #cccccc; height: 23px;">
                            <option value=""></option>
                            <option value="未启动">未启动</option>
                            <option value="审核中">审核中</option>
                            <option value="审批不通过">审批不通过</option>
                            <option value="已驳回">已驳回</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起时间
                    </td>
                    <td class="DialogTdDateContent">
                        <input type="text" class="easyui-datebox" id="BeginAddTime" data-options="editable:false" style="width: 93%; border: none;" onclick="checkDate()" name="BeginAddTime" />

                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="DialogTdDateContent">
                        <input type="text" class="easyui-datebox" id="EndAddTime" data-options="editable:false" style="width: 93%; border: none;" onclick="checkDate()" name="EndAddTime" />

                    </td>
                    <td class="TdTitle">发起人
                    </td>
                    <td class="TdContent">

                        <input type="text" class="easyui-validatebox" id="AddPIdName" style="width: 90%;" name="AddPIdName" />

                    </td>
                    <td class="TdTitle">是否关闭
                    </td>
                    <td class="TdContent">
                        <select id="IsClose" name="IsClose"
                            style="width: 130px; border: 1px solid #cccccc; height: 23px;">
                            <option value=""></option>
                            <option value="否">否</option>
                            <option value="是">是</option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td class="TdTitle">计划主题
                    </td>
                    <td class="TdContent">
                        <input type="text" class="easyui-validatebox" id="PlanTheme" style="width: 90%;" name="PlanTheme" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="ClearWhere();">清除条件</a>
                    </td>
                </tr>
            </table>
        </div>
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
                                var option = "<option value=''></option>";
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

            //监听键盘回车事件
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    LoadList();
                }
            };
            function checkDate() {
                WdatePicker({ dateFmt: 'yyyy-MM-dd' });
            }
            function ClearWhere() {
                $("#PlanNO").val("");
                $("#PlanCycle").val('');
                $("#BlameDepCodeName").val("");
                $("#BlamePIdName").val("");
                $("#ChangeType").val("");
                $("#AuditingState").val("");
                $("#BeginAddTime").datebox("setValue", "");
                $("#EndAddTime").datebox("setValue", "");
                $("#PlanTheme").val("");
                $("#PlanName").val("");
                $("#PlanType").val("");
                $("#AddPIdName").val("");
                $("#IsClose").val("");
            }
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        Detail('', '', 'insert', '');
                    }
                }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
                        if (!row) {
                            HDialog.Info("请选择需要删除的数据!");
                            return;
                        }
                        if (row.AuditingState == "已审核" || row.AuditingState == "审核中") {
                            HDialog.Info("当前计划调整不允许删除!");
                            return;
                        }
                        DelRecord(row)
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];
            var column;
            column = [[
                { field: 'AdjustmentID', title: 'AdjustmentID', width: 50, align: 'left', sortable: true, hidden: true },
                {
                    field: 'PlanNO', title: '计划单号', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.PlanID + "','" + row.AdjustmentID + "','edit','" + row.AuditingState + "');\">" + row.PlanNO + "</a>";
                        return str;
                    }
                },
                { field: 'PlanCycleName', title: '计划周期', width: 80, align: 'left', sortable: true },
                { field: 'PlanNum', title: '计划数量', align: 'center', width: 60, sortable: true },
                { field: 'PlanThemes', title: '计划主题', width: 100, align: 'left', sortable: true },
                { field: 'BlameDepCodeName', title: '责任部门', align: 'left', width: 120, sortable: true },//外链查询
                { field: 'BlamePIdName', title: '责任人', align: 'left', width: 80, sortable: true },//外链查询
                { field: 'AddPIdName', title: '发起人', align: 'left', width: 80, sortable: true },
                {
                    field: 'AddTime', title: '发起时间', align: 'left', width: 100, sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.AddTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'AuditingState', title: '审核状态', align: 'left', width: 80, sortable: true }
            ]];
            function DelRecord(row) {
                $.messager.confirm('确定', '是否确认删除选中数据审？', function (r) {
                    if (r) {
                        $.tool.DataGet('CsPlan', 'DelPlanAdjustment', 'AdjustmentIDList=' + row.AdjustmentID,//
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                if (_Data.split('|')[0] == "false") {
                                    HDialog.Info("删除不成功!");
                                }
                                else {
                                    LoadList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                                HDialog.Info("删除不成功!");
                            });
                    }
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsPlan&Command=GetPlanAdjustmentList&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                    },
                    rowStyler: function (index, row) {
                        return 'height:20px;';
                    }
                });
            }

            $('#SearchDlg').parent().appendTo($("form:first"));
            LoadList();

            function Detail(Id, AdjustmentID, OpType, State) {
                //var w = top.$(window).width();
                //var h = parent.$(window).height();
                //HDialog.Open(w, h, '../Plan/PlanAdjustDetail.aspx?AdjustmentID=' + Id + '&OpType=' + OpType + "&State=" + State, '计划调整', true, function callback(_Data) {
                //    if (_Data != '') {
                //        $('#SearchDlg').parent().appendTo($("form:first"));
                //        LoadList();
                //    }
                //});

                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanAdjustDetailNew.aspx?PlanID=' + Id + '&AdjustmentID=' + AdjustmentID + '&OpType=' + OpType, '计划调整', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }

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
                        $("#BlameDepCodeName").val(depName);
                        $("#BlameDepCodeId").val(depCode);
                    }
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
        </script>
    </form>
</body>
</html>
