<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesBrowse.aspx.cs" Inherits="M_Main.ChargesNew.FeesBrowse" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
</head>
<body style="margin: 0px; margin-top: 0px; overflow-y: auto">
    <form id="frmForm" runat="server">
        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 580px; height: 150px; padding: 10px;">
            <table id="tabtishi" cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red; display: none;'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、未设置结账日期时，不能入账往月费用；设置了结账日期时，结账前月份可以入账；
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、只有设置了计费标准、计费开始时间处于入账月份、物管费还必须设置交房状态、水电费还必须在入账月份有抄表记录，才可入账成功。
                    </td>
                </tr>
  <%--              <tr>
                    <td style='line-height: 20px'>3、不能入往月费用（水电气除外）,往月费用只能由公司财务人员在公司管理系统增删。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>4、只有当“计费开始时间”处于入账起止月区间内时，才可入账成功（水电气除外）。
                    </td>
                </tr>--%>
            </table>
        </div>

        <div style="background: #F4F4F4; height: 120px; width: 100% vertical-align: middle" id="TopDiv">

            <table width="100%">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" style="width: 80%;" name="CustName" searcher="SelCust" data-options="editable:false" runat="server" />
                        <input type="hidden" name="CustID" id="CustID" runat="server" />
                        <input type="hidden" name="CustType" id="CustType" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" style="width: 80%;" id="RoomSign" name="RoomSign" searcher="SelRoom" data-options="editable:false" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                </tr>
                <tr>

                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch" id="TdCostName">
                        <input class="easyui-searchbox" style="width: 80%;" id="CostName" name="CostName" searcher="SelCost" data-options="editable:false" runat="server" />
                        <input type="hidden" name="CostID" id="CostID" runat="server" />
                        <input type="hidden" name="Check" id="Check" runat="server" value="1" />
                        <input type="hidden" name="SysCostSign" id="SysCostSign" />
                    </td>
                    <td class="TdTitle">可选车位</td>
                    <td class="TdContentSearch">
                        <select class="easyui-combobox" style="width: 80%;" id="SelHandID" name="SelHandID" data-options="editable:false,panelHeight: 'auto'" runat="server">
                            <option selected></option>
                        </select>
                        <input type="hidden" name="HandID" id="HandID" runat="server" />
                    </td>
                    <td class="TdTitle"></td>
                    <td class="TdContent"></td>
                </tr>
                <tr id="TrCreYear">

                    <td class="TdTitle">入帐年月从</td>
                    <td class="TdContentSearch">
                        <select id="CreYear1" class="easyui-combobox" data-options="editable:false,panelHeight: '200'" style="width: 37%;" name="CreYear1" runat="server">
                            <option selected></option>
                        </select>年<select id="CreMonth1" class="easyui-combobox" data-options="editable:false,panelHeight: '200'" style="width: 34%;" name="CreMonth1" runat="server">
                            <option selected></option>
                        </select>月
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <select id="CreYear2" class="easyui-combobox" data-options="editable:false,panelHeight: '200'" style="width: 37%;" name="CreYear2" runat="server">
                            <option selected></option>
                        </select>年<select id="CreMonth2" class="easyui-combobox" data-options="editable:false,panelHeight: '200'" style="width: 34%;" name="CreMonth2" runat="server">
                            <option selected></option>
                        </select>月 &nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align: center;">
                        <input type="button" class="button" value="查询" id="btnSearch" name="btnSearch" />
                        <input type="button" class="button" value="入账" id="CheckBtn" name="CheckBtn" />
                        <input type="button" style="display: none" class="button" value="入账" id="btnSave" name="btnSave" onserverclick="btnSave_ServerClick" runat="server" />
                        <a href="#" style="border: 1px solid #95B8E7;" id="ins" class="easyui-linkbutton" iconcls="icon-help" plain="true" onclick=" JavaScript:TiShi(); ">备注</a>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <textarea id="TextResults" style="width: 100%; height: 150px; font-size: 12px" name="TextResults" rows="6" runat="server"></textarea>
                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #cccccc; border-top: 1px #95B8E7 solid" id="TableContainer">
        </div>
        <div style="width: 100%; background-color: #cccccc;" id="TableFeesContainer">
        </div>

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            $(document).ready(function () {
                if (GetQueryString("ShowType") == "1") {

                    $('body').pagewalkthrough({
                        name: 'introduction3',
                        steps: [{
                            wrapper: '#TdCostName',
                            popup: {
                                content: '<span style=\'font-size:30px\'>选择费用项目</span>',
                                type: 'tooltip',
                                position: 'bottom'
                            }
                        },
                        {
                            wrapper: '#TrCreYear',
                            popup: {
                                content: '<span style=\'font-size:30px\'>选择入账年月</span>',
                                type: 'tooltip',
                                position: 'bottom'
                            }
                        }, {
                            wrapper: '#btnSave',
                            popup: {
                                content: '<span style=\'font-size:30px\'>点击入账</span>',
                                type: 'tooltip',
                                position: 'bottom'
                            },
                            onLeave: function (e) {
                                if (e) {
                                    HDialog.Close()
                                }
                            }
                        }
                        ],
                        buttons: {
                            // ID of the button
                            jpwClose: {
                                // Translation string for the button
                                i18n: '关闭'
                                // Whether or not to show the button.  Can be a boolean value, or a
                                // function which returns a boolean value

                            },
                            jpwNext: {
                                i18n: '下一步 &rarr;'
                                // Function which resolves to a boolean

                            },
                            jpwPrevious: {
                                i18n: '&larr; 上一步'

                            },
                            jpwFinish: {
                                i18n: '结束 &#10004;'

                            }
                        },
                        onClose: function () {
                            HDialog.Close()
                        }
                    })

                    $('body').pagewalkthrough('show');
                }


                $("#CheckBtn").click(function () {
                    if ($("#CostID").val() == "") {
                        HDialog.Info("请选择费用项目!");
                        return;
                    }
                    //判断所选费用是否设置增值税率
                    $.tool.DataPost('TaxRateSetting', 'CheckNoSetTaxCost', 'CostIDs=' + $('#CostID').val(), function Init() {
                    },
                        function callback(_Data) {
                            if (_Data == "true") {
                                //物业类才进行判断
                                if ($("#SysCostSign").val() == "B0001") {
                                    $.post("/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=MarketingLoop&Command=CheckFeesBrowse", { "RoomID": $("#RoomID").val(), "CustTypeID": $("#CustType").val() }, function (data) {
                                        if (data == "false") {
                                            HDialog.Info("存在未确认空置房屋!");

                                        }
                                        else {
                                            $("#btnSave").click();
                                        }
                                    });
                                }
                                else {
                                    $("#btnSave").click();
                                }
                            }
                            else {
                                HDialog.Info(_Data);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });


                });

                if (GetQueryString("CustID") != null) {
                    SelParkName();
                    LoadShow($('#CustID').val());
                }


            })


            function SelCost() {
                var varReturn;
                $('#Check').val("0")
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");
                        var CostCodeAarry = varObjects[2].split(",");
                        var flag = true;
                        var SysCostSign = varObjects[3].split(",");
                        var IsSealed = varObjects[4].split(",");
                        $.each(SysCostSign, function (index, value) {
                            $("#SysCostSign").val(value);
                            if (value == "H0000") {
                                HDialog.Info('单户入账不能选择合同类费用');
                                flag = false;
                            }
                            if (value == "BK0001") {
                                HDialog.Info('单户入账不能选择办卡类费用');
                                flag = false;
                            }
                        });


                        $.each(IsSealed, function (index, value) {
                            if (value == "1") {
                                HDialog.Info('包含已封存的费项【' + varObjects[1].split(",")[index] + '】，请重新选择！！！');
                                $('#CostID').val('');
                                $('#CostName').searchbox('setValue', '');
                                flag = false;
                                return;
                            }
                        });
                        //if (CostCodeAarry.indexOf("0001") >= 0) {
                        //    $.each(CostCodeAarry, function (i, item) {
                        //        if (item != "0001") {
                        //            HDialog.Info("不能同时选择物业服务类费用和其它类费用!");
                        //            flag = false;
                        //            return;
                        //        }
                        //    })

                        //}



                        if (flag) {
                            $('#CostID').val(varObjects[0]);
                            $('#CostName').searchbox('setValue', varObjects[1]);
                            if (CostCodeAarry.indexOf("0001") >= 0 || CostCodeAarry.indexOf("0002") >= 0) {
                                $('#Check').val("1");
                            }

                            $.each(SysCostSign, function (index, value) {
                                if (value.indexOf("B") >= 0 || value.indexOf("S") >= 0 || value.indexOf("G") >= 0) {
                                    $('#Check').val("1");
                                }
                            });
                        }


                        return true;
                    }
                });

                return false;
            }

            function TiShi() {
                $('#tishi').parent().appendTo($("form:first"))
                $('#tishi').dialog('open');
                $("#tabtishi").show();
            }

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var w = $(window).width();
                var h = $(window).height();

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);

                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#CustType').val(data.CustTypeID);
                    SelParkName();

                    $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                        function Init() {
                        },
                        function callback(_Data) {

                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {

                                var RoomData = [];
                                for (var i = 0; i < varObjects.length; i++) {

                                    var vIsDelLive = varObjects[i].IsDelLive;
                                    var strTmp = "";

                                    if (vIsDelLive == 1) {
                                        strTmp = "(历史)";
                                    }
                                    var RoomID = varObjects[i].RoomID;
                                    var RoomSign = varObjects[i].RoomSign;
                                    var Buildarea = varObjects[i].BuildArea;

                                    var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                                }
                                $('#SelectRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    onChange: function (n, o) {


                                        var data = $('#SelectRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {

                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                    var buildArea = data[i].RoomID.split("|")[1];
                                                    $('#RoomID').val(data[i].RoomID.split("|")[0]);

                                                    SelParkName();
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });

                });


            }

            function LoadShow(CustID) {
                $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + CustID,
                    function Init() {
                    },
                    function callback(_Data) {

                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {

                            var RoomData = [];
                            for (var i = 0; i < varObjects.length; i++) {

                                var vIsDelLive = varObjects[i].IsDelLive;
                                var strTmp = "";

                                if (vIsDelLive == 1) {
                                    strTmp = "(历史)";
                                }
                                var RoomID = varObjects[i].RoomID;
                                var RoomSign = varObjects[i].RoomSign;
                                var Buildarea = varObjects[i].BuildArea;

                                var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                                RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                            }
                            $('#SelectRoomID').combobox({
                                data: RoomData,
                                valueField: 'RoomID',
                                textField: 'RoomText',
                                onChange: function (n, o) {


                                    var data = $('#SelectRoomID').combobox('getData');
                                    if (data.length > 0) {
                                        for (var i = 0; i < data.length; i++) {
                                            if (n == data[i].RoomID) {

                                                $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                                var buildArea = data[i].RoomID.split("|")[1];
                                                $('#RoomID').val(data[i].RoomID.split("|")[0]);

                                                SelParkName();
                                                break;
                                            }
                                        }
                                    }
                                }
                            });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                    $('#BuildArea').val(data.BuildArea);
                    $('#CalcArea').val(data.BuildArea);

                    SelParkName();
                });


            }


            function SelParkName() {

                var CustID = $('#CustID').val();
                var RoomID = $('#RoomID').val();

                //alert("CustID=" + CustID + "&RoomID=" + RoomID);

                $('#HandID').val('');

                $.tool.DataGet('Choose', 'ChooseParkingHand', "CustID=" + CustID + "&RoomID=" + RoomID,
                    function Init() {
                    },
                    function callback(_Data) {

                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {

                            var ParkingData = [];

                            ParkingData.push({ "ParkText": "", "HandID": "" });
                            for (var i = 0; i < varObjects.length; i++) {

                                var vIsDelete = varObjects[i].IsDelete;
                                var strTmp = "";

                                if (vIsDelete == 1) {
                                    strTmp = "(历史)";
                                }

                                var HandID = varObjects[i].HandID;
                                var CarSign = varObjects[i].CarSign;
                                var ParkName = varObjects[i].ParkName;

                                if (CarSign == null || CarSign == "null") {
                                    CarSign = '';
                                }

                                var ParkText = CarSign + "(" + ParkName + ")" + strTmp;
                                ParkingData.push({ "ParkText": ParkText, "HandID": HandID });

                            }
                            $('#SelHandID').combobox({
                                data: ParkingData,
                                valueField: 'HandID',
                                textField: 'ParkText',
                                onChange: function (n, o) {
                                    var data = $('#SelHandID').combobox('getData');
                                    if (data.length > 0) {
                                        for (var i = 0; i < data.length; i++) {
                                            if (n == data[i].HandID) {

                                                $('#HandID').val(data[i].HandID);
                                                break;
                                            }
                                        }
                                    }
                                }
                            });
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });


            }

            var CostStancolumn = [[

                { field: 'IID', title: 'IID', width: 10, align: 'left', sortable: true, hidden: true },
                { field: 'CustID', title: 'CustID', width: 10, align: 'left', sortable: true, hidden: true },
                { field: 'RoomID', title: 'RoomID', width: 10, align: 'left', sortable: true, hidden: true },
                { field: 'CostID', title: 'CostID', width: 10, align: 'left', sortable: true, hidden: true },

                { field: 'CustName', title: '客户名称', width: 160, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 130, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 130, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                { field: 'StanName', title: '标准名称', width: 180, align: 'left', sortable: true },
                { field: 'StanFormulaName', title: '计算方式', width: 180, align: 'left', sortable: true },

                { field: 'StanAmount', title: '通用收费标准', width: 100, align: 'left', sortable: true },

                { field: 'StanExplain', title: '标准说明', width: 180, align: 'left', sortable: true },

                { field: 'ChargeCycleName', title: '计费周期', width: 100, align: 'left', sortable: true },
                {
                    field: 'CalcBeginDate', title: '计费开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.CalcBeginDate, "yyyy-MM-dd");
                        return str;
                    }
                }

            ]];

            var Feescolumn = [[
                { field: 'CustName', title: '客户名称', width: 160, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 130, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 130, align: 'left', sortable: true },
                { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

                { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
                },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
                { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
                { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
                { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },

            ]];

            function InitTableHeight() {
                var h = $(window).height();

                var h1 = (h - 100) / 2;

                $("#TableContainer").css("height", h1-40 + 'px');
                $("#TableFeesContainer").css("height", h1 + 'px');

                $('#SelectRoomID').combobox({
                    width: '80%'
                });

            }
            InitTableHeight();

            //指定列求和
            function compute(colName) {
                var rows = $('#TableFeesContainer').datagrid('getRows');
                var total = 0;
                for (var i = 0; i < rows.length; i++) {
                    total += parseFloat(rows[i][colName]);
                }
                return ToDecimal(total, 2);
            }

            $(".textbox-text validatebox-text textbox-prompt").each(function () {

                $(this).attr('disabled', true);
            });


            function LoadCostStanList() {
                var CustID = $('#CustID').val();
                var RoomID = $('#RoomID').val();
                var CostID = $('#CostID').val();
                var HandID = $('#HandID').val();

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CostStanSetting&Command=Custsearch&CustID=' + CustID + '&RoomID=' + RoomID + '&CostID=' + CostID + '&HandID=' + HandID,
                    method: "Get",
                    nowrap: false,
                    title: '收费标准',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: CostStancolumn,
                    //frozenColumns: CostStanfrozenColumns,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: false,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: true,
                    width: "100%",

                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                    }
                });
                LoadFeesList();

            }

            function LoadFeesList() {
                var CustID = $('#CustID').val();
                var RoomID = $('#RoomID').val();
                var CostID = $('#CostID').val();
                var HandID = $('#HandID').val();

                $("#TableFeesContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Fees&Command=onecustfees&CustID=' + CustID + '&RoomID=' + RoomID + '&CostID=' + CostID + '&HandID=' + HandID,
                    method: "Get",
                    nowrap: false,
                    title: '未收取的费用',
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: Feescolumn,
                    //frozenColumns: CostStanfrozenColumns,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: false,
                    width: "100%",
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    width: "100%",
                    sortOrder: "asc",
                    rowStyler: function (index, row) {
                        if (row.FeesID == 'footer') {
                            return 'background-color:#F4F4F4;border:none;'; // return inline style
                        }

                    },
                    onLoadSuccess: function (data) {
                        //加载页脚
                        $('#TableFeesContainer').datagrid('reloadFooter', [
                            {
                                FeesID: 'footer',
                                RoomSign: "<span style='color:red'>合计</span>",
                                DueAmount: "<span style='color:red'>" + compute("DueAmount") + "</span>",
                                PaidAmount: "<span style='color:red'>" + compute("PaidAmount") + "</span>",
                                PrecAmount: "<span style='color:red'>" + compute("PrecAmount") + "</span>",
                                WaivAmount: "<span style='color:red'>" + compute("WaivAmount") + "</span>",
                                RefundAmount: "<span style='color:red'>" + compute("RefundAmount") + "</span>",
                                DebtsAmount: "<span style='color:red'>" + compute("DebtsAmount") + "</span>"
                            }
                        ]);
                    }
                });

            }

            LoadCostStanList();


            $("#btnSearch").click(function () {

                LoadCostStanList();
            });

            function SetDivTop() {
                $("#TopDiv").css("height", 250 + 'px');
            }

        </script>
    </form>
</body>
</html>
