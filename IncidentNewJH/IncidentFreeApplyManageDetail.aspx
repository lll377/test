<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentFreeApplyManageDetail.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentFreeApplyManageDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事延期申请详细页面</title>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-x: hidden;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header {
            border-color: #cccccc;
            padding: 0px;
            margin: 0px;
        }

        .tabs-container .panel-body {
            border-color: #cccccc;
            padding: 0px;
            margin: 0px;
        }

        .panel-body {
            padding: 0px;
            margin: 0px;
        }


        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
            margin-bottom: 1px;
            overflow: hidden;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
                border-bottom: 1px solid #cccccc;
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

        .tab-content {
            height: 100%;
        }

        #formDivCheckLevelListInfo tr td {
            border: 1px solid #cccccc;
        }

        .DialogTable {
            font-size: 12px;
            font-family: 'Microsoft YaHei UI';
            table-layout: fixed;
        }

            .DialogTable .DialogTdTitle {
                height: 25px;
                width: 100px;
                text-align: center;
            }

            .DialogTable .DialogTdContent {
                height: 25px;
                width: 180px;
                text-align: left;
            }

        .messager-body {
            padding: 15px;
        }

        .datagrid-mask-msg {
            height: auto;
        }

        .datagrid-ftable tr td {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="frmForm" method="post" runat="server">
        <input id="UserCode" type="hidden" size="1" name="UserCode" runat="server">
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="IID" type="hidden" size="1" name="IID" runat="server">
        <input id="IncidentID" type="hidden" size="1" name="IncidentID" runat="server">
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="RoomSign" name="RoomSign" runat="server" />
        <input type="hidden" id="BigReasonName" name="BigReasonName" runat="server" />
        <input type="hidden" id="BigReasonCode" name="BigReasonCode" runat="server" />
        <input type="hidden" id="SmallReasonName" name="SmallReasonName" runat="server" />
        <input type="hidden" id="SmalReasonCode" name="SmalReasonCode" runat="server" />
        <input type="hidden" id="FeesRoleCodes" name="FeesRoleCodes" runat="server" />
        <input type="hidden" id="FeesRoleCodes_Order" name="FeesRoleCodes_Order" runat="server" />
        <input type="hidden" id="CoordinateNum" name="CoordinateNum" runat="server" />
        <!-- 按钮工具栏 -->
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
        </div>
        <table id="Header_TableMain" class="DialogTable">
            <tr>
                <td class="DialogTdTitle">项目名称</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="CommName" type="text" name="CommName" style="width: 240px;" runat="server" disabled>
                </td>
                <td class="DialogTdTitle">报事编号</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" type="text" id="IncidentNum" style="color: blue; text-decoration: underline; width: 240px; cursor: pointer; border-bottom: none;"
                        onclick="ViewIncidentAccept()" name="IncidentNum" runat="server" readonly />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">发起人</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="UserName" type="text" maxlength="50" style="width: 240px;" name="UserName" runat="server" disabled></td>
                <td class="DialogTdTitle">发起时间</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="WorkStartDate" type="text" maxlength="50" style="width: 240px;" name="WorkStartDate" runat="server" disabled></td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="color: red;">标题</td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" id="Title" name="Title" data-options="required:true" maxlength="500" style="width: 91%;" runat="server" /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="color: red;">免费原因</td>
                <td class="DialogTdContent" colspan="3">
                    <textarea type="text" class="easyui-validatebox" id="DelayReason" name="DelayReason" data-options="required:true" style="width: 91%;" maxlength="1400" runat="server"></textarea>
                </td>
            </tr>
<%--            <tr>
                <td class="DialogTdTitle">处理时限</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="DealLimit" name="DealLimit" runat="server" disabled />
                </td>
                <td class="DialogTdTitle">延期前限期时间</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="MainEndDate" name="MainEndDate" runat="server" disabled />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="color: red;">延期时数</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-numberbox" id="DelayHours" data-options="min:1,required:true,onChange:YSSSChange" style="width: 240px;" maxlength="50" name="DelayHours" runat="server" />
                </td>
                <td class="DialogTdTitle" style="color: red;">延期后限期时间</td>
                <td>
                    <input type="text" class="easyui-datetimebox" id="DealyDate" maxlength="50" style="width: 240px;"
                        data-options="required:true,editable:false,onHidePanel:YSSJChange" name="DealyDate" runat="server" /></td>
            </tr>--%>
            <%--<tr>
                <td class="DialogTdTitle">附件：</td>
                <td class="DialogTdContent" colspan="3">
                    <iframe id="UploadFrame" frameborder="0" style="margin-top: 10px; height: 30px; float: left; width: 360px;" scrolling="no"></iframe>
                    <input type="button" name="fileList1" style="width: 70px; height: 25px; display: block; float: left; border: 1px solid #ccc; margin-top: 10px;" value="查看列表"
                        id="fileList1" runat="server" onclick="OnFileList();" /></td>
            </tr>--%>
        </table>
    </form>
    <script type="text/javascript">
        //$(document).ready(function () {
        //    if ($('#State').val() == "未启动" || $('#State').val() == "已退回" || $('#State').val() == "审核不通过") {
        //        $('#UploadFrame').attr("src", "../IncidentNewJH/IncidentUploadFile.aspx?DetailId=" + $('#IID').val() + "&SortName=延期申请");
        //    }
        //})

        //$('#BtnIsPrint').click(function (e) {
        //    //打印功能暂时不弄
        //});

        //延时时数改变
        function YSSSChange(newValue, oldValue) {
            var DateMainEndDate = new Date($('#MainEndDate').val());
            if (newValue != "") {
                $('#DealyDate').datetimebox("setValue", formatterDate(DateMainEndDate, newValue));
            } else {
                $('#DealyDate').datetimebox("setValue", formatterDate(DateMainEndDate, 0));
            }
        }
        function formatterDate(date, AddHours) {
            var day = date.getDate();
            var month = (date.getMonth() + 1);
            var hor = parseInt(date.getHours()) + parseInt(AddHours);
            var min = date.getMinutes();
            var sec = date.getSeconds();
            return date.getFullYear() + '-' + month + '-' + day + " " + hor + ":" + min + ":" + sec;
        }

        //延时时间改变
        function YSSJChange() {
            if ($('#DealyDate').datetimebox("getValue") != "") {
                var DateTimeNow = new Date($('#DealyDate').datetimebox("getValue"));
                var DateTimeOld = new Date($('#MainEndDate').val());
                var Hours = getIntervalHour(DateTimeOld, DateTimeNow);
                $('#DelayHours').numberbox("setValue", Hours);
            }
        }

        //计算两个时间相差了几个小时
        function getIntervalHour(startDate, endDate) {
            var ms = endDate.getTime() - startDate.getTime();
            if (ms < 0) return 0;
            return Math.floor(ms / 1000 / 60 / 60);
        }
        $("#BtnClose").click(function (e) {
            HDialog.Close('');
        });

        var IsSubmitFlag = true;
        $("input[type='submit']").click(function (e) {
            if (IsSubmitFlag == false) {
                HDialog.Info("10秒内不要重复点击");
                return false;
            }
            if (ClientClick()) {
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 10000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    return true;
                }
                else {
                    return false;
                }
            } else {
                return false;
            }
        });

        function ClientClick() {
            return true;
        }

        //查看报事详情
        function ViewIncidentAccept() {
            $.tool.DataGet('IncidentAcceptNew_Search', 'IncidentSearch', "IncidentID=" + $('#IncidentID').val() + "&page=1&rows=1",
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != "") {
                        var Obj = JSON.parse(_Data);
                        if (Obj.rows.length > 0) {
                            Cache.SetData("IncidentInfos", JSON.stringify(Obj.rows[0]));
                            var content = '../IncidentNewJH/IncidentControlManage.aspx?IncidentID=' + $('#IncidentID').val();
                            HDialog.Open('1200', '600', content, '报事查询详细记录', true, function callback(_Data) {
                                Cache.SetData("IncidentInfos", '');
                            });
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        }
        function OnFileList() {
            HDialog.Open(600, 450, '../IncidentNew/IncidentDetailFiles.aspx?DetailId=' + $("#IID").val(), '查看附件', true, function callback(_Data) {
            });
        }

    </script>
</body>
</html>

