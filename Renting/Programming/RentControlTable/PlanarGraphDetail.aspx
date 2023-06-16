<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanarGraphDetail.aspx.cs" Inherits="M_Main.Renting.Programming.RentControlTable.PlanarGraphDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>规划管理-租控表图形设置-区块设置</title>
    <link href="/HM/M_Main/Jscript-Ui/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/themes/color.css" />
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.7.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/HM/M_Main/Jscript-Ui/jquery-easyui-1.4.4/jquery.extend.js"></script>
    <link href="/HM/M_Main/css/SystemBase/compatible.css" rel="stylesheet" />
    <script type="text/javascript" src="/HM/M_Main/jscript/self-vilidate.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/SystemBase/Utils.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/jquery.form.js"></script>
    <script type="text/javascript" src="/HM/M_Main/jscript/Guid.js"></script>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <input type="hidden" name="ID" id="ID" />
    <input type="hidden" name="Height" id="Height" value="100" />
    <input type="hidden" name="Width" id="Width" value="200" />
    <input type="hidden" name="PageX" id="PageX" value="0" />
    <input type="hidden" name="PageY" id="PageY" value="0" />
    <form id="mainForm" class="form-horizontal" role="form" style="overflow-y: auto;">
        <fieldset class="frame-fieldset">
            <legend class="frame-legend">平面图区域详情</legend>
            <div class="form-group">
                <label class="col-sm-2 col-xs-2 control-label">区块说明</label>
                <div class="col-sm-4 col-xs-4">
                    <input type="text" id="Text" name="Text" class="easyui-textbox" runat="server"
                        data-options="tipPosition:'bottom',width:'100%',required:false" />
                </div>
                <label class="col-sm-2 col-xs-2 control-label">区块颜色</label>
                <div class="col-sm-4 col-xs-4">
                    <input id="Color" name="Color" class="easyui-combobox"
                        data-options="editable:false,tipPosition:'bottom',panelHeight:'auto',width:'120px',multiple:false,valueField:'id',textField:'text',
                            data: [{id: 'rgb(255, 165, 0)',text: '橙色'},{id: 'rgb(255, 0, 0)',text: '红色'},{id: 'rgb(0, 0, 255)',text: '蓝色'}
                                  ,{id: 'rgb(0, 128, 0)',text: '绿色'},{id: 'rgb(159, 0, 153)',text: '紫色'},{id: 'rgb(255, 255, 0)',text: '黄色'}]"
                        runat="server" />
                </div>
            </div>
        </fieldset>
        <div style="height: 330px;">
            <div id="TableContainer" style="background-color: #cccccc; height: 100%; width: 100%;"></div>
        </div>
    </form>
    <div class="form-group" id="BtnDiv">
        <div class="col-sm-12 col-xs-12 fixed-tool-search" style="width: 100%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',width:80" onclick="Save();">保&nbsp;存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',width:100" onclick="PageClose();">关闭返回</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            InitPage();
        });

        function InitPage() {
            let param = $.getUrlParam();
            if (!!param.ID) {
                $("#ID").val(param.ID);
                InitData();
            } else {
                var guid = new GUID();
                $("#ID").val(guid.newGUID());
                $('#Color').combobox("setValue", "rgb(255, 165, 0)");
                InitDataGrid([]);//加载列表
            }
        }
        //初始化页面数据
        function InitData() {
            //获取值
            var PlanarGraphData = localStorage.getItem("PlanarGraphData");
            //设置值为空
            localStorage.setItem("PlanarGraphData", "");
            var ItemDataObj = JSON.parse(PlanarGraphData);
            $('#Text').textbox("setValue", ItemDataObj.Text);
            $('#Color').combobox("setValue", ItemDataObj.Color);
            ItemDataObj.ItemData = ItemDataObj.ItemData.replaceAll("'", '"');
            InitDataGrid($.parseJSON(ItemDataObj.ItemData));//加载列表

        }
        let column = [[
            { field: 'ck', checkbox: true },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'center' },
            { field: 'RoomName', title: '房屋名称', width: 180, align: 'center' },
            { field: 'BuildArea', title: '建筑面积', width: 80, align: 'center' }
        ]];

        var toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    SelectRoom();
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var rows = $("#TableContainer").datagrid("getChecked");
                    if (rows.length > 0) {
                        rows.forEach((ItemRow) => {
                            let RowIndex = $("#TableContainer").datagrid("getRowIndex", ItemRow);
                            $("#TableContainer").datagrid("deleteRow", RowIndex);
                        });
                    }
                    else {
                        $.messager.alert("温馨提示", '请勾选需要删除的数据!');
                    }
                }
            }
        ];

        function SelectRoom() {
            //选择房屋
            var param = {
                TreatyPlaningID: "",//合约规划ID
                IsOnTreatyPlaning: "是"//是否需要在合约中
            }
            LayerDialog.OpenWin('1000', '600', '/HM/M_Main/Renting/Dialog/RoomSelect.aspx?' + $.param(param), "选择房屋", true, function callback(_Data) {
                if (isValueNull(_Data)) {
                    let data = $.parseJSON(_Data);
                    let DataGridRows = $("#TableContainer").datagrid("getRows");
                    data.forEach((itemRow) => {
                        if (DataGridRows) {
                            let Node = DataGridRows.filter(function (e) {
                                return e.RoomID == itemRow.RoomID;
                            });
                            if (Node == null || Node.length == 0) {
                                $('#TableContainer').datagrid('insertRow', {
                                    index: 0,
                                    row: {
                                        ID: "",
                                        RoomID: itemRow.RoomID,
                                        RoomName: itemRow.RoomName,
                                        RoomSign: itemRow.RoomSign,
                                        BuildArea: itemRow.BuildArea
                                    }
                                });
                            }
                        } else {
                            $('#TableContainer').datagrid('insertRow', {
                                index: 0,
                                row: {
                                    ID: "",
                                    RoomID: itemRow.RoomID,
                                    RoomName: itemRow.RoomName,
                                    RoomSign: itemRow.RoomSign,
                                    BuildArea: itemRow.BuildArea
                                }
                            });
                        }
                    });
                }
            });
        }

        //加载列表
        function InitDataGrid(DataValue) {
            $("#TableContainer").datagrid({
                data: DataValue,
                //url: '/HM/M_Main/HC/DataPost.aspx',
                //method: "post",
                nowrap: false,
                fitColumns: true,
                fit: true,
                columns: column,
                rownumbers: true,
                checkOnSelect: true,
                selectOnCheck: false,
                singleSelect: true,
                border: true,
                pagination: false,
                width: "100%",
                toolbar: toolbar,
                onLoadSuccess: function (data) {
                }
            });
        }


        //保存页面数据
        function Save() {
            if ($('#mainForm').form("validate")) {
                let Rows = $("#TableContainer").datagrid("getRows");
                let RoomData = "[]";
                if (Rows.length > 0) {
                    RoomData = JSON.stringify(Rows);
                }
                let ReturnData = {
                    ID: $('#ID').val(),
                    Text: $('#Text').textbox("getValue"),
                    Color: $('#Color').combobox("getValue"),
                    Height: $('#Height').val(),
                    Width: $('#Width').val(),
                    PageX: $('#PageX').val(),
                    PageY: $('#PageY').val(),
                    ItemData: RoomData
                }
                LayerDialog.ReturnIsJson = true;
                LayerDialog.Close(ReturnData);
            }
        }

        function PageClose() {
            LayerDialog.Close("");
        }
    </script>
</body>
</html>
