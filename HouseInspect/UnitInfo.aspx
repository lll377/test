<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnitInfo.aspx.cs" Inherits="M_Main.HouseInspect.UnitInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改责任/整改单位</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            background-color: #ffffff;
            overflow-y: scroll;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            margin-bottom: 53px;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            /*width: 180px;*/
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 88%;
            height: 46px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
            background: #F8F8F8;
        }

        .TdContentSearch select {
            /*width: 180px;*/
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable .TdTitle {
            width: 120px;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: auto;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #ccc;
        }

        .tabs-container .tab-content {
            padding: 0px;
        }

        .tabs-container .tab-pane {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .tabs-container .nav-tabs {
            background-color: #f5f5f5;
        }

        .SearchTable .InputColspan3 {
            width: 88%;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px; text-align: center;">
    <form id="frmFrom" runat="server" method="post">

        <input type="hidden" id="TypeID" name="TypeID" runat="server" />
        <input type="hidden" id="ContractID" name="ContractID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <div class="Container">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle"><span style="color: red">* </span>序号:</td>
                    <td class="TdContentSearch">
                         <input type="text" id="Sort" name="Sort" runat="server" style="width: 200px; border: 1px solid #cccccc; height: 20px" required="required" />
                    </td>
                     <td class="TdTitle">报事区域:</td>
                    <td class="TdContentSearch">
                         <select id="IncidentPlace" name="IncidentPlace" class="easyui-validatebox" data-options="panelHeight:'auto',editable:false,required:true" 
                             style="width: 200px; height: 24px" runat="server">
                        <option value="业主权属">业主权属</option>
                        <option value="公共区域">公共区域</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">联系人:</td>
                    <td class="TdContentSearch">
                           <input type="text" id="Contacts" name="Contacts" runat="server" style="width: 200px; border: 1px solid #cccccc; height: 20px" required="required" />
                    </td>
                     <td class="TdTitle">联系电话:</td>
                    <td class="TdContentSearch">
                         <input id="ContactNumber" name="ContactNumber" type="text" style="height: 20px; width: 200px; border: 1px solid #cccccc;" runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td class="TdTitle"><span style="color: red">* </span>单位名称:</td>
                    <td class="TdContentSearch">
                           <input type="text" id="UnitName" name="UnitName" runat="server" style="width: 200px; border: 1px solid #cccccc; height: 20px" required="required" />
                    </td>
                     <td class="TdTitle"><span style="color: red">* </span>单位类型:</td>
                    <td class="TdContentSearch">
                        <label>
                        <input id="UnitType1" name="UnitType1" type="checkbox" value="责任单位" runat="server" />责任单位</label>
                    <label>
                        <input id="UnitType2" name="Unittype2" type="checkbox" value="整改单位" runat="server" />整改单位</label>
                    <input type="hidden" id="UnitType" name="UnitType" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同名称:</td>
                    <td class="TdContentSearch">
                            <%--<input class="easyui-searchbox" style="height: 24px; width: 200px; border: 1px solid #cccccc;" id="ContractName" name="ContractName" searcher="SelContractName" runat="server" />--%>
                        <input type="text" id="ContractName" name="ContractName" runat="server" style="width: 200px; border: 1px solid #cccccc; height: 20px" />
                    </td>
                     <td class="TdTitle">所属项目:</td>
                    <td class="TdContentSearch">
                      <input id="CommName" name="CommName" style="height: 20px; width: 200px; border: 1px solid #cccccc;" readonly runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td class="TdTitle">所属期别:</td>
                    <td class="TdContentSearch">
                          <input id="CommStage" name="CommStage" style="height: 20px; width: 200px; border: 1px solid #cccccc;" runat="server" />
                    </td>
                     <td class="TdTitle">所属组团:</td>
                    <td class="TdContentSearch">
                       <select id="RegionSNum" name="RegionSNum" runat="server" style="height: 24px; width: 200px; border: 1px solid #cccccc;">
                        <option value=""></option>
                    </select>
                    </td>
                </tr>
                 <tr>
                    <td class="TdTitle">报事类别:</td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-searchbox" style="height: 24px; width: 200px;" id="TypeName" name="TypeName" data-options="required:true,editable:false" searcher="SelTypeName" runat="server" />
                    </td>
                     <td class="TdTitle">所属专业:</td>
                    <td class="TdContentSearch">
                        <select id="Profession" name="Profession" onchange="FrequencyChange(this)" isdctype='true' dctype="所属专业" class="easyui-validatebox"
                            style="border: 1px #cccccc solid; width: 200px; height: 24px" data-options="required:true" runat="server">
                    </select>
                    <input type="hidden" id="ProfessionList" name="ProfessionList" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">负责楼宇:</td>
                    <td class="TdContentSearch">
                          <input type="hidden" id="BuildId" name="BuildId" runat="server" />
                    <input type="text" class="easyui-searchbox" style="height: 24px; width: 200px;" id="BuildName" name="BuildName" data-options="required:true,editable:false" searcher="SelBuilding" runat="server" />

                    </td>
                     <td class="TdTitle">负责公区:</td>
                    <td class="TdContentSearch">
                         <input type="hidden" id="PublicArea" name="PublicArea" runat="server" />
                    <input type="text" class="easyui-searchbox" style="height: 24px; width: 200px;" id="PublicAreaName" name="PublicAreaName" data-options="required:true,editable:false" searcher="SelPublicArea" runat="server" />

                    </td>
                </tr>
                 <tr>
                    <td class="TdTitle">备注:</td>
                    <td class="TdContentSearch" colspan="3">
                          <textarea id="Remarks" name="Remarks" style="width: 95%; height: 60px; border: 1px solid #cccccc;" runat="server"></textarea>
                    </td>
                </tr>
            </table>
        </div>
         <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; border-top: 1px solid #E7EAEC;">
           <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
           <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
        </div>

        <input type="hidden" id="Type" name="Type" value="update" />

        <input type="hidden" id="ResponsibleUnitFile" name="ResponsibleUnitFile" runat="server" />
        <script type="text/javascript">
            //手机号码验证
            function isPoneAvailable(str) {
                var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
                if (!myreg.test(str)) {
                    return false;
                } else {
                    return true;
                }
            }
            function Load() {
                $("#Profession").val($("#ProfessionList").val());
            }
            $(document).ready(function () {
                Load();
            });

            //纯数字验证
            function isNumber(val) {
                var regPos = /^\d+(\.\d+)?$/; //非负浮点数
                var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
                if (regPos.test(val) || regNeg.test(val)) {
                    return true;
                } else {
                    return false;
                }
            }

            function Save() {
                var UnitType = "";

                if ($("#Sort").val() == "") {
                    HDialog.Info("请填写序号!");
                    return;
                } else {
                    if (isNumber($("#Sort").val()) == false) {
                        HDialog.Info("请填写正确的序号!");
                        return;
                    };
                };

                if ($("#UnitType1").is(":checked") == false && $("#UnitType2").is(":checked") == false) {//选中，返回true，没选中，返回false
                    HDialog.Info("请选择单位类型!");
                    return;
                };

                if ($("#UnitName").val() == "") {
                    HDialog.Info("请填写单位名称!");
                    return;
                }

                if ($("#TypeName").searchbox('getValue') == "") {
                    HDialog.Info("请选择报事类别!");
                    return;
                }

                if ($("#UnitType1").is(":checked") == true) {
                    UnitType = 1;
                    console.log("1");
                }
                if ($("#UnitType2").is(":checked") == true) {
                    UnitType = 2;
                    console.log("2");
                }
                if ($("#UnitType1").is(":checked") == true && $("#UnitType2").is(":checked") == true) {
                    UnitType = 3;
                    console.log("3");
                }

                $("#UnitType").val(UnitType);

                if ($("#ContactNumber").val() != "") {
                    var ContactNumber = $("#ContactNumber").val();

                    if (isPoneAvailable(ContactNumber) == false) { HDialog.Info("手机号码不正确,请输入正确的手机号码!"); return; };
                }
                $.tool.DataPostChk('frmFrom', 'CsHouseInspect', 'AddUnitFiling', $('#frmFrom').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                        if (_Data == "修改成功!") {
                            $("#UnitType").val("");
                            HDialog.Close("true");
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
            function SelBuilding() {
                HDialog.Open('800', '500', '../HouseInspect/SelBuildingList.aspx?&CommID=' + $("#CommID").val(), '选择楼宇', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    console.log(arrRet)

                    $("#BuildId").val(arrRet.Id);
                    $("#BuildName").searchbox("setValue", arrRet.name);
                });
            }
            function SelPublicArea() {
                HDialog.Open('800', '500', '../HouseInspect/SelPublicArea.aspx?&CommID=' + $("#CommID").val(), '选择公区', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);

                    var Id = "";
                    var name = "";
                    for (var i = 0; i < arrRet.length; i++) {
                        Id += arrRet[i].Id + ",";
                        name += arrRet[i].PublicAreaName + ",";
                    }

                    $("#PublicArea").val(Id);
                    $("#PublicAreaName").searchbox("setValue", name);
                });
            }


            function SelTypeName() {
                HDialog.Open('800', '500', '../DialogNew/CorpIncidentTypeDlg.aspx?ClassID=1&IsCheck=1&IsEdit=true&IncidentPlace=' + $("#IncidentPlace").val() + '&YFCommID=' + $("#CommID").val(), '选择报事类别', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    //alert(arrRet.FullTypeName);
                    $("#TypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setValue", arrRet.FullTypeName);

                });
            }

            function SelContractName() {
                //var w = $(window).width() * 0.8;
                HDialog.Open(700, 500, '../DialogNew/SelContract.aspx?CommID=' + $("#CommID").val(), "选择合同", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    console.log(_Data)
                    $("#ContractID").val(arrRet.ContID);
                    $("#ContractName").searchbox("setValue", arrRet.ContName);
                });
            }

            $("#IncidentPlace").change(function () {
                $("#TypeID").val('');
                $("#TypeName").searchbox("setValue", '');
            });

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>

