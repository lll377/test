<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCommunitySuggestionsManage.aspx.cs" Inherits="M_Main.ComInfoNew.NewCommunitySuggestionsManage" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <script language="javascript" src="../jscript/ajax.js"></script>
    <link href="../css/framesearch.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script src="../editor/kindeditor.js" type="text/javascript"></script>
    <script src="../editor/lang/zh_CN.js" type="text/javascript"></script>
    <script src="../editor/plugins/code/prettify.js" type="text/javascript"></script>
    <link href="../editor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
    <link href="../editor/themes/default/default.css" rel="stylesheet" type="text/css" />

    <script language="javascript">
		<!--

    function btnClear_OnClick() {
        //Suggestions.ReferType.value="";


        Suggestions.TypeID.value = "";
        Suggestions.TypeName.value = "";
        Suggestions.hiTypeName.value = "";
        Suggestions.ReserveStartDate.value = "";
        Suggestions.ReserveEndDate.value = "";
        Suggestions.IncidentNum.value = "";
        Suggestions.CoordinateNum.value = "";
        Suggestions.CoordinateNum2.value = "";

        Suggestions.IncidentBeginDate.value = "";
        Suggestions.IncidentEndDate.value = "";
        Suggestions.CustID.value = "";
        Suggestions.RoomID.value = "";
        Suggestions.SelRoomID.value = "";
        Suggestions.RoomSign.value = "";
        Suggestions.CustName.value = "";
    }

    function CheckData() {
        if (Suggestions.RoomID.value == "") {
            HDialog.Info("请选择房屋编号,此项不能为空!");
            return false;
        }
       if (Suggestions.SuggestionsType.value == "") {
            HDialog.Info("请选择建议类别,此项不能为空!");
            return false;
        }
          $('#ReplyDate').attr("disabled",false);
    }

    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            Suggestions.RoomID.value = varObjects[0];
            Suggestions.RoomSign.value = varObjects[2];
            Suggestions.hiRoomSign.value = varObjects[2];

            Suggestions.CustID.value = varObjects[1];
            Suggestions.CustName.value = varObjects[3];
            Suggestions.hiCustName.value = varObjects[3];
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

            Suggestions.CustID.value = varObjects[0];
            Suggestions.CustName.value = varObjects[1];
            Suggestions.hiCustName.value = varObjects[1];

            Suggestions.RoomSign.value = "";
            Suggestions.RoomID.value = "";
            Suggestions.hiRoomSign.value = "";

            return true;
        }

        return false;
    }

    function SelRoomID_OnChange() {
        Suggestions.RoomID.value = Suggestions.SelRoomID.options[Suggestions.SelRoomID.selectedIndex].value;
        Suggestions.RoomSign.value = Suggestions.SelRoomID.options[Suggestions.SelRoomID.selectedIndex].text;
        Suggestions.hiRoomSign.value = Suggestions.RoomSign.value;

    }

    function btnSelCost_OnClick() {
        //var tmpCostGeneType = FeesSporadicManage.CostGeneType.value;?CostGeneType="+tmpCostGeneType
        var iClassID = document.all.SelClass.value;
        var strURL = "../dialog/CorpIncidentTypeDlg.aspx" + "?Ram=" + Math.random();
        if (iClassID != "0") {
            strURL = strURL + "&ClassID=" + iClassID;
        }
        var varReturn;
        varReturn = showModalDlg(strURL, "", 500, 400);

        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            Suggestions.TypeID.value = varObjects[0];
            Suggestions.TypeName.value = varObjects[2];
            Suggestions.hiTypeName.value = varObjects[2];



            return true;
        }

        return false;
    }

    //查询对话框
    function btnFilterMore_OnClick() {
        var TableSign = getObject("TableSign").value;
        if (TableSign != "" && TableSign != null) {
            var strTemplateCode = TableSign;
            var strSearchData = escape(getObject("hiSearchData").value);
            varReturn = showModalDlg("../dialog/SearchDlg.aspx?TemplateCode=" + strTemplateCode + "&SearchData=" + strSearchData, "", 420, 400);

            //alert(varReturn);

            if (varReturn != "") {
                var Search = eval('(' + varReturn + ')');
                getObject("hiSearchSql").value = Search.SqlData.Sql;

                //**重构数据(数据结构为JSON)					
                var SearchData = Search.SqlData.Data;
                //alert(Search.SqlData.Sql);
                var val = "";
                for (var i = 0; i < SearchData.length; i++) {
                    if (val != "") {
                        val = val + ",{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                    }
                    else {
                        val = "{name:\"" + SearchData[i].name + "\",val:\"" + SearchData[i].val + "\"} ";
                    }
                }
                getObject("hiSearchData").value = "{Data:[" + val + "]}";
            }

            //alert(getObject("hiSearchData").value);
        }
    }
    function IsDel_OnClick() {
        if (confirm('请确认是否删除该记录') == false) {
            return false;
        }
        else {
            return true;
        }
    }
    function Win_OnLoad() {



        var strPrintParms = getObject("PrintParms").value;
        if (strPrintParms != "") {
            showOperatWin(strPrintParms);

            getObject("PrintParms").value = "";
        }
    }

    function btnSelCust_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/CustDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);
        //alert("["+varReturn+"]");
        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            Suggestions.CustID.value = varObjects[0];
            Suggestions.CustName.value = varObjects[1];

            Suggestions.RoomSign.value = "";
            Suggestions.RoomID.value = "";

            return true;
        }

        return false;
    }
    function SelRoomID_OnChange(Obj) {
        Suggestions.RoomID.value = Obj.options[Obj.selectedIndex].value;
        Suggestions.RoomSign.value = Obj.options[Obj.selectedIndex].text;

    }
    function btnSelRoom_OnClick() {
        var varReturn;
        varReturn = showModalDlg("../dialog/RoomDlg.aspx" + "?Ram=" + Math.random(), "", 650, 430);

        if (varReturn != "") {//**获得返回 刷新
            var varObjects = varReturn.split("\t");

            Suggestions.RoomID.value = varObjects[0];
            Suggestions.RoomSign.value = varObjects[2];

            Suggestions.CustID.value = varObjects[1];
            Suggestions.CustName.value = varObjects[3];
            //alert(varReturn);

            return true;
        }

        return false;
    }
    //-->
    </script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: true,
                uploadJson: '../editor/asp.net/upload_json.ashx',
                fileManagerJson: '../editor/asp.net/file_manager_json.ashx'
            });
            K('#upbtn').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        showRemote: false,
                        clickFn: function (url, title, width, height, border, align) {
                            var ImgDemo = "<div style=\"margin-left:5px;margin-right:8px;float:left;width:auto;text-align:center;\"><img src=\"" + url + "\" style=\"width:100px;height:100px\" onclick=\"max(this)\" />";
                            // ImgDemo += "<input type=\"hidden\" name=\"IncidentImgs\" value=\"" + url + "\" /></br><a href=\"javascript:void(0)\" onclick=\"deleteImg(this)\">删除</a></div>";
                            ImgDemo += "</div>";
                            $("#imgSpan").html($("#imgSpan").html() + ImgDemo);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
        function max(img) {
            window.open(img.src, "新窗口", "height=400;width=800");
        }
        //function deleteImg(obj) {
        //    $(obj).parent().remove();
        //}
    </script>
</head>
<body style="overflow-y: auto;">
    <form id="Suggestions" name="Suggestions" method="post" runat="server">
        <input id="PhTypeID" size="1" type="hidden" name="CostID" runat="server" />
        <input id="PageIndex" size="1" type="hidden" name="PageIndex" runat="server" />
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="SuggestionsID" type="hidden" name="SuggestionsID" runat="server" />
        <input id="TypeCode" type="hidden" size="1" name="TypeCode" runat="server" />
        <input id="IncidentImg" type="hidden" name="IncidentImg" runat="server" />
        <table class="DialogTable" id="Table1" style="width: 100%; line-height: 25px;">
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">一、客户建议</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">业主名称</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" disabled style="width: 82%;" data-options="editable:false,required:true" id="CustName" name="CustName" searcher="SelCust" runat="server" />
                    <input type="hidden" name="CustID" id="CustID" runat="server" />
                </td>

                <td class="TdTitle">房屋编号</td>
                <td class="TdContentSearch">
                    <input class="easyui-searchbox" disabled style="width: 82%;" id="RoomSign" data-options="editable:false,required:true" name="RoomSign" searcher="SelRoom" runat="server" />
                    <input type="hidden" name="RoomID" id="RoomID" runat="server" />
                </td>
            </tr>
            <tr style="display: none;">
                <td class="TdTitle">可选房号</td>
                <td class="TdContentSearch">
                    <select id="SelectRoomID" disabled class="easyui-combobox" data-options="editable:false,panelHeight: 'auto'" name="SelectRoomID" onchange="javascript:SelectRoomID_OnChange();" runat="server">
                    </select>
                </td>
                <td class="TdTitle">建议标题</td>
                <td class="TdContent" colspan="3">
                    <input id="SuggestionsTitle" disabled name="SuggestionsTitle" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="TdTitle">建议内容</td>
                <td class="TdContent" colspan="3">
                    <textarea style="height: 80px" disabled id="SuggestionsContent"
                        maxlength="200" name="Phone" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">提交时间</td>
                <td class="TdContent">
                    <input id="IssueDate" maxlength="200" disabled name="IssueDate" readonly runat="server" /></td>
                <td class="TdTitle">联系电话</td>
                <td class="TdContent">
                    <input id="LinkPhone" maxlength="200" disabled name="LinkPhone" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">图片<%--<a id="upbtn" href="javascript:void(0)">(上传)</a>--%></td>
                <td class="TdContent" colspan="3">
                    <span id="imgSpan"><%=ImgList%></span></td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">二、物管回复</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">回复状态</td>
                <td class="TdContent">
                    <asp:DropDownList ID="ReplyStats" disabled runat="server">
                        <asp:ListItem Value="未回复">未回复</asp:ListItem>
                        <asp:ListItem Value="已回复">已回复</asp:ListItem>
                    </asp:DropDownList>
                </td>

                <td class="TdTitle">建议类别</td>
                <td class="TdContent">
                    <asp:DropDownList ID="SuggestionsType" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">回复内容</td>
                <td class="TdContent" colspan="3">
                    <textarea style="height: 80px" id="ReplyContent"
                        maxlength="200" name="ReplyContent" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">回复人</td>
                <td class="TdContent">
                    <input id="ReplyPeople" name="ReplyPeople" runat="server" />
                </td>
                <td class="TdTitle">回复时间</td>
                <td class="TdContent">
                    <input id="ReplyDate" readonly onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })"
                        maxlength="50" name="ReplyDate" runat="server" />
                </td>
            </tr>

            <tr>
                <td colspan="4" style="border: 1px solid #cccccc; padding-left: 12px; background-color: #F6F6F6; font-size: 16px; text-align: center; font-family: 微软雅黑;">
                    <span style="font-size: 16px">三、客户评价</span>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户评价</td>
                <td class="TdContent">
                    <input id="CustEvaluation" disabled name="CustEvaluation" runat="server" />
                </td>
                <td class="TdTitle">评价时间</td>
                <td class="TdContent">
                    <input id="EvaluationDate" disabled onclick="WdatePicker({ startDate: '%y-%M-01 00:00:00', dateFmt: 'yyyy-MM-dd HH:mm:ss', alwaysUseStartDate: true })"
                        maxlength="50" name="EvaluationDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding-top: 20px;" colspan="4" class="DialogTdSubmit">
                    <input id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                        type="button" value="保存" name="btnSave" runat="server" class="button" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="返回" id="back" /></td>
            </tr>
        </table>

    </form>
</body>
</html>

<script type="text/javascript">

    $("#back").click(function () {
        close("false");
    });

    function close(callparm) {
        HDialog.Close(callparm);
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


            $.tool.DataGet('Choose', 'CustRoomSigns', $('#Suggestions').serialize(),
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

    $(document).ready(function () {
        //$("#EvaluationDate").val();
        // 任何需要执行的js特效 
        var ReplyStats = $('#ReplyStats').val();
           $('#ReplyDate').attr("disabled",true);

        if (ReplyStats == "已回复")
        {
            $('#btnSave').hide();
           $('#SuggestionsType').attr("disabled",true);
           $('#ReplyContent').attr("disabled",true);
           $('#ReplyPeople').attr("disabled",true);
           $('#ReplyDate').attr("disabled",true);
        }
    });
</script>

