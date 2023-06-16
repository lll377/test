<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitingContentDetail.aspx.cs" Inherits="M_Main.Visit.VisitingContentDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>按拜访内容查询</title>
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
            width: 300px;
            height: 70px;
        }

        .SearchTable {
            width: 300px;
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
    <form id="frmFrom" runat="server">
        <input type="hidden" id="PlanID" name="PlanID" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">问题名称</td>
                    <td class="TdContentSearch">
                        <input type="text" id="IssueName" name="IssueName" class="easyui-validatebox" maxlength="100" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="Clear()">清空</a>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">

            function Clear() {
                $("#IssueName").val("");
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h - 2 + "px");
            }

            var column = [[
                { field: 'IssueTypeName', title: '问题类别', width: 120, align: 'left', sortable: true },
                { field: 'IssueName', title: '问题名称', width: 180, align: 'left', sortable: true },
                { field: 'IssueProperty', title: '问题属性', width: 120, align: 'left', sortable: true },
                { field: 'IssueStandardScore', title: '问题标准分', width: 100, align: 'left', sortable: true },
                { field: 'VisitCount', title: '拜访户数', width: 100, align: 'left', sortable: true },
                { field: 'IssueActualScore', title: '问题实得分', width: 100, align: 'left', sortable: true },
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
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    singleSelect: true,
                    remoteSort: false,
                    columns: column,
                    fitColumns: true,
                    rownumbers: true,
                    pagination: false,
                    toolbar: toolbar,
                    border: false,
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParamNoPage("Visit", "GetVisitingContentDetailList", "TableContainer", param);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function GetOptionsColumn() {
                $.tool.DataPostJson('Visit', 'GetVisitingContentDetailOptionsColumn', $.JQForm.GetStrParam(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            var ReturnJson = _Data;// eval("(" + _Data.replace(/\\/g, "/") + ")");
                            var columnPush;
                            for (var i = 0; i < ReturnJson.length; i++) {
                                columnPush = { "field":  ''+ReturnJson[i]["Sort"]+'', "title": ReturnJson[i]["OptionsSort"] + '（%）', "width": 100, "align": 'left', "sortable": true };
                                column[0].push(columnPush);
                            }
                           //alert(JSON.stringify(column));
                        }
                        LoadList();
                    },
                    function completeCallback() {
                    }, function errorCallback() {
                    });
            }

            //页面初始化
            $(function () {
                InitTableHeight();
                GetOptionsColumn();
               // LoadList();
            });
        </script>
    </form>
</body>
</html>
