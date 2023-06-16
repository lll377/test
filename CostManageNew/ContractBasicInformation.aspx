<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractBasicInformation.aspx.cs" Inherits="M_Main.CostManageNew.ContractBasicInformation" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>合同基本信息</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <%--<script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" />
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/CostDictionaryCanNull.js"></script>
    <style type="text/css">
        body {
            background-color: #f5f5f5;
            overflow: hidden;
        }

        .active {
            background-color: #cccccc;
        }

        #TableContainer table .tr td input {
            border: 1px #cccccc solid;
            width: 85%;
        }

        #TableContainer table .tr td textarea {
            width: 97.8%;
            border: 1px solid #cccccc;
            height: 22px;
        }

        #TableContainer table .tr td select {
            border: 1px solid #cccccc;
            height: 21px;
            line-height: 16px;
            width: 85%;
        }

        #TableContainer table tr td {
            height: 31px;
            width: 10%;
        }

        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server" style="margin: 0px; margin-top: 0px;">
        <div id="TableContainer" style="margin: 0px; margin-top: 0px; background-color: white; height: auto; overflow-y: scroll;">
            <table style="font-size: 12px; font-family: 微软雅黑;">
                <%--合同基本信息--%>
                <tr>
                    <td colspan="8" style="height: 30px; width: 100%; background-color: #F5F5F5; text-align: center; color: #000; font-size: 13px; font-weight: bold;">合同基本信息  
                    </td>
                </tr>
                <tr class="tr">
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input id="CommName" name="CommName" type="text" class="easyui-validatebox" onclick="SelItem();" readonly="readonly" />
                        <input type="hidden" name="CommId" id="CommId" value="" />
                    </td>
                    <td class="TdTitle">部门名称</td>
                    <td class="TdContentSearch">
                        <input id="DepName" name="DepName" type="text" class="easyui-validatebox" onclick="SelDep();" data-options="required:true" readonly="readonly" />
                        <input type="hidden" name="DepCode" id="DepCode" value="" />
                    </td>
                    <td class="TdTitle">负责人</td>
                    <td class="TdContentSearch">
                        <input id="PrincipalName" name="PrincipalName" type="text" class="easyui-validatebox" onclick="SelUserSerPrincipal();" data-options="required:true" readonly="readonly" />
                        <input type="hidden" name="Principal" id="Principal" value="" />
                    </td>
                    <td class="TdTitle">合同名称</td>
                    <td class="TdContentSearch">
                        <input id="ContractName" name="ContractName" type="text" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">合同类型</td>
                    <td class="TdContentSearch">
                        <%--<select id="ContractCategory" isdctype="true" dctype="合同类型" clientidmode="Static" name="ContractCategory" style="border: 1px solid #cccccc; height: 21px; line-height: 16px; width: 91%;">
                        </select>--%>
                        <%--<input id="ContractCategory" name="ContractCategory" type="text" class="easyui-validatebox" readonly="readonly" value="付款合同" />--%>
                        <select id="ContractCategory" name="ContractCategory">
                            <option value="预计合同">预计合同</option>
                            <option value="虚拟合同">虚拟合同</option>
                        </select>
                    </td>
                    <td class="TdTitle">合同类别</td>
                    <td class="TdContentSearch">
                        <input id="TypeName" name="TypeName" type="text" class="easyui-validatebox" onclick="SelContractType();" data-options="required:true" />
                        <input type="hidden" name="ContractType" id="ContractType" value="" />
                    </td>
                    <td class="TdTitle">签约类型</td>
                    <td class="TdContentSearch">
                        <select id="SignedType" name="SignedType">
                            <option value=""></option>
                            <option value="新签">新签</option>
                            <option value="续签">续签</option>
                        </select>
                    </td>
                    <td class="TdTitle">是否战略分供方</td>
                    <td class="TdContentSearch">
                        <select id="IsStrategySupplier" name="IsStrategySupplier" onchange="IsSupplier(this)">
                            <option value=""></option>
                            <option value="0">是</option>
                            <option value="1">否</option>
                        </select>
                    </td>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">分供方名称</td>
                    <td class="TdContentSearch">
                        <input id="SupplierName" style="width: 68%;" name="SupplierName" type="text" class="easyui-validatebox" data-options="required:true" />
                        <input type="hidden" name="SupplierId" id="SupplierId" value="" />
                        <a id="MtShow" style="color: blue; cursor: pointer; width: 50px;" onclick="MtShow()">查看</a>
                    </td>
                    <td class="TdTitle">战略分供方编号</td>
                    <td class="TdContentSearch">
                        <input id="StrategySupplierNo" name="StrategySupplierNo" type="text" class="easyui-validatebox" readonly="readonly" /></td>
                    <td class="TdTitle">联系人</td>
                    <td class="TdContentSearch">
                        <input id="LinkMan" name="LinkMan" type="text" class="easyui-validatebox" data-options="required:true" /></td>
                    <td class="TdTitle">联系电话</td>
                    <td class="TdContentSearch">
                        <input id="LinkTel" name="LinkTel" type="text" class="easyui-validatebox" data-options="required:true" /></td>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">三方单位</td>
                    <td class="TdContentSearch">
                        <input id="OtherUnit" name="OtherUnit" type="text" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">合同期限（年）</td>
                    <td class="TdContentSearch">
                        <input id="ContractPeriod" name="ContractPeriod" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContentSearch">
                        <input id="ContractBegin" name="ContractBegin"
                            onclick="WdatePicker({ onpicked: ClearPlan, dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" /></td>
                    <td class="TdTitle">结束时间</td>
                    <td class="TdContentSearch">
                        <input id="ContractEnd" name="ContractEnd"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', onpicked: ContractEndChange })" format="date" /></td>
                </tr>
                <%--合同内容--%>
                <tr class="tr">
                    <td class="TdTitle">产品/服务数量</td>
                    <td class="TdContentSearch">
                        <input id="ProductsORServicesCount" style="width: 85%;" name="ProductsORServicesCount" type="text" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">合同内容</td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea id="ContractContent" name="ContractContent" onclick="SelContractContent();"></textarea>
                    </td>
                </tr>
                <%--合同描述--%>
                <tr class="tr">
                    <td class="TdTitle">合同描述</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="ContractDesc" name="ContractDesc"></textarea>
                    </td>
                </tr>
                <tr class="tr">
                    <td class="TdTitle">合同范本来源</td>
                    <td class="TdContentSearch">
                        <select id="ContractSource" isdctype="true" dctype="合同范本来源" clientidmode="Static" name="ContractSource">
                        </select>
                    </td>
                </tr>
                <%--范本修改理由--%>
                <tr class="tr">
                    <td class="TdTitle">范本修改理由</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="SourceEditReason" name="SourceEditReason"></textarea>
                    </td>
                </tr>

                <%--范本修改内容--%>
                <tr class="tr">
                    <td class="TdTitle">范本修改内容</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="SourceEditContent" name="SourceEditContent"></textarea>
                    </td>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">上期合同金额（元）</td>
                    <td class="TdContentSearch">
                        <input id="PriorPeriodMoney" name="PriorPeriodMoney" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">本次合同金额（元）</td>
                    <td class="TdContentSearch">
                        <input id="ContractMoney" name="ContractMoney" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">合同质保金（元）</td>
                    <td class="TdContentSearch">
                        <input id="MarginMoney" name="MarginMoney" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">合同违约金（元）</td>
                    <td class="TdContentSearch">
                        <input id="PenaltyMoneh" name="PenaltyMoneh" type="text" class="easyui-validatebox" />
                    </td>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">付款方式</td>
                    <td class="TdContentSearch">
                        <input id="PayType" name="PayType" type="text" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">合同份数</td>
                    <td class="TdContentSearch">
                        <input id="ContractNum" name="ContractNum" type="text" class="easyui-validatebox" />
                    </td>
                    <td class="TdTitle">每份页数</td>
                    <td class="TdContentSearch">
                        <input id="ContractPages" name="ContractPages" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">附件数量</td>
                    <td class="TdContentSearch">
                        <input id="FilesNum" name="FilesNum" type="text" class="easyui-validatebox" /></td>
                </tr>
                <tr class="tr">
                    <td class="TdTitle">评审期限</td>
                    <td class="TdContentSearch">
                        <input id="ReviewLimit" name="ReviewLimit" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">费用主管部门</td>
                    <td class="TdContentSearch">
                        <input id="PayDepName" name="PayDepName" type="text" class="easyui-validatebox" onclick="SelPayDep();" readonly="readonly" />
                        <input type="hidden" name="PayDepCode" id="PayDepCode" value="" /></td>
                    <td class="TdTitle">关联工作计划</td>
                    <td class="TdContentSearch">
                        <input id="WorkPlanName" name="WorkPlanName" type="text" class="easyui-validatebox" onclick="SelWorkPlan();" readonly="readonly" />
                        <input type="hidden" name="WorkPlanId" id="WorkPlanId" value="" /></td>
                </tr>
                <tr class="tr">
                    <td class="TdTitle">备注</td>
                    <td class="TdContentSearch" colspan="7">
                        <textarea id="Remark" name="Remark"></textarea>
                    </td>
                </tr>
                <tr class="tr">
                    <td class="TdTitle">合同编号</td>
                    <td class="TdContentSearch">
                        <input id="ContractNo" runat="server" name="ContractNo" type="text" class="easyui-validatebox" data-options="required:true" />
                        <input type="hidden" runat="server" name="IsContractNo" id="IsContractNo" value="0" />
                    </td>
                    <td class="TdTitle">签署人</td>
                    <td class="TdContentSearch">
                        <input id="SignPersonName" name="SignPersonName" type="text" class="easyui-validatebox" onclick="SelUserSerSignPerson();" />
                        <input type="hidden" id="SignPerson" name="SignPerson" value="" /></td>
                    <td class="TdTitle">签署时间</td>
                    <td class="TdContentSearch">
                        <input id="SignTime" name="SignTime"
                            onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" />
                    </td>
                    <td class="TdTitle">签约单位</td>
                    <td class="TdContentSearch">
                        <input id="ContractUnit" name="ContractUnit" type="text" class="easyui-validatebox" onclick="SelDepContractUnit();" readonly="readonly" /></td>
                </tr>
                <tr style="height: 50px">
                    <td colspan="8" align="center">
                        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
                        <input type="button" class="button" value="送审" id="BtnSubmitted" onclick="Submitted();" />
                        <input type="button" class="button" value="返回" id="BtnClose" runat="server" onclick="Close();" />
                    </td>
                </tr>
            </table>
        </div>
        <%--设备选项卡--%>
        <input type="hidden" id="refsel" />
        <div class="tabs-container" id="DivB">
            <ul class="nav nav-tabs">
                <li class="active" id="liHeight" name="room" refpage="ContractReviewInformation" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true" style="font-size: 13px;">合同评审信息</a>
                </li>
                <li class="" name="cust" refpage="ContractChangeInformation" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false" style="font-size: 13px;">合同变更信息</a>
                </li>
                <li class="" name="cust" refpage="ContractStopInformation" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false" style="font-size: 13px;">合同终止信息</a>
                </li>
                <li class="" name="cust" refpage="ContractImplementInformation" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false" style="font-size: 13px;">合同执行信息</a>
                </li>
                <li class="" name="cust" refpage="ContractAssessmentInformation" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false" style="font-size: 13px;">履约评价信息</a>
                </li>
                <li class="" name="cust" refpage="PlanningDeclaration" refsel="0"><a data-toggle="tab" href="#tab-6" aria-expanded="false" style="font-size: 13px;">资金申报信息</a>
                </li>
                <li class="" name="cust" refpage="PlanningApproval" refsel="0"><a data-toggle="tab" href="#tab-7" aria-expanded="false" style="font-size: 13px;">资金审批信息</a>
                </li>
                <li class="" name="cust" refpage="PaymentApproval" refsel="0"><a data-toggle="tab" href="#tab-8" aria-expanded="false" style="font-size: 13px;">合同请付信息</a>
                </li>
                <li class="" name="cust" refpage="CostFundManagement" refsel="0"><a data-toggle="tab" href="#tab-9" aria-expanded="false" style="font-size: 13px;">合同付款信息</a>
                </li>
            </ul>
            <div class="tab-content ">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" id="div1" style="padding: 0px; overflow-y: auto; width: 100%;">
                        <iframe id="ContractReviewInformation" src="ContractReviewInformation.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" id="div2" style="padding: 0px; overflow-y: auto;">
                        <iframe id="ContractChangeInformation" src="ContractChangeInformation.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" id="div3" style="padding: 0px; overflow-y: auto;">
                        <iframe id="ContractStopInformation" src="ContractStopInformation.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="panel-body" id="div4" style="padding: 0px; overflow-y: auto;">
                        <iframe id="ContractImplementInformation" src="ContractImplementInformation.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-5" class="tab-pane">
                    <div class="panel-body" id="div5" style="padding: 0px; overflow-y: auto;">
                        <iframe id="ContractAssessmentInformation" src="ContractAssessmentInformation.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-6" class="tab-pane">
                    <div class="panel-body" id="div6" style="padding: 0px; overflow-y: auto;">
                        <iframe id="PlanningDeclaration" src="PlanningDeclaration.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-7" class="tab-pane">
                    <div class="panel-body" id="div7" style="padding: 0px; overflow-y: auto;">
                        <iframe id="PlanningApproval" src="PlanningApproval.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-8" class="tab-pane">
                    <div class="panel-body" id="div8" style="padding: 0px; overflow-y: auto;">
                        <iframe id="PaymentApproval" src="PaymentApproval.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-9" class="tab-pane">
                    <div class="panel-body" id="div9" style="padding: 0px; overflow-y: auto;">
                        <iframe id="CostFundManagement" src="CostFundManagement.aspx" style="width: 100%; border: none; overflow-y: auto;" class="Frm"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="Id" id="Id" value="" runat="server" />
        <input type="hidden" name="SortDepCode" id="SortDepCode" value="" />
        <input type="hidden" name="OpType" id="OpType" value="" runat="server" />
        <input type="hidden" name="changBS" id="changBS" value="" runat="server" />
        <input type="hidden" name="LimitedOperation" id="LimitedOperation" value="" runat="server" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <script type="text/javascript">
            //合同开始年度
            var contratYear;
            function InitTableHeight() {
                var h = $(window).height() / 2;
                $("#DivB").css({ "height": h + "px" });
                $("#TableContainer").css({ "height": h + "px" });
                //li的高度
                var liHeight = $("#liHeight").height();

                document.getElementById("div1").style.height = h - liHeight + "px";
                document.getElementById("ContractReviewInformation").style.height = h - liHeight + "px";
                document.getElementById("div2").style.height = h - liHeight + "px";
                document.getElementById("ContractChangeInformation").style.height = h - liHeight + "px";
                document.getElementById("div3").style.height = h - liHeight + "px";
                document.getElementById("ContractStopInformation").style.height = h - liHeight + "px";
                document.getElementById("div4").style.height = h - liHeight + "px";
                document.getElementById("ContractImplementInformation").style.height = h - liHeight + "px";
                document.getElementById("div5").style.height = h - liHeight + "px";
                document.getElementById("ContractAssessmentInformation").style.height = h - liHeight + "px";
                document.getElementById("div6").style.height = h - liHeight + "px";
                document.getElementById("PlanningDeclaration").style.height = h - liHeight + "px";
                document.getElementById("div7").style.height = h - liHeight + "px";
                document.getElementById("PlanningApproval").style.height = h - liHeight + "px";
                document.getElementById("div8").style.height = h - liHeight + "px";
                document.getElementById("PaymentApproval").style.height = h - liHeight + "px";
                document.getElementById("div9").style.height = h - liHeight + "px";
                document.getElementById("CostFundManagement").style.height = h - liHeight + "px";
            }
            InitTableHeight();

            //初始化异动审批页面
            $(function () {
                if ($("#changBS").val() == "1") {
                    $("#ContractReviewInformation").attr("src", "ContractReviewInformation.aspx?Id=" + $("#Id").val() + "&changBS=" + $("#changBS").val());
                } else {
                    $("#ContractReviewInformation").attr("src", "ContractReviewInformation.aspx?Id=" + $("#Id").val() + "&changBS=" + null + "&OpType=" + $("#OpType").val());
                }
            })

            function IsSupplier(isOk) {
                //是否战略分供方 0是  1否
                document.getElementById("SupplierName").setAttribute('onclick', isOk.value == 0 ? 'javascript:loadSupplierClick()' : 'javascript:removeSupplierClick()');
               // $('#SupplierName').validatebox('options').required = isOk.value == 0 ? true : false;
            }
            //注册事件
            function loadSupplierClick() {
                HDialog.Open(1000, 500, '../DialogNew/CostSearchSupplier.aspx', '选择供应商', true, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        //选择供应商
                        $("#SupplierId").val(Obj.Id);
                        $("#SupplierName").val(Obj.SupplierName);
                        $("#StrategySupplierNo").val(Obj.SupplierNum);
                        $("#LinkMan").val(Obj.Contacts);
                        $("#LinkTel").val(Obj.ContactTel);
                        getSupplierPriorPeriodMoney(Obj.Id);
                    }
                });
            }

            function getSupplierPriorPeriodMoney(Id) {
                $.tool.DataGet('CsCost', 'getSupplierPriorPeriodMoney', 'Id=' + Id,
                    function Init() {
                    },
                    function callback(_Data) {
                        $('#PriorPeriodMoney').val(_Data);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //移除供应商事件
            function removeSupplierClick() {
                $("#SupplierId").val('');
                $("#SupplierName").val('');
                $("#StrategySupplierNo").val('');
                $("#LinkMan").val('');
                $("#LinkTel").val('');
                $('#PriorPeriodMoney').val('');
            }

            $(".tabs-container li").click(function () {
                var refpage = $(this).attr("refpage");
                var refsel = $(this).attr("refsel");
                //获得任务id
                $("#" + refpage).attr("src", refpage + ".aspx?Id=" + $("#Id").val() + "&OpType=" + $("#OpType").val() + "&changBS=" + $("#changBS").val() + "&LimitedOperation=" + $("#LimitedOperation").val())
                $(this).attr("refsel", "1");
            });

            //查看合同详情
            function MtShow() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                if ($("#SupplierId").val() == null || $("#SupplierId").val() == "" || $("#SupplierId").val() == undefined) {
                    HDialog.Info("请选择供应商");
                    return;
                }
                HDialog.Open(w, h, '../Mt/MtSupplierFrame.aspx?OpType=edit&Id=' + $("#SupplierId").val(), '查看供应商信息', true, function callback(_Data) {
                });
            }

            //修改加载设备信息
            function Load() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CsCost', 'SelContractInformation', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();
                                $("#frmFrom").form('validate');
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                    if ($("#changBS").val() == "1") {
                        document.getElementById("BtnClose").style.display = "none";
                        document.getElementById("BtnSave").style.display = "none";
                    }

                    //判断该合同是否评审，如果已评审则限制修改
                    $.tool.DataGet('CsCost', 'GetContractReviewModel', 'Id=' + $("#Id").val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                $('#frmFrom').find('input,textarea,select').not(':button,:hidden').prop('disabled', true);

                                $('#ContractNo').prop('disabled', false);
                                $('#SignPersonName').prop('disabled', false);
                                $('#SignTime').prop('disabled', false);

                                //设置合同招标信息、合同费用信息不可操作，只能查看
                                $("#LimitedOperation").val("LimitedOperation");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
            function Submitted() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                if ($("#Id").val() != "") {
                    var Equal = false;
                    $.tool.DataPostChk('frmFrom', 'CsCost', 'ContractMoneyEqualCharge', $('#frmFrom').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Open(w, 600, '../CostManageNew/ContractReviewProcess.aspx?OpType=edit&CId=' + $("#Id").val(), '修改合同评审信息', true, function callback(_Data) {

                                });
                            } else {
                                HDialog.Info("合同金额与合同费用明细总和不相等，无法送审");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
            function Save() {
                $.tool.DataPostChk('frmFrom', 'CsCost', 'SaveContractInformation', $('#frmFrom').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "" && _Data != null && _Data != undefined && _Data != "null") {
                            HDialog.Info("保存成功");
                            window.parent.location.href = '../CostManageNew/FromTabs.aspx?OpType=edit&Id=' + _Data;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            Load();

            //新增修改保存设备信息
            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            //选择项目
            function SelItem() {
                //HDialog.Open('370', '360', '../DialogNew/SelItem.aspx', '选择项目', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split(',');
                //        $("#CommId").val(varObjects[2]);
                //        $("#CommName").val(varObjects[1]);
                //    }
                //});
                //HDialog.Open('500', '500', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                //        $("#CommId").val(varObjects.attributes.InPopedom);
                //        $("#CommName").val(varObjects.text);
                //    }
                //});
                HDialog.Open(800, 500, '../DialogNew/SelComm.aspx', "选择项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommId").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }

            //选择部门
            function SelDep() {
                //HDialog.Open('370', '360', '../dialog/DepartmentDlg_hr.aspx', '选择部门', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split('\t');
                //        $("#DepCode").val(varObjects[0]);
                //        $("#DepName").val(varObjects[1]);
                //    }
                //});
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle_Cost.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                        $("#ContractUnit").val(arrRet[1]);
                        $("#SortDepCode").val(arrRet[3]);
                        $("#PayDepCode").val(arrRet[0]);
                        $("#PayDepName").val(arrRet[1]);
                    }
                });
            }

            //选择费用主管部门
            function SelPayDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择费用主管部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#PayDepCode").val(arrRet[0]);
                        $("#PayDepName").val(arrRet[1]);
                    }
                });
            }

            //选择签约单位
            function SelDepContractUnit() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择签约单位', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#ContractUnit").val(arrRet[1]);
                    }
                });
            }

            function ContractEndChange() {
                var s = $("#ContractBegin").val(), e = $("#ContractEnd").val();
                if (!!s && !!e) {
                    var newDate = new Date(e).getTime() - new Date(s).getTime();
                    var year = Math.ceil(newDate / 1000 / 60 / 60 / 24 / 365);
                    if (isNaN(year)) {
                        year = 0;
                    }
                    $("#ContractPeriod").val(year);
                }
            }


            /**
             * 计算时间戳之间的差值
             * @param startTime 开始时间戳
             * @param endTime 结束时间戳
             * @param type 返回指定类型差值(year, month, day, hour, minute, second)
             */
            function DateDiff(startTime, endTime, type) {
                var timeDiff = endTime - startTime
                switch (type) {
                    case "year":
                        return Math.floor(timeDiff / 86400 / 365);
                        break;
                    case "month":
                        return Math.floor(timeDiff / 86400 / 30);
                        break;
                    case "day":
                        return Math.floor(timeDiff / 86400);
                        break;
                    case "hour":
                        return Math.floor(timeDiff / 3600);
                        break;
                    case "minute":
                        return Math.floor(timeDiff / 60);
                        break;
                    case "second":
                        return timeDiff % 60;
                        break;
                }
            }
            //选择工作计划
            function SelWorkPlan() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                debugger;
                var year = '';
                if ($("#ContractBegin").val() != "") {
                    year = $("#ContractBegin").val().substr(0, 4);
                }
                HDialog.Open(w, h, '../Plan/PlanSingleReferenceImportan.aspx?PlanYear=' + year, '选择工作计划', true, function callback(_Data) {
                    if (_Data != null && _Data != undefined) {
                        var arrRet = _Data.split(";");
                        $("#WorkPlanId").val(arrRet[0]);
                        $("#WorkPlanName").val(arrRet[2]);
                    }
                });
            }

            //选择责任人
            function SelUserSerPrincipal() {
                if ($("#DepCode").val() == null || $("#DepCode").val() == "" || $("#DepCode").val() == undefined) {
                    HDialog.Info("请先选择机构");
                    return;
                }
                HDialog.Open('740', '450', '../DialogNew/DepartSelUser.aspx?DepCode=' + $("#SortDepCode").val(), '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#Principal").val(varObjects.UserCode);
                        $("#PrincipalName").val(varObjects.UserName);
                    }
                });
            }

            //选择签署人
            function SelUserSerSignPerson() {
                HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#SignPerson").val(varObjects.UserCode);
                        $("#SignPersonName").val(varObjects.UserName);
                    }
                });
            }

            //选择合同类型
            function SelContractType() {
                HDialog.Open('400', '350', '../DialogNew/CostContractType.aspx', '选择合同类别', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#ContractType").val(varObjects[0]);
                        $("#TypeName").val(varObjects[1]);
                    }
                });
            }

            //选择合同内容
            function SelContractContent() {
                var val = $("#ContractType").val();
                if (val == null || val == "" || val == undefined) {
                    HDialog.Info("请先选择合同类型");
                    return;
                }
                HDialog.Open('500', '400', '../DialogNew/CostContractContent.aspx?CtId=' + val, '选择合同内容', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.replace(/-/g, ';');
                        varObjects = varObjects.substr(1, varObjects.length);
                        $("#ContractContent").val(varObjects);
                    }
                });
            }

            //合同年度变更清空关联工作计划
            function ClearPlan() {
                if (contratYear != $("#ContractBegin").val().substr(0, 4)) {
                    $("#WorkPlanId").val('');
                    $("#WorkPlanName").val('');
                }
                //年度变更
                contratYear = $("#ContractBegin").val().substr(0, 4);
            }

            function Close() {
                parent.window.location.href = 'ContractSigning.aspx';
            }
        </script>
    </form>
</body>
</html>
