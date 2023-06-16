<%@ Page Language="c#" CodeBehind="CorpIncidentTypeWarningManage.aspx.cs" AutoEventWireup="true" Inherits="M_Main.IncidentNew.CorpIncidentTypeWarningManage" %>

<!DOCTYPE >
<html>
<head>
    <title></title>
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
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <link href="../css/framedialog_fourcol.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="frmForm" runat="server">
        <input type="hidden" id="RuleID" name="RuleID" runat="server">
        <input type="hidden" id="WarningID" name="WarningID" runat="server">
        <input type="hidden" id="hiOPType" name="hiOPType" runat="server">
        <input type="hidden" id="TypeID" name="TypeID" runat="server">
        <input type="hidden" id="WarningUnit" name="WarningUnit" runat="server">

        <table class="DialogTable">
            <tr>
                <td style="background: #e6e6e6; height: 22px" align="center" colspan="4"><span style="font-size: 16px"><b>Ԥ��������Ϣ</b></span></td>
            </tr>
            <tr>
                <td class="TdTitle">�������</td>
                <td class="TdContentSearch" colspan="3">
                    <input type="text" class="easyui-searchbox" data-options="required:true,editable:false" id="TypeName" name="TypeName" searcher="SelTypeName" runat="server" style="width: 90%;" />
                    <select style="display: none" id="WarningType" runat="server" name="WarningType">
                        <option value="�ɹ���">�ɹ���</option>
                        <option value="Э����">Э����</option>
                        <option value="����" selected="selected">δ�ɹ�</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="TdTitle">Ԥ�����</td>
                <td class="TdContentSearch">
                    <select id="AssignmentState" class="easyui-combobox" data-options="required:true,panelHeight:'auto',onSelect:SelWarningType,editable:false" style="width: 100px;" runat="server" name="AssignmentState">
                        <option value="">��ѡ��</option>
                        <option value="0">δ����</option>
                        <option value="5">δ�ӵ�</option>
                        <option value="1">������</option>
                        <%-- <option value="2">�Ѵ���δ�ط�</option>--%>
                        <option value="3">�����</option>
                        <option value="4">�ѹر�</option>
                    </select>
                    <select id="Assignment" runat="server" name="Assignment" style="display: none;">
                        <option value="">��ѡ��</option>
                        <option value="0">δ����</option>
                        <option value="1">������</option>
                        <option value="2">�Ѵ���δ�ط�</option>
                    </select>
                </td>
                <td class="TdTitle"><span id="Warning">����ʱ��(Сʱ)</span></td>
                <td class="TdContent">
                    <input type="text" class="easyui-validatebox" id="WarningHour" name="WarningHour" data-options="prompt:'����������',validType:'digital',required:true" runat="server" /></td>
            </tr>
            <tr>
                <td class="TdTitle">Ԥ����λ</td>
                <td class="TdContentSearch" colspan="3">
                    <input type="text" id="RuleName" name="RuleName" class="easyui-searchbox" data-options="required:true,editable:false" searcher="SelRoleName" runat="server" style="width: 90%;" />
                    <select id="Duty" runat="server" name="Duty" style="display: none">
                        <option value="0">��ҵ��˾ά��</option>
                        <option value="1">��ҵ��˾ά��</option>
                        <option value="2">��ͬά��</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input type="button" class="button" value="����" id="BtnSave" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="�ر�" id="BtnReturn" runat="server" />
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            function SelTypeName() {
                HDialog.Open('650', '500', '../DialogNew/CorpBigIncidentTypeDlg.aspx?IsCheck=1&IsAll=True', 'ѡ�������', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#TypeID").val(arrRet.id);
                    $("#TypeName").searchbox("setValue", arrRet.text);
                    $("#TypeName").searchbox("setText", arrRet.text);
                });
            }

            function SelRoleName() {
                HDialog.Open('650', '500', '../DialogNew/SysCheckRoleDlg.aspx?IsCheck=1', 'ѡ��Ԥ����λ', false, function callback(_Data) {
                    var arrRet = JSON.parse(_Data);
                    $("#RuleID").val(arrRet.id);
                    $("#RuleName").searchbox("setText", arrRet.text);
                });
            }

            $("#BtnReturn").click(function () {
                close();
            });

            function close() {
                HDialog.Close();
            }

            function SelWarningType(record) {
                if (record != undefined) {
                    CheckWarningType(record.value);
                }
            }

            function CheckWarningType(value) {

                //if (value == 5 && value != '')  //�ѷ���δ�ӵ�   --��λͳһ��Сʱ
                //{
                //    $("#Warning").text('����ʱ��(����)');
                //    $("#WarningUnit").val("Minutes");
                //    if ($("#WarningHour").val() == '') { $("#WarningHour").val('15') }
                //    $("#WarningHour").val(parseInt($("#WarningHour").val()));
                //}
                //else
                {
                    $("#Warning").text('����ʱ��(Сʱ)');
                    $("#WarningUnit").val("Hour");
                    $("#TypeName").searchbox({ disabled: false });
                    $("#TypeID").removeAttr("disabled");
                }
            }
            $.parser.parse('#frmForm');
            CheckWarningType($("#AssignmentState").combobox('getValue'));

            $("#BtnSave").click(function () {
                if ($("#AssignmentState").combobox('getValue') == "") {
                    HDialog.Info("��ѡ��Ԥ�����");
                    return;
                }

                //if ($("#AssignmentState").combobox('getValue') == 5 && checkRate($("#WarningHour").val()))
                //{
                //    HDialog.Info("��ʱʱ�䣨���ӣ�����д����ֵ");
                //    return;
                //}
                var cmd = $("#hiOPType").val();

                $.tool.DataPostChk('frmForm', 'IncidentWarning', cmd, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            parent.layer.alert('����ɹ�');
                            HDialog.Close(1);
                        }
                    },
                    function completeCallback() {
                    },
                    function errorCallback() {

                    });
            });

            function checkRate(value) {
                var re = /^[1-9]+[0-9]*]*$/;   //�ж��ַ����Ƿ�Ϊ����     //�ж������� /^[1-9]+[0-9]*]*$/     ^[0-9]+.?[0-9]*$
                if (!re.test(value)) {
                    return true;
                }
            }
        </script>
    </form>
</body>
</html>
