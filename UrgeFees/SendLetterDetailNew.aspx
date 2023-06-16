<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendLetterDetailNew.aspx.cs" Inherits="M_Main.UrgeFees.SendLetterDetailNew" %>

<!DOCTYPE HTML >
<html>
<head>
    <title>SendLetterDetailNew</title>
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
    <script language="javascript">
		<!--

    function CheckData() {

        var row = $('#TableContainer').datagrid('getRows');
        if (row != '') {
            //HDialog.MessageBox('请确认是否生成银行代收', '确认', '取消', function () { return true; }, function () { return false; });

            if (confirm('请确认是否生成银行代收？') == false) {
                return false;
            }
            else {
                return true;
            }

            return true;
        }
        else {
            HDialog.Info('没有可生成托收的数据');
            return false;
        }
    }

    function checkFormAll(chk) {
        val = getObject("SelReturn").value
        form = document.getElementById("SendLetterDetailNew");
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
        getObject("SelReturn").value = val
       
    }

    function checkFormOne(chk) {
        var val = getObject("SelReturn").value
        var chkval = "," + chk.value;
        if (chk.checked) {
            if (val.indexOf(chkval) < 0) {
                val = val + chkval;
            }

        }
        else {
            val = val.replace(chkval, "")

        }
        getObject("SelReturn").value = val

    }
    function setcheckForm() {
        val = getObject("SelReturn").value;
        form = document.getElementById("SendLetterDetailNew");
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
        SendLetterDetailNew.CustID.value = "";
        SendLetterDetailNew.CustName.value = "";
        SendLetterDetailNew.hiCustName.value = "";

        SendLetterDetailNew.RoomID.value = "";
        SendLetterDetailNew.RoomSign.value = "";
        SendLetterDetailNew.hiRoomSign.value = "";

        SendLetterDetailNew.CostID.value = "";
        SendLetterDetailNew.hiCostName.value = "";
        SendLetterDetailNew.CostName.value = "";

        SendLetterDetailNew.CustTypeID.value = "全部";
        SendLetterDetailNew.ChargeTypeID.value = "";
        SendLetterDetailNew.IsPay.value = "";

        SendLetterDetailNew.StartDate.value = "";
        SendLetterDetailNew.EndDate.value = "";

    }

    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            SendLetterDetailNew.RoomID.value = varObjects[0];
            SendLetterDetailNew.RoomSign.value = varObjects[2];
            SendLetterDetailNew.hiRoomSign.value = varObjects[2];

            SendLetterDetailNew.CustID.value = varObjects[1];
            SendLetterDetailNew.CustName.value = varObjects[3];
            SendLetterDetailNew.hiCustName.value = varObjects[3];
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

            SendLetterDetailNew.CustID.value = varObjects[0];
            SendLetterDetailNew.CustName.value = varObjects[1];
            SendLetterDetailNew.hiCustName.value = varObjects[1];

            SendLetterDetailNew.RoomSign.value = "";
            SendLetterDetailNew.RoomID.value = "";
            SendLetterDetailNew.hiRoomSign.value = "";

            return true;
        }

        return false;
    }

    function SelRoomID_OnChange() {
        SendLetterDetailNew.RoomID.value = SendLetterDetailNew.SelRoomID.options[SendLetterDetailNew.SelRoomID.selectedIndex].value;
        SendLetterDetailNew.RoomSign.value = SendLetterDetailNew.SelRoomID.options[SendLetterDetailNew.SelRoomID.selectedIndex].text;
        SendLetterDetailNew.hiRoomSign.value = SendLetterDetailNew.RoomSign.value;

    }

    function btnSelCost_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CorpCommCostDlg.aspx" + "?Ram=" + Math.random(), "", 500, 400);
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            SendLetterDetailNew.CostID.value = varObjects[0];
            SendLetterDetailNew.CostName.value = varObjects[2];
            SendLetterDetailNew.hiCostName.value = varObjects[2];

            return true;
        }

        return false;
    }

    function toolbarClick1() {


        $('#SearchDlg2').dialog('open');
    }
    //-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="SendLetterDetailNew" method="post" runat="server">
        <input id="PageIndex" style="width: 32px; height: 22px" type="hidden" size="1" name="PageIndex"
            runat="server"><input id="SelReturn" style="width: 24px; height: 22px" type="hidden" size="1" name="SelReturn"
                runat="server">
        <input id="hiIsSelectSQL" name="hiIsSelectSQL" runat="server" type="hidden" />
        <input id="AllData" name="AllData" type="hidden" />
        <input id="SendLetterID" type="hidden" name="SendLetterID" runat="server">

        <input id="PrintParms" type="hidden" name="PrintParms" runat="server">
        <input id="OptCode" type="hidden" name="OptCode" runat="server">
        <input id="CostID" type="hidden" name="CostID" runat="server">
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <input id="hiRoomSign" type="hidden" name="hiRoomSign" runat="server" />
        <div class="SearchContainer" id="TableContainer">
        </div>

        <div id="SearchDlg2" class="easyui-dialog" title="筛选欠费明细" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 700px; height: 300px;">

            <table class="DialogTable">
                <tr>
                    <td class="TdTitle">楼 宇</td>
                    <td class="TdContent">
                        <select id="BuildSNum" style="width: 80%" name="BuildSNum" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">组团区域</td>
                    <td class="TdContent">
                        <select  id="RegionSNum" style="width: 80%" name="RegionSNum" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>

                <tr>
                    <td class="TdTitle">交房状态</td>
                    <td class="TdContent">
                        <select id="RoomState" style="width: 80%" name="RoomState" runat="server">
                            <option selected></option>
                        </select>
                    </td>
                    <td class="TdTitle">欠费主体</td>
                    <td class="TdContent">
                        <select id="ArrearsSubID" style="width: 80%" name="ArrearsSubID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户类别</td>
                    <td class="TdContent">
                        <select id="CustTypeID" style="width: 80%" name="CustTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">收费类型</td>
                    <td class="TdContent">
                        <select id="ChargeTypeID" style="width: 80%" name="ChargeTypeID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContentSearch">
                        <input id="CustName" searcher="SelCust"
                            name="CustName" class="easyui-searchbox" style="width: 80%" runat="server" data-options="editable:false" /><input id="CustID" style="width: 8px; height: 19px" type="hidden"
                                size="1" name="CustID" runat="server" /><input id="hiCustName" style="width: 12px; height: 19px" type="hidden"
                                    size="1" name="hiCustName" runat="server" /></td>
                    <td class="TdTitle">可选房号</td>
                    <td class="TdContentSearch">
                        <select id="SelectRoomID" style="width: 80%" class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" runat="server">
                            <option selected></option>
                        </select></td>
                </tr>
                <tr>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContentSearch">
                        <input id="RoomSign" style="width: 80%" searcher="SelRoom"
                            name="RoomSign" class="easyui-searchbox" runat="server" data-options="editable:false" /></td>
                    <td class="TdTitle">费用项目</td>
                    <td class="TdContentSearch">
                        <input id="CostName"
                            name="CostName" class="easyui-searchbox" style="width: 80%" searcher="SelCost" data-options="editable:false" runat="server"><input id="hiCostName" style="width: 8px; height: 22px" type="hidden"
                                size="1" name="hiCostName" runat="server"></td>
                </tr>

                <tr>
                    <td class="TdTitle">费用开始</td>
                    <td class="formTable_ItemInput" width="40%">
                        <select id="nYear1" name="nYear1" runat="server">
                            <option selected></option>
                        </select>年<select id="nMonth1" name="nMonth1" runat="server">
                            <option selected></option>
                        </select>月</td>
                    <td class="formTable_Item" width="10%" align="right">费用结束期间</td>
                    <td class="formTable_ItemInput" width="40%">
                        <select id="nYear2" name="nYear2" runat="server">
                            <option selected></option>
                        </select>年<select id="nMonth2" name="nMonth2" runat="server">
                            <option selected></option>
                        </select>月</td>
                </tr>

               <tr>
                  
                   
                      <td class="TdTitle">是否发函</td>
                    <td class="TdContentSearch">
                        <select id="IsSendLetter" name="IsSendLetter" runat="server">
                                   <option selected value="">全部</option>
                                          <option value="是" >是</option>
                                       <option value="否" >否</option>
                                </select>

                    </td>
                     <td class="TdTitle">是否催收</td>
                    <td class="TdContentSearch">
                        <select id="ISUrgeFees" name="ISUrgeFees" runat="server">
                                    <option selected value="">全部</option>
                                          <option value="是" >是</option>
                                       <option value="否" >否</option>
                                </select>

                    </td>
               </tr>
                <tr>
                         <td class="TdTitle">欠费原因</td>
                    <td class="TdContentSearch">
                        <select id="ArrearsTypeCode2" name="ArrearsTypeCode2" runat="server">
                                    <option selected></option>
                                </select>

                    </td>


                </tr>



                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadData();">查询</a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="SearchDlg3" class="easyui-dialog" title="生成代收文件" data-options="iconCls:'icon-search',closed: true,modal:true"
            style="width: 750px; height: 250px;">
            <table class="DialogTable">

                <tr>
                    <td class="TdTitle">欠费原因</td>
                    <td class="TdContent">
                        <select id="ArrearsTypeCode" name="ArrearsTypeCode" runat="server">
                            <option selected></option>
                        </select></td>
                    <td class="TdTitle">计划回收年月</td>
                    <td class="TdContent">
                        <input type="text" class="Wdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM' })" id="PlanYear" runat="server" name="PlanYear" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">催缴措施 </td>
                    <td class="formTable_ItemInput" colspan="3">
                        <input style="width: 90%" id="Measures" class="Control_ItemInput" maxlength="500" size="10"
                            name="Measures" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">欠费备注</td>
                    <td class="formTable_ItemInput" colspan="3">
                        <input id="Remark" class="Control_ItemInput" style="width: 90%" maxlength="500" name="Remark" runat="server"></td>
                </tr>
                <tr>
                    <td class="TdTitle">附件</td>
                    <td class="formTable_ItemInput" colspan="3">
                        <iframe id="UploadFrame" frameborder="0" width="75%" style="margin-top: 10px; height: 50px; float: left;" scrolling="no"></iframe>
                        <input type="hidden" id="ArrearsReasonID" name="ArrearsReasonID" runat="server" />
                        <input type="button" name="fileList1" style="width: 70px; height: 25px; display: block; float: left; margin-top: 10px;" value="查看列表" id="fileList1" runat="server" onclick="OnFileList();" /></td>
                </tr>

                <tr>
                    <td class="formTable_footer" align="center" colspan="4">
                        <input class="button" id="btnCreFees" onclick="btnCre();"
                            type="button" value="保存" name="btnCreFees">&nbsp;<input id="btnExcel" class="button" value="Excel输出"
                                type="button" name="btnExcel" style="display: none" runat="server">
                        <input class="button" id="btnReturn" onclick="CloseSearchDlg3();" type="button" value="返回" name="btnReturn"></td>
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

            function CloseSearchDlg3() {
                $('#SearchDlg3').dialog('close');
            }

            //加载上传连接地址
            $('#UploadFrame').attr("src", "../NoticesNew/ArrearsReasonUploadFile.aspx?IID=" + $('#ArrearsReasonID').val());

            //查看附件
            function OnFileList() {
                HDialog.Open(600, 450, '../NoticesNew/ArrearsReasonDetailFiles.aspx?DetailId=' + $('#ArrearsReasonID').val(), '查看欠费原因附件', true, function callback(_Data) {
                });
            }
            //查看附件
            function OpenDetail(iid) {
                HDialog.Open(600, 450, '../NoticesNew/ArrearsReasonDetailFiles.aspx?DetailId=' + iid, '查看欠费原因附件', true, function callback(_Data) {
                });
            }
        </script>

        <script type="text/javascript">

            function InitFunction() {
                var h = $(window).height();
                $("#TableContainer").css("height", h + "px");
          
               // $("#divtt").css("display", "none");
                
            }
            InitFunction();

            function IsLateFee_Click() {
                SendLetterDetailNew.BankBeginDate.disabled = !IsLateFee.checked;
            }

            function SelCost() {

                //if ($('#hiOPType').val() != 'Insert') {
                //    return;
                //}
                var vCommID = $('#CommID').val();
                var tmpCostGeneType = $('#CostGeneType').val();
                var conent = "../dialogNew/CorpCommCostDlg.aspx";

                HDialog.Open('700', '400', conent, '收费项目选择', false, function callback(_Data) {


                    if (_Data != "") {//**获得返回 刷新
                        //var varObjects = _Data.split("\t");

                        //$('#CostID').val(varObjects[0]);
                        //$('#CostName').searchbox('setValue', varObjects[1]);
                        //$('#hiCostName').searchbox('setValue', varObjects[1]);

                        var data = JSON.parse(_Data);
                        $('#CostName').searchbox("setValue", data.CostName);
                        $('#CostID').val(data.CostID);
                        $('#hiCostName').val(data.CostName);

                    }
                });

            }

            function SelCust() {

                $('#CustName').searchbox("setValue", '');
                $('#CustID').val('');
                $('#RoomSign').searchbox("setValue", '');
                $('#RoomID').val('');
                $('#SelectRoomID').combobox({ data: [], valueField: 'RoomID', textField: 'RoomText' });


                var w = 700;
                var h = 400;

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


                    $('#SelectRoomID').combobox({
                        data: '',
                        valueField: 'RoomID',
                        textField: 'RoomText'
                    });

                });
            }

            var toolbar =  [

                {
                    text: '筛选欠费明细',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg2').parent().appendTo($("form:first"))
                        $('#SearchDlg2').dialog('open');
                    }
                }, '-',
                //{
                //    text: 'Excel输出',
                //    iconCls: 'icon-page_white_excel',
                //    handler: function () {
                //        window.location.href = "SendLetterDetailExcel.aspx?random=" + Math.random() + GetParam();
                //    }
                //}
                //, '-',

                {
                    text: '<span style=\"color:red\">*鼠标右击费用列表进行单个、批量选择或取消选择</span>'
                } 
            ] ;



            function GetParam() {
                var str = '';
                str += '&BuildSNum=' + $('#BuildSNum').val().trim();
                str += '&RegionSNum=' + $('#RegionSNum').val().trim();
                str += '&RoomState=' + $('#RoomState').val().trim();
                str += '&ArrearsSubID=' + $('#ArrearsSubID').val().trim();
                str += '&CustTypeID=' + $('#CustTypeID').val().trim();
                str += '&ChargeTypeID=' + $('#ChargeTypeID').val().trim();

                str += '&CustName=' + $('#CustName').val().trim();

                str += '&CustName=' + $('#CustName').val().trim();

                str += '&RoomSign=' + $('#RoomSign').val().trim();
                str += '&CostName=' + $('#CostName').val().trim();
                str += '&nYear1=' + $('#nYear1').val().trim();
                str += '&nYear2=' + $('#nYear2').val().trim();


                str += '&PageIndex=' + $('#PageIndex').val().trim();
                str += '&SelReturn=' + $('#SelReturn').val().trim();
                str += '&hiIsSelectSQL=' + $('#hiIsSelectSQL').val().trim();
                str += '&AllData=' + $('#AllData').val().trim();


                str += '&SendLetterID=' + $('#SendLetterID').val().trim();
                str += '&PrintParms=' + $('#PrintParms').val().trim();
                str += '&OptCode=' + $('#OptCode').val().trim();
                str += '&CostID=' + $('#CostID').val().trim();


                str += '&RoomID=' + $('#RoomID').val().trim();
                str += '&hiRoomSign=' + $('#hiRoomSign').val().trim(); 
                str += '&CustID=' + $('#CustID').val().trim();
                str += '&nMonth1=' + $('#nMonth1').val().trim(); 
                str += '&nMonth2=' + $('#nMonth2').val().trim();
                return encodeURI(str);
            }


            var frozenColumns ;

            var column ;
            $('#hiIsSelectSQL').val('-1');

            function LoadList() {

                frozenColumns = [[
                { field: 'ck', checkbox: true },
                 { field: 'IsSelName', title: '是否已选', width: 50, align: 'center', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },

                ]]

                column = [[

               { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
               { field: 'IID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

               { field: 'BuildArea', title: '建筑面积', width: 150, align: 'left', sortable: true },
               { field: 'StateName', title: '交房状态', width: 150, align: 'left', sortable: true },
               { field: 'Telephone', title: '联系电话', width: 150, align: 'left', sortable: true },


               //{ field: 'CostSNum', title: '费用序号', width: 80, align: 'left', sortable: true },
               { field: 'CostName', title: '费用名称', width: 150, align: 'left', sortable: true },
               {
                   field: 'FeeDueYearMonth', title: '费用日期', width: 100, align: 'left', sortable: true
               },
               {
                   field: 'AccountsDueDate', title: '应收日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                       var str = formatDate(row.AccountsDueDate, "yyyy-MM-dd");
                       return str;
                   }
               },
               {
                   field: 'FeesStateDate', title: '开始日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                       var str = formatDate(row.FeesStateDate, "yyyy-MM-dd");
                       return str;
                   }
               },
               {
                   field: 'FeesEndDate', title: '结束日期', width: 100, align: 'left', sortable: true, formatter: function (value, row, index) {

                       var str = formatDate(row.FeesEndDate, "yyyy-MM-dd");
                       return str;
                   }
               },
               { field: 'DueAmount', title: '应收金额', width: 100, align: 'left', sortable: true },
               { field: 'PaidAmount', title: '实收金额', width: 100, align: 'left', sortable: true },
               { field: 'PrecAmount', title: '预交冲抵', width: 100, align: 'left', sortable: true },
               { field: 'WaivAmount', title: '减免冲销', width: 100, align: 'left', sortable: true },
               { field: 'RefundAmount', title: '退款金额', width: 100, align: 'left', sortable: true },
               { field: 'DebtsAmount', title: '欠收金额', width: 100, align: 'left', sortable: true },
               { field: 'LateFeeAmount', title: '合同违约金', width: 100, align: 'left', sortable: true },

                { field: 'ISUrgeFees', title: '是否催费', width: 50, align: 'center', sortable: true },
                { field: 'UrgeFeesCount', title: '催费次数', width: 50, align: 'center', sortable: true },
                { field: 'UrgeFeesDateNew', title: '最近催费时间', width: 150, align: 'center', sortable: true },
                { field: 'ArrearsTypeName', title: '欠费原因', width: 150, align: 'center', sortable: true },
                //{ field: 'PlanYear', title: '计划回收年月', width: 100, align: 'center', sortable: true },
                { field: 'ISSendLetter', title: '是否发函', width: 50, align: 'center', sortable: true },
                { field: 'SendLetterCount', title: '发函次数', width: 50, align: 'center', sortable: true },
                { field: 'SendLetterDate', title: '最近发函时间', width: 150, align: 'center', sortable: true },


               //{ field: 'ArrearsTypeName', title: '欠费原因', width: 150, align: 'left', sortable: true },
               //{ field: 'PlanYear', title: '计划回收年月', width: 150, align: 'left', sortable: true },
               //{ field: 'Measures', title: '催缴措施', width: 100, align: 'left', sortable: true },
               //{ field: 'ArrearsSubName', title: '欠费主体', width: 100, align: 'left', sortable: true },
                  { field: 'IsCurDebtsName', title: '当前是否欠费', width: 100, align: 'left', sortable: true } ,
               { field: 'Remark', title: '备注', width: 150, align: 'left', sortable: true } 
            


                ]];
                 
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
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
                        param = $.JQForm.GetParam("SendLetter", "SendLetterDetail", "TableContainer", param);
                    } 
                });
               // $('#SearchDlg').dialog('close');
              // $('#SearchDlg2').dialog('close');
            }

            LoadList();




            function LoadList2() {


                frozenColumns = [[
            { field: 'ck', checkbox: true },
            { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
            { field: 'RoomSign', title: '房屋编号', width: 180, align: 'left', sortable: true },

                ]]
                column = [[

            { field: 'FeesID', title: '', width: 100, align: 'left', sortable: true, hidden: true },
            { field: 'IID', title: '', width: 100, align: 'left', sortable: true, hidden: true },

            { field: 'BuildArea', title: '建筑面积', width: 150, align: 'left', sortable: true },
            { field: 'StateName', title: '交房状态', width: 150, align: 'left', sortable: true },
            { field: 'Telephone', title: '联系电话', width: 150, align: 'left', sortable: true } 

 
                ]];
                $("#TableContainer").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: column,
                    frozenColumns: frozenColumns,
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
                        param = $.JQForm.GetParam("SendLetter", "SendLetterDetail", "TableContainer", param);
                    },
                    onLoadSuccess: function (data) {
                        var grid = new Ext.grid.GridPanel({
                        });

                    }
                });
                // $('#SearchDlg').dialog('close');
                //  $('#SearchDlg2').dialog('close');
            }


            function btnCre() {
                $('#hiIsLateFee').val(0);
                if ($('#IsLateFee').is(':checked')) {
                    $('#hiIsLateFee').val(1);
                }
             //   $('#SearchDlg').dialog('close');
                $.tool.DataPostChk('SendLetterDetailNew', 'ArrearsReason', 'ArrearsReasonSave', $('#SendLetterDetailNew').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        var r = _Data;

                        if (r == "true") {
                            $('#hiIsSelectSQL').val('1');
                            LoadList();
                            $('#SearchDlg3').dialog('close');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            function LoadData() {
                $('#hiIsSelectSQL').val('1');
                LoadList();
            }

            function CheckSelAll(IsNoPay) {
                //验证是批次单是否已审核 
                $.tool.DataPostChk('SendLetterDetailNewCus', 'SendLetter', 'GetAduitingState', $('#SendLetterDetailNewCus').serialize(),
              function Init() {
              },
              function callback(_Data) {
                  var r = _Data;
                  var str=r.split('|');
                  if (str[0] == "false") {
                      //未通过
                      if (str[1] == "2") {
                          HDialog.Info('审核不通过单据不允许在操作!');
                      } else {


                      }
                  }
                  if (r == "true") { 
                      HDialog.Info('已审核单据不允许在操作!');
                  } 
              },
              function completeCallback() {
              },
              function errorCallback() {
              });


                var row = $('#TableContainer').datagrid('getRows');

               
                if (row != '') {
                    $.tool.DataPostChk('SendLetterDetailNew', 'SendLetter', 'UpdateAllIs', "&IsNoPay=" + IsNoPay + GetParam(),
                        function Init() {
                        },
                        function callback(_Data) {
                            var r = _Data;

                            if (r == "true") {
                                $('#hiIsSelectSQL').val('1');
                                LoadList();

                            }

                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                }
                else {
                    HDialog.Info('没有可操作的数据!');
                }
            }
            function CheckSel(IsNoPay) {
                var row = $('#TableContainer').datagrid('getRows');
                if (row != '') {
                    var row2 = $('#TableContainer').datagrid('getChecked');
                    if (row2 != '') {
                        var AllData = JSON.stringify(row2);
                        $('#AllData').val(AllData);


                        $.tool.DataPostChk('SendLetterDetailNew', 'SendLetter', 'UpdateIs', $('#SendLetterDetailNew').serialize() + "&IsNoPay=" + IsNoPay,
                            function Init() {
                            },
                            function callback(_Data) {
                                var r = _Data;

                                if (r == "true") {
                                    $('#hiIsSelectSQL').val('1');
                                    LoadList();

                                }  

                            },
                            function completeCallback() {
                            },
                            function errorCallback() {
                            });
                    }
                    else {
                        HDialog.Info('请选择要操作的数据!');
                    }
                }
                else {
                    HDialog.Info('没有可操作的数据!');
                }
            }

           
        </script>

    </form>
</body>
</html>


