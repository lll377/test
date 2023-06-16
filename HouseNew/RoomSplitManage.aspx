<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomSplitManage.aspx.cs" Inherits="M_Main.HouseNew.RoomSplitManage" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>
    <script type="text/javascript" src="../jscript/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framedialog_eightcol.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
</head>
<body onresize="resizeGrid();">
    <form id="frmForm" runat="server">
        <input id="RoomID" name="RoomID" runat="server" type="hidden" />
        <input id="BuildSNum" name="BuildSNum" runat="server" type="hidden" />
        <input id="FloorSNum" name="FloorSNum" runat="server" type="hidden" />
        <input id="UnitSNum" name="UnitSNum" runat="server" type="hidden" />
        <input id="hiBuildArea" type="hidden" size="2" name="hiBuildArea" runat="server" />
        <input id="hiRoomSign" type="hidden" size="2" name="hiRoomSign" runat="server" />
        <input id="sumBuildArea" type="hidden" size="2" name="sumBuildArea" runat="server" value="0" />
        <input id="sumCalcArea" type="hidden" size="2" name="sumCalcArea" runat="server" value="0" />
        <table class="DialogTable">

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第一步：选择原始房屋</span> </td>
            </tr>
            <tr>
                <td class="DialogContent" colspan="4">房屋编号 &nbsp;
                    <input class="easyui-searchbox" id="RoomSign" data-options="editable:false" name="RoomSign" searcher="SelSplitRoom" runat="server" />
                    &nbsp;拆分数量&nbsp;<input class="easyui-validatebox" id="RoomSNum" data-options="prompt:'请输入数字',required:true,validType:'positiveint'" onblur="LoadSplitRoomList();" style="width: 40px; border: 1px solid #cccccc; height: 20px; line-height: 20px;" name="RoomSNum" runat="server" />
                    &nbsp;建筑面积&nbsp;<input class="easyui-validatebox" id="BuildArea" readonly style="width: 80px" name="BuildArea" runat="server" />
                    &nbsp;计费面积&nbsp;<input class="easyui-validatebox" id="CalcArea" readonly style="width: 80px" name="CalcArea" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;"><span style="font-size: 16px">第二步：设置拆分房号</span> </td>
            </tr>

            <tr>
                <td>
                    <div style="width: 100%; background-color: #cccccc;" id="TableContainer">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <div style="height: 12px; width: 100%">&nbsp;</div>
                    <input type="button" class="button" value="确定拆分" onclick="IsSaveSplit();" id="BtnSave" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">

            $('#RoomSNum').val(2);

            function SelSplitRoom() {
                var conent = "../DialogNew/RoomSplitDlg.aspx";
                var w = $(window).width();
                var h = $(window).height();

                HDialog.Open(w, h, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#BuildArea').val(data.BuildArea);
                    $('#RoomID').val(data.RoomID);
                    $('#hiRoomSign').val(data.RoomSign);
                    $('#hiBuildArea').val(data.BuildArea);
                    $('#BuildSNum').val(data.BuildSNum);
                    $('#FloorSNum').val(data.FloorSNum);
                    $('#UnitSNum').val(data.UnitSNum);
                    $('#CalcArea').val(data.CalcArea);
                    LoadSplitRoomList();
                });
            }


            var column = [[

                 { field: 'RoomSign', title: '房屋编号', width: '300', align: 'left', sortable: true, editor: { type: 'validatebox' } },
                 {
                     field: 'BuildArea', title: '建筑面积', width: '300', align: 'left', sortable: true
                     , editor: {
                         type: 'validatebox',
                         options: {
                             validType: 'digital'
                         }
                     }
                 },
                 {
                     field: 'InteriorArea', title: '套内面积', width: '300', align: 'left', sortable: true
                     , editor: {
                         type: 'Numberbox',
                         options: {
                             min: 0,
                             precision: 2
                         }
                     }
                 },
                 {
                     field: 'CommonArea', title: '公摊面积', width: '300', align: 'left', sortable: true, editor: {
                         type: 'Numberbox',
                         options: {
                             min: 0,
                             precision: 2
                         }
                     }
                 }

            ]];

            function InitTableHeight() {
                var h = $(window).height();
                h = h - 160;
                $("#TableContainer").css("height", h + "px");
            }
            InitTableHeight();
            var editIndex = undefined;
            function LoadList(_Data) {

                $("#TableContainer").datagrid({
                    data: _Data,
                    title: '',
                    nowrap: false,
                    pageSize: $('#RoomSNum').val(),
                    pageList: [$('#RoomSNum').val()],
                    columns: column,
                    fitColumns: true,
                    singleSelect: true,
                    pagination: true,
                    rownumbers: true,
                    width: "100%",
                    border: false,
                    sortOrder: "asc",
                    onLoadSuccess: function (data) {

                    }
                });


            }
            function LoadSplitRoomList() {
                if (parseFloat($('#RoomSNum').val()) > 20) {
                    HDialog.Info("房屋拆分数量不能大于20!");
                    $('#RoomSNum').focus();
                    return;
                }
                $.tool.DataPost('Room', 'loadsplitroomlist', "page=1&rows=" + top.ListPageSize + "&" + $('#frmForm').serialize(),
                                 function Init() {

                                 },
                                 function callback(_Data) {
                                     var Data = eval("(" + _Data + ")"); //转换为json对象
                                     column = [[

                                     { field: 'RoomSign', title: '房屋编号', width: '300', align: 'left', sortable: true, editor: { type: 'validatebox' } },
                                     {
                                         field: 'BuildArea', title: '建筑面积', width: '300', align: 'left', sortable: true
                                         , editor: {
                                             type: 'validatebox',
                                             options: {
                                                 validType: 'digital'
                                             }
                                         }
                                     },

                                      {
                                          field: 'CalcArea', title: '计费面积', width: '300', align: 'left', sortable: true
                                         , editor: {
                                             type: 'validatebox',
                                             options: {
                                                 validType: 'digital'
                                             }
                                         }
                                      },

                                     {
                                         field: 'InteriorArea', title: '套内面积', width: '300', align: 'left', sortable: true, editor: {
                                             type: 'validatebox',
                                             options: {
                                                 validType: 'digital'
                                             }
                                         }
                                     },
                                     {
                                         field: 'CommonArea', title: '公摊面积', width: '300', align: 'left', sortable: true, editor: {
                                             type: 'validatebox',
                                             options: {
                                                 validType: 'digital'
                                             }
                                         }
                                     }

                                     ]];

                                     LoadList(Data);

                                     var Rows = $("#TableContainer").datagrid('getRows');
                                     for (var i = 0; i < Rows.length; i++) {
                                         $('#TableContainer').datagrid('beginEdit', i);
                                         if (i == 0) {
                                             var ed = $('#TableContainer').datagrid('getEditor', { index: i, field: 'RoomSign' });
                                             $(ed.target).focus();
                                         }
                                     }


                                 },
                                 function completeCallback() {
                                 },
                                 function errorCallback() {

                                 });


            }
            LoadSplitRoomList();
            function SplitRoomvalidate(obj) {
                var val = $('#' + obj).val();

                if (val == "") {
                    obj.value == "";
                    $.messager.alert("提示", "待拆分的房号不能为空", "", function () { $('#' + obj).focus(); });

                }

            }
            function SumBuildArea(obj) {
                var mj = parseFloat($('#sumBuildArea').val()) + parseFloat(obj);
                $('#sumBuildArea').val(mj);
            }
            function SumCalcArea(obj) {
                var mj = parseFloat($('#sumCalcArea').val()) + parseFloat(obj);
                $('#sumCalcArea').val(mj);
            }


            function diffBuildArea(obj) {
                var mj = parseFloat($('#sumBuildArea').val()) - parseFloat(obj);
                $('#sumBuildArea').val(mj);
            }
            function IsSaveSplit() {
                if ($('#RoomID').val() == "") {
                    HDialog.Info("请选择要拆分的房屋");
                    return;
                }
                else if (parseFloat($('#RoomSNum').val()) <= 1) {
                    HDialog.Info("房屋拆分数量必须大于1!");
                    $('#RoomSNum').focus();
                    return;
                }
                else if (parseFloat($('#sumBuildArea').val()) > parseFloat($('#BuildArea').val())) {
                    HDialog.MessageBox("拆分房屋面积大于原始房屋面积!", function Yes() {
                        RoomSplitSub();
                    }, function No() {

                        var Rows = $("#TableContainer").datagrid('getRows');
                        for (var i = 0; i < Rows.length; i++) {
                            $('#TableContainer').datagrid('beginEdit', i);
                            if (i == 0) {
                                var ed = $('#TableContainer').datagrid('getEditor', { index: i, field: 'RoomSign' });
                                $(ed.target).focus();
                            }
                        }
                    });
                }


                else {
                    RoomSplitSub();
                }
            }

            function OnBlur_RoomSign(strBuildSNum, strUnitSNum, strFloorSNum, roomSign) {
                if ((strBuildSNum != "") && (strUnitSNum != "")) {
                    $.ajax({
                        type: "post",
                        url: "RoomSplitManage.aspx/GetRoomSign",
                        data: "{'strRoomSgin':'" + roomSign + "','strBuildSNum':'" + strBuildSNum + "','strUnitSNum':'" + strUnitSNum + "','strFloorSNum':'" + strFloorSNum + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.d == "true") {
                                HDialog.Info("拆分列表中[" + roomSign + "]房屋编号数据库中已存在!");
                                return false;
                            } else {
                                return true;
                            }
                        },
                        error: function (err) {

                        }
                    });
                }
            }
            function RowEditor() {
                var Rows = $("#TableContainer").datagrid('getRows');
                for (var i = 0; i < Rows.length; i++) {
                    $('#TableContainer').datagrid('beginEdit', i);
                    if (i == 0) {
                        var ed = $('#TableContainer').datagrid('getEditor', { index: i, field: 'RoomSign' });
                        $(ed.target).focus();
                    }
                }
            }
            function RoomSplitSub() {
                $('#TableContainer').datagrid('acceptChanges');
                var RowsData = $("#TableContainer").datagrid('getData');
                var RoomSigns = "";
                var BuildAreass = "";
                var InteriorAreas = "";
                var CommonAreas = "";
                var BuildCalcArea = "";
                var sumbuilarea = 0;
                var sumCalcArea = 0;
                for (var i = 0; i < RowsData.rows.length; i++) {
                    //判断拆分列表中是否存在重复编号
                    if (RoomSigns.indexOf(RowsData.rows[i].RoomSign) > -1) {
                        HDialog.Info("拆分列表存在重复房屋编号,无法进行后续操作!");
                        RowEditor();
                        return false;
                    }
                    //判断数据库中是否存在此房屋编号
                    if (OnBlur_RoomSign($("#BuildSNum").val(), $("#UnitSNum").val(), $("#FloorSNum").val(), RowsData.rows[i].RoomSign) == false)
                    { RowEditor(); return false; }
                    RoomSigns = RoomSigns + "|" + RowsData.rows[i].RoomSign;
                    sumbuilarea = parseFloat(sumbuilarea) + parseFloat(RowsData.rows[i].BuildArea)
                    BuildAreass = BuildAreass + "|" + RowsData.rows[i].BuildArea;
                    InteriorAreas = InteriorAreas + "|" + RowsData.rows[i].InteriorArea;
                    CommonAreas = CommonAreas + "|" + RowsData.rows[i].CommonArea;

                    sumCalcArea = parseFloat(sumCalcArea) + parseFloat(RowsData.rows[i].CalcArea)
                    BuildCalcArea = BuildCalcArea + "|" + RowsData.rows[i].CalcArea;
                }

                RoomSigns = RoomSigns.substring(1, RoomSigns.length);
                BuildAreass = BuildAreass.substring(1, BuildAreass.length);
                InteriorAreas = InteriorAreas.substring(1, InteriorAreas.length);
                CommonAreas = CommonAreas.substring(1, CommonAreas.length);

                BuildCalcArea = BuildCalcArea.substring(1, BuildCalcArea.length);

                if (parseFloat(sumCalcArea) > parseFloat($('#CalcArea').val())) {
                    HDialog.MessageBox("拆分计费面积大于原始计费面积!", '确定', '取消', function Yes() {

                        if (parseFloat(sumbuilarea) > parseFloat($('#BuildArea').val())) {
                            HDialog.MessageBox("拆分房屋面积大于原始房屋面积!", '确定', '取消', function Yes() {
                                $.tool.DataGet2('Room', 'roomsplit', "RoomSigns=" + RoomSigns + "&BuildCalcArea=" + BuildCalcArea + "&BuildAreass=" + BuildAreass + "&InteriorAreas=" + InteriorAreas + "&CommonAreas=" + CommonAreas + $("#frmForm").serialize(),
                               function Init() {
                               },
                               function callback(_Data) {
                                   if (_Data == "true") {
                                       HDialog.Info("拆分成功");
                                       close();
                                   }
                                   else { HDialog.Info('输入错误,请重新输入'); }
                               },
                               function completeCallback() {
                               },
                               function errorCallback() {

                               });

                            }, function No() {
                                var Rows = $("#TableContainer").datagrid('getRows');
                                for (var i = 0; i < Rows.length; i++) {
                                    $('#TableContainer').datagrid('beginEdit', i);
                                    if (i == 0) {
                                        var ed = $('#TableContainer').datagrid('getEditor', { index: i, field: 'RoomSign' });
                                        $(ed.target).focus();
                                    }
                                }
                            });
                        }
                        else {
                            $.tool.DataGet2('Room', 'roomsplit', "RoomSigns=" + RoomSigns + "&BuildAreass=" + BuildAreass + "&InteriorAreas=" + InteriorAreas + "&CommonAreas=" + CommonAreas + $("#frmForm").serialize(),
                                         function Init() {
                                         },
                                         function callback(_Data) {
                                             if (_Data == "true") {
                                                 HDialog.Info("拆分成功");
                                                 close();
                                             }
                                             else { HDialog.Info('输入错误,请重新输入'); }
                                         },
                                         function completeCallback() {
                                         },
                                         function errorCallback() {

                                         });
                        }






                    }, function No() {
                        var Rows = $("#TableContainer").datagrid('getRows');
                        for (var i = 0; i < Rows.length; i++) {
                            $('#TableContainer').datagrid('beginEdit', i);
                            if (i == 0) {
                                var ed = $('#TableContainer').datagrid('getEditor', { index: i, field: 'RoomSign' });
                                $(ed.target).focus();
                            }
                        }
                    });
                }
                else {
                    $.tool.DataGet2('Room', 'roomsplit', "RoomSigns=" + RoomSigns + "&BuildAreass=" + BuildAreass + "&InteriorAreas=" + InteriorAreas + "&CommonAreas=" + CommonAreas + $("#frmForm").serialize(),
                                 function Init() {
                                 },
                                 function callback(_Data) {
                                     if (_Data == "true") {
                                         HDialog.Info("拆分成功");
                                         close();
                                     }
                                     else { HDialog.Info('输入错误,请重新输入'); }
                                 },
                                 function completeCallback() {
                                 },
                                 function errorCallback() {

                                 });
                }




            }

            function close() {
                HDialog.Close('');
            }

            function resizeGrid() {

                $('#TableContainer').datagrid('resize', {
                    width: function () { return document.body.clientWidth; },
                    height: function () { return document.body.clientHeight; }
                });
            }
        </script>
    </form>
</body>
</html>
