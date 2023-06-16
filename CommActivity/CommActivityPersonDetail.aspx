<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommActivityPersonDetail.aspx.cs" Inherits="M_Main.CommActivity.CommActivityPersonDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>社区活动人员登记</title>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../Jscript-Ui/score/socre.css" rel="stylesheet" />
    <script type="text/javascript" src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/export.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .DialogTable tr td {
            height: 25px;
            line-height: 25px;
        }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">
        <input id="ActivitiesPersonId" type="hidden" name="ActivitiesPersonId" value="" runat="server" />
        <input id="ActivitiesId" type="hidden" name="ActivitiesId" value="" runat="server" />
        <input id="OptType" type="hidden" name="OptType" runat="server" />
        <input id="CustId" type="hidden" name="CustId" runat="server" />
        <input id="RoomId" type="hidden" name="RoomId" runat="server" />
        <input id="Score" type="hidden" name="Score" runat="server" />
        <table class="DialogTable" style="margin: 10px auto 60px auto; width: 88%">
            <tr>
                <td class="TdTitle">客户名称：</td>
                <td class="TdContentSearch">
                    <input id="CustName" class="easyui-searchbox" type="text" name="CustName" data-options="searcher:SelSponsor, prompt:'请选择发起人', editable:false" runat="server" />
                </td>
                <td class="TdTitle">可选房号：</td>
                <td class="TdContentSearch">
                    <select id="ComboRoom" class="easyui-combobox" style="width: 80%; cursor: pointer;" name="ComboRoom" data-options="editable:false" panelheight='auto'></select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">房屋编号：</td>
                <td class="TdContentSearch">
                    <input id="RoomSign" class="easyui-searchbox" type="text" name="RoomSign" data-options="searcher:SelRoom, prompt:'请选择房号', editable:false" runat="server" />
                </td>
                <td class="TdTitle">联系电话：</td>
                <td class="TdContentSearch">
                    <input id="LinkPhone" class="easyui-textbox" type="text" name="LinkPhone" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">报名人数：</td>
                <td class="TdContentSearch">
                    <input id="SignUpCount" class="easyui-textbox" type="text" name="SignUpCount" runat="server" />
                </td>
                <td class="TdTitle">参加人数：</td>
                <td class="TdContentSearch">
                    <input id="JoinCount" class="easyui-textbox" type="text" name="JoinCount" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户评分：</td>
                <td class="TdContentSearch">
                    <div id="raty"></div>
                </td>
                <%--<td class="TdTitle">报名户数：</td>
                <td class="TdContentSearch">
                    <input class="easyui-textbox" type="text" name="CustName" data-options="editable:false" value="1"/>
                </td>--%>
            </tr>
        </table>
        <div style="text-align: center; bottom: 0; position: fixed; width: 100%; height: 50px; line-height: 50px; background-color: #f5f5f5; margin-right: 45px; z-index: 9999999;">
            <a id="save" href="javascript:void(0);" class="easyui-linkbutton" style="margin-right: 15px;" data-options="iconCls:'icon-save'" onclick="Save();">保存</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="CloseDlg();">关闭</a>
        </div>
        <script src="../jscript/CloseAjaxCache.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                var score = $("#Score").val();
                var str = '';
                if (!isNaN(score)) {
                    score = 0.0;
                }
                if (parseFloat(score) == 0) {
                    str = '<div class="iconfont star-five"><span>&#xe634;</span><span>&#xe634;</span><span>&#xe634;</span><span>&#xe634;</span><span>&#xe634;</span><b>' + score + '分</b></div>';
                } else {
                    var obj = score.split('.');
                    var integral = obj[0];
                    var incomplete = obj[1];
                    if (incomplete > 0 && incomplete <= 4) {
                        str = '<div class="iconfont star-five incomplete1">';
                    } else if (incomplete == 5) {
                        str = '<div class="iconfont star-five incomplete2">';
                    } else if (incomplete == 6) {
                        str = '<div class="iconfont star-five incomplete3">';
                    } else if (incomplete == 7) {
                        str = '<div class="iconfont star-five incomplete4">';
                    } else if (incomplete == 8) {
                        str = '<div class="iconfont star-five incomplete5">';
                    } else if (incomplete == 9) {
                        str = '<div class="iconfont star-five incomplete6">';
                    }
                    for (var i = 0; i < integral; i++) {
                        str += '<span class="integral">&#xe634;</span>';
                    }
                    var lenght = 5 - integral - 1;
                    if (incomplete > 0) {
                        str += '<span data-content="&#xe634;">&#xe634;</span>';
                    } else {
                        lenght += 1;
                    }

                    for (var i = 0; i < lenght; i++) {
                        str += '<span>&#xe634;</span>';
                    }
                    str += '<b>' + score + '分</b></div>';
                }
                $("#raty").html(str);
            });

            function CloseDlg() {
                HDialog.Close('');
            }

            //选择客户
            function SelSponsor() {
                var conent = "../DialogNew/CustDlg.aspx";
                HDialog.Open($(window).width() * 1.8, $(window).height() * 2, conent, '客户选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustId').val(data.CustID);
                    $("#LinkPhone").textbox("setValue", data.MobilePhone);

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
                                    var RoomSign = varObjects[i].RoomSign + strTmp;

                                    RoomData.push({ "RoomSign": RoomSign, "RoomID": RoomID });
                                }

                                $('#ComboRoom').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomSign',
                                    onChange: function (n, o) {
                                        var data = $('#ComboRoom').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {
                                                    $('#RoomSign').searchbox('setValue', data[i].RoomSign);
                                                    $('#RoomId').val(data[i].RoomID);
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

              $(document).ready(function (){
                $.tool.DataGet('Choose', 'CustRoomSigns', "CustID=" + $('#CustId').val(),
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
                                    var RoomSign = varObjects[i].RoomSign + strTmp;

                                    RoomData.push({ "RoomSign": RoomSign, "RoomID": RoomID });
                                }

                                $('#ComboRoom').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomSign',
                                    onChange: function (n, o) {
                                        var data = $('#ComboRoom').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {
                                                    $('#RoomSign').searchbox('setValue', data[i].RoomSign);
                                                    $('#RoomId').val(data[i].RoomID);
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

            //选择房屋
            function SelRoom() {
                $('#ComboRoom').combobox({ data: [], valueField: 'RoomID', textField: 'RoomSign' });

                var conent = "../DialogNew/RoomDlg.aspx";
                HDialog.Open($(window).width() * 1.5, $(window).height() * 1, conent, '房屋选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $("#LinkPhone").textbox("setValue", data.MobilePhone);
                    $('#CustId').val(data.CustID);
                    $('#RoomId').val(data.RoomID);
                });
            }

            //保存
            function Save() {
                if ($("#CustId").val() == '') {
                    HDialog.Info('请选择客户！');
                    return false;
                }
                if ($("#LinkPhone").textbox('getValue') == '') {
                    HDialog.Info('联系电话不能为空！');
                    return false;
                }
                var joinCount = $("#JoinCount").textbox('getValue');
                var signUpCount = $("#SignUpCount").textbox('getValue');
                if (signUpCount == '' || (!isNaN(joinCount) && parseInt(signUpCount) <= 0)) {
                    HDialog.Info('报名人数不能为空且必须大于0！');
                    return false;
                }
                //var joinCount = $("#JoinCount").textbox('getValue');
                //if (joinCount == '' || (!isNaN(joinCount) && parseInt(joinCount) <= 0)) {
                //    HDialog.Info('参加人数必须大于0！');
                //    return false;
                //}

                var optType = $("#OptType").val();
                var CommandName = '';
                if (optType == 'Add') {
                    CommandName = 'AddCommActivityPerson';
                }
                else if (optType == 'Edit') {
                    CommandName = 'UpdateCommActivityPerson';
                }
                $.tool.DataPostChk('frmForm', 'CommActivityNew', CommandName, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var result = JSON.parse(_Data);
                        HDialog.Info(result.Message);
                        if (result.Code == 200 && result.IsSuccess) {
                            HDialog.Close('1');
                        }
                        if (result.Code == 500) {
                            console.log(result.ErrorMessage);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
        </script>
    </form>
</body>
</html>
