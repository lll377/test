<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanDetail_Add_Inspection.aspx.cs" Inherits="M_Main.EquipmentNew.PlanDetail_Add_Inspection" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>设备级别设置</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script language="javascript" src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script language="javascript" src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script language="javascript" src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />

    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

            .Container ul {
                margin: 0px auto;
                clear: both;
            }

                .Container ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: center;
                    margin-bottom: 10px;
                    line-height: 22px;
                    width: 30%;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 65%;
                }

                .Container ul .Title {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 100%;
                }

                .Container ul .ContentBlank {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .Container ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                }

            .Container .Content input {
                width: 99%;
                border: 1px solid #cccccc;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content select {
                height: 22px;
            }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 350px; height: 170px; padding: 10px;">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;">
                <tr>
                    <td class="TdTitle">设备系统</td>
                    <td class="TdContent">
                        <input id="RankName" name="RankName" type="text" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">标准代码</td>
                    <td class="TdContent">
                        <input id="StandardCode" name="StandardCode" type="text" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">标准名称</td>
                    <td class="TdContent">
                        <input id="StandardName" name="StandardName" type="text" /></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadBindDetail();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="Container">
            <table style="width: 100%; font-size: 12px; font-family: 微软雅黑;" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="TdTitle" style="width: 8%">设备名称:</td>
                    <td class="TdContent" style="width: 75%">
                        <input id="EquipmentName" name="EquipmentName" type="text" readonly="readonly" style="width: 98%; border: 1px #cccccc solid" /></td>
                    <td class="TdContent" style="width: 20%">
                        <input type="button" class="button" value="选择设备" id="BtnSelectEq" onclick="SelectEq();" /></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <div style="width: 100%; background-color: #cccccc;" id="DivContainerDetail">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center" style="height: 40px">
                        <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
                        <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
                    </td>
                </tr>
            </table>

        </div>
        <input type="hidden" id="PlanId" name="PlanId" />
        <input type="hidden" id="RankId" name="RankId" />
        <input type="hidden" id="EquipmentId" name="EquipmentId" />
        <input type="hidden" id="InspectionStandardIds" name="InspectionStandardIds" />
        <script type="text/javascript">
            function Close() {
                HDialog.Close();
            }
            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;

            }

            function SelectEq() {
                HDialog.Open('700', '460', '../EquipmentNew/SelEquipmentByPlanId_Inspection.aspx?PlanId=' + $("#PlanId").val(), '选择设备', false, function callback(_Data) {
                    if (_Data != "") {
                        var str = _Data.split('|');
                        $("#RankId").val(str[0]);
                        $("#EquipmentName").val(str[1]);
                        $("#EquipmentId").val(str[2]);
                    }
                    LoadBindDetail();
                });
            }

            function Save() {
                if ($("#RankId").val() == "") {
                    HDialog.Info("请选择设备");
                    return;
                }
                var row = $("#DivContainerDetail").datagrid("getChecked");
                var str = "";
                if (row.length > 0) {
                    for (var i = 0; i < row.length; i++) {
                        str += "," + row[i].Id;
                    }
                    if (str.length > 0)
                        str = str.substr(1, str.length - 1);
                } else {
                    HDialog.Info("请选择巡检标准");
                    return;
                }
                $("#InspectionStandardIds").val(str);
                $.tool.DataPostChk('frmForm', 'CsEquipment', 'SavePlanDetail_Inspection', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        HDialog.Close();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            function InitTableHeight() {
                var h = $(window).height() - 78;
                $("#DivContainerDetail").css("height", h + "px");
            }

            InitTableHeight();
            var column = [[
                { field: 'ck', checkbox: true },
                { field: 'Sort', title: '序号', width: 10, align: 'left', sortable: true },
                { field: 'StandardCode', title: '标准代码', width: 15, align: 'left', sortable: true },
                { field: 'StandardName', title: '标准名称', width: 35, align: 'left', sortable: true },
                { field: 'RankName', title: '设备级别', width: 20, align: 'left', sortable: true },
                { field: 'InspectionTypeName', title: '巡检类别', width: 20, align: 'left', sortable: true }

            ]];
            var toolbar =
                [{
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');
                    }
                }];

            function LoadBindDetail() {
                $("#PlanId").val(GetQueryString("PlanId"));
                // url = '/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=CsEquipment&Command=PlanGetStandardList_Inspection&' + $('#frmForm').serialize();
                if ($("#RankId").val() == "") {
                    url = null;
                }
                $("#DivContainerDetail").datagrid({
                    //url: url,
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "Post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    singleSelect: false,
                    rownumbers: true,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    pagination: true,
                    remoteSort: false,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    onLoadSuccess: function () {
                        $("#SearchDlg").dialog("close");
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("CsEquipment", "PlanGetStandardList_Inspection", "DivContainerDetail", param);
                    }
                });
            }
            LoadBindDetail();
        </script>
    </form>
</body>
</html>
