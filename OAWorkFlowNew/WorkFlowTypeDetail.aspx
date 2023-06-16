<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowTypeDetail.aspx.cs" Inherits="M_Main.OAWorkFlowNew.WorkFlowTypeDetail" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">

        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">流程分类名称
                </td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="FlowSortName" name="FlowSortName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">是否允许修改
                </td>
                <td class="DialogTdCommonContent">
                    <select id="IsUpdate" name="IsUpdate" runat="server">
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">排列序号</td>
                <td class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="Sort" name="Sort" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">禁止提交时间</td>
                <td class="DialogTdCommonContent">每月<input style="height: 19px; width: 50px;" id="UseStartDate" onclick="WdatePicker({ dateFmt: 'dd' })" readonly size="6" name="UseStartDate" runat="server">
                    号至
                <input style="height: 19px; width: 50px;" id="UseEndDate" onclick="WdatePicker({ dateFmt: 'dd' })" readonly size="6" name="UseEndDate" runat="server">
                    号
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">不受限制人员(<a href="#" onclick="Clear();">清空</a>)</td>
                <td class="DialogTdContent">
                    <textarea id="UseUserNameList" name="UseUserNameList" runat="server" class="easyui-validatebox" style="height: 50px;"></textarea>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">绑定业务类别
                </td>
                <td class="DialogTdCommonContent">
                    <select id="Filter" name="Filter" runat="server">
                        <option value=""></option>
                        <option value="09">人事管理(旧)</option>
                        <option value="0901">&nbsp;&nbsp;人事管理-人事需求</option>
                        <option value="0909">&nbsp;&nbsp;人事管理-人事招聘</option>
                        <option value="0902">&nbsp;&nbsp;人事管理-入职审批</option>
                        <option value="0903">&nbsp;&nbsp;人事管理-转正审批</option>
                        <option value="0904">&nbsp;&nbsp;人事管理-调整审批</option>
                        <option value="0905">&nbsp;&nbsp;人事管理-合同审批</option>
                        <option value="0906">&nbsp;&nbsp;人事管理-奖惩审批</option>
                        <option value="0907">&nbsp;&nbsp;人事管理-请假审批</option>
                        <option value="0908">&nbsp;&nbsp;人事管理-人员离职</option>
                        <option value="0910">&nbsp;&nbsp;人事管理-年假延期</option>
                        <option value="0911">&nbsp;&nbsp;人事管理-工资审核</option>
                        <option value="0912">&nbsp;&nbsp;人事管理-加班申请</option>
                        <option value="0913">&nbsp;&nbsp;人事管理-调班申请</option>
                        <option value="0914">&nbsp;&nbsp;人事管理-外出申请</option>
                        <option value="0915">&nbsp;&nbsp;人事管理-未打卡说明</option>
                        <option value="0916">&nbsp;&nbsp;人事管理-排班计划审批</option>
                        <option value="0917">&nbsp;&nbsp;人事管理-销假审批</option>

                        <option value="01">物资管理</option>
                        <option value="0101">&nbsp;&nbsp;采购申请-计划采购</option>
                        <option value="0102">&nbsp;&nbsp;采购申请-零星采购</option>
                        <option value="0103">&nbsp;&nbsp;采购申请-紧急采购</option>
                        <option value="0104">&nbsp;&nbsp;采购申请-专项采购</option>
                        <option value="0105">&nbsp;&nbsp;采购申请-集中采购</option>
                        <option value="02">&nbsp;&nbsp;计划采购</option>
                        <option value="03">&nbsp;&nbsp;物资入库</option>
                        <option value="04">&nbsp;&nbsp;物资出库</option>
                        <option value="06">&nbsp;&nbsp;物资调拨</option>
                        <option value="05">&nbsp;&nbsp;物资盘点</option>
                        <%--<option value="12">&nbsp;&nbsp;物资监控</option>--%>

                        <option value="08">计划管理</option>
                        <option value="0801">&nbsp;&nbsp;计划编制审批</option>
                        <option value="0804">&nbsp;&nbsp;计划编制批量审批</option>
                        <option value="0802">&nbsp;&nbsp;计划调整审批</option>
                        <option value="0803">&nbsp;&nbsp;计划考评审批</option>
                        
                        <option value="10">预算管理</option>
                        <option value="1001">&nbsp;&nbsp;预算计划审批</option>
                        <option value="1002">&nbsp;&nbsp;预算调整审批</option>
                        <option value="1003">&nbsp;&nbsp;预算执行审批</option>

                        <option value="07">成本管理</option>
                        <option value="0701">&nbsp;&nbsp;外委合同签订</option>
                        <option value="0702">&nbsp;&nbsp;外委合同变更</option>
                        <option value="0703">&nbsp;&nbsp;外委合同终止</option>
                        <option value="0704">&nbsp;&nbsp;资金计划申报</option>
                        <option value="0705">&nbsp;&nbsp;资金计划审批</option>
                        <option value="0706">&nbsp;&nbsp;请付审批</option>
                        <option value="0710">&nbsp;&nbsp;摊销审批</option>
                        <option value="0707">&nbsp;&nbsp;借款审批</option>
                        <%--<option value ="0708">&nbsp;&nbsp;单个合同变更</option>
                        <option value ="0709">&nbsp;&nbsp;单个合同终止</option>--%>
                        
                        <option>多经管理</option>
                        <option value="1201">&nbsp;&nbsp;多经合同签订</option>
                        <option value="1202">&nbsp;&nbsp;多经合同变更</option>
                        <option value="1203">&nbsp;&nbsp;多经合同执行</option>
                        <option value="1206">&nbsp;&nbsp;多经合同提成</option>
                        
                        <option>租赁管理(旧)</option>
                        <option value="1204">&nbsp;&nbsp;租赁合同签订</option>
                        <option value="1205">&nbsp;&nbsp;租赁合同变更</option>

                        <option>租赁管理(新)</option>
                        <option value="1260">&nbsp;&nbsp;认租协议签订</option>
                        <option value="1261">&nbsp;&nbsp;租赁合同新签</option>
                        <option value="1262">&nbsp;&nbsp;租赁合同续签</option>
                        <option value="1263">&nbsp;&nbsp;租赁合同变更</option>
                        <option value="1264">&nbsp;&nbsp;租赁合同提成</option>

                        <option value="11">设备管理</option>
                        <option value="1101">&nbsp;&nbsp;设备异动审批</option>

                        <option value="13">应急管理</option>
                        <option value="1301">&nbsp;&nbsp;突发事件报告</option>

                    </select>
                </td>
            </tr>
            <tr  >
                <td class="DialogTdTitle">流程参考文档</td>
                <td class="DialogTdContent">
                    <a href="#" onclick="OpenWebOffice();">编辑文档</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 2px;"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
        <input type="hidden" id="WebOfficeUserCode" name="WebOfficeUserCode" runat="server" />
        <input type="hidden" id="FN" name="FN" runat="server" />
        <input type="hidden" id="InfoId" name="InfoId" runat="server" />
        <input type="hidden" id="Pid" name="Pid" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="DocumentUrl" name="DocumentUrl" runat="server" />
        <input type="hidden" id="SystemSign" name="SystemSign" runat="server" />
        <input type="hidden" id="UseUserList" name="UseUserList" runat="server" />
        <script type="text/javascript">
            $("#BtnSave").click(function () {
                $.tool.DataPostChk('frmForm', 'WorkFlowManage', 'Save', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            HDialog.Close(_Data);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            });

            function Clear() {
                document.all.UseUserNameList.value = "";
                document.all.UseUserList.value = "";
            }
            $("#BtnReturn").click(function () {
                HDialog.Close('');
            });
            //选择人员
            $("#UseUserNameList").click(function () {
                HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?Cmd=3&MultiLine=1&WorkInfoId=-1&random=' + Math.random(), '选择人员', false, function callback(_Data) {
                    if (_Data != '') {
                        var Ret = Cache.GetData("SelOrp.aspx_Return");
                        var obj = JSON.parse(Ret);
                        var TempUserList = "";
                        if (obj != null) {
                            var arrUserList = obj[0].split('|');
                            var arrUser = new Array();
                            for (var i = 0; i < arrUserList.length; i++) {
                                arrUser = arrUserList[i].split(',');
                                TempUserList = TempUserList + arrUser[1] + ",";
                            }
                            TempUserList = TempUserList.substring(0, TempUserList.length - 1);
                            document.all.UseUserNameList.value = obj[1];
                            document.all.UseUserList.value = TempUserList;
                        }
                    }
                });
            });

            //打开WEBOFFICE编辑文档
            function OpenWebOffice() {
                var oprType = 2;
                var strFileName = document.getElementById("DocumentUrl").value;
                var u = document.getElementById("WebOfficeUserCode").value;
                var strPage = "../OAWebOffice/WebOffice.aspx?oprType=" + oprType + "&FileName=" + strFileName + "&UserCode=" + u + "&random=" + Math.random();
                window.open(strPage);
            }
        </script>
    </form>
</body>
</html>
