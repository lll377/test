<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractEquipmentInformation_xx.aspx.cs" Inherits="M_Main.CostManageNew.ContractEquipmentInformation_xx" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新增关联设备信息</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script src="../jscript/EquimentDictionaryCanNull.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script src="../jscript/Cache.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <style type="text/css">
        .ContainerLeft {
            float: left;
            overflow-y: auto;
            border-right: 1px solid #cccccc;
        }

        body {
            margin: 0px;
            margin-top: 0px;
            overflow: hidden;
            background-color: #ffffff;
            padding: 5px;
        }

        .Container {
            width: 100%;
            min-height: 550px;
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
                    width: 20%;
                    text-align: right;
                }

                .Container ul .Content {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 65%;
                }

                .Container ul .Title {
                    list-style-type: none;
                    float: left;
                    text-align: left;
                    margin-bottom: 10px;
                    width: 100%;
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

            .Container .Content input {
                width: 85%;
                height: 22px;
                padding-left: 2px;
            }

            .Container .Content select {
                height: 22px;
            }
    </style>


</head>
<body>
    <form id="frmForm" runat="server">
        <div class="Container">
            <ul>
                <li class="InputTitle">序号：</li>
                <li class="Content">
                    <input id="Sort" name="Sort" class="easyui-validatebox" style="border: 1px solid #cccccc;" />
                </li>
                <li class="InputTitle">项目名称：</li>
                <li class="Content">
                    <input id="CommName" name="CommName" type="text" class="easyui-validatebox" onclick="SelItem();" style="border: 1px solid #cccccc;" readonly="readonly" />
                        <input type="hidden" name="CommId" id="CommId" value="" />
                </li>
                <li class="InputTitle">设备名称：</li>
                <li class="Content">
                    <input id="EquipmentName" name="EquipmentName" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" onclick="SelCostEquipment();" readonly="readonly" />
                    <input type="hidden" name="EquiId" id="EquiId" value="" />
                </li>

                <li class="InputTitle">设备编号：</li>
                <li class="Content">
                    <input id="EquipmentNO" name="EquipmentNO" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" readonly="readonly" />
                </li>
                <li class="InputTitle">设备类别：</li>
                <li class="Content">
                    <input id="RankName" name="RankName" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" readonly="readonly" />
                </li>

                <li class="InputTitle">备注：</li>
                <li class="Content">
                    <textarea id="Remark" name="Remark" style="width: 85%; border: 1px solid #cccccc; height: 40px;"></textarea>
                </li>

                <li class="Title">
                    <table style="margin: auto;">
                        <tr>
                            <td style="height: 25px;"></td>
                            <td style="height: 25px; line-height: 25px;"></td>
                            <td>
                                <input type="button" class="button" value="保存" id="BtnSave" onclick="Save();" />
                                <input type="button" class="button" value="放弃" id="BtnClose" onclick="Close();" />
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </li>
            </ul>
        </div>

        <input type="hidden" id="CeId" name="CeId" />
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="CId" name="CId" />
        <script type="text/javascript">
            //选择项目
            function SelItem() {
                //HDialog.Open('370', '360', '../DialogNew/SelItem.aspx', '选择项目', true, function callback(_Data) {
                //    if (_Data != "") {//**获得返回的参数信息
                //        var varObjects = _Data.split(',');
                //        $("#CommId").val(varObjects[2]);
                //        $("#CommName").val(varObjects[1]);
                //    }
                //});
                HDialog.Open('370', '360', '../DialogNew/SelComm.aspx', '选择项目', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        //var varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        //$("#CommId").val(varObjects.attributes.InPopedom);
                        //$("#CommName").val(varObjects.text);
                               var arrRet = JSON.parse(_Data);
                        $("#CommId").val(arrRet.id);
                        $("#CommName").val(arrRet.name);
                    }
                });
            }
            function SelCostEquipment() {
                //选择关联设备
                HDialog.Open(1000, 500, '../DialogNew/CostEquipment.aspx', '选择关联设备', true, function callback(_Data) {
                    if (_Data != '') {
                        var Obj = JSON.parse(_Data);
                        console.log(_Data);
                        //选择供应商
                        $("#EquiId").val(Obj.EquipmentId);
                        $("#EquipmentName").val(Obj.EquipmentName);
                        $("#EquipmentNO").val(Obj.EquipmentNO);
                        $("#RankName").val(Obj.RankName);
                    }
                });
            }

            function Load() {
                $("#CeId").val(GetQueryString('CeId'));
                $("#OpType").val(GetQueryString('OpType'));
                $("#CId").val(GetQueryString('CId'));

                if (GetQueryString('OpType') == 'edit') {
                    $.tool.DataGet('CsCost', 'GetContractEquipmentDetail', $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        varObjects = eval("(" + _Data.replace(/\\/g, "/") + ")"); //转换为json对象
                        if (varObjects.length > 0) {
                            $.JQForm._Data = _Data;
                            $.JQForm.FillForm();
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });
                }
            }
            function Close() {
                HDialog.Close();
            }
            function GetQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }

            function Save() {
                $.tool.DataPostChk('frmForm', 'CsCost', 'SaveContractEquipmentDetail', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            HDialog.Close();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }

            Load();

        </script>
    </form>
</body>
</html>



