<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileSharingManage.aspx.cs" Inherits="M_Main.CommonNew.FileSharingManage" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
     <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script src="../jscript/JSClient.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <link href="../css/framedialog_Fourcol.css" type="text/css" rel="stylesheet" />
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Jscript-Ui/jquery-easyui-1.4.4/themes/icon.css" />
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../jscript/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../Jscript-Ui/JQForm/JQForm.js"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
     <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../Jscript-Ui/UEditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        body
        {
            overflow-y:auto;6

        }
    </style>
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="IID" type="hidden" name="IID" runat="server" />
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <table class="DialogTable" border="0" >
            <tr>
                <td  class="DialogTdTitle">类别名称</td>
                <td  class="DialogTdContent">     
                    <select id="TypeCode" name="TypeCode"  class="easyui-validatebox"  data-options="required:true" runat="server">
                    </select>
                </td>  
                <td  class="DialogTdTitle">发布日期</td>
                <td  class="DialogTdDateContent">
                    <input type="text" class="easyui-datetimebox" id="IssueDate"  data-options="required:true"  name="IssueDate" runat="server">
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">部门名称</td>
                <td class="DialogTdSearchContent"  colspan="3" >
                    <input id="DepName"  name="DepName" runat="server" class="easyui-searchbox " searcher="SelDep" data-options="required:true,editable:false" />
                    <input id="DepCode"  type="hidden" name="DepCode" 	runat="server">                  
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">信息名称</td>
                <td class="DialogTdContent_2Col"  colspan="3" >
                    <input id="Title" class="easyui-validatebox" maxlength="50" name="Title" runat="server" data-options="required:true">
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">查阅部门</td>
                <td class="DialogTdContent_2Col" colspan="3" >
                     <input  runat="server" class="easyui-validatebox" id="TxtReadDepart"  type="text"   name="TxtReadDepart" ondblclick ="SelDep1()" readonly="readonly"/>
                     <input style="Z-INDEX: 0; WIDTH: 64px; HEIGHT: 17px" id="HdReadDepart" size="5" type="hidden" name="HdReadDepart" runat="server">
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">查阅人员</td>
                <td class="DialogTdContent_2Col" colspan="3" id="Ult">
                    <input id="TxtNoticeUserList" runat="server"  name="TxtNoticeUserList"  type="text" class="easyui-validatebox" ondblclick ="SelUser()" readonly="readonly"/>
                    <input style="Z-INDEX: 0; WIDTH: 64px; HEIGHT: 17px" id="OperatorTxt" size="5" type="hidden" name="InfoId" runat="server">
                </td>
            </tr>
            <tr>
                <td class="DialogTdTitle">系统公告</td>
                <td class="DialogTdContent_2Col" colspan="3">
                    <script id="editor" type="text/plain" style="width:97%;height:250px;"></script>
                    <input id="editorValue" type="hidden" name="editorValue" runat="server">
                </td>
            </tr>
       
             <tr>
                <td class="DialogTdTitle">文件列表
                    <input id="AdjunctFile" name='AdjunctFile' type="hidden" runat="server" style="width:50%"/>
                    <input id="openfile" type="file" runat="server" name="openfile" style="width: 1px;visibility: hidden" /> 
                </td>
                <td colspan="3" class="DialogTdContent_2Col">
                    <div style="width:94.2%;">
                        <span id="List" name='List' runat="server"/>
                        <input id="BtnEdit1" name="BtnEdit1" class="button" type="button" onclick="openfile.click();" style="width: 72px; height: 32px; float:right" value="选择上传 " />
                    </div>
                    
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:3px;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关闭" id="BtnReturn" />
                </td>
            </tr>
            
        </table>
        <input type="hidden" id="xxgg" name="xxgg" />
        <script type="text/javascript">
           
            function SelDep() {
                HDialog.Open('500', '500', '../DialogNew/SelDepartSingle.aspx', '选择部门', true, function callback(_Data) {
                    var arrRet = _Data.split(',');
                    //$("#DepCode").val(arrRet[0]);

                    $("#DepName").searchbox('setValue', arrRet[1]);
                    $("#DepCode").val(arrRet[0]);
                });
            }
            function SelDep1() {
                HDialog.Open('500', '500', '../DialogNew/SelDepart.aspx', '选择部门', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(';');
                        $("#HdReadDepart").val(varObjects[0]);
                        $("#TxtReadDepart").val(varObjects[1]);
                    }
                });
            }
         
            $("#BtnSave").click(function () {
                var cmd = $("#hiOPType").val();
                var xxggTxt = UE.getEditor('editor').getContent();
                const searchRegExp = /'/g
                var jsonstr = $("#AdjunctFile").val().substr(1)
                var jsond = jsonstr.replace(searchRegExp, "\"");
               
                $("#AdjunctFile").val(jsond);
                $("#xxgg").val(xxggTxt);
                $.tool.DataPostChk('frmForm', 'FileSharingBrowse', cmd, $('#frmForm').serialize(),
                function Init() {
                },
                function callback(_Data) {
                    if (_Data == "true") {
                        parent.layer.alert('保存成功');
                        close('true');
                    }
                },
                function completeCallback() {
                },
                function errorCallback() {

                });
            });
            $("#BtnReturn").click(function () {
                close();
            });

            function close(result) {
                HDialog.Close(result);
            }
          
            function SelUser() {
                var N = $("#TxtNoticeUserList").val();
                var C = $("#OperatorTxt").val();
                HDialog.Open('800', '600', '../DialogNew/SelUserDx.aspx?SelUserName' + N + '&SelUserCode=' + C, '选择人员', true, function callback(_Data) {
                    if (_Data != "") {//**获得返回的参数信息
                        var varObjects = _Data.split(';');
                        $("#TxtNoticeUserList").val(varObjects[0]);
                        $("#OperatorTxt").val(varObjects[1]);
                    }
                });
            }
            function Getid() {
                d = new Date();
                var s = "";
                s += d.getYear();
                s += (d.getMonth() + 1);
                s += d.getDate();
                s += d.getHours();
                s += d.getMinutes();
                s += (d.getSeconds());
                return s;
            }

            //上传文件相关js
            function UploadCallBack(addr, Name) {
                var Id = Getid();
                var Id1 = Id + "h";
                var vFileURL = "{\"FilPath\":\"" + addr + "\",\"AdjunctName\":\"" + Name + "\"}";
                
                $("#AdjunctFile").val($("#AdjunctFile").val() + "," + vFileURL);

                var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class=\"HrefStyle\" url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"Delete(this,'" + Id1 + "','" + addr + "','" + Name + "');\">&nbsp;<img src='../Images/cancel.png' style='width:12px;height:12px;cursor:pointer'  title='删除'/>&nbsp;</span><input id=\"" + Id1 + "\" Type='hidden' value='" + addr + "'>"
                $("#List").append(v);
                GetAttach();
            }

            function Delete(obj, hid, addr, Name) {

                var vFileURL = "," + "{'FilPath':'" + addr + "','AdjunctName':'" + Name + "'}";
                var vFileURLStr = $("#AdjunctFile").val().replace(vFileURL, "");
                $("#AdjunctFile").val(vFileURLStr);

                var FileName = document.getElementById(hid).value;
                upLoadFileDelete(obj, FileName);

            }
            function GetAttach() {
                var v = $("#List").html();
                re = /\"/g;
                var mi = v.replace(re, "'");
                $("#FileList1").val(mi);
            }

            function SpecialView() {
                var v = $("#FileList1").val();
                $("#List").html(v)
            }
            //文件上传
            $("#openfile").change(function (e) {
                upLoadFile();
            });
            function getFileName(o) {
                var pos = o.lastIndexOf("\\");
                return o.substring(pos + 1);
            }
            function upLoadFile() {
                if ($('#openfile').val() == "") {
                    HDialog.Info("请选择要上传的本地文件!");
                    return false;
                }
                var file = $("#openfile").val();
                var fileName = getFileName(file);

                var fd = new FormData();
                fd.append("UpFileData", $("#openfile")[0].files[0]);

                $.tool.pageLoadInfo("上传中，请等待");
                $.ajax({
                    url: "../UpLoad/UpFile.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        $.tool.pageUnLoading();

                        if (addr.length > 200) {
                            HDialog.Info('上传失败啦,重新试试吧');
                            return;
                        }
                        else {
                            var filePath = addr.substring(0, addr.lastIndexOf('/'));
                            UploadCallBack(addr, fileName);
                            HDialog.Info('上传成功');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                        HDialog.Info('上传失败啦,重新试试吧');
                    }
                });
            }
            function upLoadFileDelete(obj, filename) {
                var postFileName = encodeURI(filename);
                $.ajax
                ({
                    type: "POST",
                    url: "../AjaxUploadFile.aspx?Cmd=del&FileType=room&FileURL=" + postFileName,
                    data: "",
                    success: function (data, status) {
                        //alert(data);
                        var stringArray = data.split("|");
                        var FileName = stringArray[1];
                        var FileError = stringArray[2];
                        if (stringArray[0] == "1") {
                            //stringArray[0]    成功状态(1为成功，0为失败)
                            //stringArray[1]    文件名
                            //stringArray[2]    消息提示
                            //stringArray[3]    文件路径
                            HDialog.Info('删除成功');
                            $('#openfile').val('');

                            $(obj).prev().remove();
                            $(obj).remove();
                            GetAttach();

                        }
                        else {
                            HDialog.Info(FileError);
                        }

                    },
                    error: function (data, status, e) {
                        alert("上传失败:" + e.toString());
                    }
                });
                return false; //.NET按钮控件取消提交
            }


            //$('#TxtReadDepart').css("width", $(window).width() * 0.85);



            var ue = UE.getEditor('editor');


            $(document).ready(function () {
                var value = $('#editorValue').val();
                value = document.getElementById('editorValue').value;

                ue.ready(function () {
                    //设置编辑器的内容
                    ue.setHeight(200);
                    //ue.execCommand('insertHtml', value);
                    ue.setContent(value);
                });
                //UE.getEditor('editor').execCommand('insertHtml', value);
            }
            );
           
            //);
        </script>

    </form>
</body>
</html>
