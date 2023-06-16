<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentChoiceDlg.aspx.cs" Inherits="M_Main.DialogNew.EquipmentChoiceDlg" %>

<!DOCTYPE html>

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

        .ContainerLeft {
            float: left;
            overflow-y: auto;
        }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmFrom" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 1000px; height: 200px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">

                <tr class="tr">
                    <td class="TdTitle">设备名称</td>
                    <td class="TdContent">
                        <input id="EquipmentName" name="EquipmentName" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">设备编号</td>
                    <td class="TdContent">
                        <input id="EquipmentNO" name="EquipmentNO" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">设备品牌</td>
                    <td class="TdContent">
                        <input id="EBrand" name="EBrand" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">设备型号</td>
                    <td class="TdContent">
                        <input id="EModel" name="EModel" type="text" class="easyui-validatebox" /></td>
                </tr>

                <tr>
                    <td class="TdTitle">安装位置</td>
                    <td class="TdContent">
                        <input id="InstallPosition" name="InstallPosition" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">质保期限（年）</td>
                    <td class="TdContent">
                        <input id="WarrantyPeriod" name="WarrantyPeriod" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">安装单位</td>
                    <td class="TdContent">
                        <input id="InstallCompany" name="InstallCompany" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">厂家联系人</td>
                    <td class="TdContent">
                        <input id="ManufacturersPerson" name="ManufacturersPerson" type="text" class="easyui-validatebox" /></td>
                </tr>

                <tr class="tr">
                    <td class="TdTitle">厂家联系电话</td>
                    <td class="TdContent">
                        <input id="ManufacturersTel" name="ManufacturersTel" type="text" class="easyui-validatebox" /></td>
                    <td class="TdTitle">投运日期</td>
                    <td class="TdContent">
                        <input id="RunDate" name="RunDate" type="text" class="easyui-datebox" /></td>
                    <td class="TdTitle">设备状态</td>
                    <td class="TdContent">
                        <select id="Statue" name="Statue" style="border: 1px #cccccc solid; width: 100%;">
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

                    </td>
                </tr>
            </table>
        </div>

        <div class="ContainerLeft" id="divTree" style="width: 20%; overflow-x: hidden; float: left;">
            <ul id="treeDemo" class="easyui-tree">
            </ul>
        </div>
        <div style="width: 79%; overflow-x: hidden; float: right;">
            <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
            </div>
        </div>

        <input type="hidden" name="SpaceId" id="SpaceId" value="" />
        <input type="hidden" name="CommID" id="CommID" value="" runat="server" />
        <input type="hidden" id="ReturnValue" name="ReturnValue" />
        <input type="hidden" name="name" value="" id="TaskId" runat="server" />
        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#divTree").css({ "height": h + "px" });
                $("#TableContainer").css("height", h + "px");
            }


            function InitLeftTree() {
                $.tool.DataGet('CsEquipment', 'GetSpaceOrganTree', "ItemCode=" + $("#CommID").val() + "&DlgBaoShi=1",
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

                $("#SearchDlg").dialog("close");
            }
            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#treeDemo').tree({
                    data: obj,
                    onClick: function (node) {
                        zTreeOnClick(node.attributes.CommName, node.attributes.InPopedom, node.attributes.EntryCode, node.text);
                    }
                });
                if ($("#SpaceName").val() == "") {
                    $('#treeDemo').tree('collapseAll');
                }
            }

            function zTreeOnClick(Name, Id, Pid, text)//Pid存放父级编号
            {

                document.getElementById("SpaceId").value = Id;
                LoadList();
            }
            //选择设备系统
            function SelRankSys() {
                HDialog.Open('600', '450', '../DialogNew/RankListSys.aspx', '选择设备系统', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#EqId").val(varObjects.RankId);
                        $("#RankName").val(varObjects.RankName);
                    }
                });
            }

            //选择设备级别
            function SelRankLevel() {
                var eqId = "";
                HDialog.Open('600', '450', '../DialogNew/RankLevel.aspx?Id=' + eqId, '选择设备级别', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#RankId").val(varObjects.RankId);
                        $("#RankLevel").val(varObjects.RankName);
                    }
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



            var frozenColumns = [[
                { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true }
            ]];


            var column = [[
                { field: 'Id', title: 'Id', width: 25, align: 'left', sortable: true, hidden: true },

                { field: 'CommID', title: '项目ID', width: 30, align: 'left', hidden: true, sortable: true },

                { field: 'EqId', title: '设备系统ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'RankName', title: '设备系统', width: 100, align: 'left', sortable: true },

                { field: 'RankId', title: '设备级别ID', width: 30, align: 'left', hidden: true, sortable: true },
                { field: 'RankLevel', title: '设备级别', width: 100, align: 'left', sortable: true },

                { field: 'EquipmentName', title: '设备名称', width: 100, align: 'left', sortable: true },
                { field: 'EquipmentNO', title: '设备编号', width: 60, align: 'left', sortable: true },
                { field: 'EBrand', title: '设备品牌', width: 100, align: 'left', sortable: true },
                { field: 'InstallPosition', title: '设备位置', width: 60, align: 'left', sortable: true },
                { field: 'EModel', title: '设备型号', width: 60, align: 'left', sortable: true },
                {
                    field: 'RunDate', title: '投运日期', width: 80, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.RunDate, 'yyyy-MM-dd');
                        return str;
                    }
                },
                { field: 'Statue', title: '设备状态', width: 50, align: 'left', sortable: true }
            ]];

            var toolbar = [{
                text: '筛选',
                iconCls: 'icon-filter',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                    $("#RunDate").datebox('setValue', null);
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
                    rownumbers: true,
                    frozenColumns: frozenColumns,
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    border: false,
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {
                        $("#SearchDlg").dialog("close");
                    },
                    onClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;
                        HDialog.Close(rowData);
                    }
                });
            }
            InitTableHeight();

            LoadList();
            InitLeftTree();
        </script>
    </form>
</body>
</html>


