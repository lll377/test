<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="findPassword.aspx.cs" Inherits="M_Main.frame.findPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <script src="../jscript/jquery-1.11.3.min.js"></script>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="../Jscript-Ui/hplus/js/contabs.min.js"></script>    
    <script src="../Jscript-Ui/hplus/js/plugins/pace/pace.min.js"></script>
    <link href="../css/button.css" type="text/css" rel="stylesheet" />
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
</head>
    <style type="text/css">
         body { 
             margin:0px; padding:0px;
            background-color:#ffffff;
        }
        .Container {
            width:400px; text-align:center; height:auto;margin-top:5px;font-size:12px;font-family:微软雅黑;
            margin-left:100px;
        }
        .Container ul {
            margin:0px auto;clear:both;list-style-type:none;
        }

        .Container ul .InputTitle {
            list-style-type:none;
            float:left;
            text-align:center;
            margin-bottom:10px;
            min-height:22px;
            line-height:22px;
            width: 20%;
            text-align:right;
        }
        .Container ul .Content {
            list-style-type:none;float:left;text-align:left;margin-bottom:10px;width:80%;
        }
         .Container ul .Title {
            list-style-type:none;float:left;text-align:left;margin-bottom:10px;width:100%;
        }
        .Container ul .ContentBlank {
            list-style-type:none;float:left;width:80%;text-align:left;margin-bottom:10px;
        }
        .Container ul .Submit {
            list-style-type:none;
            text-align:center;
            padding-top:4px;
            width:80%;
            height:40px;
        }

        .Container .Content input {
            width:99%;
            border:1px solid #cccccc;
            height:22px;
            padding-left:2px;
        }
        .Container .Content select {
            height:22px;
        }
        .divWidth {
         width:600px;
        }
    </style>

