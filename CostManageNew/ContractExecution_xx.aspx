<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractExecution_xx.aspx.cs" Inherits="M_Main.CostManageNew.ContractExecution_xx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>核查记录详情</title>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script src="../jscript/jquery.tool.js" type="text/javascript"></script>
    <script src="../jscript/Authority.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.1/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/EquimentDictionaryCanNull.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <link href="../css/button.css" rel="stylesheet" />
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>

    <script type="text/javascript" src="../jscript/Cache.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
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
                width: 99%;
                height: 20px;
                padding-left: 2px;
            }

            .Container .Content select {
                height: 22px;
            }
    </style>
</head>
<body style="margin: 0px; margin-top: 0px;" scroll="no">
    <form id="frmForm" runat="server">
        <div class="Container">
            <ul>
                <li class="InputTitle">项目名称：</li>
                <li class="Content">
                    <input id="CommName" name="CommName" class="easyui-validatebox" type="text" onclick="SelItem();" style="border: 1px solid #cccccc;" readonly="readonly" runat="server" />
                    <input type="hidden" id="CommId" name="CommId" runat="server" />
                </li>
                <li class="InputTitle">机构部门：</li>
                <li class="Content">
                    <input id="DepName" name="DepName" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" type="text" onclick="SelDep();" readonly="readonly" runat="server" />
                    <input type="hidden" id="DepCode" name="DepCode" runat="server" />
                </li>
                <li class="InputTitle">负责人：</li>
                <li class="Content">
                    <input id="PrincipalName" name="PrincipalName" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" type="text" onclick="SelUserSerPrincipal();" readonly="readonly" runat="server" />
                    <input type="hidden" id="Principal" name="Principal" runat="server" />
                </li>

                <li class="InputTitle">合同编号：</li>
                <li class="Content">
                    <input id="ContractNo" name="ContractNo" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc; width:90%" type="text" onclick="SelContractInformation();" readonly="readonly" runat="server" />
                    <a id="personnalShow" style="color: blue; cursor: pointer; float: right;" onclick="ContractShow()">查看</a>
                </li>
                <li class="InputTitle">合同名称：</li>
                <li class="Content">
                    <input id="ContractName" name="ContractName" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" type="text" readonly="readonly" runat="server" />
                </li>

                <li class="InputTitle">合同类型：</li>
                <li class="Content">
                    <input id="TypeName" name="TypeName" type="text" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" readonly="readonly" runat="server" />
                    <input type="hidden" name="ContractType" id="ContractType" value="" runat="server" />
                </li>
                <li class="InputTitle">供方单位：</li>
                <li class="Content">
                    <input id="SupplierName" name="SupplierName" type="text" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" readonly="readonly" runat="server" />
                    <input type="hidden" name="SupplierId" id="SupplierId" value="" runat="server" />
                </li>

                <li class="InputTitle">合同金额：</li>
                <li class="Content">
                    <input id="ContractMoney" name="ContractMoney" class="easyui-validatebox" data-options="required:true" style="border: 1px solid #cccccc;" type="text" readonly="readonly" runat="server" />
                </li>

                <li class="InputTitle">执行时间从：</li>
                <li class="Content">
                    <input id="ExecuteDateBegin" name="ExecuteDateBegin" class="easyui-datebox" type="text" data-options="required:true" runat="server"/>
                    到
                    <input id="ExecuteDateEnd" name="ExecuteDateEnd" class="easyui-datebox" type="text" data-options="required:true" runat="server" />
                </li>
                
                <li class="InputTitle">完成工作：</li>
                <li class="Content">
                    <textarea id="Schedule" name="Schedule" class="easyui-validatebox" style="width: 99%; border: 1px solid #cccccc; height: 20px;" data-options="required:true" runat="server"></textarea>
                </li>
                
                <li class="InputTitle">是否按进度完成：</li>
                <li class="Content">
                    <select id="IsSchedule" name="IsSchedule" style="border: 1px #cccccc solid;" runat="server">
                        <option value="0">是</option>
                        <option value="1">否</option>
                    </select>
                    是否扣罚：
                    <select id="IsDeduct" name="IsDeduct" style="border: 1px #cccccc solid;" runat="server">
                        <option value="0">是</option>
                        <option value="1">否</option>
                    </select>
                </li>
                
                <li class="InputTitle">扣罚金额（元）：</li>
                <li class="Content">
                    <input id="DeductMoney" name="DeductMoney" type="text" class="easyui-validatebox" style="border: 1px solid #cccccc;"  runat="server"/>
                </li>

                <li class="InputTitle">整改措施：</li>
                <li class="Content">
                    <input id="ReDo" name="ReDo" class="easyui-validatebox" style="border: 1px solid #cccccc;" type="text" runat="server" />
                </li>
                
                <li class="InputTitle">备注：</li>
                <li class="Content">
                    <textarea id="Remark" name="Remark" style="width: 99%; border: 1px solid #cccccc; height: 40px;" runat="server"></textarea>
                </li>

                <li class="InputTitle">上传附件：</li>
                <li class="Content">
                    <input id="btnFile" style="width: 260px; height: 25px;" tabindex="1" type="file" size="1"
                        name="btnFile" runat="server" />
                    <input type="button" name="fileList" style="width: 50px; height: 25px;" value="上传" id="fileList" runat="server" />
                    <input type="button" name="fileList1" style="width: 70px; height: 25px;" value="查看列表" id="fileList1" runat="server" onclick="OnFileList();" />
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

        <input type="hidden" id="CeId" name="CeId" runat="server" value="" />
        <input type="hidden" id="OpType" name="OpType" />
        <input type="hidden" id="CId" name="CId" runat="server" />
        <script type="text/javascript">
            //选择项目
            function SelItem() {
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

            //查看合同详情
            function ContractShow() {
                var w = top.$(window).width();
                var h = parent.$(window).height();
                if ($("#CId").val() == null || $("#CId").val() == "" || $("#CId").val() == undefined) {
                    HDialog.Info("请选择查看合同");
                    return;
                }
                HDialog.Open('1000', h, '../CostManageNew/FromTabs.aspx?changBS=1&OpType=edit&Id=' + $("#CId").val(), '查看合同信息', true, function callback(_Data) {
                });
            }

            //查看上传附件
            function OnFileList() {
                HDialog.Open(600, 450, '../DialogNew/ContractTenderFiles.aspx?CtId=' + $("#CeId").val(), '查看合同执行附件', true, function callback(_Data) {
                });
            }

            //选择部门
            function SelDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != '') {
                        var arrRet = _Data.split(',');
                        $("#DepCode").val(arrRet[0]);
                        $("#DepName").val(arrRet[1]);
                    }
                });
            }

            //选择责任人
            function SelUserSerPrincipal() {
                HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#Principal").val(varObjects.UserCode);
                        $("#PrincipalName").val(varObjects.UserName);
                    }
                });
            }

            //选择评价人
            //function SelUserSerAppraiser() {
            //    HDialog.Open('740', '450', '../DialogNew/SelUser.aspx', '选择人员', true, function callback(_Data) {
            //        if (_Data != "") {//**获得返回的参数信息
            //            var varObjects = JSON.parse(_Data);
            //            $("#Appraiser").val(varObjects.UserCode);
            //            $("#AppraiserName").val(varObjects.UserName);
            //        }
            //    });
            //}

            //选择合同
            function SelContractInformation() {
                HDialog.Open('800', '500', '../DialogNew/SelContractInformation.aspx?IsApproval=1', '选择合同', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = JSON.parse(_Data);
                        $("#CommId").val(varObjects.CommId);
                        $("#CommName").val(varObjects.CommName);
                        $("#DepCode").val(varObjects.DepCode);
                        $("#DepName").val(varObjects.DepName);
                        $("#Principal").val(varObjects.Principal);
                        $("#PrincipalName").val(varObjects.PrincipalName);
                        $("#CId").val(varObjects.CId);
                        $("#ContractNo").val(varObjects.ContractNo);
                        $("#ContractName").val(varObjects.ContractName);
                        $("#SupplierId").val(varObjects.SupplierId);
                        $("#SupplierName").val(varObjects.SupplierName);
                        $("#ContractType").val(varObjects.ContractType);
                        $("#TypeName").val(varObjects.TypeName);
                        $("#ContractMoney").val(varObjects.ContractMoney);
                    }
                });
            }

            function Load() {
                $("#CeId").val(GetQueryString('CeId'));
                $("#OpType").val(GetQueryString('OpType'));

                if (GetQueryString('OpType') == 'edit') {
                    $.tool.DataGet('CsCost', 'GetContractExecutionDetail', $('#frmForm').serialize(),
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
                $.tool.DataPostChk('frmForm', 'CsCost', 'SaveContractExecution', $('#frmForm').serialize(),
                        function Init() {
                        },
                        function callback(_Data) {
                            alert("保存成功!");
                            HDialog.Close();
                        },
                        function completeCallback() {
                        },
                        function errorCallback() {
                        });
            }
            $(document).ready(function () { $("#frmForm").form('validate'); });

            Load();

        </script>
    </form>
</body>
</html>



