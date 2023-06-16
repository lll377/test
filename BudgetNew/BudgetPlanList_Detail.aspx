<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetPlanList_Detail.aspx.cs" Inherits="M_Main.BudgetNew.BudgetPlanList_Detail" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算计划管理-详细页面</title>
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
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/GetWorkFlowId.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            overflow: hidden;
            background-color: #f5f5f5;
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

        .datagrid-body .datagrid-editable {
            margin: 0px;
        }

        .position_absolute {
            position: absolute;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="PlanId" name="PlanId" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="CommId" name="CommId" runat="server" />
        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
        <input type="hidden" id="BussId" name="BussId" runat="server" />
        <!-- 预算主表数据 -->
        <input type="hidden" id="MainResult" name="MainResult" value="" runat="server" />
        <!-- 预算附表数据 -->
        <input type="hidden" id="ViceResult" name="ViceResult" value="" runat="server" />
        <!-- 预算明细表数据 -->
        <input type="hidden" id="DetailResult" name="DetailResult" value="" runat="server" />
        <!-- 是否是上级单位 -->
        <input type="hidden" id="IsUpUnit" name="IsUpUnit" value="0" runat="server" />
        <!-- 是否修改过单位或者是年度或者是模板 预算主数据修改过 -->
        <input type="hidden" id="IsEditMainData" name="IsEditMainData" value="1" runat="server" />
        <!-- 是否修改过预算明细数据 -->
        <input type="hidden" id="IsEditDetailData" name="isEditDetailData" value="1" runat="server" />
        <!-- 科目层数 -->
        <input type="hidden" id="ProgramLevel" name="ProgramLevel" value="0" runat="server" />
        <!-- 返回插入数据 -->
        <input type="hidden" id="ReturnResult" name="ReturnResult" value="" runat="server" />
        <!-- 按钮工具栏 -->
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
            <input id="BtnSaveStartWorkFlow" type="submit" value="送审" onclientclick="ClientClick()" onserverclick="BtnSaveStartWorkFlow_ServerClick" runat="server" />
            <input id="BtnSave" type="submit" value="保存" onserverclick="BtnSave_ServerClick" runat="server" />
        </div>
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="BasicInfo" refsel="1">
                    <a data-toggle="tab" href="#tab-1" aria-expanded="true">基础信息</a>
                </li>
                <li class="" refpage="MainInfo" refsel="0">
                    <a data-toggle="tab" href="#tab-2" aria-expanded="false">预算主表</a>
                </li>
                <li class="" refpage="DetailInfo" refsel="0">
                    <a data-toggle="tab" href="#tab-4" aria-expanded="false">预算详表</a>
                </li>
                <li class="" refpage="ViceInfo" refsel="0">
                    <a data-toggle="tab" href="#tab-3" aria-expanded="false">预算附件</a>
                </li>
            </ul>
            <div class="tab-content">
                <!-- 基础信息 -->
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
                        <!-- 基础信息 -->
                        <table class="DialogTable">
                            <tr>
                                <td class="DialogTdTitle">计划表编号：
                                </td>
                                <td class="DialogTdContent">
                                    <label runat="server" id="PlanNO" name="PlanNO"></label>
                                </td>
                                <td class="DialogTdTitle">预算单位：</td>
                                <td class="DialogTdContent">
                                    <input id="BudgetCompany" name="BudgetCompany" class="easyui-validatebox" runat="server" onclick="SelUnit();" readonly="readonly" data-options="required:true" />
                                    <input type="hidden" id="BudgetCompanyCode" name="BudgetCompanyCode" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="DialogTdTitle">预算年度：
                                </td>
                                <td class="DialogTdContent">
                                    <select id="BudgetYear" name="BudgetYear" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto',required:true,onSelect:BudgetYearChange" runat="server" style="width: 110px;">
                                        <option value=""></option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                    </select>
                                </td>
                                <td class="DialogTdTitle">预算模板：
                                </td>
                                <td class="DialogTdContent">
                                    <input id="BudgetTemplate" name="BudgetTemplate" class="easyui-validatebox" runat="server" readonly="readonly" onclick="SelTemplate();" data-options="required:true" />
                                    <input type="hidden" id="BudgetTemplateCode" name="BudgetTemplateCode" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="DialogTdTitle">预算币别：
                                </td>
                                <td class="DialogTdContent">
                                    <select id="BudgetCurrency" name="BudgetCurrency" runat="server" isdctype="true" dctype="预算币别" style="width: 110px; border: 1px #cccccc solid;"
                                        class="easyui-combobox" data-options="valueField:'Id',textField:'Name',editable:false,panelHeight: 'auto',required:true,onSelect:SelBudgetCurrency">
                                    </select>
                                    <input type="hidden" id="BudgetCurrencyCode" name="BudgetCurrencyCode" runat="server" />
                                </td>
                                <td class="DialogTdTitle">默认单位：
                                </td>
                                <td class="DialogTdContent">
                                    <select id="BudgetUnit" name="BudgetUnit" runat="server" isdctype="true" dctype="默认单位" style="width: 110px; border: 1px #cccccc solid;"
                                        class="easyui-combobox" data-options="valueField:'Id',textField:'Name',editable:false,panelHeight: 'auto',required:true,onSelect:SelBudgetUnit">
                                    </select>
                                    <input type="hidden" id="BudgetUnitCode" name="BudgetUnitCode" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="DialogTdTitle">计划人：
                                </td>
                                <td class="DialogTdContent">
                                    <input id="BudgetPlanUser" name="BudgetPlanUser" class="easyui-validatebox"  readonly onclick="SelPerson();" data-options="required:true" runat="server" />
                                    <input type="hidden" id="BudgetPlanUserCode" name="BudgetPlanUserCode" runat="server" />
                                </td>
                                <td class="DialogTdTitle">计划时间：
                                </td>
                                <td class="DialogTdContent">
                                    <input type="text" class="easyui-datebox" data-options="required:true,editable:false,disabled:true" id="BudgetPlanDate" name="BudgetPlanDate" style="width: 110px;" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="DialogTdTitle">预算表名称：
                                </td>
                                <td class="DialogTdContent" colspan="3">
                                    <input type="text" class="easyui-validatebox" data-options="required:true" id="BudgetTableName" style="width: 91%;" name="BudgetTableName" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="DialogTdTitle">备注：
                                </td>
                                <td class="DialogTdContent" colspan="3">
                                    <input type="text" class="easyui-validatebox" id="Memo" name="Memo" style="width: 91%;" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="DialogTdTitle" style="color: red; font-size: 14px;">提示：编辑预算计划数据时，请勿随意修改【预算年度】【预算单位】【预算模板】【默认单位】，修改这些数据会导致预算主表刷新造成已录入数据丢失;</td>
                            </tr>
                        </table>
                        <!-- 流程内容 -->
                        <div id="OAFlow" style="height: auto; margin: 0px auto;">
                            <uc1:BussListWorkFlow ID="WorkFlowManage" runat="server"></uc1:BussListWorkFlow>
                            <uc1:BussApproved runat="server" ID="CheckLevelInfo" />
                        </div>
                    </div>
                </div>
                <!-- 预算主表 -->
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="overflow: hidden;">
                        <iframe id="UploadExcelFrame" style="display: none;"></iframe>
                        <div id="TableContainerMain"></div>
                    </div>
                </div>
                <!-- 预算附件 -->
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="overflow: hidden;">
                        <iframe id="UploadFrame" style="display: none;"></iframe>
                        <div id="TableContainerVice"></div>
                    </div>
                </div>
                <!-- 预算明细表 -->
                <div id="tab-4" class="tab-pane">
                    <div class="panel-body" style="overflow: hidden; background-color: #F5F5F5;">
                        <iframe id="UploadDetailExcelFrame" style="display: none;"></iframe>
                        <div style="z-index: 10000; margin: 5px 10px;" class="position_absolute">
                            <label>预算月份：</label>
                            <select id="BudgetMonth" name="BudgetMonth" class="easyui-combobox" style="width: 50px;" data-options="editable:false,onSelect:BudgetMonthChange">
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                        <div id="TableContainerDetail"></div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="IsBakRole" name="IsBakRole" value="0" runat="server" />
    </form>
    <script type="text/javascript">

        $(document).ready(function () {
            //加载字典设置
            function LoadDictionary() {
                $("select[isdctype='true']").each(function (i) {
                    var nId = $(this).attr("id");

                    $.tool.DataPostAsync('CsCost', 'BindDictionary', 'DcTypeName=' + $(this).attr("dctype"),
                        function Init() {
                        },
                        function callback(_Data) {
                            //加载值
                            var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")");
                            $('#' + nId).combobox("loadData", varObjects);

                            //预算币别
                            if (nId == "BudgetCurrency") {
                                if ($('#OpType').val() == "insert") {
                                    for (var i = 0; i < varObjects.length; i++) {
                                        if (varObjects[i].Name == "人民币") {
                                            $('#BudgetCurrency').combobox("select", varObjects[i].Id);
                                        }
                                    }
                                } else {
                                    $('#BudgetCurrency').combobox("select", $('#BudgetCurrencyCode').val());
                                }
                            }
                            //预算默认单位
                            if (nId == "BudgetUnit") {
                                if ($('#OpType').val() == "insert") {
                                    for (var i = 0; i < varObjects.length; i++) {
                                        if (varObjects[i].Name == "元") {
                                            $('#BudgetUnit').combobox("select", varObjects[i].Id);
                                        }
                                    }
                                } else {
                                    $('#BudgetUnit').combobox("select", $('#BudgetUnitCode').val());

                                }
                                LoadBudgetTime = 1;
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                });
            }
            if ($('#IsUpUnit').val() == "1") {
                $('#BudgetTemplate').validatebox('remove');
            }
            if ($('#OpType').val() == "edit") {
                $(".DialogTable input").attr("disabled", "disabled");
                $("#frmForm .easyui-combobox").combobox({ disabled: true });
                $('#BudgetMonth').combobox({ disabled: false });
                if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                    $('#BudgetTableName').removeAttr("disabled");
                    $('#Memo').removeAttr("disabled");
                    $('#BudgetPlanUser').removeAttr("disabled");
                    $('#BudgetPlanUserCode').removeAttr("disabled");
                    //$('.datebox').children().removeAttr("disabled");
                } else {
                    $('#BudgetMonth').parent().removeClass("position_absolute");
                }
            }
            //zmh 2017-11-14 预算计划在审核完成后还有可能会修改 所以放出驳回按钮用于一直修改预算计划
            if ($("#State").val() == "已审核") {
                CheckAuthority('1050', function callback(_Data) {
                    if (_Data == "true") {
                        $('#IsBakRole').val("1");
                    }
                });
            } else {
                $('#IsBakRole').val("1");
            }
            LoadDictionary();
        });

        function InitTableHeight() {
            var h = $(window).height() - 80;
            var w = $(window).width();
            $(".panel-body").css({ "height": h + "px" });
            $("#OAFlow").css("width", (w - 60) + "px");
            $(".DialogTable").css("width", (w - 60) + "px");
            $('#UploadFrame').attr("src", "../BudgetNew/BudgetUploadFile.aspx?DetailId=" + $('#PlanId').val());
            $('#UploadExcelFrame').attr("src", '../BudgetNew/BudgetPlanUploadExcel.aspx');
            //预算明细导入页面 
            $('#UploadDetailExcelFrame').attr("src", '../BudgetNew/BudgetPlanDetailUploadExcel.aspx');
        }
        InitTableHeight();

        $(".tabs-container li").click(function () {
            var refpage = $(this).attr("refpage");
            var refsel = $(this).attr("refsel");
            $(this).attr("refsel", "1");
            //关闭编辑状态
            endEditing();
            if ((refpage == "MainInfo" || refpage == "ViceInfo" || refpage == "DetailInfo") && refsel != "1" || $('#IsEditMainData').val() == "1" || $('#IsEditDetailData').val() == "1") {
                $.tool.pageLoading();
            }
            setTimeout(function () {
                if (refpage == "MainInfo" && $('#IsEditMainData').val() == "1") {
                    $('#IsEditMainData').val("0");
                    LoadMainList();
                } else if (refpage == "ViceInfo" && refsel != "1") {
                    LoadViceList();
                } else if (refpage == "DetailInfo" && $('#IsEditDetailData').val() == "1") {
                    $('#IsEditDetailData').val("0");
                    LoadDetailList();
                } else {
                    $.tool.pageUnLoading();
                }
            }, 100);
        });

        //***设置预算表名称
        function SetBudgetTableName() {
            if ($('#BudgetYear').combobox("getValue") != "") {
                var BudgetTableNameStr = $('#BudgetCompany').val() + " " + $('#BudgetYear').combobox("getValue") + "年度" + " 财务预算表";
                $('#BudgetTableName').val(BudgetTableNameStr);
            }
        }

        //***选择预算模板
        function SelTemplate() {
            //上级单位 不用选模板
            if ($('#IsUpUnit').val() == "1") {
                return false;
            }
            HDialog.Open('400', '350', '../BudgetNew/BudgetTemplateDialog.aspx', '选择预算模板', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    var varObjects = _Data.split(',');
                    $('#BudgetTemplate').val(varObjects[1]);
                    $('#BudgetTemplateCode').val(varObjects[0]);
                    //判断是否是选择了年度，并且选择了预算单位
                    if ($('#BudgetYear').combobox("getValue") != "" && $('#BudgetCompanyCode').val() != "") {
                        LoadMainData();
                        LoadDetailData();
                    }
                }
            });
        }

        //***选择预算币别
        function SelBudgetCurrency() {
            var BudgetCurrencyStr = $('#BudgetCurrency').combobox("getValue");
            $('#BudgetCurrencyCode').val(BudgetCurrencyStr);
        }
        var LoadBudgetTime = 0;
        //****选择默认单位
        function SelBudgetUnit() {
            var BudgetUnitStr = $('#BudgetUnit').combobox("getValue");
            $('#BudgetUnitCode').val(BudgetUnitStr);
            if (LoadBudgetTime == 0) {
                return;
            }
            if ($('#IsUpUnit').val() == "0") {
                //不是上级单位(就必须要有预算模板)
                if ($('#BudgetYear').combobox("getValue") != "" && $('#BudgetTemplateCode').val() != "" && $('#BudgetCompanyCode').val() != "") {
                    LoadMainData();
                    LoadDetailData();
                }
            } else if ($('#IsUpUnit').val() == "1") {
                //是上级单位
                if ($('#BudgetYear').combobox("getValue") != "" && $('#BudgetCompanyCode').val() != "") {
                    LoadMainData();
                    LoadDetailData();
                }
            }
        }
        //***选择年度改变
        function BudgetYearChange() {
            //判断预算年度 该预算单位是否已经填写过数据了
            if ($('#BudgetCompanyCode').val() != "") {
                ValidateIsBudgetYet("year");
            }
        }


        //选择预算单位
        function SelUnit() {
            HDialog.Open('400', '350', '../DialogNew/SelBudgetCompany.aspx', '选择预算单位', true, function callback(_Data) {
                if (_Data != "") {//**获得返回的参数信息
                    var varObjects = _Data.split(',');
                    $('#BudgetCompany').val(varObjects[1]);
                    $('#BudgetCompanyCode').val(varObjects[0]);
                    //判断选择的预算单位是否是上级单位
                    $.tool.DataGet('Budget', 'IsSubordinateUnit', 'BudgetCompany=' + varObjects[0],
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "" && _Data == "true") {
                                //如果是上级单位的话就可以不用选择模板了
                                //$('#BudgetTemplate').validatebox({"required":false})
                                $('#BudgetTemplate').validatebox('remove');
                                $('#IsUpUnit').val("1");
                                //删除模板内容
                                $('#BudgetTemplate').val('');
                                $('#BudgetTemplateCode').val('');
                            } else {
                                $('#BudgetTemplate').validatebox('reduce');
                                $('#IsUpUnit').val("0");
                            }
                            if ($('#BudgetYear').combobox("getValue") != "") {
                                //验证是否做过预算
                                ValidateIsBudgetYet("unit");
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                }
            });
        }

        //***验证预算单位该年是否已经做过预算了
        function ValidateIsBudgetYet(mark) {
            $.tool.DataGet('Budget', 'ValidateIsBudgetYet', 'BudgetYear=' + $('#BudgetYear').combobox("getValue") + "&BudgetCompanyCode=" + $('#BudgetCompanyCode').val(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != "" && _Data == "true") {
                        //判断是否是预算单位和预算年度都填写了如果填写了就需要调整预算表名称
                        SetBudgetTableName();
                        //判断是否是选择了年度 单位 模板（如果是上级单位的话就不用选择模板了）
                        if ($('#IsUpUnit').val() == "0") {
                            //不是上级单位(就必须要有预算模板)
                            if ($('#BudgetYear').combobox("getValue") != "" && $('#BudgetTemplateCode').val() != "" && $('#BudgetCompanyCode').val() != "") {
                                LoadMainData();
                                LoadDetailData();
                            }
                        } else if ($('#IsUpUnit').val() == "1") {
                            //是上级单位
                            if ($('#BudgetYear').combobox("getValue") != "" && $('#BudgetCompanyCode').val() != "") {
                                LoadMainData();
                                LoadDetailData();
                            }
                        }
                    } else {
                        //已经做过预算就将年度和单位清空
                        if (mark == "year") {
                            $('#BudgetYear').combobox("select", "");
                        } else if (mark == "unit") {
                            $('#BudgetCompany').val("");
                            $('#BudgetCompanyCode').val("");
                        }
                        //已经做过预算了就 不能再继续做预算 就不能选择年度 
                        var BudgetTableNameStr = $('#BudgetCompany').val() + " " + $('#BudgetYear').combobox("getValue") + "年度 " + "已编制预算计划";
                        HDialog.Info(BudgetTableNameStr);
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        }

        //****加载预算主数据
        function LoadMainData() {
            $.tool.DataGet('Budget', 'GetBudgetPlanMainData', 'PlanID=' + $('#PlanId').val() + "&BudgetYear=" + $('#BudgetYear').combobox("getValue")
                + "&BudgetCompany=" + $('#BudgetCompanyCode').val() + "&BudgetTemplate=" + $('#BudgetTemplateCode').val() + "&Flag=0" + "&BudgetUnit=" + $('#BudgetUnitCode').val(),
                function Init() {
                },
                function callback(_Data) {
                    //if (_Data != "") {
                    $('#IsEditMainData').val("1");
                    $('#MainResult').val(_Data);
                    editIndex = undefined;
                    //}
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        //****加载预算明细数据
        function LoadDetailData() {
            $.tool.DataGet('Budget', 'GetBudgetPlanDetailData', 'PlanID=' + $('#PlanId').val() + "&BudgetYear=" + $('#BudgetYear').combobox("getValue")
                + "&BudgetCompany=" + $('#BudgetCompanyCode').val() + "&BudgetTemplate=" + $('#BudgetTemplateCode').val() + "&Flag=0" + "&BudgetUnit=" + $('#BudgetUnitCode').val(),
                function Init() {
                },
                function callback(_Data) {
                    $('#IsEditDetailData').val("1");
                    if (_Data != "") {
                        var arr = _Data.split('~');
                        if (arr.length > 0) {
                            $('#ProgramLevel').val(arr[1]);
                            $('#DetailResult').val(arr[0]);
                        }
                    }
                    editIndexForDetail = undefined;
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }

        //***选择计划人
        function SelPerson() {
            HDialog.Open('800', '544', '../OAWorkFlowNew/SelOpr.aspx?Cmd=5&MultiLine=0&WorkInfoId=-1&random=' + Math.random(), '选择计划人', false, function callback(_Data) {
                if (_Data != '') {
                    var Ret = Cache.GetData("SelOrp.aspx_Return");
                    var obj = JSON.parse(Ret);
                    if (obj != null) {
                        var arrUserList = obj[0].split(',');
                        $("#BudgetPlanUserCode").val(arrUserList[1]);
                        $("#BudgetPlanUser").val(arrUserList[0].split(']')[1]);
                    }
                }
            });
        }
        /* datagrid列名 */
        //***预算主表列
        var columnMain = [[
            { field: 'text', title: '预算科目', width: 160, align: 'left', sortable: true },
            {
                field: 'LastYearBudgetValue', title: '上年预算值', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                    if (value == undefined || value == null || value == "") {
                        return '0.00';
                    }
                    return value;
                }
            },
            {
                field: 'LastYearCompleteValue', title: '上年完成值', width: 80, align: 'center', sortable: true, formatter: function (value, row, index) {
                    if (value == undefined || value == null || value == "") {
                        return '0.00';
                    }
                    return value;
                }
            },
            { field: 'BudgetValueForYear', title: '本年预算值', width: 80, align: 'center', sortable: true },
            { field: '1Y', title: '1月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '2Y', title: '2月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '3Y', title: '3月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '4Y', title: '4月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '5Y', title: '5月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '6Y', title: '6月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '7Y', title: '7月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '8Y', title: '8月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '9Y', title: '9月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '10Y', title: '10月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '11Y', title: '11月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '12Y', title: '12月', align: 'center', width: 60, sortable: true, editor: 'text' }
        ]];
        //***预算附表列
        var columnVice = [[
            { field: 'Id', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },
            { field: 'FileName', title: '附件名称', width: 80, align: 'left', sortable: true },
            {
                field: 'FilePath', title: '查看附件', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                    var str = "<a style=\"color:blue\" href=\".." + encodeURI(row.FilePath) + "\" target=\"_blank\">查看附件</a>";
                    return str;
                }
            },
            { field: 'CreateDate', title: '添加时间', width: 80, align: 'left', sortable: true }
        ]];
        //***预算明细表列
        var columnDetail = [[
            { field: '1级科目', title: '1级科目', align: 'center', width: 100, sortable: true },
            //{ field: 'YearBudgetCode', title: '年度预算代码', align: 'center', width: 100, sortable: true, editor: 'text', hidden: true },
            { field: 'SubjectCode', title: '科目代码', align: 'center', width: 100, sortable: true, hidden: true },
            { field: 'YSYF', title: '预算月份', align: 'center', width: 100, sortable: true, hidden: true },
            { field: 'PlanCoding', title: '计划编码', align: 'center', width: 100, sortable: true, editor: 'text' },
            { field: 'PlanYear', title: '计划年度', align: 'center', width: 100, sortable: true, editor: 'text' },
            { field: 'PlanMonth', title: '计划月度', align: 'center', width: 100, sortable: true, editor: 'text' },
            { field: 'PlanName', title: '计划名称', align: 'center', width: 160, sortable: true, editor: 'text' },
            {
                field: 'PlanStartTime', title: '计划开始时间', align: 'center', width: 100, sortable: true, editor: 'text',
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanStartTime, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'PlanEndTime', title: '计划结束时间', align: 'center', width: 100, sortable: true, editor: 'text',
                formatter: function (value, row, index) {
                    var str = formatDate(row.PlanEndTime, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'Target', title: '计划目标', align: 'center', width: 200, sortable: true, editor: 'text' },
            {
                field: 'BudgetValueForYear', title: '计划费用(元)', align: 'center', width: 100, sortable: true, editor: {
                    type: 'numberbox',
                    options: {
                        precision: 2
                    }, formatter: function (value, row, index) {
                        return formatNumber(value, 2);
                    }
                }, formatter: function (value, row, index) {
                    if (value == undefined || value == null || value == "") {
                        return '0.00';
                    }
                    return ToDecimal(value, decimalPos);
                }
            }
            //{ field: 'SubjectFinancialSubjectsName', title: '财务账套', align: 'center', width: 100, sortable: true },
            //{ field: 'WorkContent', title: '工作内容', align: 'center', width: 100, sortable: true, editor: 'text' },
            //{
            //    field: 'WorkBeginTime', title: '开始时间', align: 'center', width: 80, sortable: true, editor: 'text',
            //    formatter: function (value, row, index) {
            //        var str = formatDate(row.WorkBeginTime, "yyyy-MM-dd");
            //        return str;
            //    }
            //},
            //{
            //    field: 'WorkEndTime', title: '完成时间', align: 'center', width: 80, sortable: true, editor: 'text',
            //    formatter: function (value, row, index) {
            //        var str = formatDate(row.WorkEndTime, "yyyy-MM-dd");
            //        return str;
            //    }
            //},
            //{ field: 'WorkStandard', title: '完成标准', align: 'center', width: 100, sortable: true, editor: 'text' },
            //{
            //    field: 'BudgetValueForYear', title: '预算金额', align: 'center', width: 100, sortable: true, editor: {
            //        type: 'numberbox',
            //        options: {
            //            precision: 2
            //        }, formatter: function (value, row, index) {
            //            return formatNumber(value, 2);
            //        }
            //    }, formatter: function (value, row, index) {
            //        if (value == undefined || value == null || value == "") {
            //            return '0.00';
            //        }
            //        return ToDecimal(value, decimalPos);
            //    }
            //}
        ]];

        /** 
         * 格式化数字，小数点后是0不表示 
         * @param value 
         * @param fixed 小数位数 
         */
        function formatNumber(value, fixed) {
            var number = Number(value);
            if (isNaN(number)) {
                return '';
            } else {
                if (fixed == 2) {
                    return number.toFixed(2) * 100 / 100;
                } else if (fixed == 6) {
                    return number.toFixed(6) * 1000000 / 1000000;
                }
            }
        }
        /* datagrid工具栏 */
        //**预算主表工具栏
        var toolbar_Main = [
            //预算主表只需要查看功能，不需要编辑功能
            //{
            //    text: '引用上年',
            //    iconCls: 'icon-edit',
            //    handler: function () {
            //        if ($('#IsUpUnit').val() == "1") {
            //            HDialog.Info("上级单位不允许引用上年预算数据");
            //            return;
            //        }
            //        var rowData = $('#TableContainerMain').treegrid("getData");
            //        if (rowData.length == 0) {
            //            HDialog.Info('没有预算计划数据');
            //            return false;
            //        }

            //        CitingLastYear();
            //    }
            //}, '-',
            //{
            //    text: '导出模板',
            //    iconCls: 'icon-page_white_excel',
            //    handler: function () {
            //        if ($('#BudgetYear').combobox("getValue") == "") {
            //            HDialog.Info("请选择预算年度");
            //            return;
            //        }
            //        if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
            //            HDialog.Info("请选择预算单位");
            //            return;
            //        }
            //        if ($('#IsUpUnit').val() == "0") {
            //            //不是上级单位就需要选择模板
            //            if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
            //                HDialog.Info("请选择预算模板");
            //                return;
            //            }
            //        }
            //        var rowData = $('#TableContainerMain').treegrid("getData");
            //        if (rowData.length == 0) {
            //            HDialog.Info('没有预算计划数据导出');
            //        }
            //        else {
            //            Export('预算计划模板', $('#TableContainerMain'));

            //        }
            //    }
            //}, '-',
            //{
            //    text: 'Excel导入',
            //    iconCls: 'icon-page_white_excel',
            //    handler: function () {
            //        if ($('#IsUpUnit').val() == "1") {
            //            HDialog.Info("上级单位不允许导入预算数据");
            //            return;
            //        }
            //        if ($('#IsUpUnit').val() == "0") {
            //            //不是上级单位就需要选择模板
            //            if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
            //                HDialog.Info("请选择预算模板");
            //                return;
            //            }
            //        }
            //        if ($('#BudgetYear').combobox("getValue") == "") {
            //            HDialog.Info("请选择预算年度");
            //            return;
            //        }
            //        if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
            //            HDialog.Info("请选择预算单位");
            //            return;
            //        }
            //        var rowData = $('#TableContainerMain').treegrid("getData");
            //        if (rowData.length == 0) {
            //            HDialog.Info('没有预算计划数据');
            //            return;
            //        }

            //        $("#UploadExcelFrame").contents().find("#UpFile").click();
            //    }
            //}
        ];
        //***预算附表工具栏
        var toolbar_Vice = [
            {
                text: '上传附件',
                iconCls: 'icon-add',
                handler: function () {
                    $("#UploadFrame").contents().find("#UpFile").click()
                }
            }, '-',
            {
                text: '删除附件',
                iconCls: 'icon-cancel',
                handler: function () {
                    var selectedRow = $('#TableContainerVice').datagrid("getSelected");
                    if (selectedRow == null) {
                        HDialog.Info("请选择需要删除的预算计划附件");
                        return;
                    }
                    $.messager.confirm('确定', '是否删除该项', function (r) {
                        if (r) {
                            $.tool.DataGet('Budget', 'DelFile', 'ID=' + selectedRow.ID,
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data != "" && _Data == "true") {
                                        LoadUploadList();
                                        HDialog.Info("删除成功");
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                    });
                }
            }
        ];
        //***预算明细表工具栏
        var toolbar_Detail = [
            {
                text: '<label  style="width:120px;" ></label>'
            }, '-',
            {
                text: '引用上年数据',
                iconCls: 'icon-edit',
                handler: function () {
                    if ($('#BudgetYear').combobox("getValue") == "") {
                        HDialog.Info("请选择预算年度");
                        return;
                    }
                    if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                        HDialog.Info("请选择预算单位");
                        return;
                    }

                    if ($('#IsUpUnit').val() == "1") {
                        HDialog.Info("上级单位不允许引用上年预算数据");
                        return;
                    } else {
                        //不是上级单位就需要选择模板
                        if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
                            HDialog.Info("请选择预算模板");
                            return;
                        }
                    }
                    var rowData = $('#TableContainerDetail').datagrid("getData");
                    if (rowData.length == 0) {
                        HDialog.Info('没有预算计划数据');
                        return false;
                    }
                    BudgetDetailCitingLastYear();
                }
            }, '-',
            {
                text: '引用支出计划',
                iconCls: 'icon-edit',
                handler: function () {
                    if ($('#BudgetYear').combobox("getValue") == "") {
                        HDialog.Info("请选择预算年度");
                        return;
                    }
                    if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                        HDialog.Info("请选择预算单位");
                        return;
                    }
                    if ($('#IsUpUnit').val() == "1") {
                        HDialog.Info("上级单位不允许引用上年预算数据");
                        return;
                    } else {
                        //不是上级单位就需要选择模板
                        if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
                            HDialog.Info("请选择预算模板");
                            return;
                        }
                    }
                    var rowData = $('#TableContainerDetail').datagrid("getData");
                    if (rowData.length == 0) {
                        HDialog.Info('没有预算计划数据');
                        return false;
                    }
                    BudgetDetailCitingExpenditurePlan();
                }
            }, '-',
            {
                text: '引用收入计划',
                iconCls: 'icon-edit',
                handler: function () {

                    if ($('#BudgetYear').combobox("getValue") == "") {
                        HDialog.Info("请选择预算年度");
                        return;
                    }

                    if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                        HDialog.Info("请选择预算单位");
                        return;
                    }

                    if ($('#IsUpUnit').val() == "1") {
                        HDialog.Info("上级单位不允许引用收入计划");
                        return;
                    } else {
                        //不是上级单位就需要选择模板
                        if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
                            HDialog.Info("请选择预算模板");
                            return;
                        }
                    }
                    var rowData = $('#TableContainerDetail').datagrid("getData");
                    if (rowData.length == 0) {
                        HDialog.Info('没有预算计划数据');
                        return false;
                    }
                    BudgetDetailCitingIncomePlan();
                }
            }, '-',
            {
                text: '导出模板',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($('#BudgetYear').combobox("getValue") == "") {
                        HDialog.Info("请选择预算年度");
                        return;
                    }
                    if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                        HDialog.Info("请选择预算单位");
                        return;
                    }
                    if ($('#IsUpUnit').val() == "0") {
                        //不是上级单位就需要选择模板
                        if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
                            HDialog.Info("请选择预算模板");
                            return;
                        }
                    }
                    var rowData = $('#TableContainerDetail').datagrid("getData");
                    if (rowData.length == 0) {
                        HDialog.Info('没有预算计划详表数据导出');
                    }
                    else {
                        ExportDetail('预算计划详表模板', $('#TableContainerDetail'));
                    }
                }
            }, '-',
            {
                text: 'Excel导入',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    if ($('#IsUpUnit').val() == "1") {
                        HDialog.Info("上级单位不允许导入预算数据");
                        return;
                    }
                    if ($('#IsUpUnit').val() == "0") {
                        //不是上级单位就需要选择模板
                        if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
                            HDialog.Info("请选择预算模板");
                            return;
                        }
                    }
                    if ($('#BudgetYear').combobox("getValue") == "") {
                        HDialog.Info("请选择预算年度");
                        return;
                    }
                    if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                        HDialog.Info("请选择预算单位");
                        return;
                    }
                    var rowData = $('#TableContainerDetail').datagrid("getRows");
                    if (rowData.length == 0) {
                        HDialog.Info('没有预算计划数据');
                        return;
                    }
                    $("#UploadDetailExcelFrame").contents().find("#UpFile").click();
                }
            }, '-', {
                text: '暂存数据',
                iconCls: 'icon-save',
                handler: function () {
                    //判断是否存在明细数据
                    var DetailRows = $('#TableContainerDetail').datagrid("getRows");
                    if (DetailRows.length == 0) {
                        HDialog.Info("没有明细数据保存")
                        return;
                    }
                    //结束编辑
                    endEditionForDetail();
                    if ($('#DetailResult').val() != "") {
                        $.tool.pageLoading();
                        var DetailAllData = eval("(" + $('#DetailResult').val() + ")");
                        var BudgetMonth = $('#BudgetMonth').combobox("getValue");
                        var intBudgetMonth = parseInt(BudgetMonth);
                        var MainAllData = eval("(" + $('#MainResult').val() + ")");
                        DetailAllData = removeArr(DetailAllData, "BudgetMonth", BudgetMonth);
                        //更新预算主数据 和预算明细数据
                        for (var i = 0; i < DetailRows.length; i++) {
                            DetailAllData.push(DetailRows[i]);
                            getTreeNode(MainAllData, intBudgetMonth, DetailRows[i].BudgetProgram, DetailRows[i].BudgetValueForYear);
                        }
                        $('#MainResult').val(JSON.stringify(MainAllData));
                        $('#IsEditMainData').val("1");
                        //将数据写回源数据中
                        $('#DetailResult').val(JSON.stringify(DetailAllData));


                        $.tool.pageUnLoading();
                        HDialog.Info("明细数据暂存成功");
                    } else {
                        HDialog.Info("没有明细数据保存");
                        return;
                    }
                }
            }
        ];

        /* 预算详表数据操作 */
        //引用上年数据
        function BudgetDetailCitingLastYear() {
            if ($('#BudgetYear').combobox("getValue") == "") {
                HDialog.Info("请选择预算年度");
                return;
            }
            if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                HDialog.Info("请选择预算单位");
                return;
            }
            var LasYear = parseInt($('#BudgetYear').combobox("getValue")) - 1;
            var ParameterStr = "BudgetYear=" + $('#BudgetYear').combobox("getValue") + "&BudgetCompany=" + $('#BudgetCompanyCode').val() +
                "&BudgetUnitName=" + $('#BudgetUnit').combobox("getValue");
            $.tool.DataGet('Budget', 'CitingLastYear', ParameterStr,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != "") {
                        var ReturnResult = eval('(' + _Data + ')');
                        if (ReturnResult.Result == "False") {
                            HDialog.Info($('#BudgetCompany').val() + " " + LasYear + "年度，没有预算数据！");
                            return false;
                        }
                        if (ReturnResult.data.length > 0) {
                            $.tool.pageLoading();
                            //获取明细页面上的所有数据
                            var DetailAllData = eval("(" + $('#DetailResult').val() + ")"); //明细所有数据
                            var dataarr = []; // 详细列表当前月份数据
                            var BudgetMonth = $('#BudgetMonth').combobox("getValue");
                            var intBudgetMonth = parseInt(BudgetMonth);

                            var MainAllData = eval("(" + $('#MainResult').val() + ")");

                            //上年有预算数据需要将数据更新到现在列表中
                            for (var i = 0; i < ReturnResult.data.length; i++) {
                                //过滤当前科目的数据
                                var Node = DetailAllData.filter(function (e) {
                                    return e.BudgetProgram == ReturnResult.data[i].BudgetProgram;
                                });
                                //如果存在相同科目的数据
                                if (Node != null && Node.length > 0) {
                                    if (Node[0].BudgetPlanWay == "公式计算") {
                                        continue;
                                    }
                                    //更新明细数据 循环12个月
                                    for (var j = 1; j < 13; j++) {
                                        //查找详表数据集合中的对应对象
                                        var jIndex = DetailAllData.findIndex(function (value, index, arr) {
                                            return arr[index].BudgetProgram == ReturnResult.data[i].BudgetProgram && parseInt(arr[index].BudgetMonth) == j;
                                        });
                                        if (jIndex != undefined && jIndex != -1) {
                                            //修改预算金额
                                            DetailAllData[jIndex].BudgetValueForYear =
                                                ToDecimal(ConvertToFloat(ReturnResult.data[i][String(j) + "Y"]), decimalPos);
                                        }
                                    }
                                }
                            }
                            dataarr = DetailAllData.filter(function (e) {
                                return e.BudgetMonth == $('#BudgetMonth').combobox("getValue");
                            });
                            //明细数据加载一次
                            $("#TableContainerDetail").datagrid({
                                data: dataarr,
                                onLoadSuccess: function () {
                                    $.tool.pageUnLoading();
                                }
                            });
                            //更新预算主数据
                            for (var i = 0; i < DetailAllData.length; i++) {
                                getTreeNode(MainAllData, parseInt(DetailAllData[i].BudgetMonth), DetailAllData[i].BudgetProgram, DetailAllData[i].BudgetValueForYear);
                            }
                            $('#MainResult').val(JSON.stringify(MainAllData));
                            $('#IsEditMainData').val("1");
                            //将数据写回源数据中
                            $('#DetailResult').val(JSON.stringify(DetailAllData));

                        } else {
                            HDialog.Info($('#BudgetCompany').val() + " " + LasYear + "年度，没有预算数据！");
                            return;
                        }
                    } else {
                        HDialog.Info($('#BudgetCompany').val() + " " + LasYear + "年度，没有预算数据！");
                        return;
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }
        //引用支出计划
        function BudgetDetailCitingExpenditurePlan() {
            if ($('#BudgetYear').combobox("getValue") == "") {
                HDialog.Info("请选择预算年度");
                return;
            }
            if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                HDialog.Info("请选择预算单位");
                return;
            }
            var w = $(window).width();
            var h = $(window).height();

            var strPage = "../BudgetNew/BudgetSelectPlanList.aspx?BudgetCompanyCode=" + $('#BudgetCompanyCode').val();
            HDialog.Open(w, h, strPage, '选择计划', false, function callback(_Data) {
                if (_Data != '') {
                    $.tool.pageLoading();
                    //同步调用
                    $.tool.DataPostInfoAsync('Budget', 'BudgetDetailCitingExpenditurePlan', "DetailidList=" + _Data,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                var ReturnResult = eval('(' + _Data + ')');
                                //获取明细页面上的所有数据
                                var DetailAllData = eval("(" + $('#DetailResult').val() + ")"); //明细所有数据
                                var dataarr = []; // 详细列表当前月份数据
                                var BudgetMonth = $('#BudgetMonth').combobox("getValue");
                                var intBudgetMonth = parseInt(BudgetMonth);
                                var MainAllData = eval("(" + $('#MainResult').val() + ")");
                                //上年有预算数据需要将数据更新到现在列表中
                                for (var i = 0; i < ReturnResult.length; i++) {
                                    //过滤当前科目 当前月 的数据 只能是业务引入的才能通过引用进入
                                    var jIndex = DetailAllData.findIndex(function (value, index, arr) {
                                        return arr[index].BudgetProgram == ReturnResult[i].ConnectBudgetProject
                                            && parseInt(arr[index].BudgetMonth) == parseInt(ReturnResult[i].PlanMonth)
                                            && arr[index].BudgetPlanWay == "业务引入";
                                    });
                                    if (jIndex != -1) {
                                        //存在数据  更新明细数据 
                                        if (DetailAllData[jIndex].BudgetValueForYear != "") {
                                            DetailAllData[jIndex].BudgetValueForYear = parseFloat(ToDecimal(DetailAllData[jIndex].BudgetValueForYear, decimalPos)) + parseFloat(ToDecimal(ConvertToFloat(ReturnResult[i]["PlanCost"]), decimalPos));//计划费用（元）
                                        } else {
                                            DetailAllData[jIndex].BudgetValueForYear = ToDecimal(ConvertToFloat(ReturnResult[i]["PlanCost"]), decimalPos);//计划费用（元）
                                        }
                                        DetailAllData[jIndex].PlanCoding = ReturnResult[i]["PlanCoding"];//计划编码
                                        DetailAllData[jIndex].PlanYear = ReturnResult[i]["PlanYear"];//计划年度
                                        DetailAllData[jIndex].PlanMonth = ReturnResult[i]["PlanMonth"];//计划月份
                                        DetailAllData[jIndex].PlanName = ReturnResult[i]["PlanName"];//计划名称
                                        if (ReturnResult[i]["PlanStartTime"] != "") {
                                            DetailAllData[jIndex].PlanStartTime = formatDate(ReturnResult[i]["PlanStartTime"], "yyyy-MM-dd");//计划开始时间
                                        }
                                        if (ReturnResult[i]["PlanEndTime"] != "") {
                                            DetailAllData[jIndex].PlanEndTime = formatDate(ReturnResult[i]["PlanEndTime"], "yyyy-MM-dd");//计划结束时间
                                        }
                                        DetailAllData[jIndex].Target = ReturnResult[i]["Target"];//计划目标
                                    }
                                }
                                dataarr = DetailAllData.filter(function (e) {
                                    return e.BudgetMonth == $('#BudgetMonth').combobox("getValue");
                                });
                                //明细数据加载一次
                                $("#TableContainerDetail").datagrid({
                                    data: dataarr,
                                    onLoadSuccess: function () {
                                        $.tool.pageUnLoading();
                                    }
                                });
                                //更新预算主数据
                                for (var i = 0; i < DetailAllData.length; i++) {
                                    getTreeNode(MainAllData, parseInt(DetailAllData[i].BudgetMonth), DetailAllData[i].BudgetProgram, DetailAllData[i].BudgetValueForYear);
                                }
                                $('#MainResult').val(JSON.stringify(MainAllData));
                                $('#IsEditMainData').val("1");
                                //将数据写回源数据中
                                $('#DetailResult').val(JSON.stringify(DetailAllData));
                                HDialog.Info("支出计划引入成功");
                            }
                            $.tool.pageUnLoading();
                        },
                        function _completeCallBack() {
                        },
                        function errorCallback() {
                        }, '正在计算,请稍侯', false);
                }
            });

        }
        //引用收入计划
        function BudgetDetailCitingIncomePlan() {
            if ($('#BudgetYear').combobox("getValue") == "") {
                HDialog.Info("请选择预算年度");
                return;
            }
            if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                HDialog.Info("请选择预算单位");
                return;
            }
            $.tool.pageLoading();
            //同步调用
            $.tool.DataPostInfoAsync('Budget', 'BudgetDetailCitingIncomePlan', "BudgetYear=" + $('#BudgetYear').combobox("getValue") + "&BudgetCompanyCode=" + $('#BudgetCompanyCode').val(),
                function Init() {
                },
                function callback(_Data) {
                    var ItemList = _Data.split("$");
                    if (ItemList[0] != "") {
                        var BudgetState = ItemList[1];
                        var ReturnResult = eval('(' + ItemList[0] + ')');
                        //获取明细页面上的所有数据
                        var DetailAllData = eval("(" + $('#DetailResult').val() + ")"); //明细所有数据

                        var dataarr = []; // 详细列表当前月份数据
                        var BudgetMonth = $('#BudgetMonth').combobox("getValue");
                        var intBudgetMonth = parseInt(BudgetMonth);
                        var MainAllData = eval("(" + $('#MainResult').val() + ")");

                        //上年有预算数据需要将数据更新到现在列表中

                        //新方式，现在是按照 新的收入预算汇总表获取数据
                        for (var i = 0; i < ReturnResult.length; i++) {
                            //过滤当前科目 的数据 只能是业务引入的才能通过引用进入
                            var ItemArr = DetailAllData.filter(function (e) {
                                return e.BudgetProgram == ReturnResult[i].BudgetProgram && e.BudgetPlanWay == "业务引入";
                            });
                            if (ItemArr.length > 0) {
                                //存在数据 循环12次更新每个月的数据 
                                for (var k = 1; k < 13; k++) {
                                    var BaseArr = ItemArr.filter(function (e) {
                                        return parseInt(e.BudgetMonth) == parseInt(k);
                                    });
                                    if (BaseArr.length > 0) {
                                        //判断是使用含税还是不含税价格更新  0:按含税价编制预算 1:按不含税价编制预算 
                                        if (BudgetState == "0") {
                                            if (BaseArr[0].BudgetValueForYear != "") {
                                                BaseArr[0].BudgetValueForYear = parseFloat(ToDecimal(BaseArr[0].BudgetValueForYear, decimalPos)) + parseFloat(ToDecimal(ConvertToFloat(ReturnResult[i]["PlanValue" + k + "Y"]), decimalPos));//计划费用（元）
                                            } else {
                                                BaseArr[0].BudgetValueForYear = ToDecimal(ConvertToFloat(ReturnResult[i]["PlanValue" + k + "Y"]), decimalPos);//计划费用（元）
                                            }
                                        } else {
                                            if (BaseArr[0].BudgetValueForYear != "") {
                                                BaseArr[0].BudgetValueForYear = parseFloat(ToDecimal(BaseArr[0].BudgetValueForYear, decimalPos)) + parseFloat(ToDecimal(ConvertToFloat(ReturnResult[i]["PlanValue" + k + "YWithOutTax"]), decimalPos));//计划费用（元）
                                            } else {
                                                BaseArr[0].BudgetValueForYear = ToDecimal(ConvertToFloat(ReturnResult[i]["PlanValue" + k + "YWithOutTax"]), decimalPos);//计划费用（元）
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        //老代码注释掉 不用
                        //for (var i = 0; i < ReturnResult.length; i++) {
                        //    //过滤当前科目 当前月 的数据 只能是业务引入的才能通过引用进入
                        //    var jIndex = DetailAllData.findIndex(function (value, index, arr) {
                        //        return arr[index].BudgetProgram == ReturnResult[i].CsId
                        //            && parseInt(arr[index].BudgetMonth) == parseInt(ReturnResult[i].BudgetMonth)
                        //            && arr[index].BudgetPlanWay == "业务引入";
                        //    });
                        //    if (jIndex != -1) {
                        //        //存在数据  更新明细数据 
                        //        if (DetailAllData[jIndex].BudgetValueForYear != "") {
                        //            DetailAllData[jIndex].BudgetValueForYear = parseFloat(ToDecimal(DetailAllData[jIndex].BudgetValueForYear, decimalPos)) + parseFloat(ToDecimal(ConvertToFloat(ReturnResult[i]["PlanValue"]), decimalPos));//计划费用（元）
                        //        } else {
                        //            DetailAllData[jIndex].BudgetValueForYear = ToDecimal(ConvertToFloat(ReturnResult[i]["PlanValue"]), decimalPos);//计划费用（元）
                        //        }
                        //        //DetailAllData[jIndex].PlanCoding = ReturnResult[i]["PlanCoding"];//计划编码
                        //        //DetailAllData[jIndex].PlanYear = ReturnResult[i]["PlanYear"];//计划年度
                        //        //DetailAllData[jIndex].PlanMonth = ReturnResult[i]["PlanMonth"];//计划月份
                        //        //DetailAllData[jIndex].PlanName = ReturnResult[i]["PlanName"];//计划名称
                        //        //if (ReturnResult[i]["PlanStartTime"] != "") {
                        //        //    DetailAllData[jIndex].PlanStartTime = formatDate(ReturnResult[i]["PlanStartTime"], "yyyy-MM-dd");//计划开始时间
                        //        //}
                        //        //if (ReturnResult[i]["PlanEndTime"] != "") {
                        //        //    DetailAllData[jIndex].PlanEndTime = formatDate(ReturnResult[i]["PlanEndTime"], "yyyy-MM-dd");//计划结束时间
                        //        //}
                        //        //DetailAllData[jIndex].Target = ReturnResult[i]["Target"];//计划目标
                        //    }
                        //}
                        dataarr = DetailAllData.filter(function (e) {
                            return e.BudgetMonth == $('#BudgetMonth').combobox("getValue");
                        });
                        //明细数据加载一次
                        $("#TableContainerDetail").datagrid({
                            data: dataarr,
                            onLoadSuccess: function () {
                                $.tool.pageUnLoading();
                            }
                        });
                        //更新预算主数据
                        for (var i = 0; i < DetailAllData.length; i++) {
                            getTreeNode(MainAllData, parseInt(DetailAllData[i].BudgetMonth), DetailAllData[i].BudgetProgram, DetailAllData[i].BudgetValueForYear);
                        }
                        $('#MainResult').val(JSON.stringify(MainAllData));
                        $('#IsEditMainData').val("1");
                        //将数据写回源数据中
                        $('#DetailResult').val(JSON.stringify(DetailAllData));
                        HDialog.Info("引用收入计划成功");
                    }
                    $.tool.pageUnLoading();
                },
                function _completeCallBack() {
                },
                function errorCallback() {
                }, '正在计算,请稍侯', false);
        }


        //*****导入明细excel
        function FunExportDetail() {
            $.tool.pageLoading();
            setTimeout(function () {
                ExportDetailExcel();
            }, 100);
        }
        function ExportDetailExcel() {
            var ResultStr = $("#UploadDetailExcelFrame").contents().find("#ExcelResult").val();
            //判断excel导入是否有值
            if (ResultStr != undefined && ResultStr.length > 0) {
                var ReturnResult = eval("(" + ResultStr + ")");
                //获取明细页面上的所有数据
                var DetailAllData = eval("(" + $('#DetailResult').val() + ")"); //明细所有数据
                var dataarr = []; // 详细列表当前月份数据
                var BudgetMonth = $('#BudgetMonth').combobox("getValue");
                var intBudgetMonth = parseInt(BudgetMonth);

                var MainAllData = eval("(" + $('#MainResult').val() + ")");

                //上年有预算数据需要将数据更新到现在列表中
                for (var i = 0; i < ReturnResult.length; i++) {
                    //过滤当前科目的数据
                    //查找详表数据集合中的对应对象
                    var jIndex = DetailAllData.findIndex(function (value, index, arr) {
                        return arr[index].BudgetProgram == ReturnResult[i].BudgetProgram
                            && parseInt(arr[index].BudgetMonth) == parseInt(ReturnResult[i]["预算月份"])
                            && arr[index].BudgetPlanWay == "人工录入";
                    });
                    if (jIndex != undefined && jIndex != -1) {
                        //修改预算金额
                        DetailAllData[jIndex].BudgetValueForYear = ToDecimal(ConvertToFloat(ReturnResult[i]["计划费用(元)"]), decimalPos);//修改计划费用
                        DetailAllData[jIndex].PlanCoding = ReturnResult[i]["计划编码"];//计划编码
                        DetailAllData[jIndex].PlanYear = ReturnResult[i]["计划年度"];//计划年度
                        DetailAllData[jIndex].PlanMonth = ReturnResult[i]["计划月度"];//计划月份
                        DetailAllData[jIndex].PlanName = ReturnResult[i]["计划名称"];//计划名称
                        DetailAllData[jIndex].PlanStartTime = ReturnResult[i]["BeginDate"];
                        DetailAllData[jIndex].PlanEndTime = ReturnResult[i]["EndDate"];
                        //if (ReturnResult[i]["BeginDate"] != "") {
                        //    DetailAllData[jIndex].PlanStartTime = formatDate(ReturnResult[i]["BeginDate"], "yyyy-MM-dd");//计划开始时间
                        //} else {
                        //    DetailAllData[jIndex].PlanStartTime = "";
                        //}
                        //if (ReturnResult[i]["EndDate"] != "") {
                        //    DetailAllData[jIndex].PlanEndTime = formatDate(ReturnResult[i]["EndDate"], "yyyy-MM-dd");//计划结束时间
                        //} else {
                        //    DetailAllData[jIndex].PlanEndTime = "";
                        //}
                        DetailAllData[jIndex].Target = ReturnResult[i]["计划目标"];//计划目标

                    }
                }
                dataarr = DetailAllData.filter(function (e) {
                    return e.BudgetMonth == $('#BudgetMonth').combobox("getValue");
                });
                //明细数据加载一次
                $("#TableContainerDetail").datagrid({
                    data: dataarr,
                    onLoadSuccess: function () {
                        $.tool.pageUnLoading();
                    }
                });
                //更新预算主数据
                for (var i = 0; i < DetailAllData.length; i++) {
                    getTreeNode(MainAllData, parseInt(DetailAllData[i].BudgetMonth), DetailAllData[i].BudgetProgram, DetailAllData[i].BudgetValueForYear);
                }
                $('#MainResult').val(JSON.stringify(MainAllData));
                $('#IsEditMainData').val("1");
                //将数据写回源数据中

                $('#DetailResult').val(JSON.stringify(DetailAllData));
                HDialog.Info("导入成功");
                //成功后将原来导入的数据置为空
                $("#UploadDetailExcelFrame").contents().find("#ExcelResult").val("");
                $.tool.pageUnLoading();
            } else {
                HDialog.Info("导入失败");
                $.tool.pageUnLoading();
            }
        }


        //递归查找主表对象并更新对应的科目、月份的值
        function getTreeNode(arr, month, key, value) {
            var monthStr = String(month) + "Y";

            let foundNode = null;
            let treeList = arr || [];
            for (let i = 0; i < treeList.length; i++) {
                const d = treeList[i];
                const childrens = d.children || [];
                if (d["BudgetProgram"] == key) {
                    d[monthStr] = value;
                    foundNode = d;
                    return d;
                }
                else {
                    foundNode = getChildren(d);
                }
            }
            function getChildren(d) {
                const tempArr = d.children || [];
                for (let i = 0; i < tempArr.length; i++) {
                    const d = tempArr[i];
                    const childrens = d.children || [];
                    if (d["BudgetProgram"] == key) {
                        d[monthStr] = value;
                        return d;
                    }
                    else {
                        if (childrens.length > 0) {
                            getChildren(d);
                        }
                    }
                }
            }
            return foundNode;
        }

        /**
       * 从对象数组中删除属性为objPropery，值为objValue元素的对象
       * @param Array arrPerson  数组对象
       * @param String objPropery  对象的属性
       * @param String objPropery  对象的值
       * @return Array 过滤后数组
       */
        function removeArr(arrPerson, objPropery, objValue) {
            return $.grep(arrPerson, function (cur, i) {
                return cur[objPropery] != objValue;
            });
        }
        function UpdateArr(arrPerson, objPropery, objValue) {

        }


        //计算大类合计金额及页脚合计金额
        function UpdateAmount(flag) {
            //判断是否还有未提交的行 如果有就先提交了
            if (editIndex != undefined) {
                $("#TableContainerMain").datagrid('acceptChanges', editIndex);
                $('#TableContainerMain').treegrid('endEdit', editIndex);
            }
            //获取页面上的所有数据
            var TreeGridData = $('#TableContainerMain').treegrid("getData");
            var Rows = treeDataToList(TreeGridData);


            //flag==0 表示才进入 需要统计所有的数据  flag==1 表示修改一行数据 只用修改对应的数据
            if (flag == "0") {
                //每一行数据统计
                for (var i = 0; i < Rows.length; i++) {
                    if (Rows[i].LevelNum == "0") {
                        //只统计最底层行
                        var total = 0;
                        total = ConvertToFloat(Rows[i]["1Y"]) + ConvertToFloat(Rows[i]["2Y"]) + ConvertToFloat(Rows[i]["3Y"]) +
                            ConvertToFloat(Rows[i]["4Y"]) + ConvertToFloat(Rows[i]["5Y"]) + ConvertToFloat(Rows[i]["6Y"]) +
                            ConvertToFloat(Rows[i]["7Y"]) + ConvertToFloat(Rows[i]["8Y"]) + ConvertToFloat(Rows[i]["9Y"]) +
                            ConvertToFloat(Rows[i]["10Y"]) + ConvertToFloat(Rows[i]["11Y"]) + ConvertToFloat(Rows[i]["12Y"])
                        $('#TableContainerMain').treegrid('update', {
                            id: Rows[i].BudgetProgram,
                            row: {
                                "BudgetValueForYear": ToDecimal(total, decimalPos)
                            }
                        });
                        //反过来更新rows里面的值
                        Rows[i]["BudgetValueForYear"] = ToDecimal(total, decimalPos);
                    }
                }
                //计算大类合计
                //遍历所有行 只取大类行进行数据修改
                for (var i = Rows.length - 1; i >= 0; i--) {
                    if (Rows[i].LevelNum != "0") {
                        var RowsDataId = Rows[i].BudgetProgram;
                        //更新treegrid的数据
                        $('#TableContainerMain').treegrid('update', {
                            id: RowsDataId,
                            row: {
                                "1Y": ComputeGridCol(Rows, RowsDataId, "1Y", "0"),
                                "2Y": ComputeGridCol(Rows, RowsDataId, "2Y", "0"),
                                "3Y": ComputeGridCol(Rows, RowsDataId, "3Y", "0"),
                                "4Y": ComputeGridCol(Rows, RowsDataId, "4Y", "0"),
                                "5Y": ComputeGridCol(Rows, RowsDataId, "5Y", "0"),
                                "6Y": ComputeGridCol(Rows, RowsDataId, "6Y", "0"),
                                "7Y": ComputeGridCol(Rows, RowsDataId, "7Y", "0"),
                                "8Y": ComputeGridCol(Rows, RowsDataId, "8Y", "0"),
                                "9Y": ComputeGridCol(Rows, RowsDataId, "9Y", "0"),
                                "10Y": ComputeGridCol(Rows, RowsDataId, "10Y", "0"),
                                "11Y": ComputeGridCol(Rows, RowsDataId, "11Y", "0"),
                                "12Y": ComputeGridCol(Rows, RowsDataId, "12Y", "0"),
                                "BudgetValueForYear": ComputeGridCol(Rows, RowsDataId, "BudgetValueForYear", "0")
                            }
                        });

                    }
                }
            }
            else if (flag == "1") {
                var parentid = '';
                //修改当前行数据
                for (var i = 0; i < Rows.length; i++) {
                    if (Rows[i].LevelNum == "0" && Rows[i].id == editId) {
                        parentid = Rows[i].ParentId;
                        //只统计最底层行
                        var total = 0;
                        total = ConvertToFloat(Rows[i]["1Y"]) + ConvertToFloat(Rows[i]["2Y"]) + ConvertToFloat(Rows[i]["3Y"]) +
                            ConvertToFloat(Rows[i]["4Y"]) + ConvertToFloat(Rows[i]["5Y"]) + ConvertToFloat(Rows[i]["6Y"]) +
                            ConvertToFloat(Rows[i]["7Y"]) + ConvertToFloat(Rows[i]["8Y"]) + ConvertToFloat(Rows[i]["9Y"]) +
                            ConvertToFloat(Rows[i]["10Y"]) + ConvertToFloat(Rows[i]["11Y"]) + ConvertToFloat(Rows[i]["12Y"]);

                        //更新treegrid的数据
                        $('#TableContainerMain').treegrid('update', {
                            id: Rows[i].BudgetProgram,
                            row: {
                                BudgetValueForYear: ToDecimal(total, decimalPos)
                            }
                        });
                        //反过来更新rows里面的值
                        Rows[i]["BudgetValueForYear"] = ToDecimal(total, decimalPos);
                    }
                }
                //计算大类合计 通过递归的方式只修改对应的上级
                //遍历所有行 只取大类行进行数据修改
                UpdateUpRowData(Rows, parentid);
            }
            //更新公式计算数据
            UpdateFormulaFunc(Rows, flag);


            //计算页脚合计
            $('#TableContainerMain').treegrid('reloadFooter', [
                {
                    text: "收入合计",
                    id: "SRHJ",
                    BudgetProgram: "SRHJ",
                    BudgetProgramName: "收入合计",
                    LevelNum: "50",
                    "1Y": ComputeGridCol(Rows, "", "1Y", "1"),
                    "2Y": ComputeGridCol(Rows, "", "2Y", "1"),
                    "3Y": ComputeGridCol(Rows, "", "3Y", "1"),
                    "4Y": ComputeGridCol(Rows, "", "4Y", "1"),
                    "5Y": ComputeGridCol(Rows, "", "5Y", "1"),
                    "6Y": ComputeGridCol(Rows, "", "6Y", "1"),
                    "7Y": ComputeGridCol(Rows, "", "7Y", "1"),
                    "8Y": ComputeGridCol(Rows, "", "8Y", "1"),
                    "9Y": ComputeGridCol(Rows, "", "9Y", "1"),
                    "10Y": ComputeGridCol(Rows, "", "10Y", "1"),
                    "11Y": ComputeGridCol(Rows, "", "11Y", "1"),
                    "12Y": ComputeGridCol(Rows, "", "12Y", "1"),
                    "BudgetValueForYear": ComputeGridCol(Rows, "", "BudgetValueForYear", "1"),
                    "LastYearBudgetValue": ComputeGridCol(Rows, "", "LastYearBudgetValue", "1"),
                    "LastYearCompleteValue": ComputeGridCol(Rows, "", "LastYearCompleteValue", "1")
                },
                {
                    text: "支出合计",
                    id: "ZCHJ",
                    BudgetProgram: "ZCHJ",
                    BudgetProgramName: "支出合计",
                    LevelNum: "50",
                    "1Y": ComputeGridCol(Rows, "", "1Y", "2"),
                    "2Y": ComputeGridCol(Rows, "", "2Y", "2"),
                    "3Y": ComputeGridCol(Rows, "", "3Y", "2"),
                    "4Y": ComputeGridCol(Rows, "", "4Y", "2"),
                    "5Y": ComputeGridCol(Rows, "", "5Y", "2"),
                    "6Y": ComputeGridCol(Rows, "", "6Y", "2"),
                    "7Y": ComputeGridCol(Rows, "", "7Y", "2"),
                    "8Y": ComputeGridCol(Rows, "", "8Y", "2"),
                    "9Y": ComputeGridCol(Rows, "", "9Y", "2"),
                    "10Y": ComputeGridCol(Rows, "", "10Y", "2"),
                    "11Y": ComputeGridCol(Rows, "", "11Y", "2"),
                    "12Y": ComputeGridCol(Rows, "", "12Y", "2"),
                    "BudgetValueForYear": ComputeGridCol(Rows, "", "BudgetValueForYear", "2"),
                    "LastYearBudgetValue": ComputeGridCol(Rows, "", "LastYearBudgetValue", "2"),
                    "LastYearCompleteValue": ComputeGridCol(Rows, "", "LastYearCompleteValue", "2")
                }, {
                    text: "结余合计",
                    id: "JYHJ",
                    BudgetProgram: "JYHJ",
                    BudgetProgramName: "结余合计",
                    LevelNum: "50",
                    "1Y": ComputeGridCol(Rows, "", "1Y", "3"),
                    "2Y": ComputeGridCol(Rows, "", "2Y", "3"),
                    "3Y": ComputeGridCol(Rows, "", "3Y", "3"),
                    "4Y": ComputeGridCol(Rows, "", "4Y", "3"),
                    "5Y": ComputeGridCol(Rows, "", "5Y", "3"),
                    "6Y": ComputeGridCol(Rows, "", "6Y", "3"),
                    "7Y": ComputeGridCol(Rows, "", "7Y", "3"),
                    "8Y": ComputeGridCol(Rows, "", "8Y", "3"),
                    "9Y": ComputeGridCol(Rows, "", "9Y", "3"),
                    "10Y": ComputeGridCol(Rows, "", "10Y", "3"),
                    "11Y": ComputeGridCol(Rows, "", "11Y", "3"),
                    "12Y": ComputeGridCol(Rows, "", "12Y", "3"),
                    "BudgetValueForYear": ComputeGridCol(Rows, "", "BudgetValueForYear", "3"),
                    "LastYearBudgetValue": ComputeGridCol(Rows, "", "LastYearBudgetValue", "3"),
                    "LastYearCompleteValue": ComputeGridCol(Rows, "", "LastYearCompleteValue", "3")
                }
            ]);
        }

        function UpdateFormulaFunc(Rows, flag) {
            //下级单位才计算公式数据 
            if ($('#IsUpUnit').val() == "0" && flag != "10") {
                for (var i = 0; i < Rows.length; i++) {
                    //只修改最下级 并且是公式计算的
                    if (Rows[i].LevelNum == "0" && Rows[i].BudgetPlanWay == "公式计算") {
                        //获取公式里面的科目名称
                        var FormulaStrList = Rows[i].CalculationFormula.split(">");
                        var FormulaNameList = [];

                        for (var j = 0; j < FormulaStrList.length; j++) {
                            if (FormulaStrList[j].indexOf('<') > -1) {
                                FormulaNameList.push(FormulaStrList[j].split('<')[1]);
                            }
                        }
                        //公式计算需要使用到的数据
                        var DataRow = [];
                        for (var k = 0; k < FormulaNameList.length; k++) {
                            for (var m = 0; m < Rows.length; m++) {
                                if (Rows[m].BudgetProgramName == FormulaNameList[k]) {
                                    DataRow.push(Rows[m]);
                                    break;
                                }
                            }
                        }
                        //判断是否有需要修改的公式的数据
                        if (DataRow != [] && DataRow.length > 0) {
                            //更新treegrid的数据
                            $('#TableContainerMain').treegrid('update', {
                                id: Rows[i].BudgetProgram,
                                row: {
                                    "1Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "1Y"), decimalPos),
                                    "2Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "2Y"), decimalPos),
                                    "3Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "3Y"), decimalPos),
                                    "4Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "4Y"), decimalPos),
                                    "5Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "5Y"), decimalPos),
                                    "6Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "6Y"), decimalPos),
                                    "7Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "7Y"), decimalPos),
                                    "8Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "8Y"), decimalPos),
                                    "9Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "9Y"), decimalPos),
                                    "10Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "10Y"), decimalPos),
                                    "11Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "11Y"), decimalPos),
                                    "12Y": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "12Y"), decimalPos),
                                    "BudgetValueForYear": ToDecimal(UpdateFormula(DataRow, Rows[i], FormulaNameList, "BudgetValueForYear"), decimalPos)
                                }
                            });
                        }
                        UpdateUpRowData(Rows, Rows[i].ParentId);
                    }
                }
            }
        }
        function UpdateFormula(DataRow, Rows, FormulaNameList, ColumnName) {
            var Formula = Rows.CalculationFormula;
            if (ColumnName != "BudgetValueForYear") {
                //循环公式需要的数据 替换公式里面的表达式
                for (var c = 0; c < DataRow.length; c++) {
                    //循环公式名称 修改公式对应数据
                    for (var a = 0; a < FormulaNameList.length; a++) {
                        //需要替换的公式表达式
                        if (DataRow[c].BudgetProgramName == FormulaNameList[a]) {
                            var tempFormula = "<" + FormulaNameList[a] + ">";
                            Formula = Formula.replace(tempFormula, DataRow[c][ColumnName]);
                            break;
                        }
                    }
                }
            }
            var FinalValue = '';
            try {
                if (ColumnName != "BudgetValueForYear") {
                    FinalValue = eval(Formula);
                } else {
                    FinalValue = ConvertToFloat(Rows["1Y"]) + ConvertToFloat(Rows["2Y"]) + ConvertToFloat(Rows["3Y"]) +
                        ConvertToFloat(Rows["4Y"]) + ConvertToFloat(Rows["5Y"]) + ConvertToFloat(Rows["6Y"]) +
                        ConvertToFloat(Rows["7Y"]) + ConvertToFloat(Rows["8Y"]) + ConvertToFloat(Rows["9Y"]) +
                        ConvertToFloat(Rows["10Y"]) + ConvertToFloat(Rows["11Y"]) + ConvertToFloat(Rows["12Y"])
                }

            } catch (e) {
                FinalValue = '0.00';
            }

            //反过来更新rows里面的值
            Rows[ColumnName] = ToDecimal(FinalValue, decimalPos);
            return FinalValue;
        }

        //传入参数判断 是合计大类还是合计页脚 flag 0：大类 1、2、3：页脚 
        function ComputeGridCol(rows, id, colName, flag) {
            var total = 0;
            //供结余使用
            var SRHJ = 0;
            var ZCHJ = 0;
            if (flag == "0") {
                //更新大类数据
                var ClassIndex = 0;
                for (var i = 0; i < rows.length; i++) {
                    if (rows[i].BudgetProgram == id) {
                        ClassIndex = i;
                    }
                    if (rows[i].ParentId == id && rows[i][colName] != undefined && rows[i][colName] != "") {
                        total += (parseFloat(rows[i][colName]) == "NaN" ? 0 : parseFloat(rows[i][colName]));
                    }
                }
                //反过来更新rows里面的值
                rows[ClassIndex][colName] = ToDecimal(total, decimalPos);

            } else if (flag == "1" || flag == "2" || flag == "3") {
                for (var i = 0; i < rows.length; i++) {


                    //判断是算结余还是收入还是支出
                    if (flag == "1") {
                        //收入合计
                        if (rows[i].LevelNum == "0" && rows[i].SubjectType == "0") {
                            total += ConvertToFloat(rows[i][colName]);
                        }
                    } else if (flag == "2") {
                        //支出合计
                        if (rows[i].LevelNum == "0" && rows[i].SubjectType == "1") {
                            total += ConvertToFloat(rows[i][colName]);
                        }
                    }
                    else if (flag == "3") {
                        /* 结余合计 */
                        //收入合计
                        if (rows[i].LevelNum == "0" && rows[i].SubjectType == "0") {
                            SRHJ += ConvertToFloat(rows[i][colName]);
                        }
                        //支出合计
                        if (rows[i].LevelNum == "0" && rows[i].SubjectType == "1") {
                            ZCHJ += ConvertToFloat(rows[i][colName]);
                        }
                    }
                }
            }
            if (flag == "3") {
                total = SRHJ - ZCHJ;
            }
            return ToDecimal(total, decimalPos);
        }

        //****递归的方式修改对应修改行上级数据
        function UpdateUpRowData(Rows, parentid) {
            if (parentid == "" || parentid == undefined) {
                return;
            }
            for (var i = Rows.length - 1; i >= 0; i--) {
                if (Rows[i].LevelNum != "0" && Rows[i].id == parentid) {
                    parentid = Rows[i].ParentId;
                    RowID = Rows[i].BudgetProgram;
                    $('#TableContainerMain').treegrid('update', {
                        id: RowID,
                        row: {
                            "1Y": ComputeGridCol(Rows, RowID, "1Y", "0"),
                            "2Y": ComputeGridCol(Rows, RowID, "2Y", "0"),
                            "3Y": ComputeGridCol(Rows, RowID, "3Y", "0"),
                            "4Y": ComputeGridCol(Rows, RowID, "4Y", "0"),
                            "5Y": ComputeGridCol(Rows, RowID, "5Y", "0"),
                            "6Y": ComputeGridCol(Rows, RowID, "6Y", "0"),
                            "7Y": ComputeGridCol(Rows, RowID, "7Y", "0"),
                            "8Y": ComputeGridCol(Rows, RowID, "8Y", "0"),
                            "9Y": ComputeGridCol(Rows, RowID, "9Y", "0"),
                            "10Y": ComputeGridCol(Rows, RowID, "10Y", "0"),
                            "11Y": ComputeGridCol(Rows, RowID, "11Y", "0"),
                            "12Y": ComputeGridCol(Rows, RowID, "12Y", "0"),
                            "BudgetValueForYear": ComputeGridCol(Rows, RowID, "BudgetValueForYear", "0")
                        }
                    });
                }
            }
            //递归
            UpdateUpRowData(Rows, parentid);
        }

        //转换成Float
        function ConvertToFloat(value) {
            if (value == undefined || value == "" || value == "null") {
                return 0.00;
            }
            return ((parseFloat(value) == undefined || parseFloat(value) == "NaN") ? 0 : parseFloat(value));
        }

        //****将treegrid数据转化成列表数据
        function treeDataToList(dataArr) {
            var arr = [];
            function childrenToList(node) {
                var childrens = node.children || [];
                for (var i = 0; i < childrens.length; i++) {
                    var d = childrens[i];
                    var temp = {};
                    for (var key in d) {
                        if (key !== "children") {
                            temp[key] = d[key];
                        }
                    }
                    arr.push(temp);
                    childrenToList(d);
                }
            }

            for (var i = 0; i < dataArr.length; i++) {
                var d = dataArr[i];
                var temp = {};
                for (var key in d) {
                    if (key !== "children") {
                        temp[key] = d[key];
                    }
                }
                arr.push(temp);

                childrenToList(d);
            }
            return arr;
        }

        //重写去除validate验证 添加验证
        $.extend($.fn.validatebox.methods, {
            remove: function (jq, newposition) {
                return jq.each(function () {
                    $(this).removeClass("validatebox-text validatebox-invalid").unbind('focus').unbind('blur');
                });
            },

            reduce: function (jq, newposition) {
                return jq.each(function () {
                    var opt = $(this).data().validatebox.options;
                    $(this).addClass("validatebox-text").validatebox(opt);
                });
            }
        });

        //*****引用上年
        function CitingLastYear() {
            if ($('#BudgetYear').combobox("getValue") == "") {
                HDialog.Info("请选择预算年度");
                return;
            }
            if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                HDialog.Info("请选择预算单位");
                return;
            }
            var LasYear = parseInt($('#BudgetYear').combobox("getValue")) - 1;
            var ParameterStr = "BudgetYear=" + $('#BudgetYear').combobox("getValue") + "&BudgetCompany=" + $('#BudgetCompanyCode').val() +
                "&BudgetUnitName=" + $('#BudgetUnit').combobox("getValue");
            $.tool.DataGet('Budget', 'CitingLastYear', ParameterStr,
                function Init() {
                },
                function callback(_Data) {
                    if (_Data != "") {
                        var ReturnResult = eval('(' + _Data + ')');
                        if (ReturnResult.Result == "False") {
                            HDialog.Info($('#BudgetCompany').val() + " " + LasYear + "年度，没有预算数据！");
                            return false;
                        }
                        if (ReturnResult.data.length > 0) {
                            //获取页面上的所有数据
                            var TreeGridData = $('#TableContainerMain').treegrid("getData");
                            var Rows = treeDataToList(TreeGridData);

                            //上年有预算数据需要将数据更新到现在列表中
                            for (var i = 0; i < ReturnResult.data.length; i++) {
                                var Node = $('#TableContainerMain').treegrid("find", ReturnResult.data[i].BudgetProgram);
                                if (Node != null) {
                                    if (Node.BudgetPlanWay == "公式计算" || Node.LevelNum != "0") {
                                        continue;
                                    }
                                    $('#TableContainerMain').treegrid('update', {
                                        id: ReturnResult.data[i].BudgetProgram,
                                        row: {
                                            "1Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["1Y"]), decimalPos),
                                            "2Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["2Y"]), decimalPos),
                                            "3Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["3Y"]), decimalPos),
                                            "4Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["4Y"]), decimalPos),
                                            "5Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["5Y"]), decimalPos),
                                            "6Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["6Y"]), decimalPos),
                                            "7Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["7Y"]), decimalPos),
                                            "8Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["8Y"]), decimalPos),
                                            "9Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["9Y"]), decimalPos),
                                            "10Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["10Y"]), decimalPos),
                                            "11Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["11Y"]), decimalPos),
                                            "12Y": ToDecimal(ConvertToFloat(ReturnResult.data[i]["12Y"]), decimalPos)
                                        }
                                    });
                                }
                            }
                            //更新完详细数据后需要将合计数据统计出来
                            UpdateAmount("0");
                        } else {
                            HDialog.Info($('#BudgetCompany').val() + " " + LasYear + "年度，没有预算数据！");
                            return;
                        }
                    } else {
                        HDialog.Info($('#BudgetCompany').val() + " " + LasYear + "年度，没有预算数据！");
                        return;
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        }

        //*****导入excel
        function FunExport() {
            $.tool.pageLoading();
            setTimeout(function () {
                ExportExcel();
            }, 100);
        }
        function ExportExcel() {
            var ResultStr = $("#UploadExcelFrame").contents().find("#ExcelResult").val();
            //判断excel导入是否有值
            if (ResultStr != undefined && ResultStr.length > 0) {
                //获取页面上的所有数据
                var TreeGridData = $('#TableContainerMain').treegrid("getData");
                var Rows = treeDataToList(TreeGridData);

                var arr = eval('(' + ResultStr + ')');
                for (var i = 0; i < arr.length; i++) {

                    for (var j = 0; j < Rows.length; j++) {
                        //判断是否是预算科目一样，并且只能是最底级预算科目
                        if (arr[i]["预算科目"] == Rows[j].text && Rows[j].LevelNum == "0" && Rows[j].BudgetPlanWay != "" && Rows[j].BudgetPlanWay != "公式计算") {
                            $('#TableContainerMain').treegrid('update', {
                                id: Rows[j].id,
                                row: {
                                    "1Y": ToDecimal(ConvertToFloat(arr[i]["1月"]), decimalPos),
                                    "2Y": ToDecimal(ConvertToFloat(arr[i]["2月"]), decimalPos),
                                    "3Y": ToDecimal(ConvertToFloat(arr[i]["3月"]), decimalPos),
                                    "4Y": ToDecimal(ConvertToFloat(arr[i]["4月"]), decimalPos),
                                    "5Y": ToDecimal(ConvertToFloat(arr[i]["5月"]), decimalPos),
                                    "6Y": ToDecimal(ConvertToFloat(arr[i]["6月"]), decimalPos),
                                    "7Y": ToDecimal(ConvertToFloat(arr[i]["7月"]), decimalPos),
                                    "8Y": ToDecimal(ConvertToFloat(arr[i]["8月"]), decimalPos),
                                    "9Y": ToDecimal(ConvertToFloat(arr[i]["9月"]), decimalPos),
                                    "10Y": ToDecimal(ConvertToFloat(arr[i]["10月"]), decimalPos),
                                    "11Y": ToDecimal(ConvertToFloat(arr[i]["11月"]), decimalPos),
                                    "12Y": ToDecimal(ConvertToFloat(arr[i]["12月"]), decimalPos)
                                }
                            });
                        }
                    }
                }
                //更新完成后需要加载合计数据
                UpdateAmount("0");
                HDialog.Info("导入成功");
                //成功后将原来导入的数据置为空
                $("#UploadExcelFrame").contents().find("#ExcelResult").val("");
                $.tool.pageUnLoading();
            } else {
                HDialog.Info("导入失败");
                $.tool.pageUnLoading();
            }
        }

        //计算小数位数
        var decimalPos = 2;
        //编辑的行号
        var editIndex = undefined;
        var editId = undefined;

        //判断如果是审核中或者是审批完成的数据就没有菜单栏
        if ($("#State").val() != "未启动" && $("#State").val() != "已驳回") {
            toolbar_Main = [];
            toolbar_Vice = [];
            toolbar_Detail = [];
        }

        //***加载预算主表
        function LoadMainList() {
            var data = [];
            if ($('#MainResult').val() != "") {
                data = eval('(' + $('#MainResult').val() + ')');
            }
            $("#TableContainerMain").treegrid({
                treeField: 'text',
                idField: 'id',
                method: "get",
                nowrap: true,
                data: data,
                columns: columnMain,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                border: true,
                toolbar: toolbar_Main,
                width: '100%',
                height: '100%',
                //onClickCell: onClickCell,
                //onAfterEdit: onAfterEdit,
                showFooter: true,
                rowStyler: function (row) {
                    if ((row.LevelNum != undefined && row.LevelNum > 0) || $('#IsUpUnit').val() == "1" || row.BudgetPlanWay == "公式计算") {
                        return 'background-color:#F4F4F4;';
                    }
                },
                onLoadSuccess: function () {
                    //计算合计内容
                    $('#TableContainerMain').treegrid('reloadFooter', [
                        {
                            text: "收入合计",
                            id: "SRHJ",
                            BudgetProgram: "SRHJ",
                            BudgetProgramName: "收入合计",
                            LevelNum: "50"

                        },
                        {
                            text: "支出合计",
                            id: "ZCHJ",
                            BudgetProgram: "ZCHJ",
                            BudgetProgramName: "支出合计",
                            LevelNum: "50"

                        }, {
                            text: "结余合计",
                            id: "JYHJ",
                            BudgetProgram: "JYHJ",
                            BudgetProgramName: "结余合计",
                            LevelNum: "50"

                        }
                    ]);
                    //有数据的时候才加载
                    var TreeGridData = $('#TableContainerMain').treegrid("getData");
                    if (TreeGridData.length > 0) {
                        UpdateAmount("0");
                        //if ($("#State").val() != "已审核" && $('#OpType').val() == "insert") {
                        //    UpdateAmount("0");
                        //} else {
                        //    //只加载页脚
                        //    UpdateAmount("10");
                        //}
                    }
                    $.tool.pageUnLoading();
                }

            });
        }

        //***切换月度并切换加载数据
        function BudgetMonthChange() {
            var dataarr = [];
            if ($('#DetailResult').val() != "") {
                $.tool.pageLoading();
                dataarr = eval("(" + $('#DetailResult').val() + ")");
                //筛选选择的月份对应数据的对象  
                if ($('#BudgetMonth').combobox("getValue") !== undefined) {
                    dataarr = dataarr.filter(function (e) {
                        return e.BudgetMonth == $('#BudgetMonth').combobox("getValue");
                    });
                } else {
                    dataarr = dataarr.filter(function (e) {
                        return e.BudgetMonth == '01';
                    });
                }
                $("#TableContainerDetail").datagrid({
                    data: dataarr,
                    onLoadSuccess: function () {
                        $.tool.pageUnLoading();
                    }
                });
            }
        }
        //***加载预算明细表数据
        function LoadDetailList() {
            var data = [];
            if ($('#DetailResult').val() != "") {
                data = eval("(" + $('#DetailResult').val() + ")");
                //筛选选择的月份对应数据的对象  
                if ($('#BudgetMonth').combobox("getValue") !== undefined) {
                    data = data.filter(function (e) {
                        return e.BudgetMonth == $('#BudgetMonth').combobox("getValue");
                    });
                } else {
                    data = data.filter(function (e) {
                        return e.BudgetMonth == '01';
                    });
                }
            }
            //判断有几层科目 构建表头
            var columnDetailTemp = cloneObj(columnDetail);;
            if ($('#ProgramLevel').val() != "0" && $('#ProgramLevel').val() != "1") {
                for (var i = 2; i <= $('#ProgramLevel').val(); i++) {
                    var columnTemp = { field: i + '级科目', title: i + '级科目', align: 'center', width: 100, sortable: true };
                    //将列 插入指定位置
                    columnDetailTemp[0].splice(i - 1, 0, columnTemp);
                }
            }
            $("#TableContainerDetail").datagrid({
                method: "get",
                nowrap: true,
                data: data,
                columns: columnDetailTemp,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                border: true,
                toolbar: toolbar_Detail,
                width: '100%',
                height: '100%',
                rownumbers: "true",
                onClickCell: onClickCellForDetail,
                onAfterEdit: onAfterEditForDetail,
                onLoadSuccess: function () {
                    $.tool.pageUnLoading();
                }
            });
        }
        //Clone对象
        var cloneObj = function (obj) {
            var newObj = {};
            if (obj instanceof Array) {
                newObj = [];
            }
            for (var key in obj) {
                var val = obj[key];
                newObj[key] = typeof val === 'object' ? cloneObj(val) : val;
            }
            return newObj;
        };

        //编辑的行号
        var editIndexForDetail = undefined;
        //*****预算明细表数据编辑
        function endEditionForDetail() {
            if (editIndexForDetail == undefined) {
                return true
            }
            if ($('#TableContainerDetail').datagrid('validateRow', editIndexForDetail)) {
                $('#TableContainerDetail').datagrid('endEdit', editIndexForDetail);
                editIndexForDetail = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellForDetail(Rowindex, field, value) {
            $('#TableContainerDetail').datagrid('selectRow', Rowindex);
            var SelecteRow = $('#TableContainerDetail').datagrid("getSelected");
            if (SelecteRow.BudgetPlanWay == "公式计算" || SelecteRow.BudgetPlanWay == "业务引入") {
                endEditionForDetail();
                return false;
            }

            if ($("#State").val() != "未启动" && $("#State").val() != "已驳回") {
                endEditionForDetail();
                return false;
            }
            if (endEditionForDetail()) {
                if (field == "YearBudgetCode" || field == "WorkContent" || field == "WorkBeginTime" || field == "WorkEndTime"
                    || field == "WorkStandard" || field == "BudgetValueForYear"
                    || field == "PlanCoding" || field == "PlanYear"
                    || field == "PlanMonth" || field == "PlanName"
                    || field == "PlanStartTime" || field == "PlanEndTime"
                    || field == "Target" || field == "PlanCost") {
                    if ($('#IsUpUnit').val() == "1") {
                        var eB = $("#TableContainerDetail").datagrid('getColumnOption', 'BudgetValueForYear');
                        eB.editor = {};
                    }
                    $('#TableContainerDetail').datagrid('beginEdit', Rowindex);

                    //绑定JS事件
                    var ed = $('#TableContainerDetail').datagrid('getEditors', Rowindex);
                    for (var i = 0; i < ed.length; i++) {
                        var e = ed[i];
                        //选择开始时间
                        if (e.field == "WorkBeginTime") {
                            $(e.target).bind("click", function () {
                                var dateObj = WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' });
                                $('#TableContainerDetail').datagrid('updateRow',
                                    {
                                        index: Rowindex,
                                        row: {
                                            WorkBeginTime: date
                                        }
                                    });
                            })
                        }
                        //选择结束时间
                        if (e.field == "WorkEndTime") {
                            $(e.target).bind("click", function () {
                                var dateObj = WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' });
                                $('#TableContainerDetail').datagrid('updateRow',
                                    {
                                        index: Rowindex,
                                        row: {
                                            WorkEndTime: date
                                        }
                                    });
                            })
                        }
                        //选择计划开始时间
                        if (e.field == "PlanStartTime") {
                            $(e.target).bind("click", function () {
                                var dateObj = WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' });
                                $('#TableContainerDetail').datagrid('updateRow',
                                    {
                                        index: Rowindex,
                                        row: {
                                            PlanStartTime: date
                                        }
                                    });
                            })
                        }
                        //选择计划结束时间
                        if (e.field == "PlanEndTime") {
                            $(e.target).bind("click", function () {
                                var dateObj = WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' });
                                $('#TableContainerDetail').datagrid('updateRow',
                                    {
                                        index: Rowindex,
                                        row: {
                                            PlanEndTime: date
                                        }
                                    });
                            })
                        }

                    }
                }
                editIndexForDetail = Rowindex;
            }
        }

        function onAfterEditForDetail(rowIndex, row, changes) {
            //判断数据是否是格式正确的
            //循环判断是否是数据填写格式正确
            //for (var i = 1; i <= 12; i++) {
            //    var colName = i + "Y";
            //    //判断changes是否有值
            //    if (changes[colName] != undefined) {
            //        row[colName] = ToDecimal(ConvertToFloat(changes[colName]), decimalPos)
            //    }
            //}
            var updated = $('#TableContainerDetail').datagrid('getChanges', 'updated');
            if (updated.length < 1) {
                //editRow = undefined;
                $('#TableContainerDetail').datagrid('unselectAll');
                return;
            } else {
                if (editIndexForDetail != undefined) {
                    $("#TableContainerDetail").datagrid('acceptChanges', editIndexForDetail);
                    $('#TableContainerDetail').datagrid('endEdit', editIndexForDetail);
                }
            }
        }

        //****预算主表数据编辑
        function endEditing() {//该方法用于关闭上一个焦点的editing状态  
            if (editIndex == undefined) {
                return true
            }
            if ($('#TableContainerMain').treegrid('validateRow', editIndex)) {
                $('#TableContainerMain').treegrid('endEdit', editIndex);
                editIndex = undefined;
                return true;
            } else {
                return false;
            }
        }
        //点击单元格事件：  
        function onClickCell(field, row) {
            //去除编辑器   上级单位不能编辑   
            if ($('#IsUpUnit').val() == "1" || row.BudgetPlanWay == "公式计算") {
                endEditing();
                return false;
            }
            if ($("#State").val() != "未启动" && $("#State").val() != "已驳回") {
                endEditing();
                return false;
            }
            if (endEditing()) {
                if (field != "text" && field != "LastYearBudgetValue" &&
                    field != "LastYearCompleteValue" && field != "BudgetValueForYear" && row.LevelNum == "0") {
                    $(this).treegrid('beginEdit', row.id);
                    $(this).treegrid('select', row.id);
                    //选中点击的单元格
                    //var ed = $(this).treegrid('getEditor', { id: row.id, field: field });
                    //$(ed).focus();
                }
                editIndex = row.id;
                editId = row.id;
            }
            //$('#TableContainerMain').treegrid('onClickRow')
        }
        //单元格失去焦点执行的方法  
        function onAfterEdit(row, changes) {
            //判断数据是否是格式正确的
            //循环判断是否是数据填写格式正确
            for (var i = 1; i <= 12; i++) {
                var colName = i + "Y";
                //判断changes是否有值
                if (changes[colName] != undefined) {
                    row[colName] = ToDecimal(ConvertToFloat(changes[colName]), decimalPos)
                }
            }
            var updated = $('#TableContainerMain').treegrid('getChanges', 'updated');
            if (updated.length < 1) {
                //editRow = undefined;
                $('#TableContainerMain').treegrid('unselectAll');
                return;
            } else {
                // 传值  
                UpdateAmount("1");
            }
        }

        //***加载预算附表
        function LoadViceList() {
            $("#TableContainerVice").datagrid({
                idField: "ID",
                nowrap: true,
                columns: columnVice,
                fitColumns: true,
                singleSelect: true,
                pagination: false,
                rownumbers: true,
                border: true,
                striped: true,
                toolbar: toolbar_Vice,
                remoteSort: false,
                width: '100%',
                height: '100%',
                onLoadSuccess: function () {

                }
            });
            var data = [];
            if ($('#ViceResult').val() != "") {
                data = eval('(' + $('#ViceResult').val() + ')');
            }
            //****加载数据
            $('#TableContainerVice').datagrid('loadData', data);
            $.tool.pageUnLoading();
        }

        //将 列表内容存入隐藏控件中
        function ClientClick() {
            try {
                //获取treegrid的所有数据
                //获取页面上的所有数据
                var TreeGridData = $('#TableContainerMain').treegrid("getData");
                //新增的时候必须要有数据
                if ($('#OpType').val() == "insert") {
                    //必须要 修改预算主表数据 预算明细表数据
                    if ($('#IsEditMainData').val() == "1") {
                        HDialog.Info("请完善预算数据");
                        $.tool.pageUnLoading();
                        return false;
                    }
                    if ($('#IsEditDetailData').val() == "1") {
                        HDialog.Info("请完善预算明细数据数据");
                        $.tool.pageUnLoading();
                        return false;
                    }
                } else if ($('#OpType').val() == "edit") {
                    if ($('#IsEditMainData').val() == "1" && $('#IsEditDetailData').val() == "0") {
                        HDialog.Info("请加载预算主表数据");
                        $.tool.pageUnLoading();
                        return false;
                    }
                }
                var Rows = treeDataToList(TreeGridData);
                $("#ReturnResult").val(JSON.stringify(Rows));
                return true;
            } catch (e) {
                //判断如果是新增状态就必须要有值 如果是修改状态就认为是不修改数据
                if ($('#OpType').val() == "insert") {
                    HDialog.Info("请完善预算计划数据");
                    return false;
                } else {
                    if ($('#IsEditMainData').val() == "1" && $('#IsEditDetailData').val() == "0") {
                        HDialog.Info("请加载预算主表数据");
                        $.tool.pageUnLoading();
                        return false;
                    }
                    return true;
                }
                $.tool.pageUnLoading();
            }
        }

        $("#BtnClose").click(function (e) {
            HDialog.Close('1');
        });

        var IsSubmitFlag = true;
        $("input[type='submit']").click(function (e) {
            $.tool.pageLoading();
            //关闭编辑状态
            endEditing();
            if (IsSubmitFlag == false) {
                HDialog.Info("30秒内不要重复点击");
                $.tool.pageUnLoading();
                return false;
            }
            if (e.target.value == "驳回") {
                //驳回权限判断
                if ($('#IsBakRole').val() == "1") {
                    return true;
                } else {
                    $.tool.pageUnLoading();
                    HDialog.Info("无此权限");
                    return false;
                }
            }
            if (ClientClick()) {
                IsSubmitFlag = false;
                setTimeout('IsSubmitFlag=true', 30000);
                var isValid = $("#frmForm").form('validate');
                if (isValid == true) {
                    if (document.all.WorkFlowManage_WorkFlowType.value == "") {
                        HDialog.Info("请选择审批流程");
                        $.tool.pageUnLoading();
                        return false;
                    }
                    return true;
                }
                else {
                    $.tool.pageUnLoading();
                    return false;
                }
            } else {
                $.tool.pageUnLoading();
                return false;
            }
        });

        //预算计划审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
        function SelWorkFlowType() {
            if ($('#BudgetCompany').val() == "" || $('#BudgetCompanyCode').val() == "") {
                HDialog.Info("请选择预算单位");
                return;
            }
            if ($('#BudgetYear').combobox("getValue") == "") {
                HDialog.Info("请选择预算年度");
                return;
            }
            //判断是不是上级单位
            if ($('#IsUpUnit').val() == "0") {
                //不是上级单位就需要选择模板
                if ($('#BudgetTemplate').val() == "" || $('#BudgetTemplateCode').val() == "") {
                    HDialog.Info("请选择预算模板");
                    return;
                }
            }
            //计划人
            if ($('#BudgetPlanUser').val() == "" || $('#BudgetPlanUserCode').val() == "") {
                HDialog.Info("请选择预算计划人");
                return;
            }
            //计划时间
            if ($('#BudgetPlanDate').datebox("getValue") == "") {
                HDialog.Info("请选择预算计划时间");
                return;
            }
            //预算表名称
            if ($('#BudgetTableName').val() == "") {
                HDialog.Info("请填写预算表名称");
                return;
            }
            //判断如果是修改 预算主表数据可以没有 如果是新增预算主表明细数据必须要有
            if ($('#OpType').val() == "insert") {
                //判断是否填写数据
                try {
                    var TreeGridData = $('#TableContainerMain').treegrid("getData");
                    if ($('#IsEditMainData').val() == "1" || TreeGridData.length == 0) {
                        HDialog.Info("请完善预算数据");
                        return;
                    }
                    if ($('#IsEditDetailData').val() == "1") {
                        HDialog.Info("请完善预算明细数据");
                        return;
                    }
                } catch (e) {
                    if ($('#OpType').val() == "insert") {
                        HDialog.Info("请完善预算计划数据");
                        return;
                    } else {
                        if ($('#IsEditMainData').val() == "1" && $('#IsEditDetailData').val() == "0") {
                            HDialog.Info("请加载预算主表数据");
                            $.tool.pageUnLoading();
                            return;
                        }
                    }
                }
            } else if ($('#OpType').val() == "edit") {
                if ($('#IsEditMainData').val() == "1" && $('#IsEditDetailData').val() == "0") {
                    HDialog.Info("请加载预算主表数据");
                    $.tool.pageUnLoading();
                    return;
                }
            }

            if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {

                var FlowId = GetWorkFlow.CostWorkFlowId('1001', $("#BudgetCompanyCode").val(), 0);
                if (FlowId == undefined || FlowId == "undefined") {
                    FlowId = "";
                }
                if (FlowId == "") {
                    HDialog.Info("请设置审核流程!");
                    return;
                }
                var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&FlowId=" + FlowId + "&Filter=1001&biaoshi=1&random=" + Math.random();
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

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;

        }

        //****加载附件列表
        function LoadUploadList() {
            $.tool.DataGet('Budget', 'GetFileList', 'BudgetID=' + $('#PlanId').val(),
                function Init() {
                },
                function callback(_Data) {
                    var rows = eval('(' + _Data + ')');
                    $('#TableContainerVice').datagrid('loadData', rows);
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
        }


        //导出Excel中需要的数据列
        var ExcelCol;
        var Headcolumn;

        var ExcelCol = [
            { field: 'text', title: '预算科目', width: 160, align: 'left', sortable: true },
            { field: 'LastYearBudgetValue', title: '上年预算值', width: 80, align: 'center', sortable: true },
            { field: 'LastYearCompleteValue', title: '上年完成值', width: 80, align: 'center', sortable: true },
            { field: 'BudgetValueForYear', title: '本年预算值', width: 80, align: 'center', sortable: true },
            { field: '1Y', title: '1月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '2Y', title: '2月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '3Y', title: '3月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '4Y', title: '4月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '5Y', title: '5月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '6Y', title: '6月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '7Y', title: '7月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '8Y', title: '8月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '9Y', title: '9月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '10Y', title: '10月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '11Y', title: '11月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '12Y', title: '12月', align: 'center', width: 60, sortable: true, editor: 'text' }
        ];

        var Headcolumn = [[
            { field: 'text', title: '预算科目', width: 160, align: 'left', sortable: true },
            { field: 'LastYearBudgetValue', title: '上年预算值', width: 80, align: 'center', sortable: true },
            { field: 'LastYearCompleteValue', title: '上年完成值', width: 80, align: 'center', sortable: true },
            { field: 'BudgetValueForYear', title: '本年预算值', width: 80, align: 'center', sortable: true },
            { field: '1Y', title: '1月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '2Y', title: '2月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '3Y', title: '3月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '4Y', title: '4月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '5Y', title: '5月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '6Y', title: '6月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '7Y', title: '7月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '8Y', title: '8月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '9Y', title: '9月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '10Y', title: '10月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '11Y', title: '11月', align: 'center', width: 60, sortable: true, editor: 'text' },
            { field: '12Y', title: '12月', align: 'center', width: 60, sortable: true, editor: 'text' }
        ]];

        //导出Excel
        function Export(strXlsName, exportGrid) {
            var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
            var l = $('<input type="hidden" id="txtName" name="txtName" />');
            i.val(ChangeToTable4(exportGrid, Headcolumn, ExcelCol));
            i.appendTo(f);
            l.val(strXlsName);
            l.appendTo(f);
            f.appendTo(document.body).submit();
            document.body.removeChild(f);
        }

        //导出树形结构Excel
        function ChangeToTable4(printDatagrid, HeadcolumnsList, columnsList) {
            var tableString = '<table cellspacing="0" class="pb">';
            var frozenColumns = undefined;  // 得到frozenColumns对象
            var columns = HeadcolumnsList; //printDatagrid.datagrid("options").columns;    // 得到columns对象
            var nameList = columnsList;

            // 载入title
            if (typeof columns != 'undefined' && columns != '') {
                $(columns).each(function (index) {
                    tableString += '\n<tr>';
                    if (typeof frozenColumns != 'undefined' && typeof frozenColumns[index] != 'undefined') {
                        for (var i = 0; i < frozenColumns[index].length; ++i) {
                            if (!frozenColumns[index][i].hidden) {
                                tableString += '\n<th style="background-color:#c0c0c0;" width="' + frozenColumns[index][i].width + '"';
                                if (typeof frozenColumns[index][i].rowspan != 'undefined' && frozenColumns[index][i].rowspan > 1) {
                                    tableString += ' rowspan="' + frozenColumns[index][i].rowspan + '"';
                                }
                                if (typeof frozenColumns[index][i].colspan != 'undefined' && frozenColumns[index][i].colspan > 1) {
                                    tableString += ' colspan="' + frozenColumns[index][i].colspan + '"';
                                }
                                tableString += '>' + frozenColumns[0][i].title + '</th>';
                            }
                        }
                    }
                    for (var i = 0; i < columns[index].length; ++i) {
                        if (!columns[index][i].hidden) {
                            tableString += '\n<th style="background-color:#c0c0c0;" width="' + columns[index][i].width + '"';
                            if (typeof columns[index][i].rowspan != 'undefined' && columns[index][i].rowspan > 1) {
                                tableString += ' rowspan="' + columns[index][i].rowspan + '"';
                            }
                            if (typeof columns[index][i].colspan != 'undefined' && columns[index][i].colspan > 1) {
                                tableString += ' colspan="' + columns[index][i].colspan + '"';
                            }
                            tableString += '>' + columns[index][i].title + '</th>';
                        }
                    }
                    tableString += '\n</tr>';
                });
            }
            // 载入内容
            //var rows = printDatagrid.datagrid("getData"); // 这段代码是获取当前页的所有行

            var TreeGridData = $('#TableContainerMain').treegrid("getData");
            var rows = treeDataToList(TreeGridData);

            for (var i = 0; i < rows.length; i++) {
                tableString += '\n<tr>';
                for (var j = 0; j < nameList.length; j++) {
                    tableString += '\n<td';
                    if (nameList[j].align != 'undefined' && nameList[j].align != '') {

                        tableString += ' style="text-align:' + nameList[j].align + ';"';
                    }
                    if (rows[i].LevelNum != "0" || rows[i].BudgetPlanWay != "公式计算") {
                        tableString += ' style="background-color:#ccc;" >';
                    } else {
                        tableString += ' >';
                    }
                    var FiledName = nameList[j].field;

                    if (j > 0) {
                        if ($("#" + nameList[j].field + "_" + rows[i].id).is(':checked'))
                            tableString += '√';
                        else
                            tableString += '';
                    }

                    else
                        tableString += rows[i][FiledName];

                    tableString += '</td>';
                }
                tableString += '\n</tr>';
            }
            tableString += '\n</table>';
            return tableString;
        }

        //导出预算详表
        function ExportDetail(strXlsName, exportGrid) {
            var f = $('<form action="../export.aspx" method="post" id="fm1"></form>');
            var i = $('<input type="hidden" id="txtContent" name="txtContent" />');
            var l = $('<input type="hidden" id="txtName" name="txtName" />');
            var columnsTemp = exportGrid.datagrid("options").columns;
            //columnsTemp[0] = removeArr(columnsTemp[0], "field", "BudgetValueForYear");
            i.val(ChangeToTable5(exportGrid, columnsTemp, columnsTemp));
            i.appendTo(f);
            l.val(strXlsName);
            l.appendTo(f);
            f.appendTo(document.body).submit();
            document.body.removeChild(f);

        }

        function ChangeToTable5(printDatagrid, HeadcolumnsList, columnsList) {
            var tableString = '<table cellspacing="0" class="pb">';
            var frozenColumns = undefined;  // 得到frozenColumns对象
            var columns = HeadcolumnsList; //printDatagrid.datagrid("options").columns;    // 得到columns对象
            var nameList = columnsList;

            // 载入title
            if (typeof columns != 'undefined' && columns != '') {
                $(columns).each(function (index) {
                    tableString += '\n<tr>';
                    if (typeof frozenColumns != 'undefined' && typeof frozenColumns[index] != 'undefined') {
                        for (var i = 0; i < frozenColumns[index].length; ++i) {
                            if (!frozenColumns[index][i].hidden) {
                                tableString += '\n<th style="background-color:#c0c0c0;" width="' + frozenColumns[index][i].width + '"';
                                if (typeof frozenColumns[index][i].rowspan != 'undefined' && frozenColumns[index][i].rowspan > 1) {
                                    tableString += ' rowspan="' + frozenColumns[index][i].rowspan + '"';
                                }
                                if (typeof frozenColumns[index][i].colspan != 'undefined' && frozenColumns[index][i].colspan > 1) {
                                    tableString += ' colspan="' + frozenColumns[index][i].colspan + '"';
                                }
                                tableString += '>' + frozenColumns[0][i].title + '</th>';
                            }
                        }
                    }
                    for (var i = 0; i < columns[index].length; ++i) {
                        if (!columns[index][i].hidden || columns[index][i].title == "科目代码" || columns[index][i].title == "预算月份") {
                            tableString += '\n<th style="background-color:#c0c0c0;" height:\'30px\'; width="' + columns[index][i].width + '"';
                            if (typeof columns[index][i].rowspan != 'undefined' && columns[index][i].rowspan > 1) {
                                tableString += ' rowspan="' + columns[index][i].rowspan + '"';
                            }
                            if (typeof columns[index][i].colspan != 'undefined' && columns[index][i].colspan > 1) {
                                tableString += ' colspan="' + columns[index][i].colspan + '"';
                            }
                            tableString += '>' + columns[index][i].title + '</th>';
                        }
                    }
                    tableString += '\n</tr>';
                });
            }
            // 载入内容
            var rows = printDatagrid.datagrid("getRows"); // 这段代码是获取当前页的所有行
            //循环构建12个月的数据
            for (var x = 1; x < 13; x++) {
                for (var i = 0; i < rows.length; i++) {
                    //判断如果是人工录入方式得才能通过导入方式进入
                    if (rows[i].BudgetPlanWay != "人工录入") {
                        continue;
                    }
                    tableString += '\n<tr>';
                    for (var j = 0; j < nameList[0].length; j++) {
                        tableString += '\n<td';
                        if (nameList[0][j].align != 'undefined' && nameList[0][j].align != '') {
                            tableString += ' style="text-align:' + nameList[0][j].align + '; height:\'40px\'"';
                        }
                        tableString += '>';
                        if (nameList[0][j].field == "YSYF") {
                            //预算月份
                            tableString += String(x);
                        }
                        else {
                            var FiledName = nameList[0][j].field;
                            var ValueStr = rows[i][FiledName] != undefined ? rows[i][FiledName] : "";
                            tableString += ValueStr;
                        }
                        tableString += '</td>';
                    }
                    tableString += '\n</tr>';
                }
            }
            tableString += '\n</table>';
            return tableString;
        }


    </script>
</body>
</html>
