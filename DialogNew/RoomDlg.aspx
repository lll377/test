<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomDlg.aspx.cs" Inherits="M_Main.DialogNew.RoomDlg" %>

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
            width: 75%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <form id="FrmForm">
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <input id="IsHis" name="IsHis" type="hidden" runat="server" />
           <input id="BuildSNums"  type="hidden"
            size="1" name="BuildSNums" value="-1" runat="server"/><input id="hiBuildNames"  type="hidden"
                size="1" name="hiBuildNames" runat="server" designtimedragdrop="492"/>
        <input  id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />

        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft">
                <table id="RoomFrameTree" name="RoomFrameTree">
                    <tr>
                        <td valign="top">
                            <div id="LeftTop1" style="width: 100%; text-align: center;">
                                楼宇目录树
                            </div>
                            <div id="LeftTop2" style="width: 100%;">
                                楼宇： 
                                <input id="BuildNames"  class="easyui-searchbox" style="width:144px" searcher="SelBuild" data-options="editable:false"
                             name="BuildNames" runat="server" />
                                 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="BuildClear();" >清空</a>
                                <br />
                        <select id="BuildSNum" name="BuildSNum"  style="width:144px;display:none"   onchange="BuildSNumChange();" runat="server">
                            <option></option>
                        </select>
                            </div>
                            <div id="LeftTop3">
                                <div>
                                    <label id="lbHint" runat="server"></label>
                                    <ul id="treeDemo" style="width: 100%;height:310px" class="easyui-tree">
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div id="ContainerRight" class="ContainerRight">
            <div>
                <div class="datagrid-toolbar" id="divtt">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td>房屋编号<input type="text" class="easyui-validatebox" id="RoomSign" name="RoomSign"
                                            runat="server" /></td>
                             <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                            <td>房屋名称<input type="text" class="easyui-validatebox" id="RoomName" name="RoomName"
                                            runat="server" /></td>
                            <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                            <td><a href="javascript:void(0)" onclick="LoadList(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a></td>
                            <td>
                                <div class="datagrid-btn-separator"></div>
                            </td>
                    
                        </tr>
                    </table>
                </div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>
        </div>
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server"/>
        <input id="HBuildSNum" name="HBuildSNum" type="hidden" runat="server" />
        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


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

            function BuildClear()
            {
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
                    { field: 'RoomSign', title: '房屋编号', width: 250, align: 'left', sortable: true },
                    { field: 'CustName', title: '客户名称', width: 250, align: 'left', sortable: true },
                    { field: 'BuildArea', title: '建筑面积', width: 250, align: 'left', sortable: true },
                    { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');
                     }
                 }
            ];

            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Room&Command=waitsplitroomsearch&' + $('#FrmForm').serialize(),
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: '#divtt',
                    border:false,
                    sortOrder: "asc",
                    onDblClickRow: function (rowIndex, rowData) {
                        HDialog.ReturnIsJson = true;

                        HDialog.Close(rowData);
                    },
                    onLoadSuccess: function (data) {

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
                        // $('#trees').combotree('tree').tree("expandAll").tree(
                        // "collapseAll");
                        var t = $(this);
                        if (data) {
                            $(data).each(function (index, d) {
                                if (this.state == 'open') {
                                    // t.tree('collapseAll');

                                    var newvalue = document.getElementById("BuildSNum").value;
                                    if (newvalue < 1) {
                                       // t.tree("collapseAll");
                                    }
                                }
                            });

                        }
                    }
                });
              
            }

            $(document).ready(function () {
              

                InitLeftTree();
                LoadList();
            });

        </script>
    </form>
</body>
</html>
