<%@ Page Language="c#" CodeBehind="PublicResultInsManage.aspx.cs" AutoEventWireup="false" Inherits="M_Main.HouseNew.PublicResultInsManage" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>PublicResultInsManage</title>
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
    <script language="javascript">
		<!--

    function better_time(strDateStart, strDateEnd) {
        var strSeparator = "-";   //日期分隔符   
        var strDateArrayStart;
        var strDateArrayEnd;
        var intDay = 9999;
        if ((strDateStart != "") && (strDateEnd != "")) {
            strDateArrayStart = strDateStart.split(strSeparator);
            strDateArrayEnd = strDateEnd.split(strSeparator);
            var strDateS = new Date(strDateArrayStart[0] + "/" + strDateArrayStart[1] + "/" + strDateArrayStart[2]);
            var strDateE = new Date(strDateArrayEnd[0] + "/" + strDateArrayEnd[1] + "/" + strDateArrayEnd[2]);
            intDay = (strDateS - strDateE) / (1000 * 3600 * 24)
        }
        return intDay
    }


    function CheckData() {
        if (PublicResultInsManage.ListDate.value == "") {
            HDialog.Info("请输入抄表日期,此项不能为空!");
            PublicResultInsManage.ListDate.focus();
            return false;
        }
        if (PublicResultInsManage.EndDegree.value == "") {
            HDialog.Info("请输入本次止数,此项不能为空!");
            PublicResultInsManage.EndDegree.focus();
            return false;
        }

        //var iday = better_time(PublicResultInsManage.ListDate.value,PublicResultInsManage.MaxListDate.value)					
        //if ( parseInt(iday,10) <=0 )
        //{
        //	alert("抄表日期应大于最近抄表日期("+PublicResultInsManage.MaxListDate.value+")！");
        //	return false;
        //}

        /*var iday = better_time(PublicResultInsManage.ThisDate.value,PublicResultInsManage.ListDate.value)					
        if ( parseInt(iday,10) <0 )
        {
            alert("抄表日期不能超过今日！");
            return false;
        }*/

        return true;
    }
		//-->
    </script>
    <script language="javascript" type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
</head>
<body>

    <form id="PublicResultInsManage" method="post" runat="server">
        <input id="MeterSource" name="MeterSource" type="hidden" value="ERP单户抄表" runat="server" />
        <table class="DialogTable" style="width: 100%">

            <tr>
                <td class="TdTitle">
                    <input id="MaxListDate" style="width: 8px; height: 22px" type="hidden" size="1" name="MaxListDate"
                        runat="server" />
                    <input id="ThisDate" style="width: 8px; height: 22px" type="hidden" size="1" name="ThisDate"
                        runat="server" />
                    <input id="MeterID" type="hidden" name="MeterID" runat="server" style="width: 8px; height: 22px"
                        size="1" /><input id="hiOPType" type="hidden" name="hiOPType" runat="server" style="width: 8px; height: 22px"
                            size="1" />抄表日期</td>
                <td class="TdContent">
                    <input id="ListDate" type="text" maxlength="20" name="ListDate" class="Wdate" data-options="required:true"
                        runat="server" onclick="WdatePicker()">
                </td>
                <td class="TdTitle">上次抄表日期</td>
                <td class="TdContent">
                    <input id="LastListDate" type="text" maxlength="20" name="LastListDate"
                        runat="server" readonly>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">表计名称</td>
                <td class="TdContent">
                    <asp:Label ID="MeterName" runat="server"></asp:Label></td>
                <td class="TdTitle">表计类型</td>
                <td class="TdContent">
                    <asp:Label ID="MeterTypeName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">上次起数</td>
                <td class="TdContent">
                    <asp:Label ID="LastStartDegree" runat="server"></asp:Label></td>
                <td class="TdTitle">上次止数</td>
                <td class="TdContent">
                    <asp:Label ID="LastEndDegree" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="TdTitle">本次止数</td>
                <td class="TdContent">
                    <input id="EndDegree" type="text" maxlength="50" name="EndDegree" class="easyui-validatebox" data-options="prompt:'请输入数字',required:true,validType:'positiveint'"
                        runat="server"></td>
                <td class="TdTitle"></td>
                <td class="TdContent">
                    <input id="StartDegree" style="width: 120px; height: 22px" type="hidden" size="14" name="StartDegree"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">新表起数</td>
                <td class="TdContent">
                    <input id="NewStartDegree" type="text" maxlength="50" name="NewStartDegree" class="easyui-validatebox"
                        runat="server"></td>
                <td class="TdTitle">新表止数</td>
                <td class="TdContent">
                    <input id="NewEndDegree" type="text" maxlength="50" name="NewEndDegree"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">变比</td>
                <td class="TdContent">
                    <asp:Label ID="Ratio" runat="server"></asp:Label></td>
                <td class="TdTitle">损耗</td>
                <td class="TdContent">
                    <input id="ExtraDosage" type="text" maxlength="50" name="ExtraDosage" class="easyui-validatebox"
                        runat="server"></td>
            </tr>
            <tr>
                <td class="TdTitle">单价</td>
                <td class="TdContent">
                    <asp:Label ID="Price" runat="server"></asp:Label></td>
                <td class="TdTitle">调整金额</td>
                <td class="TdContent">
                    <input id="AdjustAmount" type="text" name="AdjustAmount"
                        data-options="prompt:'请输入数字',required:true,validType:'positiveint'"
                        runat="server">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input id="btnSave" onclick="javascript: if (CheckData() == false) return false;" type="button"
                        value="保存" name="btnFilter" runat="server" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							&nbsp;&nbsp;&nbsp;
                    <input id="btnReturn" type="button" value="关闭" name="btnFilter" runat="server" class="button"></td>
            </tr>
        </table>
    </form>
</body>
</html>
