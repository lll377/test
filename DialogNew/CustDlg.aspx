<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustDlg.aspx.cs" Inherits="M_Main.DialogNew.CustDlg" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
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

        <div class="Container">
            <div id="ContainerLeft" class="ContainerLeft">
                <table id="RoomFrameTree" name="RoomFrameTree">
                    <tr>
                        <td>
                            <div id="LeftTop1" style="height: 95%">
                                <div>
                                    <ul id="treeDemo" style="width: 100%;" class="easyui-tree">
                                    </ul>
                                </div>
                            </div>
                            <div id="LeftTop2" style="width: 100%; height: 5%; text-align: center">
                                <input type="checkbox" id="CkIsHis" onclick="CK(this);" name="CkIsHis" />历史客户
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
            <div id="ContainerRight" class="ContainerRight">
                <div>
                    <div class="datagrid-toolbar" id="divtt" style="padding:0px;">
                        <table cellspacing="0" cellpadding="0" >
                            <tr>
                                <td class="TdTitle" style="padding-bottom:4px;">
                                    <span style="margin-top: 5px;">客户名称&nbsp;&nbsp;<input type="text" class="easyui-validatebox" id="CustName" name="CustName"
                                        runat="server" />&nbsp;&nbsp;
                                            房屋编号&nbsp;&nbsp;<input type="text" class="easyui-validatebox" id="RoomSign" name="RoomSign"
                                                runat="server" />
                                    </span>
                                    <span>联系电话&nbsp;&nbsp;<input type="text" style="margin-top: 5px;" class="easyui-validatebox" id="MobilePhone" name="MobilePhone"
                                        runat="server" />&nbsp;
                                    </span>
                                </td>

                                <td id="tempadd">
                                    <a href="javascript:void(0)" onclick="AddTemp();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">新增</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a>
                                </td>

                                <td>
                                    <div class="datagrid-btn-separator"></div>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="LoadList();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                                </td>

                        </table>
                    </div>
                    <div style="width: 100%;" id="TableContainer"></div>
                </div>
            </div>
        </div>
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input type="hidden" id="LiveTypeName" name="LiveTypeName" />
        <input type="hidden" id="OrganCode" name="OrganCode" />
        <input type="hidden" id="Sort" name="Sort" />
    </form>
    <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
    <script type="text/javascript">
        function NodeItemClick(node) {
            LoadList();
        }

        function AddTemp() {
            HDialog.Open('950', '450', '../DialogNew/CustAdd.aspx', '新增临时客户', false, function callback(_Data) {
                if (_Data == '1') {
                    LoadList();
                }
            });

        }

        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width() * 0.25 - 1;
            $("#ContainerLeft").css('width', w + 'px');
            $("#RoomFrameTree").css("width", w + "px");
            $("#RoomFrameTree").css("height", h + "px");
            $("#TableContainer").css("height", h + "px");
            var h1 = h * 0.9;
            $("#LeftTop1").css("height", h1 + "px");
            var h2 = h * 0.1;
            $("#LeftTop2").css("height", h2 + "px");

            $('#tempadd').hide();
        }
        InitFunction();

        var column = [[


            { field: 'CustName', title: '客户名称', width: 80, align: 'left', sortable: true },
            { field: 'RoomSigns', title: '房屋编号', width: 200, align: 'left', sortable: true },
            { field: 'PaperCode', title: '身份证号', width: 180, align: 'left', sortable: true },
            { field: 'MobilePhone', title: '联系电话', width: 120, align: 'left', sortable: true },
            { field: 'LiveTypeName', title: '分类', width: 50, align: 'left', sortable: true }
        ]];

        var column1 = [[

            { field: 'CustName', title: '客户名称', width: 80, align: 'left', sortable: true },
            { field: 'PaperCode', title: '身份证号', width: 180, align: 'left', sortable: true },
            { field: 'MobilePhone', title: '联系电话', width: 120, align: 'left', sortable: true },
            { field: 'LiveTypeName', title: '分类', width: 50, align: 'left', sortable: true }
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

        function CK(obj) {



            if (obj.checked) {
                $("#IsHis").val(1);
                $('#tempadd').hide();
            }
            else {
                $("#IsHis").val(0);
            }
            $("#LiveType").val();
            LoadList();
        }

        function LoadList() {
            var col;
            if ($("#LiveType").val() == 3) {
                col = column1;
            } else {
                col = column;
            }
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=Choose&Command=SelCust&' + $('#FrmForm').serialize(),
                method: "get",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: col,
                fitColumns: true,
                singleSelect: true,
                remoteSort: false,
                pagination: true,
                border: false,
                width: "100%",
                toolbar: '#divtt',
                sortOrder: "asc",
                onDblClickRow: function (rowIndex, rowData) {
                    HDialog.ReturnIsJson = true;
                    HDialog.Close(rowData);
                }
            });
            $('#SearchDlg').dialog('close');
        }


        $(document).ready(function () {
            function InitLeftTree() {
                $.tool.DataPost('Choose', 'SelCustType', "CommID=" + $('#hiCommID').val(),
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
                    onClick: function (node) {

                        $("#LiveType").val(node.attributes.LiveType);
                        $('#tempadd').hide();
                        if (node.attributes.LiveType == '3') {
                            $('#tempadd').show();
                        }
                        NodeItemClick(node);
                    }
                });
            }
            InitLeftTree();

        });
        LoadList();
    </script>
</body>
</html>
