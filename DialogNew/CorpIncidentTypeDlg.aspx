<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpIncidentTypeDlg.aspx.cs" Inherits="M_Main.DialogNew.CorpIncidentTypeDlg" %>

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
        <input name="hiIncidentPlace" id="hiIncidentPlace" type="hidden" runat="server"/>

        <input name="CommID" id="CommID" type="hidden" runat="server"/>

        <div style="position: fixed;width:100% ">
            名称：<input id="CostName" style="height: 22px; width: 30%" size="18" name="CostName" runat="server" type="text"
                maxlength="100" />
            <input class="button" id="btnFilter" style="height: 30px" type="submit" value="查询" name="btnFilter"
                runat="server" onclick="javascript: btnFilter_OnClick();" />
            <input class="button" id="btnClear" style="height: 30px" onclick="javascript:btnClear_OnClick();"
                type="button" value="清空" name="btnClear" runat="server" />
            <input class="button" id="btnSave" style="height: 30px" onclick="javascript: btnSave_Onclick();"
                type="button" value="确定" name="btnSave" runat="server" />
        </div>
        <div style="height: 30px;"></div>
        <div>
            <ul id="treeDemo" style="width: 100%;" class="easyui-tree">
            </ul>
        </div>
        <script type="text/javascript">
        function  btnFilter_OnClick() {
            InitLeftTree();
        }

        function btnClear_OnClick() {
            CostName.value = "";
        }

        function btnSave_Onclick() {
            var ReturnValue = $("#treeDemo").tree('getChecked');
            var result = new Object();
            result["id"] = ",";
            result["text"] = "";
            result["code"] = "";
            result["RatedWorkHour"] = "";
            result["KPIRatio"] = "";
            result["RatedWorkHour1"] = "";
            result["KPIRatio1"] = "";
            result["FullTypeName"] = "";

            if ($("#isAll").val() == "") {
                $.each(ReturnValue, function (index, data) {
                    
                    if (data.attributes.IsTreeRoot != "2" && data.attributes.IsTreeRoot != 2) {
                        var value = result["id"];
                        result["id"] = value + data.attributes.TypeID + ",";
                        result["text"] = result["text"] + data.text + ',';
                        result["code"] = result["code"] + data.attributes.TypeCode + ',';
                        result["RatedWorkHour"] = result["RatedWorkHour"] + data.attributes.FullTypeName + '(' + data.attributes.RatedWorkHour + '),';
                        result["KPIRatio"] = result["KPIRatio"] + data.attributes.FullTypeName + '(' + data.attributes.KPIRatio + '),';

                        result["RatedWorkHour1"] = result["RatedWorkHour1"] + data.attributes.RatedWorkHour + ',';
                        result["KPIRatio1"] = result["KPIRatio1"] + data.attributes.KPIRatio + ',';

                        result["FullTypeName"] = result["FullTypeName"] + data.attributes.FullTypeName + ',';
                    }
                })
            }
            else {
                $.each(ReturnValue, function (index, data) {
                    if (data.attributes.IsTreeRoot != "2" && data.attributes.IsTreeRoot != 2) {
                        var value = result["id"];
                        result["id"] = value + data.attributes.CorpTypeID + ",";
                        result["text"] = result["text"] + data.text + ',';
                        result["code"] = result["code"] + data.attributes.TypeCode + ',';
                        result["RatedWorkHour"] = result["RatedWorkHour"] + data.attributes.FullTypeName + '(' + data.attributes.RatedWorkHour + '),';
                        result["KPIRatio"] = result["KPIRatio"] + data.attributes.FullTypeName + '(' + data.attributes.KPIRatio + '),';
                        result["RatedWorkHour1"] = result["RatedWorkHour1"] + data.attributes.RatedWorkHour + ',';
                        result["KPIRatio1"] = result["KPIRatio1"] + data.attributes.KPIRatio + ',';

                        result["FullTypeName"] = result["FullTypeName"] + data.attributes.FullTypeName + ',';

                    }
                })
            }
            
            if (result["id"] == ',') {
                result["id"] = "";
            }
            HDialog.ReturnIsJson = true;
            HDialog.Close(result);
        }

        $(document).ready(function () {
            InitLeftTree();
        });

            function InitLeftTree() {
            //alert($("#hiIncidentPlace").val());
                $.tool.DataGet('IncidentChoose', 'GetIncidentTypeList', 'hClassID=' + $("#hClassID").val() + '&CostName=' + encodeURI($("#CostName").val()) + "&isAll=" + $("#isAll").val() + "&IsEdit=" + $("#IsEdit").val() + "&IncidentPlace=" + $("#hiIncidentPlace").val() + "&CommID=" + $("#CommID").val(),
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
        function GetTree(obj) {
            $('#treeDemo').html("");
            $('#treeDemo').tree({
                data: obj,
                checkbox: true,
                animate:true,
                onLoadSuccess: function (node, data) {
                    $("#treeDemo").tree('doFilter','');
                },
                filter: function (q, node) {
                    var isDisplay = true;
                    if ((node.children != undefined && node.children.length == 0 && node.attributes.IsTreeRoot == 2) ||
                        (node.children == undefined && node.attributes.IsTreeRoot == 2)
                        ) {
                        isDisplay = false;
                    }
                    return isDisplay;
                }
            });
        }
       
        </script>
    </form>
</body>
</html>
