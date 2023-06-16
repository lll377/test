<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuildingManage.aspx.cs" Inherits="M_Main.HouseNew.BuildingManage" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
 <script type="text/javascript" src="../jscript/DateControl.js"></script>
    <script type="text/javascript" src="../jscript/JSClient.js"></script>
    <script type="text/javascript" src="../jscript/ajax.js"></script>
    <script type="text/javascript" src="../jscript/Keydown.js" event="onkeydown" for="document"></script>

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
</head>
	<body>
    <form id="frmForm" runat="server">
        <INPUT id="hiOPType" type="hidden" name="hiOPType" runat="server" size="1"/> <INPUT id="BuildID" type="hidden" name="BuildID" runat="server"  size="1"/>

			<table class="DialogTable">						
                <TR>
						<TD class="TdTitle" >
							楼宇编号</TD>
						<TD class="TdContent"><input class="easyui-validatebox" id="BuildSign" type="text" maxLength="50" name="BuildSign" 
								runat="server" >
						</TD>
						<TD class="TdTitle" >
							楼宇名称</TD>
						<TD class="TdContent"><input class="easyui-validatebox" id="BuildName" type="text"  name="BuildName" data-options="required:true" 
								runat="server" >
						</TD>
					</TR>
					<TR>
						<TD class="TdTitle" >楼宇类型</TD>
						<TD class="TdContentSearch"><SELECT id="BuildType"  class="easyui-combobox" data-options=" editable:false,panelHeight: '100px'" style="width:76%" name="BuildType" runat="server">
								<OPTION selected></OPTION>
							</SELECT></TD>
						<TD class="TdTitle" >组团区域</TD>
						<TD class="TdContentSearch">
                               <SELECT  id="RegionSNum"  class="easyui-combobox" data-options=" editable:false,panelHeight: '100px'"   name="RegionSNum" style="width:76%" runat="server">
								<OPTION selected></OPTION>
							</SELECT>
                         </TD>
					</TR>
					<TR>
						<TD class="TdTitle" >产权性质</TD>
						<TD class="TdContentSearch"><SELECT id="PropertyRights" class="easyui-combobox" data-options="editable:false,panelHeight: '100px'"  style="width:76%" name="PropertyRights" runat="server">
								<OPTION selected></OPTION>
							</SELECT></TD>
						<TD class="TdTitle" >使用性质</TD>
						<TD class="TdContentSearch"><SELECT id="PropertyUses" class="easyui-combobox" data-options=" editable:false,panelHeight: '100px'"  style="width:76%" name="PropertyUses" runat="server">
								<OPTION selected></OPTION>
							</SELECT></TD>
					</TR>
					<TR>
						<TD class="TdTitle" >楼宇高度</TD>
						<TD class="TdContent"><INPUT class="easyui-validatebox" id="BuildHeight" type="text" maxLength="50" name="BuildHeight"
									runat="server" ></TD>
						<TD class="TdTitle" >房屋编号样式</TD>
						<TD class="TdContentSearch"><SELECT id="NamingPatterns" name="NamingPatterns" data-options="  editable:false,panelHeight: '100px'" style="width:76%" class="easyui-combobox" runat="server">
								<OPTION selected></OPTION>
							</SELECT></TD>
					</TR>
					<TR>
						<TD class="TdTitle" >总层数</TD>
						<TD class="TdContent"><INPUT class="easyui-validatebox"  id="FloorsNum"
								type="text"  name="FloorsNum" runat="server" onblur="javascript:Onblur_Calc();"></TD>
						<TD class="TdTitle" >地下层数</TD>
						<TD class="TdContent"><INPUT class="easyui-validatebox"  id="UnderFloorsNum" 
								type="text"  name="UnderFloorsNum" runat="server"></TD>
					</TR>
					<TR>
						<TD class="TdTitle" >单元数</TD>
						<TD class="TdContent"><INPUT class="easyui-validatebox"  id="UnitNum" 
								type="text"  name="UnitNum" runat="server" data-options="prompt:'请输入数字',required:true,validType:'digital'" onblur="javascript:Onblur_Calc();"></TD>
						<TD class="TdTitle" >每层每单元户数</TD>
						<TD class="TdContent"><INPUT class="easyui-validatebox"  id="PerFloorNum" 
								type="text"  name="PerFloorNum" runat="server" data-options="prompt:'请输入数字',required:true,validType:'digital'"  onblur="javascript:Onblur_Calc();"></TD>
					</TR>
					<TR>
						<TD class="TdTitle" ><INPUT id="HouseholdsNum" style="WIDTH: 24px; HEIGHT: 22px" type="hidden" size="1" name="HouseholdsNum"
								runat="server">序号</TD>
						<TD class="TdContent"><INPUT class="easyui-validatebox"  id="BuildSNum" 
									type="text"  name="BuildSNum" runat="server" data-options="prompt:'请输入数字',required:true,validType:'digital'"  onblur="CheckBuildSNum();">
                            <INPUT class="easyui-validatebox"  id="V_HouseholdsNum" style="display:none"
									type="text"  name="V_HouseholdsNum" runat="server" readOnly></TD>
						<TD  class="TdTitle">开发主体</TD>
                        <TD class="TdContentSearch">
                               <SELECT  id="ConstUnitName" name="ConstUnitName" class="easyui-combobox" data-options="editable:false,panelHeight:'auto'" runat="server"  >
							</SELECT>
                         </TD>
			
					</TR>
                <tr>
              <td colspan="4" class="DialogTdSubmit" style="text-align:center">
                            <input type="button" class="button" value="保存" id="BtnSave" />
                  &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="关闭" id="BtnReturn"/>
               </td>
			</tr>
			</table>
            <script type="text/javascript">


                //检查序号
                function CheckBuildSNum() {
                    var strBuildSNum = $("#BuildSNum").val();
                    var strBuildID = $("#BuildID").val();
                 
                    $.ajax({
                        url: "../House/CheckBuildSNum.aspx?BuildSNum=" + strBuildSNum + "&BuildID=" + strBuildID,
                        type: 'Post',
                        dataType: 'text',
                        cache: false,
                        async: true,
                        success: function (_Data) {
                            var varReturn = _Data;
                            var varObjects = varReturn.split("\t");
                            if(varObjects[0]>'')
                                parent.layer.alert(varObjects[0]);
                        },
                        complete: function (XMLHttpRequest, textStatus, errorThrown) {

                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                        }
                    });

                }



                $("#BtnSave").click(function () {
                    var cmd = $("#hiOPType").val();
                    //var ConstUnitName = $("#ConstUnitName").val();
                    //var 

                    $.tool.DataPostChk('frmForm', 'Building', cmd, $('#frmForm').serialize(),
                    function Init() {
                    },
                    function callback(_Data) {
                        if (_Data == "true") {
                            parent.layer.alert('保存成功');
                            close();
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
            function close()
            {
                HDialog.Close('');
            }
            $("select").each(function () {

                var key = $(this).attr("id");
                $(this).css("width", document.body.clientWidth * 0.26 );
                });

         // function SelDealMan() {

         //     HDialog.Open('640', '480', '../DialogNew/SelectBasicInfoCom.aspx', '选择房产代付公司', false, function callback(_Data) {
         //         var arrRet = _Data.split('\t');
         //         //alert(arrRet);
         //               $("#ConstUnitName").searchbox("setValue", arrRet[1]);
         //               $("#BasID").val(arrRet[0]);
         //        });

         //}



        </script>
		</form>
	</body> 
</HTML>
