<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaxRateSettingAdd.aspx.cs" Inherits="M_Main.ChargesNew.TaxRateSettingAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>


    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/CostDictionaryCanNull.js"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../jscript/PersonDictionaryCanNull.js" type="text/javascript"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>

    <script src="../jscript/Cache.js"></script>
    <title></title>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            background-color: #ffffff;
            padding: 5px;
        }

        .Container {
            width: 100%;
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
                    width: 25%;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 60%;
                }

                .Container ul .Title {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 100%;
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

            .Container .Content input {
                width: 85%;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content textarea {
                width: 85%;
                height: 66px;
                padding-left: 2px;
                resize: none;
            }

            .Container .Content select {
                height: 22px;
            }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <div class="Container">
            <ul>
                <li class="InputTitle">项目名称：</li>
                <li class="Content">
                    <input id="CommName" name="CommName" class="easyui-validatebox" style="border: 1px solid #cccccc;" disabled="disabled" runat="server" />
                    <input id="CommID" name="CommID" type="hidden" runat="server" />
                </li>
                <li class="InputTitle">费用科目：</li>
                <li class="Content">
                    <textarea id="CostName" name="CostName" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" onclick="SelCost();"></textarea>
                    <input id="CorpCostID" name="CorpCostID" value="" type="hidden" />
                </li>
                <li class="InputTitle">纳税人规模：</li>
                <li class="Content">
                    <select id="TaxpayerScale" name="TaxpayerScale" style="border: 1px solid #cccccc;" runat="server" data-options="required:true">
                        <option value=""></option>
                        <option value="一般纳税人">一般纳税人</option>
                        <option value="小规模纳税人">小规模纳税人</option>
                    </select>
                </li>
                <li class="InputTitle">税率：</li>
                <li class="Content">
                    <select id="TaxRate" name="TaxRate" ordinarydictionary="true" tbname="AddedTaxRate" bindid="DictionarySign" bindname="DictionaryName" style="border: 1px solid #cccccc;" runat="server" data-options="required:true">
                    </select>
                    <%--<input id="TaxRate" name="TaxRate" type="text" style="border: 1px solid #cccccc;" data-options="required:true" onkeyup="value=value.replace(/[^\d.]/g,'')" />--%>
                </li>

                <li class="InputTitle">开始时间：</li>
                <li class="Content">
                    <input id="StartDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default', minDate: '%y-%M-01' })" format="date"
                        name="StartDate" style="border: 1px solid #cccccc;" onchange="StartDateChange();" />


                </li>

                <li class="InputTitle">结束时间：</li>
                <li class="Content">
                    <input id="EndDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', skin: 'default' })" format="date" name="EndDate" style="border: 1px solid #cccccc;" />
                </li>

                <li class="InputTitle">是否需要不动产备案：</li>
                <li class="Content">
                    <input type="checkbox" id="CheckRecorded" name="CheckRecorded" style="border: none; width: 15px;" />
                </li>

                <li class="InputTitle" id="Li1" style="display: none;">已备案税率：</li>
                <li class="Content" id="Li2" style="display: none;">
                    <select id="RecordedTaxRate" name="RecordedTaxRate" ordinarydictionary="true" tbname="AddedTaxRate" bindid="DictionarySign" bindname="DictionaryName" style="border: 1px solid #cccccc;" runat="server" data-options="required:true">
                    </select>
                    <%--<input id="RecordedTaxRate" name="RecordedTaxRate" type="text" style="border: 1px solid #cccccc;" onkeyup="value=value.replace(/[^\d.]/g,'')" />--%>
                </li>

                <li class="InputTitle" id="Li3" style="display: none;">未备案税率：</li>
                <li class="Content" id="Li4" style="display: none;">
                    <select id="UnrecordedTaxRate" name="UnrecordedTaxRate" ordinarydictionary="true" tbname="AddedTaxRate" bindid="DictionarySign" bindname="DictionaryName" style="border: 1px solid #cccccc;" runat="server" data-options="required:true">
                    </select>
                    <%--<input id="UnrecordedTaxRate" name="UnrecordedTaxRate" type="text" style="border: 1px solid #cccccc;" onkeyup="value=value.replace(/[^\d.]/g,'')" />--%>
                </li>

                <li class="InputTitle">是否需要合同违约金税率：</li>
                <li class="Content">
                    <input type="checkbox" id="CheckContractPenalty" name="CheckContractPenalty" style="border: none; width: 15px;" />
                </li>

                <li class="InputTitle" id="Li5" style="display: none;">合同违约金税率：</li>
                <li class="Content" id="Li6" style="display: none;">
                    <select id="ContractPenaltyRate" name="ContractPenaltyRate" ordinarydictionary="true" tbname="AddedTaxRate" bindid="DictionarySign" bindname="DictionaryName" style="border: 1px solid #cccccc;" runat="server" data-options="required:true">
                    </select>
                    <%--<input id="ContractPenaltyRate" name="ContractPenaltyRate" type="text" style="border: 1px solid #cccccc;" onkeyup="value=value.replace(/[^\d.]/g,'')" />--%>
                </li>

                <li class="Title">
                    <table style="margin: auto;">
                        <tr>
                            <td style="height: 25px;"></td>
                            <td style="height: 25px; line-height: 25px;"></td>
                            <td>
                                <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
                                <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </li>
            </ul>
        </div>
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="TaxRateSettingID" name="TaxRateSettingID" runat="server" />
        <input type="hidden" id="IsRealEstateRecord" name="IsRealEstateRecord" value="0" />
        <input type="hidden" id="IsContractPenalty" name="IsContractPenalty" value="0" />
        <input type="hidden" id="hidTaxRate" name="hidTaxRate" value="0" />
        <input type="hidden" id="Isok" name="Isok" value="0" />
        <input type="hidden" id="Data" name="Data" value="" />
        <input type="hidden" id="OldStartDate" name="OldStartDate" value="" />
        <script type="text/javascript">
            //var now = new Date();
            //now.setDate(now.getDate() + 1);
            //var strMinDate = now;
            //function checkDate() {
            //    WdatePicker({ dateFmt: 'yyyy-MM-dd', minDate: strMinDate });
            //}



            $(function () {
                Load();
            });

            $("#TaxpayerScale").change(function () {
                if ($("#CheckRecorded").attr('disabled') == "disabled")
                    if ($("#TaxpayerScale").val() == '一般纳税人') {
                        $("#TaxRate").val('0.06');
                        $("#hidTaxRate").val('0.06');

                    } else {
                        $("#TaxRate").val('0.03');
                        $("#hidTaxRate").val('0.03');
                    }
            });

            $("#CheckRecorded").change(function () {
                if ($("#CheckRecorded").is(':checked') == true) {
                    $("#Li1").css('display', 'block');
                    $("#Li2").css('display', 'block');
                    $("#Li3").css('display', 'block');
                    $("#Li4").css('display', 'block');
                    $("#IsRealEstateRecord").val(1);
                } else {
                    $("#Li1").css('display', 'none');
                    $("#Li2").css('display', 'none');
                    $("#Li3").css('display', 'none');
                    $("#Li4").css('display', 'none');
                    $("#IsRealEstateRecord").val(0);
                    $("#RecordedTaxRate").val('');
                    $("#UnrecordedTaxRate").val('');
                }
            });
            $("#CheckContractPenalty").change(function () {
                if ($("#CheckContractPenalty").is(':checked') == true) {
                    $("#Li5").css('display', 'block');
                    $("#Li6").css('display', 'block');
                    $("#IsContractPenalty").val(1);
                } else {
                    $("#Li5").css('display', 'none');
                    $("#Li6").css('display', 'none');
                    $("#IsContractPenalty").val(0);
                    $("#ContractPenaltyRate").val('');
                }
            });
            function GetParam() {

            }
            //选择费用科目
            function SelCost() {

                HDialog.Open('700', '450', "../dialogNew/TaxSettingMultiCorpCommCostDlgNoParentNode.aspx" + "?Ram=" + Math.random() + "&CommID=" + $("#CommID").val(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var str = ',住宅物业服务费,商业物业服务费,车位物业服务费,花园物业服务费';
                        var varObjects = varReturn.split("\t");
                        var str = 'Type=get';
                        str += '&CommID=' + $('#CommID').val();
                        str += '&CorpCostID=' + varObjects[0];
                        var strIng = 'Type=GetAdd';
                        strIng += '&CommID=' + $('#CommID').val();
                        strIng += '&CorpCostID=' + varObjects[0];
                        $.tool.DataGet('TaxRateSetting', 'GetBool', encodeURI(str),
                            function Init() {
                            },
                            function callback(_Data) {
                                // alert(_Data)
                                var varObj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                if (varObj.length > 0) {
                                    HDialog.Info("当前项目费用科目重复!");
                                }
                                else {
                                    $.tool.DataGet('TaxRateSetting', 'GetBool', encodeURI(strIng),
                                        function Init() {
                                        },
                                        function callback(_Data) {
                                            var varObj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                            if (varObj.length > 0) {
                                                var strSign = 0;
                                                var strSignT = 0;
                                                for (var i = 0; i < varObj.length ; i++) {
                                                    if (varObj[i].CostName.indexOf("物业服务费") > -1) {
                                                        strSign = 1;
                                                    }
                                                        //if (varObj[i].SysCostSign == "B0001") {
                                                        //}
                                                    else {
                                                        strSignT = 1;
                                                    }
                                                }
                                                if (strSign == 1 && strSignT == 1) {
                                                    HDialog.Info("物业服务费和其他费用不能同时选择!")
                                                }
                                                else {
                                                    $("#CorpCostID").val(varObjects[0]);
                                                    $("#CostName").val(varObjects[1]);
                                                    CheckSubject();
                                                }

                                                //if (varObj[0].CostName.indexOf("物业服务费") > -1) {
                                                //    $("#CheckRecorded").attr('disabled', 'disabled');
                                                //}
                                                //    //if (varObj[0].SysCostSign == "B0001")
                                                //    //{
                                                //    //   $("#CheckRecorded").attr('disabled', 'disabled');
                                                //    //}
                                                //else {
                                                //    // $("#TaxRate").removeAttr('disabled');
                                                //    $("#CheckRecorded").removeAttr("disabled");
                                                //}

                                                ////带有名字为 物业服务费的  费项不允许修改
                                               // var strFeesName = varObjects[1];
                                                //if (strFeesName.indexOf("物业服务费") >= 0) {
                                                //    $("#TaxRate").attr('disabled', 'disabled');
                                                //} else {
                                                //    $("#TaxRate").removeAttr('disabled');

                                                //}
                                            }

                                        },
                                        function completeCallback() {
                                        },
                                        function errorCallback() {
                                        }
                                    );
                                    ///////////
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function Load() {
                if ($("#OpType").val() == 'insert') {
                   
                }
                if ($("#OpType").val() == 'edit') {
                    $("#CostName").attr('disabled', 'disabled');
                    $.tool.DataGet('TaxRateSetting', 'GetModel', $.JQForm.GetStrParam(),
                        function Init() {
                        },
                        function callback(_Data) {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();

                                $("#frmForm").form('validate');

                                var StartDate = formatDate(varObjects[0].StartDate, "yyyy-MM-dd");
                                var EndDate = formatDate(varObjects[0].EndDate, "yyyy-MM-dd");
                                $("#StartDate").val(StartDate);
                                $("#OldStartDate").val(StartDate);
                                $("#EndDate").val(EndDate);
                                //if ($("#StartDate").val() != "") {
                                //    var d1 = new Date($("#StartDate").val());
                                //    $("#StartDate").val(d1.getFullYear() + "-" + (parseInt(d1.getMonth()) + 1) + "-" + d1.getDate());
                                //    $("#OldStartDate").val(d1.getFullYear() + "-" + (parseInt(d1.getMonth()) + 1) + "-" + d1.getDate());
                                //}
                                //$("#frmForm").form('validate');
                                //if ($("#EndDate").val() != "") {
                                //    var d1 = new Date($("#EndDate").val());
                                //    $("#EndDate").val(d1.getFullYear() + "-" + (parseInt(d1.getMonth()) + 1) + "-" + d1.getDate());
                                //}

                                if ($("#IsRealEstateRecord").val() == "1") {
                                    $("#CheckRecorded").attr('checked', 'true');
                                    $("#Li1").css('display', 'block');
                                    $("#Li2").css('display', 'block');
                                    $("#Li3").css('display', 'block');
                                    $("#Li4").css('display', 'block');
                                } else {
                                    $("#Li1").css('display', 'none');
                                    $("#Li2").css('display', 'none');
                                    $("#Li3").css('display', 'none');
                                    $("#Li4").css('display', 'none');
                                }
                                if ($("#IsContractPenalty").val() == "1") {
                                    $("#CheckContractPenalty").attr('checked', 'true');
                                    $("#Li5").css('display', 'block');
                                    $("#Li6").css('display', 'block');
                                } else {
                                    $("#Li5").css('display', 'none');
                                    $("#Li6").css('display', 'none');
                                }
                                ///////
                                var strIng = 'Type=GetEdit';
                                strIng += '&CommID=' + varObjects[0].CommID;
                                strIng += '&CorpCostID=' + varObjects[0].CorpCostID;
                                $.tool.DataGet('TaxRateSetting', 'GetBool', encodeURI(strIng),
       function Init() {
       },
       function callback(_Data) {

           var varObj = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
           if (varObj.length > 0) {
               //if (varObj[0].SysCostSign == "B0001") {
               //    $("#CheckRecorded").attr('disabled', 'disabled');
               //}
               if (varObj[0].CostName.indexOf("物业服务费") > -1) {
                   $("#CheckRecorded").attr('disabled', 'disabled');
               }
               else {
                   $("#CheckRecorded").removeAttr("disabled");
               }

               //带有名字为 物业服务费的  费项不允许修改
               var strFeesName = varObj[0].CostName;
               if (strFeesName.indexOf("物业服务费") >= 0) {
                   $("#TaxRate").attr('disabled', 'disabled');
               } else {
                   $("#TaxRate").removeAttr('disabled');

               }



           }
       },
       function completeCallback() {
       },
       function errorCallback() {
       });
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }
            function Close() {
                HDialog.Close();
            }

            function CompareDate(d1, d2) {
                return ((new Date(d1.replace(/-/g, "\/"))) > (new Date(d2.replace(/-/g, "\/"))));
            }

            function Save() {

                if ($("#Isok").val() == "1") {
                    HDialog.Info("该" + $("#Data").val() + "费用科目税率记录未审核则不允许新增");
                    return;
                }

                if ($.trim($("#TaxpayerScale").val()) == "") {
                    HDialog.Info("纳税人规模必须选择");
                    return;
                }

                if ($("#StartDate").val() == "" || $("#EndDate").val() == "") {
                    HDialog.Info("开始时间和结束时间必须录入");
                    return;
                }

                //if (((Date.parse($("#StartDate").val()) - Date.parse(new Date().toLocaleDateString())) / 1000 / 3600 / 24) < 2) {
                //    HDialog.Info("开始时间必须大于等于当前时间的第二天");
                //    return;
                //}

                if ($("#StartDate").val() != "" && $("#EndDate").val() != "") {
                    var d1 = new Date($("#StartDate").val());
                    var d2 = new Date($("#EndDate").val());

                    if (CompareDate($("#StartDate").val(), $("#EndDate").val()) == true) {
                        HDialog.Info("开始时间不能大于结束日期");
                        return;
                    }
                }

                var StartDate = $("#StartDate").val();
                var OldStartDate = $("#OldStartDate").val();

                var d1 = new Date(StartDate.replace(/-/g, "\/"));
                var d2 = new Date(OldStartDate.replace(/-/g, "\/"));

                //if (StartDate != "" && OldStartDate != "" && d1 <= d2) {
                //    HDialog.Info("开始时间应不能选择当天或之前的日期。");
                //    return;
                //}

                if ($("#CheckRecorded").is(':checked') == true) {
                    $("#Li1").css('display', 'block');
                    $("#Li2").css('display', 'block');
                    $("#Li3").css('display', 'block');
                    $("#Li4").css('display', 'block');
                    $("#IsRealEstateRecord").val(1);
                } else {
                    $("#Li1").css('display', 'none');
                    $("#Li2").css('display', 'none');
                    $("#Li3").css('display', 'none');
                    $("#Li4").css('display', 'none');
                    $("#IsRealEstateRecord").val(0);
                    $("#RecordedTaxRate").val('');
                    $("#UnrecordedTaxRate").val('');
                }
                if ($("#CheckContractPenalty").is(':checked') == true) {
                    $("#Li5").css('display', 'block');
                    $("#Li6").css('display', 'block');
                    $("#IsContractPenalty").val(1);
                } else {
                    $("#Li5").css('display', 'none');
                    $("#Li6").css('display', 'none');
                    $("#IsContractPenalty").val(0);
                    $("#ContractPenaltyRate").val('');
                }

                //验证若用相同科目存在未审核则不允许新增
                //CheckSubject();
                if (document.getElementById("CheckRecorded").checked && (document.getElementById("RecordedTaxRate").value == "" || document.getElementById("UnrecordedTaxRate").value == "")) {
                    HDialog.Info("已备案税率和未备案税率为必填项!");
                    return;
                }
                if (document.getElementById("CheckContractPenalty").checked && document.getElementById("ContractPenaltyRate").value == "") {
                    HDialog.Info("合同违约金税率为必填项!");
                    return;
                }
                $.tool.DataPostChk('frmForm', 'TaxRateSetting', 'Add', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info("保存成功");
                        HDialog.Close();
                        //if (_Data == "false") {
                        //    HDialog.Info("起始时间与原历史记录有冲突不能保存成功");
                        //} else {
                        //    HDialog.Close();
                        //}
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }



            //验证若用相同科目存在未审核则不允许新增
            function CheckSubject() {
                //$.tool.DataGet('TaxRateSetting', 'CheckSubject', 'CorpCostID=' + $("#CorpCostID").val() + "&CommID=" + $("#CommID").val(),
                //            function Init() {
                //            },
                //            function callback(_Data) {
                //                if (_Data != "true") {
                //                    HDialog.Info("该" + _Data + "费用科目税率记录未审核则不允许新增");
                //                }
                //            },
                //            function completeCallback() {
                //            },
                //            function errorCallback() {
                //            });

                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=TaxRateSetting&Command=CheckSubject&CorpCostID=' + $("#CorpCostID").val() + "&CommID=" + $("#CommID").val(),
                    type: 'GET',
                    dataType: 'text',
                    cache: false,
                    success: function (_Data) {
                        if (_Data != "true") {
                            HDialog.Info("该" + _Data + "费用科目税率记录未审核则不允许新增");
                            $("#Isok").val(1);
                            $("#Data").val(_Data);
                        } else {
                            $("#Isok").val(0);
                            $("#Data").val("");
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.alert('错误', '数据读取错误', 'error');
                    }
                });
            }

            function StartDateChange() {
                var StartDate = $("#StartDate").val();
                var OldStartDate = $("#OldStartDate").val();

                var d1 = new Date(StartDate.replace(/-/g, "\/"));
                var d2 = new Date(OldStartDate.replace(/-/g, "\/"));

                //if (StartDate != "" && OldStartDate != "" && d1 <= d2) {
                //    HDialog.Info("开始时间应不能选择当天或之前的日期。");
                //    return;
                //}
            }
        </script>
    </form>
</body>
</html>


