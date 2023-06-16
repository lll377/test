<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiCustDlg.aspx.cs" Inherits="M_Main.DialogNew.MultiCustDlg" %>

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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

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
        <input id="LiveType" name="LiveType" type="hidden" runat="server" />
        <input id="IsHis" name="IsHis" type="hidden" runat="server" />
        <input type="hidden" id="hiCommID" name="hiCommID" runat="server" />
        <input type="hidden" id="hiMeterID" name="hiMeterID" runat="server" />
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
                    <div class="datagrid-toolbar" id="divtt">
                        <table cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="TdTitle">客户名称&nbsp;&nbsp;<input type="text" class="easyui-validatebox" id="CustName" name="CustName"
                                    runat="server" />
                                </td>
                                <td>
                                    <div class="datagrid-btn-separator"></div>
                                </td>
                                <td>房屋编号&nbsp;&nbsp;<input type="text" class="easyui-validatebox" id="RoomSign" name="RoomSign"
                                    runat="server" />
                                </td>
                                <td>
                                    <div class="datagrid-btn-separator"></div>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="LoadList();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">查询</span><span class="l-btn-icon icon-search">&nbsp;</span></span></a>
                                </td>

                                <td>
                                    <div class="datagrid-btn-separator"></div>
                                </td>
                                <td id="tempadd">
                                    <a href="javascript:void(0)" onclick="AddTemp();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">新增</span><span class="l-btn-icon icon-add">&nbsp;</span></span></a>
                                </td>
                                <td>
                                    <div class="datagrid-btn-separator"></div>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="CheckCust();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">确定选择</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a>
                                </td>
                                <td>
                                    <div class="datagrid-btn-separator"></div>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="CheckAllCust();" class="l-btn l-btn-small l-btn-plain" group="" id=""><span class="l-btn-left l-btn-icon-left"><span class="l-btn-text">全部选择</span><span class="l-btn-icon icon-save">&nbsp;</span></span></a>
                                </td>
                        </table>
                    </div>
                    <div style="width: 100%;" id="TableContainer"></div>
                </div>
            </div>
            <input type="hidden" id="CommID" name="CommID" />
            <input type="hidden" id="LiveTypeName" name="LiveTypeName" />
            <input type="button" id="btnCheckAll" name="btnCheckAll" runat="server" onserverclick="btnCheckAll_ServerClick" />
            <input type="hidden" id="OrganCode" name="OrganCode" />
            <input type="hidden" id="Sort" name="Sort" />
            <input id="AllCheck" size="1" type="hidden" name="AllCheck" runat="server" />
            <input id="AllAllCheck" size="1" type="hidden" name="AllAllCheck" runat="server" />
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

        function CheckAllCust() {



            $.tool.DataPost2('Choose', 'SelAllCust', $('#FrmForm').serialize(),
                function Init() {

                },
                function callback(_Data) {
                    if (_Data != "") {
                        var Data = eval("(" + _Data + ")"); //转换为json对象

                        if (Data.rows.length > 0) {
                            var strRow = "";
                            for (var i = 0; i < Data.rows.length; i++) {
                                strRow = strRow + "|" + JSON.stringify(Data.rows[i]);
                            } HDialog.Close(strRow);
                        }

                    }
                    else {
                        HDialog.Info('请选择');
                    }

                },
                function completeCallback() {
                },
                function errorCallback() {
                });

            //if (value == "") {
            //    HDialog.Info('请选择');
            //}
            //else {
            //    HDialog.Close(value);
            //}
        }
        function InitFunction() {
            var h = $(window).height();
            var w = $(window).width() * 0.25 - 1;
            $("#RoomFrameTree").css("width", w + "px");
            $("#RoomFrameTree").css("height", h + "px");
            $("#TableContainer").css("height", h + "px");
            var h1 = h * 0.9;
            $("#LeftTop1").css("height", h1 + "px");
            var h2 = h * 0.1;
            $("#LeftTop2").css("height", h2 + "px");
            $('#tempadd').hide();
            $('#btnCheckAll').hide();
        }
        InitFunction();

        var column = [[

            { field: 'ck', checkbox: true },
            { field: 'CustName', title: '客户名称', width: 80, align: 'left', sortable: true },
            { field: 'RoomSigns', title: '房屋编号', width: 200, align: 'left', sortable: true },
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

        function CheckCust() {
            var value = $('#AllCheck').val();
            if (value == "") {
                HDialog.Info('请选择');
            }
            else {
                HDialog.Close(value);
            }
        }

        var toolbar = [
            {
                text: '确定选择',
                iconCls: 'icon-save',
                handler: function () {
                    var value = $('#AllCheck').val();
                    if (value == "") {
                        HDialog.Info('请选择');
                    }
                    else {
                        HDialog.Close(value);
                    }
                }

            }, {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"));
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                title: '',
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                columns: column,
                fitColumns: true,
                remoteSort: false,
                singleSelect: true,
                pagination: true,
                width: "100%",
                toolbar: '#divtt',
                rownumbers: true,
                sortOrder: "asc",
                border: false,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("Choose", "SelCust", "TableContainer", param);
                },
                onLoadSuccess: function (data) {

                },
                onCheck: function (rowIndex, rowData) {
                    var dd = $('#AllCheck').val() + "|" + JSON.stringify(rowData);
                    $('#AllCheck').val(dd);

                },
                onUncheck: function (rowIndex, rowData) {
                    var ss = $('#AllCheck').val().split('|');
                    for (var i = 0; i < ss.length; i++) {

                        if (ss[i].indexOf(JSON.stringify(rowData)) >= 0) {
                            ss.splice(i, 1);
                        }
                    }
                    valu = "";
                    for (var i = 0; i < ss.length; i++) {
                        valu += "|" + ss[i];
                    }
                    $('#AllCheck').val(valu.substr(1, valu.length));

                },
                onCheckAll: function (rows) {
                    for (var i = 0; i < rows.length; i++) {
                        var data = "|" + JSON.stringify(rows[i]);
                        var ss = $('#AllCheck').val();
                        if (ss.indexOf(data) < 0) {
                            var dd = $('#AllCheck').val() + "|" + data;
                            $('#AllCheck').val(dd);
                        }
                    }

                },
                onUncheckAll: function (rows) {
                    for (var i = 0; i < rows.length; i++) {

                        var ss = $('#AllCheck').val().split('|');
                        for (var i = 0; i < ss.length; i++) {
                            if (ss[i].indexOf(JSON.stringify(rows[i])) >= 0) {
                                ss.splice(i, 1);
                            }
                        }
                        valu = "";
                        for (var i = 0; i < ss.length; i++) {
                            valu += "|" + ss[i];
                        }
                        $('#AllCheck').val(valu.substr(1, valu.length));
                    }
                }
            });
        }

        $(document).ready(function () {
            function InitLeftTree() {
                $.tool.DataGet('Choose', 'SelCustType', "",
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != '') {
                            varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象

                            GetTree(varObjects);

                            LoadList();
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

                        if (node.attributes.LiveType == '3') {
                            $('#tempadd').show();
                        }
                        NodeItemClick(node);
                    }
                });
                var node = $('#treeDemo').tree('find', obj[0].children[0].id);

                $('#treeDemo').tree('select', node.target);
            }
            InitLeftTree();

        });
        $("#LiveType").val(1);

    </script>
</body>
</html>
