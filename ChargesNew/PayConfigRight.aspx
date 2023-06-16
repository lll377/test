<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayConfigRight.aspx.cs" Inherits="M_Main.ChargesNew.PayConfigRight" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title></title>
    <script src="../jscript/jquery-1.11.3.min.js" type="text/javascript"></script>
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
       <input type="hidden" runat="server" id="Id" name="Id" value="0"/>
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
       <input type="hidden" id="CommID" name="CommID" runat="server" />
        <div class="Container">
            <ul>
                <li class="InputTitle">支付配置类型：</li>
                <li class="Content"> 
                       <asp:DropDownList  ID="PayConfigType" runat="server"> 
                        <asp:ListItem Text="支付宝支付" Value="1"/>
                        <asp:ListItem Text="通联支付" Value="2"/>
                        <asp:ListItem Text="闪惠支付" Value="3"/>
                        <asp:ListItem Text="银联全民付" Value="4"/>
                        <asp:ListItem Text="银联条码付" Value="5"/>
                        <asp:ListItem Text="威富通" Value="6"/>
                        <asp:ListItem Text="微信支付" Value="7"/>
                    </asp:DropDownList>
                </li>
            </ul>
            <ul>
                <li class="InputTitle">应用appid：</li>
                <li class="Content">
                    <input id="appid" name="appid"  runat="server" class="easyui-validatebox " value="" data-options="required:true" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">商户号：</li>
                <li class="Content">
                    <input id="custid" name="custid"  runat="server" class="easyui-validatebox " value="" data-options="required:true" />
                </li>
            </ul>
            <ul >
                <li class="InputTitle">MD5密钥：</li>
                <li class="Content">
                    <input id="appkey" name="appkey"  runat="server" class="easyui-validatebox " value="" data-options="required:true" />

                </li>
            </ul>
            <ul >
                <li class="InputTitle">门店号：</li>
                <li class="Content">
                    <input id="subbranch" name="subbranch"  runat="server" class="easyui-validatebox " value="" data-options="required:false" />

                </li>
            </ul>            
            <ul>
                <li class="Submit">
                    <input type="button" class="button" value="保存" runat="server" id="btnSave" />
                </li>
            </ul>
        </div>
       
    </form>
    <script type="text/javascript">
        $("#btnSave").click(function ()
        {
            var cmd = $("#hiOPType").val();
            $.tool.DataPostChk('frmForm', 'PaymentConfig', cmd, $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data)
                {
                    if (_Data == 'true')
                    {
                        alert('保存成功');
                    }
                    
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
        });
    </script>
</body>
</html>

