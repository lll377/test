<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentBackPage.aspx.cs" Inherits="M_Main.IncidentNewJH.IncidentBackPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/demo/demo.css" />
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jscript/Cache.js"></script>
     <style>
        .TdTitle {
             width: 15%;
        }
        td {
           padding-bottom:6px;
        }
        textarea {
            resize: none;
            border: 1px solid #ccc;      
            height:75px;
        }
         input:disabled {
             border: 0px;
             background-color: #fff;
             color: #ACA899;
         }
    </style>
</head>
<body style="overflow-y: scroll;">
    <form id="frmForm" runat="server">
           <input type="hidden" id="hiIncidentID" name="hiIncidentID" runat="server" value="" />     
           <input type="hidden" id="OpType" name="OpType" runat="server" value="" />
        <table class="DialogTable" align="center" style="width:100%;">
            <tr>
                 <td class="TdTitle">退回原因：
                    </td>
                    <td class="TdContentSearch" colspan="5">
                        <textarea id="CloseGoBackReasons" class="easyui-validatebox" data-options="required:true" name="BackContent" style="width: 100%;"></textarea>
                    </td>
            </tr>                  
               <tr style="height: 30px;display:none;">
                    <td class="TdTitle" id="LastTimeTitle">上次完成时间：
                    </td>
                    <td class="TdContentSearch">
                      <input id="hilastTime" type="text" style="border:none;"  runat="server" disabled/>
                    </td>
                    <td class="TdTitle" id="LastUserTitle">上次完成人：
                    </td>
                    <td class="TdContentSearch">
                         <input id="hiLastUserCode" type="text" style="border:none;"  runat="server" disabled/>
                         <input id="hiLastUser" type="text" style="border:none;"  runat="server" disabled/>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td class="TdTitle">退回时间：
                    </td>
                    <td class="TdContentSearch">
                      <input id="CloseGoBackTime" type="text" style="border:none;" disabled  runat="server" />
                    </td>
                    <td class="TdTitle">退回人：
                    </td>
                    <td class="TdContentSearch">
                         <input id="CloseGoBackUser" type="text" style="border:none;" disabled  runat="server" />
                    </td>
                </tr>
            <tr>
                 <td colspan="6" class="DialogTdSubmit" style="text-align: center">
                      <input class="button" type="button" value="保存" onclick="btnNewSave()" style="margin:10px 35px 0 0;"/>                                           
                            <input type="button" class="button" value="放弃返回" id="BtnReturn" style="margin:10px 0 0 15px;"/>
                </td>     
            </tr>
        </table>
        <script type="text/javascript">
            function btnFileUp_Onclick() {
                if (frmForm.btnFile.value == "") {
                    HDialog.Info("请选择要上传的本地文件!");
                    return false;
                }
                UpladFile();
                return true;
            }
            function btnNewSave() {
                //验证
                var content = $('#CloseGoBackReasons').val();
                if (!content) {
                    HDialog.Info("请输入取消原因");
                    return;
                }
                if (content.length>500) {
                    HDialog.Info("取消原因不能超过500字");
                    return;
                }
                var incidentID = $('#hiIncidentID').val();
                var lastTime = $('#hilastTime').val();
                var lastUserCode = $('#hiLastUserCode').val();
                var lastUser = $('#hiLastUser').val();
                var backType = $('#OpType').val();
                //退回报事
                $.tool.DataGet('IncidentControl', 'BackIncident', "IncidentID=" + incidentID + "&BackReasons=" + escape(content) + "&LastTime=" + lastTime + "&LastUserCode=" + lastUserCode+ "&LastUser=" + lastUser + "&BackType=" + backType,
                    function Init() {
                    },
                    function callback(_Data) {                
                        if (_Data == 'true') {
                            HDialog.Info('退回成功');
                            HDialog.Close(1);
                        }
                        else {
                            HDialog.Info('退回失败');
                            HDialog.Close(1);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {
                    });

            };
            $("#BtnReturn").click(function () {
                close();
            });
            function close() {        
                HDialog.Close();
            }
           
        </script>          
    </form>
</body>
</html>
