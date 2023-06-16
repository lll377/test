<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RankList.aspx.cs" Inherits="M_Main.EquipmentNew.RankList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>设备级别设置</title>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        .SearchTable {
            width: 100%;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
            table-layout: fixed;
        }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch textarea {
            width: 96.2%;
            height: 44px;
            resize: none;
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        .TdContentSearch div {
            height: 45px;
            width: 96.2%;
            border: 1px #cccccc solid;
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
            width: 5%;
            text-align: right;
            background: #F8F8F8;
        }

        .SearchTable tr .TdContentSearch {
            text-align: left;
            background: #fff;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="RankList" runat="server">
        <div class="easyui-layout" id="Layout" data-options="fit:true">
            <div data-options="region:'west',border:true,width:300,title:'设备级别'">
                <ul id="treeDemo" class="easyui-tree">
                </ul>
            </div>
            <div data-options="region:'center',border:true,title:'详细信息'">
                <table class="SearchTable">
                    <tr>
                        <td class="TdTitle">序号:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="Sort" name="Sort" class="easyui-numberbox" style="width: 200px;" data-options="required:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">设备系统:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="SystemName" name="SystemName" maxlength="25" style="width: 195px;" class="easyui-validatebox" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">设备级别名称:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RankName" name="RankName" maxlength="100" style="width: 195px;" class="easyui-validatebox" data-options="required:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">级别代码:</td>
                        <td class="TdContentSearch">
                            <input type="text" id="RankCode" name="RankCode" maxlength="100" style="width: 195px;" class="easyui-validatebox" data-options="required:true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">是否测量设备:</td>
                        <td class="TdContentSearch">
                            <select id="IsMeasurement" name="IsMeasurement" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:60,required:true" runat="server">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">是否消防设备:</td>
                        <td class="TdContentSearch">
                            <select id="IsFireFightingEquipment" name="IsFireFightingEquipment" class="easyui-combobox" data-options="editable:false,panelHeight:'auto',width:60,required:true" runat="server">
                                <option value="0">否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="TdTitle">备注:</td>
                        <td class="TdContentSearch">
                            <textarea type="text" id="Remark" name="Remark" maxlength="500" class="easyui-validatebox"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color: white; text-align: center;">
                            <label style="cursor: pointer; vertical-align: middle;">
                                <input type="checkbox" id="IsRoot" onclick="IsRoot_Click()" name="IsRoot" style="width: auto; line-height: 20px;" />是否根目录</label>
                            <input type="button" class="button" value="新增" id="BtnAdd" onclick="BtnAddClick();" runat="server" />
                            <input type="button" class="button" value="保存" id="BtnSave" onclick="BtnSaveClick();" runat="server" />
                            <input type="button" class="button" value="放弃返回" style="display: none" id="BtnReturn" onclick="BtnReturnClick();" runat="server" />
                            <input type="button" class="button" value="删除" id="BtnDel" onclick="BtnDelClick();" />
                            <label style="color: red;">新增的情况默认选中节点为父节点，勾选是否根目录后默认为最顶级节点</label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="OpType" name="OpType" value="update" />
        <script type="text/javascript">
            $(function () {
                InitTableHeight();
                LoadTree("");
            });
            function InitTableHeight() {
                var h = $(window).height();
                var w = $(window).width();
                $('#Layout').height(h);
                $("#Layout").layout('resize', {
                    height: h,
                    width: w
                });
            }
            //加载树
            function LoadTree(id) {
                $("#treeDemo").tree({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    treeField: 'RankName',
                    idField: 'RankId',
                    lines: true,
                    animate: true,
                    border: false,
                    loadMsg: '加载中,请稍侯...',
                    onLoadError: function () {
                        $("#OpType").val("update");
                        $("#BtnAdd").css("display", "");
                        $("#BtnDel").css("display", "");
                        $("#BtnReturn").css("display", "none");
                        $('#IsRoot').attr("checked", false);
                        ClearValue();
                        $("#treeDemo").tree("loadData", []);
                    },
                    onLoadSuccess: function (node, data) {
                        //默认选中第一个节点
                        if (data.length > 0) {
                            if (id != "") {
                                var node = $('#treeDemo').tree('find', id);
                                $('#treeDemo').tree('select', node.target);
                                $('#treeDemo').tree('scrollTo', node.target);

                            } else {
                                var node = $('#treeDemo').tree('find', data[0].id);
                                $('#treeDemo').tree('select', node.target);
                            }
                        }
                    },
                    onBeforeLoad: function (row, param) {
                        param.Method = "DataPost";
                        param.Class = "CsEquipment";
                        param.Command = "GetRankEasyUiTree";

                    },
                    onSelect: function (row) {
                        $("#OpType").val("update");
                        $("#BtnAdd").css("display", "");
                        $("#BtnDel").css("display", "");
                        $("#BtnReturn").css("display", "none");
                        $('#IsRoot').attr("checked", false);
                        if (row != null) {
                            $('#RankList').form('load', row.attributes);
                        }
                    }
                });
            }

            //勾选是否根节点
            function IsRoot_Click() {
                if ($('#OpType').val() == "insert") {
                    if (!$('#IsRoot').prop("checked")) {
                        var SelectedNode = $('#treeDemo').tree("getSelected");
                        if (SelectedNode != null) {
                            $('#SystemName').val(SelectedNode.attributes.SystemName);
                        } else {
                            $('#SystemName').val("");
                        }
                    } else {
                        $('#SystemName').val("");
                    }
                }

            }
            //放弃返回
            function BtnReturnClick() {
                var SelectedNode = $('#treeDemo').tree("getSelected");
                if (SelectedNode != null) {
                    var node = $('#treeDemo').tree('find', SelectedNode.id);
                    $('#treeDemo').tree("select", node.target);
                } else {
                    $("#OpType").val("update");
                    $("#BtnAdd").css("display", "");
                    $("#BtnDel").css("display", "");
                    $("#BtnReturn").css("display", "none");
                    $('#IsRoot').attr("checked", false);
                    ClearValue();
                }
            }
            //新增
            function BtnAddClick() {
                $('#OpType').val("insert");
                $("#BtnAdd").css("display", "none");
                $("#BtnDel").css("display", "none");
                $("#BtnReturn").css("display", "");
                $('#IsRoot').attr("checked", false);
                ClearValue();
                var SelectedNode = $('#treeDemo').tree("getSelected");
                if (SelectedNode != null) {
                    $('#SystemName').val(SelectedNode.attributes.SystemName);
                }

            }

            //保存
            function BtnSaveClick() {
                if ($('#RankList').form("validate")) {
                    var Paramestr = "Sort=" + $('#Sort').numberbox("getValue") + "&RankName=" + $('#RankName').val() + "&RankCode=" + $('#RankCode').val()
                    + "&IsMeasurement=" + $('#IsMeasurement').combobox("getValue") + "&IsFireFightingEquipment=" + $('#IsFireFightingEquipment').combobox("getValue")
                    + "&Remark=" + $('#Remark').val() + "&OpType=" + $("#OpType").val();
                    if ($('#OpType').val() == "insert") {
                        if (!$('#IsRoot').prop('checked')) {
                            var SelectedNode = $('#treeDemo').tree("getSelected");
                            if (SelectedNode == null) {
                                document.getElementById("IsRoot").checked = true;
                                HDialog.Info("没有选中的节点，默认为根节点，请重新保存！");
                                return;
                            } else {
                                //不是根节点
                                if (SelectedNode.attributes.SystemId != "") {
                                    Paramestr = Paramestr + "&SystemId=" + SelectedNode.attributes.SystemId + "&ParentId=" + SelectedNode.id;
                                } else {
                                    Paramestr = Paramestr + "&SystemId=" + SelectedNode.id + "&ParentId=" + SelectedNode.id;
                                }
                            }
                        } else {
                            //是根节点 SystemId="" ParentId=""
                        }
                    } else {
                        var SelectedNode = $('#treeDemo').tree("getSelected");
                        if (SelectedNode == null) {
                            HDialog.Info("请选择需要修改的设备级别");
                            return;
                        }
                        Paramestr = Paramestr + "&RankId=" + SelectedNode.attributes.RankId;
                    }
                    $.tool.DataGet('CsEquipment', 'SaveRank', Paramestr,
                                                       function Init() {
                                                       },
                                                       function callback(_Data) {
                                                           if (_Data.indexOf("true") > -1) {
                                                               var Item = _Data.split('&');
                                                               if (Item.length > 1) {
                                                                   HDialog.Info("保存成功");
                                                                   LoadTree(Item[1]);
                                                               }
                                                           } else {
                                                               HDialog.Info(_Data);
                                                           }
                                                       },
                                                       function completeCallback() {
                                                       },
                                                       function errorCallback() {
                                                       });
                }
            }

            //清空页面数据
            function ClearValue() {
                $('#Sort').numberbox("setValue", "");
                $('#SystemName').val("");
                $('#RankName').val("");
                $('#RankCode').val("");
                $('#IsMeasurement').combobox("setValue", "0");
                $('#IsFireFightingEquipment').combobox("setValue", "0");
                $('#Remark').val("");
            }

            //删除
            function BtnDelClick() {
                var SelectedNode = $('#treeDemo').tree("getSelected");
                if (SelectedNode == null) {
                    HDialog.Info("请选择需要删除的设备级别");
                    return;
                }
                if (!$('#treeDemo').tree('isLeaf', SelectedNode.target)) {
                    HDialog.Info("当前选中的节点下还存在下级，不允许删除");
                    return;
                }
                var parameterStr = "RankId=" + SelectedNode.attributes.RankId;
                HDialog.Prompt('是否确定删除选中的设备级别!', function () {
                    $.tool.DataGet('CsEquipment', 'DelRank', parameterStr,
                                                                function Init() {
                                                                },
                                                                function callback(_Data) {
                                                                    if (_Data == "true") {
                                                                        //ClearValue();
                                                                        //$('#treeDemo').tree("remove", SelectedNode.target);
                                                                        LoadTree("");
                                                                        HDialog.Info("删除成功");
                                                                    } else {
                                                                        HDialog.Info(_Data);
                                                                    }
                                                                },
                                                                function completeCallback() {
                                                                },
                                                                function errorCallback() {
                                                                });

                });
            }

        </script>
    </form>
</body>
</html>
