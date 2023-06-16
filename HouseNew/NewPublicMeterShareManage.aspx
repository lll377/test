<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPublicMeterShareManage.aspx.cs" Inherits="M_Main.HouseNew.NewPublicMeterShareManage" %>

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
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
         <div class="datagrid-mask"  style="height: 100%; width: 150%;"></div>
    <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px;border:1px solid #cccccc;z-index:999999;'>
        <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border:1px solid #cccccc;margin-top: 10px;'></div>
        <div id='DivMsg' style='width: 200px; text-align: center;margin-top:5px;'></div>
    </div>

        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="tbb">
            <table cellspacing="0" cellpadding="0" width="100%">


                <tr>
                    <td>&nbsp;公用表<input class="easyui-searchbox" id="CalcMeterName" maxlength="50" name="CalcMeterName" data-options="editable:false" searcher="SelCalcMeterName" runat="server" />
                        <input type="hidden" name="CalcMeterID" id="CalcMeterID" runat="server" />&nbsp;&nbsp;年度
				   <select id="CreYear" name="CreYear" runat="server">
                       <option selected></option>
                   </select>年<input id="hiCreYear"
                       size="1" type="hidden" name="hiCreYear" runat="server">
                        &nbsp;&nbsp;月份
				   <select id="CreMonth" name="CreMonth" runat="server">
                       <option selected></option>
                   </select>月&nbsp;&nbsp;<input id="hiCreMonth"
                       size="1" type="hidden" name="hiCreMonth" runat="server">

                        <a href="#" id="ins" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick=" JavaScript:CalcMeter(); ">分摊</a>
                        <a href="#" id="ins" class="easyui-linkbutton" iconcls="icon-search" plain="true" onclick=" JavaScript:Search(); ">筛选</a>
                        <a href="#" id="ins" class="easyui-linkbutton" iconcls="icon-page_white_excel" plain="true" onclick=" JavaScript:ExportExcel(); ">导出Excel</a>
                        <a href="#" id="ins" class="easyui-linkbutton" iconcls="icon-help" plain="true" onclick=" JavaScript:TiShi(); ">备注</a>
                    </td>

                </tr>
                <tr>
                </tr>
                <tr>
                    <td style="text-align: center; font-size: 14px; font-weight: bold">分摊明细</td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px;">
            <table style="width: 100%;">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" data-options="editable:false" maxlength="50" name="CustName" searcher="SelCust" runat="server" />

                        <input type="hidden" name="CustID" id="CustID" runat="server" /></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="RoomSign" maxlength="50" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">公用表
                    </td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="MeterName" maxlength="50" data-options="editable:false" name="MeterName" searcher="SelMeterName" runat="server" />
                        <input type="hidden" name="MeterID" id="MeterID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input id="IsCustFee" style="margin-left: 17px;" name="IsCustFee" type="checkbox" />只显示有房号的客户
                            <input id="hiIsCustFee" name="hiIsCustFee" type="hidden" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="tishi" class="easyui-dialog" title="备注" data-options="iconCls:'icon-search',closed: true,modal:true" style="width: 580px; height: 150px; padding: 10px;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" style='color: Red'>
                <tr>
                    <td rowspan="4" width="40px" valign="top" style='color: Black'>备注：</td>
                    <td>1、如果一个表一个月抄表多次，分摊时每次抄表分摊一笔费用。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>2、分摊入账时，先分摊，再入账；如发现分摊有误，先调整分摊设置或抄表读数后重新分摊，重新分摊后覆盖原分摊结果。
                    </td>
                </tr>
                <tr>
                    <td style='line-height: 20px'>3、如分摊并入账后才发现分摊有误，可在“撤销入账”模块撤销已分摊入账的费用。
                    </td>
                </tr>
            </table>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function ExportExcel() {
                window.location.href = '../HouseNew/NewPublicMeterShareManageCreExcel.aspx';
            }


            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
            }
            InitFunction();

            function Search() {
                $('#SearchDlg').parent().appendTo($("form:first"))
                $('#SearchDlg').dialog('open');
            }
            function SelMeterName() {

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, "../dialogNew/PublicMeterDlg.aspx?IsParticShare=1", '公区表选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新

                        var obj = JSON.parse(_Data);

                        $('#MeterID').val(obj.MeterID);
                        $('#MeterName').searchbox('setValue', obj.MeterName);

                    }
                });

            }

            function SelCalcMeterName() {

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, "../dialogNew/PublicMeterDlg.aspx?IsParticShare=1", '公区表选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新

                        var obj = JSON.parse(_Data);

                        $('#CalcMeterID').val(obj.MeterID);
                        $('#CalcMeterName').searchbox('setValue', obj.MeterName);

                    }
                });

            }

            function TiShi() {
                $('#tishi').parent().appendTo($("form:first"))
                $('#tishi').dialog('open');
            }

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

                                                    $('#RoomID').val(data[i].RoomID.split("|")[0]);


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
            function SelRoom() {
                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

                var conent = "../DialogNew/RoomDlg.aspx";

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);

                });

            }

            var column = [[
                { field: 'test', title: 'test', align: 'left', sortable: true, width: 120,  hidden: true },
                {
                    field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail(" + row.ShareID + ");\">" + row.CustName + "</a>";
                        return str;
                    }
                },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 100, align: 'left', sortable: true },
                { field: 'MeterSign', title: '公用表编号', width: 100, align: 'left', sortable: true },
                { field: 'MeterName', title: '公用表名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'ListDate', title: '抄表日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ListDate, "yyyy-MM-dd");
                        return str;
                    }
                },

                {
                    field: 'LastListDate', title: '上次抄表日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.LastListDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'PoolTypeName', title: '分摊方式', width: 120, align: 'left', sortable: true },
                { field: 'GrossNum', title: '统计总数', width: 100, align: 'left', sortable: true },
                { field: 'ShareRate', title: '分摊权重', width: 100, align: 'left', sortable: true },
                { field: 'BaseNum', title: '所占数量', width: 100, align: 'left', sortable: true },
                { field: 'TotalDosage', title: '总用量', width: 100, align: 'left', sortable: true },
                { field: 'ShareDosage', title: '所占用量', width: 100, align: 'left', sortable: true },
                { field: 'Price', title: '单价', width: 100, align: 'left', sortable: true },

                { field: 'GrossAmount', title: '分摊总额', width: 100, align: 'left', sortable: true },
                { field: 'ShareAmount', title: '分摊额', width: 100, align: 'left', sortable: true },
                { field: 'ModifyAmount', title: '修改额', width: 100, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 100, align: 'left', sortable: true },
                {
                    field: 'ListDueDate', title: '费用日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ListDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'FeesHint', title: '费用提示', width: 200, align: 'left', sortable: true }
            ]];



            function ViewDetail(ShareID) {

                var w = 500;
                var h = 320;


                HDialog.Open(w, h, "../HouseNew/PublicMeterShareManage.aspx?OPType=edit&ShareID=" + ShareID, '公用表分摊明细', false, function callback(_Data) {
                    LoadList();
                });
            }

            function LoadList() {
                if ($('#IsCustFee').is(':checked')) {
                    $('#hiIsCustFee').val(1);
                }
                else {
                    $('#hiIsCustFee').val(0);
                }

                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    width: "100%",
                    toolbar: toolbar,
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    toolbar: '#tbb',
                    sortOrder: "asc",
                    showFooter: true,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("Meter", "PublicMeterShare", "TableContainer", param);
                    },
                    rowStyler: function (index, row) {
                        if (row.test == 'footer') {
                            return 'background-color:#F4F4F4;border:none;';
                        }

                    },
                    onLoadSuccess: function (data) {
                        $.tool.DataPostNoLoading('Meter', "PublicMeterShareSum", $('#frmForm').serialize(),
                            function Init() {
                                //加载页脚
                                $('#TableContainer').datagrid('reloadFooter', [
                                    {
                                        test: 'footer',
                                        CustName: "<span style='color:red'>合计</span>",
                                        ShareRate: "<span style='color:red'>0.0000</span>",
                                        BaseNum: "<span style='color:red'>0.0000</span>",
                                        ShareDosage: "<span style='color:red'>0.0000</span>",
                                        ShareAmount: "<span style='color:red'>0.0000</span>",
                                        ModifyAmount: "<span style='color:red'>0.0000</span>"
                                    }
                                ]);
                            },
                            function callback(_Data) {
                                if (_Data != "") {
                                    var data = _Data.split('|');
                                    //加载页脚
                                    $('#TableContainer').datagrid('reloadFooter', [
                                        {
                                            test: 'footer',
                                            CustName: "<span style='color:red'>合计</span>",
                                            ShareRate: "<span style='color:red'>" + data[0] + "</span>",
                                            BaseNum: "<span style='color:red'>" + data[1] + "</span>",
                                            ShareDosage: "<span style='color:red'>" + data[2] + "</span>",
                                            ShareAmount: "<span style='color:red'>" + data[3] + "</span>",
                                            ModifyAmount: "<span style='color:red'>" + data[4] + "</span>"
                                        }
                                    ]);
                                }
                            });
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            //重写DataGrid,支持更改页脚样式
            var myview = $.extend({}, $.fn.datagrid.defaults.view, {
                renderFooter: function (target, container, frozen) {
                    var opts = $.data(target, 'datagrid').options;
                    var rows = $.data(target, 'datagrid').footer || [];
                    var fields = $(target).datagrid('getColumnFields', frozen);
                    var table = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'];

                    for (var i = 0; i < rows.length; i++) {
                        var styleValue = opts.rowStyler ? opts.rowStyler.call(target, i, rows[i]) : '';
                        var style = styleValue ? 'style="' + styleValue + '"' : '';
                        table.push('<tr class="datagrid-row" datagrid-row-index="' + i + '"' + style + '>');
                        table.push(this.renderRow.call(this, target, fields, frozen, i, rows[i]));
                        table.push('</tr>');
                    }
                    table.push('</tbody></table>');
                    $(container).html(table.join(''));
                }
            });

            LoadList();

            function CalcMeter() {

                DealData();
                //$.tool.DataPost('Meter', 'MeterCalc', $('#frmForm').serialize(),
                //    function Init() {
                //    },
                //    function callback(_Data) {
                //        if (_Data == "true") {
                //            HDialog.Info('分摊成功');
                //        }
                //        else {
                //            HDialog.Info('分摊失败');
                //        }
                //        LoadList();
                //    },
                //    function completeCallback() {
                //    },
                //    function errorCallback() {

                //    });
            }



            var ProgressInterval;

            function DealData() {

                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }


            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('PublicMeterCalc', 'StartTask', $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    //  LoadData();
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
            }

            //展示进度
            //ShowProgress();
            ////获取执行情况进度
            //ProgressInterval = setInterval("TakeProgress()", 1000);


            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('PublicMeterCalc', 'TakeProgress', $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {

                    var Obj = JSON.parse(_Data);

                    if (_Data == '[]') {

                        CloseProgress();

                        LoadList();
                    }
                    else {
                        SetProgress(Obj);

                        if (Obj[0].Curr == '100') {

                            CloseProgress();

                            if (Obj[0].IsComplete == '0') {
                                HDialog.Info('分摊成功!');
                            }

                            LoadList();

                        }
                        else {
                        }
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {
                });
            }
            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());                
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 350) / 2, top: ht + 240 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }


        </script>
    </form>
</body>
</html>

