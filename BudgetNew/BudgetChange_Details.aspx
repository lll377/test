<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetChange_Details.aspx.cs" Inherits="M_Main.BudgetNew.BudgetChange_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/EquimentDictionaryCanNull.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

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
                    line-height: 22px;
                    width: 90px;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 80%;
                }

                .Container ul .Title {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 90%;
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
                width: 70%;
                border: 1px solid #cccccc;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content select {
                width: 71.5%;
                border: 1px solid #cccccc;
                height: 26px;
                padding-left: 2px;
            }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;">
    <form id="frmFrom" runat="server">
        <input type="hidden" id="BudgetCompany" name="BudgetCompany" runat="server" />
        <input type="hidden" id="BudgetYear" name="BudgetYear" runat="server" />
        <input type="hidden" id="PlanID" name="PlanID" runat="server" />
        <input type="hidden" id="PlanIDs" name="PlanIDs" runat="server" value="" />
        <input type="hidden" id="BudgetChangeType" name="BudgetChangeType" runat="server" value="" />

        <div class="Container">
            <ul>
                <li class="InputTitle">单位类型：</li>
                <li class="Content">
                    <select id="ChangeType" name="ChangeType" class="easyui-validatebox" disabled="disabled" runat="server" data-options="required:true" onchange="OnChangeType();">
                        <option value="单位内调整">单位内调整</option>
                        <option value="单位间调整">单位间调整</option>
                    </select>
                </li>
                <li class="InputTitle" id="BudgetCompanyTitle">预算单位：</li>
                <li class="Content" id="BudgetCompanyContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="BudgetCompanys" name="BudgetCompanys" runat="server" onclick="SelCostCompany();" />
                    <input type="hidden" id="BudgetCompanyId" name="BudgetCompanyId" value="" runat="server" />
                </li>
                <li class="InputTitle" id="BudgetProgramTitle1">预算项目：</li>
                <li class="Content" id="BudgetProgramContent1">
                    <input type="text" runat="server" id="BudgetProgram1" class="easyui-validatebox" name="BudgetProgram1" data-options="required:true" onclick="SelItem1();" />
                    <input id="BudgetProgramId1" name="BudgetProgramId1" type="hidden" />
                </li>
                <li class="InputTitle" id="BudgetProgramTitle" style="display: none;">预算项目：</li>
                <li class="Content" id="BudgetProgramContent" style="display: none;">
                    <input type="text" runat="server" id="BudgetProgram" class="easyui-validatebox" name="BudgetProgram" data-options="required:true" onclick="SelItem();" />
                    <input id="BudgetProgramId" name="BudgetProgramId" type="hidden" />
                </li>
                <li class="InputTitle">调整月份：</li>
                <li class="Content">
                    <select id="ChangeMonth" name="ChangeMonth" class="easyui-validatebox" data-options="required:true">
                        <option></option>
                        <option value="1">01</option>
                        <option value="2">02</option>
                        <option value="3">03</option>
                        <option value="4">04</option>
                        <option value="5">05</option>
                        <option value="6">06</option>
                        <option value="7">07</option>
                        <option value="8">08</option>
                        <option value="9">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
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

        <script type="text/javascript">
            function Load() {
                if ($("#BudgetChangeType").val() == 'True')  //非最底层
                {
                    $("#ChangeType").val("单位间调整");
                }
                else {
                    $("#ChangeType").val("单位内调整");

                }
                OnChangeType();
            }

            function OnChangeType() {
                var ChangeType = $("#ChangeType").val();
                if (ChangeType == "单位间调整") {
                    document.getElementById("BudgetProgramTitle").style.display = "none";
                    document.getElementById("BudgetProgramContent").style.display = "none";
                    document.getElementById("BudgetProgramTitle1").style.display = "block";
                    document.getElementById("BudgetProgramContent1").style.display = "block";
                    document.getElementById("BudgetCompanyTitle").style.display = "block";
                    document.getElementById("BudgetCompanyContent").style.display = "block";
                } else {
                    document.getElementById("BudgetCompanyTitle").style.display = "none";
                    document.getElementById("BudgetCompanyContent").style.display = "none";
                    document.getElementById("BudgetProgramTitle1").style.display = "none";
                    document.getElementById("BudgetProgramContent1").style.display = "none";
                    document.getElementById("BudgetProgramTitle").style.display = "block";
                    document.getElementById("BudgetProgramContent").style.display = "block";
                }
            }


            //选择项目
            function SelItem() {
                HDialog.Open('380', '400', '../BudgetNew/BudgetPrograms.aspx?PlanID=' + $("#PlanID").val(), '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var arry = _Data.split('&');
                        $("#BudgetProgramId").val(arry[0]);
                        $("#BudgetProgram").val(arry[1]);
                    }
                });
            }

            //选择项目
            function SelItem1() {
                var BudgetCompanyId = $("#BudgetCompanyId").val();
                if (BudgetCompanyId == "") {
                    $("#BudgetYear").val("");
                    HDialog.Info("请选择预算单位。");
                    return false;
                }
                $.tool.DataPostAsync('Budget', 'GetBudgetChangeIsExist', 'BudgetCompanyid=' + $("#BudgetCompanyId").val() + '&BudgetYear=' + $("#BudgetYear").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var str = _Data.split('|');
                        if (str[0] == "true") {
                            $("#PlanIDs").val(str[1]);
                            HDialog.Open('380', '400', '../BudgetNew/BudgetPrograms1.aspx?PlanID=' + str[1], '选择项目', true, function callback(_Data) {
                                if (_Data != "") {//**获得返回的参数信息
                                    var arry = _Data.split('&');
                                    $("#BudgetProgramId1").val(arry[0]);
                                    $("#BudgetProgram1").val(arry[1]);
                                }
                            });
                        } else {
                            $("#PlanIDs").val("");
                            HDialog.Info("您选择调整的预算计划不存在，请重新选择！");
                            return false;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //选择预算单位
            function SelCostCompany() {
                HDialog.Open('400', '350', '../DialogNew/SelBudgetCompanyBottom.aspx?isCheck=&ParentId=' + $("#BudgetCompany").val(), '选择预算单位', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(',');
                        $("#BudgetCompanyId").val(varObjects[0]);
                        $("#BudgetCompanys").val(varObjects[1]);
                    }
                });
            }

            function Save() {

                var ChangeType = $("#ChangeType").val();
                if (ChangeType == '单位间调整') {
                    $("#PlanID").val("");
                    $("#BudgetCompany").val("");
                } else {
                    $("#PlanIDs").val("");
                }
                $.tool.DataPostAsync('Budget', 'GetBudgetChangeDetailsList', $('#frmFrom').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != null && _Data != "") {
                            HDialog.Close(_Data);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function Close() {
                HDialog.Close();
            }


            function BudgetChange1() {
                var BudgetCompanyId = $("#BudgetCompanyId").val();
                if (BudgetCompanyId == "") {
                    $("#BudgetYear").val("");
                    HDialog.Info("请选择预算单位。");
                    return false;
                }

                $.tool.DataPostAsync('Budget', 'GetBudgetChangeIsExist', 'BudgetCompanyid=' + $("#BudgetCompanyId").val() + '&BudgetYear=' + $("#BudgetYear").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var str = _Data.split('|');
                        if (str[0] == "true") {
                            $("#PlanIDs").val(str[1]);
                        } else {
                            $("#PlanIDs").val("");
                            HDialog.Info("您选择调整的预算计划不存在，请重新选择！");
                            return false;
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            Load();
        </script>
    </form>
</body>
</html>
