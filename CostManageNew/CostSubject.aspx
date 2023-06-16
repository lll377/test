<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostSubject.aspx.cs" Inherits="M_Main.CostManageNew.CostSubject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>成本科目设置</title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../jscript/jquery.tool.new.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .ContainerLeft {
            height: 100%;
            float: left;
            border-right: 1px solid #cccccc;
            width: 35%;
            margin-top: 5px;
        }

        body {
            margin: 0px;
            padding: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 64%;
            float: left;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

            .Container ul {
                margin: 0px auto;
                clear: both;
                list-style-type: none;
            }

                .Container ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: center;
                    margin-bottom: 10px;
                    min-height: 22px;
                    line-height: 22px;
                    width: 15%;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 80%;
                }

                .Container ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                }

            .Container .Content input {
                width: 75%;
                border: 1px solid #cccccc;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content div {
                padding-left: 2px;
                width: 76%;
            }

            .Container .Content select {
                height: 22px;
            }

            .Container .Content .checkboxClass {
                height: 14px;
                width: auto;
            }
    </style>


</head>
<body>
    <form id="frmForm" runat="server">
        <div class="ContainerLeft" id="divTree">
            <ul id="treeDemo" class="easyui-tree" style="height: 100%; overflow: auto;">
            </ul>
        </div>

        <div class="Container">
            <div style="height: 5px;"></div>
            <ul>
                <li class="InputTitle">序号：</li>
                <li class="Content">
                    <input id="Sort" name="Sort" class="easyui-validatebox" remark="序号" data-options="required:true" />
                </li>
                <li class="InputTitle">科目名称：</li>
                <li class="Content">
                    <input id="SubjectName" name="SubjectName" onkeyup="checkName(this)" onkeydown="checkName(this)" remark="科目名称" type="text" class="easyui-validatebox" data-options="required:true" />
                </li>

                <li class="InputTitle">科目编码：</li>
                <li class="Content">
                    <input id="SubjectCode" name="SubjectCode" remark="科目编码" maxlength="26" class="easyui-validatebox" />
                </li>

                <li class="InputTitle">科目类别：</li>
                <li class="Content">
                    <select id="SubjectType" name="SubjectType" onchange="SubjectTypeChange();">
                        <option value="0" style="color: #000000;">收入</option>
                        <option value="1" style="color: #000000;">支出</option>
                    </select>
                </li>
                <li class="InputTitle">科目类型：</li>
                <li class="Content" id="SubjectTypeCheckList">
                    <table width="84%" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed;">
                        <tr>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="WY1" name="item"><label>物业类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="CW2" name="item"><label>车位类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="NY3" name="item"><label>能源类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="DJ4" name="item"><label>多经类</label></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="GH5" name="item"><label>工会类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="GGSY6" name="item"><label>公共收益类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="DGZJ7" name="item"><label>代管资金类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="GLYJ23" name="item"><label>管理佣金类</label></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="QTSR8" name="item"><label>其它收入类</label></td>
                        </tr>
                        <tr style="height: 10px;"></tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="CB9" name="item"><label>成本类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="FY10" name="item"><label>费用类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="SJ11" name="item"><label>税金类(所得税)</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="SJ12" name="item"><label>税金类(非所得税)</label></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="XC13" name="item"><label>薪酬类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="FL14" name="item"><label>福利类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="JF15" name="item"><label>经费类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="CL16" name="item"><label>差旅类</label></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="CL17" name="item"><label>车辆类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="WX18" name="item"><label>维修类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="AF19" name="item"><label>安防类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="QJ20" name="item"><label>清洁类</label></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="LH21" name="item"><label>绿化类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="ZC22" name="item"><label>资产类</label></td>
                            <td>
                                <input type="checkbox" class="checkboxClass" value="QTZC22" name="item"><label>其它支出类</label></td>
                            <td></td>
                        </tr>
                    </table>
                    <input type="hidden" id="SubjectTypeCheck" name="SubjectTypeCheck" />
                </li>
                <li class="InputTitle" id="GetSf1">对应收费科目：</li>
                <li class="Content" id="GetSf2">
                    <input id="SubjectPayService" name="SubjectPayService" type="hidden" />
                    <input id="SubjectPayServiceName" name="SubjectPayServiceName" onclick="GetSubjectPayService();" data-options="required:true" class="easyui-validatebox" />
                </li>
                <li class="InputTitle" id="GetSf3">是否欠费回收：</li>
                <li class="Content" id="GetSf4">
                    <select id="IsArrearsRecover" name="IsArrearsRecover">
                        <option value="0" style="color: #000000;">否</option>
                        <option value="1" style="color: #000000;">是</option>
                    </select>
                </li>
                <li class="InputTitle">对应财务科目：</li>
                <li class="Content">
                    <input id="SubjectFinancialSubjects" name="SubjectFinancialSubjects" class="easyui-validatebox" />
                </li>
                <li class="InputTitle" id="GetT">取值方式：</li>
                <li class="Content" id="GetW">
                    <select id="GetValueType" name="GetValueType">
                        <option value="" style="color: #000000;">按照需求去掉</option>
                        <option value="0" style="color: #000000;">按费用归属时间取值</option>
                        <option value="1" style="color: #000000;">按费用应交时间取值</option>
                    </select>
                </li>
                <li class="InputTitle" id="RateT">默认税率：</li>
                <li class="Content" id="RateW">
                    <input id="Rate" name="Rate" class="easyui-validatebox" remark="默认税率" style="width: 20%" onkeyup="value=numTest(value)?value:''" onafterpaste="value=numTest(value)?value:''" />（%）
                </li>
                <li class="InputTitle">是否停用：</li>
                <li class="Content">
                    <select id="DisableType" name="DisableType">
                        <option value="0" style="color: #000000;">启用</option>
                        <option value="1" style="color: #000000;">停用</option>
                    </select>
                </li>
                <li class="InputTitle">备注：</li>
                <li class="Content">
                    <input id="Remark" name="Remark" remark="备注" class="easyui-validatebox " />
                </li>

                <li class="Title" style="width: 100%;">
                    <table style="margin: auto; width: 100%;">
                        <tr>
                            <td style="height: 25px; text-align: right; padding-left: 30px;">
                                <input type="checkbox" id="IsRoot" name="IsRoot" value="1" style="width: 20px; line-height: 20px;" />是否根目录</td>
                            <td style="height: 25px; line-height: 25px;"></td>
                            <td>
                                <input type="button" butttongroup="1" class="button" value="新增" id="BSave" onclick="AddItemView();" />
                                <input type="button" butttongroup="2" class="button" style="display: none;" value="确定添加" id="BtnSave" onclick="AddItemClick();" />
                                <input type="button" butttongroup="2" class="button" style="display: none;" value="返回" id="BtnCancel" onclick="CancelClick();" />
                                <input type="button" butttongroup="3" class="button" value="修改" id="BtnUpdate" onclick="UpdateItemClick();" />
                                <input type="button" butttongroup="3" class="button" value="删除" id="BtnDelete" onclick="DeleteItemClick();" />
                            </td>
                        </tr>
                    </table>
                </li>
            </ul>
        </div>

        <input type="hidden" id="ParentId" name="ParentId" />
        <input type="hidden" id="CsId" name="CsId" />
        <input type="hidden" id="OpType" name="OpType" />

        <script type="text/javascript">
            function numTest(num) {
                var reg = /^(\d?\d(\.\d*)?|100)$/;
                if (!num.match(reg)) {
                    return false;
                } else {
                    return true;
                }
            }

            function JudgeRepetition(Flag) {
                var isOk = "false";
                if ($("#SubjectCode").val() != null && $("#SubjectCode").val() != "" && $("#SubjectCode").val() != undefined) {
                    $.tool.DataPostInfoAsync('CsCost', 'JudgeRepetition', 'SubjectCode=' + $("#SubjectCode").val() + "&Flag=" + Flag,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                HDialog.Info("已存在科目编码：" + $("#SubjectCode").val());
                                isOk = "true";
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        }, false);
                }
                return isOk;
            }

            function SubjectTypeChange() {
                if ($("#SubjectType").val() == "1") {
                    $("#GetT").hide();
                    $("#GetW").hide();
                    $("#GetSf1").hide();
                    $("#GetSf2").hide();
                    $("#RateT").show();
                    $("#RateW").show();
                    $('#GetSf3').hide();
                    $('#GetSf4').hide();

                }
                else {
                    $("#GetT").hide();
                    $("#GetW").hide();
                    $("#GetSf1").show();
                    $("#GetSf2").show();
                    $("#RateT").hide();
                    $("#RateW").hide();
                    $('#GetSf3').show();
                    $('#GetSf4').show();
                }
            }

            function AddItemView() {
                $('#SubjectPayServiceName').removeAttr("disabled");
                $("input[butttonGroup='1']").css("display", "none");
                $("input[butttonGroup='2']").css("display", "");
                $("input[butttonGroup='3']").css("display", "none");
                $("#SubjectPayServiceName").val("");
                $("#SubjectPayService").val("");
                $("#IsArrearsRecover").val("0");
            }
            function CancelClick() {
                $("input[butttonGroup='1']").css("display", "");
                $("input[butttonGroup='2']").css("display", "none");
                $("input[butttonGroup='3']").css("display", "");
                //加载选择的部门
                zTreeOnClick(document.getElementById("SubjectName").value, document.getElementById("CsId").value);
                //  NodeItemClick($("#SortDepCode").val());
            }
            function clearPage() {
                $("#SubjectType").val("0");
                $("#GetValueType").val("");
                $("#DisableType").val("0");
                $("#Remark").val("");
                $("#SubjectFinancialSubjects").val("");
                //$("#SubjectFinancialSubjectsName").val("");
                $("#Sort").val("");
                // $("#SubjectName").val("");
                // $("#SubjectCode").val("");
                $("#SubjectPayServiceName").val("");
                $("#SubjectPayService").val("");
                $("#IsArrearsRecover").val("0");

            }
            //function GetSubjectFinancialSubjects() {
            //    HDialog.Open('460', '310', '../DialogNew/Voucher_AccSubjDlg.aspx', '财务科目', false, function callback(_Data) {
            //        var varObjects = JSON.parse(_Data);
            //        $("#SubjectFinancialSubjects").val(varObjects.IID);
            //        $("#SubjectFinancialSubjectsName").val(varObjects.SubjCode + "(" + varObjects.SubjName + ")");
            //    });
            //}
            InitTableHeight();
            function InitTableHeight() {
                var h = $(window).height();
                $("#divTree").css({ "height": (h + 1) + "px" });
                SubjectTypeChange();
            }
            function zTreeOnClick(SubjectName, CsId) {
                document.getElementById("ParentId").value = CsId;
                document.getElementById("CsId").value = CsId;
                $.tool.DataPostAsync('CsCost', 'GetCostSubjectId', "CsId=" + CsId,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "") {
                            var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                document.getElementById("SubjectName").value = varObjects[0].SubjectName;
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();
                                $("#frmForm").form('validate');
                                //循环勾选科目类型
                                if (varObjects[0].SubjectTypeCheck != null && varObjects[0].SubjectTypeCheck != "") {
                                    $('#SubjectTypeCheckList input[type=checkbox]').each(function () {
                                        if (varObjects[0].SubjectTypeCheck.indexOf($(this).val()) > -1) {
                                            $(this).prop("checked", true);
                                        } else {
                                            $(this).prop("checked", false);
                                        }
                                    });
                                } else {
                                    $('#SubjectTypeCheckList input[type=checkbox]').each(function () {
                                        $(this).prop("checked", false);
                                    });
                                }
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    }, false);
            }
            function InitTree() {
                $.tool.DataGet('CsCost', 'GetSubjectEasyUiTree', "",
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            GetTree(varObjects);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            InitTree();
            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    data: obj,
                    onClick: function (node) {
                        //判断这个节点是否是根节点  如果不是的话就需要禁用 【对应收费科目】 选择
                        if ($('#treeDemo').tree("isLeaf", node.target)) {
                            $('#SubjectPayServiceName').removeAttr("disabled");
                        } else {
                            $('#SubjectPayServiceName').attr("disabled", "disabled");
                        }
                        zTreeOnClick(node.text, node.attributes.CsId);
                        SubjectTypeChange();
                    }
                });
            }


            function AddItemClick() {
                //var flag = JudgeRepetition("1");
                //if (flag == "true") {
                //    return;
                //}
                $("#OpType").val("insert");
                var reg = /\s/;
                ///[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g
                var name = "";
                $("#frmForm input[type='text']").each(function () {
                    var context = $(this).val();
                    if (context != "") {
                        if (reg.exec(context) != null)
                            name += $(this).attr("remark") + ",";
                    }
                });
                if (name != "") {
                    HDialog.Info(name + "内容中有空格,请检查后重新输入");
                    return;
                }

                if ($("#SubjectPayServiceName").val() == "" && $("#SubjectType").val() == "0") {
                    HDialog.Info("收费科目不能为空!");
                    return;
                }
                if ($("#SubjectPayServiceName").val() == "" && $("#SubjectType").val() == "1" && $('#Rate').val() == "") {
                    HDialog.Info("默认税率不能为空!");
                    return;
                }
                if (!UpdateSubjectTypeCheck())
                    return;
                $.tool.DataGet('CsCost', 'SaveCostSubject', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data.split('|')[0] == "false") {
                            HDialog.Info(_Data.split('|')[1]);
                            return;
                        } else {
                            $("#treeDemo").html("");
                            if (_Data != '') {
                                varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                GetTree(varObjects);
                                CancelClick();
                                clearPage();
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function UpdateItemClick() {
                var CsId = document.getElementById("CsId").value;
                if ($("#SubjectPayServiceName").val() == "" && $("#SubjectType").val() == "0") {
                    HDialog.Info("收费科目不能为空!");
                    return;
                }

                if ($("#SubjectPayServiceName").val() == "" && $("#SubjectType").val() == "1" && $('#Rate').val() == "") {
                    HDialog.Info("默认税率不能为空!");
                    return;
                }
                if (!UpdateSubjectTypeCheck())
                    return;
                if (CsId != null && CsId != "" && CsId != undefined) {
                    $("#OpType").val("edit");
                    $.tool.DataGet('CsCost', 'SaveCostSubject', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data.split('|')[0] == "false") {
                                HDialog.Info(_Data.split('|')[1]);
                            } else {
                                $("#treeDemo").html("");
                                if (_Data != '') {
                                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                    GetTree(varObjects);
                                }
                            }

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                } else {
                    HDialog.Info("请选择一项修改");
                }
            }

            //循环页面的checkbox 更新SubjectTypeCheck的值
            function UpdateSubjectTypeCheck() {
                var Itemvalue = "";
                $('#SubjectTypeCheckList input[type=checkbox]').each(function () {
                    if ($(this).prop('checked')) {
                        Itemvalue += $(this).val() + ",";
                    }
                });
                if (Itemvalue.length > 0) {
                    Itemvalue = Itemvalue.substring(0, Itemvalue.length - 1);
                }

                //判断 Itemvalue 是否是同时包含 成本类:CB9  费用类:FY10  税金类（所得税）:SJ11  税金类（非所得税）:SJ12
                var SelectCount = 0;
                if (Itemvalue.indexOf("CB9") > -1) {
                    SelectCount = SelectCount + 1;
                }
                if (Itemvalue.indexOf("FY10") > -1) {
                    SelectCount = SelectCount + 1;
                }
                if (Itemvalue.indexOf("SJ11") > -1) {
                    SelectCount = SelectCount + 1;
                }
                if (Itemvalue.indexOf("SJ12") > -1) {
                    SelectCount = SelectCount + 1;
                }
                if (SelectCount > 1) {
                    HDialog.Info("科目类型:成本类、费用类、税金类（所得税）、税金类（非所得税） 只允许同时选中一个;");
                    return false;
                } else {
                    $('#SubjectTypeCheck').val(Itemvalue);
                    return true;
                }
            }

            function GetSubjectPayService() {
                HDialog.Open('440', '420', '../DialogNew/ChargeAccountDlg.aspx', '收费科目选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var str = _Data.split('$');
                        //if ($.trim($("#SubjectPayService").val()) != "") {
                        //    $("#SubjectPayServiceName").val($("#SubjectPayServiceName").val() + "," + str[1]);
                        //    $("#SubjectPayService").val($("#SubjectPayService").val() + "," + str[0]);
                        //}
                        //else {
                        $("#SubjectPayServiceName").val(str[1]);
                        $("#SubjectPayService").val(str[0]);
                        //}
                    }
                });
            }
            function DeleteItemClick() {
                var CsId = document.getElementById("CsId").value;
                if (CsId != null && CsId != "" && CsId != undefined) {
                    HDialog.Prompt('是否确定删除!', function () {
                        $.tool.DataGet('CsCost', 'DelCostSubject', $('#frmForm').serialize(),
                            function Init() {
                            },
                            function callback(_Data) {
                                if (_Data.split('|')[0] == "false") {
                                    HDialog.Info(_Data.split('|')[1]);
                                }
                                else {
                                    $("#Sort").val("");
                                    $("#SubjectName").val("");
                                    $("#BudgetSubject").val("");
                                    $("#Remark").val("");
                                    if (_Data != '') {
                                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                                        GetTree(varObjects);
                                    }
                                }
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    });
                } else {
                    HDialog.Info("请选择一项删除");
                }
            }
            function clearString(s) {
                var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&;|{}【】‘；：”“'。，、？]")
                var rs = "";
                for (var i = 0; i < s.length; i++) {
                    rs = rs + s.substr(i, 1).replace(pattern, '');
                }
                return rs;
            }
            function checkName(obj) {
                var val = $(obj).val();
                var pattern = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/gi;
                if (pattern.test(val)) {
                    return true;
                } else {
                    var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&;|{}【】‘；：”“'。，、？]")
                    var rs = "";
                    for (var i = 0; i < val.length; i++) {
                        rs = rs + val.substr(i, 1).replace(pattern, '');
                    }
                    $(obj).val(rs);
                }
                //var val = $(obj).val();
                //var pattern = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/gi;
                //if (pattern.test(val)) {
                //    return true;
                //}
                //else
                //{
                //    var rval = clearString(val);
                //    //val.substring(0, val.length-1)
                //        $(obj).val(rval);
                //}
            }
        </script>

    </form>
</body>
</html>
