<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentTransactionChange.aspx.cs" Inherits="M_Main.EquipmentNew.EquipmentTransactionChange" %>

<%@ Register TagPrefix="uc1" TagName="BussListWorkFlow" Src="../UserControl/BussListWorkFlow.ascx" %>
<%@ Register Src="~/UserControl/BussApproved.ascx" TagPrefix="uc1" TagName="BussApproved" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备异常信息</title>
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
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="IsShow" name="IsShow" value="false" runat="server" />
        <input type="hidden" id="BussId" name="BussId" value="" runat="server" />
        <input type="hidden" id="ChangeID" name="ChangeID" value="false" runat="server" />

        <input type="hidden" id="Ture_Purchase_UpdatePrice" name="Ture_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="Ture_Purchase_Check_UpdatePrice" name="Ture_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_UpdatePrice" name="False_Purchase_UpdatePrice" runat="server" />
        <input type="hidden" id="False_Purchase_Check_UpdatePrice" name="False_Purchase_Check_UpdatePrice" runat="server" />
        <input type="hidden" id="State" name="State" value="未启动" runat="server" />
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
                <td class="DialogTdTitle">项目名称
                </td>
                <td class="DialogTdContent">
                    <input id="CommName" name="CommName" class="Control_IteminputNoStyle" style="width: 90%;" onclick="SelItem();" runat="server" readonly="readonly" data-options="required:true" />
                    <input type="hidden" id="CommID" name="CommID" value="" runat="server" />
                </td>
                <td class="DialogTdTitle">设备名称
                </td>
                <td class="DialogTdContent">
                    <input id="EquipmentName" name="EquipmentName" class="Control_IteminputNoStyle" runat="server" style="width: 90%;" onclick="SelEquipment();" readonly="readonly" />
                    <span id="SpanEquipmentName" style="display: none; font-size: 13.5px;" runat="server"></span>
                    <input type="hidden" id="EquipmentId" name="EquipmentId" value="" runat="server" />
                    <input type="hidden" id="RateOfDepreciation" name="RateOfDepreciation"  runat="server" value="" />
                </td>
                <td class="DialogTdTitle">查看设备
                </td>
                <td class="DialogTdContent">
                    <a id="personnalShow" style="color: blue; cursor: pointer;"  onclick="EquipmentShow()">查看详情</a>
                </td>
            </tr>
                   <tr>
                <td class="DialogTdTitle">异动主题
                </td>
                <td class="DialogTdContent" colspan="5">
                    <input id="TitleName" name="TitleName" runat="server" class="Control_IteminputNoStyle" style="width: 90%;" data-options="required:true" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">设备编号
                </td>
                <td class="DialogTdContent">
                    <input class="Control_IteminputNoStyle" runat="server" id="EquipmentNO" name="EquipmentNO" style="width: 90%" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">设备品牌
                </td>
                <td class="DialogTdContent">
                    <input id="EBrand" name="EBrand" runat="server" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">设备型号
                </td>
                <td class="DialogTdContent">
                    <input id="EModel" name="EModel" runat="server" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">生产厂家
                </td>
                <td class="DialogTdContent">
                    <input id="Manufacturers" runat="server" name="Manufacturers" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">安装位置
                </td>
                <td class="DialogTdContent">
                    <input id="InstallPosition" runat="server" name="InstallPosition" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">投运日期
                </td>
                <td class="DialogTdContent">
                    <input class="Control_IteminputNoStyle" runat="server" format="date" id="RunDate" name="RunDate"
                        style="width: 90%" onclick="WdatePicker()" readonly="readonly" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">质保期限（年）
                </td>
                <td class="DialogTdContent">
                    <input id="WarrantyPeriod" runat="server" name="WarrantyPeriod" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">设备原值（元）
                </td>
                <td class="DialogTdContent">
                    <input id="ValueOfEquipment" runat="server" name="ValueOfEquipment" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">折旧年限（年）
                </td>
                <td class="DialogTdContent">
                    <input id="EpreciationAge" runat="server" name="EpreciationAge" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">设备残值（元）
                </td>
                <td class="DialogTdContent">
                    <input id="ValueOfNow" runat="server" name="ValueOfNow" class="Control_IteminputNoStyle" style="width: 90%;" readonly="readonly" />
                </td>
                <td class="DialogTdTitle">大修次数
                </td>
                <td class="DialogTdContent">
                    <input id="FixNum" name="FixNum" class="Control_IteminputNoStyle" style="width: 90%;" runat="server"
                        onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                        onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
                </td>
                <td class="DialogTdTitle">修理费用
                </td>
                <td class="DialogTdContent">
                    <input id="FixCost"  runat="server" name="FixCost" class="Control_IteminputNoStyle" style="width: 90%;" />
                </td>
            </tr>

            <tr>
                <td class="DialogTdTitle">异动类型
                </td>
                <td class="DialogTdContent" colspan="5">
                    <select id="ChangeType" runat="server" name="ChangeType">
                        <option value="停用">停用</option>
                        <option value="封存">封存</option>
                        <option value="报废">报废</option>
                        <option value="启用">启用</option>
                    </select>

                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">异动理由
                </td>
                <td class="DialogTdContent" colspan="5">
                    <input id="ChangeNote" name="ChangeNote" runat="server" class="Control_IteminputNoStyle" style="width: 90%;" data-options="required:true" />
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
            function InitPurchaseTableHeight() {
                var w = $(window).width();
                $("#Container").css("width", (w - 8) + "px");
                $("#OAFlow").css("width", (w - 8) + "px");
                $(".DialogTable").css("width", (w - 8) + "px");
            }
            InitPurchaseTableHeight();
            $("#BtnIsPrint").hide();
            $(document).ready(function () {
           
                //加载字典设置 
                if (GetQueryString('OpType') == 'insert') {
                }
            });

            $("#BtnIsPrint").click(function () {
                HDialog.Info("暂未开发！");
            });

            $("#BtnClose").click(function (e) {
                HDialog.Close('1');
            });

            //数据验证
            function ClientClick() {

                return true;
            };
            var IsSubmitFlag = true;
            $("input[type='submit']").click(function (e) {
                if ($("#IsShow").val() == "true") {
                    HDialog.Info("当前无法操作！");
                    return false;
                }
                if (ClientClick()) {
                    if (document.getElementById("CommName").value == "") {
                        HDialog.Info("项目名称不能为空！");
                        return false;
                    }
                    if (document.getElementById("EquipmentName").value == "") {
                        HDialog.Info("设备名称不能为空!");
                        return false;
                    }
                    if (document.getElementById("ChangeNote").value == "") {
                        HDialog.Info("异动理由不能为空!");
                        return false;
                    }
                    if (document.getElementById("TitleName").value == "") {
                        HDialog.Info("异动主题不能为空!");
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

            //计划单审批流程     单双击选择流程，如果有默认的绑定流程，则自动加载
            function SelWorkFlowType() {
                if (document.getElementById("CommName").value == "") {
                    HDialog.Info("项目名称不能为空！");
                    return false;
                }
                if (document.getElementById("EquipmentName").value == "") {
                    HDialog.Info("设备名称不能为空!");
                    return false;
                }
                if (document.getElementById("ChangeNote").value == "") {
                    HDialog.Info("异动理由不能为空!");
                    return false;
                }
                if (document.getElementById("TitleName").value == "") {
                    HDialog.Info("异动主题不能为空!");
                    return false;
                }
             
                if ($("#State").val() == "未启动" || $("#State").val() == "已驳回") {
                    var strPage = "../OAWorkFlowNew/FlowSortManageSel.aspx?DirectionaryCode=0015&Filter=1101&biaoshi=1&random=" + Math.random();
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

            /************************************选择框****************************************/
            //查看设备
            function EquipmentShow() {
                var w = $(window).width();
                if (document.getElementById("EquipmentId").value.trim() != "") {
                    HDialog.Open(w, '600', '../EquipmentNew/EquipmentFromTabs.aspx?changBS=view&EquipmentId=' + document.getElementById("EquipmentId").value + "&OpType=edit" + "&CommID=" + $('#CommID').val(), '设备详情', false, function callback(_Data) {
                             });
                }
                else {
                    HDialog.Info("请先选择设备！");
                }
            }
            //选择项目
            function SelItem() {
                HDialog.Open('370', '360', '../DialogNew/SelItem.aspx', '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#CommID").val(varObjects[2]);
                        $("#CommName").val(varObjects[1]);
                    }
                });
            }

            //选择设备
            function SelEquipment() {
                if ($("#CommID").val() == "" || $("#CommID").val() == null) {
                    HDialog.Info("请先选择项目！");
                    return;
                }
                HDialog.Open('600', '450', '../EquipmentNew/EquipmentDialog.aspx?CommID=' + $("#CommID").val(), '选择设备', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#EquipmentId").val(varObjects.EquipmentId);
                        $("#EquipmentName").val(varObjects.EquipmentName);
                        //设置 异动审批主题 初始值
                        $("#TitleName").val($("#EquipmentName").val() + "-" + $("#ChangeType").val());
                        //根据选择的设备查询设备信息
                        $.ajax({
                            url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetEquipmentInformationById&EquipmentId=' + $("#EquipmentId").val(),
                            type: 'GET',
                            dataType: 'json',
                            cache: false,
                            success: function (_Data) {
                                if (_Data != null && _Data != "null") {
                                    $("#EquipmentNO").val(_Data[0].EquipmentNO);
                                    $("#EBrand").val(_Data[0].EBrand);
                                    $("#EModel").val(_Data[0].EModel);
                                    $("#Manufacturers").val(_Data[0].Manufacturers);
                                    $("#InstallPosition").val(_Data[0].InstallPosition);
                                    $("#RunDate").val(_Data[0].RunDate);
                          
                                    ////取当前年
                                    //var d = new Date();
                                    //var nowYear = d.getFullYear();
                                    ////取投运年
                                    //var tYear = _Data[0].RunDate.split('/');
                                    ////使用年限（年） 当前年-投运年
                                    //var numYear = parseInt(nowYear) - parseInt(tYear[0]);
                                    //$("#UseDate").val(numYear);
                                    var ValueOfEquipment = _Data[0].ValueOfEquipment == null ? 0 : _Data[0].ValueOfEquipment;
                                    var RateOfDepreciation = _Data[0].RateOfDepreciation == null ? 0 : _Data[0].RateOfDepreciation;
                                    var EpreciationAge = _Data[0].EpreciationAge == null ? 0 : _Data[0].EpreciationAge;
                                    $("#RateOfDepreciation").val(RateOfDepreciation);
                                    $("#ValueOfEquipment").val(ValueOfEquipment);
                                    $("#EpreciationAge").val(EpreciationAge);
                                    //设备残值（元）=设备原值-（（设备原值*折旧率）/100）*折旧年限
                                    var valueMoney = parseFloat(ValueOfEquipment) - (ValueOfEquipment * ((RateOfDepreciation) / 100)) * EpreciationAge;
                                    $("#ValueOfNow").val(valueMoney);
                        
                                }
                            },
                            complete: function (XMLHttpRequest, textStatus, errorThrown) {

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.messager.alert('错误', '数据读取错误', 'error');
                            }
                        });
                    }
                });
            }


        </script>
    </form>
</body>
</html>
