<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaiverReceivableDetails.aspx.cs" Inherits="M_Main.ChargesNew.WaiverReceivableDetails" %>

<!DOCTYPE html>


<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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

    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

</head>
<body>
    <form id="frmForm" runat="server">
                <input id="FromIndex" name="FromIndex" type="hidden" runat="server" /> 
        <input id="CorpCostIDs" name="CorpCostIDs" value="" type="hidden" runat="server" />
        <input style="width: 8px" id="hiRoomSigns" size="1" type="hidden" name="hiRoomSigns" runat="server" />
        <input style="width: 8px" id="RoomIDs" size="1" type="hidden" name="RoomIDs" runat="server" />
        <input style="width: 8px" id="hiRegionNames" size="1" type="hidden" name="hiRegionNames" runat="server" />
        <input style="width: 8px" id="CustID" class="easyui-validatebox" size="1" type="hidden" name="CustID" runat="server" />
        <input style="width: 12px" id="hiCustName" class="easyui-validatebox" size="1" type="hidden" name="hiCustName" runat="server" />
        <input style="width: 8px" id="RoomID" class="easyui-validatebox" size="1" type="hidden" name="RoomID" runat="server" />
        <input style="width: 8px" id="hiRoomSign" class="easyui-validatebox" size="1" type="hidden" name="hiRoomSign" runat="server" />
        <input style="width: 8px" id="CarparkIDs" class="easyui-validatebox" size="1" type="hidden" name="CarparkIDs" runat="server" />
        <input style="width: 8px" id="hiCarparkNames" class="easyui-validatebox" size="1" type="hidden" name="hiCarparkNames" runat="server" />
        <input style="width: 8px" id="hiParkNames" class="easyui-validatebox" size="1" type="hidden" name="hiParkNames" runat="server" />
        <input style="width: 8px" id="ParkIDs" class="easyui-validatebox" size="1" type="hidden" name="ParkIDs" runat="server" />
        <input style="width: 8px" id="hiCostNames" class="easyui-validatebox" size="1" type="hidden" name="hiCostNames" runat="server" />
        <input style="width: 8px" id="RegionSNums" size="1" type="hidden" name="RegionSNums" runat="server" />
        <input style="width: 8px" id="hiCommID" size="1" type="hidden" name="hiCommID" runat="server" />
        <input style="width: 8px" id="hiLoginUserCode" size="1" type="hidden" name="hiLoginUserCode" runat="server" />
        <input style="width: 8px" id="hiIsSQLData" size="1" type="hidden" name="hiIsSQLData" runat="server" />
        <input id="hiIsTransfer" size="1" type="hidden" name="hiIsTransfer" runat="server" />

        <input style="width: 8px" id="WaivID" size="1" type="hidden" name="WaivID" runat="server" />
        <input style="width: 8px" id="ProtocolNumber" size="1" type="hidden" name="ProtocolNumber" value="" runat="server" />


        <input id="CostIDs" class="easyui-validatebox" size="1" type="hidden" name="CostIDs" runat="server" />
        <input id="StanIDs" class="easyui-validatebox" size="1" type="hidden" name="StanIDs" runat="server" />
        <input id="hiStanNames" class="easyui-validatebox" size="1" type="hidden" name="hiStanNames" runat="server" />
        <input style="height: 22px; width: 32px" id="Hidden14" size="1" type="hidden" name="PageIndex"
            runat="server" /><input style="height: 21px; width: 24px" id="Hidden15" size="1" type="hidden" name="PrintParms"
                runat="server" /><input style="height: 22px; width: 24px" id="Hidden16" size="1" type="hidden" name="CostGeneType"
                    runat="server" /><input style="height: 21px; width: 24px" id="Hidden17" size="1" type="hidden" name="OptCode"
                        runat="server" /><input style="height: 21px; width: 24px" id="Hidden18" size="1" type="hidden" name="Flag" runat="server">

        <div id="tb">
        </div>

        <div class="easyui-datagrid" id="TableContainer">
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");

                $("#scExcel").attr('disabled', 'disabled');
            }


            var w = $(window).width();
            var h = $(window).height();

            InitTableHeight();

            //修改
            function ViewDetail(title, OpType, ID) {
                HDialog.Open(700, 300, '../ChargesNew/WaiverReceivableManager.aspx?Id=' + ID + '&OpType=update&WaivID=' + GetQueryString("WaivID"), title, false, function callback(_Data) {
                    LoadList(1, 50);
                    window.parent.LoadLastMoney();
                });


            }


            var NewCol = [[
                {
                    field: 'ComPanyName', title: '单位名称', align: 'left', sortable: true, width: 150, fixed: true,
                    formatter: function (value, row, index) {
                        var str = row.IsSettlementFees == 1 ? row.ComPanyName : "<a class=\"HrefStyle\" href=\"javascript:ViewDetail('修改应收明细','update','" + row.Id + "');\">" + row.ComPanyName + "</a>";
                        return str;
                    }
                },
                {
                    field: 'CustName', title: '客户名称', align: 'left', sortable: true, width: 150, fixed: true,

                },
                { field: 'RoomSign', title: '房屋编号', align: 'left', sortable: true, width: 150, fixed: true },
                { field: 'ProtocolNumber', title: '协议编号', align: 'left', sortable: true, width: 150, fixed: true },
                //{ field: 'CostName', title: '费用名称', align: 'left', sortable: true, width: 150, fixed: true },
                {
                    field: 'ReceivableTime', title: '应收时间', align: 'left', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                        var str = formatDate(row.ReceivableTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'BeginTime', title: '开始时间', align: 'left', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                        var str = formatDate(row.BeginTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                {
                    field: 'EndTime', title: '结束时间', align: 'left', sortable: true, width: 150, fixed: true, formatter: function (value, row, index) {
                        var str = formatDate(row.EndTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'ReceivableaAmount', title: '应收金额', align: 'left', sortable: true, width: 150, fixed: true },
                {
                    field: 'CollectionTime', title: '收款时间', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = formatDate(row.CollectionTime, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'CollectionStyle', title: '收款方式', width: 200, align: 'left', sortable: true },
                {
                    field: 'IsSettlementFees', title: '是否结算', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = row.IsSettlementFees == 1 ? "是" : "否";
                        return str;
                    }
                }

            ]];


            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            var toolbar = [
                {
                    text: '新增',
                    iconCls: 'icon-add',
                    handler: function () {
                        HDialog.Open(700, 300, '../ChargesNew/WaiverReceivableManager.aspx?OpType=Insert&WaivID=' + GetQueryString("WaivID"), '新增应收明细', false, function callback(_Data) {

                            LoadList(1, 50);

                        });
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


                        if (row.IsSettlementFees == 1) {
                            HDialog.Info('已结算，不能删除 ');
                            return;
                        }

                        DelRecord(row.Id);
                    }
                }, '-',
                {

                    text: '生成明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        if ($("#hiIsTransfer").val() == "True") {
                            HDialog.Info("转移的协议不能生成结算明细");
                            return false;
                        }
                        $.tool.DataPost('WaiversFees', 'ReceivableDetails', $('#frmForm').serialize(),
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data != "") {
                                    HDialog.Info(_Data);
                                } else {
                                    LoadList(1, 50);
                                }

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                }, '-',
                {
                    id: 'prompt',
                    text: '减免总额',

                }
            ];


            function setIsSQLData() {
                $('#hiIsSQLData').val(1);
                LoadList(1, 50);
            }





            //删除
            function DelRecord(Id) {

                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {

                        $.tool.DataGet('WaiversFees', 'WaiversReceivableDelete', 'Id=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                if (_Data == "true") {
                                    HDialog.Info('删除成功');

                                }
                                else { HDialog.Info('删除失败'); }

                                LoadList(1, 50);

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }



            function LoadList(Listpage, ListSize) {

                $.tool.DataPost('WaiversFees', 'WaiverReceivableDetails', "page=" + Listpage + "&rows=" + ListSize + "&" + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var Data = eval("(" + _Data + ")"); //转换为json对象
                        GetTitle();
                        LoadListBindingColumn(Data, ListSize);
                        document.getElementById('hiIsSQLData').value = 2;

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function LoadListBindingColumn(_Data, ListSize) {

                $("#TableContainer").datagrid({
                    data: _Data,
                    method: "get",
                    title: '',
                    loadMsg: '',
                    nowrap: false,
                    pageSize: ListSize,
                    pageList: top.ListPageList,
                    columns: NewCol,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    rownumbers: true,
                    border: false,
                    onAfter: function (target) {
                    },

                    onLoadSuccess: function () {

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

                                    LoadList(Pn, Ps);
                                    $('#TableContainer').datagrid('options').pageNumber = Pn;
                                    $('#TableContainer').datagrid('options').pageSize = Ps;

                                }
                            });
                        }

                    },
                    onLoadError: function () {
                        alert('生成失败！在操作完成之前超时时间已过或服务器未响应。!');
                    }
                });
            }

            $(document).ready(
                function () {
                    if (GetQueryString("WaivID") != null) {

                        LoadList(1, 50)

                    }
                }
            )




            function GetTitle() {

                $.tool.DataPost('WaiversFees', 'GetPointOut', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var reslut = _Data;
                        if (reslut != "") {
                            $("#prompt").html("<font color=red>*减免总额:" + reslut.split('|')[0] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明细总额:" + reslut.split('|')[1] + "</font>");
                        } else {
                            $("#prompt").html("<font color=red>*减免总额:0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明细总额:0.00</font>");
                        }


                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //document.getElementById('hiIsSQLData').value = -1;
            //LoadList(1, 50)
            function ToExcel() {

                //location.href = "FeesDebtCutSearchAgingExcel.aspx";
            }
        </script>
    </form>
</body>
</html>
