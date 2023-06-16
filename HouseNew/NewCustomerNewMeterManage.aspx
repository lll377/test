<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCustomerNewMeterManage.aspx.cs" Inherits="M_Main.HouseNew.NewCustomerNewMeterManage" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            width: 20%;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 80%;
            overflow: auto;
        }
    </style>

    <script type="text/javascript">

        $(function () {
            var setting1 = {
                treeId: 'ztrees',
                async: {
                    enable: true,
                    url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTree",
                    autoParam: ["Id", "IsJude", "RegionSNum", "BuildSNum", "UnitSNum", "FloorSNum"],
                    otherParam: ['selCommId', $("#CommID").val()]
                },
                callback: {
                    onClick: onClick
                }
            };
            $.fn.zTree.init($("#trees"), setting1, null);
        });

        function onClick(event, treeId, treeNode, clickFlag) {
            $('#RoomID').val(treeNode.RoomID);
            if (treeNode.RegionSNum != undefined) {
                $('#RegionSNum').val(treeNode.RegionSNum);
            }
            if (treeNode.BuildSNum != undefined) {
                $('#BuildSNum').val(treeNode.BuildSNum);
            }
            if (treeNode.UnitSNum != undefined) {
                $('#UnitSNum').val(treeNode.UnitSNum);
            }
            if (treeNode.FloorSNum != undefined) {
                $('#FloorSNum').val(treeNode.FloorSNum);
            }

            $('#RoomID').val(treeNode.RoomID);
            var roomsign = '';

            if (treeNode.RoomID != '0' && treeNode.RoomID != '') { roomsign = treeNode.BuildTreeName; }
            toolbar = [
                {
                    text: '房号：' + treeNode.name

                }, {

                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($('#RoomID').val() == '0' || $('#RoomID').val() == '') {
                            HDialog.Info('请选择房号');
                        }
                        else {

                            ViewDetail('新增房间表计', 'Insert', $('#RoomID').val(), 0);
                        }
                    }
                }, {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        if ($('#RoomID').val() == '0' || $('#RoomID').val() == '') {
                            HDialog.Info('请选择房号');
                        }
                        else {
                            var row = $("#TableContainer").datagrid("getSelected");
                            DelRecord(row.MeterID);
                        }
                    }
                }
            ];
            LoadList();
            $('#RegionSNum').val('');
            $('#BuildSNum').val('');
            $('#UnitSNum').val('');
            $('#FloorSNum').val('');
        }

        function SelRommSign() {
            var SelRoomSign = $('#RoomSign').searchbox('getValue');
            var strCommID = $("#CommID").val();
            var setting = null;
            if (SelRoomSign == "") {
                setting = {
                    treeId: 'ztrees',
                    async: {
                        enable: true,
                        url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTree",
                        autoParam: ["Id", "IsJude", "RegionSNum", "BuildSNum", "UnitSNum", "FloorSNum"],
                        otherParam: ['selCommId', $("#CommID").val()]
                    },
                    callback: {
                        onClick: onClick
                    }
                };
            }
            else {
                setting = {
                    treeId: 'ztrees',
                    async: {
                        enable: true,
                        url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTreeByRoomSign",
                        otherParam: {
                            "RoomSign": function () { return SelRoomSign; },
                            "selCommId": function () { return strCommID; }
                        }
                    },
                    callback: {
                        onClick: onClick
                    }
                };
            }
            $.fn.zTree.init($("#trees"), setting, null);
        }

    </script>

