<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPublicMeterCalcManage.aspx.cs" Inherits="M_Main.HouseNew.NewPublicMeterCalcManage" %>

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

    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="ShareIDs" name="ShareIDs" runat="server" />
        <input type="hidden" id="IsPay" name="IsPay" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <div class="SearchContainer" id="TableContainer">
        </div>
        <div id="tbb">
            <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>年度
				   <select id="CreYear" name="CreYear" runat="server">
                       <option selected></option>
                   </select>年<input id="hiCreYear"
                       size="1" type="hidden" name="hiCreYear" runat="server">
                        &nbsp;&nbsp;月份
				   <select id="CreMonth" name="CreMonth" runat="server">
                       <option selected></option>
                   </select>月&nbsp;&nbsp;<input id="hiCreMonth"
                       size="1" type="hidden" name="hiCreMonth" runat="server">
                        <a href="#" id="ins" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick=" JavaScript:PublicMeterFees(); ">入账</a>                     
                        <a href="#" id="search" class="easyui-linkbutton" iconcls="icon-search" plain="true" onclick=" JavaScript:Search(); ">筛选</a>
                        <a href="#" id="excel" class="easyui-linkbutton" iconcls="icon-page_white_excel" plain="true" onclick=" JavaScript:ExportExcel(); ">导出Excel</a>
                        <a href="#" id="memo" class="easyui-linkbutton" iconcls="icon-help" plain="true" onclick=" JavaScript:TiShi(); ">备注</a>
                        <font style='color: Red'>*点击入账前，鼠标右键点击列表，选择或排除入账明细。</font>
                    </td>

                </tr>
                <%--<tr>
                <td>备注：1、如果一个表一个月抄表多次，分摊时每次抄表分摊一笔费用。2、分摊入账时，先分摊，再入账；如发现分摊有误，先调整分摊设置或抄表读数后重新分摊，重新分摊后覆盖原分摊结果。3、如分摊并入账后才发现分摊有误，可在“撤销入账”模块撤销已分摊入账的费用。</td>
            </tr>--%>
                <tr>
                    <td style="text-align: center; font-size: 14px; font-weight: bold">分摊明细</td>
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
        <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 200px;">
            <table style="width: 100%;">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CustName" maxlength="50" name="CustName" searcher="SelCust" runat="server" />

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
                        <input class="easyui-searchbox" id="RoomSign" dd="dd" maxlength="50" name="RoomSign" searcher="SelRoom" runat="server" />


                        <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                    </td>
                    <td class="TdTitle">公用表
                    </td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="MeterName" dd="dd" maxlength="50" name="MeterName" searcher="SelMeterName" runat="server" />
                        <input type="hidden" name="MeterID" id="MeterID" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input id="IsCustFee" name="IsCustFee" type="checkbox" />只显示有房号的客户
                            <input id="hiIsCustFee" name="hiIsCustFee" type="hidden" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadList();">筛选</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="menu" class="easyui-menu" style="width: 50px; display: none;">
            <!--放置一个隐藏的菜单Div-->

            <div data-options="iconCls:'icon-add'" onclick="SetShareIDs(1)">确定选择</div>
            <div data-options="iconCls:'icon-cancel'" onclick="SetShareIDs(0)">确定取消</div>
            <!--具体的菜单事件请自行添加，跟toolbar的方法是基本一样的-->
            <div data-options="iconCls:'icon-edit'" onclick="SetShareIDAll(1)">全部选择</div>
            <div data-options="iconCls:'icon-clear'" onclick="SetShareIDAll(0)">全部取消</div>
        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">

            function ExportExcel() {
                window.location.href = '../HouseNew/NewPublicMeterCalcManageCreExcel.aspx';
            }

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#SelectRoomID').css("width", 150 + 'px');
            }
            InitFunction();


            function TiShi() {
                $('#tishi').parent().appendTo($("form:first"))
                $('#tishi').dialog('open');
            }
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

            //全选控制
            var IsSelAll = false;
            function SelAllFees() {
                var rows = $('#TableContainer').datagrid('getRows');
                for (var i = 0; i < rows.length; i++) {
                    if (IsSelAll == false) {
                        var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);
                        $("#TableContainer").datagrid("selectRow", RI);
                        $("input[value='" + rows[i].ShareID + "']").prop("checked", true);
                    }
                    else {
                        var RI = $("#TableContainer").datagrid("getRowIndex", rows[i]);
                        $("#TableContainer").datagrid("unselectRow", RI);
                        $("input[value='" + rows[i].ShareID + "']").prop("checked", false);
                    }
                }
                if (IsSelAll == false) {
                    IsSelAll = true;
                }
                else {
                    IsSelAll = false;
                }
            }

            //CheckBox上面直接单击
            var IsCheckBoxClick = false;
            function Fids_Click(RowIndex) {
                IsCheckBoxClick = true;
            }

            //行点击
            function RowClick(RowIndex, Row) {
                ////如果已经通过CheckBox单击了
                if (IsCheckBoxClick == true) {
                    var IsSel = $("input[value='" + Row.ShareID + "']").is(':checked');
                    if (IsSel == true) {
                        $("#TableContainer").datagrid("selectRow", RowIndex);
                    }
                    else {
                        $("#TableContainer").datagrid("unselectRow", RowIndex);
                    }
                    IsCheckBoxClick = false;
                }
            }

            var column = [[
                {
                    field: 'ckb', checkbox: false, title: '<span id=\'SelAllSpan\' onclick=\'SelAllFees();\'>全选</span>', width: 70, align: 'center', sortable: false, formatter: function (value, row, index) {
                        var str = "<input onclick=\"Fids_Click('" + index + "');\" id='Fids" + index + "' name='Fids' type='checkbox' value=\"" + row.ShareID + "\" checked='checked' >";
                        return str;
                    }
                },
                { field: 'IsPayName', title: '是否入账', width: 70, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 100, align: 'left', sortable: true },
                { field: 'RoomName', title: '房屋名称', width: 100, align: 'left', sortable: true },
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
                    field: 'ListDueDate', title: '费用日期', width: 200, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ListDueDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'FeesHint', title: '费用提示', width: 200, align: 'left', sortable: true }
            ]];


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
                    onRowContextMenu: function (e, rowIndex, rowData) { //右键时触发事件
                        //三个参数：e里面的内容很多，真心不明白，rowIndex就是当前点击时所在行的索引，rowData当前行的数据
                        e.preventDefault(); //阻止浏览器捕获右键事件
                        $(this).datagrid("clearSelections"); //取消所有选中项
                        $(this).datagrid("selectRow", rowIndex); //根据索引选中该行
                        $('#menu').menu('show', {
                            //显示右键菜单
                            left: e.pageX,//在鼠标点击处显示菜单
                            top: e.pageY
                        });
                    },
                    onBeforeLoad: function (param) {
                        param = $.JQForm.GetParam("Meter", "PublicMeterShare", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {

                    },
                    onClickRow: function (rowIndex, rowData) {
                        RowClick(rowIndex, rowData);
                    }
                });
                $("#SearchDlg").dialog("close");
            }

            function SetShareIDs(IsPay) {
                $('#IsPay').val(IsPay);

                var strShareIDs = "";
                var chkbool = false;
                $("input[name='Fids']:checked").each(function () {
                    chkbool = true;
                    strShareIDs += this.value + ',';
                });
                if (chkbool == false) {
                    if (IsPay == 1) {
                        HDialog.Info('请勾选需要入账的明细！');
                    }
                    else {
                        HDialog.Info('请勾选需要取消的明细！');
                    }
                    
                    return;
                }

                strShareIDs = strShareIDs.substr(0, strShareIDs.length - 1);


                $("#ShareIDs").val(strShareIDs);

                $.tool.DataPost('PublicMeterInsFees', 'SetShareIDs', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        LoadList();
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            }

            function SetShareIDAll(IsPay)
            {
                $('#IsPay').val(IsPay);

                $.tool.DataPost('PublicMeterInsFees', 'SetShareIDAll', $('#frmForm').serialize(),
                   function Init() {
                   },
                   function callback(_Data) {
                       LoadList();
                   },
                   function completeCallback() {
                   },
                   function errorCallback() {
                   });
            }

            LoadList();

            var ProgressInterval;

            function PublicMeterFees() {                
                //启动任务
                StartTask();
                //展示进度
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            }

            function StartTask() {
                //启动一个任务
                $.tool.DataPostNoLoading('PublicMeterInsFees', 'StartTask', $('#frmForm').serialize(),
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

            ////展示进度
            //ShowProgress();
            ////获取执行情况进度
            //ProgressInterval = setInterval("TakeProgress()", 1000);


            //获取进度
            function TakeProgress() {
                $.tool.DataPostNoLoading('PublicMeterInsFees', 'TakeProgress', $('#frmForm').serialize(),
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
                                    HDialog.Info('入账成功!');
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

