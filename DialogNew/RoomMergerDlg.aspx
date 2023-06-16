<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomMergerDlg.aspx.cs" Inherits="M_Main.DialogNew.RoomMergerDlg" %>


<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
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
    <form id="FrmForm" runat="server">
        <input id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input id="AllCheck" size="1" type="hidden" name="AllCheck" runat="server"  />
        <input type="hidden" id="pdlist" name="pdlist" value="" />


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
                            <select id="BuildSNum" name="BuildSNum"  style="width:144px" onchange="BuildSNumChange();" runat="server">
                            <option></option>
                        </select>
                            </div>
                            <div id="LeftTop3">
                                <div>
                                    <label id="Label1" runat="server"></label>
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
               
                <div style="width: 100%;" id="TableContainer">
                </div>
            </div>
        </div>

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
                     <td><a href="javascript:void(0)" onclick="CheckRoom(); " class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">确认选择</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a></td>
                   <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>
                </tr>
            </table>
        </div>
        

        <input type="hidden" id="CommID" name="CommID" />

        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />
        <input type="hidden" id="HBuildSNum" name="HBuildSNum" />

        <script language="javascript" src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            function NodeItemClick(node) {
                document.getElementById("AllCheck").value = "";
                LoadData(1, 15);
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

                       { field: 'ck', checkbox: true },
                         {
                             field: 'IsSplitUnite', title: '', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                                 var IsSplitUnite = value;
                                 var values = ""
                                 switch (IsSplitUnite) {
                                     case "0":
                                         values = "";
                                         break;

                                     case "1":

                                         values = "<font color='red'>已拆分</font>";
                                         break;
                                     case "3":
                                         values = "<font color='green'>已合并</font>";
                                         break;

                                 }
                                 if (row.cLiveType2 == 2)
                                 {
                                     values = "<font color='black'>已出租</font>";
                                 }
                                 return values;
                             }
                         },
                        { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
                        { field: 'RoomName', title: '房屋名称', width: 200, align: 'left', sortable: true },
                        { field: 'BuildArea', title: '建筑面积', width: 150, align: 'left', sortable: true },
                        { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true }


            ]];

            function CheckRoom()
            {
                if ($('#AllCheck').val() == '') {
                    HDialog.Info('请选择要合并房号!');
                    return false;
                }
                else {
                    var value = $('#AllCheck').val();
                    HDialog.Close(value);
                }
            }

            var toolbar = [
                {
                    text: '确定选择',
                    iconCls: 'icon-save',
                    handler: function () {
                       
                    }

                },
                 {
                     text: '筛选',
                     iconCls: 'icon-search',
                     handler: function () {
                         $('#SearchDlg').parent().appendTo($("form:first"))
                         $('#SearchDlg').dialog('open');
                     }

                 }
            ];

            function LoadData(page, rows) {
                $.tool.DataPost2('Room', 'waitmergerroomsearch', "page=" + page + "&rows=" + rows + "&" + $('#FrmForm').serialize(),
               function Init() {
               },
               function callback(_Data) {
                   var Data = eval("(" + _Data + ")"); //转换为json对象

                   LoadList(Data);
                   SetCheckboxValue();
               },
               function completeCallback() {
               },
               function errorCallback() {
               });


            }



            function LoadList(_Data) {
                $("#TableContainer").datagrid({
                    url: '',
                    data: _Data,
                    method: "get",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: [50],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    border: false,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: '#divtt',
                    border: false,
                    sortOrder: "asc",
                    selectOnCheck: false,
                    checkOnSelect: false,
                    onLoadSuccess: function (data) {

                        var pg = $("#TableContainer").datagrid("getPager");
                        if (pg) {
                            $(pg).pagination({
                                onBeforeRefresh: function () {

                                },
                                onRefresh: function (pageNumber, pageSize) {

                                },
                                onChangePageSize: function () {
                                },
                                onSelectPage: function (Pn, Ps) {

                                    LoadData(Pn, Ps);
                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;
                                }
                            });
                        }

                        if (data.rows.length > 0) {
                            for (var i = 0; i < data.rows.length; i++) {
                                if (data.rows[i].IsSplitUnite == "1" || data.rows[i].IsSplitUnite == "3" || data.rows[i].cLiveType2 == "2") {
                                    $("input[type='checkbox']")[i + 1].disabled = true;
                                }

                            }
                        }
                    },
                    onCheck: function (rowIndex, rowData) {
                         var Data = JSON.stringify(rowData);

                        document.getElementById("AllCheck").value = document.getElementById("AllCheck").value + "," + Data;
                        if (document.getElementById("AllCheck").value.substr(0,1)==",")
                        document.getElementById("AllCheck").value = document.getElementById("AllCheck").value.substr(1, document.getElementById("AllCheck").value.length - 1);
                    },
                   
                    onUncheck: function (rowIndex, rowData) {
                        var ss = document.getElementById("AllCheck").value;
                        var Data = JSON.stringify(rowData);
                        if (ss.indexOf(Data) > -1)
                        {
                            ss = ss.replace(Data, "");
                            
                        }
                        document.getElementById("AllCheck").value = ss;
                        if (document.getElementById("AllCheck").value.substr(0, 1) == ",")
                        document.getElementById("AllCheck").value = document.getElementById("AllCheck").value.substr(1, document.getElementById("AllCheck").value.length - 1);
                    },
                    onCheckAll: function (rows) {

                        $("input[type='checkbox']").each(function (index, el) {
                            var Data = JSON.stringify(rows[index]);
                            if (el.disabled) {
                                $(el).removeAttr("checked");
                            }
                        });

                        var rows = $('#TableContainer').datagrid("getChecked");
                        $.each(rows, function (index, item) {
                            var Data = JSON.stringify(item);
                            var ss = document.getElementById("AllCheck").value;
                            if (ss.indexOf(Data) < 0) {

                                if (Data.IsSplitUnite != 1 || Data.IsSplitUnite != 3 || Data.cLiveType2 != 2) {
                                    document.getElementById("AllCheck").value = document.getElementById("AllCheck").value + "," + Data;
                                }
                            }
                        });
                        if (document.getElementById("AllCheck").value.substr(0, 1) == ",")
                        document.getElementById("AllCheck").value = document.getElementById("AllCheck").value.substr(1, document.getElementById("AllCheck").value.length - 1);
                       
                    },
                    onUncheckAll: function (rows)
                    {
                        var ss = document.getElementById("AllCheck").value;
                     
                        $.each(rows, function (index, item) {
                            var Data = JSON.stringify(item);

                            if (ss.indexOf(Data) > -1) {
                                ss = ss.replace(Data, "");
                            }
                            document.getElementById("AllCheck").value = ss;
                        });
                        if (document.getElementById("AllCheck").value.substr(0, 1) == ",")
                        document.getElementById("AllCheck").value = document.getElementById("AllCheck").value.substr(1, document.getElementById("AllCheck").value.length - 1);

                        
                       
                    }

                });
                $("#SearchDlg").dialog("close");
                $("#Room").val();
                $("#FloorSNum").val();
            }
            //设置上下页改变之后选中的值还在
            function SetCheckboxValue() {
                var AllCheck = document.getElementById("AllCheck").value;
                if (AllCheck.length > 0) {
                    var rows = $('#TableContainer').datagrid("getRows");
                    $.each(rows, function (index, item) {
                        if (AllCheck.indexOf(item.RoomID) > 0) {
                            $('#TableContainer').datagrid("checkRow", index);
                        }
                    });
                }
            }

            function InitLeftTree() {
                $.tool.DataGet('Room', 'buildtree', $('#FrmForm').serialize(),
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
                $("#HBuildSNum").val('');
                $("#UnitSNum").val('');
                $("#FloorSNum").val('');
                $('#treeDemo').tree({
                    data: obj,
                    onClick: function (node) {
                     //   alert(node.attributes.BuildSNum);
                        $("#HBuildSNum").val(node.attributes.BuildSNum);
                        $("#UnitSNum").val(node.attributes.UnitSNum);
                        $("#FloorSNum").val(node.attributes.FloorSNum);
                        LoadData(1, 15);

                    }
                    , onLoadSuccess: function (node, data) {
                        // $('#trees').combotree('tree').tree("expandAll").tree(
                        // "collapseAll");
                        var t = $(this);
                        if (data) {
                            $(data).each(function (index, d) {
                                if (this.state == 'open') {

                                    var newvalue = document.getElementById("BuildSNum").value;
                                    if (newvalue < 1) {
                                        t.tree("collapseAll");
                                    }
                                }
                            });

                        }
                    }
                });
               
            }

            $(document).ready(function () {
             
                InitLeftTree();
                LoadData(1,15);

            });

            function BuildSNumChange() {

                InitLeftTree();
                LoadData(1,15);
            }

        </script>
    </form>
</body>
</html>
