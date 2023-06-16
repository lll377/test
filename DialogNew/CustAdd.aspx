<%@ Page Language="c#" CodeBehind="CustAdd.aspx.cs" AutoEventWireup="false" Inherits="M_Main.DialogNew.CustAdd" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>CustAdd</title>
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
    <script src="../jscript/ajax.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/framesearch_old.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" rel="stylesheet" />
    <script src="../jscript/DateFormat.js" type="text/javascript"></script>
    <script src="../jscript/format.js" type="text/javascript"></script>
    <script type="text/javascript">


        function CheckData() {
            if (CustAdd.CustName.value == "") {
                HDialog.Info("请输入临时客户名称,此项不能为空!");
                CustAdd.CustName.focus();
                return false;
            }

            if (CustAdd.PaperCode.value == "") {
                HDialog.Info("请输入证件号码,此项不能为空!");
                CustAdd.PaperCode.focus();
                return false;
            }

            if (CustAdd.CustTypeID.value == "") {
                HDialog.Info("请选择客户类别,此项不能为空!");
                CustAdd.CustTypeID.focus();
                return false;
            }

            var strPaperCodeResults = getObject("PaperCodeResults").innerHTML;

            if ((strPaperCodeResults != "") && (strPaperCodeResults != "新的号码！")) {
                HDialog.Info(strPaperCodeResults);
                CustAdd.PaperCode.focus();
                return false;
            }
            var isExist = $("#IsExist").val();
            if (isExist == -1) {
                HDialog.Info('证件号已存在！');
                CustAdd.PaperCode.focus();
                return false;
            }

            return true;
        }

        function CheckPaperCode() {
            $("#IsExist").val(1);
            var strCustID = "0";
            var strPaperCode = CustAdd.PaperCode.value;

            getObject("results").innerHTML = "";
            //alert(strLoginCode);

            Request.sendPOST("../House/CheckPaperCode.aspx", "CustID=" + strCustID + "&PaperCode=" + strPaperCode + "&Rnd=" + Math.random(), callbackPaperCode);

        }
        function callbackPaperCode(xmlHttp) {
            //alert(xmlHttp.responseText);
            //var varReturn = xmlHttp.responseText;
            //getObject("PaperCodeResults").innerHTML = varReturn;
            var varReturn = xmlHttp.responseText;
            var res = varReturn.split('|');

            //getObject("PaperCodeResults").innerHTML = res[1];
            if (res[0] == "false") {
                $("#IsExist").val(-1);
            } 
        }

    </script>
</head>
<body>
    <form id="CustAdd" method="post" runat="server">
        <input id="IsExist" type="hidden" name="IsExist" value="1" />
        <table class="DialogTable">
            <tr>
                <td class="TdTitle">&nbsp;</td>
                <td class="TdContent">
                    <input class="button" id="btnReadPaperCode" onclick="ReadPaperCode()" type="button" value="读取身份证信息" runat="server"></td>
                <td class="TdTitle">&nbsp;</td>
                <td class="TdContent">&nbsp;</td>
            </tr>
            <tr>
                <td class="TdTitle">临时客户名称</td>
                <td class="TdContent">
                    <input id="CustName" name="CustName" data-options="required:true" runat="server">
                </td>
                <td class="TdTitle">出入证号</td>
                <td class="TdContent">
                    <input id="PassSign" name="PassSign" runat="server">
                </td>
            </tr>
            <tr>
                <td class="TdTitle">证件名称</td>
                <td class="TdContent">
                    <select id="PaperName" name="PaperName" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">证件号码</td>
                <td class="TdContent">
                    <input class="easyui-validatebox" id="PaperCode" name="PaperCode" runat="server" data-options="required:true"
                        onblur="javascript:CheckPaperCode();"><div class="font_red" id="PaperCodeResults"></div>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">客户类别</td>
                <td class="TdContent">
                    <select id="CustTypeID" name="CustTypeID" runat="server">
                        <option selected></option>
                    </select></td>
                <td class="TdTitle">固定电话</td>
                <td class="TdContent">
                    <input id="FixedTel" name="FixedTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">移动电话</td>
                <td class="TdContent">
                    <input id="MobilePhone" name="MobilePhone" runat="server"></td>
                <td class="TdTitle">传真电话</td>
                <td class="TdContent">
                    <input id="FaxTel" name="FaxTel" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">联系地址</td>
                <td class="TdContent">
                    <input id="Address" name="Address" runat="server"></td>
                <td class="TdTitle">邮政编码</td>
                <td class="TdContent">
                    <input id="PostCode" name="PostCode" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">收 件 人</td>
                <td class="TdContent">
                    <input id="Recipient" name="Recipient" runat="server"></td>
                <td class="TdTitle">电子邮件</td>
                <td class="TdContent">
                    <input id="EMail" name="EMail" runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">备注</td>
                <td class="TdContent" colspan="3">
                    <textarea id="Memo" style="width: 90%; height: 72px" name="Memo" rows="4" cols="38" runat="server"></textarea></td>
            </tr>
            <tr>
                <td class="formTable_Footer" align="center" colspan="4">
                    <input style="z-index: 0; width: 22px; height: 22px" id="hiCommID" size="1" type="hidden"
                        name="hiCommID" runat="server"><input id="CustID" style="width: 22px; height: 22px" type="hidden" size="1" name="CustID"
                            runat="server"><input id="LiveType" style="width: 22px; height: 22px" type="hidden" size="1" name="LiveType"
                                runat="server"><input id="ReturnUrl" style="width: 22px; height: 22px" type="hidden" size="1" name="ReturnUrl"
                                    runat="server"><input class="button" id="btnSave" onclick="javascript: if (CheckData() == false) return false;"
                                        type="button" value="保存" name="btnFilter" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						&nbsp;&nbsp;&nbsp;
                    <input class="button" id="btnReturn" type="button" value="关闭" name="btnReturn" runat="server"></td>
            </tr>
        </table>
        <script type="text/javascript">
            $('#btnReturn').click(function () {
                HDialog.Close();
            });

            function ReadPaperCode() {



                var Height = 400;
                var Width = 700;

                var iTop2 = (window.screen.height - 400) / 2;
                var iLeft2 = (window.screen.width - 700) / 2;
                var sFeatures = "status:no;help:no;resizable:no;scroll:no;dialogHeight:" + Height + "px;modal=yes;dialogWidth:" + Width + "px;dialogLeft=" + iLeft2 + "px;dialogTop=" + iTop2 + "px";

                window.showModalDialog('../HouseNew/PaperCodeRead.aspx', "", sFeatures);


                Request.sendPOST("../HouseNew/PaperCodeReadInfo.aspx", "", callbackPaperCodeInfo);

            }
            function callbackPaperCodeInfo(xmlHttp) {
                //alert(xmlHttp.responseText);
                var varReturn = xmlHttp.responseText;

                if (varReturn != "") {
                    var strName = varReturn.split('|')[0];
                    var strSex = varReturn.split('|')[1];
                    var strNation = varReturn.split('|')[2];
                    var strBorn = varReturn.split('|')[3];
                    var strAddress = varReturn.split('|')[4];
                    var strCardNo = varReturn.split('|')[5];
                    var strPicSrc = varReturn.split('|')[6];
                    strBorn = strBorn.replace('年', '-').replace('月', '-').replace('日', '');
                    $('#CustName').val(strName);
                    $('#PaperCode').val(strCardNo);
                    $('#Address').val(strAddress);
                    $('#Sex').val(strSex);
                    // $('#Birthday').val(strBorn)
                }
                //alert(varReturn);
            }
        </script>
    </form>
</body>
</html>
