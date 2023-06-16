<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffCanteenInfo.aspx.cs" Inherits="M_Main.InformationManage.StaffCanteenInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工食堂信息</title>
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
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
</head>
<body>
    <form id="planform" runat="server">
        <input type="hidden" id="CommIds" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 560px; height: 160px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td>食材采购费用支付方名称
                    </td>
                    <td>
                        <input id="PayName" style="width: 136px" size="17" name="PayName" />
                    </td>
                     <td>是否办理食堂经营资质
                    </td>
                    <td>
                        <select id="IsBusiness" name="IsBusiness" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" style="width: 60px" runat="server">
                        <option value="-1" selected>全部</option>
                        <option value="2">是</option>
                        <option value="3">否</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">
    var w = $(window).width();
    var h = $(window).height();
    $(function () {
        $("#TableContainer").css("height", h + "px");
        LoadList();
    })

    var toolbar = "";
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    var types =getUrlParam("types");
    if (types == "1") {
        toolbar = [
            {
                text: '新增',
                iconCls: 'icon-add',
                handler: function () {
                    ViewDetail("新增员工食堂信息", 'insert', "");
                }
            }, '-',
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    var row = $("#TableContainer").datagrid("getSelected");
                    if (row == null) {
                        HDialog.Info('请选择删除项！');
                        return;
                    }
                    DeleteHouseHold(row.StaffCanteenID);
                }
            }, '-',
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.open('StaffCanteenInfoToExcel.aspx?' + $("#planform").serialize());
                }
            }];
    }
    else {
        toolbar = [
            {
                text: '筛选',
                iconCls: 'icon-search',
                handler: function () {
                    $('#SearchDlg').parent().appendTo($("form:first"))
                    $('#SearchDlg').dialog('open');
                }
            }, '-',
            {
                text: 'Excel导出',
                iconCls: 'icon-page_white_excel',
                handler: function () {
                    window.open('StaffCanteenInfoToExcel.aspx?' + $("#planform").serialize());
                }
            }];
    }

    var column = [[
        //{ field: 'ck', rowspan: 2, checkbox: true },
        { title: "食堂开设情况", colspan: 9 },
        { title: '食堂经营资质', colspan: 16 },
        { title: '相关人员信息', colspan: 2 }
    ],
    [
        { field: 'PropertyArea', title: '物业区域', width: 100, align: 'left', sortable: true },
        { field: 'AreaNumber', title: '物业区域编号', width: 100, align: 'left', sortable: true },
        { field: 'PropertyProject', title: '物业项目', width: 100, align: 'left', sortable: true },
        { field: 'ProjectNumber', title: '物业项目编号', width: 100, align: 'left', sortable: true },
        { field: 'DevelopmentSubject', title: '项目开发主体', width: 100, align: 'left', sortable: true },
        //{ field: 'NCSystemNumber', title: 'NC编码', width: 100, align: 'left', sortable: true },
        //{ field: 'NCSystemAccount', title: 'NC账套全称', width: 100, align: 'left', sortable: true },

        {
            field: 'IsOpen', title: '是否开设员工食堂', width: 120, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value == "1") {
                    return "否";
                } else {
                    return "是";
                }
            }
        },
        {
            field: 'PayName', title: '食材采购费用支付方名称', width: 160, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var Params = "";
                var str = row.PayName;
                Params = "StaffCanteenID=" + row.StaffCanteenID;
                if (types == "1") {
                    str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改员工食堂信息','Edit','" + Params + "');\">" + row.PayName + "</a>";
                }
                return str;
            }
        },

        {
            field: 'IsBusiness', title: '是否办理食堂经营资质', width: 140, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                if (value == "3") {
                    return "否";
                } else if (value == "2") {
                    return "是";
                }
            }
        },
        { field: 'BusinessName', title: '资质证书名称', width: 100, align: 'left', sortable: true },
        { field: 'LicenseNumber', title: '许可证编号', width: 100, align: 'left', sortable: true },
        { field: 'PaperCode', title: '社会信用代码（身份证号码）', width: 180, align: 'left', sortable: true },
        { field: 'ChargeName', title: '法定代表人（负责人）', width: 130, align: 'left', sortable: true },
        { field: 'Address', title: '住所', width: 80, align: 'left', sortable: true },
        { field: 'OperatorName', title: '经营者名称', width: 100, align: 'left', sortable: true },
        { field: 'BusinessPlace', title: '经营场所', width: 100, align: 'left', sortable: true },
        { field: 'BusinessProject', title: '经营项目', width: 100, align: 'left', sortable: true },
        { field: 'SubjectForm', title: '主体业态', width: 100, align: 'left', sortable: true },
        { field: 'DailyManagement', title: '日常监督管理机构', width: 120, align: 'left', sortable: true },
        { field: 'DailySupervisor', title: '日常监督管理人员', width: 120, align: 'left', sortable: true },
        { field: 'IssuingOrgan', title: '发证机关', width: 100, align: 'left', sortable: true },
        { field: 'IssuerName', title: '签发人', width: 100, align: 'left', sortable: true },
        {
            field: 'IssueDate', title: '签发日期', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.IssueDate, "yyyy-MM-dd");
                return str;
            }
        },
        {
            field: 'ValidityDate', title: '有效期至', width: 100, align: 'left', sortable: true,
            formatter: function (value, row, index) {
                var str = formatDate(row.ValidityDate, "yyyy-MM-dd");
                return str;
            }
        },

        { field: 'BuyerName', title: '食材专责采购文员姓名', width: 140, align: 'left', sortable: true },
        { field: 'StorekeeperName', title: '仓管员姓名', width: 100, align: 'left', sortable: true }

    ]];

    function LoadList() {
        $("#TableContainer").datagrid({
            url: '/HM/M_Main/HC/DataPostControl.aspx',
            method: "post",
            nowrap: false,
            toolbar: toolbar,
            pageSize: top.ListPageSize,
            pageList: top.ListPageList,
            columns: column,
            fitColumns: false,
            remoteSort: false,
            singleSelect: true,
            pagination: true,
            width: "100%",
            border: false,
            showFooter: true,
            onDblClickRow: function (rowIndex, rowData) {
                var Params = "";
                var str = rowData.PayName;
                Params = "StaffCanteenID=" + rowData.StaffCanteenID;
                if (types == "1") {
                    ViewDetail('修改员工食堂信息', 'Edit', Params);
                }
            },
            onBeforeLoad: function (param) {
                param = $.JQForm.GetParam("StaffCanteenInfo", "GetList", "TableContainer", param);
            }
        });
        $("#SearchDlg").dialog("close");
    }

    //显示详细
    function ViewDetail(title, OpType, Params) {
        HDialog.Open(w - 400, h - 70, '../InformationManage/StaffCanteenInfoEdit.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
            if (_Data != "false" && _Data != "") {
                LoadList();
            }
        });
    }

    //删除
    function DeleteHouseHold(StaffCanteenID) {
        $.messager.confirm('确定', '是否删除该项', function (r) {
            if (r) {
                $.tool.DataGet('StaffCanteenInfo', 'deletes', 'StaffCanteenID=' + StaffCanteenID,
                    function Init() {
                    },
                    function callback(_Data) {

                        if (_Data == "true") {
                            HDialog.Info('删除成功');
                        }
                        else { HDialog.Info('删除失败'); }
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        });
    }
</script>
