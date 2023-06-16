<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewRefundFeesNewSecCreate.aspx.cs" Inherits="M_Main.ChargesNew.NewRefundFeesNewSecCreate" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 250px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" style="width: 77%;" runat="server" />
                        <input id="CustID" type="hidden" name="CustID" runat="server" />
                        <input id="hiCustName" type="hidden" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">申请编号</td>
                    <td class="TdContent">
                        <input type="text" id="RecNum" runat="server" />
                    </td>
                </tr>
              <%--  <tr>
                    <td class="TdTitle">申请人</td>
                    <td class="TdContent">
                        <input type="text" id="UserName" runat="server" />
                    </td>
                    <td class="TdTitle">审核状态</td>
                    <td class="TdContent">
                        <select id="AuditingState" runat="server" style="width: 77%;">
                            <option value=""></option>
                            <option value="未送审">未送审</option>
                            <option value="驳回">驳回</option>
                            <option value="不通过">不通过</option>
                            <option value="已审核">已审核</option>
                        </select>
                    </td>
                </tr>--%>
                <tr>
                    <td class="TdTitle">申请日期从</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EditBeginDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" type="text" name="EditBeginDate"
                            runat="server" /></td>
                    <td class="TdTitle">到</td>
                    <td class="TdContent">
                        <input class="Wdate" id="EditEndDate"
                            onclick="WdatePicker({ startDate: '%y-%M-01', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })" type="text" name="EditEndDate"
                            runat="server" /></td>

                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a></td>
                </tr>
            </table>
        </div>

        <input id="PageType" type="hidden" name="PageType" runat="server" />
    </form>
</body>
</html>
<script type="text/javascript">

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


        var w = $(window).width();
        var h = $(window).height();

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open(w, h, conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);
            $('#CustID').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + data.CustID,
                function Init() {
                },
                function callback(_Data) {

                    varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                    if (varObjects.length > 0) {

                        var RoomData = [];
                        for (var i = 0; i < varObjects.length; i++) {

                            var vIsDelLive = varObjects[i].IsDelLive;
                            var strTmp = "";

                            if (vIsDelLive == 1) {
                                strTmp = "(历史)";
                            }
                            var RoomID = varObjects[i].RoomID;
                            var RoomSign = varObjects[i].RoomSign;
                            var Buildarea = varObjects[i].BuildArea;

                            var RoomText = RoomSign + "(" + Buildarea + ")" + strTmp;

                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID + "|" + Buildarea });

                        }
                        $('#SelectRoomID').combobox({
                            data: RoomData,
                            valueField: 'RoomID',
                            textField: 'RoomText',
                            onChange: function (n, o) {


                                var data = $('#SelectRoomID').combobox('getData');
                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        if (n == data[i].RoomID) {

                                            $('#RoomSign').searchbox('setValue', data[i].RoomText);
                                            $('#RoomID').val(data[i].RoomID.split('|')[0]);

                                            break;
                                        }
                                    }
                                }
                            }
                        });
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });

        });
    }


    var column = [[
        {
            field: 'RecNum', title: '申请编号', width: 130, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "<a class=\"HrefStyle\"   href='#' onclick=\"ViewRefundFees('修改退款信息','edit','" + row.ID + "');\">" + row.RecNum + "</a>";
                return str;
            }
        },
        { field: 'CustName', title: '客户名称', width: 180, align: 'left', sortable: true },
        { field: 'RoomSigns', title: '房屋编号', width: 180, align: 'left', sortable: true },
        { field: 'RefundAmount', title: '退款总金额', width: 100, align: 'left', sortable: true },
        { field: 'RefundReason', title: '退款原因', width: 180, align: 'left', sortable: true },
        //{ field: 'AuditingState', title: '审核状态', width: 120, align: 'left', sortable: true },
        //{
        //    field: 'WorkStartDate', title: '申请日期', width: 180, align: 'left', sortable: true,
        //    formatter: function (value, row, index) {
        //        var str = formatDate(row.WorkStartDate, "yyyy-MM-dd HH:mm:ss");
        //        return str;
        //    }
        //},
        //{ field: 'UserName', title: '申请人', width: 120, align: 'left', sortable: true },
        //{ field: 'AuditUserRoles', title: '当前审核岗位', width: 120, align: 'left', sortable: true, hidden: true },
         
        { field: 'RefundRoleNames', title: '未审岗位', width: 200, align: 'left', sortable: true },
        { field: 'AuditingState', title: '审核状态', width: 120, align: 'left', sortable: true },
        {
            field: '操作', title: '操作', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = "";
                switch (row.AuditingState) {
                    case "未启动":
                    case "已驳回":
                    case "审核不通过":
                        str = "<a class=\"HrefStyle\"   href='#' onclick=\"DeleRefundFeesApply('" + row.ID + "');\">删除</a>";
                        break;
                }
                return str;
            }
        }
    ]];


    var toolbar = [
        {
            text: '新增退款',
            iconCls: 'icon-add',
            handler: function () {
                ViewRefundFees('新增退款', 'insert', null);
            }
        }, '-',
        {
            text: '查询退款',
            iconCls: 'icon-search',
            handler: function () {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');

            }
        }

    ];

    //新增退款
    function ViewRefundFees(title, optype, id) {
        var w = $(window).width();
        var h = $(window).height();
        HDialog.Open(w, h, '../ChargesNew/NewRefundFeesNewSecAdd.aspx?OPType=' + optype + '&ID=' + id, title, false,
            function (_data) {
                if (_data != '') {
                    LoadList();
                } else {
                    //当点击详情页面上的 'X' 关闭时 删除审核状态是未启动的数据
                    //var ApplyID = Cache.GetData("ApplyID");
                    //DeleRefundFeesApplyDetail(ApplyID);
                }

            });
    }


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
            sortOrder: "asc",
            toolbar: toolbar,
            selectOnCheck: false,
            checkOnSelect: false,
            rownumbers: true,
            border: false,
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("RefundFees", "GetRefundFeesApply", "TableContainer", param);
            }
        });

        $('#SearchDlg').dialog('close');
    }

    //删除申请记录
    function DeleRefundFeesApply(id) {
        $.tool.DataGet('RefundFees', 'DeleRefundFeesApply', "ID=" + id,
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "true") {
                    LoadList();
                    HDialog.Info("删除成功！");
                } else {
                    HDialog.Info("删除失败！");
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });

    }

    //删除退款申请详情记录
    function DeleRefundFeesApplyDetail(ApplyID) {
        $.tool.DataPost('RefundFees', 'DeleteRefundFeesApplyDetail', 'ApplyID=' + ApplyID,
            function Init() {
            },
            function callback(_Data) {
                if (_Data != null) {
                    var res = _Data.split('|')[0];
                    if (res == "true") {
                        //HDialog.Info("删除成功！");
                    } else {
                        //HDialog.Info(_Data.split('|')[1]);
                    }
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            }
        );
    }

    function InitFunction() {
        var h = $(window).height();
        $("#TableContainer").css("height", h + "px");
    }
    InitFunction();
    LoadList();

</script>
