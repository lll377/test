<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskStandardList.aspx.cs" Inherits="M_Main.HouseInspect.TaskStandardList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <title>标准详情</title>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="TaskId" name="TaskId" runat="server" />
        <input type="hidden" id="HouseId" name="HouseId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="Batch" name="Batch" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="Profession" name="Profession" runat="server" />
        <input type="hidden" id="DutyUnitId" name="DutyUnitId" runat="server" />
        <input type="hidden" id="RectificationUnitId" name="RectificationUnitId" runat="server" />
        <input type="hidden" id="RoleCode" name="RoleCode" runat="server" />
        <input type="hidden" id="HiCommID" name="HiCommID" runat="server" />

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer"></div>
        <script type="text/javascript">
            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var column = [[
                { field: 'Id', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'TaskId', title: 'TaskId', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'ObjectId', title: '查验对象Id', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'pname', title: '查验房间/公区', width: 120, align: 'left', sortable: true },
                { field: 'ObjectName', title: '查验对象', width: 120, align: 'left', sortable: true },
                { field: 'StandardId', title: '查验标准Id', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'StandardCode', title: '标准编码', width: 100, align: 'left', sortable: true },
                { field: 'Content', title: '标准内容', width: 220, align: 'left', sortable: true },
                { field: 'Profession', title: '所属专业', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'ProfessionName', title: '所属专业', width: 100, align: 'left', sortable: true },
                { field: 'Importance', title: '重要程度', width: 25, align: 'left', sortable: true, hidden: true },
                { field: 'ImportanceName', title: '重要程度', width: 100, align: 'left', sortable: true },
                {
                    field: 'IsInspect', title: '是否查验', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var result = "否";
                        if (row.IsInspect == "1") {
                            result = "是";
                        }
                        return result;
                    }
                },
                {
                    field: 'IsQualified', title: '合格/不合格/甩项', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var result = "";
                        if (row.IsQualified == "1") {
                            result = "合格";
                        }
                        if (row.IsQualified == "2") {
                            result = "甩项";
                        }
                        if (row.IsQualified == "0") {
                            result = "不合格";
                        }
                        return result;
                    }
                },
                { field: 'ProblemType', title: '问题类型', width: 30, align: 'left', sortable: true, hidden: true },
                { field: 'ProblemTypeName', title: '问题类型', width: 100, align: 'left', sortable: true },
                { field: 'UnqualifiedType', title: '不合格原因', width: 80, align: 'left', sortable: true, hidden: true },
                { field: 'ProblemLevelName', title: '问题级别', width: 80, align: 'left', sortable: true },
                { field: 'TimeLimit', title: '整改时限（天）', width: 80, align: 'left', sortable: true },
                { field: 'ProblemContent', title: '问题描述', width: 220, align: 'left', sortable: true },
                {
                    field: 'ProblemPic', title: '问题图片', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href=\"#\" onclick=\"PicDetail('" + row.Id + "','" + row.CommId+"')\">查看</a>";
                        return str;
                    }
                },
                {
                    field: 'IsCheck', title: '是否验收', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var result = "否";
                        if (row.IsCheck == "1") {
                            result = "是";
                        }
                        if (row.IsInspect == "0") {//未查验任务没有验收状态
                            result = "";
                        }
                        if (row.IsQualified == "1") {//合格任务没有验收状态
                            result = "";
                        }
                        return result;
                    }
                }
            ]];

            function PicDetail(Id, CommId) {
                $('.easyui-dialog').parent().appendTo($("form:first"));
                HDialog.Open(600, 450, '../HouseInspect/FileList.aspx?PkId=' + Id + "&HiCommID=" + CommId, '问题图片', false, function callback(_Data) {
                });
            }

            function LoadList() {
                $("#TaskId").val(GetQueryString("TaskId"));
                $("#HouseId").val(GetQueryString("HouseId"));
                $("#OpType").val(GetQueryString("OpType"));
                $("#CommID").val(GetQueryString("CommID"));
                $("#Batch").val(GetQueryString("Batch"));
                $("#Profession").val(GetQueryString("Profession"));
                $("#DutyUnitId").val(GetQueryString("DutyUnitId"));
                $("#RectificationUnitId").val(GetQueryString("RectificationUnitId"));
                $("#RoleCode").val(GetQueryString("RoleCode"));
                $("#HiCommID").val(GetQueryString("HiCommID"));
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetTaskStandardList&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    width: "100%",
                    toolbar: null,
                    sortOrder: "asc"
                });
            }

            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
