<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendSmsBrowse.aspx.cs" Inherits="M_Main.SMSNew.SendSmsBrowse" %>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>

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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .panel-body {
            padding: 0px;
        }

        .tabs-container .panel-body {
            padding: 0px;
        }

        .datagrid-mask-msg {
            height: 40px;
        }
            
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="SendAtTime" type="hidden" size="1" name="SendAtTime" runat="server" />
        <input id="Type" size="1" type="hidden" name="Type" runat="server">
        <input id="hiIsSign" size="1" type="hidden" name="hiIsSign" runat="server">
        <input id="hiIsMul" size="1" type="hidden" name="hiIsMul" runat="server">
        <input id="hiIsAtTime" size="1" type="hidden" name="hiIsAtTime" runat="server">
         
         <div id="SearchDlg" class="easyui-dialog" title="筛选条件" data-options="iconCls:'icon-search',closed: true,modal:true"
                    style="width: 500px; height: 200px; padding: 10px;">
            <table class="SearchTable">
                <tr>
                    <td class="TdTitle">客户名称</td>
                    <td class="TdContent"><input type="text" id="S_CustName" name="S_CustName" /></td>
                    <td class="TdTitle">房屋编号</td>
                    <td class="TdContent"><input type="text" id="S_RoomSign" name="S_RoomSign" /></td>
                </tr>
                <tr>
                    <td class="TdTitle">手机号码</td>
                    <td class="TdContent"><input type="text" id="S_Mobile" name="S_Mobile" /></td>
                    <td class="TdTitle">信息内容</td>
                    <td class="TdContent"><input type="text" id="S_Message" name="S_Message" /></td>
                </tr>               
                <tr>
                    <td align="center" colspan="4">
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="LoadMay();">确定筛选</a>
                    </td>
                </tr>
            </table>
        </div>
        <table  cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr valign="top">
                <td >
      
        <table class="DialogTable" id="HeadTable" name="HeadTable" style="width: 100%;">          
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">第一步：确定发送对象</span> </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td class="TdTitle">管理项目</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" id="CommName" searcher="SelComm"  data-options="editable:false"  name="CommName" runat="server">                     
                    <input id="CommID" size="1" type="hidden" name="CommID" runat="server" />
                    <input id="hiCommName" size="1" type="hidden" name="hiCommName" runat="server" /></td>
                <td class="TdTitle">客户名称</td>
                <td class="TdContentSearch">
                    <input id="CustNames" class="easyui-searchbox" searcher="SelCust" data-options="editable:false" name="CustNames" runat="server" />                    
                    <input id="CustIDs" size="1" type="hidden" name="CustIDs" runat="server" />
                    <input id="hiCustNames" size="1" type="hidden" name="hiCustNames" runat="server" />
                    </td>
            </tr>
            <tr>
                <td class="TdTitle">手机号码</td>
                <td class="TdContent" colspan="3">
                    <textarea onkeyup="MobileCounter();" onclick="MobileCounter();" id="Mobile" rows="4" cols="70"
                        name="Mobile" runat="server"></textarea><input style="height: 21px; width: 15px" id="hiMobile" size="1" type="hidden" name="hiMobile"
                            runat="server"><br>
                    手机数量：<input style="border-top: 0px; height: 18px; border-right: 0px; width: 40px; border-bottom: 0px; color: black; border-left: 0px; background-color: #ffffff"
                        id="MobileAmount" value="0" readonly maxlength="10" size="1" name="MobileAmount">&nbsp;
					<input type="checkbox" value="" id="IsDupl" name="IsDupl" runat="server" checked>重复添加&nbsp;&nbsp; 
					注：手机号码间请用逗号(半角)“,”作为分隔符。</td>
            </tr>
            
            <tr>
                <td colspan="4" style="text-align: center; background: #e6e6e6"><span style="font-size: 16px">第二步：确定发送内容</span> </td>
            </tr> 
            <tr>
                <td class="TdTitle">开始日期</td>
                <td class="TdDateContent"><input id="FeesStateDate" class="Wdate" onkeypress="CheckSmallDate();" readonly="readonly"
                        onclick="WdatePicker()" maxlength="50" size="26" name="FeesStateDate" runat="server"></td>
                <td class="TdTitle">结束日期</td>
                <td class="TdDateContent"><input id="FeesEndDate" class="Wdate" onkeypress="CheckSmallDate();" readonly="readonly"
                        onclick="WdatePicker()" maxlength="50" size="26" name="FeesEndDate" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:CheckBox ID="IsSign" runat="server" Text="企业签名" ></asp:CheckBox>
                </td>
                <td class="TdContent">
                    <input id="Signature" class="easyui-validatebox" maxlength="50" name="Signature" runat="server"></td>
                <td class="TdTitle"></td>
                <td class="TdContent"></td>
            </tr>
            <tr>
                <td class="TdTitle">短信内容</td>
                <td class="TdContent" colspan="3">短信模版：
                <select id="SmsInfo" name="SmsInfo" runat="server"></select>
                    <input id="btnAdd" class="button" onclick="javascript: btnAdd_OnClick();" value="添加" type="button" name="btnAdd">
                    <input id="btnSelInfo" class="button" onclick="btnSelRBooks_OnClick();" value="短信内容选择" type="button" name="btnSelInfo" runat="server" style="z-index: 0">
                    <input style="height: 22px; width: 8px; z-index: 0" id="hiMessage" size="1" type="hidden" name="hiMessage" runat="server"><br>
                    <textarea  onkeyup="textCounter();" onclick="textCounter();" id="Message" rows="4" cols="70" name="Message" runat="server"></textarea><br>
                    &nbsp;字节数:<input style="border-top: 0px; border-right: 0px; border-bottom: 0px; color: red; border-left: 0px; background-color: #ffffff" id="remLen" value="0" readonly maxlength="3" size="4" name="remLen">
                    字数:<input style="border-top: 0px; border-right: 0px; border-bottom: 0px; color: red; border-left: 0px; background-color: #ffffff" id="remLen2" value="0" readonly maxlength="3" size="4" name="remLen2"><input id="IsTrim" checked type="checkbox" name="IsTrim" runat="server">发送时是否去掉内容中的回车符、换行符和空格。
                </td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:CheckBox ID="IsAtTime" runat="server" Text="定时发送"></asp:CheckBox></td>
                <td class="TdContent">
                    <select id="nYear" name="nYear" runat="server">
                        <option selected></option>
                    </select>年<select id="nMonth" name="nMonth" runat="server">
                        <option selected></option>
                    </select>月<select id="nDay" name="nDay" runat="server">
                        <option selected></option>
                    </select>日<select id="nHour" name="nHour" runat="server">
                        <option selected></option>
                    </select>时<select id="nMinute" name="nMinute" runat="server">
                        <option selected></option>
                    </select>分
                </td>
                <td class="TdTitle">
                    <asp:Label ID="lbhBalance" runat="server" ForeColor="Red">总计剩余数</asp:Label></td>
                <td class="TdContent" align="left"><input style="height: 22px; width: 50px; z-index: 0" id="Balance" 
                    maxlength="50" name="Balance" runat="server">(此信息来自短信公司)
                    (其中公司内部限制本小区剩余数：<input style="height: 22px; width: 50px; z-index: 0" id="CommBalance" 
                    maxlength="50" name="CommBalance" runat="server">条)</td>
            </tr>
            <tr>
                <td class="TdTitle">
                    <asp:CheckBox Style="z-index: 0" ID="IsMul" runat="server" Text="限制长度" ></asp:CheckBox></td>
                <td class="TdContent" colspan="3" align="left">短信内容限制在<input style="height: 22px; width: 50px; z-index: 0" id="LimitNum" 
                    value="65" maxlength="50" name="LimitNum" runat="server">字内，超过限制时，拆分成多条短信。（注一个英文字符、数字、标点符号和汉字为一字）</td>
            </tr>            
             <tr>
                <td colspan="4" style="height: 5px"></td>
            </tr>
            <tr>
                <td align="center" colspan="4">                     
                    <input class="button" id="btnCre" onclick="javascript: if (CheckData() == false) return false;" type="button" value="生成" name="btnCre" runat="server" />
                    <input class="button" id="btnOk"  type="button" value="发送" name="btnOk" runat="server">
                </td>
            </tr>
        </table>
        
        <div id="Divreport" name="Divreport" class="easyui-layout">
             <div data-options="region:'center',title:'短信明细'" style="background: #ffffff; border: hidden">
               <div class="SearchContainer" id="TableContainer1"></div>
            </div>
        </div>

        </td>
    </tr>
