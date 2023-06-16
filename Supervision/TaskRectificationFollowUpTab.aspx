<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskRectificationFollowUpTab.aspx.cs" Inherits="M_Main.Supervision.TaskRectificationFollowUpTab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>问题整改跟进tab</title>
    <link href="../css/base.css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.7.6/jquery.extend.js"></script>
    <link href="../css/basebootstrap.css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/self-vilidate.js" type="text/javascript"></script>
    <style type="text/css">
        td {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div style="width: 100%">
            <div style="float: left; width: 20%; border-right: 1px solid #cccccc;" class="menuDiv">
                <div style="background-color: #cccccc;" id="TreeGrid"></div>
            </div>
            <div style="float: left; width: 80%">
                <div id="tab" class="easyui-tabs">
                    <div id="tab0" issel="true" title="未验收任务" style="overflow: hidden">
                    </div>
                    <div id="tab1" issel="false" title="已验收任务" style="overflow: hidden">
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="CommId" name="CommId" />
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function InitTableHeight() {
                $("#TreeGrid").css("height", h + "px");
            }

            function LoadTree() {
                $("#TreeGrid").treegrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CSSupervision&Command=DepMenuList&' + $('#frmForm').serialize(),
                    treeField: 'text',
                    idField: 'id',
                    method: "get",
                    nowrap: false,
                    animate: false,
                    columns: [[{ title: '项目名称', field: 'text', width: 400 }]],
                    fitColumns: false,
                    singleSelect: true,
                    pagination: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: null,
                    border: false,
                    sortOrder: "asc",
                    onClickRow: function (rowData) {
                        if (rowData.children == undefined) {
                            $("#CommId").val(rowData.attributes.CommID);
                        } else {
                            $("#CommId").val('');
                        }
                        //切换项目需要重新选择标签页  否则页面不刷新  有可能有其他更好的办法  后期可优化
                        if ($("#tab0").attr("issel") == "true") {
                            $('#tab').tabs('select', 1);
                            $('#tab').tabs('select', 0);
                        }
                        if ($("#tab1").attr("issel") == "true") {
                            $('#tab').tabs('select', 0);
                            $('#tab').tabs('select', 1);
                        }
                    }
                });
            }

            $(function () {
                InitTableHeight();
                LoadTree();
                InitControl();
            });

            var OldIndex = 0;

            function InitControl() {
                var h = $(window).height();
                $("#tab0").css("height", h - 35 + "px");
                var CommId = $("#CommId").val();
                var pageName = "TaskRectificationFollowUpNotAccepted";
                var urlParam = $.param({ "CommId": CommId });
                var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../Supervision/" + pageName + ".aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
                $("#tab0").html(html);

                $('#tab').tabs({
                    height: h,
                    justified: false,
                    fit: false,
                    tabWidth:100,
                    border: false,
                    onSelect: function (title, index) {
                        var issel = $("#tab" + index).attr("issel");
                        if (issel == "false") {
                            if (index == 0) {
                                pageName = "TaskRectificationFollowUpNotAccepted"; }
                            else if (index == 1) { pageName = "TaskRectificationFollowUpAccepted"; }
                            CommId = $("#CommId").val();
                            urlParam = $.param({ "CommId": CommId });
                            var html = "<iframe scrolling=\"yes\" frameborder=\"0\" src=\"../Supervision/" + pageName + ".aspx?" + urlParam + "\" style=\"width: 100%; height: 100%;\"></iframe>";
                            $("#tab" + index).html(html);
                            $("#tab" + index).attr("issel", "true");
                        }
                        $("#tab" + OldIndex).attr("issel", "false");
                        OldIndex = index;
                    }
                });
            };

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
