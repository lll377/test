<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpIncidentCodeBrowse.aspx.cs" Inherits="M_Main.IncidentNewJH.CorpIncidentCodeBrowse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报事编号设置</title>
    <script src="../jscript/jquery-1.11.3.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/MapData/CityJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/ProJson.js" type="text/javascript"></script>
    <script src="../jscript/MapData/DistrictJson.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Jscript/json2.js"></script>
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
            margin-top: 25px;
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
                    padding-top: 10px;
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
                <li class="InputTitle">项目名称：</li>
                <li class="Content">
                    <input id="CommName" name="CommName" runat="server" disabled="disabled" />
                </li>
            </ul>
            <ul>
                <li class="InputTitle">报事编号前缀：</li>
                <li class="Content">
                    <input id="IncidentCode" name="IncidentCode" runat="server" class="easyui-validatebox " />
                </li>
            </ul>

            <ul>
                <li class="Submit">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                </li>
            </ul>
        </div>
        <input type="hidden" id="ID" name="ID" runat="server" />
        <input type="hidden" id="CommID" name="CommID" runat="server" />
        <input type="hidden" id="OrganCode" name="OrganCode" runat="server" />
        <script type="text/javascript">


            //更新小区代码
            $("#BtnSave").click(function () {
                if ($("#CommID").val() == "") {
                    HDialog.Info("请在左侧选择项目");
                    return;
                }
                Update();
            });

            function Update() {

                $.tool.DataPostChk('frmForm', 'IncidentChoose', 'SaveIncidentCommCode', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "double") {
                            HDialog.Info("报事编码已存在！");
                            return;
                        }
                        if (_Data == "false") {
                            HDialog.Info("保存失败！");
                            return;
                        }
                        else {
                            HDialog.Info("保存成功！");
                            var varObjects = JSON.parse(_Data);

                            parent.window.frames["CorpIncidentCodeOrganTree"].window.RefreshLeftTree(
                                varObjects.OrganCode, varObjects.CommID);

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

