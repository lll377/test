<%@ Page Language="c#" CodeBehind="FeesConSignCreManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.ChargesNew.FeesConSignCreManage" %>

<!DOCTYPE HTML>
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
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
		<!--

    function CheckData() {
        if ($('#BillsSign').searchbox('getValue') == "") {
            HDialog.Info("请选择收据号!");

            return false;
        }


        HDialog.Prompt('请确认是否生成人工托收', function () {

            $('#SearchDlg2').parent().appendTo($("form:first"));
            $("#SearchDlg2").dialog("close");

            $.tool.DataPost('FeesConSignNew', 'DetailCreCreate', $('#frmForm').serialize() + "&ChargeModeName=" + $("#ChargeMode").find("option:selected").text(),
                function Init() {
                },
                function callback(_Data) {


                    if (_Data == "true") {
                        HDialog.Info('生成成功');
                        HDialog.Close(1);
                    } else if (_Data == "没有需托收的费用") {
                        HDialog.Info(_Data);
                    }
                    else {
                        HDialog.Info("生成失败");
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        })
    }

    function btnSelBill_OnClick() {
        var strBillTypeID = getObject("BillType").value;

        if ((strBillTypeID == "0") || (strBillTypeID == "")) {
            alert("请选择收据类别,此项不能为空!");
            FeesConSignCreManage.BillType.focus();
            return false;
        }

        var varReturn;

        varReturn = showModalDlg("../dialog/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random(), "", 650, 430);


        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.BillsSign.value = varObjects[0];
            FeesConSignCreManage.hiBillsSign.value = varObjects[0];
            return true;
        }

    }

    //收据类别
    function onchangeBillType() {
        var strBillType = getObject("BillType").value;

        Request.sendPOST("GetFirstBillsSign.aspx", "InvoiceType=" + strBillType + "&Rdm=" + Math.random(), callbackBillType);
    }

    function callbackBillType(xmlHttp) {
        var varReturn = xmlHttp.responseText;

        if (varReturn != "") {
            var Search = eval('(' + varReturn + ')');

            var SearchData = Search.SelData.Data;

            getObject("BillsSign").value = "";
            getObject("hiBillsSign").value = "";

            for (var i = 0; i < SearchData.length; i++) {
                getObject(SearchData[i].Name).value = SearchData[i].Val;
            }
        }
        else {
            getObject("BillsSign").value = "";
            getObject("hiBillsSign").value = "";
        }
    }

    function checkFormAll(chk) {
        val = document.FeesConSignCreManage.SelReturn.value
        form = document.getElementById("FeesConSignCreManage");
        var chkval;
        for (var i = 0; i < form.elements.length; i++) {
            chkval = "," + form.elements[i].value;
            //选择
            if (form.elements[i].type == "checkbox") {
                form.elements[i].checked = chk.checked

                //付值
                if (form.elements[i].value != "on") {
                    if (form.elements[i].checked) {
                        if (val.indexOf(chkval) < 0) {
                            val = val + chkval
                        }
                    }
                    else {
                        val = val.replace(chkval, "")

                    }
                }
            }
        }
        document.FeesConSignCreManage.SelReturn.value = val

        //alert(document.FeesConSignCreManage.SelReturn.value)
    }

    function checkFormOne(chk) {
        var val = document.FeesConSignCreManage.SelReturn.value
        var chkval = "," + chk.value;
        if (chk.checked) {
            if (val.indexOf(chkval) < 0) {
                val = val + chkval;
            }

        }
        else {
            val = val.replace(chkval, "")

        }
        document.FeesConSignCreManage.SelReturn.value = val

        //alert(document.FeesConSignCreManage.SelReturn.value)
    }
    function setcheckForm() {
        val = document.frmForm.SelReturn.value;
        form = document.getElementById("frmForm");
        var chkval = "";

        for (var i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type == "checkbox") {
                chkval = "," + form.elements[i].value
                if (form.elements[i].value != "on") {
                    if (val.indexOf(chkval) < 0) {
                        form.elements[i].checked = false
                    }
                    else {
                        form.elements[i].checked = true
                    }
                }
            }
        }

    }

    function btnClear_OnClick() {
        FeesConSignCreManage.CustID.value = "";
        FeesConSignCreManage.CustName.value = "";
        FeesConSignCreManage.hiCustName.value = "";

        FeesConSignCreManage.RoomID.value = "";
        FeesConSignCreManage.RoomSign.value = "";
        FeesConSignCreManage.hiRoomSign.value = "";

        FeesConSignCreManage.CostID.value = "";
        FeesConSignCreManage.hiCostName.value = "";
        FeesConSignCreManage.CostName.value = "";

        FeesConSignCreManage.CustTypeID.value = "全部";
        FeesConSignCreManage.ChargeTypeID.value = "";
        FeesConSignCreManage.IsPay.value = "";

        FeesConSignCreManage.StartDate.value = "";
        FeesConSignCreManage.EndDate.value = "";

    }

    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.RoomID.value = varObjects[0];
            FeesConSignCreManage.RoomSign.value = varObjects[2];
            FeesConSignCreManage.hiRoomSign.value = varObjects[2];

            FeesConSignCreManage.CustID.value = varObjects[1];
            FeesConSignCreManage.CustName.value = varObjects[3];
            FeesConSignCreManage.hiCustName.value = varObjects[3];
            //alert(varReturn);

            return true;
        }

        return false;
    }

    function btnSelCust_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.CustID.value = varObjects[0];
            FeesConSignCreManage.CustName.value = varObjects[1];
            FeesConSignCreManage.hiCustName.value = varObjects[1];

            FeesConSignCreManage.RoomSign.value = "";
            FeesConSignCreManage.RoomID.value = "";
            FeesConSignCreManage.hiRoomSign.value = "";

            return true;
        }

        return false;
    }

    function SelRoomID_OnChange() {
        FeesConSignCreManage.RoomID.value = FeesConSignCreManage.SelRoomID.options[FeesConSignCreManage.SelRoomID.selectedIndex].value;
        FeesConSignCreManage.RoomSign.value = FeesConSignCreManage.SelRoomID.options[FeesConSignCreManage.SelRoomID.selectedIndex].text;
        FeesConSignCreManage.hiRoomSign.value = FeesConSignCreManage.RoomSign.value;

    }

    function btnSelCost_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            FeesConSignCreManage.CostID.value = varObjects[0];
            FeesConSignCreManage.CostName.value = varObjects[2];
            FeesConSignCreManage.hiCostName.value = varObjects[2];

            return true;
        }

        return false;
    }
    //-->
    </script>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="SelReturn" style="width: 24px; height: 22px" type="hidden" size="1" name="SelReturn" runat="server">
        <input id="hiRoundingNum" style="width: 16px; height: 22px" type="hidden" size="1" name="hiRoundingNum" runat="server">
        <input id="hiSurplusGame" style="width: 16px; height: 22px" type="hidden" size="1" name="hiSurplusGame" runat="server">
        <input id="requestPath" type="hidden" name="requestPath" runat="server" />
        <input id="hiIsSelectSQL" name="hiIsSelectSQL" runat="server" type="hidden" />
        <input id="AllData" name="AllData" type="hidden" />
        <input id="IsExcel" name="IsExcel" type="hidden" />
        <div id="SearchDlg1" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px; padding: 10px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">费用开始日期</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="FeesStateDate" onclick="WdatePicker()" name="FeesStateDate" data-options="editable:false" runat="server"></td>
                    <td class="TdTitle">费用结束日期</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="FeesEndDate" onclick="WdatePicker()" name="FeesEndDate" data-options="editable:false" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">托收违约金</td>
                    <td class="TdContentSearch">
                        是<input type="radio" checked="checked" name="IsLateFeeAmount" value="0" />
                        否<input type="radio" name="IsLateFeeAmount" value="1"  />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="btnCreate" type="button" value="查询托收明细" name="btnCreate" runat="server"></td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg2" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px; padding: 10px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">生成方式</td>
                    <td class="TdContent">
                        <asp:RadioButton Style="z-index: 0" ID="RbCust" runat="server" Checked="True" Text="按客户生成" GroupName="RbCreate"></asp:RadioButton>
                        <asp:RadioButton ID="RbBuild" runat="server" GroupName="RbCreate" Text="按房号生成"></asp:RadioButton></td>
                    <tr>
                        <td class="TdTitle">收款方式</td>
                        <td class="TdContentSearch">
                            <select id="ChargeMode" name="ChargeMode" runat="server">
                                <option selected></option>
                            </select></td>
                        <td class="TdTitle">收据样式</td>
                        <td class="TdContentSearch">
                            <select id="UseRepID" name="UseRepID" runat="server">
                                <option selected></option>
                            </select></td>
                    </tr>
                <tr>
                    <td class="TdTitle">票据类别</td>
                    <td class="TdContentSearch">
                        <select id="BillType" name="BillType" onchange="BillTypeChange()" runat="server"></select></td>
                    <td class="TdTitle">票据号</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" searcher="SelBillsSign" data-options="editable:false" id="BillsSign" maxlength="50" name="BillsSign" runat="server">
                        <input class="button_sel" style="display: none;" id="btnSelBill" onclick="javascript: if (btnSelBill_OnClick() == false) return false;" type="button" value=" " name="btnSelBill" runat="server">
                        <input class="Control_ItemInput" id="hiBillsSign" style="width: 8px; height: 19px" type="hidden" size="1" name="hiBillsSign" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">是否取整</td>
                    <td class="TdContentSearch" colspan="3">
                        <select id="IsSurplus" name="IsSurplus" runat="server">
                            <option selected></option>
                        </select>
                        <asp:Label ID="LbSurplus" runat="server"></asp:Label>
                        <asp:CheckBox ID="IsAutoSurplus" runat="server" Text="自动处理零头结转余额" Checked="True"></asp:CheckBox></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <input class="button" id="btnCreFees" onclick="javascript: if (CheckData() == false) return false;" type="button" value="确定生成" name="btnCreFees" runat="server">
                        <input id="btnExcel" class="button" style="display: none" value="Excel输出" type="button" name="btnExcel" runat="server">
                        <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server"></td>
                </tr>
            </table>
        </div>

        <div id="TableContainer"></div>
        <div id="SearchDlg3" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 600px; height: 240px;">
            <table class="DialogTable">
                 <tr>
                    <td class="TdTitle" colspan="4" >
                        <div style="float:left">
                        <input type="radio" name="IsExcelTJ" value="1" checked="checked" onchange="ChanTJ(1)"  />选择筛选条件 
                        <input type="radio" name="IsExcelTJ" value="2"  onchange="ChanTJ(2)"  />导入筛选条件</div></td> 
                </tr>
                <tr id="tr1">
                    <td class="TdTitle">楼宇</td>
                    <td class="TdContentSearch">
                        <asp:DropDownList ID="BuildSNum" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContentSearch">
                        <select id="CustTypeID" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr id="tr2">
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" class="easyui-searchbox" maxlength="50" data-options="editable:false" searcher="SelCust" name="CustName" runat="server">
                        <input class="button_sel" id="btnSelCust" style="display: none;" onclick="javascript: if (btnSelCust_OnClick() == false) return false;" type="button" value=" " name="btnSelCust" runat="server">
                        <input class="Control_ItemInput" id="CustID" style="width: 8px; height: 19px" type="hidden" size="1" name="CustID" runat="server">
                        <input class="Control_ItemInput" id="hiCustName" style="width: 12px; height: 19px" type="hidden" size="1" name="hiCustName" runat="server"></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelRoomID" class="easyui-combobox" data-options="editable:false" style="width: 154px;" name="SelRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr id="tr3">
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" class="easyui-searchbox" data-options="editable:false" searcher="SelRoomSign" maxlength="50" name="RoomSign" runat="server">
                        <input class="button_sel" id="btnSelRoom" style="display: none;" onclick="javascript: if (btnSelRoom_OnClick() == false) return false;" type="button" value=" " name="btnSelRoom" runat="server">
                        <input class="Control_ItemInput" id="RoomID" style="width: 8px; height: 22px" type="hidden" size="1" name="RoomID" runat="server">
                        <input class="Control_ItemInput" id="hiRoomSign" style="width: 8px; height: 22px" type="hidden" size="1" name="hiRoomSign" runat="server"></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContentSearch">
                        <select id="ChargeTypeID" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr id="tr4" style="display:none">
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch" colspan="3"> 
                        <input  id="InputRoomSign"     type="text" style="width:370px"  name="InputRoomSign"  > <a href="#" onclick="SelInputRoom('RoomSign','房屋')">Excel导入</a>
                          </td>
                 </tr>   
                <tr id="tr5" style="display:none">
                    <td class="TdTitle">车位编号</td> 
                     <td class="TdContentSearch" colspan="3"> 
                        <input  id="InputParkName"     type="text" style="width:370px"  name="InputParkName"  > <a href="#" onclick="SelInputRoom('ParkName','车位')">Excel导入</a>
                    </td>
                </tr>

                <tr>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input class="easyui-searchbox" id="CostNames" maxlength="50" data-options="editable:false" name="CostNames" searcher="SelCostName" runat="server">
                        <input class="button_sel" id="btnSelCost" style="display: none;" onclick="javascript: if (btnSelCost_OnClick() == false) return false;" type="button" value=" " name="btnSelCost" runat="server">
                        <input class="Control_ItemInput" id="hiCostName" style="width: 8px; height: 22px" type="hidden" size="1" name="hiCostName" runat="server">
                        <input class="Control_ItemInput" id="CostIDs" style="width: 8px; height: 22px" type="hidden" size="1" name="CostIDs" runat="server"></td>
                    <td class="TdTitle">是否托收</td>
                    <td class="TdContentSearch">
                        <select id="IsPay" name="IsPay" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">开始日期</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="StartDate" data-options="editable:false" name="StartDate" runat="server" onclick="WdatePicker()"></td>
                    <td class="TdTitle">结束日期</td>
                    <td class="TdContentSearch">
                        <input class="Wdate" id="EndDate" data-options="editable:false" name="EndDate" runat="server" onclick="WdatePicker()"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="Search();">查询</a>
                    </td>
                </tr>
            </table>
        </div>

        <div id="menu" class="easyui-menu" style="width: 50px; display: none;">
            <!--放置一个隐藏的菜单Div-->

            <div data-options="iconCls:'icon-add'" onclick="CheckSel(1)">确定选择</div>
            <div data-options="iconCls:'icon-cancel'" onclick="CheckSel(0)">确定取消</div>
            <!--具体的菜单事件请自行添加，跟toolbar的方法是基本一样的-->
            <div data-options="iconCls:'icon-edit'" onclick="CheckSelAll(1)">全部选择</div>
            <div data-options="iconCls:'icon-clear'" onclick="CheckSelAll(0)">全部取消</div>
        </div>

        <script type="text/javascript">


            function SelInputRoom(type,title) {
                var w = 800
                var h = 400;
                HDialog.Open(w, h, '../ChargesNew/FeesConsignCre_InputRoos.aspx?Ram=' + Math.random() + "&Type=" + type, '导入'+title+'编号', false, function callback(_Data) {

                    $("#IsExcel").val(type);
                    $("#Input" + type).val(_Data);
                });
            } 

            function ChanTJ(va) {
                if (va == "2") {
                    $("#tr1").css("display", "none");
                    $("#tr2").css("display", "none");
                    $("#tr3").css("display", "none");
                    $("#tr4").css("display", "");
                    $("#tr5").css("display", "");
                }
                else {
                    $("#tr1").css("display", "");
                    $("#tr2").css("display", "");
                    $("#tr3").css("display", "");
                    $("#tr4").css("display", "none");
                    $("#tr5").css("display", "none");

                }
            }

            function SelBillsSign() {
                var strBillTypeID = getObject("BillType").value;
                var strBillsSigns;
                var iFixedAmount = 0;

                if ((strBillTypeID == "0") || (strBillTypeID == "")) {
                    HDialog.Info("请选择票据类别,此项不能为空!");
                    BillsEditManage.BillTypeID.focus();
                    return;
                }

                var conent = "../dialogNew/BillsSignDlg.aspx?BillTypeID=" + strBillTypeID + "&Rdm=" + Math.random();

                var w = 650;
                var h = 430;

                HDialog.Open(w, h, conent, '票据号选择', false, function callback(_Data) {
                    var varObjects = _Data;
                    $('#BillsSign').searchbox("setValue", varObjects);
                    $('#hiBillsSign').val(varObjects);
                });

            }

            function SelCust() {
                HDialog.Open('650', '430', '../DialogNew/CustDlg.aspx?Ram=' + Math.random(), '选择客户名称', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);

                    $.tool.DataGet('Choose', 'CustRoomSigns', 'CustID=' + encodeURI($("#CustID").val()),
                        function Init() {
                        },
                        function callback(RoomSignData) {

                            varObjects = JSON.parse(RoomSignData);
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

                                $('#SelRoomID').combobox({
                                    data: RoomData,
                                    valueField: 'RoomID',
                                    textField: 'RoomText',
                                    panelWidth: 'auto',
                                    onChange: function (n, o) {
                                        var data = $('#SelRoomID').combobox('getData');
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                if (n == data[i].RoomID) {
                                                    $("#RoomID").val(data[i].RoomID);
                                                    $('#RoomSign').searchbox('setValue', data[i].RoomText);
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

            function SelRoomSign() {

                var w = $(window).width();
                var h = $(window).height();
                HDialog.Open(w, h, '../DialogNew/RoomDlg.aspx?Ram=' + Math.random(), '选择房屋编号', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#RoomSign').searchbox("setValue", data.RoomSign);
                    $('#CustName').searchbox("setValue", data.CustName);
                    $('#CustID').val(data.CustID);
                    $('#RoomID').val(data.RoomID);
                });
            }

            function SelCostName() {
                HDialog.Open('700', '400', "../dialogNew/MultiCorpCommCostDlg.aspx" + "?Ram=" + Math.random(), '收费项目选择', false, function (_data) {
                    var varReturn = _data;

                    if (varReturn != "") {//**获得返回 刷新
                        var varObjects = varReturn.split("\t");

                        $('#CostIDs').val(varObjects[0]);
                        $('#CostNames').searchbox('setValue', varObjects[1]);
                        $('#hiCostName').val(varObjects[1]);
                    }

                });
            }

            function InitTableHeight() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
                $('#hiIsSelectSQL').val('-1');
            }
            InitTableHeight();



            $("#btnReturn").click(function () {
                //HDialog.Close();
                $('#SearchDlg2').dialog('close');
            })

            var column1 = [[
                { field: '', checkbox: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
                { field: 'ParkName', title: '车位编号', width: 200, align: 'left', sortable: true },
                { field: 'CostSNum', title: '费用序号', width: 200, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 200, align: 'left', sortable: true },
                { field: 'FeeDueYearMonth', title: '费用日期', width: 200, align: 'left', sortable: true },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 200, align: 'left', sortable: true, formatter: changeDateFormat
                },
                { field: 'FeesStateDate', title: '开始日期', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'FeesEndDate', title: '结束日期', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'DueAmount', title: '应收金额', width: 200, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 200, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 200, align: 'left', sortable: true },
                { field: 'LateFeeAmount', title: '合同违约金', width: 200, align: 'left', sortable: true },
                { field: 'IsPayName', title: '是否托收', width: 200, align: 'left', sortable: true }
            ]];

            var column2 = [[
                { field: '', checkbox: true },
                { field: 'CustName', title: '客户名称', width: 200, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 200, align: 'left', sortable: true },
                { field: 'CostSNum', title: '费用序号', width: 200, align: 'left', sortable: true },
                { field: 'CostName', title: '费用名称', width: 200, align: 'left', sortable: true },
                { field: 'FeeDueYearMonth', title: '费用日期', width: 200, align: 'left', sortable: true },
                {
                    field: 'AccountsDueDate', title: '应收日期', width: 200, align: 'left', sortable: true, formatter: changeDateFormat
                },
                { field: 'FeesStateDate', title: '开始日期', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'FeesEndDate', title: '结束日期', width: 200, align: 'left', sortable: true, formatter: changeDateFormat },
                { field: 'DueAmount', title: '应收金额', width: 200, align: 'left', sortable: true },
                { field: 'PaidAmount', title: '实收金额', width: 200, align: 'left', sortable: true },
                { field: 'DebtsAmount', title: '欠收金额', width: 200, align: 'left', sortable: true },
                //{ field: 'LateFeeAmount', title: '合同违约金', width: 200, align: 'left', sortable: true },
                { field: 'IsPayName', title: '是否托收', width: 200, align: 'left', sortable: true }
            ]];

            var toolbar = [


                {
                    text: '第一步：查询托收明细',
                    iconCls: 'icon-edit',
                    handler: function () {
                        $('#SearchDlg1').parent().appendTo($("form:first"))
                        $('#SearchDlg1').dialog('open');
                    }
                }, '-',
                {
                    text: '第二步：筛选托收明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg3').parent().appendTo($("form:first"))
                        $('#SearchDlg3').dialog('open');
                    }
                }, '-',
                {
                    text: '第三步：生成托收文件',
                    iconCls: 'icon-save',
                    handler: function () {
                        $('#SearchDlg2').parent().appendTo($("form:first"))
                        $('#SearchDlg2').dialog('open');

                    }
                }, '-',
                {
                    text: 'Excel输出',
                    iconCls: 'icon-page_white_excel',
                    handler: function () {


                        window.location.href = '../Charges/FeesConSignExcelCre.aspx';
                    }
                }
                , '-',

                {
                    text: '<span style=\"color:red\">*鼠标右击费用列表进行单个、批量选择或取消选择</span>'
                }

            ];

            function changeDateFormat(value, rowData, rowIndex) {
                var result = "";
                if (value != undefined && value != null) {
                    result = formatDate(value, 'yyyy-MM-dd');
                }
                return result;
            }

            //查询
            function Search() {
                $('#hiIsSelectSQL').val('1');
                LoadList();
            }

            function LoadList() {
                var column = [];
                if ($("input[name='IsLateFeeAmount']").get(0).checked) {
                    column = column1;
                }
                else {
                    column= column2
                }
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    fitColumns: true,
                    rownumbers: true,
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    pagination: true,
                    border: false,
                    width: "100%",
                    toolbar: toolbar,
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
                    sortOrder: "asc",
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("FeesConSignNew", "DetailSearch", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        $("#SearchDlg1").dialog("close");
                        $("#SearchDlg2").dialog("close");
                        $("#SearchDlg3").dialog("close");
                    }
                });

            }
            $.parser.parse("#SearchDlg1");
            $.parser.parse("#SearchDlg2");
            $.parser.parse("#SearchDlg3");
            LoadList();

            $("#btnCreate").click(function () {
                $('#hiIsSelectSQL').val('1');
                var IsLateFeeAmount = 0;
                if ($("input[name='IsLateFeeAmount']").get(1).checked) {
                    IsLateFeeAmount = 1;
                }
                $.tool.DataPost('FeesConSignNew', 'DetailCreate', 'FeesStateDate=' + $("#FeesStateDate").val()
                    + "&FeesEndDate=" + $("#FeesEndDate").val() + '&IsLateFeeAmount=' + IsLateFeeAmount + "&ConSignType=",
                    function Init() {
                    },
                    function callback(_Data) {
                        var data = _Data.split("|");
                        if (data.length > 0) {
                            if (data[0] == "true") {
                                LoadList();
                            }
                            else {
                                HDialog.Info("查询失败!" + data[1]);
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            })


            function CheckSelAll(IsNoPay) {
                var row = $('#TableContainer').datagrid('getRows');
                if (row != '') {
                    if (IsNoPay == "1") {
                        HDialog.Prompt('是否全部确定所有的托收数据', function () {

                            $.tool.DataPost('FeesConSignNew', 'CheckAll', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info('保存成功');
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {

                                });
                        });
                    }
                    else if (IsNoPay == "0") {
                        HDialog.Prompt('是否全部取消所有的托收数据', function () {

                            $.tool.DataPost('FeesConSignNew', 'CancelAll', $('#frmForm').serialize(),
                                function Init() {
                                },
                                function callback(_Data) {
                                    if (_Data == "true") {
                                        HDialog.Info('保存成功');
                                        LoadList();
                                    }
                                },
                                function completeCallback() {
                                },
                                function errorCallback() {

                                });
                        });
                    }

                }
                else {
                    HDialog.Info('没有可操作的数据!');
                }
            }
            function CheckSel(IsNoPay) {
                var row = $('#TableContainer').datagrid('getRows');
                if (row != '') {
                    var checkRows = $('#TableContainer').datagrid('getChecked');
                    if (checkRows != '') {
                        //var AllData = JSON.stringify(checkRows);
                        //$('#AllData').val(AllData);
                        if (IsNoPay == "1") {
                            HDialog.Prompt('是否确定已选择托收的数据', function () {
                                var checkValues = "";
                                $.each(checkRows, function (index, item) {
                                    checkValues += item.IID + ",";
                                })
                                $.tool.DataPost('FeesConSignNew', 'DetailCheck', 'CheckValue=' + checkValues,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "true") {
                                            HDialog.Info('保存成功');
                                            LoadList();
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {

                                    });
                            });
                        }
                        else if (IsNoPay == "0") {
                            HDialog.Prompt('是否确定取消已选择托收的数据', function () {
                                var checkValues = "";
                                $.each(checkRows, function (index, item) {
                                    checkValues += item.IID + ",";
                                })
                                $.tool.DataPost('FeesConSignNew', 'DetailCancel', 'CheckValue=' + checkValues,
                                    function Init() {
                                    },
                                    function callback(_Data) {
                                        if (_Data == "true") {
                                            HDialog.Info('保存成功');
                                            LoadList();
                                        }
                                    },
                                    function completeCallback() {
                                    },
                                    function errorCallback() {

                                    });
                            });
                        }

                    }
                    else {
                        HDialog.Info('请选择要操作的数据!');
                    }
                }
                else {
                    HDialog.Info('没有可操作的数据!');
                }
            }

            function BillTypeChange() {
                $.tool.DataPostNoLoading('FeesConSignNew', 'SetBillsSign', 'BillType=' + $('#BillType').val(),
                    function Init() {
                        $('#BillsSign').val();
                        $('#hiBillsSign').val();
                    },
                    function callback(_Data) {
                        if (_Data != "") {

                            $('#BillsSign').searchbox('setValue', _Data);
                            $('#hiBillsSign').val(_Data);
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
