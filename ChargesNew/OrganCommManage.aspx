<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganCommManage.aspx.cs" Inherits="M_Main.ChargesNew.OrganCommManage" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css">
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
            padding: 5px;
        }

        .Container {
            width: 100%;
            height: auto;
            margin-top: 5px;
            font-size: 12px;
            font-family: 微软雅黑;
        }

            .Container ul {
                margin: 0px auto;
                clear: both;
            }

                .Container ul .InputTitle {
                    list-style-type: none;
                    float: left;
                    text-align: center;
                    margin-bottom: 10px;
                    min-height: 22px;
                    line-height: 22px;
                    width: 120px;
                    text-align: right;
                }

                .Container ul .TextareaTitle {
                    list-style-type: none;
                    float: left;
                    text-align: right;
                    margin-bottom: 10px;
                    width: 80px;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 80%;
                }

                .Container ul .ContentBlank {
                    list-style-type: none;
                    float: left;
                    width: 80%;
                    text-align: left;
                    margin-bottom: 10px;
                }

                .Container ul .Submit {
                    list-style-type: none;
                    text-align: center;
                    padding-top: 4px;
                    width: 80%;
                    height: 40px;
                }

            .Container .Content textarea {
                width: 70%;
                height: 100px;
                overflow: scroll;
                resize: none;
                border: 1px solid #cccccc;
                padding-left: 2px;
            }

            .Container .Content input {
                width: 99%;
                border: 1px solid #cccccc;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content select {
                height: 22px;
            }
    </style>
</head>
<body style="overflow-y: auto;">
    <form id="frmForm" runat="server">

        <div class="Container">
            <ul>
                <li class="InputTitle">税控类别：</li>
                <li class="Content">
                    <asp:DropDownList ID="VATType" runat="server" AutoPostBack="True" OnTextChanged="VATType_SelectedIndexChanged">
                        <asp:ListItem Text="百旺税控盘" Value="1" />
                        <asp:ListItem Text="航天金税盘" Value="2" />
                    </asp:DropDownList>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">注册码(APPKEY)：</li>
                <li class="Content">
                    <input id="skpbh" name="skpbh" runat="server" class="easyui-validatebox " value="" data-options="required:true" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle" style="margin-top: -5px; margin-bottom: 5px;"></li>
                <li class="Content" style="color: red; margin-top: -5px; margin-bottom: 5px;">*注：注册码(APPKEY)每年变更一次，注意跨年时修改</li>
            </ul>
            <ul>
                <li class="InputTitle">税控盘口令：</li>
                <li class="Content">
                    <input id="skpkl" name="skpkl" runat="server" type="password" />

                </li>
            </ul>
            <ul>

                <li class="InputTitle">数字证书密码：</li>
                <li class="Content">

                    <input id="keypwd" name="keypwd" runat="server" type="password" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">销货单位识别号：</li>
                <li class="Content">
                    <input id="xhdwsbh" name="xhdwsbh" runat="server" class="easyui-validatebox " data-options="required:true" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">销货单位名称：</li>
                <li class="Content">
                    <input id="xhdwmc" name="xhdwmc" runat="server" class="easyui-validatebox " data-options="required:true" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">销货单位地址电话：</li>
                <li class="Content">
                    <input id="xhdwdzdh" name="xhdwdzdh" runat="server" class="easyui-validatebox " data-options="required:true" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">销货单位银行帐号：</li>
                <li class="Content">
                    <input id="xhdwyhzh" name="xhdwyhzh" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">专票限额：</li>
                <li class="Content">
                    <input id="SpecialTicketAmount" name="SpecialTicketAmount" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">普票限额：</li>
                <li class="Content">
                    <input id="GeneralTicketAmount" name="GeneralTicketAmount" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="InputTitle">电子发票限额：</li>
                <li class="Content">
                    <input id="EInvoiceAmount" name="EInvoiceAmount" runat="server" class="easyui-validatebox " data-options="required:true">
                </li>
            </ul>
            <ul>
                <li class="Submit">
                    <input type="button" class="button" value="保存" runat="server" id="BtnSave" />
                </li>
            </ul>
        </div>
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <input type="hidden" id="OpType" name="OpType" value="edit" runat="server" />
        <input type="hidden" id="VATCode" name="VATCode" runat="server" />
        <input id="hskpkl" name="hskpkl" runat="server" type="hidden" />
        <input id="hkeypwd" name="hkeypwd" runat="server" type="hidden" />


        <script type="text/javascript">

            //$(function () {
            //    $("#VATType").change(function () {
            //        if ($(this).val() == "2") {
            //            $("#skpkl").attr("data-options", "required:false");
            //            $("#skpkl").removeClass("validatebox-text validatebox-invalid");
            //        } else {
            //            $("#skpkl").attr("data-options", "required:true");
            //            $("#skpkl").addClass("validatebox-text validatebox-invalid");
            //        }
            //    });
            //})

            function Init() {
                if ($('#hskpkl').val() != '') {
                    $('#skpkl').val($('#hskpkl').val());
                }
                if ($('#hkeypwd').val() != '') {
                    $('#keypwd').val($('#hkeypwd').val());
                }
                if ($('#VATCode').val() == '') {
                    $(".Container :input").val('');
                    $("#BtnSave").val('保存');
                }
            }
            Init();
            //更新
            $("#BtnSave").click(function () {
                Update();
            });

            function Update() {

                $.tool.DataPostChk('frmForm', 'Organ', 'SaveCommVat', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            HDialog.Info('保存成功');
                        }
                        else {
                            HDialog.Info('保存失败');
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
            }

            function SelectVatttype(strSelectValue) {
                $('#VATType').val(strSelectValue);
            }


        </script>
    </form>
</body>
</html>
