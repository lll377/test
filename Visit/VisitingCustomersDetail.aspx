<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitingCustomersDetail.aspx.cs" Inherits="M_Main.Visit.VisitingCustomersDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>按拜访客户查询</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 900px;
            height: 150px;
        }

        .SearchTable {
            width: 900px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 13%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        #CommName {
            width: 91%;
            height: 40px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input id="PlanID" type="hidden" runat="server" name="PlanID" />
    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
    </div>
    <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
        <form id="frmFrom" runat="server">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RegionName" name="RegionName" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">楼宇名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="BuildName" name="BuildName" class="easyui-validatebox" runat="server" /></td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input type="text" id="RoomSign" name="RoomSign" class="easyui-validatebox" runat="server" />
                    </td>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CustName" name="CustName" class="easyui-validatebox" runat="server" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">拜访人</td>
                    <td class="TdContentSearch">
                        <input type="text" id="VisitUserName" name="VisitUserName" runat="server" /></td>
                    <td class="TdTitle">是否上传附件</td>
                    <td class="TdContentSearch">
                        <select id="IsAttachment" name="IsAttachment" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否提交报事</td>
                    <td class="TdContentSearch">
                        <select id="IsIncident" name="IsIncident" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否审核</td>
                    <td class="TdContentSearch">
                        <select id="IsExamine" name="IsExamine" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option value="全部">全部</option>
                            <option value="0">否</option>
                            <option value="1">是</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">完成时间</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CompleteTimeStart" name="CompleteTimeStart" class="easyui-datebox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">至</td>
                    <td class="TdContentSearch">
                        <input type="text" id="CompleteTimeEnd" name="CompleteTimeEnd" class="easyui-datebox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                    <td class="TdTitle"></td>
                    <td class="TdContentSearch"></td>
                </tr>
                <tr>
                    <td colspan="8" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="test()">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h - 2 + "px");
        }
        function test() {
            //var PlanIDStr = "";
            //if ($('#PlanID').val() != "") {
            //    PlanIDStr = $('#PlanID').val();
            //}
            $('#frmFrom').form('clear');
            //$('#PlanID').val(PlanIDStr);
            $('#IsAttachment').combobox("setValue", "全部");
            $('#IsIncident').combobox("setValue", "全部");
            $('#IsExamine').combobox("setValue", "全部");
        }

        var frozenColumns = [[
            { field: 'RegionName', title: '组团区域', width: 100, align: 'left', sortable: true },
            { field: 'BuildName', title: '楼宇名称', width: 100, align: 'left', sortable: true },
            {
                field: 'RoomSign', title: '房屋编号', width: 300, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return "<a style=\"color:blue\" href=\"javascript:void(0);\" onclick=\"Detail('" + row.ID + "','" + row.PlanID + "');\">" + row.RoomSign + "</a>";
                }
            }
        ]];
        var column = [[
            { field: 'CustName', title: '业主名称', width: 160, align: 'left', sortable: true },
            { field: 'AppointmentUserName', title: '预约人', width: 90, align: 'left', sortable: true },
            { field: 'AppointmentObject', title: '预约对象', width: 160, align: 'left', sortable: true },
            { field: 'AppointmentTime', title: '预约时间', width: 140, align: 'left', sortable: true },
            { field: 'AppointmentVisitWayName', title: '预约拜访方式', width: 140, align: 'left', sortable: true },
            { field: 'VisitUserName', title: '拜访人', width: 90, align: 'left', sortable: true },
            { field: 'InterviewedObject', title: '受访对象', width: 160, align: 'left', sortable: true },
            { field: 'RelationsWithOwners', title: '与业主关系', width: 90, align: 'left', sortable: true },
            { field: 'ContactTelephone', title: '联系电话', width: 120, align: 'left', sortable: true },
            { field: 'VisitWayName', title: '拜访方式', width: 140, align: 'left', sortable: true },
            { field: 'CompleteTime', title: '完成时间', width: 140, align: 'left', sortable: true },
            {
                field: 'SignatureImg', title: '签名', width: 90, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var SignatureImg = "无";
                    if (row.SignatureImg != "")
                    {
                        SignatureImg = "<a style=\"color:blue\" target=_blank href=\"" + row.SignatureImg + "\">查看签名</a>";
                    }
                    return SignatureImg;
                }
            },
            {
                field: 'FileCount', title: '附件', width: 90, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return "<a style=\"color:blue\" href=\"javascript:void(0);\" onclick=\"ViewFile('" + row.ID + "','" + row.PlanID + "');\">查看附件(" + row.FileCount + ")</a>";
                }
            },
            {
                field: 'InicdentCount', title: '报事', width: 90, align: 'left', sortable: true, formatter: function (value, row, index) {
                    return "<a style=\"color:blue\" href=\"javascript:void(0);\" onclick=\"ViewIncident('" + row.ID + "','" + row.PlanID + "');\">查看报事(" + row.InicdentCount + ")</a>";
                }
            },
            { field: 'IsExamineName', title: '是否审核', width: 90, align: 'left', sortable: true },
            { field: 'ExamineUserName', title: '审核人', width: 90, align: 'left', sortable: true },
            { field: 'ExamineTime', title: '审核时间', width: 90, align: 'left', sortable: true },
            { field: 'QuestionnaireRealScore', title: '问卷实得分', width: 90, align: 'left', sortable: true }
        ]];

        var toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        //查看问卷详情
        function Detail(ID, PlanID) {
            var param = { "OpType": "Edit", "ID": ID, "PlanID": PlanID };
            HDialog.Open(900, 520, '../Visit/VisitingCustomersDetail/Edit.aspx?' + $.param(param), "审核", true, function callback(data) {
                //if (isValueNull(data)) {
                LoadList();
                //}
            });
        }
        //查看附件
        function ViewFile(ID, PlanID) {
            HDialog.Open(600, 450, '../Visit/VisitUploadView.aspx?KeyID=' + ID, '查看附件', false, function callback(_Data) {
            });
        }
        //查看报事
        function ViewIncident(ID, PlanID) {
            HDialog.Open(800, 600, '../Visit/VisitIncidentView.aspx?KeyID=' + ID, '查看报事', false, function callback(_Data) {
            });
        }

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: 50,
                pageList: [50, 100, 300],
                singleSelect: true,
                remoteSort: false,
                frozenColumns: frozenColumns,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                pagination: true,
                toolbar: toolbar,
                border: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Visit", "GetVisitingCustomersDetailList", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        });

    </script>
</body>
</html>
