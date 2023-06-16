<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentInformation.aspx.cs" Inherits="M_Main.EquipmentNew.EquipmentInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备主信息</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script src="../jscript/Guid.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: auto;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-left: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #95B8E7 solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            width: 142px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 8%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }
    </style>
</head>
<body>
    <form id="frmFrom" runat="server">
        <div id="layoutNorth" style="overflow: auto;">
            <div style="padding: 5px;">
                <div style="border: 1px solid #E7EAEC; background-color: #F8F8F8; text-align: center; padding: 6px 0px;">
                    设备基本信息
                </div>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">所属项目:</td>
                        <td class="TdContentSearch">
                            <input id="CommName" name="CommName" type="text" class="easyui-validatebox" readonly runat="server" />
                        </td>
                        <td class="TdTitle">设备系统:</td>
                        <td class="TdContentSearch">
                            <input id="SystemName" name="SystemName" type="text" class="easyui-validatebox" readonly onclick="SelRankSys();" data-options="required:true" />
                            <input type="hidden" id="SystemId" name="SystemId" value="" />
                        </td>
                        <td class="TdTitle">设备级别:</td>
                        <td class="TdContentSearch">
                            <input id="RankName" name="RankName" type="text" class="easyui-validatebox" readonly onclick="SelRankLevel();" data-options="required:true" />
                            <input type="hidden" id="RankId" name="RankId" value="" />
                        </td>
                        <td class="TdTitle">设备空间名称:</td>
                        <td class="TdContentSearch">
                            <input id="SpaceName" name="SpaceName" type="text" class="easyui-validatebox" readonly onclick="SelSpace();" data-options="required:true" />
                            <input type="hidden" id="SpaceId" name="SpaceId" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">设备名称:</td>
                        <td class="TdContentSearch">
                            <input id="EquipmentName" name="EquipmentName" type="text" class="easyui-validatebox" data-options="required:true" /></td>
                        <td class="TdTitle">设备编号:</td>
                        <td class="TdContentSearch">
                            <input id="EquipmentNO" name="EquipmentNO" type="text" class="easyui-validatebox" data-options="required:true" /></td>
                        <td class="TdTitle">资产编号:</td>
                        <td class="TdContentSearch">
                            <input id="AssetsNO" name="AssetsNO" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">图位号:</td>
                        <td class="TdContentSearch">
                            <input id="FigureNumber" name="FigureNumber" type="text" class="easyui-validatebox" /></td>

                    </tr>
                    <tr>
                        <td class="TdTitle">设备等级:</td>
                        <td class="TdContentSearch">
                            <select id="EquipmentLevel" name="EquipmentLevel" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:60" runat="server">
                                <option value=""></option>
                                <option value="一级">一级</option>
                                <option value="二级">二级</option>
                                <option value="三级">三级</option>
                                <option value="四级">四级</option>
                                <option value="五级">五级</option>
                            </select>
                        </td>
                        <td class="TdTitle">管控区域:</td>
                        <td class="TdContentSearch" colspan="5">
                            <input id="ControlArea" style="width: 97%;" name="ControlArea" type="text" class="easyui-validatebox" /></td>
                    </tr>
                    <tr>

                        <td class="TdTitle">设备品牌:</td>
                        <td class="TdContentSearch">
                            <input id="EBrand" name="EBrand" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">设备型号:</td>
                        <td class="TdContentSearch">
                            <input id="EModel" name="EModel" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">设备尺寸:</td>
                        <td class="TdContentSearch">
                            <input id="EquipmentSize" name="EquipmentSize" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">设备重量:</td>
                        <td class="TdContentSearch">
                            <input id="EquipmentWeight" name="EquipmentWeight" type="text" class="easyui-validatebox" /></td>
                    </tr>


                    <tr>
                        <td class="TdTitle">投运日期:</td>
                        <td class="TdContentSearch">
                            <input id="RunDate" name="RunDate" class="easyui-datebox" data-options="editable:false" />
                        </td>
                        <td class="TdTitle">使用年限（月）:</td>
                        <td class="TdContentSearch">
                            <input id="ServiceYear" name="ServiceYear" type="text" class="easyui-numberbox" data-options="precision:0" /></td>
                        <td class="TdTitle">设备原值（元）:</td>
                        <td class="TdContentSearch">
                            <input id="ValueOfEquipment" name="ValueOfEquipment" type="text" class="easyui-numberbox" data-options="precision:2" /></td>
                        <td class="TdTitle">折旧年限（年）:</td>
                        <td class="TdContentSearch">
                            <input id="EpreciationAge" name="EpreciationAge" type="text" class="easyui-numberbox" />
                            <label id="HidText" style="display: none; width: 110px; color: red; float: left;">该设备已过折旧年限</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">折旧方式:</td>
                        <td class="TdContentSearch" colspan="7">
                            <input id="DepreciationMethod" style="width: 97%;" name="DepreciationMethod" type="text" class="easyui-validatebox" /></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">责任部门:</td>
                        <td class="TdContentSearch">
                            <input id="DepName" name="DepName" type="text" class="easyui-validatebox" onclick="SelDep();" />
                            <input type="hidden" name="DepCode" id="DepCode" value="" />
                        </td>
                        <td class="TdTitle">维保状态:</td>
                        <td class="TdContentSearch">
                            <%--<input id="MaintenanceStatus" name="MaintenanceStatus" type="text" data-options="required:true" class="easyui-validatebox" />--%>
                            <select id="MaintenanceStatus" name="MaintenanceStatus" class="easyui-combobox" data-options="required:true,editable:false,panelHeight:'auto',width:120" runat="server">
                                <option value=""></option>
                                <option value="自行维保">自行维保</option>
                                <option value="质保期内">质保期内</option>
                                <option value="外委维保">外委维保</option>
                            </select>
                        </td>
                        <td class="TdTitle">异动状态:</td>
                        <td class="TdContentSearch">
                            <input id="TransactionStatus" name="TransactionStatus" type="text" class="easyui-validatebox" />
                        </td>

                        <td class="TdTitle">设备二维码:</td>
                        <td class="TdContentSearch">
                            <input type="button" class="button" value="查看二维码" id="BtnGetQrImg" onclick="QrImages();" />
                            <input type="hidden" name="QRCode" id="QRCode" value="" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td class="TdTitle">备注:</td>
                        <td class="TdContentSearch" colspan="7">
                            <input id="Remark" name="Remark" type="text" class="easyui-validatebox" style="width: 97%; height: 22px;" /></td>
                    </tr>

                    <tr>
                        <td class="TdTitle">照片:</td>
                        <td class="TdContentSearch" colspan="7">
                            <input type="button" class="button" value="上传照片" id="EquipmentFile" onclick="btnUpdateFile();" />
                        </td>
                    </tr>
                </table>

                <div style="border: 1px solid #E7EAEC; border-top: none; background-color: #F8F8F8; text-align: center; padding: 6px 0px;">
                    生产厂家信息
                </div>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">生产厂家:</td>
                        <td class="TdContentSearch">
                            <input id="Manufacturers" name="Manufacturers" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">出厂编号:</td>
                        <td class="TdContentSearch">
                            <input id="ManufacturingNumber" name="ManufacturingNumber" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">产地:</td>
                        <td class="TdContentSearch">
                            <input id="PlaceOfOrigin" name="PlaceOfOrigin" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">出厂日期:</td>
                        <td class="TdContentSearch">
                            <input id="ManufacturingDate" name="ManufacturingDate" class="easyui-datebox" data-options="editable:false" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">质保期限（年）:</td>
                        <td class="TdContentSearch">
                            <input id="WarrantyPeriod" name="WarrantyPeriod" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">厂家联系人:</td>
                        <td class="TdContentSearch">
                            <input id="ManufacturersPerson" name="ManufacturersPerson" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">厂家联系电话:</td>
                        <td class="TdContentSearch">
                            <input id="ManufacturersTel" name="ManufacturersTel" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">厂家联系邮箱:</td>
                        <td class="TdContentSearch">
                            <input id="ManufacturersMailbox" name="ManufacturersMailbox" type="text" class="easyui-validatebox" /></td>
                    </tr>
                </table>

                <div style="border: 1px solid #E7EAEC; border-top: none; background-color: #F8F8F8; text-align: center; padding: 6px 0px;">
                    安装单位信息
                </div>
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">安装单位:</td>
                        <td class="TdContentSearch">
                            <input id="InstallCompany" name="InstallCompany" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">安装位置:</td>
                        <td class="TdContentSearch">
                            <input id="InstallPosition" name="InstallPosition" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">竣工验收日期:</td>
                        <td class="TdContentSearch">
                            <input id="CompletionDate" name="CompletionDate" class="easyui-datebox" data-options="editable:false" />
                        </td>
                        <td class="TdTitle">单位联系人:</td>
                        <td class="TdContentSearch">
                            <input id="CompletionPerson" name="CompletionPerson" type="text" class="easyui-validatebox" /></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">单位联系电话:</td>
                        <td class="TdContentSearch">
                            <input id="CompletionTel" name="CompletionTel" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">单位联系邮箱:</td>
                        <td class="TdContentSearch">
                            <input id="CompletionMailbox" name="CompletionMailbox" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">质保金结办情况:</td>
                        <td class="TdContentSearch">
                            <input id="SettlementQualityAssuranceFunds" name="SettlementQualityAssuranceFunds" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">质保金办结档案编号:</td>
                        <td class="TdContentSearch">
                            <input id="SettlementQualityAssuranceFundsFileNumber" name="SettlementQualityAssuranceFundsFileNumber" type="text" class="easyui-validatebox" /></td>
                    </tr>
                </table>

                <div class="HideData HideData" style="border: 1px solid #E7EAEC; border-top: none; background-color: #F8F8F8; text-align: center; padding: 6px 0px;">
                    设备主要参数
                </div>
                <table class="SearchTable HideData">

                    <tr>
                        <td class="TdTitle">输出功率（W）:</td>
                        <td class="TdContentSearch">
                            <input id="EPOutputPower" name="EPOutputPower" type="text" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">输入功率（W）:</td>
                        <td class="TdContentSearch">
                            <input id="EPInputPower" name="EPInputPower" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">几何尺寸:</td>
                        <td class="TdContentSearch">
                            <input id="EPPhysicalSize" name="EPPhysicalSize" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">能耗指标:</td>
                        <td class="TdContentSearch">
                            <input id="EPEnergyConsumption" name="EPEnergyConsumption" type="text" class="easyui-validatebox" /></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">其它:</td>
                        <td class="TdContentSearch" colspan="7">
                            <textarea id="EPRemark" name="EPRemark" style="width: 804px; height: 22px;"></textarea></td>
                    </tr>

                    <tr>
                        <td class="TdTitle">折旧率（%）:</td>
                        <td class="TdContentSearch">
                            <input id="RateOfDepreciation" name="RateOfDepreciation" type="text" class="easyui-numberbox" /></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">设备异动:</td>
                        <td class="TdContentSearch">
                            <input id="Statue" name="Statue" type="text" class="easyui-validatebox" value="启用" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">是否测量设备:</td>
                        <td class="TdContentSearch">
                            <select id="IsMeasureEquipment" name="IsMeasureEquipment" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:60" runat="server">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div class="HideData" style="border: 1px solid #E7EAEC; border-top: none; background-color: #F8F8F8; text-align: center; padding: 6px 0px;">
                    电机主要参数
                </div>
                <table class="SearchTable HideData">
                    <tr>
                        <td class="TdTitle">电机功率（W）:</td>
                        <td class="TdContentSearch">
                            <input id="EMPMotorPower" name="EMPMotorPower" type="text" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">额定电压（V）:</td>
                        <td class="TdContentSearch">
                            <input id="EMPKV" name="EMPKV" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">额定电流（A）:</td>
                        <td class="TdContentSearch">
                            <input id="EMPRatedCurrent" name="EMPRatedCurrent" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">产地:</td>
                        <td class="TdContentSearch">
                            <input id="EMPProductAddr" name="EMPProductAddr" type="text" class="easyui-validatebox" /></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">其它:</td>
                        <td class="TdContentSearch" colspan="7">
                            <textarea id="EMPRemark" name="EMPRemark" style="width: 804px; height: 22px;"></textarea></td>
                    </tr>
                </table>
                <div class="HideData" style="border: 1px solid #E7EAEC; border-top: none; background-color: #F8F8F8; text-align: center; padding: 6px 0px;">
                    控制柜主要参数
                </div>
                <table class="SearchTable HideData">
                    <tr>
                        <td class="TdTitle">几何尺寸:</td>
                        <td class="TdContentSearch">
                            <input id="CCPhysicalSize" name="CCPhysicalSize" type="text" class="easyui-validatebox" />
                        </td>
                        <td class="TdTitle">额定电压（V）:</td>
                        <td class="TdContentSearch">
                            <input id="CCKV" name="CCKV" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">额定电流（A）:</td>
                        <td class="TdContentSearch">
                            <input id="CCRatedCurrent" name="CCRatedCurrent" type="text" class="easyui-validatebox" /></td>
                        <td class="TdTitle">产地:</td>
                        <td class="TdContentSearch">
                            <input id="CCProductAddr" name="CCProductAddr" type="text" class="easyui-validatebox" /></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">其它:</td>
                        <td class="TdContentSearch" colspan="7">
                            <textarea id="CCRemark" name="CCRemark" style="width: 804px; height: 22px;"></textarea></td>
                    </tr>
                </table>
                <table class="SearchTable">
                    <tr style="height: 50px">
                        <td colspan="8" align="center">
                            <input type="button" class="button" value="保存" id="BtnSave" onclick="BtnSave_Click();" />
                            <input type="button" class="button" value="放弃返回" id="Button1" runat="server" onclick="BtnClose_Click();" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" name="room" refpage="EquipmentApprovalRecord" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">异动审批记录</a>
                </li>
                <%--<li class="" name="cust" refpage="EquipmentMaintenanceContract" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">设备维保合同</a>
                    </li>--%>
                <li class="" name="cust" refpage="EquipmentInspectionRecord" refsel="0"><a data-toggle="tab" href="#tab-3" aria-expanded="false">设备巡检记录</a>
                </li>
                <li class="" name="cust" refpage="EquipmentMaintenanceRecord" refsel="0"><a data-toggle="tab" href="#tab-4" aria-expanded="false">设备维保记录</a>
                </li>
                <li class="" name="cust" refpage="EquipmentIncidentSeach" refsel="0"><a data-toggle="tab" href="#tab-5" aria-expanded="false">设备维修记录</a>
                </li>
                <%--           <li class="" name="cust" refpage="EquipmentStatus" refsel="0"><a data-toggle="tab" href="#tab-6" aria-expanded="false">设备状态记录</a>
                </li>--%>
                <li class="" name="cust" refpage="EquipmentExternalMaintenance" refsel="0"><a data-toggle="tab" href="#tab-6" aria-expanded="false">外委维保记录</a>
                </li>
                <li class="" name="cust" refpage="EquipmentYearAssessmentRecord" refsel="0"><a data-toggle="tab" href="#tab-7" aria-expanded="false">年度评定记录</a>
                </li>
                <li class="" name="cust" refpage="EquipmentStatus" refsel="0"><a data-toggle="tab" href="#tab-8" aria-expanded="false">设备状态记录</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" style="padding: 0px; margin: 0px;">
                        <iframe id="EquipmentApprovalRecord" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <%--<div id="tab-2" class="tab-pane">
                        <!-- 设备维保合同 -->
                        <div class="panel-body" style="padding: 0px;">
                            <iframe id="EquipmentMaintenanceContract" style="width: 100%; border: none;" class="Frm"></iframe>
                        </div>
                    </div>--%>
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="EquipmentInspectionRecord" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="EquipmentMaintenanceRecord" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-5" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="EquipmentIncidentSeach" style="width: 100%; border: none;" class="Frm"></iframe>
                        <%--src="../IncidentNew/IncidentSeach.aspx"--%>
                    </div>
                </div>
                <div id="tab-6" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="EquipmentExternalMaintenance" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-7" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="EquipmentYearAssessmentRecord" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>
                <div id="tab-8" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <iframe id="EquipmentStatus" style="width: 100%; border: none;" class="Frm"></iframe>
                    </div>
                </div>

            </div>
        </div>

        <input type="hidden" name="EquipmentId" id="EquipmentId" value="" runat="server" />
        <input type="hidden" name="OpType" id="OpType" value="" runat="server" />
        <input type="hidden" name="changBS" id="changBS" value="" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="CopyId" name="CopyId" runat="server" />
        <input id="QrId" type="hidden" name="QrId" runat="server" />
        <input id="QRCodesPath" type="hidden" name="QRCodesPath" runat="server" />

        <script type="text/javascript">

            //初始化页面高度
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $('#layoutNorth').height(h * 4 / 9 + "px");
                $('.tabs-container').height(h * 5 / 9 - 2 + "px");
                var frmHeight = $('.tabs-container').height() - $('.nav-tabs').height();
                $(".Frm").css({ "height": frmHeight + "px" });
                $(".HideData").hide();  //隐藏 设备主要参数 电机主要参数  控制柜主要参数
            }


            //页面初始化
            $(function () {
                InitTableHeight();
                $(".tabs-container li").click(function () {
                    var refpage = $(this).attr("refpage");
                    var refsel = $(this).attr("refsel");
                    if (refsel == 0) {
                        $("#" + refpage).attr("src", refpage + ".aspx?Id=" + $("#EquipmentId").val() + "&OpType=" + $("#OpType").val() + "&changBS=" + $("#changBS").val() + "&CommID=" + $("#CommID").val());
                        $(this).attr("refsel", "1");
                    }
                });

                $("#EquipmentApprovalRecord").attr("src", "EquipmentApprovalRecord.aspx?Id=" + $("#EquipmentId").val() + "&changBS=" + $("#changBS").val() + "&OpType=" + $("#OpType").val() + "&CommID=" + $("#CommID").val());

                LoadPageData();
            });



            //上传文件
            function btnUpdateFile() {
                HDialog.OpenWin('600', '340', '../EquipmentNew/EquipmentUploadView.aspx?KeyId=' + $('#EquipmentId').val() + "&changBS=" + $("#changBS").val() + "&FileType=image", '设备照片', false, function callback(_Data) {
                });
            }

            //修改加载设备信息
            function LoadPageData() {
                if ($("#OpType").val() == 'edit') {
                    $.tool.DataGet('CsEquipment', 'GetEquipmentInformationById', "EquipmentId=" + $('#EquipmentId').val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                if (varObjects.length > 0) {
                                    $.JQForm._Data = _Data;
                                    $.JQForm.FillForm();
                                    $("#frmFrom").form('validate');
                                    //加载页面上 easyui 不能加载的值
                                    $('#IsMeasureEquipment').combobox("setValue", varObjects[0].IsMeasureEquipment);
                                    $('#EquipmentLevel').combobox("setValue", varObjects[0].EquipmentLevel);
                                    $('#MaintenanceStatus').combobox("setValue", varObjects[0].MaintenanceStatus);
                                    if (varObjects[0].RunDate != "") {
                                        $('#RunDate').datebox("setValue", formatDate(varObjects[0].RunDate, 'yyyy-MM-dd'));
                                    }
                                    if (varObjects[0].ManufacturingDate != "") {
                                        $('#ManufacturingDate').datebox("setValue", formatDate(varObjects[0].ManufacturingDate, 'yyyy-MM-dd'));
                                    }
                                    if (varObjects[0].CompletionDate != "") {
                                        $('#CompletionDate').datebox("setValue", formatDate(varObjects[0].CompletionDate, 'yyyy-MM-dd'));
                                    }
                                    $('#ServiceYear').numberbox("setValue", varObjects[0].ServiceYear);
                                    $('#ValueOfEquipment').numberbox("setValue", varObjects[0].ValueOfEquipment);
                                    $('#EpreciationAge').numberbox("setValue", varObjects[0].EpreciationAge);
                                    $('#RateOfDepreciation').numberbox("setValue", varObjects[0].RateOfDepreciation);
                                    //$('#EquipmentWeight').numberbox("setValue", varObjects[0].EquipmentWeight);


                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }
                    );
                }

                if ($("#OpType").val() == 'copy') {
                    $.tool.DataGet('CsEquipment', 'GetEquipmentInformationById', "EquipmentId=" + $('#CopyId').val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data != "") {
                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                if (varObjects.length > 0) {
                                    $.JQForm._Data = _Data;
                                    $.JQForm.FillForm();
                                    $("#frmFrom").form('validate');
                                    //加载页面上 easyui 不能加载的值
                                    $('#IsMeasureEquipment').combobox("setValue", varObjects[0].IsMeasureEquipment);
                                    $('#EquipmentLevel').combobox("setValue", varObjects[0].EquipmentLevel);
                                    $('#MaintenanceStatus').combobox("setValue", varObjects[0].MaintenanceStatus);
                                    if (varObjects[0].RunDate != "") {
                                        $('#RunDate').datebox("setValue", formatDate(varObjects[0].RunDate, 'yyyy-MM-dd'));
                                    }
                                    if (varObjects[0].ManufacturingDate != "") {
                                        $('#ManufacturingDate').datebox("setValue", formatDate(varObjects[0].ManufacturingDate, 'yyyy-MM-dd'));
                                    }
                                    if (varObjects[0].CompletionDate != "") {
                                        $('#CompletionDate').datebox("setValue", formatDate(varObjects[0].CompletionDate, 'yyyy-MM-dd'));
                                    }
                                    $('#ServiceYear').numberbox("setValue", varObjects[0].ServiceYear);
                                    $('#ValueOfEquipment').numberbox("setValue", varObjects[0].ValueOfEquipment);
                                    $('#EpreciationAge').numberbox("setValue", varObjects[0].EpreciationAge);
                                    $('#RateOfDepreciation').numberbox("setValue", varObjects[0].RateOfDepreciation);
                                    //$('#EquipmentWeight').numberbox("setValue", varObjects[0].EquipmentWeight);

                                    $("#EquipmentId").val(new GUID().newGUID());
                                    $("#EquipmentName").val('');
                                    $("#EquipmentNO").val('');
                                    $("#InstallPosition").val('');
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }
                    );
                }
                if ($("#changBS").val() == "view") {
                    //查看
                    $('#layoutNorth select,input,textarea').each(function () {
                        if ($(this).hasClass("easyui-datebox")) {
                            $(this).datebox({ disabled: true })
                        } else if ($(this).hasClass("easyui-combobox")) {
                            $(this).combobox({ disabled: true })
                        } else if ($(this).hasClass("easyui-numberbox")) {
                            $(this).numberbox({ disabled: true })
                        } else if ($(this).hasClass("easyui-validatebox")) {
                            $(this).validatebox({ required: false });
                            $(this).attr("disabled", "disabled");
                        } else {
                            $(this).attr("disabled", "disabled");
                        }
                    });
                    $('#BtnClose').removeAttr("disabled");
                    $('#EquipmentFile').removeAttr("disabled");
                    $('#BtnGetQrImg').removeAttr("disabled");
                }
            }

            //查看二维码
            function QrImages() {
                HDialog.OpenWin('500', '500', '../EquipmentNew/QrImg.aspx?KeyId=' + $('#EquipmentId').val() + "&CommName=" + $("#CommName").val() + "&EquipmentName=" + $("#EquipmentName").val(), '查看二维码', false, function callback(_Data) {
                });
            }
            //页面保存 
            function BtnSave_Click() {
                if ($('#frmFrom').form('validate')) {
                    $.tool.DataPostChk('frmFrom', 'CsEquipment', 'SaveEquipmentInformation', $('#frmFrom').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info("保存成功");
                                $("#OpType").val("edit");
                                var parameterStr = "?OpType=edit&changBS=edit&EquipmentId=" + $('#EquipmentId').val() + "&CommID=" + $('#CommID').val();
                                parent.window.location.href = '../EquipmentNew/EquipmentFromTabs.aspx' + parameterStr;
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
            //选择设备系统
            function SelRankSys() {
                HDialog.Open('600', '450', '../EquipmentNew/SelSystem.aspx', '选择设备系统', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split('|');
                        if (varObjects.length > 0) {
                            $("#SystemId").val(varObjects[0]);
                            $("#SystemName").val(varObjects[1]);
                            $("#RankId").val("");
                            $("#RankName").val("");
                            $("#SpaceId").val("");
                            $("#SpaceName").val("");
                        }
                    }
                });
            }

            //选择设备级别
            function SelRankLevel() {
                if ($('#SystemId').val() == "") {
                    HDialog.Info("请先选择设备系统");
                    return;
                }
                var parameterStr = "?SystemId=" + $('#SystemId').val();
                HDialog.OpenWin('500', '450', '../EquipmentNew/SelRankSingle.aspx' + parameterStr, '选择设备级别', false, function callback(_Data) {
                    if (_Data != "") {
                        var varObjects = _Data.split('|');
                        if (varObjects.length > 0) {
                            $("#RankId").val(varObjects[0]);
                            $("#RankName").val(varObjects[1]);
                        }
                    }
                });

            }

            //设备空间名称
            function SelSpace() {
                if ($('#SystemId').val() == "") {
                    HDialog.Info("请先选择设备系统");
                    return;
                }
                var parameterStr = "?SystemId=" + $('#SystemId').val() + "&CommId=" + $('#CommID').val();
                HDialog.OpenWin('500', '450', '../EquipmentNew/SelSpace.aspx' + parameterStr, '选择设备空间', false, function callback(_Data) {
                    if (_Data != "") {
                        var arrRet = JSON.parse(_Data);
                        $("#SpaceId").val(arrRet.SpaceId);
                        $("#SpaceName").val(arrRet.SpaceName);
                    }
                });
            }

            //选择责任部门
            function SelDep() {
                HDialog.Open('500', '500', '../EquipmentNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[2]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
            }
            //放弃返回
            function BtnClose_Click() {
                parent.DialogClose("");
            }
        </script>
    </form>

</body>
</html>
