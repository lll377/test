<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DictionaryBrowseFees.aspx.cs" Inherits="M_Main.SysNew.DictionaryBrowseFees" %>

<!DOCTYPE html>
<html>
<head>
    <title>字典导航</title>
    <link href="../Jscript-Ui/hplus/css/animate.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Jscript-Ui/hplus/css/style.min.css" rel="stylesheet" />
    <script src="../Jscript-Ui/hplus/js/bootstrap.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/jquery.min.js"></script>
    <script src="../Jscript-Ui/hplus/js/content.min.js"></script>
    <style type="text/css">
        .TContent {
            height: 16px;
            width: 20%;
            margin-left: 15px;
            padding-left: 15px;
            text-align: left;
            /*font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;*/
            font-size: 15px;
            color: #676a6c;
        }

            .TContent a {
                float: left;
                margin-left: 10px;
                font-size: 15px;
                font-family: 微软雅黑;
            }

        .fontSizes {
            font-family: "open sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 15px;
            color: #676a6c;
        }

        .divHe {
            height: 10px;
        }
    </style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeIn">
        <!-- 系统管理 -->
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>系统管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="DialogTable" style="width: 100%;">
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=CityCompany">所属公司</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ProjectFormat">项目业态</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ProjectSource">项目来源</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ManagementNature">管理性质</a>
                                </td>
                                <%--<td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=EmployeeStar">员工星级</a>
                                </td>--%>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=EmployeeProfession">员工工种</a>
                                </td>
                            </tr>
                            <%--<tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=EmployeeProfession">员工工种</a>
                                </td>
                            </tr>--%>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 信息管理 -->
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>信息管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="DialogTable" style="width: 100%;">
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Activities">活动类别</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Suggestions">建议类别</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ProjectType">项目类型</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ParentCompany">项目营业执照母公司全称</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=FundType">物业公司资金类型</a>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=DevelopmentSubject">项目开发主体</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=PropertyForm">物业业态</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=DevelopmentState">项目开发状态</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=TakeoverState">接管状态</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=StateProperty">收楼状态</a>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ConventionalCharges">常规物业收费模式</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ConventionalService">常规物业服务模式</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=SalesFieldCharges">销售案场收费模式</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=SalesFieldService">销售案场服务模式</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ApportionmentState">分摊状态</a>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ReasonsForNonApportionment">不可分摊原因</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=LetterType">函件类型</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=LawsuitResult">诉讼结果</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=CaseProgress">案件进度</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 资源管理 -->
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>资源管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="DialogTable" style="width: 100%;">
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=BuildType">楼宇类型</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=PropertyRights">楼宇/房屋产权性质</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=PropertyUses">使用性质</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=RoomModel">房屋户型</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=CustomerType">客户类别</a>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=PaperName">证件名称</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Nationality">国籍</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Job">职业</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Interests">兴趣爱好</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Relation">与户主关系</a>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=CardStyle">办理卡类</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=CardAuditing">办卡状态</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=SupplierType">供应商类别</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=CarParkType">车位类型</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ParkPropertyRights">车位产权性质</a>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=CarType">车辆类型</a>
                                </td>
                                  <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Parking">车位区域</a>
                                </td>
                                <td class="TContent"></td>
                                <td class="TContent"></td>
                                <td class="TContent"></td>
                                <td class="TContent"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 租赁管理 -->
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>租赁管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="DialogTable" style="width: 100%;">
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=PlanFormat">业态规划</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=PreferentialPolicy">优惠政策</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=RentalType">租售类别</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=RentPeriod">租金周期</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ContTypeCode">业务类别</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 收费管理 -->
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>收费管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="DialogTable" style="width: 100%;">
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ExtractReason">收入提取依据</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=AddedTaxRate">增值税率</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ChargeMode">收款方式</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=PaymentMethod">交款方式</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=BankName">银行名称</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 客服管理 -->
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>客服管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="DialogTable" style="width: 100%;">
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=DecoraInfoSource">装修申请信息来源</a>
                                </td>
                                <td class="TContent">
                                    <a href="../Key/Dictionary/List.aspx">钥匙字典</a>
                                </td>
                                <td class="TContent"><a href="../Visit/Dictionary/List_Single.aspx?DType=0">拜访问题类别</a></td>
                                <td class="TContent"><a href="../Visit/Dictionary/List_Single.aspx?DType=1">拜访关闭原因</a></td>
                                <td class="TContent"><a href="../Visit/ReplySituation/ReplySituation.aspx">不成功原因</a></td>

                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=StanType">收费标准类型</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 办公管理 -->
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>办公管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="DialogTable" style="width: 100%;">
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=OprLevel">管理级别</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=FileSecret">文件密级</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Nervous">缓急程度</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ContactNervous">紧急程度</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ReimbursementType">报账类别</a>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=Reward">奖励性质</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=WorkOvertime">加班性质</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=AskForLeaveNature">请假性质</a>
                                </td>
                                <td class="TContent">
                                    <a href="DictionaryBrowseList.aspx?DictionarySort=ContactImportant">重要程度</a>
                                </td>
                                <td class="TContent"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
