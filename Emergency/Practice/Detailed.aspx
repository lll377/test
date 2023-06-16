<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detailed.aspx.cs" Inherits="M_Main.Visit.Practice.Detailed" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>应急演练登记详情</title>
    <link href="../../css/base.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../../Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="../../css/basebootstrap.css" rel="stylesheet" />

    <script src="../../jscript/self-vilidate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../jscript/help.js"></script>
    <script type="text/javascript" src="../../jscript/jquery.form.js"></script>
    <script type="text/javascript" src="../../jscript/DateFormat.js"></script>
    <style type="text/css">
        .divPrint {
            width: 100%;
            text-align: right;
            padding-right: 46px;
            height: 40px;
        }

        .bootstrap_table tr td.title {
            width: 10%;
            text-align: right;
            color: #7f7f7f;
            font-weight: bold;
        }

        .bootstrap_table tr td.text {
            padding-left: 20px;
            width: 40%;
            text-align: left;
        }
    </style>
</head>
<body>
    <div style="padding: 5px;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">应急演练计划</legend>
            <form id="mainForm" runat="server">
                <table class="border-table" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>
                            <span>项目名称</span>
                        </th>
                        <td>
                            <div id="CommName"></div>
                        </td>
                        <th><span>应急类型</span></th>
                        <td>
                            <div id="EmergencyTypeName"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>计划开始时间</span></th>
                        <td>
                            <div id="PlanBeginTime"></div>
                        </td>
                        <th><span>计划结束时间</span></th>
                        <td>
                            <div id="PlanEndTime"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>计划演练内容</span></th>
                        <td colspan="3">
                            <div id="PlanPracticeContent" style="white-space: pre-wrap;max-height:60px;overflow:auto;"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>责任人</span></th>
                        <td>
                            <div id="DutyUserName"></div>
                        </td>
                        <th><span>计划备注</span></th>
                        <td>
                            <div id="PlanRemark"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><span>计划审核人</span></th>
                        <td>
                            <div id="PlanAuditUserName"></div>
                        </td>
                        <th><span>计划审核状态</span></th>
                        <td>
                            <div id="PlanAuditState"></div>
                        </td>
                    </tr>
                </table>
            </form>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">应急演练结果</legend>
            <table class="border-table" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th>
                        <span>实际开始时间</span>
                    </th>
                    <td>
                        <div id="ActualStartTime"></div>
                    </td>
                    <th><span>实际结束时间</span></th>
                    <td>
                        <div id="ActualEndTime"></div>
                    </td>
                </tr>
                <tr>
                    <th><span>实际演练内容</span></th>
                    <td colspan="3">
                        <div id="ActualPracticeContent" style="white-space: pre-wrap;max-height:60px;overflow:auto;"></div>
                    </td>
                </tr>
                <tr>
                    <th><span>是否完成</span></th>
                    <td>
                        <div id="IsComplete"></div>
                    </td>
                    <th><span>结果备注</span></th>
                    <td>
                        <div id="ActualResultRemark"></div>
                    </td>
                </tr>
                <tr>
                    <th><span>结果审核人</span></th>
                    <td>
                        <div id="ActualResultAuditUserName"></div>
                    </td>
                    <th><span>结果审核状态</span></th>
                    <td>
                        <div id="ActualResultAuditState"></div>
                    </td>
                </tr>
            </table>
        </fieldset>

        <fieldset class="frame-fieldset">
            <legend class="frame-legend">演练方案</legend>
            <div id="mianScheme">
                <table id="dgScheme" border="0" cellspacing="0" cellpadding="0"></table>
            </div>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">签到记录</legend>
            <table id="dgRecord" border="0" cellspacing="0" cellpadding="0">
            </table>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">演练照片</legend>
            <table id="dgPhoto" border="0" cellspacing="0" cellpadding="0">
            </table>
        </fieldset>
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">演练总结</legend>
            <table id="dgSummary" border="0" cellspacing="0" cellpadding="0">
            </table>
        </fieldset>
    </div>
    <input type="hidden" name="ID" id="ID" />
    <input type="hidden" name="KeyID" id="KeyID" />

    <script type="text/javascript">

        $(function () {
            InitPage();
        });

        function InitPage() {
            var w = $(window).width();
            $("#mianScheme").width(w - 50);
            var ID = $.getUrlParam("ID");
            $("#ID").val(ID);
            $("#KeyID").val(ID);
            InitData();
            InitDataGrid("dgScheme", "演练方案", "Init");
        }
        function InitData() {
            $.dataPostJson('Emergency_Practice', 'GetModel', $.getParam(), true, false,
                function Init() {
                },
                function callback(data) {
                    data.PlanBeginTime = formatDate(data.PlanBeginTime, 'yyyy-MM-dd HH');
                    data.PlanEndTime = formatDate(data.PlanEndTime, 'yyyy-MM-dd HH');
                    data.ActualStartTime = formatDate(data.ActualStartTime, 'yyyy-MM-dd HH');
                    data.ActualEndTime = formatDate(data.ActualEndTime, 'yyyy-MM-dd HH');
                    $.setParam(data);
                },
                function completeCallback() {
                }, function errorCallback() {
                });
        }
        var column = [[
            {
                field: 'FileCode', title: '附件编号', width: 100, align: 'left', sortable: false, formatter: function (value, row, index) {
                    var arr = value.split('.');
                    return arr[0];
                }
            },
            {
                field: 'FileName', title: '附件名称', width: 200, align: 'left', sortable: false, formatter: function (value, row, index) {
                    value = GetAHtml(row.FilePath, value);
                    return value;
                }
            },
            {
                field: 'FileType', title: '附件类型', width: 40, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'AddTime', title: '添加日期', width: 60, align: 'center', sortable: false, formatter: function (value, row, index) {
                    return $.dateFormat(value);
                }
            }
        ]];
        function GetAHtml(url, fileName) {
            var html = "";
            if (url && url != "") {
                // url = "http://120.77.74.255:8001/ErpUploadFile/1853/RoomAdjunct/2018/05/18531753454642601.pdf";
                var arr = url.split('/');
                var name = arr[arr.length - 1];
                arr = name.split('.');
                var IdNew = arr[arr.length - 2];
                html = "<a target=\"_blank\" id=\"11831617369\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + fileName + "</a>";
                //html = "<a target=\"_blank\" id=\"" + IdNew + "\" href=\"" + url + "\" class=\"HrefStyle\" url=\"" + url + "\">" + name + "</a><span  style='cursor:hand' onclick=\"Delete(this,'" + IdNew + "','" + url + "','" + name + "','" + IdNew + "');\">&nbsp;<img src='../Images/cancel.png' style='width:12px;height:12px;cursor:pointer'  title='删除'/>&nbsp;</span><input id=\"" + IdNew + "\" Type='hidden' value='" + url + "'>"
            }
            return html;
        }
        var loadType = "Init";
        function InitDataGrid(dgName, typeName) {
            $("#uploadFile").textbox('disableValidation');
            $("#FileName").textbox('disableValidation');
            $("#" + dgName).datagrid({
                url: '/HM/M_Main/HC/DataPost.aspx',
                method: "post",
                height: 200,
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                idField: "ID",
                columns: column,
                rownumbers: true,
                fitColumns: true,
                checkbox: true,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pagination: true,
                width: "100%",
                sortOrder: "desc",
                remoteSort: false,
                rowStyler: function (index, row) {

                },
                onSelect: function (index, row) {

                },
                onBeforeLoad: function (param) {
                    param.Type_Name = typeName;
                    param = $.getDataGridParam("Emergency_File", "GetList", param);


                },
                onLoadSuccess: function (data) {
                    $("#" + dgName).datagrid('resize');
                    if (loadType == "Init") {
                        if (dgName == "dgScheme") { InitDataGrid("dgRecord", "签到记录", "Init"); }
                        else if (dgName == "dgRecord") { InitDataGrid("dgPhoto", "演练照片", "Init"); }
                        else if (dgName == "dgPhoto") { InitDataGrid("dgSummary", "演练总结", "Init"); }
                    }

                },
                onLoadError: function (data) {

                }
            });
            $("#" + dgName).datagrid('clearSelections');
            $("#" + dgName).datagrid('clearChecked');
        }
    </script>
</body>
</html>