<body>
    <form id="frmFrom">
          <div style="height:100px;"></div>
       
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                   
                    <div class="ibox-content" style="text-align:center;">
                        <div id="row1" class="row">
                             <div class="col-sm-4" style="left:25%; width:700px;">
                               <div class="panel panel-success">
                                   <div class="panel-body">

                         <div style="height:30px;"></div>
                                        <div class="divWidth">
                            <div class="Container">
                            <div style="height:5px;"></div>
                            <ul>
                             <li class="InputTitle">登录账号：</li>
                             <li class="Content">
                                <input id="LoginCode" name="LoginCode"class="easyui-validatebox"  style="width:220px;"/>
                             </li>
                             <li class="InputTitle">验证码：</li>
                             <li class="Content">
                          <div style="float:left; width:301px; ">  
                              <div style="float:left; width:221px; ">  <input id="txtVerification" name="txtVerification" title="" style="width:220px; float:left;" type="text" /></div>
                              <div style="float:left;  width:80px;"><input type="button" id="btn" value="获取验证码" onclick="getcodes(this)" style="width:80px;float:left;"  /> 
                                  </div>
                          </div>     </li>
                              <li class="Title">
                                <table style="margin:auto;">
                                    <tr>
                                        <td>
                                            <input type="button" class="button" value="确定" id="getCode"  />
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            </ul>
                       </div>
                                             </div>
                         </div>
                                  
                </div>
            </div> </div>
                         <%--------%>
                          <div id="row2" class="row">
                             <div class="col-sm-4" style="left:25%; width:700px;">
                               <div class="panel panel-success">
                                   <div class="panel-body">
                         <div style="height:30px;"></div>
                                       <div class="divWidth">
                            <div class="Container">
                            <div style="height:5px;"></div>
                            <ul>
                             <li class="InputTitle">新密码：</li>
                             <li class="Content">
                                <input id="PassWord" name="PassWord"class="easyui-validatebox" type="password"  style="width:220px;" />
                                 <br />
                                  <span  id="span1" style="color:red;">请输入新密码</span>
                             </li>
                             <li class="InputTitle">确认新密码：</li>
                             <li class="Content">
                                <input id="CheckPassWord" name="CheckPassWord" type="password"   style="width:220px;"  />
                                 <br />
                                 <span id="span2" style="color:red;">两次密码输入不一致</span>
                             </li>
                              <li class="Title">
                                <table style="margin:auto;">
                                    <tr>
                                        <td>
                                            <input type="button" class="button" value="确认修改" id="BtnSave" />
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            </ul>
                       </div>
                        </div>
                         </div>
                </div>
            </div></div>
                                   <%------%>
                    </div>
                </div>
            </div>
        </div>
       <input type="hidden" id="hidCode" name="hidCode" />
         <input type="hidden" id="CorpId" name="CorpId" value="6008" runat="server" />
        <script type="text/javascript">
            $("#row2").hide();
            var countdown = 120;
            //settime(this)
            function getcodes(val)
            {
                if ($("#LoginCode").val().trim() != "") {
                    $.ajax({
                        url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AppPushMsg&Command=SendBGYSMS&LoginCode=' + $('#LoginCode').val() + "&CorpId=" + $("#CorpId").val(),
                        type: 'GET',
                        dataType: 'json',
                        cache: false,
                        success: function (_Data) {
                            $("#hidCode").val(_Data);
                            settime(val, true);

                        },
                        complete: function (XMLHttpRequest, textStatus, errorThrown) {
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            HDialog.Info('执行时出现错误!');
                        }
                    });
                    ////////////////////
               
                }
                else {
                    HDialog.Info('请输出登录账号!');
                }
            }
            function settime(val,bool) {
                var timeout;
                if (bool)
                {
                   if (countdown == 0) {
                    val.removeAttribute("disabled");
                    val.value = "获取验证码";
                    countdown = 120;
                    bool = false;
                    $("#hidCode").val("");
                    clearInterval(timeout)
                    } else {
                    val.setAttribute("disabled", true);
                    val.value = "重新发送(" + countdown + ")";
                    countdown--;
                   }
                    timeout = setTimeout(function () {
                        settime(val, bool);
                   }, 1000);
                }
            }
            $("#getCode").click(function () {
                if ($("#txtVerification").val().trim() != "" && $("#txtVerification").val().trim() == $("#hidCode").val().trim() && countdown!=120) {
                    $("#row2").show();
                    $("#row1").hide();
                }
                else {
                    if (countdown!=120)
                        HDialog.Info("验证码错误请重新输入！");
                    else
                        HDialog.Info("提示：验证码已过期，请重新获取！");
                }
            });
            function btnClear()
            {
                $("#row2").hide();
                $("#row1").show();
                $("#LoginCode").val("");
                $("#txtVerification").val("");
                $("#hidCode").val("");
                $("#btn").removeAttribute("disabled");
                $("#btn").value = "获取验证码";
                countdown = 120;
            }
            $("#BtnSave").click(function () {
                if ($("#PassWord").val().trim() == "") {
                    $("#span1").show();
                    return;
                }
                else {
                    $("#span1").hide();
                }
                if ($("#CheckPassWord").val().trim() != $("#PassWord").val().trim()) {
                    $("#span2").show();
                    return;
                }
                if ($("#PassWord").val().trim() != "" && $("#CheckPassWord").val().trim() == $("#PassWord").val().trim())
                {
                    $("#span1").hide();
                    $("#span2").hide();
                }
                ////
                var NewPWD = $("#CheckPassWord").val();
                var reg = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/]).{6,}$/;
                if (NewPWD.length > 5) {
                    if (!reg.test(NewPWD)) {
                        HDialog.Info('密码必须包含字母、特殊符号。');
                        return;
                    }
                } else {
                    HDialog.Info('密码长度不得少于6位。');
                    return;
                }
                ////
                $.ajax({
                    url: '/HM/M_Main/HC/DataGetControl.aspx?Method=DataGet&Class=AppPushMsg&Command=ChangePassword&' + $('#frmFrom').serialize(),
                    type: 'GET',
                    dataType: 'json',
                    cache: false,
                    success: function (_Data) {
                        if (_Data == "1") {
                            HDialog.Info("修改成功！");
                            setTimeout(function () { top.location.href = "../frame/login.aspx"; }, 1000);
                        }
                    },
                    complete: function (XMLHttpRequest, textStatus, errorThrown) {
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        HDialog.Info('执行时出现错误');
                    }
                });
            });
            $(function () {
                $("#span1").hide();
                $("#span2").hide();
               
            });
          
          
        </script>
    </form>
</body>
</html>
