<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelEquipmentByComm.aspx.cs" Inherits="M_Main.EquipmentNew.SelEquipmentByComm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>设备档案登记</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/QualityDictionaryCanNull.js"></script>
    <script type="text/javascript" src="../jscript/DateFormat.js"></script>
    <style type="text/css">
        .combobox-item {
            height: 25px;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 200px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">设备系统</td>
                    <td class="TdContent">
                        <select id="EqId" runat="server" clientidmode="Static" name="EqId" data-options=" multiple: true " class="easyui-combobox"
                            style="width: 148px; height: 23px;">
                            <option value=""></option>
                        </select>
                    </td>
                    <td class="TdTitle">设备级别</td>
                    <td class="TdContent">
                        <input id="RankName" name="RankName" type="text" class="easyui-validatebox" onclick="SelRank();" style="width: 100%; height: 21px;" />
                        <input type="hidden" name="RankId" id="RankId" value="" />
                    </td>
                    <td class="TdTitle">机房名称</td>
                    <td class="TdContent">
                        <input id="SpaceName" name="SpaceName" type="text" class="easyui-validatebox" onclick="SelSpace();" style="width: 120px;" />
                        <input type="hidden" id="SpaceId" name="SpaceId" value="" />
                    </td>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">设备名称</td>
                    <td class="TdContent">
                        <input id="EquipmentName" name="EquipmentName" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">设备状态</td>
                    <td class="TdContent">
                        <select id="Statue" name="Statue" style="border: 1px #cccccc solid; width: 120px;">
                            <option selected="selected"></option>
                            <option value="正常">正常</option>
                            <option value="停用">停用</option>
                            <option value="封存">封存</option>
                            <option value="报废">报废</option>
                        </select>
                    </td>
                </tr>
                <tr style="height: 10px;">
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="8" align="center"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="btnClear();">清空</a>
                    </td>
                </tr>
            </table>
        </div>

        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" name="name" value="" id="TaskId" runat="server" />
        <input type="hidden" name="CommID" value="" id="CommID" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();

            //设备级别
            function SelRank() {
                HDialog.Open('400', '450', '../EquipmentNew/SelRank.aspx', '选择设备级别', true, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#RankId").val(arrRet.id);
                    $("#RankName").val(arrRet.name);
                });
            }

            //设备空间名称
            function SelSpace() {
                var CommID = "";
                var eqId = "";
                HDialog.Open('600', '450', '../DialogNew/RankSpace.aspx?CommId=' + CommID + "&EqId=" + eqId, '选择设备机房', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#SpaceId").val(varObjects.SpaceId);
                        $("#SpaceName").val(varObjects.MacRoName);
                    }
                });
            }

            function btnClear() {
                $("#EqId").combobox("setValue", "");
                $("#RankId").val("");
                $("#RankName").val("");
                $("#SpaceId").val("");
                $("#SpaceName").val("");
                $("#EquipmentName").val("");
                $("#Statue").val("");
            }


            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'EquipmentId', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },

                { field: 'CommID', title: '项目ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'CommName', title: '项目名称', width: 50, align: 'left', sortable: true },

                { field: 'EqId', title: '设备系统ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'RankName', title: '设备系统', width: 30, align: 'left', sortable: true },

                { field: 'SpaceId', title: '机房ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'MacRoName', title: '机房名称', width: 50, align: 'left', sortable: true },

                { field: 'RankId', title: '设备级别ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'RankLevel', title: '设备级别', width: 40, align: 'left', sortable: true },

                { field: 'EquipmentName', title: '设备名称', width: 55, align: 'left', sortable: true },
                { field: 'EquipmentNO', title: '设备编号', width: 35, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '确定',
                    iconCls: 'icon-save',
                    handler: function () {
                        var row = $("#TableContainer").datagrid("getChecked");
                        var str = "";
                        if (row.length > 0) {
                            for (var i = 0; i < row.length; i++) {
                                str += "|" + row[i].EquipmentId + "," + row[i].EquipmentName + "," + row[i].EquipmentNO;
                            }
                            if (str.length > 0) {
                                str = str.substr(1, str.length - 1);
                            }
                        }
                        HDialog.Close(str);
                    }
                }
                , '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }];


            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsEquipment&Command=GetEquipmentList&' + $('#frmFrom').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: false,
                    singleChecked: false,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

        </script>
    </form>
</body>
</html>
