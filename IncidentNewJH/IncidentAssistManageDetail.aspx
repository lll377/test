<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAssistManageDetail.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentAssistManageDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事协助申请详细</title>
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
        }

            .DialogTable .DialogTdTitle {
                height: 25px;
                width: 10%;
                text-align: center;
            }

            .DialogTable .DialogTdContent {
                height: 25px;
                width: 15%;
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
<body>
    <form id="RenoCustAuditManage" method="post" runat="server">

        <input id="UserCode" type="hidden" size="1" name="UserCode" runat="server">
        <input id="DealUserCode" type="hidden" size="1" name="DealUserCode" runat="server">
        <input id="hiOPType" type="hidden" size="1" name="hiOPType" runat="server">
        <input id="IID" type="hidden" size="1" name="IID" runat="server">
        <input id="IncidentID" type="hidden" size="1" name="IncidentID" runat="server">
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <input type="hidden" id="AssistPersonIDs" name="AssistPersonIDs" runat="server" />
        <input type="hidden" id="HiAssistNames" name="HiAssistNames" runat="server" />
        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="AssistRoleCode" name="AssistRoleCode" runat="server" />
        <input type="hidden" id="FeesRoleCodes" name="FeesRoleCodes" runat="server" />
        <input type="hidden" id="FeesRoleCodes_Order" name="FeesRoleCodes_Order" runat="server" />
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />
        <input type="hidden" id="CoordinateNum" name="CoordinateNum" runat="server" />
        <input id="CoorganizerUser" type="hidden" name="CoorganizerUser" runat="server" />
        <input id="CoorganizerUserCode" type="hidden" name="CoorganizerUserCode" runat="server" />
        <!-- 可协助岗位 -->

        <!-- 按钮工具栏 -->
        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="BtnCheckNoPass" type="button" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onclientclick="ClientClick()" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
        </div>
        <table id="Header_TableMain" class="DialogTable">
            <tr>
                <td class="DialogTdTitle" style="color: red;">标题</td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" id="Title" name="Title" maxlength="500" style="width: 91%;" runat="server" /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle">项目名称</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="CommName" type="text" maxlength="50" name="CommName" runat="server" disabled>
                </td>
                <td class="DialogTdTitle">报事编号</td>
                <td class="DialogTdContent">
                    <input id="IncidentNum" type="hidden" name="IncidentNum" runat="server" />
                    <a style="color: blue" id="IncidentNumShow" name="IncidentNumShow" onclick="OnIncident();" href="javascript:void(0);" runat="server"></a>
                </td>

            </tr>
            <tr>
                <td class="DialogTdTitle">发起人</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="UserName" type="text" maxlength="50" name="UserName" runat="server" disabled /></td>
                <td class="DialogTdTitle">发起时间</td>
                <td class="DialogTdContent">
                    <input class="easyui-validatebox" id="WorkStartDate" type="text" maxlength="50" name="WorkStartDate" runat="server" disabled /></td>
            </tr>
            <tr>
                <td class="DialogTdTitle" style="color: red;">协助原因</td>
                <td class="DialogTdContent" colspan="3">
                    <input type="text" class="easyui-validatebox" id="AssistReason" name="AssistReason" maxlength="500" style="width: 91%;" runat="server" />
                </td>

            </tr>
            <tr>
                <td class="DialogTdTitle" style="color: red;">申请协助人数</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="AssistPeopleCount" onkeyup="clearNoNum(this)" style="" maxlength="50" name="AssistPeopleCount" runat="server" />
                </td>
            </tr>
            <tr class="none">
                <td class="DialogTdTitle" style="color: red;">协助人</td>
                <td class="DialogTdContent" colspan="2">
                    <input type="text" class="easyui-validatebox" id="AssistNames"
                        style="width: 99%; margin-top: 10px; float: left;" name="AssistNames" runat="server" readonly />
                </td>
                <td class="DialogTdContent">
                    <input type="button" name="fileList1" class="button" style="width: 70px; height: 25px; display: block; float: left; border: 1px solid #ccc; margin-top: 10px;"
                        value="选择协助人"
                        id="btnPersonSet" runat="server" onclick="OnPersonSet();" />
                </td>

            </tr>
        </table>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($('#State').val() == "未启动" || $('#State').val() == "已退回" || $('#State').val() == "审核不通过") {
                //  $('#UploadFrame').attr("src", "../IncidentNew/IncidentUploadFile.aspx?DetailId=" + $('#IID').val() + "&SortName=协助申请");
            }

            if ($('#hiOPType').val() == 'insert') {
                $('.none').hide();
            }
        })
        function OnIncident() {
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

        function OnPersonSet() {
            var UserCodeList = "";
            var varReturn = "";
            var ObjectName = "";
            HDialog.Open('700', '600', "../IncidentNewJH/IncidentAssistPeople.aspx?Ram=" + Math.random() + "&BigCorpTypeID=" + $("#BigCorpTypeID").val()
                , '选择人员', false, function callback(_Data) {
                    varReturn = _Data;
                    if (varReturn != "") {
                        var personlist = varReturn.split("|");
                        for (var i = 0; i < personlist.length; i++) {
                            var person = personlist[i].split(",");
                            if (person[1] != $("#DealUserCode").val()) {
                                ObjectName += "," + person[0];
                                UserCodeList += "," + person[1];
                            } else {
                                HDialog.Info("当前处理人:" + person[0] + ",不能作为协助人");
                            }
                        }

                        if (ObjectName != ",") {
                            ObjectName = ObjectName.substr(1, ObjectName.length);
                        } if (UserCodeList != "") {
                            UserCodeList = UserCodeList.substr(1, UserCodeList.length);
                        }
                        $("#AssistNames").val($('#CoorganizerUser').val() + ',' + ObjectName);
                        $("#HiAssistNames").val($('#CoorganizerUser').val() + ',' + ObjectName);
                        $("#AssistPersonIDs").val($('#CoorganizerUserCode').val() + ',' + UserCodeList);
                    }
                });
        }

        $('#BtnIsPrint').click(function (e) {
            //打印功能暂时不弄
        });

        $("#BtnClose").click(function (e) {
            HDialog.Close('');
        });
        function clearNoNum(obj) {
            obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符  
            obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的  
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');//只能输入两个小数  
            if (obj.value.indexOf(".") < 0 && obj.value != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
                obj.value = parseFloat(obj.value);
            }
        }

        var IsSubmitFlag = true;
        $("input[type='submit']").click(function (e) {
            if (IsSubmitFlag == false) {
                HDialog.Info("30秒内不要重复点击");
                return false;
            }
            if (ClientClick()) {
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 30000);
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
            //alert($('#AssistNames').val());
            if ($('#hiOPType').val() == 'edit') {
                if ($('#AssistPersonIDs').val() == "") {
                    HDialog.Info("请选择协助人");
                    return false;
                }
            }
            return true;
        }

        function OnFileList() {
            HDialog.Open(600, 450, '../IncidentNew/IncidentDetailFiles.aspx?DetailId=' + $("#IID").val(), '查看附件', true, function callback(_Data) {
            });
        }

    </script>
</body>
</html>
