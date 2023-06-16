<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetIncomeManage_ArrearsDetail.aspx.cs" Inherits="M_Main.BudgetNew.BudgetIncomeManage_ArrearsDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>预算管理-欠费回收计划管理页面</title>
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <style type="text/css">
        #SearchDlg {
            padding: 10px;
            width: 660px;
            height: auto;
        }

        .SearchTable {
            width: 660px;
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
                width: 13%;
                text-align: right;
                background: #F8F8F8;
            }

            .SearchTable tr .TdContentSearch {
                width: 15%;
                text-align: left;
                background: #fff;
            }

        .TdContentSearch input {
            border: 1px #cccccc solid;
            border-radius: 5px 5px 5px 5px;
        }
    </style>
</head>
<body style="padding: 0px; margin: 0px; overflow: hidden;">
    <form id="frmForm" runat="server">
        <input type="hidden" id="ArrearsRecoveryPlanID" name="ArrearsRecoveryPlanID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <div id="TableContainer"></div>
        <div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width: 120px;">
            <div data-options="name:'SelectOk',iconCls:'icon-add'">确定选择</div>
            <div data-options="name:'SelectOkCancel',iconCls:'icon-cancel'">取消选择</div>
            <div data-options="name:'SelectAll',iconCls:'icon-add'">全部选择</div>
            <div data-options="name:'SelectAllcancel',iconCls:'icon-cancel'">全部取消</div>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" style="overflow: hidden;" data-options="iconCls:'icon-search',closed: true,modal:true">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <input id="BuildNames" class="easyui-searchbox" searcher="SelBuild" data-options="editable:false"
                            name="BuildNames" runat="server" />
                        <input id="BuildSNums" type="hidden" name="BuildSNums" runat="server" />
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContentSearch">
                        <input id="RegionNames" class="easyui-searchbox" searcher="SelRegion" data-options="editable:false"
                            name="RegionNames" runat="server">
                        <input id="RegionSNums" type="hidden" name="RegionSNums" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContentSearch">
                        <input id="RoomStateNames" class="easyui-searchbox" searcher="SelRoomState" data-options="editable:false"
                            name="RoomStateNames" runat="server" />
                        <input id="RoomStates" type="hidden" name="RoomStates" runat="server" />
                    </td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostNames" class="easyui-searchbox" data-options="editable:false" searcher="SelCost"
                            name="CostNames" runat="server">
                        <input id="CostIDs" type="hidden" name="CostIDs" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称
                    </td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust" name="CustName" class="easyui-searchbox" runat="server" data-options="editable:false" />
                        <input id="CustID" type="hidden" name="CustID" runat="server" />
                    </td>
                    <td class="TdTitle">可选房号
                    </td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 140px;" class="easyui-combobox" data-options="editable:false,panelHeight: '160'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号
                    </td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" searcher="SelRoom" name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" />
                        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">客户类别
                    </td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" style="width: 140px" name="CustTypeID" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">费用时间从
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datebox" id="FeesStartDate" runat="server" name="FeesStartDate" data-options="editable:false" />
                    </td>
                    <td class="TdTitle">至
                    </td>
                    <td class="TdContentSearch">
                        <input type="text" class="easyui-datebox" id="FeesEndDate" runat="server" name="FeesEndDate" data-options="editable:false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; padding-top: 5px;">
                        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',width:80" onclick="LoadList();">确定筛选</a>
                        <%--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload',width:80" onclick="$('#frmForm').form('clear')">清空</a>--%>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">

            //楼宇选择
            function SelBuild() {
                HDialog.Open('700', '400', "../dialogNew/MultiBuildingDlg.aspx?CommID=" + $("#CommID").val(), '楼宇选择', false, function callback(_Data) {
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
                    }
                });
            }

            //组团选择
            function SelRegion() {
                HDialog.Open('700', '400', "../dialogNew/MultiRegionDlg.aspx?CommID=" + $("#CommID").val(), '组团选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("|");
                        var RegionSNums = "";
                        var RegionNames = "";
                        $('#RegionSNums').val(RegionSNums);
                        $('#RegionNames').searchbox('setValue', RegionNames);

                        for (var i = 0; i < varObjects.length; i++) {
                            if (varObjects[i].indexOf(",") > 0) {

                                RegionSNums = RegionSNums + "," + varObjects[i].split(',')[2];
                                RegionNames = RegionNames + "," + varObjects[i].split(',')[1];
                            }
                        }
                        $('#RegionSNums').val(RegionSNums.substring(1, RegionSNums.length));
                        $('#RegionNames').searchbox('setValue', RegionNames.substring(1, RegionNames.length));
                    }
                });
            }

            //交房状态
            function SelRoomState() {
                var strRoomStates = "";
                HDialog.Open('700', '450', "../dialogNew/MultiRoomStateDlg.aspx" + "?RoomStates=" + strRoomStates + "&Ram=" + Math.random() + "&CommID=" + $("#CommID").val(), '房屋状态选择', false, function (_data) {
                    var varReturn = _data;
                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");
                        $('#RoomStates').val(varObjects[0]);
                        $('#RoomStateNames').searchbox('setValue', varObjects[1]);
                    }
                });
            }

            //费用项目选择
            function SelCost() {
                HDialog.Open('700', '450', "../dialogNew/MultiCorpCommCostDlg.aspx?CommID=" + $('#CommID').val(), '费用项目选择', false, function callback(_Data) {
                    if (_Data != "") {//**获得返回 刷新
                        var varObjects = _Data.split("\t");
                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                    }
                });
            }

            //选择客户
            function SelCust() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                HDialog.Open(700, 400, "../DialogNew/CustDlg.aspx?CommID=" + $('#CommID').val(), '客户选择', false, function callback(_Data) {
                    if (_Data != "") {
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
                    }

                });
            }

            //选择房号
            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx?CommID=" + $('#CommID').val();
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    if (_Data != "") {
                        var data = JSON.parse(_Data);
                        $('#RoomSign').searchbox("setValue", data.RoomSign);
                        $('#CustName').searchbox("setValue", data.CustName);
                        $('#CustID').val(data.CustID);
                        $('#RoomID').val(data.RoomID);
                        $('#SelectRoomID').combobox({
                            data: '',
                            valueField: 'RoomID',
                            textField: 'RoomText'
                        });
                    }
                });
            }

            //页面加载
            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
            }

            var column = [[
                //{ field: 'ck', checkbox: true },
                //{ field: 'IsSelName', title: '是否选择', align: 'center', width: 60, sortable: true },
                { field: 'CustName', title: '客户名称', align: 'left', width: 140, sortable: true },
                { field: 'RoomSign', title: '房屋编号', align: 'left', width: 160, sortable: true },
                { field: 'BuildArea', title: '建筑面积', align: 'center', width: 80, sortable: true },
                { field: 'BuildName', title: '楼栋', align: 'left', width: 140, sortable: true },
                { field: 'FeeDueYearMonth', title: '费用日期', align: 'center', width: 100, sortable: true },
                { field: 'CostName', title: '费用项目', align: 'left', width: 120, sortable: true },
                { field: 'CostSNum', title: '费用序号', align: 'center', width: 60, sortable: true },
                { field: 'MobilePhone', title: '联系电话', width: 100, align: 'left', sortable: true },
                { field: 'DueAmount', title: '欠费金额', width: 80, align: 'center', sortable: true }
            ]];
            //工具栏
            var toolbar = [
                //{
                //    text: '第一步:筛选欠费明细',
                //    iconCls: 'icon-search',
                //    handler: function () {
                //        $('#SearchDlg').parent().appendTo($("form:first"));
                //        $('#SearchDlg').dialog('open');
                //    }
                //}, '-',
                //{
                //    text: '第二步:编制清欠计划',
                //    iconCls: 'icon-edit',
                //    handler: function () {
                //        var h = $(window).height();
                //        var w = $(window).width();
                //        HDialog.Open(w, h, '../BudgetNew/BudgetIncomeManage_ArrearsSummerDetail.aspx?ArrearsRecoveryPlanID=' + $('#ArrearsRecoveryPlanID').val() + "&CommID=" + $('#CommID').val(), "编制清欠计划", false, function callback(_Data) {
                //        });
                //    }
                //}, '-',
                {
                    text: '编制清欠计划',
                    iconCls: 'icon-edit',
                    handler: function () {
                        var h = $(window).height();
                        var w = $(window).width();
                        HDialog.Open(w, h, '../BudgetNew/BudgetIncomeManage_ArrearsSummerDetail.aspx?ArrearsRecoveryPlanID=' + $('#ArrearsRecoveryPlanID').val() + "&CommID=" + $('#CommID').val(), "编制清欠计划", false, function callback(_Data) {
                        });
                    }
                }, '-',
                {
                    text: 'Excel导出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {
                        var Rows = $("#TableContainer").datagrid("getRows");
                        if (Rows.length == 0) {
                            HDialog.Info("没有数据导出!");
                            return;
                        }
                        window.open("BudgetIncomeManage_ArrearsDetailExport.aspx?random=" + Math.random() + $('#frmForm').serialize());
                    }
                }
                //, '-',
                //{
                //    text: '<span style=\"color:red\">*鼠标右击费用列表进行单个、批量选择或取消选择</span>'
                //}
            ];
            //加载列表
            function LoadList() {
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: true,
                    pageSize: 50,
                    pageList: [50, 100, 300],
                    columns: column,
                    rownumbers: true,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
                    singleSelect: true,
                    //checkOnSelect: true,
                    //selectOnCheck: false,
                    //onRowContextMenu: ContextMenu, // 绑定右键菜单
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Budget", "IncomeManage_GetArrearsDetailList", "TableContainer", param);
                    },
                    onLoadSuccess: function () {
                        $('#SearchDlg').dialog('close');
                    }
                });
            }

            //添加右击菜单内容
            function ContextMenu(e, rowIndex, rowData) {
                e.preventDefault();
                if (rowData) {
                    //$('#TableContainer').datagrid('selectRow', rowIndex);//选中当前行
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                }
            }
            //右键菜单点击
            function menuHandler(item) {
                //判断是否有勾选的项  如果没有就不进入判断
                var CheckedRows;
                if (item.name == "SelectOk" || item.name == "SelectOkCancel") {
                    CheckedRows = $("#TableContainer").datagrid("getChecked");
                    if (CheckedRows.length == 0) {
                        HDialog.Info("请至少勾选一条明细");
                        return;
                    }
                }
                switch (item.name) {
                    case "SelectOk":
                        //确定选择
                        SelectOkOrCancel(CheckedRows, "1");
                        break;
                    case "SelectOkCancel":
                        //取消选择
                        SelectOkOrCancel(CheckedRows, "0");
                        break;
                    case "SelectAll":
                        //选择全部
                        SelectAllOrSelectAllCancel("1");
                        break;
                    case "SelectAllcancel":
                        //全部取消
                        SelectAllOrSelectAllCancel("0");
                        break;
                }
            }

            //确定选择或者取消选择（针对勾选的数据）
            function SelectOkOrCancel(CheckedRows, Flag) {
                var IdList = "";
                for (var i = 0; i < CheckedRows.length; i++) {
                    IdList += CheckedRows[i].IID + ',';
                }
                if (IdList.length > 0) {
                    IdList = IdList.substring(0, IdList.length - 1);
                }
                $.tool.DataPost('Budget', 'IncomeManage_UpdateArrearsDetailIsSel', 'IdList=' + IdList + "&Flag=" + Flag,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "true") {
                            HDialog.Info(_Data);
                        } else {
                            HDialog.Info("修改状态成功");
                            LoadList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //全部选择或者全部取消选择
            function SelectAllOrSelectAllCancel(Flag) {
                $.tool.DataPost('Budget', 'IncomeManage_UpdateArrearsDetailAllIsSel', $('#frmForm').serialize() + "&Flag=" + Flag,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data != "true") {
                            HDialog.Info(_Data);
                        } else {
                            HDialog.Info("修改状态成功");
                            LoadList();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            //页面初始化
            $(function () {
                InitFunction();
                LoadList();

            })
        </script>
    </form>
</body>
</html>
