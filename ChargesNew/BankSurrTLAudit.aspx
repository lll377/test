<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankSurrTLAudit.aspx.cs" Inherits="M_Main.ChargesNew.BankSurrTLAudit" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="CommID" name="CommID" value="" runat="server" />
        <input id="FromIndex" name="FromIndex" type="hidden" runat="server" />
        <input type="hidden" id="IsSelect" name="IsSelect" runat="server" value="0" />

        <div id="TableContainer"></div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 180px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称</td>
                    <td class="TdContentSearch">
                        <input id="CommName" name="CommName" class="easyui-searchbox" data-options="editable:false" searcher="SelComm" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">是否审核</td>
                    <td class="TdContentSearch">
                        <select name="IsAudit" id="IsAudit" class="easyui-combobox" paneimaxheight="100px"
                            data-options="editable:false,panelHeight:'auto'" runat="server" style="width: 143px">
                            <option value=""></option>
                            <option value="0" selected="selected">未审核</option>
                            <option value="1">已审核</option>
                            <option value="2">已驳回</option>
                        </select>
                    </td>
                    <td class="TdTitle">审核人</td>
                    <td class="TdContentSearch">
                        <input id="AuditUser" name="AuditUser" runat="server" class="easyui-textbox" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">开始时间</td>
                    <td class="TdContentSearch">
                        <input id="BeginDate1" name="BeginDate1" class="easyui-datebox" data-options="editable:false" runat="server" />
                    </td>
                    <td class="TdTitle">到</td>
                    <td class="TdContentSearch">
                        <input id="BeginDate2" name="BeginDate2" class="easyui-datebox" data-options="editable:false" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">


                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">查询</a>

                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) { return pair[1]; }
            }
            return (false);
        }


        function InitFrom() {
            var com = getQueryVariable("FromIndex");
            if (com != "") {
                $("#FromIndex").val(com);
            }
        }
        InitFrom();


        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h + "px");
        }
        InitTableHeight();

        //该审核功能从区域移至项目后，便取消项目查询条件
        //2018-4-10  yfzw
        function SelComm() {
            HDialog.Open(600, 500, '../DialogNew/SelComm.aspx', "选择管理项目", false, function callback(_Data) {
                var Obj = JSON.parse(_Data);
                $("#CommID").val(Obj.id);
                $("#CommName").searchbox("setValue", Obj.name);
            });
        }

        var toolbar = [

            {
                text: '审核',
                iconCls: 'icon-edit',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row.IsAudit == "1") {
                        HDialog.Info("已审核,等待处理！！！");
                        return;
                    }
                    if (row != undefined) {
                        HDialog.MessageBoxThird("银行托收审核", "通过审核", "驳回", "返回",
                            //通过审核
                            function () {
                                $.tool.DataPostChk('frmForm', 'BankSurrTLAudit', 'BankSurrAudit', $('#frmForm').serialize() + "&SurrID=" + row.SurrID + "&IsAuditOK=1",
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "1") {
                                            // HDialog.Info("审核成功,请确认托收!!!");
                                            var w = $(window).width();
                                            var h = $(window).height();
                                            HDialog.Open(w, h, '../ChargesNew/BankSurrTLAuditDetail.aspx?OPType=Edit&SurrID=' + row.SurrID, "修改代收记录", false, function callback(_Data) {
                                                if (_Data == 1) {
                                                    LoadList();
                                                }
                                            });
                                        } else {
                                            HDialog.Info("审核成功,请到下一个节点审核!!!");
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    })
                            },
                            //驳回
                            function () {
                                $('#IsAuditOK').val(0);
                                $.tool.DataPostChk('frmForm', 'BankSurrTLAudit', 'BankSurrAudit', $('#frmForm').serialize() + "&SurrID=" + row.SurrID + "&IsAuditOK=2",
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "2") {
                                            HDialog.Info("已驳回!!!");
                                            LoadList();
                                        } else {
                                            HDialog.Info("驳回失败!!!");
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {
                                    })
                            },
                            function () {
                            }
                        );


                    }
                }
            }, '-', {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }
        ];

        var column = [[
            { field: 'CommName', title: '项目名称', width: 100, align: 'left', sortable: true },
            { field: 'BankName', title: '托收类别', width: 100, align: 'left', sortable: true },
            { field: 'AllCounts1', title: '应处理数量', width: 200, align: 'left', sortable: true },
            { field: 'AllAmount1', title: '应处理金额', width: 200, align: 'left', sortable: true },
            { field: 'AllCounts2', title: '已处理数量', width: 200, align: 'left', sortable: true },
            { field: 'AllAmount2', title: '已处理金额', width: 200, align: 'left', sortable: true },
            { field: 'UserName', title: '操作员', width: 200, align: 'left', sortable: true },
            {
                field: 'SurrStateName', title: '状态', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var str = "<font color=red>" + row.SurrStateName + "";
                    return str;
                }
            },
            //{
            //    field: 'IsAudit', title: '是否审核', width: 200, align: 'left', sortable: true,
            //    formatter: function (value, row, index) {
            //        var str = "未审核";
            //        if (value == "1") {
            //            str = "已审核";
            //        }
            //        return str;
            //    }
            //},
            { field: 'BeginDate', title: '开始时间', width: 200, align: 'left', sortable: true },
            { field: 'ChargeDate', title: '完成时间', width: 200, align: 'left', sortable: true },
            { field: 'FeesRoleNamesMemo', title: '审核流程', width: 260, align: 'left', sortable: true },
            {
                field: 'IsAudit', title: '审核状态', width: 100, align: 'left', sortable: true,
                formatter: function (value, row, index) {
                    var values = "";
                    var IsAudit = row.IsAudit;

                    if (IsAudit == 1) {
                        values = "<font color='Green'>已通过</font>";
                    }
                    else if (IsAudit == 2) {
                        values = "<font color='red'>未通过</font>";
                    }
                    else {
                        values = "<font color='Blue'>未审核</font>";
                    }


                    return values;
                }
            }

        ]];

        function load2() {
            $("#TableContainer").datagrid({
                //url: '/HM/M_Main/HC/DataPostControl.aspx',
                //method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                pagination: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                //onBeforeLoad: function (param) {
                //    param = $.JQForm.GetParam("BankSurrTLAudit", "search", "TableContainer", param);
                //},
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                }
            });
        }

        function load() {
            if ($("#CommID").val() == '') {
                HDialog.Info("请选择项目");
                return false;
            }
            LoadList();
        }


        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                nowrap: false,
                pageSize: top.ListPageSize,
                pageList: top.ListPageList,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                singleSelect: true,
                selectOnCheck: false,
                checkOnSelect: false,
                pagination: true,
                border: false,
                width: "100%",
                toolbar: toolbar,
                sortOrder: "asc",
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("BankSurrTLAudit", "search", "TableContainer", param);
                },
                onLoadSuccess: function (data) {
                    $("#SearchDlg").dialog("close");
                }
            });

        }
        $.parser.parse("#SearchDlg");
        load2();
    </script>
</body>
</html>
