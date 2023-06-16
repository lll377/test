<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganCommManage.aspx.cs" Inherits="M_Main.SysNew.OrganCommManage" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
            padding: 5px;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

            .Container ul {
                margin: 0px auto;
                clear: both;
            }

                .Container ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: center;
                    margin-bottom: 10px;
                    min-height: 22px;
                    line-height: 22px;
                    width: 100px;
                    text-align: right;
                }

                .Container ul .TextareaTitle {
                    list-style-type: none;
                    float: left;
                    text-align: right;
                    margin-bottom: 10px;
                    width: 80px;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 80%;
                }

                .Container ul .ContentBlank {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .Container ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                }

            .Container .Content textarea {
                width: 70%;
                height: 100px;
                overflow: scroll;
                resize: none;
                border: 1px solid #cccccc;
                padding-left: 2px;
            }

            .Container .Content input {
                width: 99%;
                border: 1px solid #cccccc;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content select {
                height: 22px;
            }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">
        <div class="Container">
            <ul>
                <li style="margin-left: 15px;" class="Content">
                    <font color="red">*鼠标右击左侧机构进行项目的增删改操作。</font>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">项目名称：</li>
                <li class="Content">
                    <input id="CommName" name="CommName" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul style="display: none;">
                <li class="InputTitle">项目类型：</li>
                <li class="Content">
                    <select id="CommType" name="CommType" runat="server" class="easyui-validatebox " data-options="required:true"></select>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">所属公司：</li>
                <li class="Content">
                    <select id="CorpRegionCode" name="CorpRegionCode" runat="server" class="easyui-validatebox " data-options="required:true"></select>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">项目业态：</li>
                <li class="Content">
                    <select id="CommKind" name="CommKind" runat="server" class="easyui-validatebox " data-options="required:true"></select>
                    <input type="hidden" runat="server" id="hiCommKind" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">项目来源：</li>
                <li class="Content">
                    <select id="CommSource" name="CommSource" runat="server" class="easyui-validatebox " data-options="required:true"></select>
                    <input type="hidden" runat="server" id="hiCommSource" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">接管时间：</li>
                <li class="ContentBlank">
                    <input id="ManageTime" name="ManageTime" runat="server" class="easyui-datebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">管理性质：</li>
                <li class="Content">
                    <select id="ManageKind" name="ManageKind" runat="server"></select>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">地址：</li>
                <li class="Content">
                    <input id="CommAddress" name="CommAddress" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">所在地区：</li>
                <li class="Content">
                    <select id="Province" name="Province" class="easyui-validatebox " data-options="required:true" runat="server">
                        <option value="">请选择</option>
                    </select><select id="City" name="City" class="easyui-validatebox " data-options="required:true" runat="server"><option value="">请选择</option>
                    </select><select id="Area" name="Area" class="easyui-validatebox " data-options="required:true" runat="server"><option value="">请选择</option>
                    </select>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">所在街道：</li>
                <li class="Content">
                    <input id="Street" name="Street" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">所在社区：</li>
                <li class="Content">
                    <input id="CommunityName" name="CommunityName" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">门牌号：</li>
                <li class="Content">
                    <input id="GateSign" name="GateSign" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">序号：</li>
                <li class="Content">
                    <input id="CommNum" name="CommNum" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul style="display: none;">
                <li class="InputTitle">CRM编码：</li>
                <li class="Content">
                    <input id="CRMCode" name="CRMCode" runat="server" class="easyui-validatebox">
                </li>
            </ul>

            <ul style="display: none;">
                <li class="InputTitle">车场品牌：</li>
                <li class="Content">
                    <input id="ParkingName" name="ParkingName" runat="server" class="easyui-validatebox ">
                </li>
            </ul>
            <ul style="display: none;">
                <li class="InputTitle">地产客服电话：</li>
                <li class="Content">
                    <input id="RealEstatePhone" name="RealEstatePhone" onchange="checkPhone();" runat="server" class="easyui-validatebox">
                </li>
            </ul>
            <ul style="display: none;">
                <li class="InputTitle">车场地址：</li>
                <li class="Content">
                    <%--<input id="ParkingURL" name="ParkingURL" runat="server" class="easyui-validatebox ">--%>
                    <textarea id="ParkingURL" name="ParkingURL" runat="server" style="width: 100%;" rows="5"></textarea>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">收费方式：</li>
                <li class="Content" style="width: auto">
                    <select id="ChargesMode" name="ChargesMode" class="easyui-validatebox " data-options="required:true" runat="server">
                        <option value="0" selected>本月收本月</option>
                        <option value="-1">本月收上月</option>
                    </select>
                </li>

            </ul>

            <ul style="display: none;">
                <li class="InputTitle" style="width: 140px">往年追缴率目标：</li>
                <li class="Content" style="width: auto">
                    <input id="RecoveryRate" name="RecoveryRate" style="width: 80px" runat="server">%
                </li>
                <li class="InputTitle" style="width: 140px">本年收费率目标：</li>
                <li class="Content" style="width: auto">
                    <input id="ChargeRate" name="ChargeRate" style="width: 80px" runat="server">%
                </li>
                <li class="InputTitle" style="width: 140px">本年追缴率目标：</li>
                <li class="Content" style="width: auto">
                    <input id="ArrearsRecoveryRate" name="ArrearsRecoveryRate" style="width: 80px" runat="server">%
                </li>
            </ul>

            <ul>
                <li class="Submit">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                </li>
            </ul>
        </div>
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <input type="hidden" id="OpType" name="OpType" value="edit" runat="server" />

        <input type="hidden" id="ProvinceName" name="ProvinceName" runat="server" />
        <input type="hidden" id="CityName" name="CityName" runat="server" />
        <input type="hidden" id="AreaName" name="AreaName" runat="server" />

        <script type="text/javascript">
            function checkPhone() {
                //var phone = document.getElementById('RealEstatePhone').value;
                //if (!(/^1[34578]\d{9}$/.test(phone))) {
                //    HDialog.Info("地产客服电话格式有误,请填写");
                //    return false;
                //}
                var value = document.getElementById("RealEstatePhone").value.trim();
                if (value == '' || value == undefined) return;
                var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
                var isMob = /^1[34578]\d{9}$/;///^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
                if (!(isMob.test(value) || isPhone.test(value))) {
                    HDialog.Info("地产客服电话格式有误,请填写");
                    return false;
                }
            }

            //省市区绑定联动
            $(function () {
                $("#Province").change(function () {
                    var selValue = $(this).val();
                    $("#City option:gt(0)").remove();
                    $("#Area option:gt(0)").remove();
                    $.each(city, function (k, p) {
                        if (p.ProID == selValue) {
                            var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
                            $("#City").append(option);
                        }
                    });
                });

                $("#City").change(function () {
                    var selValue = $(this).val();
                    $("#Area option:gt(0)").remove();
                    $.each(District, function (k, p) {
                        if (p.CityID == selValue) {
                            var option = "<option value='" + p.DisID + "'>" + p.DisName + "</option>";
                            $("#Area").append(option);
                        }
                    });
                });

                $("#CommKind").val($("#hiCommKind").val());
                $("#CommSource").val($("#hiCommSource").val());
            });
            //更新小区代码
            $("#BtnSave").click(function () {

                if ($("#OrganCode").val() == "") {
                    HDialog.Info("请在左侧选择项目所属机构");
                    return;
                }
                Update();
            });

            function Update() {
                $("#ProvinceName").val($("#Province").find("option:selected").text());
                $("#CityName").val($("#City").find("option:selected").text());
                $("#AreaName").val($("#Area").find("option:selected").text());
                $.tool.DataPostChk('frmForm', 'Organ', 'SaveComm', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.substring(0, 5) == "false") {
                            HDialog.Info(_Data.substring(6));
                        }
                        else {
                            $("#OpType").val("edit");
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                //parent.window.frames["OrganTree"].window.RefreshLeftTree(varObjects[0].OrganCode, varObjects[0].CommID);
                                parent.window.frames["OrganTree"].window.InitLeftTree(varObjects[0].OrganCode, varObjects[0].CommID);

                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            $("#frmForm").form('validate');

            var PubPId = '';
            var PubCityId = '';

            function InitCityList() {
                $.each(province, function (k, p) {
                    var option = "<option value='" + p.ProID + "'>" + p.ProName + "</option>";
                    $("#Province").append(option);
                });

                $.each(province, function (k, p) {
                    if (p.ProName == $("#Province").val()) {
                        PubPId = p.ProID;
                    }
                });

                $.each(city, function (k, p) {
                    if (p.CityName == $("#City").val()) {
                        PubCityId = p.CityID;
                    }
                });

                //初次加载城市列表
                $.each(city, function (k, p) {
                    if (p.ProID == PubPId) {
                        var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
                        $("#City").append(option);
                    }
                });

                //初次加载区域列表
                $.each(District, function (k, p) {
                    if (p.CityID == PubCityId) {
                        var option = "<option value='" + p.DisID + "'>" + p.DisName + "</option>";
                        $("#Area").append(option);
                    }
                });
            }

            InitCityList();
        </script>
    </form>
</body>
</html>
