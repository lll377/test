<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HousingStatusBrowse.aspx.cs" Inherits="M_Main.HouseNew.HousingStatusBrowse" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />

    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/jquery-datagird-extended.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
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
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 100%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <form id="FrmForm">
        <input type="hidden" id="SelAll" name="SelAll" runat="server" value="0" />
        <input type="hidden" id="SelRoomID" name="SelRoomID" value="" runat="server" />
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <input id="IsHis" name="IsHis" type="hidden" runat="server" />
        <input id="BuildSNums" type="hidden"
            size="1" name="BuildSNums" value="-1" runat="server" /><input id="hiBuildNames" type="hidden"
                size="1" name="hiBuildNames" runat="server" designtimedragdrop="492" />
        <input id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
        <input id="UnitSNums" type="hidden" size="1" name="UnitSNum" value="" runat="server" />
        <input id="FloorSNums" type="hidden" size="1" name="FloorSNums" value="" runat="server" />
        <input id="hiRoomID" name="hiRoomID" type="hidden" runat="server" />
        <%--        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft">
                <table id="RoomFrameTree" name="RoomFrameTree">
                    <tr>
                        <td valign="top">
                            <div id="LeftTop1" style="width: 100%; text-align: center;">
                                楼宇目录树
                            </div>
                            <div id="LeftTop2" style="width: 100%;">
                                楼宇： 
                                <input id="BuildNames" class="easyui-searchbox" style="width: 144px" searcher="SelBuild" data-options="editable:false"
                                    name="BuildNames" runat="server" />
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="BuildClear();">清空</a>
                                <br />
                                <select id="BuildSNum" name="BuildSNum" style="width: 144px; display: none" onchange="BuildSNumChange();" runat="server">
                                    <option></option>
                                </select>
                            </div>
                            <div id="LeftTop3">
                                <div>
                                    <label id="lbHint" runat="server"></label>
                                    <ul id="treeDemo" style="width: 100%; height: 310px" class="easyui-tree">
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>--%>
        <div id="ContainerRight" class="ContainerRight">
            <div>
                <div class="datagrid-toolbar" id="divtt">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>组团区域
                                <select id="RegionSNum" name="RegionSNum" runat="server">
                                    <option selected></option>
                                </select>
                            </td>
                            <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                            <td>房屋编号
                                <input type="text" class="easyui-validatebox" id="RoomSign" name="RoomSign"
                                    runat="server" /></td>
                            <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                            <td>交房状态
                                <select id="RoomState" name="RoomState" runat="server" data-options="editable:false">
                                    <option></option>
                                </select>
                            </td>
                            <td><a href="javascript:void(0)" onclick="LoadList(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                            <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                            <td><a href="javascript:void(0)" onclick="Save(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">设置房屋状态</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>

                        </tr>
                    </table>
                </div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>
        </div>
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input id="HBuildSNum" name="HBuildSNum" type="hidden" runat="server" />
        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            var h = $(window).height();
            var w = $(window).width();

            function SelBuild() {
                var varReturn;



                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx", '楼宇选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var BuildSNums = "";
                        var BuildNames = "";
                        $('#BuildSNums').val(BuildSNums);
                        $('#BuildNames').searchbox('setValue', BuildNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {
                                var d1 = varObjects[i].split(",")[0];
                                var d2 = varObjects[i].split(",")[1];

                                BuildSNums = BuildSNums + "," + varObjects[i].split(',')[0];
                                BuildNames = BuildNames + "," + varObjects[i].split(',')[1];
                            }

                        }
                        $('#BuildSNums').val(BuildSNums.substring(1, BuildSNums.length));
                        $('#BuildNames').searchbox('setValue', BuildNames.substring(1, BuildNames.length));


                        InitLeftTree();
                        LoadList();
                    }
                });

            }

            function BuildClear() {
                $('#BuildSNums').val('-1');
                $('#BuildNames').searchbox('setValue', '');

                InitLeftTree();
                LoadList();
            }

            function NodeItemClick(node) {
                // parent.$("#TableContainer").attr("src", "OrganCode=" + $("#LiveTypeName").val(node.attributes.LiveTypeName) + "&OpType=edit&CommID=" + $("#CommID").val(node.attributes.InPopedom));
                LoadList();
            }

            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width() * 0.25 - 1;
                $("#RoomFrameTree").css("width", w + "px");
                $("#RoomFrameTree").css("height", h + "px");
                $("#TableContainer").css("height", h + "px");
            }
            InitFunction();

            var column = [[
                {
                    field: 'ck', title: "<input type=\"CheckBox\" id=\"0\" issubmit = \"0\" onclick=\'SelCheck(this);\'>", align: 'left', sortable: false, formatter: function (value, row, rowIndex) {
                        return "<input type=\"CheckBox\"  id=\"" + row.RoomID + "\" data-ispro='" + row.BuildSNum + "p" + row.UnitSNum + "' issubmit = \"1\" onclick=\'SelCheck(this);\'>";
                    }
                },
                {
                    field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改房屋','update'," + row.RoomID + ");\">" + row.RoomSign + "</a>";
                        return str;
                    }
                },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'BuildArea', title: '建筑面积', width: 100, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
                { field: 'StateName', title: '交房状态', width: 100, align: 'left', sortable: true },
                {
                    field: 'ActualSubDate', title: '交房时间', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.ActualSubDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'FittingTime', title: '装修时间', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.FittingTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'StayTime', title: '入住时间', width: 100, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.StayTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'PayBeginDate', title: '缴费开始时间', width: 110, align: 'left', sortable: true,
                    formatter: function (value, row, index) {
                        var str = formatDate(row.PayBeginDate, "yyyy-MM-dd");
                        return str;
                    }
                }
            ]];

            var toolbar = [
                {
                    text: '设置房屋状态',
                    iconCls: 'icon-save',
                    handler: function () {
                        Save();

                    }
                }, '-',
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }
            ];

            function SelCheck(el) {
                var id = el.id;
                var ids = $('#SelRoomID').val();
                var selAll = $('#SelAll').val();
                var checked = $(el).is(':checked');
                if (id == 0) {
                    if (selAll == 0) {
                        $("input[issubmit*=1]").each(function (i) {
                            $(this).prop("checked", true);
                            if (ids.indexOf($(this).prop("id")) < 0) {
                                ids += "," + $(this).prop("id");
                            }
                        });
                    } else {
                        ids = "," + ids;
                        $("input[issubmit*=1]").each(function (i) {
                            $(this).prop("checked", false);
                            ids = ids.replace("," + $(this).prop("id"), "");
                        });
                    }
                } else {
                    if (checked) {
                        $(el).prop("checked", true);
                        if (ids.indexOf(id) < 0) {
                            ids += "," + id;
                        }

                    } else {
                        ids = "," + ids;
                        $(el).prop("checked", false);
                        ids = ids.replace("," + id, "");
                    }
                }

                if (ids.substr(0, 1) == ',') {
                    ids = ids.substr(1);
                }
                $('#SelRoomID').val(ids);
                CheckIsAll();
            }

            function CheckIsAll() {
                var isAll = 1;
                $("input[issubmit*=1]").each(function (i) {
                    if ($(this).is(':checked') == false) {
                        isAll = 0;
                    }
                });
                $('#SelAll').val(isAll);
            }

            //function SelCheck1(o) {
            //    var v = o.id;
            //    var v2 = $('#SelRoomID').val();
            //    var dd = $(o).attr("data-ispro");

            //    //if (dd.split('p')[1] == "0")
            //    //{
            //    //    dd = dd.split('p')[0];
            //    //}


            //    if (v == "l0") {

            //        if ($(o).is(':checked') == true) {

            //            $('#SelAll').val(1);
            //            $("input[issubmit*=1]").each(function (i) {

            //                if (dd.split('p')[0] == "0") {
            //                    $(this).prop("checked", true);
            //                    v2 = v2 + "," + $(this).prop("id");
            //                }
            //                else if (dd.split('p')[1] == "0") {

            //                    var d1 = $(this).attr("data-ispro");
            //                    if (d1 != undefined && d1 != "") {
            //                        var d2 = dd.split('p');
            //                        if (d1.split('p')[0] == d2[0]) {
            //                            $(this).prop("checked", true);
            //                            v2 = v2 + "," + $(this).prop("id");
            //                        }
            //                    }
            //                }
            //                else {
            //                    if ($(this).attr("data-ispro") == dd) {
            //                        $(this).prop("checked", true);
            //                        v2 = v2 + "," + $(this).prop("id");
            //                    }
            //                }
            //            });

            //        }
            //        else {

            //            $('#SelAll').val(0);
            //            $("input[issubmit*=1]").each(function (i) {
            //                $(this).prop("checked", false);
            //                var str = "," + $(this).prop("id");
            //                v2 = v2.replace(str, "");
            //            });
            //        }
            //        $('#0').prop("checked", false);

            //    } else {

            //        $("input[id*='" + v + "']").each(function (i) {
            //            if ($(o).is(':checked') == true) {
            //                $(this).prop("checked", true);
            //                v2 = v2 + "," + $(this).prop("id");
            //            }
            //            else {
            //                $(this).prop("checked", false);
            //                var str = "," + $(this).prop("id");
            //                v2 = v2.replace(str, "");
            //            }
            //        });

            //        $('#SelAll').val(0);
            //        $('#l0').prop("checked", false);
            //    }

            //    $('#SelRoomID').val(v2);
            //}

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Room&Command=waitsplitroomsearch&' + $('#FrmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: 50,
                    pageList: [50, 100, 200],
                    columns: column,
                    fitColumns: false,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    remoteSort: false,
                    rownumbers: true,
                    width: "100%",
                    toolbar: '#divtt',
                    border: false,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;

                        HDialog.Close(rowData);
                    },
                    onLoadSuccess: function (data) {
                        LoadChecked();
                    }
                });
                $("#SearchDlg").dialog("close");
                $("#Room").val();
                $("#FloorSNum").val();
            }


            function BuildSNumChange() {
                $('#HBuildSNum').val($('#BuildSNum').val());
                InitLeftTree();
                LoadList();
            }

            function Save() {
                var all = $('#SelAll').val();
                var SelRoomID = $('#SelRoomID').val();

                var SelAll = $("#SelAll").val();
                var SelRoomID = $("#SelRoomID").val();

                //alert(SelRoomID);
                SelAll = SelAll.substring(1, SelAll.length);
                //SelRoomID = SelRoomID.substring(1, SelRoomID.length);

                //alert(SelRoomID);

                //缓存
                Cache.SetData("SelAllRoom", SelAll);
                Cache.SetData("SelRoomID", SelRoomID);
                if (all == "0" || all == "") {
                    if (SelRoomID == "") {
                        HDialog.Info('请选择需要设置的房号');
                    }
                    else {

                        HDialog.Open('600', '400', '../HouseNew/HousingStatusSetting.aspx', '设置房屋状态', false, function callback(_Data) {
                            LoadList();
                        });
                    }
                }
                else {
                    HDialog.Open('600', '400', '../HouseNew/HousingStatusSetting.aspx', '设置房屋状态', false, function callback(_Data) {
                        LoadList();
                    });
                }
            }


            function ViewDetail(title, OpType, ID) {

                switch (OpType) {
                    case "update":
                        if (OpType == "update") {
                            //缓存
                            Cache.SetData("SelAllRoom", "");
                            Cache.SetData("SelRoomID", "");

                            HDialog.Open(w, h, '../HouseNew/RoomManage.aspx?RoomID=' + ID + "&OPType=update&back=HouseingStatusBrowse", title, false, function callback(_Data) {
                                if (_Data == "1") {
                                    LoadList();
                                }

                            });
                        }
                        break;
                    case "search":
                        HDialog.Open('900', '500', '../HouseNew/RoomStateHisBrowse.aspx?RoomID=' + ID, title, false, function callback(_Data) {
                            if (_Data == "1") {
                                LoadList();
                            }
                        });
                        break;

                }
            }


            function InitLeftTree() {
                $.tool.DataGet('Room', 'newbuildtree', $('#FrmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {

                            var stringArray = _Data.split("|");
                            if (stringArray[0] == "true") {
                                var data = stringArray[1];
                                varObjects = eval("(" + data.replace(/\\/g, "/") + ")"); //转换为json对象
                                GetTree(varObjects);
                            }
                            else { $('#lbHint').val(stringArray[1]); }

                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function GetTree(obj) {
                $('#treeDemo').html("");
                $('#HBuildSNum').val('');
                $("#UnitSNum").val('');
                $("#FloorSNum").val('');
                $('#treeDemo').tree({
                    data: obj,
                    onClick: function (node) {
                        //alert(node.attributes.LiveTypeName);
                        $("#HBuildSNum").val(node.attributes.BuildSNum);
                        $("#UnitSNum").val(node.attributes.UnitSNum);
                        $("#FloorSNum").val(node.attributes.FloorSNum);
                        $('#BuildSNums').val('');
                        LoadList();

                    },
                    onLoadSuccess: function (node, data) {
                        var t = $(this);
                        if (data) {
                            $(data).each(function (index, d) {
                                if (this.state == 'open') {
                                    var newvalue = document.getElementById("BuildSNum").value;
                                    if (newvalue < 1) {
                                    }
                                }
                            });

                        }
                    }
                });

            }

            //初始加载选中，保证翻页后不掉落其他页码已选择的房号
            function LoadChecked() {
                var roomIds = $('#SelRoomID').val();
                if (roomIds != '') {
                    var roomIdArr = roomIds.split(',');
                    for (var i = 0; i < roomIdArr.length; i++) {
                        if (document.getElementById(roomIdArr[i])) {
                            var el = document.getElementById(roomIdArr[i]);
                            $(el).prop("checked", true);
                        }
                    }
                }
                CheckIsAll();
            }

            $(document).ready(function () {
                InitLeftTree();
                LoadList();
            });

        </script>
    </form>
</body>
</html>

