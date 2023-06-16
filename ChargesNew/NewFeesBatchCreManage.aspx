<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewFeesBatchCreManage.aspx.cs" Inherits="M_Main.ChargesNew.NewFeesBatchCreManage" %>

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

        <div id="walkthrough-content" style="display: none;">
            <div id="walkthrough-1">
                <h3>应收管理-批量入账操作介绍<br />
                    点击下一步继续教程</h3>
            </div>

            <div id="walkthrough-2">
                点击选择楼宇
            </div>

            <div id="walkthrough-3">
                点击选择费用项目
            </div>

            <div id="walkthrough-4">
                点击选择客户类别
            </div>

            <div id="walkthrough-5">
                点击选择入账年月
            </div>
            <div id="walkthrough-6">
                点击入账按钮完成批量入账操作
            </div>
        </div>
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 75px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>

        <div style="height: 10px;"></div>
        <div class="panel panel-primary" style="width: 60%; margin: 0px auto; text-align: center; height: 350px;">
            <div class="panel-heading">批量入账</div>
            <div class="panel-body" style="text-align: left; height: 320px;">

                <table class="DialogTable">
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">组团区域</td>
                        <td class="TdContentSearch">
                            <input class="easyui-searchbox" id="RegionNames" maxlength="50" name="RegionNames" searcher="SelRegion" data-options="editable:false" runat="server" />
                            <input type="hidden" name="RegionsNums" id="RegionsNums" runat="server" />
                        </td>
                        <td class="TdTitle">客户类别</td>
                        <td class="TdContent" id="threes">
                            <select id="CustTypeID" name="CustTypeID" runat="server">
                                <option selected></option>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">楼宇</td>
                        <td class="TdContentSearch" id="ones">
                            <input id="BuildNames" class="easyui-searchbox" data-options="editable:false"
                                name="BuildNames" searcher="SelBuild" runat="server" /><input id="hiBuildNames" type="hidden"
                                    name="hiBuildNames" runat="server" /><input id="BuildSNums" type="hidden"
                                        name="BuildSNums" runat="server" />
                        </td>
                        <td class="TdTitle">费用项目</td>
                        <td class="TdContentSearch" id="twos">
                            <input class="easyui-searchbox" id="CostName" maxlength="50" name="CostName" searcher="SelCost" data-options="editable:false" runat="server" />
                            <input type="hidden" name="CostID" id="CostID" runat="server" />
                            <input type="hidden" name="Check" id="Check" runat="server" value="1" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 12px"></td>
                    </tr>
                    <tr>
                        <td class="TdTitle">入帐年月</td>
                        <td class="TdContent" id="fours">
                            <select id="CreYear1" name="CreYear1" runat="server">
                                <option selected></option>
                            </select>年<select id="CreMonth1" name="CreMonth1" runat="server">
                                <option selected></option>
                            </select>月
                        </td>
                        <td class="TdTitle">到</td>
                        <td class="TdContent">
                            <select id="andYear" name="andYear" runat="server">
                                <option selected></option>
                            </select>年
                            <select id="andMonth" name="andMonth" runat="server">
                                <option selected></option>
                            </select>月
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 24px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="color:red"><div style="width:80%;margin:0px auto">备注：<br />1、未设置结账日期时，不能入账往月费用；设置了结账日期时，结账前月份可以入账；<br />2、只有设置了计费标准、计费开始时间处于入账月份、物管费还必须设置交房状态、水电费还必须在入账月份有抄表记录，才可入账成功。</div> </td>
                    </tr>
                </table>

                <br />
                <hr />
                <div style="width: 100%; margin: 0px auto; text-align: center;">
                    <button type="button" class="btn btn-default btn-lg" id="btnSave" name="btnSave" onclick="DealData();">
                        <span class="glyphicon" aria-hidden="true"></span>入账                       
                    </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-default btn-lg" id="btnDown" name="btnDown" runat="server" onserverclick="btnDown_ServerClick">
                         <span class="glyphicon" aria-hidden="true"></span>下载结果文件                        
                     </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-default btn-lg" id="btnAuditing" name="btnAuditing" runat="server" onserverclick="btnDownAuditing_ServerClick">
                         <span class="glyphicon" aria-hidden="true"></span>下载待审核明细                        
                     </button>
                    <br />

                </div>
            </div>
        </div>
        <br />
        <div class="progress" style="margin-bottom: 3px;">
            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="2" style="width: 0%;" id="ProgressBar">
            </div>
        </div>
        <input id="isFeesCre" type="hidden" name="isFeesCre" value="0" />

        <script type="text/javascript">

            $('#isFeesCre').val('-1');
            //  $('#btnDown').attr("disabled", "disabled");

            function SelCost() {
                var varReturn;
                $('#Check').val("0")
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx", '收费项目选择', false, function callback(_Data) {

                    if (_Data != "") {//**获得返回 刷新

                        var varObjects = _Data.split("\t");
                        var CostCodeAarry = varObjects[2].split(",");

                        var SysCostSign = varObjects[3].split(",");
                        var IsSealed = varObjects[4].split(",");
                        var flag = true;
                        $.each(SysCostSign, function (index, value) {
                            if (value == "H0000") {
                                HDialog.Info('批量入账不能选择合同类费用');
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

                            if (CostCodeAarry.indexOf("0015") >= 0) {
                                $('#Check').val("3");
                            }

                            if (CostCodeAarry.indexOf("0001") >= 0) {
                                $('#Check').val("1");
                            }

                            $.each(SysCostSign, function (index, value) {
                                if (value.indexOf("B") >= 0 || value.indexOf("G") >= 0) {
                                    $('#Check').val("1");
                                }
                                else if (value.indexOf("S") >= 0) {
                                    $('#Check').val("3");
                                }
                            });
                        }

                    }
                });

            }

            function SelRegion() {
                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx", '组团区域选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        console.log(varObjects)
                        var RegionsNums = "";
                        var RegionNames = "";

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[2];
                                var d2 = varObjects[i].split(",")[1];

                                RegionsNums = RegionsNums + "," + varObjects[i].split(',')[2];
                                RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#RegionsNums').val(RegionsNums.substring(1, RegionsNums.length));
                        $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));
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


            var ProgressInterval;

            function DealData() {

                $.post("/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=MarketingLoop&Command=CheckMarketingLoop", function (data) {
                    if (data == "true") {
                        //启动任务
                        StartTask();
                    } else {
                        HDialog.Info("存在未确认空置房屋!");
                    }

                });
            }


            function StartTask() {
                if ($("#CostName").searchbox("getValue") == "") {
                    HDialog.Info("请选择费用项目!");
                    return;
                }
                //判断所选费用是否设置增值税率
                $.tool.DataPostNoLoading('TaxRateSetting', 'CheckNoSetTaxCost', 'CostIDs=' + $('#CostID').val(), function Init() {
                },
                    function callback(_Data) {
                        if (_Data == "true") {
                            //启动一个任务
                            $('#isFeesCre').val('1');
                            $.tool.DataPostNoLoading('FeesBatchCre', 'StartTask', $('#FrmForm').serialize(),
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
                                        // HDialog.Info("入账年月已结账，无法批量入账!");
                                        HDialog.Info(message)
                                    }

                                },
                                function completeCallback() {
                                },
                                function errorCallback() {
                                });
                        }
                        else {
                            HDialog.Info(_Data);
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
                $.tool.DataPostNoLoading('FeesBatchCre', 'TakeProgress', $('#FrmForm').serialize(),
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
                                    if ($('#isFeesCre').val() == '1') {
                                        HDialog.Info('入账成功!');
                                        $('#isFeesCre').val('-1');
                                    }
                                }
                            }
                            else {
                                $('#isFeesCre').val('1');
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



            function GetShow() {
                $('body').pagewalkthrough({
                    name: 'introduction',
                    steps: [{
                        popup: {
                            content: '#walkthrough-1',
                            type: 'modal'
                        }
                    }, {
                        wrapper: '#ones',
                        popup: {
                            content: '#walkthrough-2',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#twos',
                        popup: {
                            content: '#walkthrough-3',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#threes',
                        popup: {
                            content: '#walkthrough-4',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#fours',
                        popup: {
                            content: '#walkthrough-5',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }, {
                        wrapper: '#btnSave',
                        popup: {
                            content: '#walkthrough-6',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    }
                    ],
                    buttons: {
                        jpwNext: {
                            i18n: "下一步 &rarr;"
                        },
                        jpwFinish: {
                            i18n: "结束指引 &#10004;",
                        },
                        jpwPrevious: {
                            i18n: "&larr; 上一步"
                        },
                        jpwClose: {
                            i18n: "关闭",
                        }
                    }
                });
                $('body').pagewalkthrough('show');
            };
        </script>
    </form>
</body>
</html>
