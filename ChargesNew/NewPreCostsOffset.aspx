<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPreCostsOffset.aspx.cs" Inherits="M_Main.ChargesNew.NewPreCostsOffset" %>

<!DOCTYPE html>
<html>
<head>
    <title>批量入账</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap.min.css" />
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="../Jscript-Ui/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" />
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="../Jscript-Ui/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/PersonDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
</head>
<body style="padding-left: 2px; padding-right: 2px; margin: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
        <input type="hidden" name="PcoGuid" id="PcoGuid" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div style="height: 10px;"></div>

        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 620px; height: 170px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>批量冲抵规则：第一步：自动检测冲抵月份是否存在欠费。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>第二步：自动检测是否存在预存余额。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>第三步：自动检测预存余额是否可以冲抵对应欠费。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>第四步：自动检测预存余额是否大于等于欠费（不足不冲，待客户前来缴费时先冲余额后收欠费）。
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style='line-height: 20px'>第五步：批量冲抵检测通过的客户欠费。
                    </td>
                </tr>
            </table>
        </div>

        <div class="panel panel-primary" style="width: 60%; margin: 0px auto; text-align: center; height: 330px;">
            <div class="panel-heading">预交冲抵</div>
            <div class="panel-body" style="text-align: left; height: 292px;">

                <table class="DialogTable">
                    <tr>
                        <td colspan="4" style="height: 5px"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">楼宇</td>
                        <td class="TdContentSearch" id="ones">
                            <input id="BuildNames" class="easyui-searchbox" style="width: 62%;" data-options="editable:false"
                                name="BuildNames" searcher="SelBuild" runat="server" /><input id="hiBuildNames" type="hidden"
                                    name="hiBuildNames" runat="server" /><input id="BuildSNums" type="hidden"
                                        name="BuildSNums" runat="server" />
                        </td>
                        <td class="TdTitle">客户类别</td>
                        <td class="TdContent">
                            <select id="CustTypeID" name="CustTypeID" style="width: 62%;" runat="server">
                                <option selected></option>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px"></td>
                    </tr>
                    <tr>

                        <td class="TdTitle">费用项目</td>
                        <td class="TdContentSearch">
                            <input class="easyui-searchbox" id="CostNames" style="width: 62%;" maxlength="50" name="CostNames" searcher="SelCost" data-options="editable:false" runat="server" />
                            <input type="hidden" name="CostIDs" id="CostIDs" runat="server" />
                        </td>
                        <td class="TdTitle">客户名称</td>
                        <td>
                            <input class="easyui-searchbox" id="CustName" style="width: 62%;" data-options="editable:false" name="CustName" searcher="SelCust" runat="server" />
                            <input type="hidden" name="CustID" id="CustID" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">房屋编号</td>
                        <td class="TdContentSearch">
                            <input class="easyui-searchbox" id="RoomSign" style="width: 62%;" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                            <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                        </td>
                        <td class="TdTitle">房屋名称</td>
                        <td class="TdContentSearch">
                            <input class="easyui-searchbox" id="RoomName" style="width: 62%;" data-options="editable:false" name="RoomName" searcher="SelRoom" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">车位编号 </td>
                        <td class="TdContentSearch">
                            <input id="ParkName" class="easyui-searchbox" style="width: 62%;" data-options="editable:false" searcher="SelPark"
                                name="ParkName" runat="server">
                            <input type="hidden" id="HandID" />
                        </td>
                        <td class="TdTitle">可选房号</td>
                        <td class="TdContentSearch">
                            <select id="SelectRoomID" class="easyui-combobox" name="SelectRoomID" data-options="editable:false,panelHeight: '100px'" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                                <option selected></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">费用年月</td>
                        <td class="TdContent">
                            <select id="CreYear1" name="CreYear1" runat="server">
                                <option selected></option>
                            </select>年<select id="CreMonth1" name="CreMonth1" runat="server">
                                <option selected></option>
                            </select>月
                        </td>
                        <td class="TdTitle">到</td>
                        <td class="TdContent">
                            <select id="CreYear2" name="CreYear2" runat="server">
                                <option selected></option>
                            </select>年
                            <select id="CreMonth2" name="CreMonth2" runat="server">
                                <option selected></option>
                            </select>月
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 13px" align="left" colspan="4">
                            <asp:Label ID="lbHint" runat="server" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                </table>

                <br />
                <hr />
                <div style="width: 100%; margin: 0px auto; text-align: center;">
                    <button type="button" class="btn btn-default btn-lg" id="btnOffset" name="btnOffset" onclick="DealData();">
                        <span class="glyphicon" aria-hidden="true"></span>冲抵                  
                    </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-default btn-lg" id="clare" name="btnDown">
                         <span class="glyphicon" aria-hidden="true"></span>清空
                     </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-default btn-lg" id="inputExcel" name="btnDown">
                        <span class="glyphicon" aria-hidden="true"></span>下载待审核明细
                    </button>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <a href="#" style="border: 1px solid #95B8E7; width: 70px; height: 40px;" id="ins" class="easyui-linkbutton" iconcls="icon-help" plain="true" onclick=" JavaScript:TiShi(); ">备注</a>
                </div>
            </div>
        </div>
        <br />
        <div class="progress" style="margin-bottom: 3px;">
            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="2" style="width: 0%;" id="ProgressBar">
            </div>
        </div>
        <input id="isOffset" type="hidden" name="isOffset" value="0" />

        <script type="text/javascript">
            $("select").each(function () {

                if ($(this).attr("name").substring(0, 3) != "Cre") {
                    $(this).css("width", document.body.clientWidth * 0.17 * 0.82);
                }
                else {
                    $(this).css("width", document.body.clientWidth * 0.17 * 0.41);
                }

            });

            function TiShi() {
                $('#tishi').parent().appendTo($("form:first"))
                $('#tishi').dialog('open');
            }

            //清空
            $("#clare").click(function () {

                $('#BuildSNums').val('');
                $('#CustTypeID').val('');
                $('#CostNames').searchbox("setValue", "");
                $('#CostIDs').val("");

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomName').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                $('#ParkName').searchbox("setValue", '');
                $("#HandID").val('');

            });

            //下载待审核明细
            $("#inputExcel").click(function () {
                window.location.href = '../Charges/AuditingPreDetailCreExcel.aspx?PcoGuid=' + $('#PcoGuid').val();
            });

            $('#isOffset').val('-1');
            //  $('#btnDown').attr("disabled", "disabled");

            function SelCost() {
                var varReturn;
                $('#Check').val("0")
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新

                        var varObjects = _Data.split("\t");
                        //var CostCodeAarry = varObjects[2].split(",");

                        //var SysCostSign = varObjects[3].split(",");
                        var IsSealed = varObjects[4].split(",");
                        var flag = true;

                        $.each(IsSealed, function (index, value) {
                            if (value == "1") {
                                HDialog.Info('包含已封存的费项【' + varObjects[1].split(",")[index] + '】，请重新选择！！！');
                                $('#CostIDs').val('');
                                $('#CostNames').searchbox('setValue', '');
                                flag = false;
                                return;
                            }
                        });


                        if (flag) {
                            $('#CostIDs').val(varObjects[0]);
                            $('#CostNames').searchbox('setValue', varObjects[1]);
                        }

                    }
                });

            }


            function SelBuild() {
                var varReturn;

                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildSNums = "";
                        var BuildNames = "";
                        $('#BuildSNums').val(BuildSNums);
                        $('#BuildNames').searchbox('setValue', BuildNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                        $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));
                    }
                });

            }


            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomName').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/CustDlg.aspx";

                HDialog.Open('800', '400', conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);

                    $('#CustID').val(data.CustID);


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
                                    RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

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
                                                    $('#RoomID').val(data[i].RoomID);
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

            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomName').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";
                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var data = JSON.parse(_Data);
                        $('#RoomSign').searchbox("setValue", data.RoomSign);
                        $('#RoomName').searchbox("setValue", data.RoomName);
                        $('#CustName').searchbox("setValue", data.CustName);
                        $('#CustID').val(data.CustID);
                        $('#RoomID').val(data.RoomID);
                    }

                });

            }

            function SelPark() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomName').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#ParkName').searchbox("setValue", '');
                $("#HandID").val('');
                HDialog.Open('700', '400', "../dialogNew/ParkingHandDlg.aspx", '车位选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新
                        var obj = JSON.parse(_Data);
                        console.log(obj);
                        $('#ParkName').searchbox("setValue", obj.ParkName);
                        $("#HandID").val(obj.ParkID);

                        $('#CustName').searchbox("setValue", obj.CustName);
                        $('#CustID').val(obj.CustID);
                        $('#RoomSign').searchbox("setValue", obj.RoomSign);
                        $('#RoomID').val(obj.RoomID);

                    }
                });

            }


            var ProgressInterval;

            function DealData() {

                var mHint = $('#lbHint').val();
                if (mHint != "") {
                    HDialog.Info(mHint);
                }
                else {
                    //启动任务
                    StartTask();
                }


            }


            function StartTask() {
                var Pguid = Guid();
                $("#PcoGuid").val(Pguid);
                //启动一个任务
                $('#isOffset').val('1');
                $.tool.DataPostNoLoading('OffsetPreCosts', 'StartTask', $('#FrmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            //展示进度
                            ShowProgress();
                            //获取执行情况进度
                            ProgressInterval = setInterval("TakeProgress()", 1000);

                        } else {
                            var message = _Data.split("|")[1];
                            HDialog.Info(message)
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });


            }

            ////展示进度
            //ShowProgress();
            ////获取执行情况进度
            //ProgressInterval = setInterval("TakeProgress()", 1000);

            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('OffsetPreCosts', 'TakeProgress', $('#FrmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);

                        if (_Data == '[]') {

                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);

                            if (Obj[0].Curr == '100') {

                                CloseProgress();

                                if (Obj[0].IsComplete == '0') {
                                    if ($('#isOffset').val() == '1') {
                                        HDialog.Info('冲抵成功!');
                                        $('#isOffset').val('-1');
                                    }
                                }
                            }
                            else {
                                $('#isOffset').val('1');
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }

            function Guid() {
                var s = [];
                var hexDigits = "0123456789abcdef";
                for (var i = 0; i < 36; i++) {
                    s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
                }
                s[14] = "4";  
                s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  
                s[8] = s[13] = s[18] = s[23] = "-";

                var guid = s.join("");
                return guid;
            }
        </script>
    </form>
</body>
</html>
