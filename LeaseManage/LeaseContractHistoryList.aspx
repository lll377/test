<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaseContractHistoryList.aspx.cs" Inherits="M_Main.LeaseManage.LeaseContractHistoryList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>租赁合同历史列表页面</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/help.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #dlg_search_AuditSet {
            padding: 10px;
            width: auto;
            height: auto;
        }

        .SearchTable {
            width: 740px;
            height: auto;
            border-top: 1px solid #E7EAEC;
            border-left: 1px solid #E7EAEC;
        }

            .SearchTable tr td {
                color: #666;
                padding: 5px;
                background: #F8F8F8;
                border-right: 1px solid #E7EAEC;
                border-bottom: 1px solid #E7EAEC;
            }

            .SearchTable tr .TdTitle {
                width: 12%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 20%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }

        #CommName {
            width: 97%;
            height: 40px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
            border-radius: 5px;
        }
    </style>
</head>
<body style="margin: 0px; padding: 0px; overflow: hidden">
    <input type="hidden" id="CustID" name="CustID" runat="server" />
    <input type="hidden" id="CommID" name="CommID" runat="server" />
    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
    </div>
    <script type="text/javascript"> 
        function InitTableHeight() {
            var h = $(window).height();
            $("#TableContainer").css("height", h - 2 + "px");
        }

        function ClearWhere() {
            $('#frmFrom').form('clear');
            $('#AuditStatus').combobox("setValue", "全部");
            $('#DealState').combobox("setValue", "全部");
        }

        //选择项目
        function SelComm() {
            if ($('#hCommID').val() == "") {
                var w = $(window).width() * 0.7;
                HDialog.Open(w, 500, '../Visit/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#CommID").val(arrRet.id);
                    $("#CommName").val(arrRet.name);
                });
            }
        }

        var column = [[
            { field: 'TenantryCustName', title: '租户名称', width: 220, align: 'left' },
            {
                field: 'LeaseRoomSigns', title: '房屋编号', width: 200, align: 'left', formatter: function (value, row, index) {
                    return value.replaceAll(',', '<br/>');
                }
            },
            { field: 'FixedTel', title: '固定电话', width: 120, align: 'center' },
            { field: 'TenantryConnectTel', title: '移动电话', width: 120, align: 'center' },
            { field: 'ContractSign', title: '合同编号', width: 180, align: 'left' },
            { field: 'ContractName', title: '合同名称', width: 180, align: 'left' },
            {
                field: 'ContractBeginTime', title: '合同开始时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            {
                field: 'ContractEndTime', title: '合同结束时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'ContractTotalPrice', title: '合同总额', width: 100, align: 'center' },
            { field: 'DutyDepName', title: '机构部门', width: 200, align: 'center' },
            { field: 'DutyUserName', title: '负责人', width: 100, align: 'center' },
            {
                field: 'ContractSignTime', title: '签约时间', width: 100, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd')
                }
            },
            { field: 'WorkStartUserName', title: '发起人', width: 100, align: 'center' },
            {
                field: 'WorkStartDate', title: '发起时间', width: 150, align: 'center', formatter: function (value, row, index) {
                    return $.dateFormat(value, 'yyyy-MM-dd HH:mm:ss')
                }
            },
            { field: 'AuditStatus', title: '审核状态', width: 100, align: 'center' },
            { field: 'ContractChangeType', title: '变更类型', width: 100, align: 'center' }
        ]];


        function LoadList() {
            $("#TableContainer").datagrid({
                url: '/HM/M_Main/HC/DataPostControl.aspx',
                method: "post",
                loadMsg: '数据加载中,请稍候...',
                nowrap: false,
                pageSize: 50,
                pageList: [50, 100, 300],
                singleSelect: true,
                checkOnSelect: true,
                selectOnCheck: false,
                remoteSort: false,
                columns: column,
                fitColumns: false,
                rownumbers: true,
                pagination: true,
                toolbar: [],
                border: false,
                onDblClickRow: function (rowIndex, rowData) {
                    //双击返回数据
                    HDialog.Close(JSON.stringify(rowData));
                },
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("LeaseManage", "GetLeaseContractListByOldContract", "TableContainer", param);
                }
            });
        }
        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }
        //页面初始化
        $(function () {
            InitTableHeight();
            LoadList();
        });
    </script>

</body>
</html>
