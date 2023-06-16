<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CorpMagazineTypeManage.aspx.cs" Inherits="M_Main.CorpNew.CorpMagazineTypeManage" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
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
</head>
<body>
    <form id="frmForm" runat="server">
        <input id="TypeCode" type="hidden" name="TypeCode" runat="server" />
        <input id="hiOPType" type="hidden" name="hiOPType" runat="server" />
        <table class="DialogTable" border="0" >         
            
            <tr>
                <td class="DialogTdTitle">信息名称</td>
                <td class="DialogTdContent_2Col"  colspan="3" >
                    <input id="TypeName" class="easyui-validatebox" maxlength="50" name="TypeName" runat="server" data-options="required:true">
                </td>
            </tr>
            
       
             <tr>
                <td class="DialogTdTitle">文件列表
                    <input id="FileURL" name='FileURL' type="hidden" runat="server" style="width:50%"/>
                    <input id="openfile" type="file" runat="server" name="openfile" style="width: 1px;visibility: hidden" /> 
                </td>
                <td colspan="3" class="DialogTdContent_2Col">
                    <div style="width:94.2%;">
                        <span id="List" name='List' runat="server"/>
                        <input id="BtnEdit1" name="BtnEdit1" class="button" type="button" onclick=" openfile.click(); return false;" style="width: 72px; height: 32px; float:right" value="选择上传 " />
                    </div>
                    
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:center;padding-top:15px;">
                    <input type="button" class="button" value="保存" id="BtnSave" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="button" value="关闭" id="BtnReturn" />

                </td>
            </tr>
            
        </table>
        <input type="hidden" id="xxgg" name="xxgg" />

        <script type="text/javascript">
            $("#BtnSave").click(function () {
                var cmd = $("#hiOPType").val();
               
                $.tool.DataPostChk('frmForm', 'CorpMagazineTypeBrowse', cmd, $('#frmForm').serialize(),
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
                var vFileURL = "{'FilPath':'" + addr + "','AdjunctName':'" + Name + "'}";

                $("#FileURL").val($("#FileURL").val() + "," + vFileURL);
                var v = "<a target=\"_blank\" id=\"" + Id + "\" href=\"" + addr + "\" class=\"HrefStyle\" url=\"" + addr + "\">" + Name + "</a><span  style='cursor:hand' onclick=\"Delete(this,'" + Id1 + "','" + addr + "','" + Name + "');\">&nbsp;<img src='../Images/cancel.png' style='width:12px;height:12px;cursor:pointer'  title='删除'/>&nbsp;</span><input id=\"" + Id1 + "\" Type='hidden' value='" + addr + "'>"
                $("#List").append(v);
                GetAttach();
            }

            function Delete(obj, hid, addr, Name) {

                var vFileURL = "," + "{'FilPath':'" + addr + "','AdjunctName':'" + Name + "'}";
                var vFileURLStr = $("#FileURL").val().replace(vFileURL, "");
                $("#FileURL").val(vFileURLStr);

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
                var fileupload = document.getElementById("openfile");
                var maxsize = 10 * 1024 * 1024;
                var size = fileupload.files[0].size;
                if (size > parseInt(maxsize)) {
                    HDialog.Info("不能上传超过10M的附件！");
                    return false;
                }
                $.tool.pageLoadInfo("上传中，请等待");
         

                var fd = new FormData();
                fd.append("UpFile", $("#openfile").get(0).files[0]);
                fd.append("IsCompleteAddr", "true"); 
                $.ajax({
                    url: "../AjaxUpload.aspx",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    data: fd,
                    success: function (addr) {
                        if (addr != "")
                        {
                            var FileName = getFileName(addr);
                            UploadCallBack(addr, FileName);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        HDialog.Info("上传模板失败");
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                        $.tool.pageUnLoading();
                    }
                });
                return false; //.NET按钮控件取消提交
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
                        HDialog.Info("上传失败:" + e.toString());
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
        </script>

    </form>
</body>
</html>
