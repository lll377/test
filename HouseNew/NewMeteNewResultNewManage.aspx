<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewMeteNewResultNewManage.aspx.cs" Inherits="M_Main.HouseNew.NewMeteNewResultNewManage" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../jscript/pagewalkthrough/jquery.pagewalkthrough.min.js"></script>
    <link href="../jscript/pagewalkthrough/css/jquery.pagewalkthrough.css" rel="stylesheet" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/style.css" type="text/css" rel="stylesheet" />
    <link href="../css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../jscript/jquery.ztree.core-3.5.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .Container {
            width: 100%;
            font-size: 12px;
            font-family: 微软雅黑;
        }

        .ContainerLeft {
            float: left;
            overflow-y: auto;
            width: 20%;
            border-right: 1px solid #cccccc;
        }

        .ContainerRight {
            float: left;
            width: 80%;
            overflow: auto;
        }
    </style>

    <script type="text/javascript">


        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        $(document).ready(function () {

            var setting1 = {
                treeId: 'ztrees',
                async: {
                    enable: true,
                    url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTree",
                    autoParam: ["Id", "IsJude", "RegionSNum", "BuildSNum", "UnitSNum", "FloorSNum"],
                    otherParam: ['selCommId', $("#CommID").val()]
                },
                callback: {
                    onClick: onClick
                }
            };

            $.fn.zTree.init($("#trees"), setting1, null);

            if (GetQueryString("ShowType") == "1") {
                $('body').pagewalkthrough({
                    name: 'introduction3',
                    steps: [{
                        wrapper: '#ListDate',
                        popup: {
                            content: '<span style=\'font-size:30px\'>选择抄表日期</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        }
                    },
                    {
                        wrapper: '#ins',
                        popup: {
                            content: '<span style=\'font-size:30px\'>点击新增</span>',
                            type: 'tooltip',
                            position: 'bottom'
                        },
                        onLeave: function (e) {
                            if (e) {
                                GetShowStepOpenDilog();
                                HDialog.Close();
                            }
                        }
                    }
                    ],
                    buttons: {
                        // ID of the button
                        jpwClose: {
                            // Translation string for the button
                            i18n: '关闭'
                            // Whether or not to show the button.  Can be a boolean value, or a
                            // function which returns a boolean value

                        },
                        jpwNext: {
                            i18n: '下一步 &rarr;'
                            // Function which resolves to a boolean

                        },
                        jpwPrevious: {
                            i18n: '&larr; 上一步'

                        },
                        jpwFinish: {
                            i18n: '下一步 &rarr;'

                        }
                    },
                    onClose: function () {
                        HDialog.Close();
                    }
                })

                $('body').pagewalkthrough('show');
            }
        }
        )

        //var setting = {
        //    data: {
        //        simpleData: {
        //            enable: true,
        //            idKey: "BuildTreeCode",
        //            pIdKey: "PrentBuildTreeCode"
        //        },
        //        key: {
        //            name: "BuildTreeName"
        //        }
        //    },
        //    callback: {
        //        beforeClick: beforeClick,
        //        onClick: onClick
        //    },
        //    view: {
        //        fontCss: getFont,
        //        nameIsHTML: false
        //    }
        //};
        function getFont(treeId, node) {
            return node.font ? node.font : {};
        }

        function beforeClick(treeId, treeNode, clickFlag) {
        }
        function onClick(event, treeId, treeNode, clickFlag) {
            debugger;
            // parent.$("#ReceFeesBrowse").attr("src", "ReceFeesBrowse.aspx?CommID=" + treeNode.CommID + "&RoomID=" + treeNode.RoomID);
            $('#RoomID').val(treeNode.RoomID);
            if (treeNode.RegionSNum != undefined) {
                $('#RegionSNum').val(treeNode.RegionSNum);
            }
            if (treeNode.BuildSNum != undefined) {
                $('#BuildSNum').val(treeNode.BuildSNum);
            }
            if (treeNode.UnitSNum != undefined) {
                $('#UnitSNum').val(treeNode.UnitSNum);
            }
            if (treeNode.FloorSNum != undefined) {
                $('#FloorSNum').val(treeNode.FloorSNum);
            }
            var roomsign = '';
            if (treeNode.RoomID != '0' && treeNode.RoomID != '') {
                roomsign = treeNode.name;
            }
            $('#lbRoomSign').html(roomsign);

            var selObj = $("#ListDate");
            $.tool.DataPostNoLoading("Meter", "RoomMeterListDate", $('#FrmForm').serialize()
                , function Init() { }
                , function CallBack(_Data) {
                    var obj = JSON.parse(_Data);
                    selObj.empty();
                    if (obj.rows.length > 0) {
                        for (var i = 0; i < obj.rows.length; i++) {
                            selObj.append("<option value='" + obj.rows[i].ListDate + "'>" + obj.rows[i].ListDate + "</option>");
                        }
                    }
                    LoadData(1);
                    $('#RegionSNum').val('');
                    $('#BuildSNum').val('');
                    $('#UnitSNum').val('');
                    $('#FloorSNum').val('');
                }
                , function completeCallback() { }
                , function errorCallback() {
                });
        }

        // 添加  
        function col_add() {

        }

        <%--        var zNodes =<%= Meternodes1 %>
			$(document).ready(function () {
			    var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
			    var treeNode = treeObj.getNodeByParam("BuildTreeCode", "<%= MeterselTreeCode1 %>", null);
			    treeObj.expandNode(treeNode, true, false, true);
			});--%>

        function SelRommSign() {
            debugger;
            var SelRoomSign = $('#SelRoomSign').searchbox('getValue');
            var strCommID = $("#CommID").val();
            var setting = null;
            if (SelRoomSign == "") {
                setting = {
                    treeId: 'ztrees',
                    async: {
                        enable: true,
                        url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTree",
                        autoParam: ["Id", "IsJude", "RegionSNum", "BuildSNum", "UnitSNum", "FloorSNum"],
                        otherParam: ['selCommId', $("#CommID").val()]
                    },
                    callback: {
                        onClick: onClick
                    }
                };
            }
            else {
                setting = {
                    treeId: 'ztrees',
                    async: {
                        enable: true,
                        url: "/HM/M_Main/HC/DataPostControl.aspx?Method=DataPost&Class=ReceFees&Command=GetReceTreeByRoomSign",
                        otherParam: {
                            "RoomSign": function () { return SelRoomSign; },
                            "selCommId": function () { return strCommID; }
                        }
                    },
                    callback: {
                        onClick: onClick
                    }
                };
            }
            $.fn.zTree.init($("#trees"), setting, null);
        }

    </script>

</head>
<body>
    <form id="FrmForm" runat="server">
        <input type="hidden" id="UnitSNum" name="UnitSNum" />
        <input type="hidden" id="BuildSNum" name="BuildSNum" />
        <input type="hidden" id="FloorSNum" name="FloorSNum" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="RoomID" name="RoomID" runat="server" />
        <input type="hidden" id="RoomSign" name="RoomSign" runat="server" />
        <input type="hidden" id="status" name="status" runat="server" />
        <input type="hidden" id="ReceFees" name="ReceFees" runat="server" />
        <input type="hidden" id="HListDate" name="HListDate" runat="server" />
        <input type="hidden" id="hiMemo" name="hiMemo" runat="server" />
        <input type="hidden" id="DelType" name="DelType" runat="server" />
        <input type="hidden" id="HiMeterID" name="HiMeterID" runat="server" />
        <input type="hidden" name="PageBools" id="PageBools" value="" runat="server" />
        <input id="CustID" style="width: 24px; height: 22px" type="hidden" size="1" name="CustID"
            runat="server" /><input id="CustName" style="width: 24px; height: 22px" type="hidden" size="1" name="CustName"
                runat="server" /><input id="IsCalFees" style="width: 24px; height: 22px" type="hidden" size="1" name="IsCalFees"
                    runat="server" />
        <input id="getRoomListDate" name="getRoomListDate" runat="server" type="button" onserverclick="getRoomListDate_ServerClick" />
        <input id="DeleteMeter" name="DeleteMeter" runat="server" type="button" onserverclick="DeleteMeter_ServerClick" />
        <input id="CreFees" name="CreFees" runat="server" type="button" onserverclick="CreFees_ServerClick" />
        <div class="Container" id="Container">
            <div id="ContainerLeft" class="ContainerLeft">
                <table id="RoomFrameTree" name="RoomFrameTree">
                    <tr>
                        <td valign="top">
                            <input type="text" id="SelRoomSign" class="easyui-searchbox" data-options="prompt:'请输入房号',searcher:SelRommSign" />
                            <div id="trees" class="ztree" runat="server">
                            </div>
                            <div id="LeftTop1" style="width: 100%; text-align: center; display: none">
                                楼宇目录树
                            </div>
                            <div id="LeftTop2" style="width: 100%; display: none">
                                楼宇：
                              <asp:DropDownList ID="SelBuildSNum" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelBuildSNum_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div id="LeftTop3" style="display: none">
                                <div>
                                    <asp:Label ID="lbHint" runat="server"></asp:Label>
                                    <div id="treeDemo" class="ztree" runat="server">
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <div id="tbb">
            房号：<span id="lbRoomSign" runat="server"></span>
            &nbsp;&nbsp;抄表日期:
                    <select id='ListDate' name="ListDate" style='width: 100px' runat="server" onchange="ListDateChange()"></select>
            <a href="#" id="ins" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick=" JavaScript:InsertMeter(); ">新增</a>
            <a href="#" id="insFees" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick=" JavaScript:CalcMeterFees(); ">入账</a>
            <a href="#" id="update" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick=" JavaScript:UpdateMeter(); ">修改</a>
            <a href="#" id="del" class="easyui-linkbutton" iconcls="icon-cancel" plain="true" onclick=" JavaScript:DeleteMeter(); ">删除</a>
            <a href="#" id="calcfee" class="easyui-linkbutton" iconcls="icon-save" plain="true" onclick=" JavaScript:CalcMeterFees(); ">入账</a>
            <span id="Memo" style="color: red">提示：</span>
        </div>
        <div id="ContainerRight" class="ContainerRight">

            <div>
                <div style="width: 100%;" id="TableContainer"></div>
            </div>

        </div>

        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">


            function InitFunction() {
                var h = $(window).height();
                var w = $(window).width() - $('#ContainerLeft').width() - 2;
                var h1 = h - 10;
                if ($("#PageBools").val() == "1") {
                    $("#tbb").hide();
                    $("#Container").hide();
                    $("#tbb").attr("disabled", "disabled");
                    $("#Container").attr("disabled", "disabled");
                    $("#tbb").html("");
                    $("#Container").html("");
                }
                $("#ContainerLeft").css("height", h1 + "px");

                $("#treeDemo").css("height", h1 + "px");
                $("#TableContainer").css("height", h + "px");
                $("#ContainerRight").css("width", w + "px");
                $('#getRoomListDate').hide();
                $('#DeleteMeter').hide();
                $('#CreFees').hide();
                if ($('#CustID').val() == "" || $('#CustID').val() == "0") {
                    $("#calcfee").hide();
                }
                if ($('#ReceFees').val() != "") {
                    $("#Container").hide();
                    $("#ContainerRight").css("width", $(window).width() + "px");
                }
            }
            InitFunction();

            var column = [[


                { field: 'MeterSign', title: '编号', width: 100, align: 'left', sortable: true },
                { field: 'MeterName', title: '名称', width: 50, align: 'left', sortable: true },
                { field: 'MeterTypeName', title: '类型', width: 50, align: 'left', sortable: true },
                {
                    field: 'ListDate', title: '抄表日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                        var str = formatDate(row.ListDate, "yyyy-MM-dd");
                        return str;
                    }
                },
                { field: 'StartDegree', title: '起数', width: 50, align: 'left', sortable: true },
                { field: 'EndDegree', title: '止数', width: 50, align: 'left', sortable: true },
                { field: 'Ratio', title: '倍率', width: 50, align: 'left', sortable: true },
                { field: 'Dosage', title: '用量', width: 50, align: 'left', sortable: true },
                { field: 'OldDosage', title: '旧表用量', width: 100, align: 'left', sortable: true },
                { field: 'ExtraDosage', title: '损耗', width: 50, align: 'left', sortable: true },
                { field: 'TotalDosage', title: '合计用量', width: 100, align: 'left', sortable: true },
                { field: 'Price', title: '单价', width: 50, align: 'left', sortable: true },
                { field: 'Amount', title: '金额', width: 100, align: 'left', sortable: true },
                { field: 'MeterHint', title: '异常提示', width: 200, align: 'left', sortable: true },
                { field: 'OwnerCustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'IsAuditName', title: '是否冻结', width: 100, align: 'left', sortable: true },
                { field: 'MeterSource', title: '抄表来源', width: 100, align: 'left', sortable: true },
                { field: 'MeterPerson', title: '抄表人', width: 100, align: 'left', sortable: true },
                { field: 'InputDate', title: '录入时间', width: 100, align: 'left', sortable: true }

            ]];

            function ListDateChange() {
                LoadData(1);
            }
            function LoadList(_Data) {


                $("#TableContainer").datagrid({
                    data: _Data,
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
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    sortOrder: "asc",
                    toolbar: '#tbb',
                    onLoadSuccess: function (data) {
                    }
                });

            }
            function LoadData(page) {
                $.tool.DataPost('Meter', 'CustomerMeterResult', "page=" + page + "&rows=" + top.ListPageSize + "&" + $('#FrmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var dd = _Data.split('|');
                        var status = dd[1];
                        var Memo = dd[2];
                        $('#Memo').html("提示:" + Memo);

                        $('#hiMemo').val(Memo);
                        $('#status').val(status);

                        var Data = eval("(" + dd[0] + ")"); //转换为json对象
                        LoadList(Data);

                        var selObj = $("#ListDate").val();
                        if (selObj != "") {
                            $.tool.DataPostNoLoading("Meter", "RoomMeterListDate", $('#FrmForm').serialize()
                                , function Init() { }
                                , function CallBack(_Data) {
                                    var obj = JSON.parse(_Data);
                                    selObj.empty();
                                    if (obj.rows.length > 0) {
                                        for (var i = 0; i < obj.rows.length; i++) {
                                            selObj.append("<option value='" + obj.rows[i].ListDate + "'>" + obj.rows[i].ListDate + "</option>");
                                        }
                                    }
                                    LoadData(1);
                                    //var selObj = $("#ListDate");
                                    //var value = "value";
                                    //var text = "text";
                                    //

                                }
                                , function completeCallback() { }
                                , function errorCallback() {
                                });
                        }

                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            }

            LoadData(1);

            function ViewDetail(title, OpType, RoomID, MeterID) {

                var w = 700;
                var h = 280;

                HDialog.Open(w, h, '../HouseNew/MeterManage.aspx?RoomID=' + RoomID + '&OpType=' + OpType + '&MeterID=' + MeterID, title, false, function callback(_Data) {
                    LoadList();
                });
            }

            //打开新增页面的指引页
            function GetShowStepOpenDilog() {
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../HouseNew/ResultInsManage.aspx?OPType=Insert&ShowType=1&RoomID=' + $('#RoomID').val() + '&CustID=' + $('#CustID').val(), '新增抄表', false, function callback(_Data) {
                    if (_Data == "1") {
                        $('body').pagewalkthrough('close');
                    }
                });
            }

            function InsertMeter() {
                var status = $('#status').val();
                var Memo = $('#hiMemo').val();
                var RoomID = $('#RoomID').val();
                if (RoomID == "" || RoomID == "0") {
                    HDialog.Info('请选择房号');
                    return;
                }
                //if (status == "-1")
                //{
                //    HDialog.Info($('#hiMemo').val());

                //}
                //else
                //{
                //    if (Memo.indexOf('冻结') > -1) {
                //        HDialog.Info($('#hiMemo').val());
                //    }
                //    else {

                //        var w = $(window).width();
                //        var h = $(window).height();

                //        HDialog.Open(w, h, '../HouseNew/ResultInsManage.aspx?OPType=Insert&RoomID=' + $('#RoomID').val() + '&CustID=' + $('#CustID').val(), '新增抄表', false, function callback(_Data) {
                //            if (_Data == "1") {
                //                document.getElementById('getRoomListDate').click();
                //                LoadData(1);
                //            }
                //        });
                //    }
                //}

                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, '../HouseNew/ResultInsManage.aspx?OPType=Insert&RoomID=' + $('#RoomID').val() + '&CustID=' + $('#CustID').val(), '新增抄表', false, function callback(_Data) {
                    if (_Data == "1") {
                        //document.getElementById('getRoomListDate').click();
                        //LoadData(1);

                        var selObj = $("#ListDate");
                        $.tool.DataPostNoLoading("Meter", "RoomMeterListDate", $('#FrmForm').serialize()
                            , function Init() { }
                            , function CallBack(_Data) {

                                var obj = JSON.parse(_Data);
                                selObj.empty();
                                if (obj.rows.length > 0) {

                                    for (var i = 0; i < obj.rows.length; i++) {
                                        selObj.append("<option value='" + obj.rows[i].ListDate + "'>" + obj.rows[i].ListDate + "</option>");
                                    }
                                }
                                LoadData(1);
                                //var selObj = $("#ListDate");
                                //var value = "value";
                                //var text = "text";
                                //

                            }
                            , function completeCallback() { }
                            , function errorCallback() {
                            });

                    }
                });

            }
            function UpdateMeter() {
                var status = $('#status').val();
                var Memo = $('#hiMemo').val();
                var RoomID = $('#RoomID').val();
                if (RoomID == "" || RoomID == "0") {
                    HDialog.Info('请选择房号');
                    return;
                }
                if (status == "-1") {
                    HDialog.Info($('#hiMemo').val());
                }
                else {
                    if (Memo.indexOf('冻结') > -1) {
                        HDialog.Info($('#hiMemo').val());
                    }
                    else {
                        var w = $(window).width();
                        var h = $(window).height();
                        var strListDate = $('#ListDate').val();

                        HDialog.Open(w, h, '../HouseNew/ResultEdtManage.aspx?OPType=Edit&RoomID=' + $('#RoomID').val() + '&CustID=' + $('#CustID').val() + "&ListDate=" + strListDate, '修改抄表', false, function callback(_Data) {
                            if (_Data == "1") {
                                document.getElementById('getRoomListDate').click();
                                LoadData(1);
                            }
                        });
                    }
                }
            }
            function DeleteMeter() {
                var status = $('#status').val();
                var Memo = $('#hiMemo').val();
                var RoomID = $('#RoomID').val();
                if (RoomID == "" || RoomID == "0") {
                    HDialog.Info('请选择房号');
                    return;
                }
                if (status == "-1") {
                    HDialog.Info($('#hiMemo').val());
                }
                else {
                    if (Memo.indexOf('冻结') > -1) {
                        HDialog.Info($('#hiMemo').val());
                    }
                    else {

                        HDialog.MessageBox("删除当前抄表日期下数据确认", "删除全部", "删除单条",
                            function () {
                                $("#DelType").val(0);
                                $.messager.confirm('确定', '是否全部删除', function (r) {
                                    if (r) {
                                        document.getElementById('DeleteMeter').click();
                                    }
                                });
                            }, function () {
                                var row = $("#TableContainer").datagrid("getSelected");
                                if (row == null) {
                                    HDialog.Info('请选择一条抄表删除！');
                                    return;
                                }
                                $("#DelType").val(1);
                                $("#HiMeterID").val(row.MeterID);

                                $.messager.confirm('确定', '是否删除该项', function (r) {
                                    if (r) {
                                        document.getElementById('DeleteMeter').click();
                                    }
                                });
                            });

                    }
                }
            }

            function DelRecord(Id) {
                $.messager.confirm('确定', '是否删除该项', function (r) {
                    if (r) {
                        $.tool.DataGet('Meter', 'CustomerMeterDelete', 'MeterID=' + Id,
                            function Init() {
                            },
                            function callback(_Data) {

                                var Data = _Data.split("|");
                                if (Data[0] == "true") {
                                    HDialog.Info('删除成功');
                                }
                                else { HDialog.Info(Data[1]); }
                                LoadList();
                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                });
            }

            //单户抄表
            function CalcMeterFees() {
                if (CustID == "" || CustID == "0") {

                    return;
                }
                else {

                    var checkText = $("#ListDate").find("option:selected").text()
                    $.tool.DataGet('Meter', 'Check', 'ListDate=' + checkText,
                        function Init() {
                        },
                        function callback(_Data) {
                            if (_Data == "true") {
                                $('#HListDate').val($('#ListDate').val());

                                document.getElementById('CreFees').click();
                            }
                            else {
                                HDialog.Info('已结账，无法入账')
                            }
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });



                }
            }

            function CalcMeterFees() {
                if (CustID == "" || CustID == "0") {
                    return;
                }
                else {
                    $('#HListDate').val($('#ListDate').val());
                    document.getElementById('CreFees').click();
                }
            }
            function LoadMeterDate() {
                var selObj = $("#ListDate");
                $.tool.DataPostNoLoading("Meter", "RoomMeterListDate", $('#FrmForm').serialize()
                    , function Init() { }
                    , function CallBack(_Data) {
                        var obj = JSON.parse(_Data);
                        selObj.empty();
                        if (obj.rows.length > 0) {
                            for (var i = 0; i < obj.rows.length; i++) {
                                selObj.append("<option value='" + obj.rows[i].ListDate + "'>" + obj.rows[i].ListDate + "</option>");
                            }
                        }
                        LoadData(1);
                    }
                    , function completeCallback() { }
                    , function errorCallback() {
                    });
            }
        </script>
    </form>
</body>
</html>