</table>
        <script type="text/javascript">
            function InitTableHeight()
            {
                var AllWidht = $(window).width();                
                var DivHeight = 600;

                $("#Divreport").css("width", AllWidht + "px");
                $("#Divreport").css("height", DivHeight + "px");

                $("#TableContainer1").css("height", "250" + "px");

                ReLoadBalance();
            }
            InitTableHeight();

            $('#btnCre').click(function () {
                if ($("#Mobile").val() == "") {
                    HDialog.Info("请输入手机号码,此项不能为空!");
                    $("#Mobile").focus();
                    return false;
                }
                if ($("#Message").val() == "") {
                    HDialog.Info("请输入内容,此项不能为空!");
                    $("#Message").focus();
                    return false;
                }
    
                if($("#IsSign").prop("checked"))
                {
                    $("#hiIsSign").val("1");
                }
                else
                {
                    $("#hiIsSign").val("0");
                }

                if($("#IsMul").prop("checked"))
                {
                    $("#hiIsMul").val("1");
                }
                else
                {
                    $("#hiIsMul").val("0");
                }

                if($("#IsAtTime").prop("checked"))
                {
                    $("#hiIsAtTime").val("1");
                }
                else
                {
                    $("#hiIsAtTime").val("0");
                }

                $.tool.DataPost('SMS', 'MaySendCre', $('#frmForm').serialize(),
                  function Init() {

                  },
                  function callback(_Data) {
                      var Data = _Data.split('|');
                      if (Data[0] == "true") {
                          
                          var dData = Data[1].split(',');
                          HDialog.Info(dData[0]);

                          LoadMay();
                     
                      }
                      else {
                          HDialog.Info(Data[1]);
                      }

                  },
                  function completeCallback() {
                  },
                  function errorCallback() {

                  });
            });

            $('#btnOk').click(function () {
                var row = $("#TableContainer1").datagrid("getData").rows[0];
                
                if (row == undefined || row == null) {                                
                    HDialog.Info("无记录，请生成短信！");
                    return;
                }
                
                $.tool.DataPost('SMS', 'PushMaySend', $('#frmForm').serialize(),
                  function Init() {

                  },
                  function callback(_Data) {
                      var Data = _Data.split('|');
                      if (Data[0] == "true") {
                          
                          HDialog.Info(Data[1]);
                      }
                      else {
                          HDialog.Info(Data[1]);
                      }

                      setTimeout(function (){
                        LoadMay();
                        }, 2000);

                  },
                  function completeCallback() {
                  },
                  function errorCallback() {
                  });

             });

             function btnAdd_OnClick() {
                var strmsg = $("#SmsInfo").val();
                $("#Message").val(strmsg);
                $("#hiMessage").val(strmsg);
            }
            
            var MayColumn = [[
                { field: 'SerialNum', title: '序号', width: 50, align: 'left', sortable: true },
                { field: 'CommName', title: '管理项目', width: 100, align: 'left', sortable: true },
                { field: 'CustName', title: '客户名称', width: 100, align: 'left', sortable: true },
                { field: 'RoomSigns', title: '房屋编号', width: 150, align: 'left', sortable: true },

                { field: 'Mobile', title: '手机号码', width: 100, align: 'left', sortable: true },
                { field: 'Message', title: '信息内容', width: 350, align: 'left', sortable: true , formatter: function (value, row, index) {
                        var str = "<a class=\"HrefStyle\"  href='#' onclick=\"ViewDetail('" + row.IID + "');\">"
                             + "<div style='width:400px;height:50px;overflow-y:auto' >" + row.Message + "</div>";
                             + "</a>";
                        return str;
                    }
                },
                { field: 'MsgLen', title: '信息条数', width: 60, align: 'left', sortable: true },
                { field: 'SendAtTime', title: '定时发送时间', width: 100, align: 'left', sortable: true }
                ]]

            var toolbar1 = [
                {
                    text: '筛选',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#SearchDlg').parent().appendTo($("form:first"))
                        $('#SearchDlg').dialog('open');

                    }
                }, '-',
                    {
                        text: '删除',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            var row = $("#TableContainer1").datagrid("getSelected");
                            if (row != undefined && row != null) {                                
                                DelRecord(row.IID);
                            }
                            else
                            {
                                HDialog.Info("请选择要删除的记录！");
                            }
                        }
                    }
                ];


            function DelRecord(Id) {
                HDialog.Prompt('是否删除该项', function () {
                    $.tool.DataGet('SMS', 'DeleteMaySend', 'IID=' + Id,
                        function Init() {
                        },
                        function callback(_Data) {
                            
                            var varObjects = _Data.split("|");

                            if (varObjects[0] == "true") {
                                HDialog.Info(varObjects[1]);
                            }
                            else { HDialog.Info('删除失败,' + varObjects[1]); }
                            LoadMay();


                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
                    
                });
            }
            
            function LoadMay() {

                $("#TableContainer1").datagrid({
                    url: '/HM/M_Main/HC/DataPostControl.aspx',
                    method: "post",
                    loadMsg: '数据加载中,请稍候...',
                    nowrap: false,
                    pageSize: top.ListPageSize,
                    pageList: top.ListPageList,
                    columns: MayColumn,
                    fitColumns: false,
                    remoteSort: false,
                    singleSelect: true,
                    pagination: true,
                    toolbar: toolbar1,
                    width: '100%',
                    sortOrder: "asc",
                    singleSelect: true,
                    selectOnCheck: false,
                    checkOnSelect: false,
                    rownumbers: true,
                    border: false,
                    onBeforeLoad: function (param) {

                        param = $.JQForm.GetParam("SMS", "LoadMaySend", "TableContainer1", param);
                    }
                });
                $('#SearchDlg').dialog('close');
            }
            LoadMay();

            function ReLoadBalance(){

                $.tool.DataPost('SMS', 'LoadBalance', $('#frmForm').serialize(),
                 function Init() {

                 },
                 function callback(_Data) {
                    
                     var Data = _Data.split('|');
                    
                     if (Data[0] == "true") {

                        $('#Balance').val(Data[1]);
                        $('#CommBalance').val(Data[2]);
                        
                        var strIsSign = Data[3];
                        if (strIsSign == "1")
                        {
                            $('#IsSign').attr("checked", 'checked');
                        }
                        else
                        {
                            $('#IsSign').prop("checked", false);
                        }
                        
                        
                        $('#Signature').val(Data[4]);

                        var strIsLimit = Data[5];
                        if (strIsLimit == "1")
                        {
                            $('#IsMul').attr("checked", 'checked');
                        }
                        else
                        {
                            $('#IsMul').prop("checked", false);
                        }
                        
                        $('#LimitNum').val(Data[6]);

                        if (Data[7] != "")
                        {
                            HDialog.Info(Data[7]);
                         }

                     }
                 },
                 function completeCallback() {
                 },
                 function errorCallback() {

                 });
        }
        

         function SelComm() {

                $('#CommName').searchbox("setValue", '');
                $('#CommID').val('');
                $('#hiCommName').val('');

                var conent = "../DialogNew/CommDlg.aspx";

                HDialog.Open(650, 430, conent, '项目选择', false, function callback(_Data) {
                    var data = JSON.parse(_Data);
                    $('#CommName').searchbox("setValue", data.text);

                    $('#CommID').val(data.attributes.InPopedom);
                    $('#hiCommName').val(data.text);
                });
            }

        function SelCust() {
            var varCommID = $("#CommID").val();
            if (varCommID == "") {
                HDialog.Info("请选择项目,此项不能为空!");
                return false;
            }

            HDialog.Open('900', '600', '../DialogNew/MultiCustCanDlg.aspx?CommID=' + varCommID + '&Ram=' + Math.random(), '选择客户名称', false, function callback(varReturn) {
                if (varReturn != "") {//**获得返回的参数信息

                    var varObjects = varReturn.split("\t");
                    if ($("#IsDupl")[0].checked == true) {
                        $("#CustIDs").val($("#CustIDs").val() + "," + varObjects[0]);
                        $("#CustNames").searchbox('setValue', $("#CustNames").searchbox('getValue') + "," + varObjects[1]);
                        $("#hiCustNames").val($("#hiCustNames").val() + "," + varObjects[1]);

                        $("#Mobile").val($("#Mobile").val() + "," + varObjects[2]);
                        $("#hiMobile").val($("#hiMobile").val() + "," + varObjects[2]);
                    }
                    else {
                        $("#CustIDs").val(varObjects[0]);
                        $("#CustNames").searchbox('setValue',varObjects[1]);
                        $("#hiCustNames").val(varObjects[1]);

                        $("#Mobile").val(varObjects[2]);
                        $("#hiMobile").val(varObjects[2]);
                    }

                    MobileCounter();

                    $("#Mobile").attr("disabled", true);

                }
                else {
                    $("#CustIDs").val("");
                    $("#CustNames").searchbox('setValue',"");
                    $("#hiCustNames").val("");

                    $("#Mobile").val("");
                    $("#hiMobile").val("");

                    MobileCounter();

                    $("#Mobile").attr("disabled", false);
                }
            },
            function completeCallback() {
            },
            function errorCallback() {
            });
        }

        function CheckData() {
            if ($("#Mobile").val() == "") {
                HDialog.Info("请输入手机号码,此项不能为空!");
                $("#Mobile").focus();
                return false;
            }
            if ($("#Message").val() == "") {
                HDialog.Info("请输入内容,此项不能为空!");
                $("#Message").focus();
                return false;
            }

            return true;
        }

        function btnSelRBooks_OnClick() {
            var varCommID = $("#CommID").val();
            if (varCommID == "") {
                HDialog.Info("请选择小区,此项不能为空!");
                $("#btnSelComm").focus();
                return false;   
            }

            HDialog.Open('800', '600', "../DialogNew/SmsInfoDlg.aspx?CommID=" + varCommID + "&Ram=" + Math.random(), '选择短信内容', true, function callback(_Data) {
                if (_Data != "") {
                     var Obj = JSON.parse(_Data);

                    $("#Message").val(Obj.InfoContent);
                    $("#hiMessage").val(Obj.InfoContent);

                    return true;
                }
            });

        }

        function textCounter() {
            
            $("#remLen2").val($("#Message").val().length);            
            $("#remLen").val($("#Message").val().replace(/[^\u0000-\u00ff]/g,"aa").length);
        }

        function MobileCounter() {
            var strval = $("#Mobile").val();
            var arrval = strval.split(',');
            var Amount = arrval.length;

            if (arrval[0] == "") {
                Amount = Amount - 1;
            }

            if (arrval[Amount] == "") {
                if (Amount - 1 >= 0) {
                    Amount = Amount - 1;
                }
            }

            $("#MobileAmount").val(Amount);
           

            if ($("#MobileAmount").val() != "")
            {
                $("#Mobile").disabled = true;
            }
            else
            {
                $("#Mobile").disabled = false;
            }
           
        }

        function ViewDetail(IID) {
           
            HDialog.Open('800', '400', '../SMSNew/MaySendManage.aspx?IID=' + IID, '短信明细', false, function callback(_Data) {
                LoadMay();
            });
            
        }

        </script>
    </form>
</body>
</html>
