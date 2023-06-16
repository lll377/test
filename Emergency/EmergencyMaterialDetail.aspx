<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyMaterialDetail.aspx.cs" Inherits="M_Main.Emergency.EmergencyMaterialDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应急物资登记详细页面</title>
    <link href="../css/button.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            overflow: hidden;
        }

        .SearchTable {
            width: 100%;
            height: auto;
            border-left: 1px solid #E7EAEC;
            border-top: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 98%;
            height: 40px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .SearchTable tr td {
            color: #666;
            padding: 5px;
            background: #F8F8F8;
            border-right: 1px solid #E7EAEC;
            border-bottom: 1px solid #E7EAEC;
        }

        .SearchTable tr .TdTitle {
            width: 9%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            width: 15%;
            text-align: left;
            background: #fff;
        }

        .TdContentSearchDisable {
            background-color: #E3E3E3;
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

        .messager-body {
            padding: 15px;
        }

        .datagrid-mask-msg {
            height: auto;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="ID" name="ID" runat="server" />
        <input type="hidden" id="OpType" name="OpType" runat="server" />
        <input type="hidden" id="Flag" name="Flag" value="0" runat="server" />
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active" refpage="MaterialInfo" refsel="1"><a data-toggle="tab" href="#tab-1" aria-expanded="true">物资基础信息</a>
                </li>
                <li class="" refpage="MaterialCheckInfo" refsel="0"><a data-toggle="tab" href="#tab-2" aria-expanded="false">物资检查信息</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body" id="ContentBody" style="padding: 10px; overflow: auto;">
                        <table class="SearchTable">
                            <tr>
                                <td class="TdTitle">项目名称:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="CommName" name="CommName" runat="server" class="easyui-validatebox TdContentSearchDisable"
                                        data-options="required:true" readonly />
                                    <input type="hidden" id="CommID" name="CommID" runat="server" />
                                </td>
                                <td class="TdTitle">物资类别:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="MaterialCategoryName" name="MaterialCategoryName" runat="server" onclick="SelMaterialCategory()" class="easyui-validatebox"
                                        data-options="required:true" readonly />
                                    <input type="hidden" id="MaterialCategoryID" name="MaterialCategoryID" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">物资名称:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="MaterialName" name="MaterialName" runat="server" onclick="SelMaterialName()" class="easyui-validatebox"
                                        data-options="required:true" readonly />
                                    <input type="hidden" id="MaterialNameID" name="MaterialNameID" runat="server" />
                                </td>
                                <td class="TdTitle">物资单位:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="MaterialUnit" name="MaterialUnit" maxlength="200" runat="server" class="easyui-validatebox" data-options="required:true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">规格型号:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="SpecificationType" name="SpecificationType" maxlength="200" runat="server" class="easyui-validatebox" />
                                </td>
                                <td class="TdTitle">应配数量:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="ShouldMatchNum" name="ShouldMatchNum" runat="server" class="easyui-numberbox" data-options="required:true,min:0" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">质保期限:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="QualityLimit" name="QualityLimit" runat="server" class="easyui-datebox" data-options="editable:false" />
                                </td>
                                <td class="TdTitle">有效期限:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="ValidityPeriod" name="ValidityPeriod" class="easyui-datebox" runat="server" data-options="editable:false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">应急类型:</td>
                                <td class="TdContentSearch" colspan="3">
                                    <input type="text" id="EmergencyTypeNames" name="EmergencyTypeNames" style="width: 98%;" runat="server" onclick="SelEmergencyType()"
                                        class="easyui-validatebox" data-options="required:true" readonly />
                                    <input type="hidden" id="EmergencyTypeID" name="EmergencyTypeID" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">存放地点:</td>
                                <td class="TdContentSearch" colspan="3">
                                    <textarea id="DepositPlace" name="DepositPlace" maxlength="1500" runat="server" class="easyui-validatebox" data-options="required:true"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">备注:</td>
                                <td class="TdContentSearch" colspan="3">
                                    <textarea id="Remark" name="Remark" maxlength="1500" runat="server" class="easyui-validatebox"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="TdTitle">是否停用:</td>
                                <td class="TdContentSearch">
                                    <input type="text" id="IsStopName" name="IsStopName" value="否" runat="server" class="easyui-validatebox TdContentSearchDisable" />
                                </td>
                                <td class="TdTitle"></td>
                                <td class="TdContentSearch"></td>
                            </tr>
                        </table>
                        <div style="text-align: center; width: 100%; padding: 5px 0; height: 40px;">
                            <input type="button" class="button" value="保存" id="BtnSave" runat="server" />
                            <input type="button" class="button" value="放弃返回" id="BtnCancle" onclick="btnClose();" runat="server" />
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body" style="padding: 0px;">
                        <div id="TableContainer"></div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function InitTableHeight() {
                var H = $(window).height();
                var HeaderHeight = $('.nav-tabs').height();
                $('.panel-body').height(H - HeaderHeight - 1 + "px");
                $('#ContentBody').height(H - HeaderHeight - 21 + "px");

            }

            //选择 物资类别
            function SelMaterialCategory() {
                HDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyDictionary.aspx?' + $.param({ DType: '应急物资类别' }), '选择物资类别', false, function callback(data) {
                    if (data != "") {
                        data = $.parseJSON(data);
                        $("#MaterialCategoryID").val(data.ID);
                        $("#MaterialCategoryName").val(data.Name);
                    }

                });
            }
            //选择 物资名称
            function SelMaterialName() {
                HDialog.OpenWin('600', '400', '../Emergency/Dialog/EmergencyDictionary.aspx?' + $.param({ DType: '应急物资名称' }), '选择物资', false, function callback(data) {
                    if (data != "") {
                        data = $.parseJSON(data);
                        $("#MaterialNameID").val(data.ID);
                        $("#MaterialName").val(data.Name);
                    }

                });
            }

            //选择 应急类型  多选末级应急类型
            function SelEmergencyType() {
                HDialog.Open('600', '400', '../Emergency/Dialog/EmergencyType.aspx?Ismultiple=1', '选择应急类型', false, function callback(_Data) {
                    if (_Data) {
                        var data = $.parseJSON(_Data);
                        $("#EmergencyTypeID").val(data.id);
                        $("#EmergencyTypeNames").val(data.name);
                    };
                })
            }

            //页面关闭
            function btnClose() {
                HDialog.Close("");
            }

            /* 物资检查信息 列表内容 */
            var Columns = [[
                { field: 'InspectUserName', title: '检查人', width: 120, align: 'center', sortable: true },
                { field: 'InspectTime', title: '检查时间', width: 130, align: 'center', sortable: true },
                { field: 'InfactNumber', title: '实际数量', width: 100, align: 'center', sortable: true },
                { field: 'IsOverdueName', title: '是否过期', width: 100, align: 'center', sortable: true },
                { field: 'IsIntactName', title: '是否完好', width: 100, align: 'center', sortable: true },
                { field: 'Remark', title: '备注', width: 180, align: 'center', sortable: true }
            ]];

            //加载 物资检查信息
            function LoadList() {
                var ParameterStr = "MaterialID=" + $('#ID').val() + "&CommID=" + $('#CommID').val();
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Emergency&Command=GetEmergencyMateriaChecklListForMateria&' + ParameterStr,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    columns: Columns,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: false,
                    border: true,
                    toolbar: [],
                    rownumbers: "true",
                    width: '100%',
                    height: '100%',
                    remoteSort: false,
                    onLoadSuccess: function (data) {
                    },
                    onLoadError: function () {
                    }
                });
            }

            //保存
            $('#BtnSave').bind("click", function () {
                //验证条件
                if ($('#CommID').val() == "" || $('#CommID').val() == "0") {
                    HDialog.Info("项目不能为空。");
                    return;
                }
                if ($('#frmForm').form("validate")) {
                    $.tool.DataPostJson('Emergency', 'SaveEmergencyMaterial', $.JQForm.GetStrParam(),
                        function Init() {
                        },
                        function callback(data) {
                            if (data.result) {
                                HDialog.Info("保存物资信息成功");
                                HDialog.Close("true");
                            } else {
                                HDialog.Info(data.msg);
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            });

            //加载页面数据
            function LoadData() {
                //修改的情况才加载数据
                if ($('#OpType').val() == "edit") {
                    $.tool.DataGet('Emergency', 'GetEmergencyMaterialByID', "ID=" + $('#ID').val(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                            if (varObjects.length > 0) {
                                $.JQForm._Data = _Data;
                                $.JQForm.FillForm();
                                //加载easyui控件加载不出来的值
                                $('#frmForm').form('validate');

                                //应配数量
                                if (varObjects[0].ShouldMatchNum != "") {
                                    $('#ShouldMatchNum').numberbox("setValue", varObjects[0].ShouldMatchNum);
                                }

                                //判断是否是 停用
                                if (varObjects[0].IsStop == "1" || $('#Flag').val() == "1") {
                                    $("#frmForm input[type='text'],#fileForm input[type='text']").prop("disabled", "true");
                                    $('#frmForm textarea').attr("disabled", "disabled");
                                    $('#BtnSave').css("display", "none");
                                    $('.easyui-datebox').datebox({ disabled: true });
                                }
                                //有效期限
                                if (varObjects[0].ValidityPeriod != "") {
                                    $('#ValidityPeriod').datebox("setValue", varObjects[0].ValidityPeriod);
                                }
                                //质保期限
                                if (varObjects[0].QualityLimit != "") {
                                    $('#QualityLimit').datebox("setValue", varObjects[0].QualityLimit);
                                }
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
            }

            //页面初始化
            $(function () {
                InitTableHeight();

                $(".tabs-container li").click(function () {
                    var refsel = $(this).attr("refsel");
                    //加载 物资检查信息
                    if (refsel == 0) {
                        setTimeout(function () { LoadList() }, 100);
                        $(this).attr("refsel", "1");
                    }
                });

                LoadData();
            })

        </script>
    </form>
</body>
</html>
