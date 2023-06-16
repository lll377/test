<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParkingManage.aspx.cs" Inherits="M_Main.CarparkNew.ParkingManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ParkingManage</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>

    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        .auto-style1 {
            height: 12px;
            width: 18%;
            text-align: left;
            color: #FF3300;
        }
    </style>

</head>
<body>
    <form id="FrmForm">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="ParkID" type="hidden" name="ParkID" runat="server" />
        <input id="hiUseState" type="hidden" name="HandID" runat="server" />
        <table class="DialogTable" style="width: 100%; padding-top: 5px; line-height: 25px;">
            <tr>
                <td class="TdTitle">车位类别</td>
                <td class="TdContentSearch">
                    <select id="ParkCategory" name="ParkCategory" data-options="editable:false,panelHeight: 'auto'" disabled="disabled" class="easyui-combobox" runat="server">
                        <option value="0" selected>固定车位</option>
                        <option value="1">非固定车位</option>
                    </select></td>
                <td class="TdTitle">车位区域</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 82%;" data-options="editable:false,required:true" type="text" id="CarparkName" searcher="SelCarparkName" name="CarparkName" runat="server" />
                    <input type="hidden" id="CarparkID" name="CarparkID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位类型</td>
                <td class="TdContentSearch">
                    <select id="ParkType" data-options="editable:false,panelHeight: 'auto'" class="easyui-combobox" name="ParkType" runat="server">
                    </select>
                </td>
                <td class="TdTitle">车位编号</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" data-options="required:true" id="ParkName" name="ParkName" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">车位面积</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" id="ParkArea" name="ParkArea" runat="server" />
                </td>
                <td class="TdTitle">泊车数量</td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" id="ParkingNum" name="ParkingNum" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">产权性质</td>
                <td class="TdContentSearch">
                    <select id="PropertyRight" name="PropertyRight" class="easyui-combobox" data-options="editable:false,panelHeight: '100px'" runat="server">
                        <option selected></option>
                    </select>
                </td>
                <td class="TdTitle">使用状态</td>
                <td class="TdContentSearch">
                    <select id="PropertyUses" name="PropertyUses" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" runat="server">
                        <option value="产权人自用">产权人自用</option>
                        <option value="产权人出租">产权人出租</option>
                    </select>
                </td>
            </tr>
            <%--            <tr>
                <td></td>
                <td class="TdContent">
                    <input type="button" class="button" value="标准选择" id="BtnSelCost" /></td>
                <td></td>
                <td class="TdContent"></td>
            </tr>--%>
            <tr>
                <td class="TdTitle">费用名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 82%;" searcher="SelCost" data-options="editable:false,required:true" id="CostName" name="CostName" runat="server" />
                    <input type="hidden" name="CostID" id="CostID" runat="server" /></td>
                <td class="TdTitle">收费标准</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" data-options="required:true" id="StanName" name="StanName" runat="server" />
                    <input type="hidden" name="StanID" id="StanID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">业主名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" style="width: 82%;" data-options="editable:false,required:true" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>
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
                    <input class="easyui-searchbox" style="width: 82%;" id="RoomSign" data-options="editable:false" name="RoomSign" searcher="SelRoom" runat="server" />
                    <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                </td>
                <td class="TdTitle">合同交付时间</td>
                <td class="TdContent">
                    <input class="Wdate" id="ContSubDate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" onkeypress="CheckDate();" maxlength="50" name="ContSubDate" runat="server" type="text" /></td>
            </tr>
            <tr>
                <td class="TdTitle">物业接管时间</td>
                <td class="TdContent">
                    <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="TakeOverDate" maxlength="50" name="TakeOverDate" runat="server" type="text" />
                </td>
                <td class="TdTitle">实际交付时间</td>
                <td class="TdContent">
                    <input class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" id="ActualSubDate" maxlength="50" name="ActualSubDate" onkeypress="CheckDate();" runat="server" type="text" /></td>

            </tr>
            <tr>
                <td class="TdTitle">地产预留出售</td>
                <td class="TdContentSearch">
                    <select id="ReserveSale" name="ReserveSale" runat="server">
                        <option></option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </td>
                <td class="TdTitle">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注</td>
                <td class="TdContent">
                    <input type="text" id="ParkMemo" class="easyui-validatebox" name="ParkMemo" runat="server" />
                </td>
            </tr>

            <tr style="display: none;">
                <td class="TdTitle">开发主体</td>
                <td class="TdContentSearch">
                    <select id="DevelopmentSubject" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" name="DevelopmentSubject" runat="server">
                    </select>
                </td>
                <td class="TdTitle" rowspan="2">说明</td>
                <td class="auto-style1" colspan="3" style="height: 12px">自有产权模式一(抵扣)：权属房产产权车位出租收入抵空置车位物业费。
                   
                </td>
                <td class="auto-style1" colspan="3" style="height: 12px">自有产权模式二(常规)：权属房产产权车位出租收入归房产，物业公司收取空置车位物业费。</td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 20px;" colspan="4" class="DialogTdSubmit">
                    <input type="button" class="button" value="保 存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关 闭" id="BtnReturn" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<script type="text/javascript">
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    function CheckUpdate() {

        if (GetQueryString("IsLock") == "1") {
            $("#BtnSave").attr('disabled', false)
            $("#BtnSave").removeAttr("onclick");
            $("#BtnSave").css("background-color", "#B8B8B8");
        }
    }


    $(document).ready(
        function () {
            CheckUpdate();
        }
    )

    $("#BtnSave").click(function () {
        $('#CustName').removeAttr("disabled");
        $('#RoomSign').removeAttr("disabled");
        $('#SelectRoomID').removeAttr("disabled");
        var cmd = $("#hiOPType").val();
        var ParkName = $('#ParkName').val();

        var ParkID = $('#ParkID').val();
        var CustID = $('#CustID').val();
        var RoomID = $('#RoomID').val();
        var CarparkID = $('#CarparkID').val();
        var ParkType = $('#ParkType').combobox('getText');
        var ParkArea = $('#ParkArea').val();
        var ParkingNum = $('#ParkingNum').val();
        var PropertyRight = $('#PropertyRight').combobox('getValue');
        var PropertyUses = $('#PropertyUses').combobox('getValue');
        var ContSubDate = $('#ContSubDate').val();
        var ActualSubDate = $('#ActualSubDate').val();
        var DevelopmentSubject = $('#DevelopmentSubject').combobox('getValue');
        var IsDelete = 0;
        var StanID = $('#StanID').val();
        var ParkCategory = $('#ParkCategory').combobox('getValue');
        var ParkMemo = $('#ParkMemo').val();
        var IsPropertyService = 0;
        var CostID = $('#CostID').val();
        var ReserveSale = $("#ReserveSale").val();
        var TakeOverDate = $("#TakeOverDate").val();

        if (CustID == "") {
            HDialog.Info("请选择业主名称");
        }
        else if (CostID == "") {
            HDialog.Info("请选择要设置收费项目");
        }
        else if (StanID == "") {
            HDialog.Info("请选择要设置收费标准");
        }
        else {
            var param = "ParkID=" + ParkID + "&CustID=" + CustID + "&RoomID=" + RoomID + "&CarparkID=" + CarparkID
                + "&ParkType=" + ParkType + "&ParkArea=" + ParkArea + "&ParkName=" + ParkName + "&ParkingNum=" + ParkingNum
                + "&PropertyRight=" + PropertyRight + "&PropertyUses=" + PropertyUses + "&IsDelete=" + IsDelete + "&StanID=" + StanID
                + "&ParkCategory=" + ParkCategory + "&ParkMemo=" + ParkMemo + "&IsPropertyService=" + IsPropertyService + "&ContSubDate=" + ContSubDate + "&ActualSubDate=" + ActualSubDate + "&DevelopmentSubject=" + DevelopmentSubject
                + "&ReserveSale=" + ReserveSale + "&TakeOverDate=" + TakeOverDate;


            //3900 保利，车位资料登记，增加编号重复判断，编号重复不能保存，并提示车位编号重复
            if (cmd == "insert") {
                var paramVerification = "ParkName=" + ParkName;
                $.tool.DataPostChk('FrmForm', 'Parking', "InsertVerification", paramVerification,
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "false") {
                            parent.layer.alert('当前【车位编号】重复，无法进行保存!');
                            return;
                        } else { SaveParking(cmd, param); }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            } else { SaveParking(cmd, param); }

        }
    });

    function SaveParking(cmd, param) {
        $.tool.DataPostChk('FrmForm', 'Parking', cmd, param,
            function Init() {
            },
            function callback(_Data) {
                if (_Data == "true") {
                    parent.layer.alert('保存成功');
                    close("true");
                }
            },
            function completeCallback() {
            },
            function errorCallback() {

            });
    }

    $("#BtnReturn").click(function () {
        close("false");
    });

    function SelCost() {
        var CostName = $('#CostName').val();
        var OPType = $('#hiOPType').val();

        if (OPType != "update") {
            CostName = "";
        }
        var conent = "../DialogNew/StanDlg.aspx?IsParking=ispark";
        HDialog.Open('1000', '600', conent, '费用标准选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CostID').val(data.attributes.CostID);
            $('#CostName').searchbox("setValue", data.attributes.CostName);
            $('#StanID').val(data.attributes.StanID);
            $('#StanName').val(data.attributes.StanName);
        });
    }

    function close(callparm) {
        HDialog.Close(callparm);
    }

    function SelCarparkName() {
        $('#CarparkName').searchbox("setValue", '');
        $('#CarparkID').val('');

        var conent = "../DialogNew/CarparkDlg.aspx";

        HDialog.Open('600', '400', conent, '车位区域', false, function callback(_Data) {
            if (_Data != "") {
                var data = JSON.parse(_Data);
                $('#CarparkName').searchbox("setValue", data.CarparkName);
                $('#CarparkID').val(data.CarparkID);

            }

        });

    }

    function SelCust() {

        $('#CustName').searchbox("setValue", '');
        $('#CustID').val('');
        $('#RoomSign').searchbox("setValue", '');
        $('#RoomID').val('');
        $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });

        var conent = "../DialogNew/CustDlg.aspx";

        HDialog.Open('1000', '600', conent, '客户选择', false, function callback(_Data) {
            var data = JSON.parse(_Data);
            $('#CustName').searchbox("setValue", data.CustName);

            $('#CustID').val(data.CustID);


            $.tool.DataGet('Choose', 'CustRoomSigns', $('#FrmForm').serialize(),
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
                            RoomData.push({ "RoomText": RoomText, "RoomID": RoomID });

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
                                            $('#RoomID').val(data[i].RoomID);
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

    $("select").each(function () {

        var key = $(this).attr("id");
        $(this).css("width", document.body.clientWidth * 0.36 * 0.89);
    });
</script>

