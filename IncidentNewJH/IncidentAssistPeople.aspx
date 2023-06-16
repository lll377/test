<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentAssistPeople.aspx.cs"
    Inherits="M_Main.IncidentNewJH.IncidentAssistPeople" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
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

    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <link href="../css/workflow.css" type="text/css" rel="stylesheet" />
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">
        <input type="hidden" name="TrainObject" value="" id="TrainObject" />
        <input type="hidden" name="TrainObjectId" value="" id="TrainObjectId" />
        <input type="hidden" name="TrainObjectName" value="" id="TrainObjectName" />
        <input type="hidden" id="TrainObjectDepCode" name="TrainObjectDepCode" runat="server" />
        <input type="hidden" id="TrainObjectSortDepCode" name="TrainObjectSortDepCode" runat="server" />
        <input type="hidden" name="hidIsSingle" value="0" id="hidIsSingle" />
        <input type="hidden" name="TrainObject" value="" id="Hidden1" />
        <input type="hidden" name="hidcheck" value="" id="hidcheck" />
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 150px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td style="width: 210px;">姓名：
                        <input class="easyui-textbox" type="text" name="UserName" id="UserName" style="border: 1px #cccccc solid" />
                    </td>
                </tr>
                <tr style="height: 10px;">
                </tr>
                <tr style="height: 50px;">
                    <td colspan="8" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="SearchClose"
                            onclick="LoadList()">确定筛选</a> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'"
                                id="A1" onclick="Clear()">清空</a>
                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>

        <input type="hidden" id="seletedDepCode" name="seletedDepCode" runat="server" />
        <input type="hidden" id="DepCode" name="DepCode" runat="server" />
        <input type="hidden" id="SelRoleCode" name="SelRoleCode" runat="server" />
        <input type="hidden" id="SortDepCode" name="SortDepCode" runat="server" />
        <input type="hidden" id="DepName" name="DepName" runat="server" />
        <input type="hidden" id="SelReturn" name="SelReturn" runat="server" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" id="BigCorpTypeID" name="BigCorpTypeID" runat="server" />
        <input type="hidden" id="IsAssignedBatch" name="IsAssignedBatch" runat="server" value="1" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            //选择岗位信息
            function onRoleCode() {
                HDialog.OpenAtPos('370', '300', "../PersonnelManage/SelRole.aspx?Ram=" + Math.random(), '选择', false, function callback(_Data) {
                    if (_Data != '') {
                        var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")");
                        $("#RoleCode").val(varObjects[0].Code);
                        $("#RoleName").val(varObjects[0].TypeName);
                    }
                }, "400px", "100px");
            }


            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h - 2 + "px");
            }

            InitTableHeight();
            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'UserName', title: '员工姓名', width: 40, align: 'left', sortable: true },
                {
                    field: 'EmployeeStatus', title: '状态', width: 40, align: 'left', sortable: true
                },
                {
                    field: 'EmployeeProfession', title: '工种', width: 40, align: 'left', sortable: true
                },
                { field: 'RoleName', title: '通用岗位', width: 160, align: 'left', sortable: true },
                { field: 'NotOverNum', title: '处理中任务数', width: 100, align: 'left', sortable: true },
                {
                    field: 'ClockLocation', title: '当前位置', width: 100, align: 'left', sortable: true
                }
            ]];

            var toolbar = [
                {
                    text: '保存',
                    iconCls: 'icon-save',
                    handler: function () {
                        OnClickSave();
                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-filter',
                    handler: function () {
                        OnClickFilter();
                    }
                }
            ];

            function Clear() {
                document.getElementById("Name").value = "";
            }

            function OnClickFilter() {
                $('#SearchDlg').parent().appendTo($("form:first"));
                $('#SearchDlg').dialog('open');
            }

            function OnClickSave() {
                var objectId = document.getElementById("TrainObjectId").value;
                var objectName = document.getElementById("TrainObjectName").value;
                if (objectId != "") {
                    HDialog.Close(objectName + ',' + objectId);
                }

                var arrId = document.getElementById("TrainObject").value.split('|');
                var TrainObjectList = "";
                for (var i = 0; i < arrId.length; i++) {
                    if (TrainObjectList == "")
                        TrainObjectList = arrId[i];
                    else
                        TrainObjectList += "|" + arrId[i];
                }
                HDialog.Close(TrainObjectList);
            }

            //设置上下页改变之后选中的值还在
            function SetCheckboxValue() {
                var trainValue = document.getElementById("TrainObject").value;

                if (trainValue.length > 0) {
                    var rows = $('#TableContainer').datagrid("getRows");
                    $.each(rows, function (index, item) {
                        if (trainValue.indexOf(item.Id) > 0) {
                            $('#TableContainer').datagrid("checkRow", index);
                        }
                    });
                }
            }


            function LoadList() {
                var isSingle = GetQueryString("IsSingle");
                var singleSelect = false;
                if (isSingle == 1) {
                    singleSelect = true;
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=IncidentDealMan&' + $('#frmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 20,
                    pageList: [20, 50, 100],
                    columns: column,
                    fitColumns: true,
                    singleSelect: singleSelect,
                    pagination: true,
                    border: 0,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        if (data.rows.length > 0) {
                            SetCheckboxValue();
                        }
                    },
                    onDblClickRow: function (rowIndex, rowData) {
                        document.getElementById("TrainObjectId").value = rowData.UserCode;
                        document.getElementById("TrainObjectName").value = rowData.UserName;

                        OnClickSave();
                    },
                    onCheck: function (rowIndex, rowData) {
                        document.getElementById("TrainObject").value = document.getElementById("TrainObject").value
                            + "|" + rowData.UserName + "," + rowData.UserCode;
                    },
                    onUncheck: function (rowIndex, rowData) {

                        var ss = document.getElementById("TrainObject").value.split('|');

                        for (var i = 0; i < ss.length; i++) {
                            if (ss[i].indexOf(rowData.Id) >= 0) {
                                ss.splice(i, 1);
                            }
                        }
                        valu = "";
                        for (var i = 0; i < ss.length; i++) {
                            valu += "|" + ss[i];
                        }

                        document.getElementById("TrainObject").value = valu.substr(1, valu.length);
                    },
                    onCheckAll: function (rows) {

                        document.getElementById("TrainObject").value = "";
                        for (var i = 0; i < rows.length; i++) {
                            document.getElementById("TrainObject").value = document.getElementById("TrainObject").value + "|" + rows[i].UserName + "," + rows[i].UserCode;
                        }

                    },
                    onUncheckAll: function (rows) {
                        document.getElementById("TrainObject").value = "";
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadList();


        </script>
    </form>
</body>
</html>
