<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAllWork.aspx.cs" Inherits="M_Main.MyOa.MyAllWork" %>

<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发起工作</title>
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">

    <link rel="stylesheet" href="../Jscript-Ui/hplus/css/plugins/datapicker/datepicker3.css">
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
</head>
<body class="gray-bg">
    <form id="frmForm" runat="server">
        <input type="hidden" id="CurrPage" name="CurrPage" value="1" runat="server" />
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <button class="btn btn-white" type="button" onclick="window.location.href='../frame/NewDesktop.aspx';"><i class="fa fa-chevron-left"></i></button>
                            &nbsp;&nbsp;
                        <span style="font-family: 微软雅黑; font-size: 14px; font-weight: bold;">发起流程列表</span>
                        </div>
                        <div class="ibox-content">
                            <div class="row m-b-sm m-t-sm">
                                <div class="col-md-1">
                                    <button type="button" id="loading-example-btn" class="btn btn-white btn-sm" id="Refresh" onclick="Refresh();"><i class="fa fa-refresh"></i>刷新</button>
                                </div>
                                <div class="col-md-1">
                                    <select id="OAType" name="OAType" style="height: 28px;">
                                        <option value="">所有流程</option>
                                        <option value="0001">公文管理</option>
                                        <option value="0002">会议审批</option>
                                        <option value="0003">合同评审</option>
                                        <option value="0004">报账审批</option>
                                        <option value="0005">借款审批</option>
                                        <option value="0006">请假审批</option>
                                        <option value="0007">派车审批</option>
                                        <option value="0008">工作交办</option>
                                        <option value="0009">工作呈报</option>
                                        <option value="0010">采购计划</option>
                                        <option value="0011">人事审批</option>
                                        <option value="0012">资产报损</option>
                                        <option value="0013">资产申购</option>
                                        <option value="0014">业务流程</option>
                                    </select>
                                </div>
                                <div class="col-md-10">
                                    <div class="input-group" style="margin-bottom: 2px;">

                                        <div class="form-group" id="data_5">
                                            <div class="input-daterange input-group" id="datepicker">
                                                <input type="text" class="input-sm form-control" id="StartDate" name="StartDate">
                                                <span class="input-group-addon">到</span>
                                                <input type="text" class="input-sm form-control" id="EndDate" name="EndDate">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="input-group">
                                        <input type="text" placeholder="请输入标题名称、发起人" class="input-sm form-control" id="Key" name="Key" runat="server" />
                                        <span class="input-group-btn">
                                            <input type="button" class="btn btn-sm btn-primary" id="Search" value="搜索" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="project-list">
                                <div class="sk-spinner sk-spinner-circle" id="Loading">
                                    <div class="sk-circle1 sk-circle"></div>
                                    <div class="sk-circle2 sk-circle"></div>
                                    <div class="sk-circle3 sk-circle"></div>
                                    <div class="sk-circle4 sk-circle"></div>
                                    <div class="sk-circle5 sk-circle"></div>
                                    <div class="sk-circle6 sk-circle"></div>
                                    <div class="sk-circle7 sk-circle"></div>
                                    <div class="sk-circle8 sk-circle"></div>
                                    <div class="sk-circle9 sk-circle"></div>
                                    <div class="sk-circle10 sk-circle"></div>
                                    <div class="sk-circle11 sk-circle"></div>
                                    <div class="sk-circle12 sk-circle"></div>
                                </div>
                                <table class="table table-hover" id="List">
                                    <tbody>
                                    </tbody>
                                </table>
                                <div class="text-center">
                                    <div class="btn-group" id="PageNum">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <input type="hidden" id="CorpID" name="CorpID" runat="server" />
        <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
        <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
        <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
        <script src="../Jscript-Ui/hplus/js/plugins/datapicker/bootstrap-datepicker.js"></script>
        <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            $('#StartDate').datepicker({
            });

            $('#EndDate').datepicker({
            });
            $(document).ready(function () {
                $("#loading-example-btn").click(function () {
                    btn = $(this); simpleLoad(btn, true); simpleLoad(btn, false)
                })
                $("#OAType").append("<option value='0016'>发文审批</option>");
                $("#OAType").append("<option value='0017'>收文审批</option>");
                //只针对天投使用的代码 请不要删除
                if ($('#CorpID').val() == '1000' || $('#CorpID').val() == '1829') {
                    $("#OAType").append("<option value='0018'>会议室预订</option>");
                    $("#OAType").append("<option value='0019'>呈报件</option>");
                    $("#OAType").append("<option value='0020'>工作联系单</option>");
                }

            });
            function simpleLoad(btn, state) {
                if (state) {
                    btn.children().addClass("fa-spin"); btn.contents().last().replaceWith(" Loading")
                } else {
                    setTimeout(function () { btn.children().removeClass("fa-spin"); btn.contents().last().replaceWith(" Refresh") }, 2000)
                }
            };

            function Refresh() {
                window.location.href = "MyAllWork.aspx";
            }

            function Detail(Url) {
                window.location.href = Url;
            }

            $("#Search").click(function (e) {
                $("#Loading").css("display", "");
                LoadWaitWork();
            });

            var rows = 10;
            var TotalSize;
            function LoadWaitWork() {
                $.tool.DataPost('OASearch', 'AllStartWork', $('#frmForm').serialize() + "&rows=" + rows,
                    function Init() {
                    },
                    function callback(_Data) {
                        $("#List").html("");
                        $("#Loading").css("display", "none");
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            var obj = JSON.parse(_Data);
                            for (var i = 0; i < obj.rows.length; i++) {
                                var title = obj.rows[i].Title;
                                $("#List").append("<tr style='cursor:pointer;'><td class=\"project-status\"><span class=\"label label-primary\">" + obj.rows[i].CompleteName + "</td><td class=\"project-title\">" + obj.rows[i].TypeName + "<br/></td><td class=\"project-title\" onclick=\"" + obj.rows[i].Url + "\">" + obj.rows[i].Title + "<br/></td><td class=\"project-title\"><br/></td><td class=\"project-title\">" + obj.rows[i].WorkDays + "天前<br/></td><td class=\"project-actions\">" + formatDate(obj.rows[i].WorkStartDate, 'yyyy-MM-dd') + "<br/></td><td class=\"project-actions\"><input type='button' class='btn btn-sm btn-primary' onclick='ForwardFunction(\"" + obj.rows[i].TypeCode + "\",\"" + obj.rows[i].InfoId + "\",\"" + title + "\")' id='Forward' value='转发' /></td></tr>");
                            }
                        }
                        TotalSize = obj.total;
                        var PageCount = Math.ceil(TotalSize / rows);
                        var IsActive = '';
                        $("#PageNum").html("");

                        $("#PageNum").append("<button class=\"btn btn-white\" type=\"button\" onclick='LastPage();'><i class=\"fa fa-chevron-left\"></i></button>");
                        for (var i = 0; i < PageCount; i++) {
                            IsActive = '';
                            var c = parseInt($("#CurrPage").val());
                            if (c == i + 1) IsActive = 'active';
                            $("#PageNum").append("<button type=\"button\" class=\"btn btn-white " + IsActive + "\" onclick='CurrentPage(" + (i + 1) + ");'>" + (i + 1) + "</button>");
                        }
                        $("#PageNum").append("<button class=\"btn btn-white\" type=\"button\" onclick='NextPage();'><i class=\"fa fa-chevron-right\"></i></button>");
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LastPage() {
                var c = parseInt($("#CurrPage").val());
                c = c - 1;
                if (c <= 0) {
                    return;
                }
                $("#CurrPage").val(c);
                LoadWaitWork();
            }
            function NextPage() {
                var c = parseInt($("#CurrPage").val());
                c = c + 1;
                if (c >= TotalSize + 1) {
                    return;
                }
                $("#CurrPage").val(c);
                LoadWaitWork();
            }
            function CurrentPage(i) {
                $("#CurrPage").val(i);
                LoadWaitWork();
            }
            LoadWaitWork();

            //****选择转发人员
            function ForwardFunction(TypeCode, InfoId, FileTitle) {
                HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?Cmd=5&MultiLine=1&WorkInfoId=-1&random=' + Math.random(), '选择转发人员', false, function callback(_Data) {
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
                            //alert(obj[1] + "-----" + TempUserList)
                            if (TempUserList.length > 0) {
                                Forward(TypeCode, InfoId, TempUserList, FileTitle);
                            } else {
                                HDialog.Info("请选择转发人员");
                            }
                        }
                    }
                });

                //alert(InfoId)
            }

            //****转发
            function Forward(TypeCode, InfoId, UserCodeList, FileTitle) {
                $.tool.DataPost('OASearch', 'ForwardOAMessage', "TypeCode=" + TypeCode + "&InfoID=" + InfoId + "&UserCodeList=" + UserCodeList + "&FileTitle=" + FileTitle,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info("转发成功.");
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Detail(Link, type) {

                if (type == '采购申请') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/PurchaseDetail.aspx?Id=' + Link + '&OpType=edit', '采购申请单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadWaitWork();
                        }
                    });
                    return;
                }
                if (type == '采购计划') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/PurchasePlanDetail.aspx?Id=' + Link + '&OpType=edit', '采购计划单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadWaitWork();
                        }
                    });
                    return;
                }
                if (type == '物资入库') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/StorageDetail.aspx?Id=' + Link + '&OpType=edit', '物资入库单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '物资出库') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/CheckOutDetail.aspx?Id=' + Link + '&OpType=edit', '物资出库单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '物资盘点') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/MtInventoryEdit.aspx?Id=' + Link + '&OpType=edit', '物资盘点单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '调整审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Mt/MtAllocationDetailed.aspx?Id=' + Link + '&OpType=edit', '物资调拨单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                //计划管理
                if (type == '计划编制') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Plan/PlanPlaningList_Detail.aspx?Id=' + Link + '&OpType=edit', '计划编制审批单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '计划调整') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Plan/PlanAdjustDetailNew.aspx?AdjustmentID=' + Link + '&OpType=edit', '计划调整审批单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '计划考评') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Plan/PlanSubmit.aspx?EvaId=' + Link + '&OpType=edit', '计划考评审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                //预算管理
                if (type == '预算计划') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../BudgetNew/BudgetPlanList_Detail.aspx?Id=' + Link + '&OpType=edit', '预算计划审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '预算调整') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../BudgetNew/BudgetChange_AddDetails.aspx?ChangeID=' + Link + '&OpType=edit', '预算调整审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '预算执行') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../BudgetNew/BudgetImplementlist_Detail.aspx?Id=' + Link + '&OpType=edit', '预算执行审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                //请付
                if (type == '请付审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/PaymenApprovalEdit.aspx?Id=' + Link + '&OpType=edit', '请付单', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }

                //摊销审批
                if (type == '摊销审批') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../CostManageNew/AmortizationAuditDetail.aspx?Id=' + Link + '&OpType=edit', '摊销审批管理', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                //租赁合同
                if (type == '认租签约') {
                    var w = '1200';
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Merchants/RentSubscription/Edit.aspx?Id=' + Link + '&OpType=edit', '认租合同登记', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '租赁合同新签') {
                    var w = '1200';
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Contract/Register/Edit.aspx?Id=' + Link + '&OpType=edit', '租赁合同签订审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '租赁合同续签') {
                    var w = '1200';
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Contract/Register/Edit.aspx?Id=' + Link + '&OpType=edit', '租赁合同签订审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '租赁合同变更') {
                    var w = '1200';
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Contract/Change/Edit.aspx?Id=' + Link + '&OpType=edit', '租赁合同变更审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }

                if (type == '租赁合同提成') {
                    var w = '1000';
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '/HM/M_Main/Renting/Contract/Royalty/Edit.aspx?Id=' + Link + '&OpType=edit', '租赁合同提成审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }

                if (type == '应急事件报告') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../Emergency/EmergencyEventReportDetail.aspx?Id=' + Link + '&OpType=edit', '应急事件报告审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }

                //多经管理
                if (type == '多经合同签订') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../DiversifiedManage/ContractManage/ContractManageDetail.aspx?Id=' + Link + '&OpType=edit', '合同签订审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }

                if (type == '多经合同变更') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open(w, h, '../DiversifiedManage/ContractManage/ContractChangeDetail.aspx?Id=' + Link + '&OpType=edit', '合同变更审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '多经合同执行') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open("1000", '600', '../DiversifiedManage/ContractManage/ContractImplementDetail.aspx?Id=' + Link + '&OpType=edit', '合同执行审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }
                if (type == '多经合同提成') {
                    var w = top.$(window).width();
                    var h = parent.$(window).height();
                    HDialog.Open("1000", '600', '../DiversifiedManage/ContractManage/ContractRoyaltyDetail.aspx?Id=' + Link + '&OpType=edit', '合同提成审批', true, function callback(_Data) {
                        if (_Data != '') {
                            $("#Loading").css("display", "");
                            $("#List").html("");
                            LoadData();
                        }
                    });
                    return;
                }

                window.location.href = Link;
            }

        </script>
    </form>
</body>
</html>
