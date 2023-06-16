<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketingServiceInfo.aspx.cs" Inherits="M_Main.InformationManage.MarketingServiceInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style>
        #CommNames {
            width: 81.7%;
            height: 60px;
            border: 1px solid #cccccc;
            font-size: 12px;
            padding: 2px;
            resize: none;
        }
    </style>
</head>
<body>
    <form id="marketform" runat="server">
        <input id="CommIDs" name="CommIDs" type="hidden" runat="server" />
        <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 900px; height: 360px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">项目名称
                    </td>
                    <td class="TdContentSearch" colspan="3">
                        <textarea id="CommNames" name="CommNames" runat="server" ru="server" onclick="SelCommInfo();" style="font-family: YouYuan; font-size: 11pt;width:660px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">项目开发主体
                    </td>
                    <td class="TdContentSearch">
                        <select name="DevelopmentSubject" id="DevelopmentSubject" runat="server" style="width:230px">
                            <option value="综合">综合</option>
                            <option value="集团开发">集团开发</option>
                            <option value="合作开发">合作开发</option>
                            <option value="外拓">外拓</option>
                        </select>
                    </td>
                    <td class="TdTitle">项目状态
                    </td>
                    <td class="TdContentSearch">
                        <select id="ProjectStatus" name="ProjectStatus" runat="server" style="width:230px"></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同类型
                    </td>
                    <td class="TdContentSearch">
                        <select id="ContractType" name="ContractType" style="width:230px">
                            <option value="综合">综合</option>
                            <option value="案场管理服务合同">案场管理服务合同</option>
                            <option value="开荒清洁服务合同">开荒清洁服务合同</option>
                            <option value="绿化养护服务合同">绿化养护服务合同</option>
                            <option value="其他特约服务合同">其他特约服务合同</option>
                        </select>
                    </td>
                    <td class="TdTitle">收费模式
                    </td>
                    <td class="TdContentSearch">
                        <select id="ChargeMode" name="ChargeMode" runat="server" style="width:230px"></select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同履行状态
                    </td>
                    <td class="TdContentSearch">
                        <select id="ContractStatus" name="ContractStatus" style="width:230px">
                            <option value="综合">综合</option>
                            <option value="已结束">已结束</option>
                            <option value="正在履行">正在履行</option>
                            <option value="新签订未履行">新签订未履行</option>
                            <option value="未签订">未签订</option>
                        </select>
                    </td>
                    <td class="TdTitle">合同起始日期
                    </td>
                    <td class="TdContentSearch">
                        <input id="StartDateOne" onclick="WdatePicker()" style="width: 100px" name="StartDateOne" />
                        到
                        <input id="StartDateTwo" onclick="WdatePicker()" style="width: 100px" name="StartDateTwo" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">合同终止日期
                    </td>
                    <td class="TdContentSearch">
                        <input id="EndDateOne" onclick="WdatePicker()" style="width: 100px" name="EndDateOne" />
                        到
                        <input id="EndDateTwo" onclick="WdatePicker()" style="width: 100px" name="EndDateTwo" />
                    </td>
                    <td class="TdTitle">合同签订日期
                    </td>
                    <td class="TdContentSearch">
                        <input id="SignDateOne" onclick="WdatePicker()" style="width: 100px" name="SignDateOne" />
                        到
                        <input id="SignDateTwo" onclick="WdatePicker()" style="width: 100px" name="SignDateTwo" />
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

    <script>
        var w = $(window).width();
        var h = $(window).height();
        $(function () {
            $("#TableContainer").css("height", h  + "px");
            LoadList();
        })

        var toolbar = "";
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        var types = getUrlParam("types");
        if (types == "1") {
            toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        ViewDetail("新增协销服务合同信息", 'insert', "");
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
                        DeleteHouseHold(row.MID);
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
                        window.location.href = '../InformationManage/MarketingServiceInfoToExcel.aspx';
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
                        window.location.href = '../InformationManage/MarketingServiceInfoToExcel.aspx';
                    }
                }];
        }

        var column = [[
            //{ field: 'ck', checkbox: true, rowspan: 2 },
            {
                field: 'PropertyArea', title: '物业区域', width: 220, align: 'left', sortable: true, rowspan: 2,
                formatter: function (value, row, index) {
                    var Params = "";
                    var str = row.PropertyArea;
                    Params = "MID=" + row.MID;
                    if (types == "1") {
                        str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('修改信息','Edit','" + Params + "');\">" + row.PropertyArea + "</a>";
                    }
                    return str;
                }
            },
            { field: 'MID', title: 'MID', rowspan: 2, hidden: true },
            { field: 'ProjectName', title: '项目名称', width: 100, align: 'left', rowspan: 2, sortable: true },
            { field: 'DevelopmentSubject', title: '项目开发主体', width: 80, align: 'left', rowspan: 2, sortable: true },
            { field: 'ProjectStatus', title: '项目状态', width: 100, align: 'left', rowspan: 2, sortable: true },

            { field: 'ContractType', title: '合同类型', width: 90, align: 'left', rowspan: 2, sortable: true },
            { field: 'ContractDetails', title: '合同主要内容', width: 100, align: 'left', rowspan: 2, sortable: true },
            { field: 'PartyA', title: '甲方（房产公司/委托方）', width: 150, align: 'left', rowspan: 2, sortable: true },
            { field: 'PartyB', title: '乙方（物业公司/受托方）', width: 150, align: 'left', rowspan: 2, sortable: true },
            { field: 'ChargeMode', title: '收费模式', width: 100, align: 'left', rowspan: 2, sortable: true },

            { field: 'ConsultancyFee', title: '顾问服务费收费标准', width: 150, align: 'left', rowspan: 2, sortable: true },
            { field: 'ResidentPeple', title: '驻场管理人员人数', width: 150, align: 'left', rowspan: 2, sortable: true },
            { field: 'ResidentPepleFee', title: '驻场管理人员费用', width: 150, align: 'left', rowspan: 2, sortable: true },

            { field: 'ContractTotalAmount', title: '合同总金额', width: 100, align: 'left', rowspan: 2, sortable: true },

            { title: '合同面积', width: 100, align: 'left', sortable: true, colspan: 3 },

            {
                field: 'ContractStartDate', title: '合同起始日期', width: 100, align: 'left', rowspan: 2, sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ContractStartDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ContractTerminateDate', title: '合同终止日期', width: 100, align: 'left', rowspan: 2, sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ContractTerminateDate, "yyyy-MM-dd");
                    return str;
                }
            },
            {
                field: 'ContractDateSign', title: '合同签订日期', width: 100, align: 'left', rowspan: 2, sortable: true,
                formatter: function (value, row, index) {
                    var str = formatDate(row.ContractDateSign, "yyyy-MM-dd");
                    return str;
                }
            },
            { field: 'ContractStatus', title: '合同履行状态', width: 100, align: 'left', rowspan: 2, sortable: true },
            { field: 'Remarks', title: '备注', width: 100, align: 'left', rowspan: 2, sortable: true }
        ],
        [
            { field: 'CaseBuildArea', title: '案场建筑面积', width: 100, align: 'left', sortable: false },
            { field: 'WastelandCleanArea', title: '开荒清洁面积', width: 100, align: 'left', sortable: false },
            { field: 'GreenConservationArea', title: '绿化养护面积', width: 100, align: 'left', sortable: false }
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
                onBeforeLoad: function (param) {
                    param = $.JQForm.GetParam("MarketingService", "GetList", "TableContainer", param);
                }
            });
            $("#SearchDlg").dialog("close");
        }

        //显示详细
        function ViewDetail(title, OpType, Params) {
            HDialog.Open(w - 100, h - 100, '../InformationManage/MarketingServiceInfoManage.aspx?' + Params + '&OpType=' + OpType, title, true, function callback(_Data) {
                if (_Data == "1") {
                    LoadList();
                }
            });
        }

        //删除
        function DeleteHouseHold(MID) {
            $.messager.confirm('确定', '是否删除该项', function (r) {
                if (r) {
                    $.tool.DataGet('MarketingService', 'deletes', 'MID=' + MID,
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

        function SelCommInfo() {
            HDialog.Open(900, 400, '../DialogNew/SelComm.aspx?IsCheck=1', "选择管理项目", false, function callback(_Data) {
                var arrRet = JSON.parse(_Data);
                $("#CommIDs").val(arrRet.id);
                $("#CommNames").val(arrRet.name);
            });
        }
    </script>
</body>
</html>
