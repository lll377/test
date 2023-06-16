<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BussAsset.aspx.cs" Inherits="M_Main.OAPublicWorkNew.BussAsset" %>

<!DOCTYPE html>
<html>
<head>
    <title>业务审批</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 700px;
            height: 200px;
        }

        .SearchTable {
            width: 700px;
            height: auto;
        }

            .SearchTable .TdTitle {
                width: 15%;
            }

            .SearchTable .TdContent {
                width: 35%;
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
                    <td class="TdTitle">流程类别
                    </td>
                    <td class="TdContent">
                        <input id="WorkFlowType" readonly name="WorkFlowType" runat="server" onclick="SelWorkFlowType();" />
                    </td>
                    <td class="TdTitle">发起人
                    </td>
                    <td class="TdContent">
                        <input type="text" id="UserName" name="UserName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">发起开始时间
                    </td>
                    <td class="TdContentSearch">
                        <input id="CheckStartDate" name="CheckStartDate" class="easyui-datebox" runat="server" />
                    </td>
                    <td class="TdTitle">发起结束时间
                    </td>
                    <td class="TdContentSearch">
                        <input id="CheckEndDate" name="CheckEndDate" class="easyui-datebox" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">主题
                    </td>
                    <td class="TdContent">
                        <input id="TitleName" name="TitleName" runat="server" />
                    </td>
                    <td class="TdTitle">业务类型
                    </td>
                    <td class="TdContent">
                        <select runat="server" id="BType" name="BType">
                            <option value="">请选择</option>
                            <%--<option value="人事招聘审批">人事招聘审批</option>
                            <option value="人事入职审批">人事入职审批</option>
                            <option value="人事转正审批">人事转正审批</option>
                            <option value="人事调整审批">人事调整审批</option>
                            <option value="人事离职审批">人事离职审批</option>
                            <option value="人事合同审批">人事合同审批</option>
                            <option value="人事奖惩审批">人事奖惩审批</option>
                            <option value="人事请假审批">人事请假审批</option>
                            <option value="人事工资审批">人事工资审批</option>
                            <option value="采购申请">采购申请</option>
                            <option value="计划采购">计划采购</option>
                            <option value="入库">入库</option>
                            <option value="出库">出库</option>
                            <option value="盘点">盘点</option>
                            <option value="调拨">调拨</option>
                            <option value="合同">合同</option>
                            <option value="计划">计划</option>
                            <option value="预算">预算</option>
                            <option value="设备">设备</option>--%>
                            <option value="人事管理类">人事管理类</option>
                            <option value="人事需求">&nbsp;&nbsp;人事管理-人事需求</option>
                            <option value="人事招聘">&nbsp;&nbsp;人事管理-人事招聘</option>
                            <option value="入职审批">&nbsp;&nbsp;人事管理-入职审批</option>
                            <option value="转正审批">&nbsp;&nbsp;人事管理-转正审批</option>
                            <option value="调整审批">&nbsp;&nbsp;人事管理-调整审批</option>
                            <option value="合同审批">&nbsp;&nbsp;人事管理-合同审批</option>
                            <option value="奖惩审批">&nbsp;&nbsp;人事管理-奖惩审批</option>
                            <option value="请假审批">&nbsp;&nbsp;人事管理-请假审批</option>
                            <option value="人员离职">&nbsp;&nbsp;人事管理-人员离职</option>
                            <option value="年假延期">&nbsp;&nbsp;人事管理-年假延期</option>
                            <option value="工资审核">&nbsp;&nbsp;人事管理-工资审核</option>


                            <option value="物资管理类">物资管理类</option>
                            <option value="计划采购">&nbsp;&nbsp;采购申请-计划采购</option>
                            <option value="零星采购">&nbsp;&nbsp;采购申请-零星采购</option>
                            <option value="紧急采购">&nbsp;&nbsp;采购申请-紧急采购</option>
                            <option value="专项采购">&nbsp;&nbsp;采购申请-专项采购</option>
                            <option value="集中采购">&nbsp;&nbsp;采购申请-集中采购</option>
                            <option value="计划采购">&nbsp;&nbsp;计划采购</option>
                            <option value="物资入库">&nbsp;&nbsp;物资入库</option>
                            <option value="物资出库">&nbsp;&nbsp;物资出库</option>
                            <option value="物资盘点">&nbsp;&nbsp;物资盘点</option>
                            <option value="物资调拨">&nbsp;&nbsp;物资调拨</option>


                            <option value="成本管理类">成本管理类</option>
                            <option value="合同评审">&nbsp;&nbsp;合同评审</option>
                            <option value="合同变更">&nbsp;&nbsp;合同变更</option>
                            <option value="合同终止">&nbsp;&nbsp;合同终止</option>
                            <option value="计划申报">&nbsp;&nbsp;计划申报</option>
                            <option value="计划审批">&nbsp;&nbsp;计划审批</option>
                            <option value="支付审批">&nbsp;&nbsp;支付审批</option>
                            <option value="借款审批">&nbsp;&nbsp;借款审批</option>
                            <%--<option value ="0708">&nbsp;&nbsp;单个合同变更</option>
                        <option value ="0709">&nbsp;&nbsp;单个合同终止</option>--%>


                            <option value="计划管理类">计划管理类</option>
                            <option value="计划编制审批">&nbsp;&nbsp;计划编制审批</option>
                            <option value="计划调整审批">&nbsp;&nbsp;计划调整审批</option>
                            <option value="计划考评审批">&nbsp;&nbsp;计划考评审批</option>

                            <option value="预算管理类">预算管理类</option>
                            <option value="预算计划审批">&nbsp;&nbsp;预算计划审批</option>
                            <option value="预算调整审批">&nbsp;&nbsp;预算调整审批</option>
                            <option value="预算执行审批">&nbsp;&nbsp;预算执行审批</option>

                            <option value="设备管理类">设备管理类</option>
                            <option value="设备异动">&nbsp;&nbsp;设备异动</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">业务说明
                    </td>
                    <td class="TdContent">
                        <input id="Description" name="Description" runat="server" />
                    </td>
                    <td class="TdTitle">发起部门
                    </td>
                    <td class="TdContent">
                        <input id="DepName" name="DepName" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">办理天数大于
                    </td>
                    <td class="TdContentSearch">
                        <input id="SWorkDays" name="SWorkDays" style="width: 40px; height: 16px; border: 1px solid #cccccc;" runat="server" />
                        至
                    <input id="EWorkDays" name="EWorkDays" style="width: 40px; height: 16px; border: 1px solid #cccccc;" runat="server" />
                    </td>
                    <td class="TdTitle">办理状态
                    </td>
                    <td class="TdContent">
                        <select id="CompleteName" runat="server">
                            <option value=""></option>
                            <option value="1">未完结</option>
                            <option value="2">已完结</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function SelWorkFlowType() {
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&random=" + Math.random();
                HDialog.Open('300', '500', strPage, '选择流程分类', false, function callback(_Data) {
                    if (_Data != '') {
                        var obj = JSON.parse(_Data);
                        if (obj != null) {
                            document.all.WorkFlowType.value = obj[1].toString();
                            document.all.WorkFlowTypeId.value = obj[0].toString();
                        }
                    }
                });
            }

            function InitFunction() {
                var h = $(window).height();
                if (h < 760) {
                    h = h - 40;
                }
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();
            var column;
            column = [[
                { field: 'LoginName', title: '发起人', align: 'left', width: 50, sortable: true },
                { field: 'WorkStartDate', title: '发起时间', align: 'left', width: 50, sortable: true },
                {
                    field: 'TitleName', title: '主题', width: 150, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\" href=\"#\" onclick=\"Detail('" + row.Id + "','" + row.BussId + "','" + row.ClassName + "','" + row.BType + "');\">" + row.TitleName + "</a>";
                        return str;
                    }
                },
                {
                    field: 'BType', title: '业务类型', align: 'left', width: 50, sortable: true, formatter: function (value, row, index) {
                        var bType = row.BType;
                        if (bType == 'EqYdsp') { return '设备异动审批' }
                        return bType;
                    }
                },
                { field: 'Description', title: '业务说明', align: 'left', width: 50, sortable: true },
                { field: 'WorkDays', title: '办理天数', align: 'left', width: 50, sortable: true },
                { field: 'CompleteName', title: '办理状态', align: 'left', width: 50, sortable: true }
            ]];
            var toolbar = [
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
                }, '-',
                {
                    text: '导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        window.location.href = "../OAPublicWorkNew/Export/BussAssetExport.aspx";
                    }
                }
            ];
            //zmh 2017-04-11 添加导出

            function DelRecord(row) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('OAControl', 'BussDelete', 'InfoId=' + row.Id + '&State=' + row.CompleteName,
                            function Init() {
                            },
                            function callback(_Data) {
                                $('#SearchDlg').parent().appendTo($("form:first"));
                                if (_Data.substring(0, 5) == "false") {
                                    HDialog.Info(_Data.substring(6));
                                }
                                else {
                                    LoadList();
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=OAControl&Command=BussSearch&' + $('#frmForm').serialize(),
                    method: "get",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: toolbar,
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        //$.tool.MergeEasyUiGrid("TableContainer", "DepName");
                        $("#SearchDlg").dialog("close");
                    }
                });
            }
            LoadList();

            function Detail(InfoId, BussId, ClassName, BType) {
                if (BType == '采购申请') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/PurchaseDetail.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '采购单', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '采购计划') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/PurchasePlanDetail.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '采购计划单', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '物资入库') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/StorageDetail.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '入库单', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '物资出库') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/CheckOutDetail.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '出库单', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }

                if (BType == '物资调拨') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/MtAllocationDetailed.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '调拨审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                //if (BType == '调整审批') {
                //    var w = top.$(window).width();
                //    var h = parent.$(window).height();
                //    HDialog.Open(w, h, '../Mt/MtAllocationDetailed.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '调整审批', true, function callback(_Data) {
                //        if (_Data != '') {
                //            LoadList();
                //        }
                //    });
                //    return;
                //}

                if (BType == '盘点申请') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/MtInventoryEdit.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '盘点单', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }

                if (BType == '合同评审') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/ContractReviewProcess.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '合同评审单', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }

                //计划编制审批
                if (BType == '计划单申报') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Plan/PlanPlaningList_Detail.aspx?Id=' + BussId + '&OpType=edit', '计划编制审批单', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }
                //计划调整审批
                if (BType == '计划调整审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Plan/PlanAdjustDetail.aspx?ChangeId=' + BussId + '&OpType=edit', '计划调整审批单', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }
                //计划考评审批
                if (BType == '考评审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Plan/PlanSubmit.aspx?EvaId=' + BussId + '&OpType=edit', '计划考评审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //预算计划审批
                if (BType == '预算计划审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../BudgetNew/BudgetPlanList_Detail.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '预算计划审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }
                //预算调整审批
                if (BType == '预算调整审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../BudgetNew/BudgetChange_AddDetails.aspx?ChangeID=' + BussId + '&OpType=edit&IsAssert=1', '预算调整审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }
                //预算执行审批
                if (BType == '预算执行审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../BudgetNew/BudgetImplementList_Detail.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '预算执行审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //成本合同评审
                //if (BType == '合同评审') {
                //    var w = top.$(window).width();
                //    var h = parent.$(window).height();
                //    HDialog.Open(w, h, '../CostManageNew/ContractReviewProcess.aspx?Id=' + BussId + '&OpType=edit', '合同评审', true, function callback(_Data) {
                //        if (_Data != '') {
                //            //$("#Loading").css("display", "");
                //            //$("#List").html("");
                //            LoadList();
                //        }
                //    });
                //    return;
                //}

                //成本合同变更
                if (BType == '合同变更') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/ContractChangeApproval.aspx?Id=' + BussId + '&OpType=edit', '合同变更', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //成本合同终止
                if (BType == '合同终止') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/ContractTerminationApproval.aspx?Id=' + BussId + '&OpType=edit', '合同终止', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //成本计划申报
                if (BType == '计划申报') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/PlanningDeclarationEdit.aspx?Id=' + BussId + '&OpType=edit', '计划申报', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //成本计划审批
                if (BType == '计划审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/PlanningApprovalEdit.aspx?Id=' + BussId + '&OpType=edit', '计划审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                if (BType == '计划编制批量审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Plan/PlanPlaningListAudit.aspx?ApplicationCode=' + BussId + '&OpType=edit', '计划批量审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //成本支付审批
                if (BType == '支付审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/PaymenApprovalEdit.aspx?Id=' + BussId + '&OpType=edit&IsAssert=1', '支付审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //成本借款审批
                if (BType == '借款审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/LoanApprovalDetail.aspx?Id=' + BussId + '&OpType=edit', '借款审批', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                //摊销审批
                if (BType == '摊销审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/AmortizationAuditDetail.aspx?Id=' + BussId + '&OpType=edit', '摊销审批管理', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }


                //物资监控
                if (BType == '物资监控') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/MaterialMonitorWorkFlow.aspx?Id=' + BussId + '&OpType=edit', '物资监控', false, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }
                //经营合同审批
                if (BType == '经营合同审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../ContractNew/ContractManage.aspx?ContID=' + BussId + '&OpType=edit', '经营合同信息', true, function callback(_Data) {
                        if (_Data != '') {
                            //$("#Loading").css("display", "");
                            //$("#List").html("");
                            LoadList();
                        }
                    });
                    return;
                }

                /* 租赁合同 */
                if (BType == '认租签约') {
                    var w = 1200;
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Merchants/RentSubscription/Edit.aspx?Id=' + BussId + '&OpType=edit', '认租合同登记', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }

                if (BType == '租赁合同新签') {
                    var w = 1200;
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Contract/Register/Edit.aspx?Id=' + BussId + '&OpType=edit', '租赁合同签订审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '租赁合同续签') {
                    var w = 1200;
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Contract/Register/Edit.aspx?Id=' + BussId + '&OpType=edit', '租赁合同签订审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '租赁合同变更') {
                    var w = 1200;
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Contract/Change/Edit.aspx?Id=' + BussId + '&OpType=edit', '租赁合同变更审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '租赁合同提成') {
                    var w = 1000;
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HN/M_Main/Renting/Contract/Royalty/Edit.aspx?Id=' + BussId + '&OpType=edit', '租赁合同提成审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }

                if (BType == '多经合同签订审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../DiversifiedManage/ContractManage/ContractManageDetail.aspx?Id=' + BussId + '&OpType=edit', '合同签订审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '多经合同变更审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../DiversifiedManage/ContractManage/ContractChangeDetail.aspx?Id=' + BussId + '&OpType=edit', '合同变更审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '多经合同执行审批') {
                    HDialog.Open("1000", '600', '../DiversifiedManage/ContractManage/ContractImplementDetail.aspx?Id=' + BussId + '&OpType=edit', '合同执行审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }
                if (BType == '多经合同提成审批') {
                    HDialog.Open("1000", '600', '../DiversifiedManage/ContractManage/ContractRoyaltyDetail.aspx?Id=' + BussId + '&OpType=edit', '合同提成审批', true, function callback(_Data) {
                        if (_Data != '') {
                            LoadList();
                        }
                    });
                    return;
                }

                window.location.href = '../OAWorkFlow/OAWorkDetail.aspx?IsAdmin=1&ClassName=' + ClassName + '&IsAssert=1&IsPrint=1&Pid=&Id=' + InfoId;
            }
        </script>
    </form>
</body>
</html>
