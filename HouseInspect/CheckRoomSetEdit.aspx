<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckRoomSetEdit.aspx.cs" Inherits="M_Main.HouseInspect.CheckRoomSetEdit" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>设置责任单位</title>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/editcss.css" type="text/css" rel="stylesheet" />

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" language="javascript" src="../jscript/JSClient.js"></script>
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <link href="../css/workflow.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/HouseInspectDictionaryCanNull.js"></script>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden;">
    <form id="FrmForm" runat="server">
       
       

        <input type="hidden" id="Index" name="Index" />

        <input id="GridData" name="GridData" type="hidden" />

        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 600px; height: 120px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">房间类型:</td>
                    <td class="TdContent">
                        <select id="RoomType" name="RoomType" data-options="required:true" isdctype='true' dctype="房间类型" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 204px">
                        </select>
                    </td>
                    <td class="TdTitle">房间名称:</td>
                    <td class="TdContent">
                        <input id="HouseName" name="HouseName" type="text" class="easyui-validatebox" style="border: 1px #cccccc solid; width: 200px;" data-options="required:true" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="clear();">清空</a>
                    </td>
                </tr>
            </table>

        </div>
        <div style="width: 100%;background-color: #cccccc;height:500px" id="TableContainer">
        </div>
         <input type="hidden" id="CommId" name="CommId" runat="server" />
        <input id="RoomIDs" type="hidden" name="RoomIDs" runat="server" />
        <input type="hidden" id="BuildID" name="BuildID" runat="server" />
        <input id="ObjectID" type="hidden" name="ObjectID" runat="server" />
         <input id="CheckRoomDefinitionID" type="hidden" name="CheckRoomDefinitionID" runat="server" />
        <%--全选--%>
        <input type="hidden" id="CheckAll" name="CheckAll" value="0" runat="server" />
        <%--<script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>--%>
        <script type="text/javascript" src="../jscript/Cache.js"></script>
        <script>
            function load() {
                $("#CommId").val(Cache.GetData("CommID"))

                //$("#RoomIDs").val(Cache.GetData("RoomIDs"))
                $("#CheckAll").val(Cache.GetData("CheckAll"))

                var rows = Cache.GetData("rows");
                var arrRet = JSON.parse(rows);

                var RoomID = "";
                var BuildID = "";
                for (var i = 0; i < arrRet.length; i++) {
                    RoomID += arrRet[i].RoomID + ",";
                    BuildID += arrRet[i].BuildID + ",";
                }
                $("#RoomIDs").val(RoomID)
                $("#BuildID").val(BuildID)
            }
            load();

            function clear() {
                $("#RoomType").val("");
                $("#HouseName").val("");
            }

            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Id', title: 'Id', align: 'left', sortable: true, hidden: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                {
                    field: 'HouseName', title: '房间名称', width: 70, align: 'left', sortable: true
                },
                { field: 'RoomTypeName', title: '房间类型', width: 40, align: 'left', sortable: true },
                { field: 'Remark', title: '备注', width: 50, align: 'left', sortable: true }
            ]];

            var toolbar = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"));
                        $('#SearchDlg').dialog('open');
                    }
                }, '-',
                {
                    text: '保存',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($("#CheckRoomDefinitionID").val() == "") {
                            HDialog.Info("请选择房屋!");
                            return;
                        }
                        Save();
                    }
                }

            ];

            function Save() {
                //拿到缓存中的筛选条件 
                var CheckAllData = Cache.GetData("RegionSNum") + "|";
                CheckAllData = CheckAllData + Cache.GetData("BuildSNum") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomIDs") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomModel") + "|";
                CheckAllData = CheckAllData + Cache.GetData("PropertyUses") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomType") + "|";
                CheckAllData = CheckAllData + Cache.GetData("RoomState") + "|";
                CheckAllData = CheckAllData + Cache.GetData("BuildStartArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("BuildEndArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("InteriorStartArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("InteriorEndArea") + "|";
                CheckAllData = CheckAllData + Cache.GetData("ContSubStartDate") + "|";
                CheckAllData = CheckAllData + Cache.GetData("ContSubEndDate") + "|";
                CheckAllData = CheckAllData + Cache.GetData("GetHouseStartDate") + "|";
                CheckAllData = CheckAllData + Cache.GetData("GetHouseEndDate");


                $.tool.DataPost('CsHouseInspect', 'SaveCheckRoomSet', 'CommId=' + $("#CommId").val() + '&RoomIDs=' + $("#RoomIDs").val() + '&BuildID=' + $("#BuildID").val() + '&CheckRoomDefinitionID=' + $("#CheckRoomDefinitionID").val() + '&CheckAll=' + $("#CheckAll").val() + "&CheckAllData=" + CheckAllData,
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Info(_Data);
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            };


            function LoadList() {
                $("#TableContainer").datagrid({
                    //url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=CsHouseInspect&Command=GetCheckRoomDefinitionList&' + $('#FrmForm').serialize(),
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    title: '',
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    checkOnSelect: false,
                    selectOnCheck: false,
                    singleSelect: true,
                    columns: column,
                    fitColumns: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    border: false,
                    onClickRow: function (rowIndex, rowData) {
                        param = $.JQForm.GetParam("CsHouseInspect", "GetCheckRoomDefinitionList", "TableContainer", param);
                    },
                    onCheck: function (rowIndex, rowData) {
                        var Roomid = $("#CheckRoomDefinitionID").val();
                        Roomid += rowData.Id + ",";
                        $("#CheckRoomDefinitionID").val(Roomid);
                    },
                    onUncheck: function (rowIndex, rowData) {
                        var kk = $("#CheckRoomDefinitionID").val();
                        var ff = "";
                        var jj = new Array();
                        jj = kk.split(',');
                        if (jj.length > 1) {
                            for (var i = 0; i < jj.length - 1; i++) {
                                if (jj[i] != rowData.Id) {
                                    ff += jj[i] + ",";
                                }
                            }
                        } else {
                            ff = "";
                        }

                        $("#CheckRoomDefinitionID").val(ff);
                    },
                    onCheckAll: function (rows) {
                        var data = "";
                        for (var i = 0; i < rows.length; i++) {
                            data += rows[i].Id + ",";
                        }
                        $("#CheckRoomDefinitionID").val(data);
                    },
                    onUncheckAll: function (rows) {

                        $("#CheckRoomDefinitionID").val("");
                    }
                });
                $("#SearchDlg").dialog("close");
            }
            LoadList();

            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        </script>
    </form>
</body>
</html>
