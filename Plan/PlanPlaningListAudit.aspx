<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanPlaningListAudit.aspx.cs" Inherits="M_Main.Plan.PlanPlaningListAudit" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>计划单编制批量审批</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript/Guid.js"></script>
    <script type="text/javascript" src="../Jscript/Taxes.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link href="../css/framedialog_eightcol_form.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow-y: auto;
        }

        .panel-header {
            background: #f5f5f5 none repeat scroll 0 0;
        }

        .panel-header, .panel-body {
            border-color: #cccccc;
        }

        .TopHead {
            background-color: #f5f5f5;
            width: 100%;
            height: 40px;
            font-size: 12px;
            border-bottom: 1px solid #cccccc;
        }

            .TopHead input {
                float: left;
                border: none;
                border-right: 1px solid #cccccc;
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

        .Bar {
            position: relative;
            width: 75%;
            /* 宽度 */ border: 1px solid #B1D632;
            padding: 1px;
        }

            .Bar div {
                display: block;
                position: relative;
                background: peachpuff; /* 进度条背景颜色 */
                color: #333333;
                height: 20px; /* 高度 */
                line-height: 20px;
                /* 必须和高度一致，文本才能垂直居中 */
            }

                .Bar div span {
                    position: absolute;
                    width: 100%;
                    /* 宽度 */ text-align: center;
                    font-weight: bold;
                }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="PlanIDList" name="PlanIDList" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="ApplicationCode" name="ApplicationCode" runat="server" />
        
        <input type="hidden" id="SearchResult" name="SearchResult" value="" runat="server" />


        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />

        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="GridData" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />

        <div class="TopHead">
            <input type="button" id="BtnClose" value="关闭" />
            <input id="btnRemind" type="submit" onserverclick="btnRemind_ServerClick" value="催办" runat="server" />
            <input id="btnJump" type="submit" onserverclick="btnJump_ServerClick" value="跳过" runat="server" />
            <input id="BtnDealInfo" style="display: none;" onserverclick="BtnDealInfo_ServerClick" value="会签意见" type="submit" runat="server" />
            <input id="BtnCompleteCheckLevel" style="display: none;" onserverclick="BtnCompleteCheckLevel_ServerClick" value="批转结束" type="submit" runat="server" />
            <input id="BtnReadOver" type="submit" value="会签结束" onserverclick="BtnReadOver_ServerClick" runat="server" />
            <input id="BtnCheckNoPass" type="submit" value="审批不通过" onserverclick="BtnCheckNoPass_ServerClick" runat="server" />
            <input id="BtnReturnPrevious" type="submit" value="驳回" onserverclick="BtnReturnPrevious_ServerClick" runat="server" />
            <input id="BtnCheckPass" type="submit" value="审批通过" onserverclick="BtnCheckPass_ServerClick" runat="server" />
            <input id="BtnIsPrint" type="button" value="打印" runat="server" />
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="return  ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" /><%--onserverclick=""BtnSave_ServerClick--%>
        </div>
        <div style="height: 4px;"></div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">备&nbsp;&nbsp;注：
                </td>
                <td colspan="3" class="DialogTdContent">
                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" runat="server" />
                </td>
            </tr>
        </table>
        <div id="Container" style="border: 1px solid #cccccc; height: auto; margin: 0px auto; margin-top: 5px;">
            <div id="TableContainer" style="max-height: 220px;"></div>
        </div>
        <div id="OAFlow" style="height: auto; margin: 0px auto;">
            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
        </div>

        <script type="text/javascript">
            $("#BtnIsPrint").click(function () {
                HDialog.Info("暂未开发！");
            });
            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();
            var column = [[
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
            
            ];
            var toolbar_Start = [
            ];

            var toolbar_Start1 = [
            ];

            ////初始化加载数据
            //var Rows = JSON.parse($("#SearchResult").val());
            //if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
            //    toolbar = toolbar_Start;
            //}
            //else {

            //    if ($("#State").val() == "审核中") {
            //        toolbar = toolbar_Start1;
            //    }
            //    if ($("#State").val() == "已审核") {
            //        toolbar = []; 
            //    }
            //}

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
                        param = $.JQForm.GetParam("CsPlan", "GetPlaningListAudit", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });
            }


            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });


            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if (ClientClick()) {
                    var valideteReturn = "false";
                    try {
                        valideteReturn = Validate();
                    } catch (e) {
                        valideteReturn = "false";
                    }
                    if (valideteReturn == "false") {
                        return false;
                    }
                    var isValid = $("#frmForm").form('validate');
                    if (isValid == true) {
                        if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                            HDialog.Info("请选择审批流程");
                            return false;
                        }
                        return true;
                    }
                    else {
                        return false;
                    }
                    IsSubmitFlag = false;
                    setTimeout('IsSubmitFlag=true', 30000);

                } else {
                    HDialog.Info("请修改批量添加计划内容");
                    return false;
                }
            });

            function ClientClick()
            {
                return true;
            }

            //计划单审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
         
                var gridData = $('#TableContainer').datagrid("getRows");
                if (gridData == undefined || gridData.length == 0) {
                    HDialog.Info("请选择审核计划");
                    return;
                }
     
                if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=0804&biaoshi=1&random=" + Math.random();
                    HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                        if (_Data != '') {
                            var obj = JSON.parse(_Data);
                            LoadTemplateData(obj[0].Trim(), obj[2].Trim());
                            document.all.WorkFlowManage_WorkFlowType.value = obj[1].toString();
                            document.all.WorkFlowManage_TxtWorkFlowType.value = obj[0].toString();
                        }
                    });
                }
            }

 
            //新增 修改
            function Detail(Id, OpType) {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                HDialog.Open(w, h, '../Plan/PlanPlaningList_Detail.aspx?Id=' + Id + '&IsShow=true&OpType=' + OpType, '计划单', true, function callback(_Data) {
                    if (_Data != '') {
                        LoadList();
                    }
                });
            }
            $(document).ready(function () {
                LoadList();
            });

   

            function Validate() {
                var data = $('#TableContainer').datagrid("getData");
                if (data.rows.length == 0) {
                    return false;
                }

                var flag = "true";
                return flag;
            }
        </script>
    </form>
</body>
</html>