</head>
<body>
    <form id="FrmForm" runat="server">
        <input id="hiCommID" type="hidden" name="hiCommID" runat="server" />

        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft">
                <table id="RoomFrameTree" name="RoomFrameTree">
                    <tr>
                        <td valign="top">
                            <input type="text" id="RoomSign" class="easyui-searchbox" data-options="prompt:'请输入房号',searcher:SelRommSign" />
                            <div id="trees" class="ztree" runat="server">
                            </div>
                            <div id="LeftTop1" style="width: 100%; text-align: center; display: none">
                                楼宇目录树
                            </div>
                            <div id="LeftTop2" style="width: 100%; display: none">
                                楼宇：
                              <asp:DropDownList ID="SelBuildSNum" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelBuildSNum_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div id="LeftTop3" style="display: none">
                                <div>
                                    <asp:Label ID="lbHint" runat="server"></asp:Label>
                                    <div id="treeDemo" class="ztree" runat="server">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>
        </div>

        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="RoomID" name="RoomID" />
        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="BuildSNum" name="BuildSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width() - $('#ContainerLeft').width() - 2;

                $("#TableContainer").css("height", h + "px");
                $("#ContainerLeft").css("height", h + "px");
                $("#ContainerRight").css("width", w + "px");
            }
            InitFunction();

            var toolbar = [

                {
                    text: '房号：'

                }, {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        if ($('#RoomID').val() == '0' || $('#RoomID').val() == '') {
                            HDialog.Info('请选择房号');
                        }
                        else {
                            ViewDetail('新增房间表计', 'Insert', $('#RoomID').val());
                        }
                    }
                }, {
                    text: '删除',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        if ($('#RoomID').val() == '0' || $('#RoomID').val() == '') {
                            HDialog.Info('请选择房号');
                        }
                    }
                }
            ];



            var column = [[


                { field: 'MeterID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
                {
                    field: 'MeterSign', title: '表计序号', width: 50, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改房间表计','edit'," + row.RoomID + "," + row.MeterID + ");\">" + row.MeterSign + "</a>";
                        return str;
                    }
                },
                { field: 'MeterName', title: '表计名称', width: 100, align: 'left', sortable: true },
                { field: 'MeterBoxName', title: '表箱名称', width: 100, align: 'left', sortable: true },
                { field: 'InstallLocation', title: '安装位置', width: 100, align: 'left', sortable: true },
                { field: 'BoxNumber', title: '转表基数', width: 100, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '表计类型', width: 100, align: 'left', sortable: true },
                //{
                //    field: 'StatisticsType', title: '统计类型', width: 100, align: 'left', sortable: true,
                //    formatter: function (value, row, index) {
                //        var str = "";
                //        switch (row.StatisticsType) {
                //            case '1':
                //                str = '商户';
                //                break;
                //            case '2':
                //                str = '合作单位';
                //                break;
                //            case '3':
                //                str = '施工单位';
                //                break;
                //        }
                //        return str;
                //    }
                //},
                { field: 'InitAmount', title: '初始读数', width: 100, align: 'left', sortable: true },
                { field: 'Ratio', title: '变比', width: 100, align: 'left', sortable: true },
                { field: 'StanName', title: '标准名称', width: 100, align: 'left', sortable: true },
                { field: 'StanAmount', title: '单价', width: 100, align: 'left', sortable: true }
                //{
                //    field: 'IsDamage', title: '是否损坏', width: 100, align: 'left', sortable: true,
                //    formatter: function (value, row, index) {
                //        var str = "";
                //        if (row.IsDamage == "1") { str = "是"; } else { str = "否"; }
                //        return str;
                //    }
                //}
            ]];


            function LoadList() {


                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "CustMeter", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                    }
                });

            }
            LoadList();


            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Meter', 'CustMeterDelete', 'MeterID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                var Data = _Data.split("|");
                                if (Data[0] == "true") {
                                    HDialog.Info('删除成功');
                                }
                                else { HDialog.Info(Data[1]); }
                                LoadList();


                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            function ViewDetail(title, OpType, RoomID, MeterID) {
                var w = 700;
                var h = 300;

                HDialog.Open(w, h, '../HouseNew/MeterManage.aspx?RoomID=' + RoomID + '&OpType=' + OpType + '&MeterID=' + MeterID, title, false, function callback(_Data) {
                    LoadList();
                });
            }
        </script>
    </form>
</body>
</html>
