<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanPlaningList.aspx.cs" Inherits="M_Main.Plan.PlanPlaningList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划编制列表</title>
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
                    <td class="TdTitle">计划单号
                    </td>
                    <td class="TdContent">
                        <input id="PlanNO" name="PlanNO" value="" runat="server" />
                    </td>
                    <td class="TdTitle">计划周期
                    </td>
                    <td class="DialogTdDateContent">
                        <select id="PlanCycle" name="PlanCycle" isdctype="true" dctype="计划周期" style="width: 83%; border: 1px #cccccc solid;">
                        </select>
                    </td>
                    <td class="TdTitle">责任部门
                    </td>
                    <td class="TdContent">
                        <input id="BlameDepCode" name="BlameDepCode" class="easyui-validatebox" runat="server" onclick="SelDepart();" />
                        <input type="hidden" id="BlameDepCodeList" name="BlameDepCodeList" runat="server" />
                    </td>
                    <td class="TdTitle">责任人
                    </td>
                    <td class="TdContent">
                        <input id="SerBlameP" name="SerBlameP" value="" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanStartTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanStartTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanStartTime_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanStartTime_End" runat="server" />
                    </td>
                    <td class="TdTitle">结束时间从</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanEndTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanEndTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="PlanEndTime_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="PlanEndTime_End" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">发起时间
                    </td>
                    <td class="DialogTdDateContent">
                        <input id="AddTime_Begin" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="AddTime_Begin" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="DialogTdDateContent">
                        <input id="AddTime_End" class="easyui-datebox" data-options="editable:false" style="width: 83%;" name="AddTime_End" runat="server" />
                    </td>
                    <td class="TdTitle">审核状态
                    </td>
                    <td class="DialogTdDateContent">
                        <select id="AuditingState" name="AuditingState" class="easyui-combobox" style="width: 83%;" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="未启动">未启动</option>
                            <option value="审核中">审核中</option>
                            <option value="审批不通过">审批不通过</option>
                            <option value="已驳回">已驳回</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否关闭
                    </td>
                    <td class="DialogTdDateContent">
                        <select id="IsClose" name="IsClose" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" style="width: 83%;" runat="server">
                            <option value="全部">全部</option>
                            <option value="是">是</option>
                            <option value="否">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">计划主题
                    </td>
                    <td class="TdContent">
                        <input id="PlanTheme" name="PlanTheme" value="" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>&nbsp;&nbsp;&nbsp;
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="ClaerWhere();">清  除 </a>
                    </td>
                </tr>
            </table>
        </div>
        <input type="hidden" value="" runat="server" id="CommId" name="CommId" />
        <input id="IsFinal" name="IsFinal" value="0" />
        <input type="hidden" value="" runat="server" id="DepCode" name="DepCode" />

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

            //清空筛选条件
            function ClaerWhere() {
                $("#PlanNO").val("");
                $("#PlanCycle").val('');

                $("#BlameDepCode").val("");
                $("#BlameDepCodeList").val("");

                //$("#SerBlamePId").searchbox("setValue", '');
                $("#SerBlameP").val("");

                $("#PlanStartTime_Begin").datebox("setValue","");
                $("#PlanStartTime_End").datebox("setValue", "");
                $("#PlanEndTime_Begin").datebox("setValue", "");
                $("#PlanEndTime_End").datebox("setValue", "");

                $("#AddTime_Begin").datebox("setValue", "");
                $("#AddTime_End").datebox("setValue", "");

                $('#AuditingState').combobox("select", "全部");
                $('#IsClose').combobox("select", "全部");
            }
            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            InitFunction();
            var column = [[
                 { field: 'ck', checkbox: true },
                 { field: 'PlanId', title: 'PlanId', align: 'center', width: 60, hidden:true, sortable: true },
                {
                    field: 'PlanNo', title: '计划单号', align: 'left', width: 135, sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.PlanId + "','edit');\">" + row.PlanNO + "</a>";
                        return str;
                    }
                },
                { field: 'PlanCycleName', title: '计划周期', align: 'center', width: 100, sortable: true },
                { field: 'PlanNum', title: '计划数量', align: 'center', width: 60, sortable: true },
                { field: 'PlanTheme', title: '计划主题', align: 'center', width: 100, sortable: true },
                {
                    field: 'PlanStartTime', title: '开始时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, "yyyy-MM-dd");
                        }
                        return value;
                    }
                },
                {
                    field: 'PlanEndTime', title: '结束时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, "yyyy-MM-dd");
                        }
                        return value;
                    }
                },
                { field: 'BlameDepName', title: '责任部门', width: 150, align: 'left', sortable: true },
                { field: 'BlamePName', title: '责任人', width: 100, align: 'center', sortable: true },
                { field: 'AddPName', title: '发起人', width: 100, align: 'center', sortable: true },
                {
                    field: 'AddTime', title: '发起时间', width: 100, align: 'center', sortable: true,
                    formatter: function (value, row, index) {
                        if (value != "") {
                            value = formatDate(value, "yyyy-MM-dd");
                        }
                        return value;
                    }
                },
                { field: 'AuditingState', title: '审核状态', width: 80, align: 'center', sortable: true },
                { field: 'IsClose', title: '是否关闭', width: 60, align: 'center', sortable: true }
            ]];
            //工具栏
            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        Detail('', 'insert');
                    }
                }, '-',
                {
                      text: '提交审核',
                      iconCls: 'icon-add',
                      handler: function () {
                          PlaningListAudit();
                      }
                  }, '-',
                {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getSelected");
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
            //删除计划单
            function DelRecord(row) {
                var selectedRow = $('#TableContainer').datagrid("getSelected");
                if (selectedRow == null) {
                    HDialog.Info("请选择需要删除的计划单");
                    return;
                }
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        if (row.AuditingState == "未启动" || row.AuditingState != "" || row.AuditingState == "已驳回") {
                            $.tool.DataGet('CsPlan', 'PlaningDel', 'Id=' + row.PlanId,
                                function Init() {
                                },
                                function callback(_Data) {
                                    $('#SearchDlg').parent().appendTo($("form:first"));
                                    if (_Data == "true") {
                                        HDialog.Info("计划单中包含计划详细信息无法删除。");
                                    }
                                    else {
                                        HDialog.Info("删除成功！");
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                        else {
                            HDialog.Info("无法删除");
                        }
                    }
                });
            }
            //加载列表
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: true,
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
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsPlan", "GetPlaningList", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();
            $('#SearchDlg').parent().appendTo($("form:first"));

            //新增 修改
            function Detail(Id, OpType) {
             
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanPlaningList_Detail.aspx?Id=' + Id + '&OpType=' + OpType, '计划单', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }
            //新增 修改
            function PlaningListAudit() {
                var w = top.$(window).width();
                var h = parent.$(window).height();

                var str = "";
                var row = $("#TableContainer").datagrid("getChecked");
                if (row.length > 0) {
                    for (var i = 0; i < row.length; i++) {
                        if (row[i].AuditingState != "已审核" && row[i].AuditingState != "审核中") {
                            str += "," + row[i].PlanId + "";
                        }
                    }
                    if (str.length > 0)
                        str = str.substr(1, str.length - 1);
                }
                else
                {
                    HDialog.Info("请选择需送审计划单!");
                    return;
                }

                if (str == "" || str == null)
                {
                    HDialog.Info("请选择需送审计划单!!");
                    return;
                }

          
                HDialog.Open(w, h, '../Plan/PlanPlaningListAudit.aspx?OpType=insert&ApplicationCode=&PlanIDList=' + str, '批量审核', true, function callback(_Data) {
                    if (_Data != '') {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        LoadList();
                    }
                });
            }

            
        </script>
    </form>
</body>
</html>
