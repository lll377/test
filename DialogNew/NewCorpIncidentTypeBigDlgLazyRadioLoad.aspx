<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCorpIncidentTypeBigDlgLazyRadioLoad.aspx.cs" Inherits="M_Main.DialogNew.NewCorpIncidentTypeBigDlgLazyRadioLoad" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body style="overflow-y: auto;">
    <form id="FrmForm" runat="server">
        <input name="isAll" id="isAll" type="hidden" runat="server" />
        <input name="hClassID" id="hClassID" type="hidden" runat="server" />
        <input name="IsEdit" id="IsEdit" type="hidden" runat="server" />
        <input name="IsBigClass" id="IsBigClass" value="0" type="hidden" runat="server" />
        <input id="hiDuty" name="hiDuty" type="hidden" runat="server" />
        <input id="PrentTypeCode" name="PrentTypeCode" type="hidden" runat="server" />
        <input id="IncidentPlace" name="IncidentPlace" type="hidden" runat="server" />
        <div>
            名称：<input id="CostName" style="height: 22px; width: 30%" size="18" name="CostName" runat="server" type="text"
                maxlength="100" />
            <input class="button" id="btnFilter" style="height: 30px" type="submit" value="查询" name="btnFilter"
                runat="server" onclick="javascript: btnFilter_OnClick();" />
            <input class="button" id="btnClear" style="height: 30px" onclick="javascript: btnClear_OnClick();"
                type="button" value="清空" name="btnClear" runat="server" />
            <input class="button" id="btnSave" style="height: 30px" onclick="javascript: btnSave_Onclick();"
                type="button" value="确定" name="btnSave" runat="server" />
        </div>
        <div>
            <ul id="treeDemo" style="width: 100%;" class="easyui-tree">
            </ul>
        </div>
        <script type="text/javascript">
            function btnFilter_OnClick() {
                InitLeftTree();
            }

            function btnClear_OnClick() {
                CostName.value = "";
            }

            function btnSave_Onclick() {
                var ReturnValue = $("#treeDemo").tree('getSelected');

                if (ReturnValue == null) {
                    HDialog.Info('请选择报事大类');
                }
                else {
                    var result = new Object();
                    result["id"] = ",";
                    result["text"] = "";
                    result["code"] = "";
                    result["RatedWorkHour"] = "";
                    result["KPIRatio"] = "";
                    result["RatedWorkHour1"] = "";
                    result["KPIRatio1"] = "";
                    result["FullTypeName"] = "";
                    result["DealLimit"] = "";
                    result["DealLimit2"] = "";
                    result["DispLimit"] = "";
                    result["IsTouSu"] = "";
                    result["IndustryWarrantyTime"] = "";
                    var data = ReturnValue;
                    var value = result["id"];
                    result["id"] = data.attributes.CorpTypeID;
                    result["text"] = data.text;
                    result["code"] = data.attributes.TypeCode;
                    result["RatedWorkHour"] = data.attributes.TypeName + '(' + data.attributes.RatedWorkHour + ')';
                    result["KPIRatio"] = data.attributes.TypeName + '(' + data.attributes.KPIRatio + ')';
                    result["RatedWorkHour1"] = data.attributes.RatedWorkHour;
                    result["KPIRatio1"] = data.attributes.KPIRatio;
                    result["TypeName"] = data.attributes.TypeName;
                    result["DealLimit"] = data.attributes.DealLimit;
                    result["DealLimit2"] = data.attributes.DealLimit2;
                    result["DispLimit"] = data.attributes.DispLimit;
                    result["IsTouSu"] = data.attributes.IsTouSu;
                    result["IndustryWarrantyTime"] = data.attributes.IsTouSu;
                    if (result["id"] == ',') {
                        result["id"] = "";
                    }
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(result);
                }
            }

            $(document).ready(function () {
                $("#PrentTypeCode").val("");
                InitLeftTree();
            });

            function InitLeftTree() {
                var DutyValue = encodeURI($("#hiDuty").val());
                //   if (DutyValue == "") { DutyValue = "地产类"; }//值查地产类
                $.tool.DataGet('IncidentChoose', 'GetIncidentTypeListBigClassAsynchronous', 'hClassID=' + $("#hClassID").val() + '&Duty=' + DutyValue + '&CostName=' + encodeURI($("#CostName").val())
                    + "&isAll=" + $("#isAll").val() + "&IsEdit=" + $("#IsEdit").val() + "&IncidentPlace=" + $("#IncidentPlace").val() + "&PrentTypeCode=" + $("#PrentTypeCode").val() + "&IsBigClass=" + $("#IsBigClass").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            var data1 = _Data;
                            varObjects = eval("(" + data1.replace(/\\/g, "/") + ")"); //转换为json对象
                            GetTree(varObjects);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            function InitLeftTreeAdd(PrentTypeCode, node) {
                var DutyValue = encodeURI($("#hiDuty").val());
                $.tool.DataGet('IncidentChoose', 'GetIncidentTypeListBigClassAsynchronous', 'hClassID=' + $("#hClassID").val() + '&Duty=' + DutyValue
                    + '&CostName=' + '' + "&isAll=" + $("#isAll").val() + "&IsEdit=" + $("#IsEdit").val() + "&IncidentPlace=" + $("#IncidentPlace").val() + "&PrentTypeCode=" + PrentTypeCode + "&IsBigClass=" + $("#IsBigClass").val(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            var data1 = _Data;
                            varObjects1 = eval("(" + data1.replace(/\\/g, "/") + ")"); //转换为json对象
                            $('#treeDemo').tree('append', {
                                parent: node,
                                data: varObjects1
                            });
                        }
                        $('#treeDemo').tree('remove', $('#treeDemo').tree('find', '999').target);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    data: obj,
                    checkbox: false,
                    animate: false,
                    onLoadSuccess: function (node, data) {
                    },
                    onBeforeSelect: function (node) {
                        if (!$("#combotree").tree('isLeaf', node.target)) {
                            return false;
                        }
                    },
                    onExpand: function (node) {

                    }, onBeforeExpand: function (node) {
                        var Children = $('#treeDemo').tree('getChildren', node.target);
                        for (var i = 0; i < Children.length; i++) {
                            $('#treeDemo').tree('remove', Children[i].target);
                        }
                        $('#treeDemo').tree('append', {
                            parent: node.target,
                            data: [{
                                id: '999',
                                text: '加载中',
                                state: 'closed'
                            }]
                        });
                        var obj = InitLeftTreeAdd(node.attributes.TypeCode, node.target);
                    },
                    onDblClick: function (node) {
                        if ($('#treeDemo').tree('isLeaf', node.target)) {//判断
                            var result = new Object();
                            result["id"] = ",";
                            result["text"] = "";
                            result["code"] = "";
                            result["RatedWorkHour"] = "";
                            result["KPIRatio"] = "";
                            result["RatedWorkHour1"] = "";
                            result["KPIRatio1"] = "";
                            result["FullTypeName"] = "";
                            result["DealLimit"] = "";
                            result["DealLimit2"] = "";
                            result["DispLimit"] = "";
                            result["IsTouSu"] = "";
                            result["IndustryWarrantyTime"] = "";
                            result["id"] = node.attributes.CorpTypeID;
                            result["text"] = node.text;
                            result["code"] = node.attributes.TypeCode;
                            result["RatedWorkHour"] = node.attributes.TypeName + '(' + node.attributes.RatedWorkHour + ')';
                            result["KPIRatio"] = node.attributes.TypeName + '(' + node.attributes.KPIRatio + ')';
                            result["RatedWorkHour1"] = node.attributes.RatedWorkHour;
                            result["KPIRatio1"] = node.attributes.KPIRatio;
                            result["TypeName"] = node.attributes.TypeName;
                            result["DealLimit"] = node.attributes.DealLimit;
                            result["DealLimit2"] = node.attributes.DealLimit2;
                            result["DispLimit"] = node.attributes.DispLimit;
                            result["IsTouSu"] = node.attributes.IsTouSu;
                            result["IndustryWarrantyTime"] = node.attributes.IndustryWarrantyTime;
                            if (result["id"] == ',') {
                                result["id"] = "";
                            }
                            HDialog.ReturnIsJson = true;
                            HDialog.Close(result);
                        }
                    },
                    filter: function (q, node) {
                    }
                });
            }
            function DeleteChildren(id) {
                var $tree = $('#treeDemo');
                var node = $tree.tree('find', id);
                var childrenNodes = $tree.tree('remove', node.target);
                return childrenNodes;
            }

            function AddChildren(id) {
                var $tree = $('#treeDemo');
                var node = $tree.tree('find', id);
                var childrenNodes = $tree.tree('append', node.target);
                return childrenNodes;
            }
        </script>
    </form>
</body>
</html>
