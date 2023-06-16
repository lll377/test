<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logining.aspx.cs" Inherits="M_Main.frame.logining" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录检查</title>
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet">
    <link href="../Jscript-Ui/hplus/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

    <link href="ResetPWDDialog/css/style.css" rel="stylesheet" />
    <script src="ResetPWDDialog/js/jquery-1.11.0.min.js"></script>
    <script>
        $(document).ready(
            function ()
            {
               
                var message = $(".font-bold").text();
                if (message == "该用户为第一次登录，请修改密码") {
                    $("#reset").show();
                    $("#num").hide();
                    $("#returnLogin").hide();
                } else {
                    $("#reset").hide();
                    $("#num").show();
                    $("#returnLogin").show();
                }

            }
        )
        function SurePwd() {
            console.log($("#OldPWD").val());
            console.log( $("#NewPWD").val());
            if ($("#OldPWD").val() == $("#NewPWD").val()) {
                alert("新密码不能跟旧密码一致");
                return;
            }

            var NewPWD = $("#NewPWD").val();
             // var reg = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/]).{6,}$/;
            var reg = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/])[\da-zA-Z~!@#$%^&*()_+`\-={}:";'<>?,.\/]{8,}$/;
            if (NewPWD.length > 7) {
                if (!reg.test(NewPWD)) {
                    alert('密码必须包含数字、字母、特殊符号。');
                    return;
                }
            } else {
                alert('密码长度不得少于8位。');
                return;
            }

            if ($("#NewPWD").val() != $("#SureNewPWD").val()) {
                alert("两次输入的密码不一致");
                return;
            }

            $.tool.DataPostNoLoading('User', 'FirstLoginChangePassword', $('#frmForm').serialize(),
                function Init() {

                },
                function callback(_Data) {
                    if (_Data.substring(0, 5) == "false") {
                        alert(_Data.substring(6));
                    }
                    else {
                        alert("密码修改成功!请重新登录");
                        $("#OldPWD").val("");
                        $("#NewPWD").val("");
                        $("#SureNewPWD").val("");
                        $("#gray").hide();
                        $("#popup").hide();
                        window.location.href = $("#returnUrl").val();
                    }
                },
                function completeCallback() {

                },
                function errorCallback() {
                });

        }
    </script>
</head>
<body class="gray-bg">
    <form id="frmForm">
    <div class="middle-box text-center animated fadeInDown">
        <input type="hidden" value="login.aspx?CorpID=<%=CorpID%>" id="returnUrl"/>
        <h1 id="num">500</h1>
        <h3 class="font-bold"><%=ErrorMsg.ToString()%></h3>
        <div class="error-desc">
            <br/><a target="_parent" id="returnLogin" href="<%=LoginUrl %>?CorpID=<%=CorpID%>" class="btn btn-primary m-t">重新登录</a>
            <a id="reset" style="display:none" href="#"  onclick="ShowRest(); return false" class="btn btn-primary m-t">修改密码</a>
        </div>
    </div>

     <div id="gray"></div>
<div class="popup" id="popup">
	<div class="top_nav" id='top_nav'>
		<div align="center">
			<span>修改密码</span>
			<a class="guanbi"></a>
		</div>
	</div>
	<div class="min">
		<div class="tc_login">
			<div class="left">
				
			</div>  
			<div class="right">
				
					<div align="center">
					
						<i class="icon-mobile-phone"></i>						
						<input type="password" name="OldPWD" id="OldPWD" required="required" placeholder="请输入系统原有密码"  class="input_mm">
					    <input type="password" name="NewPWD" id="NewPWD" required="required" placeholder="请输入新密码"  class="input_mm">
                        <input type="password" name="SureNewPWD" id="SureNewPWD" required="required" placeholder="二次输入的密码需一致"  class="input_mm">
                    </div>
					
					<div align="center">
						<input id="Sure" class="button" title="Sign In" value="确认修改" onclick="SurePwd()">
					</div>
				
				
			</div>		
		</div>
	</div>
</div>

 </form>
        <script src="../Jscript-Ui/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="../Jscript-Ui/hplus/js/content.min.js?v=1.0.0"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/iCheck/icheck.min.js"></script>
    <script src="../jscript/jquery.tool.new.js" type="text/javascript"></script>
    <script src="../jscript/Dialog.js" type="text/javascript"></script>
    <script src="../Jscript-Ui/hplus/js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript">
        //窗口效果
        //点击登录class为tc 显示

        function ShowRest() {
            $("#gray").show();
            $("#popup").show();//查找ID为popup的DIV show()显示#gray
            tc_center();
            $("#LoginF").removeAttr("action")

        }
       
        //点击关闭按钮
        $("a.guanbi").click(function () {
            $("#gray").hide();
            $("#popup").hide();//查找ID为popup的DIV hide()隐藏
        })

        //窗口水平居中
        $(window).resize(function () {
            tc_center();
        });

        function tc_center() {
            var _top = ($(window).height() - $(".popup").height()) / 2;
            var _left = ($(window).width() - $(".popup").width()) / 2;

            $(".popup").css({ top: _top, left: _left });
        }

       
	</script>

	<script type="text/javascript">
        $(document).ready(function () {




            $(".top_nav").mousedown(function (e) {
                $(this).css("cursor", "move");//改变鼠标指针的形状 
                var offset = $(this).offset();//DIV在页面的位置 
                var x = e.pageX - offset.left;//获得鼠标指针离DIV元素左边界的距离 
                var y = e.pageY - offset.top;//获得鼠标指针离DIV元素上边界的距离 
                $(document).bind("mousemove", function (ev) { //绑定鼠标的移动事件，因为光标在DIV元素外面也要有效果，所以要用doucment的事件，而不用DIV元素的事件 

                    $(".popup").stop();//加上这个之后 

                    var _x = ev.pageX - x;//获得X轴方向移动的值 
                    var _y = ev.pageY - y;//获得Y轴方向移动的值 

                    $(".popup").animate({ left: _x + "px", top: _y + "px" }, 10);
                });

            });




            $(document).mouseup(function () {
                $(".popup").css("cursor", "default");
                $(this).unbind("mousemove");
            });
        }) 
</script>
</body>
</html>
