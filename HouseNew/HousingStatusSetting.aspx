<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HousingStatusSetting.aspx.cs" Inherits="M_Main.HouseNew.HousingStatusSetting" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_twocol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <style type="text/css">
        td, th {
            font-family: 微软雅黑;
        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <input id="RegionID" type="hidden" name="RegionID" runat="server" />
        <input id="RoomID" type="hidden" name="RoomID" runat="server" />
        <div class="datagrid-mask" style="height: 100%; width: 150%;"></div>
        <div class="datagrid-mask-msg" style='font-size: 12px; height: 55px; border: 1px solid #cccccc; z-index: 999999;'>
            <div id='DivProgressBar' class='easyui-progressbar' style='width: 200px; border: 1px solid #cccccc; margin-top: 10px;'></div>
            <div id='DivMsg' style='width: 200px; text-align: center; margin-top: 5px;'></div>
        </div>
        <table class="DialogTable">
            <tr>
                <td class="DialogTdTitle">新的交房状态</td>
                <td class="DialogTdContent">
                    <select id="NewRoomState" name="NewRoomState" runat="server">
                        <option selected></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">变更时间</td>
                <td class="DialogTdContent">
                    <input id="ChangeDate" class="easyui-datetimebox" style="width: 180px" data-options="required:true" size="10" name="ChangeDate" runat="server">
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">更改原因</td>
                <td class="DialogTdContent">
                    <input id="ChangeMemo" class="easyui-validatebox" data-options="required:true" name="ChangeMemo" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="DialogTdSubmit">
                    <input type="button" class="button" value="设置" id="BtnSave" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            var IsSubmitFlag = true;
            $("#BtnSave").click(function () {

                //if (IsSubmitFlag == false) {
                //    HDialog.Info("10秒内不要重复点击");
                //    return false;
                //}

                //IsSubmitFlag = false;
                //setTimeout('IsSubmitFlag=true', 10000);

                //缓存用完之后清除
                //是否选择全部房号
                var SelAllRoom = Cache.GetData("SelAllRoom");
                //选择的房号
                var SelRoomID = Cache.GetData("SelRoomID");


                var NewRoomState = $('#NewRoomState').val();
                if (NewRoomState == "") {
                    HDialog.Info('请选择新的交房状态,此项不能为空!');
                    return;
                }

                $.tool.DataPostNoLoading('Room', "settingroomstate", "SelAllRoom=" + SelAllRoom + "&SelRoomID=" + SelRoomID + "&" + $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        //var result = _Data;
                        //var r = result.split('|')[0];
                        //var Memo = result.split('|')[1];
                        //if (r == "true") {
                        //    Cache.SetData("SelAllRoom", "");
                        //    Cache.SetData("SelRoomID", "");
                        //    HDialog.Info(Memo);
                        //    close();
                        //}
                        //else {
                        //    HDialog.Info(Memo);
                        //}
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
                ShowProgress();
                //获取执行情况进度
                ProgressInterval = setInterval("TakeProgress()", 1000);
            });
            $("#BtnReturn").click(function () {
                close();
            });

            function TakeProgress() {
                $.tool.DataPostNoLoading('Room', 'RoomStateTakeProgress', $('#FrmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {

                        var Obj = JSON.parse(_Data);

                        if (_Data == '[]') {

                            CloseProgress();
                        }
                        else {
                            SetProgress(Obj);
                            if (Obj[0].Curr == '100') {

                                CloseProgress();

                                HDialog.Info('生成审核成功!');
                                close();
                                //if (Obj[0].IsComplete == '0') {
                                //    if ($('#isFeesCre').val() == '1') {
                                //        HDialog.Info('入账成功!');
                                //        $('#isFeesCre').val('-1');
                                //    }
                                //}
                            }
                            else {
                                //$('#isFeesCre').val('1');
                            }
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }
            //显示进度
            function ShowProgress() {
                var h = parseInt($(window).height()) + parseInt($(window).scrollTop());
                var ht = parseInt($(window).scrollTop());
                $(".datagrid-mask").css({ display: "block", width: "100%", height: h });
                $(".datagrid-mask-msg").css({ display: "block", left: ($(document.body).outerWidth(true) - 200) / 2, top: ht + 140 });
            }
            //关闭进度
            function CloseProgress() {
                clearInterval(ProgressInterval);
                $(".datagrid-mask").hide();
                $(".datagrid-mask-msg").hide();
            }
            //设置进度
            function SetProgress(Obj) {
                $('#DivProgressBar').progressbar('setValue', Obj[0].Curr);
                $('#DivMsg').html(Obj[0].MessageInfo);
            }
            function close() {
                HDialog.Close('');
            }
        </script>
    </form>
</body>
</html>
